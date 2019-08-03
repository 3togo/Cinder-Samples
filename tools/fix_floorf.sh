grep -rl 'std::floorf'| xargs sed -i 's/std::floorf/::floorf/g'

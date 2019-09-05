Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C1722A9D6D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 10:46:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PDmy3dy5zDr22
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 18:46:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=rasmusvillemoes.dk
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=linux@rasmusvillemoes.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="N6IVzoEo"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PDkX1L1dzDqyP
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 18:44:00 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id a22so1575087ljd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2019 01:44:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NBuoXU/CsvpEfHDk6v7qAee7rwiMK16vCU2UCK4nqCQ=;
 b=N6IVzoEohl3Ii8OgzeM6vAo9dY5+J6qYVU5h5ZRS7mowRtkkYIOgOVnCpVVmpMuP4M
 JnwE+sy/QoDSWwTWRo6bHTZUWVmRUdVAAthZM02dIMNYyiwdhWwEDXgYyipiWXEyubVf
 ef+6I5cJONBZQkYxa9wFQDCcEfEWCsqK9Ws1g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NBuoXU/CsvpEfHDk6v7qAee7rwiMK16vCU2UCK4nqCQ=;
 b=PKSlEddJ9/WkwAo4TBjHT/3AraRxAEVPNL8WEy24Ifrj9y76NJg86xA7yjKc8LveXG
 4p7DHKRKoROi9nOFDibsyjPYLGOsd4PdoZq9WSooohcfeLSQtEE1BKmuZceS64q90IJ5
 sjXxmJpWCWPxIF6U588QB1VFMnN0WFyY+1TNzY6uRHqQHblBoUyn/7z57zQ4aaMKF3LM
 rDaRmKJ6+9G6ommZxdecTlLdn6mC057a+AiYW6H/rtuMjuaWUISarZaCSKjrDboS2weI
 AHEc3Eqgirb+QraPu/8qfcLta0KFtAmCM50KYs60tRb24mgme88If3uZTwAa81+Pa6UU
 fwow==
X-Gm-Message-State: APjAAAU9Snc+JKHZXIdkck4RUPnIoV37D78Wyg0fbubcghy38X2MVAbK
 q5yk+gFlZmyeSJHsSyEKhKeGEQ==
X-Google-Smtp-Source: APXvYqytSckEtF1ynO/D0dH8NXuZW7wdO2pDnnfImuEUflVZ+2h5sNxfU5qE5h9/+CC+5M7TGsxbSA==
X-Received: by 2002:a05:651c:1023:: with SMTP id
 w3mr1206160ljm.94.1567673035658; 
 Thu, 05 Sep 2019 01:43:55 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id k7sm249936lji.68.2019.09.05.01.43.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 01:43:54 -0700 (PDT)
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
To: Aleksa Sarai <cyphar@cyphar.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>,
 Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Christian Brauner <christian@brauner.io>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <57ba3752-c4a6-d2a4-1a4d-a0e13bccd473@rasmusvillemoes.dk>
Date: Thu, 5 Sep 2019 10:43:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190904201933.10736-2-cyphar@cyphar.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>,
 linux-alpha@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/09/2019 22.19, Aleksa Sarai wrote:
> A common pattern for syscall extensions is increasing the size of a
> struct passed from userspace, such that the zero-value of the new fields
> result in the old kernel behaviour (allowing for a mix of userspace and
> kernel vintages to operate on one another in most cases). This is done
> in both directions -- hence two helpers -- though it's more common to
> have to copy user space structs into kernel space.
> 
> Previously there was no common lib/ function that implemented
> the necessary extension-checking semantics (and different syscalls
> implemented them slightly differently or incompletely[1]). A future
> patch replaces all of the common uses of this pattern to use the new
> copy_struct_{to,from}_user() helpers.
> 
> [1]: For instance {sched_setattr,perf_event_open,clone3}(2) all do do
>      similar checks to copy_struct_from_user() while rt_sigprocmask(2)
>      always rejects differently-sized struct arguments.
> 
> Suggested-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
> Signed-off-by: Aleksa Sarai <cyphar@cyphar.com>
> ---
> diff --git a/lib/struct_user.c b/lib/struct_user.c
> new file mode 100644
> index 000000000000..7301ab1bbe98
> --- /dev/null
> +++ b/lib/struct_user.c
> @@ -0,0 +1,182 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Copyright (C) 2019 SUSE LLC
> + * Copyright (C) 2019 Aleksa Sarai <cyphar@cyphar.com>
> + */
> +
> +#include <linux/types.h>
> +#include <linux/export.h>
> +#include <linux/uaccess.h>
> +#include <linux/kernel.h>
> +#include <linux/string.h>
> +
> +#define BUFFER_SIZE 64
> +
> +/*
> + * "memset(p, 0, size)" but for user space buffers. Caller must have already
> + * checked access_ok(p, size).
> + */

Isn't this __clear_user() exactly (perhaps except for the return value)?
Perhaps not every arch has that?

> +static int __memzero_user(void __user *p, size_t s)
> +{
> +	const char zeros[BUFFER_SIZE] = {};
> +	while (s > 0) {
> +		size_t n = min(s, sizeof(zeros));
> +
> +		if (__copy_to_user(p, zeros, n))
> +			return -EFAULT;
> +
> +		p += n;
> +		s -= n;
> +	}
> +	return 0;
> +}
> +
> +/**
> + * copy_struct_to_user: copy a struct to user space
> + * @dst:   Destination address, in user space.
> + * @usize: Size of @dst struct.
> + * @src:   Source address, in kernel space.
> + * @ksize: Size of @src struct.
> + *
> + * Returns (in all cases, some data may have been copied):
> + *  * -EFBIG:  (@usize < @ksize) and there are non-zero trailing bytes in @src.
> + *  * -EFAULT: access to user space failed.
> + */
> +int copy_struct_to_user(void __user *dst, size_t usize,
> +			const void *src, size_t ksize)
> +{
> +	size_t size = min(ksize, usize);
> +	size_t rest = abs(ksize - usize);

Eh, I'd avoid abs() here due to the funkiness of the implicit type
conversions - ksize-usize has type size_t, then that's coerced to an int
(or a long maybe?), the abs is applied which return an int/long (or
unsigned versions?). Something like "rest = max(ksize, usize) - size;"
is more obviously correct and doesn't fall into any
narrowing/widening/sign extending traps.

> +	if (unlikely(usize > PAGE_SIZE))
> +		return -EFAULT;

Please don't. That is a restriction on all future extensions - once a
kernel is shipped with a syscall using this helper with that arbitrary
restriction in place, that syscall is forever prevented from extending
its arg struct beyond PAGE_SIZE (which is arch-dependent anyway). Sure,
it's hard to imagine, but who'd have thought 32 O_* or CLONE_* bits
weren't enough for everybody?

This is only for future compatibility, and if someone runs an app
compiled against 7.3 headers on a 5.4 kernel, they probably don't care
about performance, but they would like their app to run.

[If we ever create such a large ABI struct that doesn't fit on stack,
we'd have to extend our API a little to create a dup_struct_from_user()
that does the kmalloc() for us and then calls copy_struct_from_user() -
but we might want that long before we hit PAGE_SIZE structs].

> +	if (unlikely(!access_ok(dst, usize)))
> +		return -EFAULT;
> +
> +	/* Deal with trailing bytes. */
> +	if (usize < ksize) {
> +		if (memchr_inv(src + size, 0, rest))
> +			return -EFBIG;
> +	} else if (usize > ksize) {
> +		if (__memzero_user(dst + size, rest))
> +			return -EFAULT;

I think that could simply be __clear_user().

> +	}
> +	/* Copy the interoperable parts of the struct. */
> +	if (__copy_to_user(dst, src, size))
> +		return -EFAULT;

I think I understand why you put this last instead of handling the
buffer in the "natural" order. However,
I'm wondering whether we should actually do this copy before checking
that the extra kernel bytes are 0 - the user will still be told that
there was some extra information via the -EFBIG/-E2BIG return, but maybe
in some cases the part he understands is good enough. But I also guess
we have to look to existing users to see whether that would prevent them
from being converted to using this helper.

linux-api folks, WDYT?

> +	return 0;

Maybe more useful to "return size;", some users might want to know/pass
on how much was actually copied.

> +}
> +EXPORT_SYMBOL(copy_struct_to_user);

Can't we wait with this until a modular user shows up? The primary users
are syscalls, which can't be modular AFAIK.

> +/**
> + * copy_struct_from_user: copy a struct from user space
> + * @dst:   Destination address, in kernel space. This buffer must be @ksize
> + *         bytes long.
> + * @ksize: Size of @dst struct.
> + * @src:   Source address, in user space.
> + * @usize: (Alleged) size of @src struct.
> + *
> + * Copies a struct from user space to kernel space, in a way that guarantees
> + * backwards-compatibility for struct syscall arguments (as long as future
> + * struct extensions are made such that all new fields are *appended* to the
> + * old struct, and zeroed-out new fields have the same meaning as the old
> + * struct).
> + *
> + * @ksize is just sizeof(*dst), and @usize should've been passed by user space.
> + * The recommended usage is something like the following:
> + *
> + *   SYSCALL_DEFINE2(foobar, const struct foo __user *, uarg, size_t, usize)
> + *   {
> + *      int err;
> + *      struct foo karg = {};
> + *
> + *      err = copy_struct_from_user(&karg, sizeof(karg), uarg, size);
> + *      if (err)
> + *        return err;
> + *
> + *      // ...
> + *   }
> + *
> + * There are three cases to consider:
> + *  * If @usize == @ksize, then it's copied verbatim.
> + *  * If @usize < @ksize, then the user space has passed an old struct to a
> + *    newer kernel. The rest of the trailing bytes in @dst (@ksize - @usize)
> + *    are to be zero-filled.
> + *  * If @usize > @ksize, then the user space has passed a new struct to an
> + *    older kernel. The trailing bytes unknown to the kernel (@usize - @ksize)
> + *    are checked to ensure they are zeroed, otherwise -E2BIG is returned.
> + *
> + * Returns (in all cases, some data may have been copied):
> + *  * -E2BIG:  (@usize > @ksize) and there are non-zero trailing bytes in @src.
> + *  * -E2BIG:  @usize is "too big" (at time of writing, >PAGE_SIZE).
> + *  * -EFAULT: access to user space failed.
> + */
> +int copy_struct_from_user(void *dst, size_t ksize,
> +			  const void __user *src, size_t usize)
> +{
> +	size_t size = min(ksize, usize);
> +	size_t rest = abs(ksize - usize);

As above.

> +	if (unlikely(usize > PAGE_SIZE))
> +		return -EFAULT;

As above.

> +	if (unlikely(!access_ok(src, usize)))
> +		return -EFAULT;
> +
> +	/* Deal with trailing bytes. */
> +	if (usize < ksize)
> +		memset(dst + size, 0, rest);
> +	else if (usize > ksize) {
> +		const void __user *addr = src + size;
> +		char buffer[BUFFER_SIZE] = {};
> +
> +		while (rest > 0) {
> +			size_t bufsize = min(rest, sizeof(buffer));
> +
> +			if (__copy_from_user(buffer, addr, bufsize))
> +				return -EFAULT;
> +			if (memchr_inv(buffer, 0, bufsize))
> +				return -E2BIG;
> +
> +			addr += bufsize;
> +			rest -= bufsize;
> +		}

I'd create a __user_is_zero() helper for this - that way the two
branches in the two helpers become nicely symmetric, each just calling a
single helper that deals appropriately with the tail. And we can discuss
how to implement __user_is_zero() in another bikeshed.

> +	}
> +	/* Copy the interoperable parts of the struct. */
> +	if (__copy_from_user(dst, src, size))
> +		return -EFAULT;

If you do move up the __copy_to_user(), please move this as well - on
the kernel side, we certainly don't care that we copied some bytes to a
local buffer which we then ignore because the user had a non-zero tail.
But if __copy_to_user() is kept last in copy_struct_to_user(), this
should stay for symmetry.

> +	return 0;

As above.

> +}
> +EXPORT_SYMBOL(copy_struct_from_user);

As above.

Rasmus


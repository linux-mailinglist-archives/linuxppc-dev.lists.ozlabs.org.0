Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884AA9BF3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 09:35:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PCC2395wzDqyJ
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 17:35:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.b="AJRabzew"; dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PC880n7XzDqyp
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 17:32:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4t74LAQ8HoNYAg0doAzYeg6TjlgtY7XOq8PTAR8Aews=; b=AJRabzewRFq+7OIffGLOihagu
 Q6x11cx7vH4lTSeXsd4sAIih6IBnXO0V0QVaYKYPuOX5IyCWWNG/A5IpMM7XxnP5h6RLlcaHT7zAl
 Fno/b6maUNUFsIFZfcSZQfkojE92I1guZML9x4l93b6YVf0uAT4pU5Fy9CwtrM/pmFvkV07Tl/NDH
 UWkPdVlV3t+bv3MIvz+w7aolGCsHgXfQaMgu8S2KGM3coJTlVXl+SJRvUIqp+hXS+wtnXq+q3pBAn
 iaVF6fnqduZ0Uuod15wKkSs509rKcOJZLU443oqaQooqsVuFFvY8MOtj86gBpYi+ToNnI/idUssy/
 WNhx5pafw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i5mFW-0005ul-GL; Thu, 05 Sep 2019 07:32:10 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 73B24306038;
 Thu,  5 Sep 2019 09:31:28 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 550C129DE6C22; Thu,  5 Sep 2019 09:32:05 +0200 (CEST)
Date: Thu, 5 Sep 2019 09:32:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
Message-ID: <20190905073205.GY2332@hirez.programming.kicks-ass.net>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190904201933.10736-2-cyphar@cyphar.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, Jiri Olsa <jolsa@redhat.com>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, linux-m68k@lists.linux-m68k.org,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 05, 2019 at 06:19:22AM +1000, Aleksa Sarai wrote:
> +/**
> + * copy_struct_to_user: copy a struct to user space
> + * @dst:   Destination address, in user space.
> + * @usize: Size of @dst struct.
> + * @src:   Source address, in kernel space.
> + * @ksize: Size of @src struct.
> + *
> + * Copies a struct from kernel space to user space, in a way that guarantees
> + * backwards-compatibility for struct syscall arguments (as long as future
> + * struct extensions are made such that all new fields are *appended* to the
> + * old struct, and zeroed-out new fields have the same meaning as the old
> + * struct).
> + *
> + * @ksize is just sizeof(*dst), and @usize should've been passed by user space.
> + * The recommended usage is something like the following:
> + *
> + *   SYSCALL_DEFINE2(foobar, struct foo __user *, uarg, size_t, usize)
> + *   {
> + *      int err;
> + *      struct foo karg = {};
> + *
> + *      // do something with karg
> + *
> + *      err = copy_struct_to_user(uarg, usize, &karg, sizeof(karg));
> + *      if (err)
> + *        return err;
> + *
> + *      // ...
> + *   }
> + *
> + * There are three cases to consider:
> + *  * If @usize == @ksize, then it's copied verbatim.
> + *  * If @usize < @ksize, then kernel space is "returning" a newer struct to an
> + *    older user space. In order to avoid user space getting incomplete
> + *    information (new fields might be important), all trailing bytes in @src
> + *    (@ksize - @usize) must be zerored

s/zerored/zero/, right?

>                                          , otherwise -EFBIG is returned.

'Funny' that, copy_struct_from_user() below seems to use E2BIG.

> + *  * If @usize > @ksize, then the kernel is "returning" an older struct to a
> + *    newer user space. The trailing bytes in @dst (@usize - @ksize) will be
> + *    zero-filled.
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
> +
> +	if (unlikely(usize > PAGE_SIZE))
> +		return -EFAULT;

Not documented above. Implementation consistent with *from*, but see
below.

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
> +	}
> +	/* Copy the interoperable parts of the struct. */
> +	if (__copy_to_user(dst, src, size))
> +		return -EFAULT;
> +	return 0;
> +}
> +EXPORT_SYMBOL(copy_struct_to_user);
> +
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
> +
> +	if (unlikely(usize > PAGE_SIZE))
> +		return -EFAULT;

Documented above as returning -E2BIG.

> +	if (unlikely(!access_ok(src, usize)))
> +		return -EFAULT;
> +
> +	/* Deal with trailing bytes. */
> +	if (usize < ksize)
> +		memset(dst + size, 0, rest);
> +	else if (usize > ksize) {
> +		const void __user *addr = src + size;
> +		char buffer[BUFFER_SIZE] = {};

Isn't that too big for on-stack?

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

The perf implementation uses get_user(); but if that is too slow, surely
we can do something with uaccess_try() here?

> +	}
> +	/* Copy the interoperable parts of the struct. */
> +	if (__copy_from_user(dst, src, size))
> +		return -EFAULT;
> +	return 0;
> +}
> +EXPORT_SYMBOL(copy_struct_from_user);

And personally I'm not a big fan of EXPORT_SYMBOL().

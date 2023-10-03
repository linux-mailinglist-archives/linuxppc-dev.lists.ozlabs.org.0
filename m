Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 864B97B6EF4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 18:50:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TLl6iFVW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0P2F2xxGz3vlZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 03:50:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TLl6iFVW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0NwR12G5z3cBV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 03:45:11 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id C0319B8189D;
	Tue,  3 Oct 2023 16:45:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F408C433C8;
	Tue,  3 Oct 2023 16:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696351508;
	bh=dop7RZSVr+4/mLN3z5UedbVXHAn1xpij/cdcv21p87g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TLl6iFVWym0CSjXj60zbILQQLypWm1S8Pz/F/KicfpRKTEQUhJ/5j0JFSl+mwvOkZ
	 JuTCHpTVZl009+pJEfQfQ0MHzUy66KTaNixEjnk6d0W0PFDQ5rXISq/jGw0cjRjDob
	 WmLVbHiFlhHuREzrk4F/+bWZvxydDTDLAEwxCPvV9XiC/TK8ooguUQJwztWDvJdcoG
	 p9M7YlpPyVkEMUZVmge8W3Gu7p6Fsvom2NHY+glzXoqQOpeZbxx+hrifTn3BtjSBEt
	 USvlMVsLwyUrWbr8yk4wY7eA6a1cmwF5bKKPrqFycP3YsRzPr/AuCD9mxxkJIY/zSG
	 gd0jZeD8DG3kg==
Date: Tue, 3 Oct 2023 09:45:05 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Christian Brauner <brauner@kernel.org>
Subject: Re: [PATCH v2] vfs: shave work on failed file open
Message-ID: <20231003164505.GA624737@dev-arch.thelio-3990X>
References: <20230928-themen-dilettanten-16bf329ab370@brauner>
 <CAG48ez2d5CW=CDi+fBOU1YqtwHfubN3q6w=1LfD+ss+Q1PWHgQ@mail.gmail.com>
 <CAHk-=wj-5ahmODDWDBVL81wSG-12qPYEw=o-iEo8uzY0HBGGRQ@mail.gmail.com>
 <20230929-kerzen-fachjargon-ca17177e9eeb@brauner>
 <CAG48ez2cExy+QFHpT01d9yh8jbOLR0V8VsR8_==O_AB2fQ+h4Q@mail.gmail.com>
 <20230929-test-lauf-693fda7ae36b@brauner>
 <CAGudoHHwvOMFqYoBQAoFwD9mMmtq12=EvEGQWeToYT0AMg9V0A@mail.gmail.com>
 <CAGudoHHuQ2PjmX5HG+E6WMeaaOhSNEhdinCssd75dM0P+3ZG8Q@mail.gmail.com>
 <CAHk-=wir8YObRivyUX6cuanNKCJNKvojK0p2Rg_fKyUiHDVs-A@mail.gmail.com>
 <20230930-glitzer-errungenschaft-b86880c177c4@brauner>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230930-glitzer-errungenschaft-b86880c177c4@brauner>
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
Cc: Mateusz Guzik <mjguzik@gmail.com>, Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christian,

> >From d266eee9d9d917f07774e2c2bab0115d2119a311 Mon Sep 17 00:00:00 2001
> From: Christian Brauner <brauner@kernel.org>
> Date: Fri, 29 Sep 2023 08:45:59 +0200
> Subject: [PATCH] file: convert to SLAB_TYPESAFE_BY_RCU
> 
> In recent discussions around some performance improvements in the file
> handling area we discussed switching the file cache to rely on
> SLAB_TYPESAFE_BY_RCU which allows us to get rid of call_rcu() based
> freeing for files completely. This is a pretty sensitive change overall
> but it might actually be worth doing.
> 
> The main downside is the subtlety. The other one is that we should
> really wait for Jann's patch to land that enables KASAN to handle
> SLAB_TYPESAFE_BY_RCU UAFs. Currently it doesn't but a patch for this
> exists.
> 
> With SLAB_TYPESAFE_BY_RCU objects may be freed and reused multiple times
> which requires a few changes. So it isn't sufficient anymore to just
> acquire a reference to the file in question under rcu using
> atomic_long_inc_not_zero() since the file might have already been
> recycled and someone else might have bumped the reference.
> 
> In other words, callers might see reference count bumps from newer
> users. For this is reason it is necessary to verify that the pointer is
> the same before and after the reference count increment. This pattern
> can be seen in get_file_rcu() and __files_get_rcu().
> 
> In addition, it isn't possible to access or check fields in struct file
> without first aqcuiring a reference on it. Not doing that was always
> very dodgy and it was only usable for non-pointer data in struct file.
> With SLAB_TYPESAFE_BY_RCU it is necessary that callers first acquire a
> reference under rcu or they must hold the files_lock of the fdtable.
> Failing to do either one of this is a bug.
> 
> Thanks to Jann for pointing out that we need to ensure memory ordering
> between reallocations and pointer check by ensuring that all subsequent
> loads have a dependency on the second load in get_file_rcu() and
> providing a fixup that was folded into this patch.
> 
> Cc: Jann Horn <jannh@google.com>
> Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
> Signed-off-by: Christian Brauner <brauner@kernel.org>
> ---

<snip>

> --- a/arch/powerpc/platforms/cell/spufs/coredump.c
> +++ b/arch/powerpc/platforms/cell/spufs/coredump.c
> @@ -74,10 +74,13 @@ static struct spu_context *coredump_next_context(int *fd)
>  	*fd = n - 1;
>  
>  	rcu_read_lock();
> -	file = lookup_fd_rcu(*fd);
> -	ctx = SPUFS_I(file_inode(file))->i_ctx;
> -	get_spu_context(ctx);
> +	file = lookup_fdget_rcu(*fd);
>  	rcu_read_unlock();
> +	if (file) {
> +		ctx = SPUFS_I(file_inode(file))->i_ctx;
> +		get_spu_context(ctx);
> +		fput(file);
> +	}
>  
>  	return ctx;
>  }

This hunk now causes a clang warning (or error, since arch/powerpc builds
with -Werror by default) in next-20231003.

  $ make -skj"$(nproc)" ARCH=powerpc LLVM=1 ppc64_guest_defconfig arch/powerpc/platforms/cell/spufs/coredump.o
  ...
  arch/powerpc/platforms/cell/spufs/coredump.c:79:6: error: variable 'ctx' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
     79 |         if (file) {
        |             ^~~~
  arch/powerpc/platforms/cell/spufs/coredump.c:85:9: note: uninitialized use occurs here
     85 |         return ctx;
        |                ^~~
  arch/powerpc/platforms/cell/spufs/coredump.c:79:2: note: remove the 'if' if its condition is always true
     79 |         if (file) {
        |         ^~~~~~~~~
  arch/powerpc/platforms/cell/spufs/coredump.c:69:25: note: initialize the variable 'ctx' to silence this warning
     69 |         struct spu_context *ctx;
        |                                ^
        |                                 = NULL
  1 error generated.

Cheers,
Nathan

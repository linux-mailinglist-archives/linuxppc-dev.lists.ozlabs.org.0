Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E13820079E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 13:19:33 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49pGXy21mDzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 21:19:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49pGV709ldzDrNB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 21:17:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=FT1TmN7F; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49pGV3381Cz9s9y;
 Fri, 19 Jun 2020 21:16:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1592565419;
 bh=KUgzDn5A0mB1tUojG4/8s9av4s0WnFqXhr3yFHygg8s=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=FT1TmN7F97o/+KCnwO65GIou4kMg+dUx/0uRoU3Mt4iDOVmQBDIJtqZJnI3PIrodD
 Gvzk/MB1TqkKyaJAB//uZQMlNyxBSCu0zub4EgRj419nfEUHYMHJZVSo6L0FdqPzgg
 dx0bAA9PEkofJa+C2oeL8wBASnmhUSzUUr8QJNZf1UlfP5rQmAy97ELYnkX6FmzQGW
 Wasq617evGkt0aotRYxkN7neI4RFchNnjQpjLnvV097lPuuPeHG3kWp1KD9ISUv3qB
 Kz/lJtA3V58yE2YEOV9qAZTDqgk5oHwpYJdo7OM1oiViIlCq/54TFLPQk4Aq71CQvk
 wma5gXswHNT6g==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Christian Brauner <christian@brauner.io>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Subject: Re: linux-next: manual merge of the pidfd tree with the powerpc-fixes
 tree
In-Reply-To: <20200618121131.4ad29150@canb.auug.org.au>
References: <20200618121131.4ad29150@canb.auug.org.au>
Date: Fri, 19 Jun 2020 21:17:30 +1000
Message-ID: <878sgjcnjp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> Hi all,
>
> Today's linux-next merge of the pidfd tree got a conflict in:
>
>   arch/powerpc/kernel/syscalls/syscall.tbl
>
> between commit:
>
>   35e32a6cb5f6 ("powerpc/syscalls: Split SPU-ness out of ABI")
>
> from the powerpc-fixes tree and commit:
>
>   9b4feb630e8e ("arch: wire-up close_range()")
>
> from the pidfd tree.
>
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.

Thanks.

I thought the week between rc1 and rc2 would be a safe time to do that
conversion of the syscall table, but I guess I was wrong :)

I'm planning to send those changes to Linus for rc2, so the conflict
will then be vs mainline. But I guess it's pretty trivial so it doesn't
really matter.

cheers

> diff --cc arch/powerpc/kernel/syscalls/syscall.tbl
> index c0cdaacd770e,dd87a782d80e..000000000000
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@@ -480,6 -524,8 +480,7 @@@
>   434	common	pidfd_open			sys_pidfd_open
>   435	32	clone3				ppc_clone3			sys_clone3
>   435	64	clone3				sys_clone3
>  -435	spu	clone3				sys_ni_syscall
> + 436	common	close_range			sys_close_range
>   437	common	openat2				sys_openat2
>   438	common	pidfd_getfd			sys_pidfd_getfd
>   439	common	faccessat2			sys_faccessat2

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B57A42F03C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 14:09:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HW4p6689Dz2ynq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 23:09:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=F4NEd+dG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HW4nQ4bz8z2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 23:09:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=F4NEd+dG; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HW4nQ36Ktz4xb9;
 Fri, 15 Oct 2021 23:09:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1634299754;
 bh=1uMmuk8UZMQcxtOynGwwbYnNzAvhH79ibEqbN2M3pRc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=F4NEd+dGo1xipM8r2FCUb9EjW1qHdvX6I5Aed0HlRi/S3NbTKuWU3ZGp0I5Jk3r60
 Nf2L/4IMFve8quF6hLjUTELGnjHcUHNslZR+PRIoR2yomusVNlmJg1FkSXI6qzxAk/
 x/TVNIWDZ73PKr8bfO62PW7nXVu9CiGpwbzApIbbdN26Rmj5s1LiHXAjLDGpgIHBT4
 366pyu57Z/MUT8uMHjs9MoYLJPsTTcQ0BO1+CqmnOpD8OiERxONVGxVlPhqVTnBZ7m
 MDpg3edpvYfrrte6bWaZftkouB1X9tdbnimQVk/GH/DwZ2+HzTlNJyK1UyGAasQE8P
 QCXhQMUPSMGOg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH 2/2] kbuild: use more subdir- for visiting
 subdirectories while cleaning
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
References: <20211013063622.548590-1-masahiroy@kernel.org>
 <20211013063622.548590-2-masahiroy@kernel.org>
Date: Fri, 15 Oct 2021 23:09:11 +1100
Message-ID: <8735p2xzfc.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
>
...
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index aa6808e70647..b61d8be3c226 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -411,9 +409,6 @@ install:
>  	sh -x $(srctree)/$(boot)/install.sh "$(KERNELRELEASE)" vmlinux \
>  	System.map "$(INSTALL_PATH)"
>  
> -archclean:
> -	$(Q)$(MAKE) $(clean)=$(boot)
> -
>  ifeq ($(KBUILD_EXTMOD),)
>  # We need to generate vdso-offsets.h before compiling certain files in kernel/.
>  # In order to do that, we should use the archprepare target, but we can't since

Seems to work.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

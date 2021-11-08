Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC63F447A26
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 06:29:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hnfmp33Wtz3bX0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 16:29:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=pZtR+sTc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HnfmB0RbYz2xXm
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Nov 2021 16:28:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=pZtR+sTc; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hnfm96KXcz4xd8;
 Mon,  8 Nov 2021 16:28:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636349321;
 bh=+/vYpAetAlXaOOdak4GLMEg9jsGSybQd66zuVmUkr8E=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=pZtR+sTcWX+oxBQleABox7yd8w6kT50JGJ7maytxiwWgFtAzPUvlWLEJgjAt7eNFC
 I5+DAdxqWkgMoLAOfkoVIBK5nXPB/RSoijDPEdCwyIx+XPFMYRJLwoTlXIGcOKO4Go
 TZjwFXWXmYXxh0XKj95dpVSi5ep730A0aIvYbMBjrZVcyh2O611m52hk26q5Uvrb9K
 zsV6IgJnx0kN6ScKFqL68vQINx6u83IX1Zt2N2w5vnagcN0jx6OqO2pVnSYg7eNlGJ
 QYqQEBVbCfl0eNVrXIVQlOTTdxhcU034J33huCUp82K1U3yCXwkfzKi3BSTKuROUox
 Yx3KbOplUoo5Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/64s: introduce CONFIG_MAXSMP to test very large
 SMP
In-Reply-To: <20211105041132.1443767-1-npiggin@gmail.com>
References: <20211105041132.1443767-1-npiggin@gmail.com>
Date: Mon, 08 Nov 2021 16:28:41 +1100
Message-ID: <87pmrb6ws6.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Similarly to x86, add MAXSMP that should help flush out problems with
> vary large SMP and other values associated with very big systems.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/Kconfig                   | 8 ++++++++
>  arch/powerpc/platforms/Kconfig.cputype | 5 +++--
>  2 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index b8f6185d3998..d585fcfa456f 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -64,6 +64,13 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
>  config NEED_PER_CPU_PAGE_FIRST_CHUNK
>  	def_bool y if PPC64
>  
> +config MAXSMP
> +	bool "Enable Maximum number of SMP Processors and NUMA Nodes"
> +	depends on SMP && DEBUG_KERNEL && PPC_BOOK3S_64
> +	help
> +	  Enable maximum number of CPUS and NUMA Nodes for this architecture.
> +	  If unsure, say N.

As evidenced by the kernel robot report, I think we need to exclude this
from allyesconfig.

Because our max is 16K, larger than the 8K on x86, we are going to be
constantly hitting stack usage errors in driver code. Getting those
fixed tends to take time, because the driver authors don't see the
warnings when they build for other arches, and because the fixes go via
driver trees.

Making MAXSMP depend on !COMPILE_TEST should do the trick.

cheers

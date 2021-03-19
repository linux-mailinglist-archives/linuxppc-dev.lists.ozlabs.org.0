Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB2D3411FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 02:12:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1m8f19P3z3c11
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Mar 2021 12:12:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Fao3y2Eh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Fao3y2Eh; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1m8F2rHrz2yRW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Mar 2021 12:12:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4F1m8D1wZMz9sS8;
 Fri, 19 Mar 2021 12:12:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616116332;
 bh=rRKNz7fKA4p24eXJa06RoR1oxjHRUhSG3Jnyacf6ruc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Fao3y2Ehs4jzoyXSJ9p/Nr78wQaOGpd+aEjqm17J145FvtbBM7y3YslFtOWbg4stx
 L0/tsXoMmQ0Gakb+yu0GLhzVl/H+DXk/KR/RushG16wQuQPaXVwu9WRH6klHCsmo3f
 pnr/6zI9UmbesNMW2MUpyuuy2/0B/UZXwUwrz+Q3VuxxBx/VA2UAmgBm/Q6KLzuoP/
 /0xU6cowcBYu3zlQMimkhtPDbaTl7LwVyxMGJYtuxkA1B3pPbR7TuVLVALs1ocf+bb
 pc2GVGqmyYPo3Sh4Vs9gueeqw0IExSyJLkcwwTs7IMG7wbi/OStT++GLKFJBDq96sd
 eAiJDLTgS/VMg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/mm: Revert "powerpc/mm: Remove DEBUG_VM_PGTABLE
 support on powerpc"
In-Reply-To: <20210318034855.74513-1-aneesh.kumar@linux.ibm.com>
References: <20210318034855.74513-1-aneesh.kumar@linux.ibm.com>
Date: Fri, 19 Mar 2021 12:12:10 +1100
Message-ID: <87lfak54lx.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> This reverts commit 675bceb097e6 ("powerpc/mm: Remove DEBUG_VM_PGTABLE support on powerpc")
>
> All the related issues are fixed by the series
> https://lore.kernel.org/linux-mm/20200902114222.181353-1-aneesh.kumar@linux.ibm.com

Was that series merged?

If so this seems like this could be tagged as a Fix for the last commit
in that series.

cheers

> Hence enable it back
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  Documentation/features/debug/debug-vm-pgtable/arch-support.txt | 2 +-
>  arch/powerpc/Kconfig                                           | 1 +
>  2 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> index 7aff505af706..fa83403b4aec 100644
> --- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> +++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
> @@ -21,7 +21,7 @@
>      |       nios2: | TODO |
>      |    openrisc: | TODO |
>      |      parisc: | TODO |
> -    |     powerpc: | TODO |
> +    |     powerpc: |  ok  |
>      |       riscv: |  ok  |
>      |        s390: |  ok  |
>      |          sh: | TODO |
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 386ae12d8523..982c87d5c051 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -119,6 +119,7 @@ config PPC
>  	#
>  	select ARCH_32BIT_OFF_T if PPC32
>  	select ARCH_HAS_DEBUG_VIRTUAL
> +	select ARCH_HAS_DEBUG_VM_PGTABLE
>  	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_ELF_RANDOMIZE
>  	select ARCH_HAS_FORTIFY_SOURCE
> -- 
> 2.30.2

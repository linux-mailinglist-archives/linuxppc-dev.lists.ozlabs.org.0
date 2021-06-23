Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A4B3B1A52
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 14:39:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G92rx6Pcxz3bwk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 22:39:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=IhO3VnSP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IhO3VnSP; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G92rY0ZK5z2xv2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 22:39:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4G92rN21WRz9sVm;
 Wed, 23 Jun 2021 22:39:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1624451940;
 bh=YcB/9YcVFOV23ikLx+fO1is/rA8AMgT7lbS0KblGDX8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=IhO3VnSPInKOmgJ6xl4x8k54oh3tBUpey7qr5Q7eNwHTBl2lb+wc84ShJMY/WAY/K
 Mf3fEPIYKb3zE8VEsJfhtQmdlUee/tzIJiVDyLy0gmyLnGOgxAjH7vJhMCQ4uHZhWu
 W81cskQH6XGtFSVcCh8SA0hJI2OKKbCFWvi3N8e7FnronJq9UGfYBDX1fkpahhoFHI
 iqat3Wq9TfysA1b4mQxUtjoTNN9ibGFxM0WmPUg7GSJ42OlTfGqQVoQ/gCMvgUeyo8
 rfO4bflS7/cXYJNR7I3dzzmod5PUit/W81ScqFEO6ZpPMf3yfDTVqkY9pc5IUZ6onN
 pWR/q2zD7CEOw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH 2/3] powerpc: Define swapper_pg_dir[] in C
In-Reply-To: <871r8siyqm.fsf@dja-thinkpad.axtens.net>
References: <5838caffa269e0957c5a50cc85477876220298b0.1623063174.git.christophe.leroy@csgroup.eu>
 <5e3f1b8a4695c33ccc80aa3870e016bef32b85e1.1623063174.git.christophe.leroy@csgroup.eu>
 <871r8siyqm.fsf@dja-thinkpad.axtens.net>
Date: Wed, 23 Jun 2021 22:38:58 +1000
Message-ID: <87czsc21st.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Daniel Axtens <dja@axtens.net> writes:
> Hi Christophe,
>
> This breaks booting a radix KVM guest with 4k pages for me:
>
> make pseries_le_defconfig
> scripts/config -d CONFIG_PPC_64K_PAGES
> scripts/config -e CONFIG_PPC_4K_PAGES
> make vmlinux
> sudo qemu-system-ppc64 -enable-kvm -M pseries -m 1G -nographic -vga none -smp 4 -cpu host -kernel vmlinux
>
> Boot hangs after printing 'Booting Linux via __start()' and qemu's 'info
> registers' reports that it's stuck at the instruction fetch exception.
>
> My host is Power9, 64k page size radix, and
> gcc (Ubuntu 9.3.0-17ubuntu1~20.04) 9.3.0, GNU ld (GNU Binutils for Ubuntu) 2.34
>

...
>> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
>> index 730838c7ca39..79f2d1e61abd 100644
>> --- a/arch/powerpc/kernel/head_64.S
>> +++ b/arch/powerpc/kernel/head_64.S
>> @@ -997,18 +997,3 @@ start_here_common:
>>  0:	trap
>>  	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
>>  	.previous
>> -
>> -/*
>> - * We put a few things here that have to be page-aligned.
>> - * This stuff goes at the beginning of the bss, which is page-aligned.
>> - */
>> -	.section ".bss"
>> -/*
>> - * pgd dir should be aligned to PGD_TABLE_SIZE which is 64K.
>> - * We will need to find a better way to fix this
>> - */
>> -	.align	16
>> -
>> -	.globl	swapper_pg_dir
>> -swapper_pg_dir:
>> -	.space	PGD_TABLE_SIZE

This is now 4K aligned whereas it used to be 64K.

This fixes it and is not completely ugly?

diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 1707ab580ee2..298469beaa90 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -28,7 +28,13 @@
 #include <asm/hugetlb.h>
 #include <asm/pte-walk.h>
 
-pgd_t swapper_pg_dir[MAX_PTRS_PER_PGD] __page_aligned_bss;
+#ifdef CONFIG_PPC64
+#define PGD_ALIGN 0x10000
+#else
+#define PGD_ALIGN PAGE_SIZE
+#endif
+
+pgd_t swapper_pg_dir[MAX_PTRS_PER_PGD] __section(".bss..page_aligned") __aligned(PGD_ALIGN);
 
 static inline int is_exec_fault(void)
 {


cheers

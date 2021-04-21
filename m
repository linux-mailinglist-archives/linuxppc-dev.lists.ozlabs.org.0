Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF25366A56
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 14:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQJyt1n48z30FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 22:00:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQJyJ12CVz2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 21:59:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FQJy72cJyz9vBL5;
 Wed, 21 Apr 2021 13:59:43 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id c7vLtnAFJgvj; Wed, 21 Apr 2021 13:59:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FQJy71plPz9vBL3;
 Wed, 21 Apr 2021 13:59:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C9668B824;
 Wed, 21 Apr 2021 13:59:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id oBP5m1yZcDtw; Wed, 21 Apr 2021 13:59:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 395638B770;
 Wed, 21 Apr 2021 13:59:44 +0200 (CEST)
Subject: Re: [PATCH] powerpc/64s: Add load address to plt branch targets
 before moved to linked location for non-relocatable kernels
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210421021721.1539289-1-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <049194eb-a6e6-4fc5-2496-ab4c91f9b009@csgroup.eu>
Date: Wed, 21 Apr 2021 13:59:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20210421021721.1539289-1-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/04/2021 à 04:17, Jordan Niethe a écrit :
> Large branches will go through the plt which includes a stub that loads
> a target address from the .branch_lt section. On a relocatable kernel the
> targets in .branch_lt have relocations so they will be fixed up for
> where the kernel is running by relocate().
> 
> For a non-relocatable kernel obviously there are no relocations.
> However, until the kernel is moved down to its linked address it is
> expected to be able to run where ever it is loaded. For pseries machines
> prom_init() is called before running at the linked address.
> 
> Certain configs result in a large kernel such as STRICT_KERNEL_RWX
> (because of the larger data shift):
> 
> config DATA_SHIFT
> 	int "Data shift" if DATA_SHIFT_BOOL
> 	default 24 if STRICT_KERNEL_RWX && PPC64
> 
> These large kernels lead to prom_init()'s final call to __start()
> generating a plt branch:
> 
> bl      c000000002000018 <00000078.plt_branch.__start>
> 
> This results in the kernel jumping to the linked address of __start,
> 0xc000000000000000, when really it needs to jump to the
> 0xc000000000000000 + the runtime address because the kernel is still
> running at the load address.


On ppc32 it seems to be different. I can't find plt_branch or lt_branch or whatever.

Looks like the stubs are placed at the end of .head section, and just after prom_init:

c0003858 <setup_disp_bat>:
c0003858:	7d 08 02 a6 	mflr    r8
c000385c:	48 00 d5 35 	bl      c0010d90 <reloc_offset>
c0003860:	7d 08 03 a6 	mtlr    r8
c0003864:	3d 03 c2 04 	addis   r8,r3,-15868
c0003868:	39 08 1d 08 	addi    r8,r8,7432
c000386c:	2c 08 00 00 	cmpwi   r8,0
c0003870:	4d 82 00 20 	beqlr
c0003874:	81 68 00 00 	lwz     r11,0(r8)
c0003878:	81 08 00 04 	lwz     r8,4(r8)
c000387c:	7d 1f 83 a6 	mtdbatl 3,r8
c0003880:	7d 7e 83 a6 	mtdbatu 3,r11
c0003884:	4e 80 00 20 	blr
c0003888:	3d 80 c2 00 	lis     r12,-15872
c000388c:	39 8c 16 dc 	addi    r12,r12,5852
c0003890:	7d 89 03 a6 	mtctr   r12
c0003894:	4e 80 04 20 	bctr
c0003898:	3d 80 c2 01 	lis     r12,-15871
c000389c:	39 8c e1 38 	addi    r12,r12,-7880
c00038a0:	7d 89 03 a6 	mtctr   r12
c00038a4:	4e 80 04 20 	bctr
c00038a8:	3d 80 c2 00 	lis     r12,-15872
c00038ac:	39 8c 74 d0 	addi    r12,r12,29904
c00038b0:	7d 89 03 a6 	mtctr   r12
c00038b4:	4e 80 04 20 	bctr
c00038b8:	3d 80 c2 00 	lis     r12,-15872
c00038bc:	39 8c 73 38 	addi    r12,r12,29496
c00038c0:	7d 89 03 a6 	mtctr   r12
c00038c4:	4e 80 04 20 	bctr
c00038c8:	3d 80 c2 01 	lis     r12,-15871
c00038cc:	39 8c 83 6c 	addi    r12,r12,-31892
c00038d0:	7d 89 03 a6 	mtctr   r12
c00038d4:	4e 80 04 20 	bctr
c00038d8:	3d 80 c2 01 	lis     r12,-15871
c00038dc:	39 8c 8f 08 	addi    r12,r12,-28920
c00038e0:	7d 89 03 a6 	mtctr   r12
c00038e4:	4e 80 04 20 	bctr

Disassembly of section .text:

c0004000 <Reset_virt>:


c20016dc <prom_init>:
c20016dc:	94 21 ff 50 	stwu    r1,-176(r1)
c20016e0:	7c 08 02 a6 	mflr    r0
c20016e4:	42 9f 00 05 	bcl     20,4*cr7+so,c20016e8 <prom_init+0xc>
c20016e8:	bd c1 00 68 	stmw    r14,104(r1)
c20016ec:	7f c8 02 a6 	mflr    r30
c20016f0:	90 01 00 b4 	stw     r0,180(r1)
c20016f4:	7c bb 2b 78 	mr      r27,r5
c20016f8:	80 1e ff f0 	lwz     r0,-16(r30)
....
c20026d4:	4a 00 ed 69 	bl      c001143c <reloc_got2>
c20026d8:	7f e3 fb 78 	mr      r3,r31
c20026dc:	7f 24 cb 78 	mr      r4,r25
c20026e0:	39 20 00 00 	li      r9,0
c20026e4:	39 00 00 00 	li      r8,0
c20026e8:	38 e0 00 00 	li      r7,0
c20026ec:	38 c0 00 00 	li      r6,0
c20026f0:	38 a0 00 00 	li      r5,0
c20026f4:	48 00 00 61 	bl      c2002754 <prom_init+0x1078>
c20026f8:	38 60 00 00 	li      r3,0
c20026fc:	80 01 00 b4 	lwz     r0,180(r1)
c2002700:	81 c1 00 68 	lwz     r14,104(r1)
c2002704:	81 e1 00 6c 	lwz     r15,108(r1)
c2002708:	7c 08 03 a6 	mtlr    r0
c200270c:	82 01 00 70 	lwz     r16,112(r1)
c2002710:	82 21 00 74 	lwz     r17,116(r1)
c2002714:	82 41 00 78 	lwz     r18,120(r1)
c2002718:	82 61 00 7c 	lwz     r19,124(r1)
c200271c:	82 81 00 80 	lwz     r20,128(r1)
c2002720:	82 a1 00 84 	lwz     r21,132(r1)
c2002724:	82 c1 00 88 	lwz     r22,136(r1)
c2002728:	82 e1 00 8c 	lwz     r23,140(r1)
c200272c:	83 01 00 90 	lwz     r24,144(r1)
c2002730:	83 21 00 94 	lwz     r25,148(r1)
c2002734:	83 41 00 98 	lwz     r26,152(r1)
c2002738:	83 61 00 9c 	lwz     r27,156(r1)
c200273c:	83 81 00 a0 	lwz     r28,160(r1)
c2002740:	83 a1 00 a4 	lwz     r29,164(r1)
c2002744:	83 c1 00 a8 	lwz     r30,168(r1)
c2002748:	83 e1 00 ac 	lwz     r31,172(r1)
c200274c:	38 21 00 b0 	addi    r1,r1,176
c2002750:	4e 80 00 20 	blr
c2002754:	3d 80 c0 00 	lis     r12,-16384
c2002758:	39 8c 00 0c 	addi    r12,r12,12
c200275c:	7d 89 03 a6 	mtctr   r12
c2002760:	4e 80 04 20 	bctr


Any idea on how the GNU ld does it and how we can alter it, or force generation of dedicated section 
like on PPC64 ?

Christophe

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A683F656F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Aug 2021 19:12:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GvFzC0fVTz2yn8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Aug 2021 03:12:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GvFym4kVwz2yHf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Aug 2021 03:11:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GvFyf5s7Gz9sVj;
 Tue, 24 Aug 2021 19:11:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cZ1oHsI0Uijr; Tue, 24 Aug 2021 19:11:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GvFyf4cPxz9sVN;
 Tue, 24 Aug 2021 19:11:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A83C8B828;
 Tue, 24 Aug 2021 19:11:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1DsxysscYd-o; Tue, 24 Aug 2021 19:11:54 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BE15B8B80A;
 Tue, 24 Aug 2021 19:11:53 +0200 (CEST)
Subject: Re: [PATCH v2 RESEND] powerpc/audit: Convert powerpc to
 AUDIT_ARCH_COMPAT_GENERIC
To: Paul Moore <paul@paul-moore.com>
References: <a4b3951d1191d4183d92a07a6097566bde60d00a.1629812058.git.christophe.leroy@csgroup.eu>
 <CAHC9VhR3E6=5HmRaWMWbp4WHsua02niwnzaRGM3tLqd4Y4LA6w@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5a2692b6-5077-21b4-8ebf-73b1c2b83a40@csgroup.eu>
Date: Tue, 24 Aug 2021 19:11:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAHC9VhR3E6=5HmRaWMWbp4WHsua02niwnzaRGM3tLqd4Y4LA6w@mail.gmail.com>
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
Cc: linux-kernel@vger.kernel.org, Eric Paris <eparis@redhat.com>,
 linux-audit@redhat.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/08/2021 à 16:47, Paul Moore a écrit :
> On Tue, Aug 24, 2021 at 9:36 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>> Commit e65e1fc2d24b ("[PATCH] syscall class hookup for all normal
>> targets") added generic support for AUDIT but that didn't include
>> support for bi-arch like powerpc.
>>
>> Commit 4b58841149dc ("audit: Add generic compat syscall support")
>> added generic support for bi-arch.
>>
>> Convert powerpc to that bi-arch generic audit support.
>>
>> Cc: Paul Moore <paul@paul-moore.com>
>> Cc: Eric Paris <eparis@redhat.com>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> Resending v2 with Audit people in Cc
>>
>> v2:
>> - Missing 'git add' for arch/powerpc/include/asm/unistd32.h
>> - Finalised commit description
>> ---
>>   arch/powerpc/Kconfig                |  5 +-
>>   arch/powerpc/include/asm/unistd32.h |  7 +++
>>   arch/powerpc/kernel/Makefile        |  3 --
>>   arch/powerpc/kernel/audit.c         | 84 -----------------------------
>>   arch/powerpc/kernel/compat_audit.c  | 44 ---------------
>>   5 files changed, 8 insertions(+), 135 deletions(-)
>>   create mode 100644 arch/powerpc/include/asm/unistd32.h
>>   delete mode 100644 arch/powerpc/kernel/audit.c
>>   delete mode 100644 arch/powerpc/kernel/compat_audit.c
> 
> Can you explain, in detail please, the testing you have done to verify
> this patch?
> 

I built ppc64_defconfig and checked that the generated code is functionnaly equivalent.

ppc32_classify_syscall() is exactly the same as audit_classify_compat_syscall() except that the 
later takes the syscall as second argument (ie in r4) whereas the former takes it as first argument 
(ie in r3).

audit_classify_arch() and powerpc audit_classify_syscall() are slightly different between the 
powerpc version and the generic version because the powerpc version checks whether it is 
AUDIT_ARCH_PPC or not (ie value 20), while the generic one checks whether it has bit 
__AUDIT_ARCH_64BIT set or not (__AUDIT_ARCH_64BIT is the sign bit of a word), but taking into 
account that the abi is either AUDIT_ARCH_PPC, AUDIT_ARCH_PPC64 or AUDIT_ARCH_PPC64LE, the result is 
the same.

If you are asking I guess you saw something wrong ?


arch/powerpc/kernel/compat_audit.o:     file format elf64-powerpc


Disassembly of section .text:

0000000000000000 <.ppc32_classify_syscall>:
    0:	28 03 00 66 	cmplwi  r3,102
    4:	7c 69 1b 78 	mr      r9,r3
    8:	41 82 00 48 	beq     50 <.ppc32_classify_syscall+0x50>
    c:	41 81 00 24 	bgt     30 <.ppc32_classify_syscall+0x30>
   10:	28 03 00 05 	cmplwi  r3,5
   14:	38 60 00 02 	li      r3,2
   18:	4d 82 00 20 	beqlr
   1c:	28 09 00 0b 	cmplwi  r9,11
   20:	40 82 00 38 	bne     58 <.ppc32_classify_syscall+0x58>
   24:	38 60 00 05 	li      r3,5
   28:	4e 80 00 20 	blr
   2c:	60 00 00 00 	nop
   30:	28 03 01 1e 	cmplwi  r3,286
   34:	38 60 00 01 	li      r3,1
   38:	4c 82 00 20 	bnelr
   3c:	38 60 00 03 	li      r3,3
   40:	4e 80 00 20 	blr
   44:	60 00 00 00 	nop
   48:	60 00 00 00 	nop
   4c:	60 00 00 00 	nop
   50:	38 60 00 04 	li      r3,4
   54:	4e 80 00 20 	blr
   58:	38 60 00 01 	li      r3,1
   5c:	4e 80 00 20 	blr


lib/compat_audit.o:     file format elf64-powerpc


Disassembly of section .text:

0000000000000000 <.audit_classify_compat_syscall>:
    0:	28 04 00 66 	cmplwi  r4,102
    4:	41 82 00 4c 	beq     50 <.audit_classify_compat_syscall+0x50>
    8:	41 81 00 28 	bgt     30 <.audit_classify_compat_syscall+0x30>
    c:	28 04 00 05 	cmplwi  r4,5
   10:	38 60 00 02 	li      r3,2
   14:	4d 82 00 20 	beqlr
   18:	28 04 00 0b 	cmplwi  r4,11
   1c:	40 82 00 3c 	bne     58 <.audit_classify_compat_syscall+0x58>
   20:	38 60 00 05 	li      r3,5
   24:	4e 80 00 20 	blr
   28:	60 00 00 00 	nop
   2c:	60 00 00 00 	nop
   30:	28 04 01 1e 	cmplwi  r4,286
   34:	38 60 00 01 	li      r3,1
   38:	4c 82 00 20 	bnelr
   3c:	38 60 00 03 	li      r3,3
   40:	4e 80 00 20 	blr
   44:	60 00 00 00 	nop
   48:	60 00 00 00 	nop
   4c:	60 00 00 00 	nop
   50:	38 60 00 04 	li      r3,4
   54:	4e 80 00 20 	blr
   58:	38 60 00 01 	li      r3,1
   5c:	4e 80 00 20 	blr


arch/powerpc/kernel/audit.o:     file format elf64-powerpc


Disassembly of section .text:

0000000000000000 <.audit_classify_arch>:
    0:	68 63 00 14 	xori    r3,r3,20
    4:	7c 63 00 34 	cntlzw  r3,r3
    8:	54 63 d9 7e 	rlwinm  r3,r3,27,5,31
    c:	4e 80 00 20 	blr

0000000000000010 <.audit_classify_syscall>:
   10:	2c 03 00 14 	cmpwi   r3,20
   14:	41 82 00 5c 	beq     70 <.audit_classify_syscall+0x60>
   18:	28 04 00 66 	cmplwi  r4,102
   1c:	41 82 00 44 	beq     60 <.audit_classify_syscall+0x50>
   20:	41 81 00 20 	bgt     40 <.audit_classify_syscall+0x30>
   24:	28 04 00 05 	cmplwi  r4,5
   28:	38 60 00 02 	li      r3,2
   2c:	4d 82 00 20 	beqlr
   30:	28 04 00 0b 	cmplwi  r4,11
   34:	40 82 00 64 	bne     98 <.audit_classify_syscall+0x88>
   38:	38 60 00 05 	li      r3,5
   3c:	4e 80 00 20 	blr
   40:	28 04 01 1e 	cmplwi  r4,286
   44:	38 60 00 00 	li      r3,0
   48:	4c 82 00 20 	bnelr
   4c:	38 60 00 03 	li      r3,3
   50:	4e 80 00 20 	blr
   54:	60 00 00 00 	nop
   58:	60 00 00 00 	nop
   5c:	60 00 00 00 	nop
   60:	38 60 00 04 	li      r3,4
   64:	4e 80 00 20 	blr
   68:	60 00 00 00 	nop
   6c:	60 00 00 00 	nop
   70:	7c 08 02 a6 	mflr    r0
   74:	7c 83 23 78 	mr      r3,r4
   78:	f8 01 00 10 	std     r0,16(r1)
   7c:	f8 21 ff 91 	stdu    r1,-112(r1)
   80:	48 00 00 01 	bl      80 <.audit_classify_syscall+0x70>
			80: R_PPC64_REL24	.ppc32_classify_syscall
   84:	60 00 00 00 	nop
   88:	38 21 00 70 	addi    r1,r1,112
   8c:	e8 01 00 10 	ld      r0,16(r1)
   90:	7c 08 03 a6 	mtlr    r0
   94:	4e 80 00 20 	blr
   98:	38 60 00 00 	li      r3,0
   9c:	4e 80 00 20 	blr

Disassembly of section .init.text:

0000000000000000 <.audit_classes_init>:
    0:	7c 08 02 a6 	mflr    r0
    4:	fb e1 ff f8 	std     r31,-8(r1)
    8:	3d 22 00 00 	addis   r9,r2,0
			a: R_PPC64_TOC16_HA	.toc
    c:	38 60 00 07 	li      r3,7
   10:	e8 89 00 00 	ld      r4,0(r9)
			12: R_PPC64_TOC16_LO_DS	.toc
   14:	3f e2 00 00 	addis   r31,r2,0
			16: R_PPC64_TOC16_HA	.data
   18:	3b ff 00 00 	addi    r31,r31,0
			1a: R_PPC64_TOC16_LO	.data
   1c:	f8 01 00 10 	std     r0,16(r1)
   20:	f8 21 ff 81 	stdu    r1,-128(r1)
   24:	48 00 00 01 	bl      24 <.audit_classes_init+0x24>
			24: R_PPC64_REL24	.audit_register_class
   28:	60 00 00 00 	nop
   2c:	3d 22 00 00 	addis   r9,r2,0
			2e: R_PPC64_TOC16_HA	.toc+0x8
   30:	38 60 00 05 	li      r3,5
   34:	e8 89 00 00 	ld      r4,0(r9)
			36: R_PPC64_TOC16_LO_DS	.toc+0x8
   38:	48 00 00 01 	bl      38 <.audit_classes_init+0x38>
			38: R_PPC64_REL24	.audit_register_class
   3c:	60 00 00 00 	nop
   40:	3d 22 00 00 	addis   r9,r2,0
			42: R_PPC64_TOC16_HA	.toc+0x10
   44:	38 60 00 01 	li      r3,1
   48:	e8 89 00 00 	ld      r4,0(r9)
			4a: R_PPC64_TOC16_LO_DS	.toc+0x10
   4c:	48 00 00 01 	bl      4c <.audit_classes_init+0x4c>
			4c: R_PPC64_REL24	.audit_register_class
   50:	60 00 00 00 	nop
   54:	3d 22 00 00 	addis   r9,r2,0
			56: R_PPC64_TOC16_HA	.toc+0x18
   58:	38 60 00 03 	li      r3,3
   5c:	e8 89 00 00 	ld      r4,0(r9)
			5e: R_PPC64_TOC16_LO_DS	.toc+0x18
   60:	48 00 00 01 	bl      60 <.audit_classes_init+0x60>
			60: R_PPC64_REL24	.audit_register_class
   64:	60 00 00 00 	nop
   68:	3d 22 00 00 	addis   r9,r2,0
			6a: R_PPC64_TOC16_HA	.toc+0x20
   6c:	38 60 00 09 	li      r3,9
   70:	e8 89 00 00 	ld      r4,0(r9)
			72: R_PPC64_TOC16_LO_DS	.toc+0x20
   74:	48 00 00 01 	bl      74 <.audit_classes_init+0x74>
			74: R_PPC64_REL24	.audit_register_class
   78:	60 00 00 00 	nop
   7c:	7f e4 fb 78 	mr      r4,r31
   80:	38 60 00 06 	li      r3,6
   84:	48 00 00 01 	bl      84 <.audit_classes_init+0x84>
			84: R_PPC64_REL24	.audit_register_class
   88:	60 00 00 00 	nop
   8c:	38 9f 00 5c 	addi    r4,r31,92
   90:	38 60 00 04 	li      r3,4
   94:	48 00 00 01 	bl      94 <.audit_classes_init+0x94>
			94: R_PPC64_REL24	.audit_register_class
   98:	60 00 00 00 	nop
   9c:	38 9f 00 84 	addi    r4,r31,132
   a0:	38 60 00 00 	li      r3,0
   a4:	48 00 00 01 	bl      a4 <.audit_classes_init+0xa4>
			a4: R_PPC64_REL24	.audit_register_class
   a8:	60 00 00 00 	nop
   ac:	38 9f 00 c4 	addi    r4,r31,196
   b0:	38 60 00 02 	li      r3,2
   b4:	48 00 00 01 	bl      b4 <.audit_classes_init+0xb4>
			b4: R_PPC64_REL24	.audit_register_class
   b8:	60 00 00 00 	nop
   bc:	38 9f 01 04 	addi    r4,r31,260
   c0:	38 60 00 08 	li      r3,8
   c4:	48 00 00 01 	bl      c4 <.audit_classes_init+0xc4>
			c4: R_PPC64_REL24	.audit_register_class
   c8:	60 00 00 00 	nop
   cc:	38 60 00 00 	li      r3,0
   d0:	38 21 00 80 	addi    r1,r1,128
   d4:	e8 01 00 10 	ld      r0,16(r1)
   d8:	eb e1 ff f8 	ld      r31,-8(r1)
   dc:	7c 08 03 a6 	mtlr    r0
   e0:	4e 80 00 20 	blr


lib/audit.o:     file format elf64-powerpc


Disassembly of section .text:

0000000000000000 <.audit_classify_arch>:
    0:	7c 63 18 f8 	not     r3,r3
    4:	54 63 0f fe 	rlwinm  r3,r3,1,31,31
    8:	4e 80 00 20 	blr
    c:	60 00 00 00 	nop

0000000000000010 <.audit_classify_syscall>:
   10:	2c 03 00 00 	cmpwi   r3,0
   14:	40 80 00 4c 	bge     60 <.audit_classify_syscall+0x50>
   18:	28 04 00 66 	cmplwi  r4,102
   1c:	41 82 00 74 	beq     90 <.audit_classify_syscall+0x80>
   20:	41 81 00 20 	bgt     40 <.audit_classify_syscall+0x30>
   24:	28 04 00 05 	cmplwi  r4,5
   28:	38 60 00 02 	li      r3,2
   2c:	4d 82 00 20 	beqlr
   30:	28 04 00 0b 	cmplwi  r4,11
   34:	41 82 00 20 	beq     54 <.audit_classify_syscall+0x44>
   38:	38 60 00 00 	li      r3,0
   3c:	4e 80 00 20 	blr
   40:	28 04 01 1e 	cmplwi  r4,286
   44:	38 60 00 03 	li      r3,3
   48:	4d 82 00 20 	beqlr
   4c:	28 04 01 6a 	cmplwi  r4,362
   50:	40 82 ff e8 	bne     38 <.audit_classify_syscall+0x28>
   54:	38 60 00 05 	li      r3,5
   58:	4e 80 00 20 	blr
   5c:	60 00 00 00 	nop
   60:	7c 08 02 a6 	mflr    r0
   64:	f8 01 00 10 	std     r0,16(r1)
   68:	f8 21 ff 91 	stdu    r1,-112(r1)
   6c:	48 00 00 01 	bl      6c <.audit_classify_syscall+0x5c>
			6c: R_PPC64_REL24	.audit_classify_compat_syscall
   70:	60 00 00 00 	nop
   74:	38 21 00 70 	addi    r1,r1,112
   78:	e8 01 00 10 	ld      r0,16(r1)
   7c:	7c 08 03 a6 	mtlr    r0
   80:	4e 80 00 20 	blr
   84:	60 00 00 00 	nop
   88:	60 00 00 00 	nop
   8c:	60 00 00 00 	nop
   90:	38 60 00 04 	li      r3,4
   94:	4e 80 00 20 	blr

Disassembly of section .init.text:

0000000000000000 <.audit_classes_init>:
    0:	7c 08 02 a6 	mflr    r0
    4:	fb e1 ff f8 	std     r31,-8(r1)
    8:	3d 22 00 00 	addis   r9,r2,0
			a: R_PPC64_TOC16_HA	.toc
    c:	38 60 00 07 	li      r3,7
   10:	e8 89 00 00 	ld      r4,0(r9)
			12: R_PPC64_TOC16_LO_DS	.toc
   14:	3f e2 00 00 	addis   r31,r2,0
			16: R_PPC64_TOC16_HA	.data
   18:	3b ff 00 00 	addi    r31,r31,0
			1a: R_PPC64_TOC16_LO	.data
   1c:	f8 01 00 10 	std     r0,16(r1)
   20:	f8 21 ff 81 	stdu    r1,-128(r1)
   24:	48 00 00 01 	bl      24 <.audit_classes_init+0x24>
			24: R_PPC64_REL24	.audit_register_class
   28:	60 00 00 00 	nop
   2c:	3d 22 00 00 	addis   r9,r2,0
			2e: R_PPC64_TOC16_HA	.toc+0x8
   30:	38 60 00 05 	li      r3,5
   34:	e8 89 00 00 	ld      r4,0(r9)
			36: R_PPC64_TOC16_LO_DS	.toc+0x8
   38:	48 00 00 01 	bl      38 <.audit_classes_init+0x38>
			38: R_PPC64_REL24	.audit_register_class
   3c:	60 00 00 00 	nop
   40:	3d 22 00 00 	addis   r9,r2,0
			42: R_PPC64_TOC16_HA	.toc+0x10
   44:	38 60 00 01 	li      r3,1
   48:	e8 89 00 00 	ld      r4,0(r9)
			4a: R_PPC64_TOC16_LO_DS	.toc+0x10
   4c:	48 00 00 01 	bl      4c <.audit_classes_init+0x4c>
			4c: R_PPC64_REL24	.audit_register_class
   50:	60 00 00 00 	nop
   54:	3d 22 00 00 	addis   r9,r2,0
			56: R_PPC64_TOC16_HA	.toc+0x18
   58:	38 60 00 03 	li      r3,3
   5c:	e8 89 00 00 	ld      r4,0(r9)
			5e: R_PPC64_TOC16_LO_DS	.toc+0x18
   60:	48 00 00 01 	bl      60 <.audit_classes_init+0x60>
			60: R_PPC64_REL24	.audit_register_class
   64:	60 00 00 00 	nop
   68:	3d 22 00 00 	addis   r9,r2,0
			6a: R_PPC64_TOC16_HA	.toc+0x20
   6c:	38 60 00 09 	li      r3,9
   70:	e8 89 00 00 	ld      r4,0(r9)
			72: R_PPC64_TOC16_LO_DS	.toc+0x20
   74:	48 00 00 01 	bl      74 <.audit_classes_init+0x74>
			74: R_PPC64_REL24	.audit_register_class
   78:	60 00 00 00 	nop
   7c:	7f e4 fb 78 	mr      r4,r31
   80:	38 60 00 06 	li      r3,6
   84:	48 00 00 01 	bl      84 <.audit_classes_init+0x84>
			84: R_PPC64_REL24	.audit_register_class
   88:	60 00 00 00 	nop
   8c:	38 9f 00 5c 	addi    r4,r31,92
   90:	38 60 00 04 	li      r3,4
   94:	48 00 00 01 	bl      94 <.audit_classes_init+0x94>
			94: R_PPC64_REL24	.audit_register_class
   98:	60 00 00 00 	nop
   9c:	38 9f 00 84 	addi    r4,r31,132
   a0:	38 60 00 00 	li      r3,0
   a4:	48 00 00 01 	bl      a4 <.audit_classes_init+0xa4>
			a4: R_PPC64_REL24	.audit_register_class
   a8:	60 00 00 00 	nop
   ac:	38 9f 00 c4 	addi    r4,r31,196
   b0:	38 60 00 02 	li      r3,2
   b4:	48 00 00 01 	bl      b4 <.audit_classes_init+0xb4>
			b4: R_PPC64_REL24	.audit_register_class
   b8:	60 00 00 00 	nop
   bc:	38 9f 01 04 	addi    r4,r31,260
   c0:	38 60 00 08 	li      r3,8
   c4:	48 00 00 01 	bl      c4 <.audit_classes_init+0xc4>
			c4: R_PPC64_REL24	.audit_register_class
   c8:	60 00 00 00 	nop
   cc:	38 60 00 00 	li      r3,0
   d0:	38 21 00 80 	addi    r1,r1,128
   d4:	e8 01 00 10 	ld      r0,16(r1)
   d8:	eb e1 ff f8 	ld      r31,-8(r1)
   dc:	7c 08 03 a6 	mtlr    r0
   e0:	4e 80 00 20 	blr

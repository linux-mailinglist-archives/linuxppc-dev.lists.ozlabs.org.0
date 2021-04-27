Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99736BF60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 08:40:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTsZk5mj7z30Dq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 16:40:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTsZJ40vjz2xfk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 16:39:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FTsZ85kqlz4nl;
 Tue, 27 Apr 2021 08:39:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WDzfQGNzyGc1; Tue, 27 Apr 2021 08:39:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FTsZ84lNXz4nk;
 Tue, 27 Apr 2021 08:39:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8B8E48B77F;
 Tue, 27 Apr 2021 08:39:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GUT3BZWyiBHb; Tue, 27 Apr 2021 08:39:44 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC88D8B777;
 Tue, 27 Apr 2021 08:39:43 +0200 (CEST)
Subject: Re: [PATCH v7] powerpc/irq: Inline call_do_irq() and call_do_softirq()
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210320122227.345427-1-mpe@ellerman.id.au>
 <YIcLcujmoK6Yet9d@archlinux-ax161>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <de6fc09f-97f5-c934-6393-998ec766b48a@csgroup.eu>
Date: Tue, 27 Apr 2021 08:39:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <YIcLcujmoK6Yet9d@archlinux-ax161>
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/04/2021 à 20:50, Nathan Chancellor a écrit :
> On Sat, Mar 20, 2021 at 11:22:27PM +1100, Michael Ellerman wrote:
>> From: Christophe Leroy <christophe.leroy@csgroup.eu>
>>
>> call_do_irq() and call_do_softirq() are simple enough to be
>> worth inlining.
>>
>> Inlining them avoids an mflr/mtlr pair plus a save/reload on stack. It
>> also allows GCC to keep the saved ksp_limit in an nonvolatile reg.
>>
>> This is inspired from S390 arch. Several other arches do more or
>> less the same. The way sparc arch does seems odd thought.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>>
> 
> This change caused our ppc44x_defconfig builds to hang when powering
> down in QEMU:
> 
> https://github.com/ClangBuiltLinux/continuous-integration2/runs/2304364629?check_suite_focus=true#logs
> 
> This is probably something with clang given that GCC 10.3.0 works fine
> but due to the nature of the change, I have no idea how to tell what is
> going wrong. I tried to do some rudimentary debugging with gdb but that
> did not really get me anywhere.
> 
> The kernel was built with just 'CC=clang' and it is reproducible with
> all versions of clang that the kernel supports.
> 
> The QEMU invocation is visible at the link above, it is done with our
> boot-qemu.sh in this repo, which also houses the rootfs:
> 
> https://github.com/ClangBuiltLinux/boot-utils
> 
> Happy to provide any other information or debug/test as directed!
> 

With GCC:

000003f0 <do_softirq_own_stack>:
  3f0:	94 21 ff f0 	stwu    r1,-16(r1)
  3f4:	7c 08 02 a6 	mflr    r0
  3f8:	3d 20 00 00 	lis     r9,0
			3fa: R_PPC_ADDR16_HA	.data..read_mostly+0x4
  3fc:	93 e1 00 0c 	stw     r31,12(r1)
  400:	90 01 00 14 	stw     r0,20(r1)
  404:	83 e9 00 00 	lwz     r31,0(r9)
			406: R_PPC_ADDR16_LO	.data..read_mostly+0x4
  408:	94 3f 1f f0 	stwu    r1,8176(r31)
  40c:	7f e1 fb 78 	mr      r1,r31
  410:	48 00 00 01 	bl      410 <do_softirq_own_stack+0x20>
			410: R_PPC_REL24	__do_softirq
  414:	80 21 00 00 	lwz     r1,0(r1)
  418:	80 01 00 14 	lwz     r0,20(r1)
  41c:	83 e1 00 0c 	lwz     r31,12(r1)
  420:	38 21 00 10 	addi    r1,r1,16
  424:	7c 08 03 a6 	mtlr    r0
  428:	4e 80 00 20 	blr


With CLANG:

000003e8 <do_softirq_own_stack>:
  3e8:	94 21 ff f0 	stwu    r1,-16(r1)
  3ec:	93 c1 00 08 	stw     r30,8(r1)
  3f0:	3c 60 00 00 	lis     r3,0
			3f2: R_PPC_ADDR16_HA	softirq_ctx
  3f4:	83 c3 00 00 	lwz     r30,0(r3)
			3f6: R_PPC_ADDR16_LO	softirq_ctx
  3f8:	94 3e 1f f0 	stwu    r1,8176(r30)
  3fc:	7f c1 f3 78 	mr      r1,r30
  400:	48 00 00 01 	bl      400 <do_softirq_own_stack+0x18>
			400: R_PPC_REL24	__do_softirq
  404:	80 21 00 00 	lwz     r1,0(r1)
  408:	83 c1 00 08 	lwz     r30,8(r1)
  40c:	38 21 00 10 	addi    r1,r1,16
  410:	4e 80 00 20 	blr


As you can see, CLANG doesn't save/restore 'lr' allthought 'lr' is explicitely listed in the 
registers clobbered by the inline assembly:

 >> +static __always_inline void call_do_softirq(const void *sp)
 >> +{
 >> +	/* Temporarily switch r1 to sp, call __do_softirq() then restore r1. */
 >> +	asm volatile (
 >> +		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
 >> +		"mr		%%r1, %[sp]		;"
 >> +		"bl		%[callee]		;"
 >> +		 PPC_LL "	%%r1, 0(%%r1)		;"
 >> +		 : // Outputs
 >> +		 : // Inputs
 >> +		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
 >> +		   [callee] "i" (__do_softirq)
 >> +		 : // Clobbers
 >> +		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
 >> +		   "cr7", "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
 >> +		   "r11", "r12"
 >> +	);

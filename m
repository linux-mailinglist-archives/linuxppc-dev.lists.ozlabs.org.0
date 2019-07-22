Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC346F744
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 04:43:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45sQs82d28zDqPv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 12:43:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::343; helo=mail-wm1-x343.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="sLB7Ghof"; 
 dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45sQqJ5PqhzDqKH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 12:41:48 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id v19so33764008wmj.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Jul 2019 19:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pPpIaNLQF1tYH4Gfl3jia7C14Lw+otLIe/3ei3vnPHs=;
 b=sLB7GhofPFZ5SYPVDuVZlXMpNNlMRtuES+25pXgCvgLJPuadSzAUx5Jbmgwq/JFJ9h
 yO9m6cvFdThjorC34g+cjoFFhpJFSLU5Hh7c8KlutAKpb7US5ajp7X/bVFy92dqO89dk
 A8uo267m106oLEz8RAHfR5UMiCiRjfuH0juHcPuPHlPdrOPjNGwKBX3dpubePRKY8IqU
 TKFCd19MCezBwIv9IjYYX1DHjnx8fnr0uMlAwH19hZWVz0bGVQDPnlZmcMK466xFD3K+
 PFZbmaypa4eJqhjKO5P77VKvQVFCLkZM0shjYH12V4hHh7FnrzRwSxbkBib3P/iENaED
 EQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pPpIaNLQF1tYH4Gfl3jia7C14Lw+otLIe/3ei3vnPHs=;
 b=WsGpb/teV9lOCeWJW0WiZ92Je+H1qyyHyKP0k+JJPf9zJ/aDxt5ofndI5ZHXS7bL83
 7zhj5j6MHB78bByV0W5aOZVnAmzWsjcSlct+XYr4YTe+luUBBYUHx5+e1S1WVcyh3RVR
 Byy1xHbMrOi4MDONh5QGelu2WJM9enN05hheqDYh7A5mKzqNHFnOZCM0SM+cEw/oM7Qk
 ML8ToGlKy/vYblV6oUwHsjnXIBcLg9QZYOOWbEqvoSjVSLCWIKLHqZ6383YNpcyDvQ9H
 T2g0huGaKFl8S9xQ1XDVYCdpvqjN0I0u1pJeqqH7nyQ1d63/FDLU2J07pFqTy3OmftLa
 TMwg==
X-Gm-Message-State: APjAAAW2fXeedAN6CaSj1mz0r1/ts8eQnIoQiVMzlqC8SmhKr1oOSgSl
 sLMH2fxu8u207ddPMz+CjBw=
X-Google-Smtp-Source: APXvYqx1EumfogFI6bF7CUKrs6P6jGGQhRz0yUURcnZKT5wjZtyt8HwVEiTqC5DtRkMGoBh275xdSg==
X-Received: by 2002:a1c:1d08:: with SMTP id d8mr58946832wmd.22.1563763303934; 
 Sun, 21 Jul 2019 19:41:43 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id i6sm30907180wrv.47.2019.07.21.19.41.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 21 Jul 2019 19:41:42 -0700 (PDT)
Date: Sun, 21 Jul 2019 19:41:40 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v2] powerpc: slightly improve cache helpers
Message-ID: <20190722024140.GA55142@archlinux-threadripper>
References: <c6ff2faba7fbb56a7f5b5f08cd3453f89fc0aaf4.1557480165.git.christophe.leroy@c-s.fr>
 <45hnfp6SlLz9sP0@ozlabs.org>
 <20190708191416.GA21442@archlinux-threadripper>
 <a5864549-40c3-badd-8c41-d5b7bf3c4f3c@c-s.fr>
 <20190709064952.GA40851@archlinux-threadripper>
 <20190719032456.GA14108@archlinux-threadripper>
 <20190719152303.GA20882@gate.crashing.org>
 <20190719160455.GA12420@archlinux-threadripper>
 <20190721075846.GA97701@archlinux-threadripper>
 <20190721180150.GN20882@gate.crashing.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="HcAYCG3uE/tztfnV"
Content-Disposition: inline
In-Reply-To: <20190721180150.GN20882@gate.crashing.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Segher,

On Sun, Jul 21, 2019 at 01:01:50PM -0500, Segher Boessenkool wrote:
> On Sun, Jul 21, 2019 at 12:58:46AM -0700, Nathan Chancellor wrote:
> > I have attached the disassembly of arch/powerpc/kernel/mem.o with
> > clear_page (working) and broken_clear_page (broken), along with the side
> > by side diff. My assembly knowledge is fairly limited as it stands and
> > it is certainly not up to snuff on PowerPC so I have no idea what I am
> > looking for. Please let me know if anything immediately looks off or if
> > there is anything else I can do to help out.
> 
> You might want to use a disassembler that shows most simplified mnemonics,
> and you crucially should show the relocations.  "objdump -dr" works nicely.

Copy, those are attached below if you want to take a further look at
them.

> > 0000017c clear_user_page:
> >      17c: 38 80 00 80                  	li 4, 128
> >      180: 7c 89 03 a6                  	mtctr 4
> >      184: 7c 00 1f ec                  	dcbz 0, 3
> >      188: 38 63 00 20                  	addi 3, 3, 32
> >      18c: 42 00 ff f8                  	bdnz .+65528
> 
> That offset is incorrectly disassembled, btw (it's a signed field, not
> unsigned).
> 
> > 0000017c clear_user_page:
> >      17c: 94 21 ff f0                  	stwu 1, -16(1)
> >      180: 38 80 00 80                  	li 4, 128
> >      184: 38 63 ff e0                  	addi 3, 3, -32
> >      188: 7c 89 03 a6                  	mtctr 4
> >      18c: 38 81 00 0f                  	addi 4, 1, 15
> >      190: 8c c3 00 20                  	lbzu 6, 32(3)
> >      194: 98 c1 00 0f                  	stb 6, 15(1)
> >      198: 7c 00 27 ec                  	dcbz 0, 4
> >      19c: 42 00 ff f4                  	bdnz .+65524
> 
> Uh, yeah, well, I have no idea what clang tried here, but that won't
> work.  It's copying a byte from each target cache line to the stack,
> and then does clears the cache line containing that byte on the stack.
> 
> I *guess* this is about "Z" and not about "%y", but you'll have to ask
> the clang people.
> 
> Or it may be that they do not treat inline asm operands as lvalues
> properly?  That rings some bells.  Yeah that looks like it.
> 
> 
> Segher

Okay, I think I understand... I think this is enough to bring up an LLVM
bug report but I'll ask some of the LLVM folks I know before doing so.

Thank you for all of the input, I really appreciate it,
Nathan

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mem-working.txt"


mem-working.o:     file format elf32-powerpc


Disassembly of section .text:

00000000 <phys_mem_access_prot>:
   0:	7c 08 02 a6 	mflr    r0
   4:	90 01 00 04 	stw     r0,4(r1)
   8:	94 21 ff e0 	stwu    r1,-32(r1)
   c:	93 a1 00 14 	stw     r29,20(r1)
  10:	7c fd 3b 78 	mr      r29,r7
  14:	3c e0 00 00 	lis     r7,0
			16: R_PPC_ADDR16_HA	ppc_md
  18:	38 e7 00 00 	addi    r7,r7,0
			1a: R_PPC_ADDR16_LO	ppc_md
  1c:	81 07 00 a0 	lwz     r8,160(r7)
  20:	93 c1 00 18 	stw     r30,24(r1)
  24:	28 08 00 00 	cmplwi  r8,0
  28:	7c 7e 1b 78 	mr      r30,r3
  2c:	41 82 00 20 	beq     4c <phys_mem_access_prot+0x4c>
  30:	80 7d 00 00 	lwz     r3,0(r29)
  34:	38 e1 00 08 	addi    r7,r1,8
  38:	7d 09 03 a6 	mtctr   r8
  3c:	90 61 00 08 	stw     r3,8(r1)
  40:	7f c3 f3 78 	mr      r3,r30
  44:	4e 80 04 21 	bctrl
  48:	48 00 00 28 	b       70 <phys_mem_access_prot+0x70>
  4c:	7c a3 2b 78 	mr      r3,r5
  50:	48 00 00 01 	bl      50 <phys_mem_access_prot+0x50>
			50: R_PPC_PLTREL24	page_is_ram
  54:	28 03 00 00 	cmplwi  r3,0
  58:	80 7d 00 00 	lwz     r3,0(r29)
  5c:	40 82 00 10 	bne     6c <phys_mem_access_prot+0x6c>
  60:	54 63 06 26 	rlwinm  r3,r3,0,24,19
  64:	60 63 05 00 	ori     r3,r3,1280
  68:	90 7d 00 00 	stw     r3,0(r29)
  6c:	90 7e 00 00 	stw     r3,0(r30)
  70:	83 c1 00 18 	lwz     r30,24(r1)
  74:	83 a1 00 14 	lwz     r29,20(r1)
  78:	80 01 00 24 	lwz     r0,36(r1)
  7c:	38 21 00 20 	addi    r1,r1,32
  80:	7c 08 03 a6 	mtlr    r0
  84:	4e 80 00 20 	blr

00000088 <free_initmem>:
  88:	7c 08 02 a6 	mflr    r0
  8c:	90 01 00 04 	stw     r0,4(r1)
  90:	94 21 ff f0 	stwu    r1,-16(r1)
  94:	3c 60 00 00 	lis     r3,0
			96: R_PPC_ADDR16_HA	ppc_md
  98:	3c 80 00 00 	lis     r4,0
			9a: R_PPC_ADDR16_HA	ppc_printk_progress
  9c:	38 63 00 00 	addi    r3,r3,0
			9e: R_PPC_ADDR16_LO	ppc_md
  a0:	38 84 00 00 	addi    r4,r4,0
			a2: R_PPC_ADDR16_LO	ppc_printk_progress
  a4:	90 83 00 60 	stw     r4,96(r3)
  a8:	48 00 00 01 	bl      a8 <free_initmem+0x20>
			a8: R_PPC_PLTREL24	mark_initmem_nx
  ac:	3c 60 00 00 	lis     r3,0
			ae: R_PPC_ADDR16_HA	init_mem_is_free
  b0:	38 80 00 01 	li      r4,1
  b4:	98 83 00 00 	stb     r4,0(r3)
			b6: R_PPC_ADDR16_LO	init_mem_is_free
  b8:	3c 60 00 00 	lis     r3,0
			ba: R_PPC_ADDR16_HA	__init_begin
  bc:	3c 80 00 00 	lis     r4,0
			be: R_PPC_ADDR16_HA	__init_end
  c0:	3c a0 00 00 	lis     r5,0
			c2: R_PPC_ADDR16_HA	.rodata.str1.1+0x107
  c4:	38 63 00 00 	addi    r3,r3,0
			c6: R_PPC_ADDR16_LO	__init_begin
  c8:	38 84 00 00 	addi    r4,r4,0
			ca: R_PPC_ADDR16_LO	__init_end
  cc:	38 c5 00 00 	addi    r6,r5,0
			ce: R_PPC_ADDR16_LO	.rodata.str1.1+0x107
  d0:	38 a0 00 cc 	li      r5,204
  d4:	48 00 00 01 	bl      d4 <free_initmem+0x4c>
			d4: R_PPC_PLTREL24	free_reserved_area
  d8:	80 01 00 14 	lwz     r0,20(r1)
  dc:	38 21 00 10 	addi    r1,r1,16
  e0:	7c 08 03 a6 	mtlr    r0
  e4:	4e 80 00 20 	blr

000000e8 <flush_dcache_page>:
  e8:	80 83 00 00 	lwz     r4,0(r3)
  ec:	70 84 08 00 	andi.   r4,r4,2048
  f0:	4d 82 00 20 	beqlr
  f4:	38 80 08 00 	li      r4,2048
  f8:	7c a0 18 28 	lwarx   r5,0,r3
  fc:	7c a5 20 78 	andc    r5,r5,r4
 100:	7c a0 19 2d 	stwcx.  r5,0,r3
 104:	40 a2 ff f4 	bne     f8 <flush_dcache_page+0x10>
 108:	4e 80 00 20 	blr

0000010c <flush_dcache_icache_page>:
 10c:	7c 08 02 a6 	mflr    r0
 110:	90 01 00 04 	stw     r0,4(r1)
 114:	94 21 ff f0 	stwu    r1,-16(r1)
 118:	80 82 00 00 	lwz     r4,0(r2)
 11c:	38 84 00 01 	addi    r4,r4,1
 120:	90 82 00 00 	stw     r4,0(r2)
 124:	80 82 0a e4 	lwz     r4,2788(r2)
 128:	38 84 00 01 	addi    r4,r4,1
 12c:	90 82 0a e4 	stw     r4,2788(r2)
 130:	3c 80 00 00 	lis     r4,0
			132: R_PPC_ADDR16_HA	mem_map
 134:	80 84 00 00 	lwz     r4,0(r4)
			136: R_PPC_ADDR16_LO	mem_map
 138:	7c 64 18 50 	subf    r3,r4,r3
 13c:	3c 80 cc cc 	lis     r4,-13108
 140:	54 63 e8 fe 	rlwinm  r3,r3,29,3,31
 144:	60 84 d0 00 	ori     r4,r4,53248
 148:	7c 63 21 d6 	mullw   r3,r3,r4
 14c:	3c 63 c0 00 	addis   r3,r3,-16384
 150:	48 00 00 01 	bl      150 <flush_dcache_icache_page+0x44>
			150: R_PPC_PLTREL24	__flush_dcache_icache
 154:	80 62 0a e4 	lwz     r3,2788(r2)
 158:	38 63 ff ff 	addi    r3,r3,-1
 15c:	90 62 0a e4 	stw     r3,2788(r2)
 160:	80 62 00 00 	lwz     r3,0(r2)
 164:	38 63 ff ff 	addi    r3,r3,-1
 168:	90 62 00 00 	stw     r3,0(r2)
 16c:	80 01 00 14 	lwz     r0,20(r1)
 170:	38 21 00 10 	addi    r1,r1,16
 174:	7c 08 03 a6 	mtlr    r0
 178:	4e 80 00 20 	blr

0000017c <clear_user_page>:
 17c:	38 80 00 80 	li      r4,128
 180:	7c 89 03 a6 	mtctr   r4
 184:	7c 00 1f ec 	dcbz    0,r3
 188:	38 63 00 20 	addi    r3,r3,32
 18c:	42 00 ff f8 	bdnz    184 <clear_user_page+0x8>
 190:	80 65 00 00 	lwz     r3,0(r5)
 194:	70 63 08 00 	andi.   r3,r3,2048
 198:	4d 82 00 20 	beqlr
 19c:	38 60 08 00 	li      r3,2048
 1a0:	7c 80 28 28 	lwarx   r4,0,r5
 1a4:	7c 84 18 78 	andc    r4,r4,r3
 1a8:	7c 80 29 2d 	stwcx.  r4,0,r5
 1ac:	40 a2 ff f4 	bne     1a0 <clear_user_page+0x24>
 1b0:	4e 80 00 20 	blr

000001b4 <copy_user_page>:
 1b4:	7c 08 02 a6 	mflr    r0
 1b8:	90 01 00 04 	stw     r0,4(r1)
 1bc:	94 21 ff f0 	stwu    r1,-16(r1)
 1c0:	93 c1 00 08 	stw     r30,8(r1)
 1c4:	7c de 33 78 	mr      r30,r6
 1c8:	48 00 00 01 	bl      1c8 <copy_user_page+0x14>
			1c8: R_PPC_PLTREL24	copy_page
 1cc:	80 7e 00 00 	lwz     r3,0(r30)
 1d0:	70 63 08 00 	andi.   r3,r3,2048
 1d4:	41 82 00 18 	beq     1ec <copy_user_page+0x38>
 1d8:	38 60 08 00 	li      r3,2048
 1dc:	7c 80 f0 28 	lwarx   r4,0,r30
 1e0:	7c 84 18 78 	andc    r4,r4,r3
 1e4:	7c 80 f1 2d 	stwcx.  r4,0,r30
 1e8:	40 a2 ff f4 	bne     1dc <copy_user_page+0x28>
 1ec:	83 c1 00 08 	lwz     r30,8(r1)
 1f0:	80 01 00 14 	lwz     r0,20(r1)
 1f4:	38 21 00 10 	addi    r1,r1,16
 1f8:	7c 08 03 a6 	mtlr    r0
 1fc:	4e 80 00 20 	blr

00000200 <flush_icache_user_range>:
 200:	7c 08 02 a6 	mflr    r0
 204:	90 01 00 04 	stw     r0,4(r1)
 208:	94 21 ff e0 	stwu    r1,-32(r1)
 20c:	3c 60 00 00 	lis     r3,0
			20e: R_PPC_ADDR16_HA	.rodata.str1.1+0x115
 210:	93 81 00 10 	stw     r28,16(r1)
 214:	7c 9c 23 78 	mr      r28,r4
 218:	38 63 00 00 	addi    r3,r3,0
			21a: R_PPC_ADDR16_LO	.rodata.str1.1+0x115
 21c:	38 80 00 53 	li      r4,83
 220:	93 a1 00 14 	stw     r29,20(r1)
 224:	7c bd 2b 78 	mr      r29,r5
 228:	38 a0 00 00 	li      r5,0
 22c:	93 c1 00 18 	stw     r30,24(r1)
 230:	7c de 33 78 	mr      r30,r6
 234:	48 00 00 01 	bl      234 <flush_icache_user_range+0x34>
			234: R_PPC_PLTREL24	__might_sleep
 238:	3c 60 00 00 	lis     r3,0
			23a: R_PPC_ADDR16_HA	mem_map
 23c:	3c 80 cc cc 	lis     r4,-13108
 240:	80 63 00 00 	lwz     r3,0(r3)
			242: R_PPC_ADDR16_LO	mem_map
 244:	60 84 d0 00 	ori     r4,r4,53248
 248:	7c 63 e0 50 	subf    r3,r3,r28
 24c:	54 63 e8 fe 	rlwinm  r3,r3,29,3,31
 250:	7c 63 21 d6 	mullw   r3,r3,r4
 254:	57 a4 05 3e 	clrlwi  r4,r29,20
 258:	50 64 00 26 	rlwimi  r4,r3,0,0,19
 25c:	3c 64 c0 00 	addis   r3,r4,-16384
 260:	7c 83 f2 14 	add     r4,r3,r30
 264:	48 00 00 01 	bl      264 <flush_icache_user_range+0x64>
			264: R_PPC_PLTREL24	flush_icache_range
 268:	83 c1 00 18 	lwz     r30,24(r1)
 26c:	83 a1 00 14 	lwz     r29,20(r1)
 270:	83 81 00 10 	lwz     r28,16(r1)
 274:	80 01 00 24 	lwz     r0,36(r1)
 278:	38 21 00 20 	addi    r1,r1,32
 27c:	7c 08 03 a6 	mtlr    r0
 280:	4e 80 00 20 	blr

00000284 <update_mmu_cache>:
 284:	4e 80 00 20 	blr

00000288 <devmem_is_allowed>:
 288:	7c 08 02 a6 	mflr    r0
 28c:	90 01 00 04 	stw     r0,4(r1)
 290:	94 21 ff f0 	stwu    r1,-16(r1)
 294:	93 c1 00 08 	stw     r30,8(r1)
 298:	7c 7e 1b 78 	mr      r30,r3
 29c:	54 63 65 3e 	rlwinm  r3,r3,12,20,31
 2a0:	57 c4 60 26 	rlwinm  r4,r30,12,0,19
 2a4:	48 00 00 01 	bl      2a4 <devmem_is_allowed+0x1c>
			2a4: R_PPC_PLTREL24	iomem_is_exclusive
 2a8:	70 63 00 01 	andi.   r3,r3,1
 2ac:	38 60 00 00 	li      r3,0
 2b0:	41 81 00 14 	bgt     2c4 <devmem_is_allowed+0x3c>
 2b4:	7f c3 f3 78 	mr      r3,r30
 2b8:	48 00 00 01 	bl      2b8 <devmem_is_allowed+0x30>
			2b8: R_PPC_PLTREL24	page_is_ram
 2bc:	7c 63 00 34 	cntlzw  r3,r3
 2c0:	54 63 df fe 	rlwinm  r3,r3,27,31,31
 2c4:	83 c1 00 08 	lwz     r30,8(r1)
 2c8:	80 01 00 14 	lwz     r0,20(r1)
 2cc:	38 21 00 10 	addi    r1,r1,16
 2d0:	7c 08 03 a6 	mtlr    r0
 2d4:	4e 80 00 20 	blr

Disassembly of section .init.text:

00000000 <mem_topology_setup>:
   0:	7c 08 02 a6 	mflr    r0
   4:	90 01 00 04 	stw     r0,4(r1)
   8:	94 21 ff f0 	stwu    r1,-16(r1)
   c:	48 00 00 01 	bl      c <mem_topology_setup+0xc>
			c: R_PPC_PLTREL24	memblock_end_of_DRAM
  10:	54 84 a0 3e 	rotlwi  r4,r4,20
  14:	3c a0 00 00 	lis     r5,0
			16: R_PPC_ADDR16_HA	max_pfn
  18:	50 64 a0 16 	rlwimi  r4,r3,20,0,11
  1c:	3c 60 00 00 	lis     r3,0
			1e: R_PPC_ADDR16_HA	max_low_pfn
  20:	90 85 00 00 	stw     r4,0(r5)
			22: R_PPC_ADDR16_LO	max_pfn
  24:	38 a0 ff ff 	li      r5,-1
  28:	90 83 00 00 	stw     r4,0(r3)
			2a: R_PPC_ADDR16_LO	max_low_pfn
  2c:	3c 60 00 00 	lis     r3,0
			2e: R_PPC_ADDR16_HA	min_low_pfn
  30:	38 80 00 00 	li      r4,0
  34:	38 c0 ff ff 	li      r6,-1
  38:	39 00 00 00 	li      r8,0
  3c:	90 83 00 00 	stw     r4,0(r3)
			3e: R_PPC_ADDR16_LO	min_low_pfn
  40:	3c 60 00 00 	lis     r3,0
			42: R_PPC_ADDR16_HA	memblock
  44:	38 80 00 00 	li      r4,0
  48:	38 63 00 00 	addi    r3,r3,0
			4a: R_PPC_ADDR16_LO	memblock
  4c:	38 e3 00 10 	addi    r7,r3,16
  50:	38 60 00 00 	li      r3,0
  54:	48 00 00 01 	bl      54 <mem_topology_setup+0x54>
			54: R_PPC_PLTREL24	memblock_set_node
  58:	80 01 00 14 	lwz     r0,20(r1)
  5c:	38 21 00 10 	addi    r1,r1,16
  60:	7c 08 03 a6 	mtlr    r0
  64:	4e 80 00 20 	blr

00000068 <initmem_init>:
  68:	7c 08 02 a6 	mflr    r0
  6c:	90 01 00 04 	stw     r0,4(r1)
  70:	94 21 ff f0 	stwu    r1,-16(r1)
  74:	38 60 00 00 	li      r3,0
  78:	48 00 00 01 	bl      78 <initmem_init+0x10>
			78: R_PPC_PLTREL24	sparse_memory_present_with_active_regions
  7c:	80 01 00 14 	lwz     r0,20(r1)
  80:	38 21 00 10 	addi    r1,r1,16
  84:	7c 08 03 a6 	mtlr    r0
  88:	4e 80 00 20 	blr

0000008c <paging_init>:
  8c:	7c 08 02 a6 	mflr    r0
  90:	90 01 00 04 	stw     r0,4(r1)
  94:	94 21 ff d0 	stwu    r1,-48(r1)
  98:	93 21 00 14 	stw     r25,20(r1)
  9c:	93 41 00 18 	stw     r26,24(r1)
  a0:	93 61 00 1c 	stw     r27,28(r1)
  a4:	93 81 00 20 	stw     r28,32(r1)
  a8:	93 a1 00 24 	stw     r29,36(r1)
  ac:	93 c1 00 28 	stw     r30,40(r1)
  b0:	48 00 00 01 	bl      b0 <paging_init+0x24>
			b0: R_PPC_PLTREL24	memblock_phys_mem_size
  b4:	7c 7e 1b 78 	mr      r30,r3
  b8:	7c 9d 23 78 	mr      r29,r4
  bc:	3f 40 ff fe 	lis     r26,-2
  c0:	48 00 00 01 	bl      c0 <paging_init+0x34>
			c0: R_PPC_PLTREL24	memblock_end_of_DRAM
  c4:	7c 7c 1b 78 	mr      r28,r3
  c8:	7c 9b 23 78 	mr      r27,r4
  cc:	3b 20 00 00 	li      r25,0
  d0:	38 e1 00 08 	addi    r7,r1,8
  d4:	7f 43 d3 78 	mr      r3,r26
  d8:	93 21 00 10 	stw     r25,16(r1)
  dc:	38 a0 00 00 	li      r5,0
  e0:	38 c0 00 00 	li      r6,0
  e4:	93 21 00 08 	stw     r25,8(r1)
  e8:	48 00 00 01 	bl      e8 <paging_init+0x5c>
			e8: R_PPC_PLTREL24	map_kernel_page
  ec:	3b 5a 10 00 	addi    r26,r26,4096
  f0:	2c 1a f0 00 	cmpwi   r26,-4096
  f4:	40 82 ff dc 	bne     d0 <paging_init+0x44>
  f8:	3c 60 00 00 	lis     r3,0
			fa: R_PPC_ADDR16_HA	.rodata.str1.1
  fc:	4c c6 31 82 	crclr   4*cr1+eq
 100:	7f 85 e3 78 	mr      r5,r28
 104:	38 63 00 00 	addi    r3,r3,0
			106: R_PPC_ADDR16_LO	.rodata.str1.1
 108:	7f 66 db 78 	mr      r6,r27
 10c:	7f c7 f3 78 	mr      r7,r30
 110:	7f a8 eb 78 	mr      r8,r29
 114:	48 00 00 01 	bl      114 <paging_init+0x88>
			114: R_PPC_PLTREL24	printk
 118:	7c 7d d8 10 	subfc   r3,r29,r27
 11c:	4c c6 31 82 	crclr   4*cr1+eq
 120:	7c be e1 10 	subfe   r5,r30,r28
 124:	54 64 60 3e 	rotlwi  r4,r3,12
 128:	3c 60 00 00 	lis     r3,0
			12a: R_PPC_ADDR16_HA	.rodata.str1.1+0x29
 12c:	50 a4 60 26 	rlwimi  r4,r5,12,0,19
 130:	38 63 00 00 	addi    r3,r3,0
			132: R_PPC_ADDR16_LO	.rodata.str1.1+0x29
 134:	48 00 00 01 	bl      134 <paging_init+0xa8>
			134: R_PPC_PLTREL24	printk
 138:	3c 60 00 00 	lis     r3,0
			13a: R_PPC_ADDR16_HA	max_low_pfn
 13c:	80 83 00 00 	lwz     r4,0(r3)
			13e: R_PPC_ADDR16_LO	max_low_pfn
 140:	3c 60 00 00 	lis     r3,0
			142: R_PPC_ADDR16_HA	.bss+0x10
 144:	94 83 00 00 	stwu    r4,0(r3)
			146: R_PPC_ADDR16_LO	.bss+0x10
 148:	48 00 00 01 	bl      148 <paging_init+0xbc>
			148: R_PPC_PLTREL24	free_area_init_nodes
 14c:	83 c1 00 28 	lwz     r30,40(r1)
 150:	83 a1 00 24 	lwz     r29,36(r1)
 154:	83 81 00 20 	lwz     r28,32(r1)
 158:	83 61 00 1c 	lwz     r27,28(r1)
 15c:	83 41 00 18 	lwz     r26,24(r1)
 160:	83 21 00 14 	lwz     r25,20(r1)
 164:	80 01 00 34 	lwz     r0,52(r1)
 168:	38 21 00 30 	addi    r1,r1,48
 16c:	7c 08 03 a6 	mtlr    r0
 170:	4e 80 00 20 	blr

00000174 <mem_init>:
 174:	7c 08 02 a6 	mflr    r0
 178:	90 01 00 04 	stw     r0,4(r1)
 17c:	94 21 ff e0 	stwu    r1,-32(r1)
 180:	3c 60 00 00 	lis     r3,0
			182: R_PPC_ADDR16_HA	max_low_pfn
 184:	3c 80 00 00 	lis     r4,0
			186: R_PPC_ADDR16_HA	max_pfn
 188:	93 81 00 10 	stw     r28,16(r1)
 18c:	3f 80 00 00 	lis     r28,0
			18e: R_PPC_ADDR16_HA	high_memory
 190:	80 63 00 00 	lwz     r3,0(r3)
			192: R_PPC_ADDR16_LO	max_low_pfn
 194:	80 84 00 00 	lwz     r4,0(r4)
			196: R_PPC_ADDR16_LO	max_pfn
 198:	54 63 60 26 	rlwinm  r3,r3,12,0,19
 19c:	3c 63 c0 00 	addis   r3,r3,-16384
 1a0:	90 7c 00 00 	stw     r3,0(r28)
			1a2: R_PPC_ADDR16_LO	high_memory
 1a4:	3c 60 00 00 	lis     r3,0
			1a6: R_PPC_ADDR16_HA	max_mapnr
 1a8:	93 a1 00 14 	stw     r29,20(r1)
 1ac:	93 c1 00 18 	stw     r30,24(r1)
 1b0:	90 83 00 00 	stw     r4,0(r3)
			1b2: R_PPC_ADDR16_LO	max_mapnr
 1b4:	48 00 00 01 	bl      1b4 <mem_init+0x40>
			1b4: R_PPC_PLTREL24	memblock_free_all
 1b8:	38 60 00 00 	li      r3,0
 1bc:	48 00 00 01 	bl      1bc <mem_init+0x48>
			1bc: R_PPC_PLTREL24	mem_init_print_info
 1c0:	3c 60 00 00 	lis     r3,0
			1c2: R_PPC_ADDR16_HA	.rodata.str1.1+0x44
 1c4:	4c c6 31 82 	crclr   4*cr1+eq
 1c8:	38 63 00 00 	addi    r3,r3,0
			1ca: R_PPC_ADDR16_LO	.rodata.str1.1+0x44
 1cc:	48 00 00 01 	bl      1cc <mem_init+0x58>
			1cc: R_PPC_PLTREL24	printk
 1d0:	3c 80 ff fd 	lis     r4,-3
 1d4:	3c 60 00 00 	lis     r3,0
			1d6: R_PPC_ADDR16_HA	.rodata.str1.1+0x65
 1d8:	4c c6 31 82 	crclr   4*cr1+eq
 1dc:	60 9e f0 00 	ori     r30,r4,61440
 1e0:	38 63 00 00 	addi    r3,r3,0
			1e2: R_PPC_ADDR16_LO	.rodata.str1.1+0x65
 1e4:	7f c4 f3 78 	mr      r4,r30
 1e8:	38 a0 f0 00 	li      r5,-4096
 1ec:	48 00 00 01 	bl      1ec <mem_init+0x78>
			1ec: R_PPC_PLTREL24	printk
 1f0:	3c 80 ff dd 	lis     r4,-35
 1f4:	3c 60 00 00 	lis     r3,0
			1f6: R_PPC_ADDR16_HA	.rodata.str1.1+0x87
 1f8:	4c c6 31 82 	crclr   4*cr1+eq
 1fc:	60 9d f0 00 	ori     r29,r4,61440
 200:	38 63 00 00 	addi    r3,r3,0
			202: R_PPC_ADDR16_LO	.rodata.str1.1+0x87
 204:	7f a4 eb 78 	mr      r4,r29
 208:	7f c5 f3 78 	mr      r5,r30
 20c:	48 00 00 01 	bl      20c <mem_init+0x98>
			20c: R_PPC_PLTREL24	printk
 210:	3f c0 00 00 	lis     r30,0
			212: R_PPC_ADDR16_HA	ioremap_bot
 214:	3c 60 00 00 	lis     r3,0
			216: R_PPC_ADDR16_HA	.rodata.str1.1+0xb1
 218:	4c c6 31 82 	crclr   4*cr1+eq
 21c:	80 9e 00 00 	lwz     r4,0(r30)
			21e: R_PPC_ADDR16_LO	ioremap_bot
 220:	38 63 00 00 	addi    r3,r3,0
			222: R_PPC_ADDR16_LO	.rodata.str1.1+0xb1
 224:	7f a5 eb 78 	mr      r5,r29
 228:	48 00 00 01 	bl      228 <mem_init+0xb4>
			228: R_PPC_PLTREL24	printk
 22c:	80 7c 00 00 	lwz     r3,0(r28)
			22e: R_PPC_ADDR16_LO	high_memory
 230:	3c 80 01 00 	lis     r4,256
 234:	4c c6 31 82 	crclr   4*cr1+eq
 238:	38 63 ff ff 	addi    r3,r3,-1
 23c:	80 be 00 00 	lwz     r5,0(r30)
			23e: R_PPC_ADDR16_LO	ioremap_bot
 240:	3c 63 10 00 	addis   r3,r3,4096
 244:	54 63 00 06 	rlwinm  r3,r3,0,0,3
 248:	50 64 02 0c 	rlwimi  r4,r3,0,8,6
 24c:	3c 60 00 00 	lis     r3,0
			24e: R_PPC_ADDR16_HA	.rodata.str1.1+0xda
 250:	38 63 00 00 	addi    r3,r3,0
			252: R_PPC_ADDR16_LO	.rodata.str1.1+0xda
 254:	48 00 00 01 	bl      254 <mem_init+0xe0>
			254: R_PPC_PLTREL24	printk
 258:	83 c1 00 18 	lwz     r30,24(r1)
 25c:	83 a1 00 14 	lwz     r29,20(r1)
 260:	83 81 00 10 	lwz     r28,16(r1)
 264:	80 01 00 24 	lwz     r0,36(r1)
 268:	38 21 00 20 	addi    r1,r1,32
 26c:	7c 08 03 a6 	mtlr    r0
 270:	4e 80 00 20 	blr

00000274 <add_system_ram_resources>:
 274:	7c 08 02 a6 	mflr    r0
 278:	90 01 00 04 	stw     r0,4(r1)
 27c:	94 21 ff c0 	stwu    r1,-64(r1)
 280:	3c 60 00 00 	lis     r3,0
			282: R_PPC_ADDR16_HA	memblock
 284:	93 a1 00 34 	stw     r29,52(r1)
 288:	3b a3 00 00 	addi    r29,r3,0
			28a: R_PPC_ADDR16_LO	memblock
 28c:	80 7d 00 10 	lwz     r3,16(r29)
 290:	93 81 00 30 	stw     r28,48(r1)
 294:	1c 63 00 18 	mulli   r3,r3,24
 298:	83 9d 00 20 	lwz     r28,32(r29)
 29c:	7c 7c 1a 14 	add     r3,r28,r3
 2a0:	92 a1 00 14 	stw     r21,20(r1)
 2a4:	7c 1c 18 40 	cmplw   r28,r3
 2a8:	92 c1 00 18 	stw     r22,24(r1)
 2ac:	92 e1 00 1c 	stw     r23,28(r1)
 2b0:	93 01 00 20 	stw     r24,32(r1)
 2b4:	93 21 00 24 	stw     r25,36(r1)
 2b8:	93 41 00 28 	stw     r26,40(r1)
 2bc:	93 61 00 2c 	stw     r27,44(r1)
 2c0:	93 c1 00 38 	stw     r30,56(r1)
 2c4:	40 80 00 ac 	bge     370 <add_system_ram_resources+0xfc>
 2c8:	3c 60 00 00 	lis     r3,0
			2ca: R_PPC_ADDR16_HA	kmalloc_caches
 2cc:	3c 80 00 00 	lis     r4,0
			2ce: R_PPC_ADDR16_HA	.rodata.str1.1+0x199
 2d0:	3c a0 81 00 	lis     r5,-32512
 2d4:	3c c0 00 00 	lis     r6,0
			2d6: R_PPC_ADDR16_HA	iomem_resource
 2d8:	3b 7c ff e8 	addi    r27,r28,-24
 2dc:	3b 40 00 00 	li      r26,0
 2e0:	3b 23 00 00 	addi    r25,r3,0
			2e2: R_PPC_ADDR16_LO	kmalloc_caches
 2e4:	3b 04 00 00 	addi    r24,r4,0
			2e6: R_PPC_ADDR16_LO	.rodata.str1.1+0x199
 2e8:	60 b7 02 00 	ori     r23,r5,512
 2ec:	3b c6 00 00 	addi    r30,r6,0
			2ee: R_PPC_ADDR16_LO	iomem_resource
 2f0:	80 79 00 18 	lwz     r3,24(r25)
 2f4:	38 80 0d c0 	li      r4,3520
 2f8:	38 a0 00 28 	li      r5,40
 2fc:	82 db 00 1c 	lwz     r22,28(r27)
 300:	82 bb 00 24 	lwz     r21,36(r27)
 304:	48 00 00 01 	bl      304 <add_system_ram_resources+0x90>
			304: R_PPC_PLTREL24	kmem_cache_alloc_trace
 308:	7c 64 1b 78 	mr      r4,r3
 30c:	7c 63 00 34 	cntlzw  r3,r3
 310:	28 04 00 00 	cmplwi  r4,0
 314:	54 63 df fe 	rlwinm  r3,r3,27,31,31
 318:	0f 03 00 00 	twnei   r3,0
 31c:	41 82 00 34 	beq     350 <add_system_ram_resources+0xdc>
 320:	7c 76 aa 14 	add     r3,r22,r21
 324:	93 04 00 10 	stw     r24,16(r4)
 328:	38 63 ff ff 	addi    r3,r3,-1
 32c:	90 64 00 0c 	stw     r3,12(r4)
 330:	7f c3 f3 78 	mr      r3,r30
 334:	93 44 00 00 	stw     r26,0(r4)
 338:	92 c4 00 04 	stw     r22,4(r4)
 33c:	93 44 00 08 	stw     r26,8(r4)
 340:	92 e4 00 14 	stw     r23,20(r4)
 344:	48 00 00 01 	bl      344 <add_system_ram_resources+0xd0>
			344: R_PPC_PLTREL24	request_resource
 348:	54 63 0f fe 	rlwinm  r3,r3,1,31,31
 34c:	0f 03 00 00 	twnei   r3,0
 350:	80 7d 00 10 	lwz     r3,16(r29)
 354:	3b 9c 00 18 	addi    r28,r28,24
 358:	3b 7b 00 18 	addi    r27,r27,24
 35c:	80 9d 00 20 	lwz     r4,32(r29)
 360:	1c 63 00 18 	mulli   r3,r3,24
 364:	7c 64 1a 14 	add     r3,r4,r3
 368:	7c 1c 18 40 	cmplw   r28,r3
 36c:	41 80 ff 84 	blt     2f0 <add_system_ram_resources+0x7c>
 370:	38 60 00 00 	li      r3,0
 374:	83 c1 00 38 	lwz     r30,56(r1)
 378:	83 a1 00 34 	lwz     r29,52(r1)
 37c:	83 81 00 30 	lwz     r28,48(r1)
 380:	83 61 00 2c 	lwz     r27,44(r1)
 384:	83 41 00 28 	lwz     r26,40(r1)
 388:	83 21 00 24 	lwz     r25,36(r1)
 38c:	83 01 00 20 	lwz     r24,32(r1)
 390:	82 e1 00 1c 	lwz     r23,28(r1)
 394:	82 c1 00 18 	lwz     r22,24(r1)
 398:	82 a1 00 14 	lwz     r21,20(r1)
 39c:	80 01 00 44 	lwz     r0,68(r1)
 3a0:	38 21 00 40 	addi    r1,r1,64
 3a4:	7c 08 03 a6 	mtlr    r0
 3a8:	4e 80 00 20 	blr

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mem-broken.txt"


mem-broken.o:     file format elf32-powerpc


Disassembly of section .text:

00000000 <phys_mem_access_prot>:
   0:	7c 08 02 a6 	mflr    r0
   4:	90 01 00 04 	stw     r0,4(r1)
   8:	94 21 ff e0 	stwu    r1,-32(r1)
   c:	93 a1 00 14 	stw     r29,20(r1)
  10:	7c fd 3b 78 	mr      r29,r7
  14:	3c e0 00 00 	lis     r7,0
			16: R_PPC_ADDR16_HA	ppc_md
  18:	38 e7 00 00 	addi    r7,r7,0
			1a: R_PPC_ADDR16_LO	ppc_md
  1c:	81 07 00 a0 	lwz     r8,160(r7)
  20:	93 c1 00 18 	stw     r30,24(r1)
  24:	28 08 00 00 	cmplwi  r8,0
  28:	7c 7e 1b 78 	mr      r30,r3
  2c:	41 82 00 20 	beq     4c <phys_mem_access_prot+0x4c>
  30:	80 7d 00 00 	lwz     r3,0(r29)
  34:	38 e1 00 08 	addi    r7,r1,8
  38:	7d 09 03 a6 	mtctr   r8
  3c:	90 61 00 08 	stw     r3,8(r1)
  40:	7f c3 f3 78 	mr      r3,r30
  44:	4e 80 04 21 	bctrl
  48:	48 00 00 28 	b       70 <phys_mem_access_prot+0x70>
  4c:	7c a3 2b 78 	mr      r3,r5
  50:	48 00 00 01 	bl      50 <phys_mem_access_prot+0x50>
			50: R_PPC_PLTREL24	page_is_ram
  54:	28 03 00 00 	cmplwi  r3,0
  58:	80 7d 00 00 	lwz     r3,0(r29)
  5c:	40 82 00 10 	bne     6c <phys_mem_access_prot+0x6c>
  60:	54 63 06 26 	rlwinm  r3,r3,0,24,19
  64:	60 63 05 00 	ori     r3,r3,1280
  68:	90 7d 00 00 	stw     r3,0(r29)
  6c:	90 7e 00 00 	stw     r3,0(r30)
  70:	83 c1 00 18 	lwz     r30,24(r1)
  74:	83 a1 00 14 	lwz     r29,20(r1)
  78:	80 01 00 24 	lwz     r0,36(r1)
  7c:	38 21 00 20 	addi    r1,r1,32
  80:	7c 08 03 a6 	mtlr    r0
  84:	4e 80 00 20 	blr

00000088 <free_initmem>:
  88:	7c 08 02 a6 	mflr    r0
  8c:	90 01 00 04 	stw     r0,4(r1)
  90:	94 21 ff f0 	stwu    r1,-16(r1)
  94:	3c 60 00 00 	lis     r3,0
			96: R_PPC_ADDR16_HA	ppc_md
  98:	3c 80 00 00 	lis     r4,0
			9a: R_PPC_ADDR16_HA	ppc_printk_progress
  9c:	38 63 00 00 	addi    r3,r3,0
			9e: R_PPC_ADDR16_LO	ppc_md
  a0:	38 84 00 00 	addi    r4,r4,0
			a2: R_PPC_ADDR16_LO	ppc_printk_progress
  a4:	90 83 00 60 	stw     r4,96(r3)
  a8:	48 00 00 01 	bl      a8 <free_initmem+0x20>
			a8: R_PPC_PLTREL24	mark_initmem_nx
  ac:	3c 60 00 00 	lis     r3,0
			ae: R_PPC_ADDR16_HA	init_mem_is_free
  b0:	38 80 00 01 	li      r4,1
  b4:	98 83 00 00 	stb     r4,0(r3)
			b6: R_PPC_ADDR16_LO	init_mem_is_free
  b8:	3c 60 00 00 	lis     r3,0
			ba: R_PPC_ADDR16_HA	__init_begin
  bc:	3c 80 00 00 	lis     r4,0
			be: R_PPC_ADDR16_HA	__init_end
  c0:	3c a0 00 00 	lis     r5,0
			c2: R_PPC_ADDR16_HA	.rodata.str1.1+0x107
  c4:	38 63 00 00 	addi    r3,r3,0
			c6: R_PPC_ADDR16_LO	__init_begin
  c8:	38 84 00 00 	addi    r4,r4,0
			ca: R_PPC_ADDR16_LO	__init_end
  cc:	38 c5 00 00 	addi    r6,r5,0
			ce: R_PPC_ADDR16_LO	.rodata.str1.1+0x107
  d0:	38 a0 00 cc 	li      r5,204
  d4:	48 00 00 01 	bl      d4 <free_initmem+0x4c>
			d4: R_PPC_PLTREL24	free_reserved_area
  d8:	80 01 00 14 	lwz     r0,20(r1)
  dc:	38 21 00 10 	addi    r1,r1,16
  e0:	7c 08 03 a6 	mtlr    r0
  e4:	4e 80 00 20 	blr

000000e8 <flush_dcache_page>:
  e8:	80 83 00 00 	lwz     r4,0(r3)
  ec:	70 84 08 00 	andi.   r4,r4,2048
  f0:	4d 82 00 20 	beqlr
  f4:	38 80 08 00 	li      r4,2048
  f8:	7c a0 18 28 	lwarx   r5,0,r3
  fc:	7c a5 20 78 	andc    r5,r5,r4
 100:	7c a0 19 2d 	stwcx.  r5,0,r3
 104:	40 a2 ff f4 	bne     f8 <flush_dcache_page+0x10>
 108:	4e 80 00 20 	blr

0000010c <flush_dcache_icache_page>:
 10c:	7c 08 02 a6 	mflr    r0
 110:	90 01 00 04 	stw     r0,4(r1)
 114:	94 21 ff f0 	stwu    r1,-16(r1)
 118:	80 82 00 00 	lwz     r4,0(r2)
 11c:	38 84 00 01 	addi    r4,r4,1
 120:	90 82 00 00 	stw     r4,0(r2)
 124:	80 82 0a e4 	lwz     r4,2788(r2)
 128:	38 84 00 01 	addi    r4,r4,1
 12c:	90 82 0a e4 	stw     r4,2788(r2)
 130:	3c 80 00 00 	lis     r4,0
			132: R_PPC_ADDR16_HA	mem_map
 134:	80 84 00 00 	lwz     r4,0(r4)
			136: R_PPC_ADDR16_LO	mem_map
 138:	7c 64 18 50 	subf    r3,r4,r3
 13c:	3c 80 cc cc 	lis     r4,-13108
 140:	54 63 e8 fe 	rlwinm  r3,r3,29,3,31
 144:	60 84 d0 00 	ori     r4,r4,53248
 148:	7c 63 21 d6 	mullw   r3,r3,r4
 14c:	3c 63 c0 00 	addis   r3,r3,-16384
 150:	48 00 00 01 	bl      150 <flush_dcache_icache_page+0x44>
			150: R_PPC_PLTREL24	__flush_dcache_icache
 154:	80 62 0a e4 	lwz     r3,2788(r2)
 158:	38 63 ff ff 	addi    r3,r3,-1
 15c:	90 62 0a e4 	stw     r3,2788(r2)
 160:	80 62 00 00 	lwz     r3,0(r2)
 164:	38 63 ff ff 	addi    r3,r3,-1
 168:	90 62 00 00 	stw     r3,0(r2)
 16c:	80 01 00 14 	lwz     r0,20(r1)
 170:	38 21 00 10 	addi    r1,r1,16
 174:	7c 08 03 a6 	mtlr    r0
 178:	4e 80 00 20 	blr

0000017c <clear_user_page>:
 17c:	94 21 ff f0 	stwu    r1,-16(r1)
 180:	38 80 00 80 	li      r4,128
 184:	38 63 ff e0 	addi    r3,r3,-32
 188:	7c 89 03 a6 	mtctr   r4
 18c:	38 81 00 0f 	addi    r4,r1,15
 190:	8c c3 00 20 	lbzu    r6,32(r3)
 194:	98 c1 00 0f 	stb     r6,15(r1)
 198:	7c 00 27 ec 	dcbz    0,r4
 19c:	42 00 ff f4 	bdnz    190 <clear_user_page+0x14>
 1a0:	80 65 00 00 	lwz     r3,0(r5)
 1a4:	70 63 08 00 	andi.   r3,r3,2048
 1a8:	41 82 00 18 	beq     1c0 <clear_user_page+0x44>
 1ac:	38 60 08 00 	li      r3,2048
 1b0:	7c 80 28 28 	lwarx   r4,0,r5
 1b4:	7c 84 18 78 	andc    r4,r4,r3
 1b8:	7c 80 29 2d 	stwcx.  r4,0,r5
 1bc:	40 a2 ff f4 	bne     1b0 <clear_user_page+0x34>
 1c0:	38 21 00 10 	addi    r1,r1,16
 1c4:	4e 80 00 20 	blr

000001c8 <copy_user_page>:
 1c8:	7c 08 02 a6 	mflr    r0
 1cc:	90 01 00 04 	stw     r0,4(r1)
 1d0:	94 21 ff f0 	stwu    r1,-16(r1)
 1d4:	93 c1 00 08 	stw     r30,8(r1)
 1d8:	7c de 33 78 	mr      r30,r6
 1dc:	48 00 00 01 	bl      1dc <copy_user_page+0x14>
			1dc: R_PPC_PLTREL24	copy_page
 1e0:	80 7e 00 00 	lwz     r3,0(r30)
 1e4:	70 63 08 00 	andi.   r3,r3,2048
 1e8:	41 82 00 18 	beq     200 <copy_user_page+0x38>
 1ec:	38 60 08 00 	li      r3,2048
 1f0:	7c 80 f0 28 	lwarx   r4,0,r30
 1f4:	7c 84 18 78 	andc    r4,r4,r3
 1f8:	7c 80 f1 2d 	stwcx.  r4,0,r30
 1fc:	40 a2 ff f4 	bne     1f0 <copy_user_page+0x28>
 200:	83 c1 00 08 	lwz     r30,8(r1)
 204:	80 01 00 14 	lwz     r0,20(r1)
 208:	38 21 00 10 	addi    r1,r1,16
 20c:	7c 08 03 a6 	mtlr    r0
 210:	4e 80 00 20 	blr

00000214 <flush_icache_user_range>:
 214:	7c 08 02 a6 	mflr    r0
 218:	90 01 00 04 	stw     r0,4(r1)
 21c:	94 21 ff e0 	stwu    r1,-32(r1)
 220:	3c 60 00 00 	lis     r3,0
			222: R_PPC_ADDR16_HA	.rodata.str1.1+0x115
 224:	93 81 00 10 	stw     r28,16(r1)
 228:	7c 9c 23 78 	mr      r28,r4
 22c:	38 63 00 00 	addi    r3,r3,0
			22e: R_PPC_ADDR16_LO	.rodata.str1.1+0x115
 230:	38 80 00 53 	li      r4,83
 234:	93 a1 00 14 	stw     r29,20(r1)
 238:	7c bd 2b 78 	mr      r29,r5
 23c:	38 a0 00 00 	li      r5,0
 240:	93 c1 00 18 	stw     r30,24(r1)
 244:	7c de 33 78 	mr      r30,r6
 248:	48 00 00 01 	bl      248 <flush_icache_user_range+0x34>
			248: R_PPC_PLTREL24	__might_sleep
 24c:	3c 60 00 00 	lis     r3,0
			24e: R_PPC_ADDR16_HA	mem_map
 250:	3c 80 cc cc 	lis     r4,-13108
 254:	80 63 00 00 	lwz     r3,0(r3)
			256: R_PPC_ADDR16_LO	mem_map
 258:	60 84 d0 00 	ori     r4,r4,53248
 25c:	7c 63 e0 50 	subf    r3,r3,r28
 260:	54 63 e8 fe 	rlwinm  r3,r3,29,3,31
 264:	7c 63 21 d6 	mullw   r3,r3,r4
 268:	57 a4 05 3e 	clrlwi  r4,r29,20
 26c:	50 64 00 26 	rlwimi  r4,r3,0,0,19
 270:	3c 64 c0 00 	addis   r3,r4,-16384
 274:	7c 83 f2 14 	add     r4,r3,r30
 278:	48 00 00 01 	bl      278 <flush_icache_user_range+0x64>
			278: R_PPC_PLTREL24	flush_icache_range
 27c:	83 c1 00 18 	lwz     r30,24(r1)
 280:	83 a1 00 14 	lwz     r29,20(r1)
 284:	83 81 00 10 	lwz     r28,16(r1)
 288:	80 01 00 24 	lwz     r0,36(r1)
 28c:	38 21 00 20 	addi    r1,r1,32
 290:	7c 08 03 a6 	mtlr    r0
 294:	4e 80 00 20 	blr

00000298 <update_mmu_cache>:
 298:	4e 80 00 20 	blr

0000029c <devmem_is_allowed>:
 29c:	7c 08 02 a6 	mflr    r0
 2a0:	90 01 00 04 	stw     r0,4(r1)
 2a4:	94 21 ff f0 	stwu    r1,-16(r1)
 2a8:	93 c1 00 08 	stw     r30,8(r1)
 2ac:	7c 7e 1b 78 	mr      r30,r3
 2b0:	54 63 65 3e 	rlwinm  r3,r3,12,20,31
 2b4:	57 c4 60 26 	rlwinm  r4,r30,12,0,19
 2b8:	48 00 00 01 	bl      2b8 <devmem_is_allowed+0x1c>
			2b8: R_PPC_PLTREL24	iomem_is_exclusive
 2bc:	70 63 00 01 	andi.   r3,r3,1
 2c0:	38 60 00 00 	li      r3,0
 2c4:	41 81 00 14 	bgt     2d8 <devmem_is_allowed+0x3c>
 2c8:	7f c3 f3 78 	mr      r3,r30
 2cc:	48 00 00 01 	bl      2cc <devmem_is_allowed+0x30>
			2cc: R_PPC_PLTREL24	page_is_ram
 2d0:	7c 63 00 34 	cntlzw  r3,r3
 2d4:	54 63 df fe 	rlwinm  r3,r3,27,31,31
 2d8:	83 c1 00 08 	lwz     r30,8(r1)
 2dc:	80 01 00 14 	lwz     r0,20(r1)
 2e0:	38 21 00 10 	addi    r1,r1,16
 2e4:	7c 08 03 a6 	mtlr    r0
 2e8:	4e 80 00 20 	blr

Disassembly of section .init.text:

00000000 <mem_topology_setup>:
   0:	7c 08 02 a6 	mflr    r0
   4:	90 01 00 04 	stw     r0,4(r1)
   8:	94 21 ff f0 	stwu    r1,-16(r1)
   c:	48 00 00 01 	bl      c <mem_topology_setup+0xc>
			c: R_PPC_PLTREL24	memblock_end_of_DRAM
  10:	54 84 a0 3e 	rotlwi  r4,r4,20
  14:	3c a0 00 00 	lis     r5,0
			16: R_PPC_ADDR16_HA	max_pfn
  18:	50 64 a0 16 	rlwimi  r4,r3,20,0,11
  1c:	3c 60 00 00 	lis     r3,0
			1e: R_PPC_ADDR16_HA	max_low_pfn
  20:	90 85 00 00 	stw     r4,0(r5)
			22: R_PPC_ADDR16_LO	max_pfn
  24:	38 a0 ff ff 	li      r5,-1
  28:	90 83 00 00 	stw     r4,0(r3)
			2a: R_PPC_ADDR16_LO	max_low_pfn
  2c:	3c 60 00 00 	lis     r3,0
			2e: R_PPC_ADDR16_HA	min_low_pfn
  30:	38 80 00 00 	li      r4,0
  34:	38 c0 ff ff 	li      r6,-1
  38:	39 00 00 00 	li      r8,0
  3c:	90 83 00 00 	stw     r4,0(r3)
			3e: R_PPC_ADDR16_LO	min_low_pfn
  40:	3c 60 00 00 	lis     r3,0
			42: R_PPC_ADDR16_HA	memblock
  44:	38 80 00 00 	li      r4,0
  48:	38 63 00 00 	addi    r3,r3,0
			4a: R_PPC_ADDR16_LO	memblock
  4c:	38 e3 00 10 	addi    r7,r3,16
  50:	38 60 00 00 	li      r3,0
  54:	48 00 00 01 	bl      54 <mem_topology_setup+0x54>
			54: R_PPC_PLTREL24	memblock_set_node
  58:	80 01 00 14 	lwz     r0,20(r1)
  5c:	38 21 00 10 	addi    r1,r1,16
  60:	7c 08 03 a6 	mtlr    r0
  64:	4e 80 00 20 	blr

00000068 <initmem_init>:
  68:	7c 08 02 a6 	mflr    r0
  6c:	90 01 00 04 	stw     r0,4(r1)
  70:	94 21 ff f0 	stwu    r1,-16(r1)
  74:	38 60 00 00 	li      r3,0
  78:	48 00 00 01 	bl      78 <initmem_init+0x10>
			78: R_PPC_PLTREL24	sparse_memory_present_with_active_regions
  7c:	80 01 00 14 	lwz     r0,20(r1)
  80:	38 21 00 10 	addi    r1,r1,16
  84:	7c 08 03 a6 	mtlr    r0
  88:	4e 80 00 20 	blr

0000008c <paging_init>:
  8c:	7c 08 02 a6 	mflr    r0
  90:	90 01 00 04 	stw     r0,4(r1)
  94:	94 21 ff d0 	stwu    r1,-48(r1)
  98:	93 21 00 14 	stw     r25,20(r1)
  9c:	93 41 00 18 	stw     r26,24(r1)
  a0:	93 61 00 1c 	stw     r27,28(r1)
  a4:	93 81 00 20 	stw     r28,32(r1)
  a8:	93 a1 00 24 	stw     r29,36(r1)
  ac:	93 c1 00 28 	stw     r30,40(r1)
  b0:	48 00 00 01 	bl      b0 <paging_init+0x24>
			b0: R_PPC_PLTREL24	memblock_phys_mem_size
  b4:	7c 7e 1b 78 	mr      r30,r3
  b8:	7c 9d 23 78 	mr      r29,r4
  bc:	3f 40 ff fe 	lis     r26,-2
  c0:	48 00 00 01 	bl      c0 <paging_init+0x34>
			c0: R_PPC_PLTREL24	memblock_end_of_DRAM
  c4:	7c 7c 1b 78 	mr      r28,r3
  c8:	7c 9b 23 78 	mr      r27,r4
  cc:	3b 20 00 00 	li      r25,0
  d0:	38 e1 00 08 	addi    r7,r1,8
  d4:	7f 43 d3 78 	mr      r3,r26
  d8:	93 21 00 10 	stw     r25,16(r1)
  dc:	38 a0 00 00 	li      r5,0
  e0:	38 c0 00 00 	li      r6,0
  e4:	93 21 00 08 	stw     r25,8(r1)
  e8:	48 00 00 01 	bl      e8 <paging_init+0x5c>
			e8: R_PPC_PLTREL24	map_kernel_page
  ec:	3b 5a 10 00 	addi    r26,r26,4096
  f0:	2c 1a f0 00 	cmpwi   r26,-4096
  f4:	40 82 ff dc 	bne     d0 <paging_init+0x44>
  f8:	3c 60 00 00 	lis     r3,0
			fa: R_PPC_ADDR16_HA	.rodata.str1.1
  fc:	4c c6 31 82 	crclr   4*cr1+eq
 100:	7f 85 e3 78 	mr      r5,r28
 104:	38 63 00 00 	addi    r3,r3,0
			106: R_PPC_ADDR16_LO	.rodata.str1.1
 108:	7f 66 db 78 	mr      r6,r27
 10c:	7f c7 f3 78 	mr      r7,r30
 110:	7f a8 eb 78 	mr      r8,r29
 114:	48 00 00 01 	bl      114 <paging_init+0x88>
			114: R_PPC_PLTREL24	printk
 118:	7c 7d d8 10 	subfc   r3,r29,r27
 11c:	4c c6 31 82 	crclr   4*cr1+eq
 120:	7c be e1 10 	subfe   r5,r30,r28
 124:	54 64 60 3e 	rotlwi  r4,r3,12
 128:	3c 60 00 00 	lis     r3,0
			12a: R_PPC_ADDR16_HA	.rodata.str1.1+0x29
 12c:	50 a4 60 26 	rlwimi  r4,r5,12,0,19
 130:	38 63 00 00 	addi    r3,r3,0
			132: R_PPC_ADDR16_LO	.rodata.str1.1+0x29
 134:	48 00 00 01 	bl      134 <paging_init+0xa8>
			134: R_PPC_PLTREL24	printk
 138:	3c 60 00 00 	lis     r3,0
			13a: R_PPC_ADDR16_HA	max_low_pfn
 13c:	80 83 00 00 	lwz     r4,0(r3)
			13e: R_PPC_ADDR16_LO	max_low_pfn
 140:	3c 60 00 00 	lis     r3,0
			142: R_PPC_ADDR16_HA	.bss+0x10
 144:	94 83 00 00 	stwu    r4,0(r3)
			146: R_PPC_ADDR16_LO	.bss+0x10
 148:	48 00 00 01 	bl      148 <paging_init+0xbc>
			148: R_PPC_PLTREL24	free_area_init_nodes
 14c:	83 c1 00 28 	lwz     r30,40(r1)
 150:	83 a1 00 24 	lwz     r29,36(r1)
 154:	83 81 00 20 	lwz     r28,32(r1)
 158:	83 61 00 1c 	lwz     r27,28(r1)
 15c:	83 41 00 18 	lwz     r26,24(r1)
 160:	83 21 00 14 	lwz     r25,20(r1)
 164:	80 01 00 34 	lwz     r0,52(r1)
 168:	38 21 00 30 	addi    r1,r1,48
 16c:	7c 08 03 a6 	mtlr    r0
 170:	4e 80 00 20 	blr

00000174 <mem_init>:
 174:	7c 08 02 a6 	mflr    r0
 178:	90 01 00 04 	stw     r0,4(r1)
 17c:	94 21 ff e0 	stwu    r1,-32(r1)
 180:	3c 60 00 00 	lis     r3,0
			182: R_PPC_ADDR16_HA	max_low_pfn
 184:	3c 80 00 00 	lis     r4,0
			186: R_PPC_ADDR16_HA	max_pfn
 188:	93 81 00 10 	stw     r28,16(r1)
 18c:	3f 80 00 00 	lis     r28,0
			18e: R_PPC_ADDR16_HA	high_memory
 190:	80 63 00 00 	lwz     r3,0(r3)
			192: R_PPC_ADDR16_LO	max_low_pfn
 194:	80 84 00 00 	lwz     r4,0(r4)
			196: R_PPC_ADDR16_LO	max_pfn
 198:	54 63 60 26 	rlwinm  r3,r3,12,0,19
 19c:	3c 63 c0 00 	addis   r3,r3,-16384
 1a0:	90 7c 00 00 	stw     r3,0(r28)
			1a2: R_PPC_ADDR16_LO	high_memory
 1a4:	3c 60 00 00 	lis     r3,0
			1a6: R_PPC_ADDR16_HA	max_mapnr
 1a8:	93 a1 00 14 	stw     r29,20(r1)
 1ac:	93 c1 00 18 	stw     r30,24(r1)
 1b0:	90 83 00 00 	stw     r4,0(r3)
			1b2: R_PPC_ADDR16_LO	max_mapnr
 1b4:	48 00 00 01 	bl      1b4 <mem_init+0x40>
			1b4: R_PPC_PLTREL24	memblock_free_all
 1b8:	38 60 00 00 	li      r3,0
 1bc:	48 00 00 01 	bl      1bc <mem_init+0x48>
			1bc: R_PPC_PLTREL24	mem_init_print_info
 1c0:	3c 60 00 00 	lis     r3,0
			1c2: R_PPC_ADDR16_HA	.rodata.str1.1+0x44
 1c4:	4c c6 31 82 	crclr   4*cr1+eq
 1c8:	38 63 00 00 	addi    r3,r3,0
			1ca: R_PPC_ADDR16_LO	.rodata.str1.1+0x44
 1cc:	48 00 00 01 	bl      1cc <mem_init+0x58>
			1cc: R_PPC_PLTREL24	printk
 1d0:	3c 80 ff fd 	lis     r4,-3
 1d4:	3c 60 00 00 	lis     r3,0
			1d6: R_PPC_ADDR16_HA	.rodata.str1.1+0x65
 1d8:	4c c6 31 82 	crclr   4*cr1+eq
 1dc:	60 9e f0 00 	ori     r30,r4,61440
 1e0:	38 63 00 00 	addi    r3,r3,0
			1e2: R_PPC_ADDR16_LO	.rodata.str1.1+0x65
 1e4:	7f c4 f3 78 	mr      r4,r30
 1e8:	38 a0 f0 00 	li      r5,-4096
 1ec:	48 00 00 01 	bl      1ec <mem_init+0x78>
			1ec: R_PPC_PLTREL24	printk
 1f0:	3c 80 ff dd 	lis     r4,-35
 1f4:	3c 60 00 00 	lis     r3,0
			1f6: R_PPC_ADDR16_HA	.rodata.str1.1+0x87
 1f8:	4c c6 31 82 	crclr   4*cr1+eq
 1fc:	60 9d f0 00 	ori     r29,r4,61440
 200:	38 63 00 00 	addi    r3,r3,0
			202: R_PPC_ADDR16_LO	.rodata.str1.1+0x87
 204:	7f a4 eb 78 	mr      r4,r29
 208:	7f c5 f3 78 	mr      r5,r30
 20c:	48 00 00 01 	bl      20c <mem_init+0x98>
			20c: R_PPC_PLTREL24	printk
 210:	3f c0 00 00 	lis     r30,0
			212: R_PPC_ADDR16_HA	ioremap_bot
 214:	3c 60 00 00 	lis     r3,0
			216: R_PPC_ADDR16_HA	.rodata.str1.1+0xb1
 218:	4c c6 31 82 	crclr   4*cr1+eq
 21c:	80 9e 00 00 	lwz     r4,0(r30)
			21e: R_PPC_ADDR16_LO	ioremap_bot
 220:	38 63 00 00 	addi    r3,r3,0
			222: R_PPC_ADDR16_LO	.rodata.str1.1+0xb1
 224:	7f a5 eb 78 	mr      r5,r29
 228:	48 00 00 01 	bl      228 <mem_init+0xb4>
			228: R_PPC_PLTREL24	printk
 22c:	80 7c 00 00 	lwz     r3,0(r28)
			22e: R_PPC_ADDR16_LO	high_memory
 230:	3c 80 01 00 	lis     r4,256
 234:	4c c6 31 82 	crclr   4*cr1+eq
 238:	38 63 ff ff 	addi    r3,r3,-1
 23c:	80 be 00 00 	lwz     r5,0(r30)
			23e: R_PPC_ADDR16_LO	ioremap_bot
 240:	3c 63 10 00 	addis   r3,r3,4096
 244:	54 63 00 06 	rlwinm  r3,r3,0,0,3
 248:	50 64 02 0c 	rlwimi  r4,r3,0,8,6
 24c:	3c 60 00 00 	lis     r3,0
			24e: R_PPC_ADDR16_HA	.rodata.str1.1+0xda
 250:	38 63 00 00 	addi    r3,r3,0
			252: R_PPC_ADDR16_LO	.rodata.str1.1+0xda
 254:	48 00 00 01 	bl      254 <mem_init+0xe0>
			254: R_PPC_PLTREL24	printk
 258:	83 c1 00 18 	lwz     r30,24(r1)
 25c:	83 a1 00 14 	lwz     r29,20(r1)
 260:	83 81 00 10 	lwz     r28,16(r1)
 264:	80 01 00 24 	lwz     r0,36(r1)
 268:	38 21 00 20 	addi    r1,r1,32
 26c:	7c 08 03 a6 	mtlr    r0
 270:	4e 80 00 20 	blr

00000274 <add_system_ram_resources>:
 274:	7c 08 02 a6 	mflr    r0
 278:	90 01 00 04 	stw     r0,4(r1)
 27c:	94 21 ff c0 	stwu    r1,-64(r1)
 280:	3c 60 00 00 	lis     r3,0
			282: R_PPC_ADDR16_HA	memblock
 284:	93 a1 00 34 	stw     r29,52(r1)
 288:	3b a3 00 00 	addi    r29,r3,0
			28a: R_PPC_ADDR16_LO	memblock
 28c:	80 7d 00 10 	lwz     r3,16(r29)
 290:	93 81 00 30 	stw     r28,48(r1)
 294:	1c 63 00 18 	mulli   r3,r3,24
 298:	83 9d 00 20 	lwz     r28,32(r29)
 29c:	7c 7c 1a 14 	add     r3,r28,r3
 2a0:	92 a1 00 14 	stw     r21,20(r1)
 2a4:	7c 1c 18 40 	cmplw   r28,r3
 2a8:	92 c1 00 18 	stw     r22,24(r1)
 2ac:	92 e1 00 1c 	stw     r23,28(r1)
 2b0:	93 01 00 20 	stw     r24,32(r1)
 2b4:	93 21 00 24 	stw     r25,36(r1)
 2b8:	93 41 00 28 	stw     r26,40(r1)
 2bc:	93 61 00 2c 	stw     r27,44(r1)
 2c0:	93 c1 00 38 	stw     r30,56(r1)
 2c4:	40 80 00 ac 	bge     370 <add_system_ram_resources+0xfc>
 2c8:	3c 60 00 00 	lis     r3,0
			2ca: R_PPC_ADDR16_HA	kmalloc_caches
 2cc:	3c 80 00 00 	lis     r4,0
			2ce: R_PPC_ADDR16_HA	.rodata.str1.1+0x199
 2d0:	3c a0 81 00 	lis     r5,-32512
 2d4:	3c c0 00 00 	lis     r6,0
			2d6: R_PPC_ADDR16_HA	iomem_resource
 2d8:	3b 7c ff e8 	addi    r27,r28,-24
 2dc:	3b 40 00 00 	li      r26,0
 2e0:	3b 23 00 00 	addi    r25,r3,0
			2e2: R_PPC_ADDR16_LO	kmalloc_caches
 2e4:	3b 04 00 00 	addi    r24,r4,0
			2e6: R_PPC_ADDR16_LO	.rodata.str1.1+0x199
 2e8:	60 b7 02 00 	ori     r23,r5,512
 2ec:	3b c6 00 00 	addi    r30,r6,0
			2ee: R_PPC_ADDR16_LO	iomem_resource
 2f0:	80 79 00 18 	lwz     r3,24(r25)
 2f4:	38 80 0d c0 	li      r4,3520
 2f8:	38 a0 00 28 	li      r5,40
 2fc:	82 db 00 1c 	lwz     r22,28(r27)
 300:	82 bb 00 24 	lwz     r21,36(r27)
 304:	48 00 00 01 	bl      304 <add_system_ram_resources+0x90>
			304: R_PPC_PLTREL24	kmem_cache_alloc_trace
 308:	7c 64 1b 78 	mr      r4,r3
 30c:	7c 63 00 34 	cntlzw  r3,r3
 310:	28 04 00 00 	cmplwi  r4,0
 314:	54 63 df fe 	rlwinm  r3,r3,27,31,31
 318:	0f 03 00 00 	twnei   r3,0
 31c:	41 82 00 34 	beq     350 <add_system_ram_resources+0xdc>
 320:	7c 76 aa 14 	add     r3,r22,r21
 324:	93 04 00 10 	stw     r24,16(r4)
 328:	38 63 ff ff 	addi    r3,r3,-1
 32c:	90 64 00 0c 	stw     r3,12(r4)
 330:	7f c3 f3 78 	mr      r3,r30
 334:	93 44 00 00 	stw     r26,0(r4)
 338:	92 c4 00 04 	stw     r22,4(r4)
 33c:	93 44 00 08 	stw     r26,8(r4)
 340:	92 e4 00 14 	stw     r23,20(r4)
 344:	48 00 00 01 	bl      344 <add_system_ram_resources+0xd0>
			344: R_PPC_PLTREL24	request_resource
 348:	54 63 0f fe 	rlwinm  r3,r3,1,31,31
 34c:	0f 03 00 00 	twnei   r3,0
 350:	80 7d 00 10 	lwz     r3,16(r29)
 354:	3b 9c 00 18 	addi    r28,r28,24
 358:	3b 7b 00 18 	addi    r27,r27,24
 35c:	80 9d 00 20 	lwz     r4,32(r29)
 360:	1c 63 00 18 	mulli   r3,r3,24
 364:	7c 64 1a 14 	add     r3,r4,r3
 368:	7c 1c 18 40 	cmplw   r28,r3
 36c:	41 80 ff 84 	blt     2f0 <add_system_ram_resources+0x7c>
 370:	38 60 00 00 	li      r3,0
 374:	83 c1 00 38 	lwz     r30,56(r1)
 378:	83 a1 00 34 	lwz     r29,52(r1)
 37c:	83 81 00 30 	lwz     r28,48(r1)
 380:	83 61 00 2c 	lwz     r27,44(r1)
 384:	83 41 00 28 	lwz     r26,40(r1)
 388:	83 21 00 24 	lwz     r25,36(r1)
 38c:	83 01 00 20 	lwz     r24,32(r1)
 390:	82 e1 00 1c 	lwz     r23,28(r1)
 394:	82 c1 00 18 	lwz     r22,24(r1)
 398:	82 a1 00 14 	lwz     r21,20(r1)
 39c:	80 01 00 44 	lwz     r0,68(r1)
 3a0:	38 21 00 40 	addi    r1,r1,64
 3a4:	7c 08 03 a6 	mtlr    r0
 3a8:	4e 80 00 20 	blr

--HcAYCG3uE/tztfnV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="mem-diff.txt"


mem-working.o:     file format elf32-powerpc		      |	mem-broken.o:     file format elf32-powerpc


Disassembly of section .text:					Disassembly of section .text:

00000000 <phys_mem_access_prot>:				00000000 <phys_mem_access_prot>:
   0:	7c 08 02 a6 	mflr    r0				   0:	7c 08 02 a6 	mflr    r0
   4:	90 01 00 04 	stw     r0,4(r1)			   4:	90 01 00 04 	stw     r0,4(r1)
   8:	94 21 ff e0 	stwu    r1,-32(r1)			   8:	94 21 ff e0 	stwu    r1,-32(r1)
   c:	93 a1 00 14 	stw     r29,20(r1)			   c:	93 a1 00 14 	stw     r29,20(r1)
  10:	7c fd 3b 78 	mr      r29,r7				  10:	7c fd 3b 78 	mr      r29,r7
  14:	3c e0 00 00 	lis     r7,0				  14:	3c e0 00 00 	lis     r7,0
			16: R_PPC_ADDR16_HA	ppc_md					16: R_PPC_ADDR16_HA	ppc_md
  18:	38 e7 00 00 	addi    r7,r7,0				  18:	38 e7 00 00 	addi    r7,r7,0
			1a: R_PPC_ADDR16_LO	ppc_md					1a: R_PPC_ADDR16_LO	ppc_md
  1c:	81 07 00 a0 	lwz     r8,160(r7)			  1c:	81 07 00 a0 	lwz     r8,160(r7)
  20:	93 c1 00 18 	stw     r30,24(r1)			  20:	93 c1 00 18 	stw     r30,24(r1)
  24:	28 08 00 00 	cmplwi  r8,0				  24:	28 08 00 00 	cmplwi  r8,0
  28:	7c 7e 1b 78 	mr      r30,r3				  28:	7c 7e 1b 78 	mr      r30,r3
  2c:	41 82 00 20 	beq     4c <phys_mem_access_prot+0x4c	  2c:	41 82 00 20 	beq     4c <phys_mem_access_prot+0x4c
  30:	80 7d 00 00 	lwz     r3,0(r29)			  30:	80 7d 00 00 	lwz     r3,0(r29)
  34:	38 e1 00 08 	addi    r7,r1,8				  34:	38 e1 00 08 	addi    r7,r1,8
  38:	7d 09 03 a6 	mtctr   r8				  38:	7d 09 03 a6 	mtctr   r8
  3c:	90 61 00 08 	stw     r3,8(r1)			  3c:	90 61 00 08 	stw     r3,8(r1)
  40:	7f c3 f3 78 	mr      r3,r30				  40:	7f c3 f3 78 	mr      r3,r30
  44:	4e 80 04 21 	bctrl					  44:	4e 80 04 21 	bctrl
  48:	48 00 00 28 	b       70 <phys_mem_access_prot+0x70	  48:	48 00 00 28 	b       70 <phys_mem_access_prot+0x70
  4c:	7c a3 2b 78 	mr      r3,r5				  4c:	7c a3 2b 78 	mr      r3,r5
  50:	48 00 00 01 	bl      50 <phys_mem_access_prot+0x50	  50:	48 00 00 01 	bl      50 <phys_mem_access_prot+0x50
			50: R_PPC_PLTREL24	page_is_ram				50: R_PPC_PLTREL24	page_is_ram
  54:	28 03 00 00 	cmplwi  r3,0				  54:	28 03 00 00 	cmplwi  r3,0
  58:	80 7d 00 00 	lwz     r3,0(r29)			  58:	80 7d 00 00 	lwz     r3,0(r29)
  5c:	40 82 00 10 	bne     6c <phys_mem_access_prot+0x6c	  5c:	40 82 00 10 	bne     6c <phys_mem_access_prot+0x6c
  60:	54 63 06 26 	rlwinm  r3,r3,0,24,19			  60:	54 63 06 26 	rlwinm  r3,r3,0,24,19
  64:	60 63 05 00 	ori     r3,r3,1280			  64:	60 63 05 00 	ori     r3,r3,1280
  68:	90 7d 00 00 	stw     r3,0(r29)			  68:	90 7d 00 00 	stw     r3,0(r29)
  6c:	90 7e 00 00 	stw     r3,0(r30)			  6c:	90 7e 00 00 	stw     r3,0(r30)
  70:	83 c1 00 18 	lwz     r30,24(r1)			  70:	83 c1 00 18 	lwz     r30,24(r1)
  74:	83 a1 00 14 	lwz     r29,20(r1)			  74:	83 a1 00 14 	lwz     r29,20(r1)
  78:	80 01 00 24 	lwz     r0,36(r1)			  78:	80 01 00 24 	lwz     r0,36(r1)
  7c:	38 21 00 20 	addi    r1,r1,32			  7c:	38 21 00 20 	addi    r1,r1,32
  80:	7c 08 03 a6 	mtlr    r0				  80:	7c 08 03 a6 	mtlr    r0
  84:	4e 80 00 20 	blr					  84:	4e 80 00 20 	blr

00000088 <free_initmem>:					00000088 <free_initmem>:
  88:	7c 08 02 a6 	mflr    r0				  88:	7c 08 02 a6 	mflr    r0
  8c:	90 01 00 04 	stw     r0,4(r1)			  8c:	90 01 00 04 	stw     r0,4(r1)
  90:	94 21 ff f0 	stwu    r1,-16(r1)			  90:	94 21 ff f0 	stwu    r1,-16(r1)
  94:	3c 60 00 00 	lis     r3,0				  94:	3c 60 00 00 	lis     r3,0
			96: R_PPC_ADDR16_HA	ppc_md					96: R_PPC_ADDR16_HA	ppc_md
  98:	3c 80 00 00 	lis     r4,0				  98:	3c 80 00 00 	lis     r4,0
			9a: R_PPC_ADDR16_HA	ppc_printk_pr				9a: R_PPC_ADDR16_HA	ppc_printk_pr
  9c:	38 63 00 00 	addi    r3,r3,0				  9c:	38 63 00 00 	addi    r3,r3,0
			9e: R_PPC_ADDR16_LO	ppc_md					9e: R_PPC_ADDR16_LO	ppc_md
  a0:	38 84 00 00 	addi    r4,r4,0				  a0:	38 84 00 00 	addi    r4,r4,0
			a2: R_PPC_ADDR16_LO	ppc_printk_pr				a2: R_PPC_ADDR16_LO	ppc_printk_pr
  a4:	90 83 00 60 	stw     r4,96(r3)			  a4:	90 83 00 60 	stw     r4,96(r3)
  a8:	48 00 00 01 	bl      a8 <free_initmem+0x20>		  a8:	48 00 00 01 	bl      a8 <free_initmem+0x20>
			a8: R_PPC_PLTREL24	mark_initmem_				a8: R_PPC_PLTREL24	mark_initmem_
  ac:	3c 60 00 00 	lis     r3,0				  ac:	3c 60 00 00 	lis     r3,0
			ae: R_PPC_ADDR16_HA	init_mem_is_f				ae: R_PPC_ADDR16_HA	init_mem_is_f
  b0:	38 80 00 01 	li      r4,1				  b0:	38 80 00 01 	li      r4,1
  b4:	98 83 00 00 	stb     r4,0(r3)			  b4:	98 83 00 00 	stb     r4,0(r3)
			b6: R_PPC_ADDR16_LO	init_mem_is_f				b6: R_PPC_ADDR16_LO	init_mem_is_f
  b8:	3c 60 00 00 	lis     r3,0				  b8:	3c 60 00 00 	lis     r3,0
			ba: R_PPC_ADDR16_HA	__init_begin				ba: R_PPC_ADDR16_HA	__init_begin
  bc:	3c 80 00 00 	lis     r4,0				  bc:	3c 80 00 00 	lis     r4,0
			be: R_PPC_ADDR16_HA	__init_end				be: R_PPC_ADDR16_HA	__init_end
  c0:	3c a0 00 00 	lis     r5,0				  c0:	3c a0 00 00 	lis     r5,0
			c2: R_PPC_ADDR16_HA	.rodata.str1.				c2: R_PPC_ADDR16_HA	.rodata.str1.
  c4:	38 63 00 00 	addi    r3,r3,0				  c4:	38 63 00 00 	addi    r3,r3,0
			c6: R_PPC_ADDR16_LO	__init_begin				c6: R_PPC_ADDR16_LO	__init_begin
  c8:	38 84 00 00 	addi    r4,r4,0				  c8:	38 84 00 00 	addi    r4,r4,0
			ca: R_PPC_ADDR16_LO	__init_end				ca: R_PPC_ADDR16_LO	__init_end
  cc:	38 c5 00 00 	addi    r6,r5,0				  cc:	38 c5 00 00 	addi    r6,r5,0
			ce: R_PPC_ADDR16_LO	.rodata.str1.				ce: R_PPC_ADDR16_LO	.rodata.str1.
  d0:	38 a0 00 cc 	li      r5,204				  d0:	38 a0 00 cc 	li      r5,204
  d4:	48 00 00 01 	bl      d4 <free_initmem+0x4c>		  d4:	48 00 00 01 	bl      d4 <free_initmem+0x4c>
			d4: R_PPC_PLTREL24	free_reserved				d4: R_PPC_PLTREL24	free_reserved
  d8:	80 01 00 14 	lwz     r0,20(r1)			  d8:	80 01 00 14 	lwz     r0,20(r1)
  dc:	38 21 00 10 	addi    r1,r1,16			  dc:	38 21 00 10 	addi    r1,r1,16
  e0:	7c 08 03 a6 	mtlr    r0				  e0:	7c 08 03 a6 	mtlr    r0
  e4:	4e 80 00 20 	blr					  e4:	4e 80 00 20 	blr

000000e8 <flush_dcache_page>:					000000e8 <flush_dcache_page>:
  e8:	80 83 00 00 	lwz     r4,0(r3)			  e8:	80 83 00 00 	lwz     r4,0(r3)
  ec:	70 84 08 00 	andi.   r4,r4,2048			  ec:	70 84 08 00 	andi.   r4,r4,2048
  f0:	4d 82 00 20 	beqlr					  f0:	4d 82 00 20 	beqlr
  f4:	38 80 08 00 	li      r4,2048				  f4:	38 80 08 00 	li      r4,2048
  f8:	7c a0 18 28 	lwarx   r5,0,r3				  f8:	7c a0 18 28 	lwarx   r5,0,r3
  fc:	7c a5 20 78 	andc    r5,r5,r4			  fc:	7c a5 20 78 	andc    r5,r5,r4
 100:	7c a0 19 2d 	stwcx.  r5,0,r3				 100:	7c a0 19 2d 	stwcx.  r5,0,r3
 104:	40 a2 ff f4 	bne     f8 <flush_dcache_page+0x10>	 104:	40 a2 ff f4 	bne     f8 <flush_dcache_page+0x10>
 108:	4e 80 00 20 	blr					 108:	4e 80 00 20 	blr

0000010c <flush_dcache_icache_page>:				0000010c <flush_dcache_icache_page>:
 10c:	7c 08 02 a6 	mflr    r0				 10c:	7c 08 02 a6 	mflr    r0
 110:	90 01 00 04 	stw     r0,4(r1)			 110:	90 01 00 04 	stw     r0,4(r1)
 114:	94 21 ff f0 	stwu    r1,-16(r1)			 114:	94 21 ff f0 	stwu    r1,-16(r1)
 118:	80 82 00 00 	lwz     r4,0(r2)			 118:	80 82 00 00 	lwz     r4,0(r2)
 11c:	38 84 00 01 	addi    r4,r4,1				 11c:	38 84 00 01 	addi    r4,r4,1
 120:	90 82 00 00 	stw     r4,0(r2)			 120:	90 82 00 00 	stw     r4,0(r2)
 124:	80 82 0a e4 	lwz     r4,2788(r2)			 124:	80 82 0a e4 	lwz     r4,2788(r2)
 128:	38 84 00 01 	addi    r4,r4,1				 128:	38 84 00 01 	addi    r4,r4,1
 12c:	90 82 0a e4 	stw     r4,2788(r2)			 12c:	90 82 0a e4 	stw     r4,2788(r2)
 130:	3c 80 00 00 	lis     r4,0				 130:	3c 80 00 00 	lis     r4,0
			132: R_PPC_ADDR16_HA	mem_map					132: R_PPC_ADDR16_HA	mem_map
 134:	80 84 00 00 	lwz     r4,0(r4)			 134:	80 84 00 00 	lwz     r4,0(r4)
			136: R_PPC_ADDR16_LO	mem_map					136: R_PPC_ADDR16_LO	mem_map
 138:	7c 64 18 50 	subf    r3,r4,r3			 138:	7c 64 18 50 	subf    r3,r4,r3
 13c:	3c 80 cc cc 	lis     r4,-13108			 13c:	3c 80 cc cc 	lis     r4,-13108
 140:	54 63 e8 fe 	rlwinm  r3,r3,29,3,31			 140:	54 63 e8 fe 	rlwinm  r3,r3,29,3,31
 144:	60 84 d0 00 	ori     r4,r4,53248			 144:	60 84 d0 00 	ori     r4,r4,53248
 148:	7c 63 21 d6 	mullw   r3,r3,r4			 148:	7c 63 21 d6 	mullw   r3,r3,r4
 14c:	3c 63 c0 00 	addis   r3,r3,-16384			 14c:	3c 63 c0 00 	addis   r3,r3,-16384
 150:	48 00 00 01 	bl      150 <flush_dcache_icache_page	 150:	48 00 00 01 	bl      150 <flush_dcache_icache_page
			150: R_PPC_PLTREL24	__flush_dcach				150: R_PPC_PLTREL24	__flush_dcach
 154:	80 62 0a e4 	lwz     r3,2788(r2)			 154:	80 62 0a e4 	lwz     r3,2788(r2)
 158:	38 63 ff ff 	addi    r3,r3,-1			 158:	38 63 ff ff 	addi    r3,r3,-1
 15c:	90 62 0a e4 	stw     r3,2788(r2)			 15c:	90 62 0a e4 	stw     r3,2788(r2)
 160:	80 62 00 00 	lwz     r3,0(r2)			 160:	80 62 00 00 	lwz     r3,0(r2)
 164:	38 63 ff ff 	addi    r3,r3,-1			 164:	38 63 ff ff 	addi    r3,r3,-1
 168:	90 62 00 00 	stw     r3,0(r2)			 168:	90 62 00 00 	stw     r3,0(r2)
 16c:	80 01 00 14 	lwz     r0,20(r1)			 16c:	80 01 00 14 	lwz     r0,20(r1)
 170:	38 21 00 10 	addi    r1,r1,16			 170:	38 21 00 10 	addi    r1,r1,16
 174:	7c 08 03 a6 	mtlr    r0				 174:	7c 08 03 a6 	mtlr    r0
 178:	4e 80 00 20 	blr					 178:	4e 80 00 20 	blr

0000017c <clear_user_page>:					0000017c <clear_user_page>:
 17c:	38 80 00 80 	li      r4,128			      |	 17c:	94 21 ff f0 	stwu    r1,-16(r1)
 180:	7c 89 03 a6 	mtctr   r4			      |	 180:	38 80 00 80 	li      r4,128
 184:	7c 00 1f ec 	dcbz    0,r3			      |	 184:	38 63 ff e0 	addi    r3,r3,-32
 188:	38 63 00 20 	addi    r3,r3,32		      |	 188:	7c 89 03 a6 	mtctr   r4
 18c:	42 00 ff f8 	bdnz    184 <clear_user_page+0x8>     |	 18c:	38 81 00 0f 	addi    r4,r1,15
 190:	80 65 00 00 	lwz     r3,0(r5)		      |	 190:	8c c3 00 20 	lbzu    r6,32(r3)
 194:	70 63 08 00 	andi.   r3,r3,2048		      |	 194:	98 c1 00 0f 	stb     r6,15(r1)
 198:	4d 82 00 20 	beqlr				      |	 198:	7c 00 27 ec 	dcbz    0,r4
 19c:	38 60 08 00 	li      r3,2048			      |	 19c:	42 00 ff f4 	bdnz    190 <clear_user_page+0x14>
 1a0:	7c 80 28 28 	lwarx   r4,0,r5			      |	 1a0:	80 65 00 00 	lwz     r3,0(r5)
 1a4:	7c 84 18 78 	andc    r4,r4,r3		      |	 1a4:	70 63 08 00 	andi.   r3,r3,2048
 1a8:	7c 80 29 2d 	stwcx.  r4,0,r5			      |	 1a8:	41 82 00 18 	beq     1c0 <clear_user_page+0x44>
 1ac:	40 a2 ff f4 	bne     1a0 <clear_user_page+0x24>    |	 1ac:	38 60 08 00 	li      r3,2048
 1b0:	4e 80 00 20 	blr				      |	 1b0:	7c 80 28 28 	lwarx   r4,0,r5
							      |	 1b4:	7c 84 18 78 	andc    r4,r4,r3
000001b4 <copy_user_page>:				      |	 1b8:	7c 80 29 2d 	stwcx.  r4,0,r5
 1b4:	7c 08 02 a6 	mflr    r0			      |	 1bc:	40 a2 ff f4 	bne     1b0 <clear_user_page+0x34>
 1b8:	90 01 00 04 	stw     r0,4(r1)		      |	 1c0:	38 21 00 10 	addi    r1,r1,16
 1bc:	94 21 ff f0 	stwu    r1,-16(r1)		      |	 1c4:	4e 80 00 20 	blr
 1c0:	93 c1 00 08 	stw     r30,8(r1)		      |
 1c4:	7c de 33 78 	mr      r30,r6			      |	000001c8 <copy_user_page>:
 1c8:	48 00 00 01 	bl      1c8 <copy_user_page+0x14>     |	 1c8:	7c 08 02 a6 	mflr    r0
			1c8: R_PPC_PLTREL24	copy_page     |	 1cc:	90 01 00 04 	stw     r0,4(r1)
 1cc:	80 7e 00 00 	lwz     r3,0(r30)		      |	 1d0:	94 21 ff f0 	stwu    r1,-16(r1)
 1d0:	70 63 08 00 	andi.   r3,r3,2048		      |	 1d4:	93 c1 00 08 	stw     r30,8(r1)
 1d4:	41 82 00 18 	beq     1ec <copy_user_page+0x38>     |	 1d8:	7c de 33 78 	mr      r30,r6
 1d8:	38 60 08 00 	li      r3,2048			      |	 1dc:	48 00 00 01 	bl      1dc <copy_user_page+0x14>
 1dc:	7c 80 f0 28 	lwarx   r4,0,r30		      |				1dc: R_PPC_PLTREL24	copy_page
 1e0:	7c 84 18 78 	andc    r4,r4,r3		      |	 1e0:	80 7e 00 00 	lwz     r3,0(r30)
 1e4:	7c 80 f1 2d 	stwcx.  r4,0,r30		      |	 1e4:	70 63 08 00 	andi.   r3,r3,2048
 1e8:	40 a2 ff f4 	bne     1dc <copy_user_page+0x28>     |	 1e8:	41 82 00 18 	beq     200 <copy_user_page+0x38>
 1ec:	83 c1 00 08 	lwz     r30,8(r1)		      |	 1ec:	38 60 08 00 	li      r3,2048
 1f0:	80 01 00 14 	lwz     r0,20(r1)		      |	 1f0:	7c 80 f0 28 	lwarx   r4,0,r30
 1f4:	38 21 00 10 	addi    r1,r1,16		      |	 1f4:	7c 84 18 78 	andc    r4,r4,r3
 1f8:	7c 08 03 a6 	mtlr    r0			      |	 1f8:	7c 80 f1 2d 	stwcx.  r4,0,r30
 1fc:	4e 80 00 20 	blr				      |	 1fc:	40 a2 ff f4 	bne     1f0 <copy_user_page+0x28>
							      |	 200:	83 c1 00 08 	lwz     r30,8(r1)
00000200 <flush_icache_user_range>:			      |	 204:	80 01 00 14 	lwz     r0,20(r1)
 200:	7c 08 02 a6 	mflr    r0			      |	 208:	38 21 00 10 	addi    r1,r1,16
 204:	90 01 00 04 	stw     r0,4(r1)		      |	 20c:	7c 08 03 a6 	mtlr    r0
 208:	94 21 ff e0 	stwu    r1,-32(r1)		      |	 210:	4e 80 00 20 	blr
 20c:	3c 60 00 00 	lis     r3,0			      |
			20e: R_PPC_ADDR16_HA	.rodata.str1. |	00000214 <flush_icache_user_range>:
 210:	93 81 00 10 	stw     r28,16(r1)		      |	 214:	7c 08 02 a6 	mflr    r0
 214:	7c 9c 23 78 	mr      r28,r4			      |	 218:	90 01 00 04 	stw     r0,4(r1)
 218:	38 63 00 00 	addi    r3,r3,0			      |	 21c:	94 21 ff e0 	stwu    r1,-32(r1)
			21a: R_PPC_ADDR16_LO	.rodata.str1. |	 220:	3c 60 00 00 	lis     r3,0
 21c:	38 80 00 53 	li      r4,83			      |				222: R_PPC_ADDR16_HA	.rodata.str1.
 220:	93 a1 00 14 	stw     r29,20(r1)		      |	 224:	93 81 00 10 	stw     r28,16(r1)
 224:	7c bd 2b 78 	mr      r29,r5			      |	 228:	7c 9c 23 78 	mr      r28,r4
 228:	38 a0 00 00 	li      r5,0			      |	 22c:	38 63 00 00 	addi    r3,r3,0
 22c:	93 c1 00 18 	stw     r30,24(r1)		      |				22e: R_PPC_ADDR16_LO	.rodata.str1.
 230:	7c de 33 78 	mr      r30,r6			      |	 230:	38 80 00 53 	li      r4,83
 234:	48 00 00 01 	bl      234 <flush_icache_user_range+ |	 234:	93 a1 00 14 	stw     r29,20(r1)
			234: R_PPC_PLTREL24	__might_sleep |	 238:	7c bd 2b 78 	mr      r29,r5
 238:	3c 60 00 00 	lis     r3,0			      |	 23c:	38 a0 00 00 	li      r5,0
			23a: R_PPC_ADDR16_HA	mem_map	      |	 240:	93 c1 00 18 	stw     r30,24(r1)
 23c:	3c 80 cc cc 	lis     r4,-13108		      |	 244:	7c de 33 78 	mr      r30,r6
 240:	80 63 00 00 	lwz     r3,0(r3)		      |	 248:	48 00 00 01 	bl      248 <flush_icache_user_range+
			242: R_PPC_ADDR16_LO	mem_map	      |				248: R_PPC_PLTREL24	__might_sleep
 244:	60 84 d0 00 	ori     r4,r4,53248		      |	 24c:	3c 60 00 00 	lis     r3,0
 248:	7c 63 e0 50 	subf    r3,r3,r28		      |				24e: R_PPC_ADDR16_HA	mem_map
 24c:	54 63 e8 fe 	rlwinm  r3,r3,29,3,31		      |	 250:	3c 80 cc cc 	lis     r4,-13108
 250:	7c 63 21 d6 	mullw   r3,r3,r4		      |	 254:	80 63 00 00 	lwz     r3,0(r3)
 254:	57 a4 05 3e 	clrlwi  r4,r29,20		      |				256: R_PPC_ADDR16_LO	mem_map
 258:	50 64 00 26 	rlwimi  r4,r3,0,0,19		      |	 258:	60 84 d0 00 	ori     r4,r4,53248
 25c:	3c 64 c0 00 	addis   r3,r4,-16384		      |	 25c:	7c 63 e0 50 	subf    r3,r3,r28
 260:	7c 83 f2 14 	add     r4,r3,r30		      |	 260:	54 63 e8 fe 	rlwinm  r3,r3,29,3,31
 264:	48 00 00 01 	bl      264 <flush_icache_user_range+ |	 264:	7c 63 21 d6 	mullw   r3,r3,r4
			264: R_PPC_PLTREL24	flush_icache_ |	 268:	57 a4 05 3e 	clrlwi  r4,r29,20
 268:	83 c1 00 18 	lwz     r30,24(r1)		      |	 26c:	50 64 00 26 	rlwimi  r4,r3,0,0,19
 26c:	83 a1 00 14 	lwz     r29,20(r1)		      |	 270:	3c 64 c0 00 	addis   r3,r4,-16384
 270:	83 81 00 10 	lwz     r28,16(r1)		      |	 274:	7c 83 f2 14 	add     r4,r3,r30
 274:	80 01 00 24 	lwz     r0,36(r1)		      |	 278:	48 00 00 01 	bl      278 <flush_icache_user_range+
 278:	38 21 00 20 	addi    r1,r1,32		      |				278: R_PPC_PLTREL24	flush_icache_
 27c:	7c 08 03 a6 	mtlr    r0			      |	 27c:	83 c1 00 18 	lwz     r30,24(r1)
 280:	4e 80 00 20 	blr				      |	 280:	83 a1 00 14 	lwz     r29,20(r1)
							      |	 284:	83 81 00 10 	lwz     r28,16(r1)
00000284 <update_mmu_cache>:				      |	 288:	80 01 00 24 	lwz     r0,36(r1)
 284:	4e 80 00 20 	blr				      |	 28c:	38 21 00 20 	addi    r1,r1,32
							      |	 290:	7c 08 03 a6 	mtlr    r0
00000288 <devmem_is_allowed>:				      |	 294:	4e 80 00 20 	blr
 288:	7c 08 02 a6 	mflr    r0			      |
 28c:	90 01 00 04 	stw     r0,4(r1)		      |	00000298 <update_mmu_cache>:
 290:	94 21 ff f0 	stwu    r1,-16(r1)		      |	 298:	4e 80 00 20 	blr
 294:	93 c1 00 08 	stw     r30,8(r1)		      |
 298:	7c 7e 1b 78 	mr      r30,r3			      |	0000029c <devmem_is_allowed>:
 29c:	54 63 65 3e 	rlwinm  r3,r3,12,20,31		      |	 29c:	7c 08 02 a6 	mflr    r0
 2a0:	57 c4 60 26 	rlwinm  r4,r30,12,0,19		      |	 2a0:	90 01 00 04 	stw     r0,4(r1)
 2a4:	48 00 00 01 	bl      2a4 <devmem_is_allowed+0x1c>  |	 2a4:	94 21 ff f0 	stwu    r1,-16(r1)
			2a4: R_PPC_PLTREL24	iomem_is_excl |	 2a8:	93 c1 00 08 	stw     r30,8(r1)
 2a8:	70 63 00 01 	andi.   r3,r3,1			      |	 2ac:	7c 7e 1b 78 	mr      r30,r3
 2ac:	38 60 00 00 	li      r3,0			      |	 2b0:	54 63 65 3e 	rlwinm  r3,r3,12,20,31
 2b0:	41 81 00 14 	bgt     2c4 <devmem_is_allowed+0x3c>  |	 2b4:	57 c4 60 26 	rlwinm  r4,r30,12,0,19
 2b4:	7f c3 f3 78 	mr      r3,r30			      |	 2b8:	48 00 00 01 	bl      2b8 <devmem_is_allowed+0x1c>
 2b8:	48 00 00 01 	bl      2b8 <devmem_is_allowed+0x30>  |				2b8: R_PPC_PLTREL24	iomem_is_excl
			2b8: R_PPC_PLTREL24	page_is_ram   |	 2bc:	70 63 00 01 	andi.   r3,r3,1
 2bc:	7c 63 00 34 	cntlzw  r3,r3			      |	 2c0:	38 60 00 00 	li      r3,0
 2c0:	54 63 df fe 	rlwinm  r3,r3,27,31,31		      |	 2c4:	41 81 00 14 	bgt     2d8 <devmem_is_allowed+0x3c>
 2c4:	83 c1 00 08 	lwz     r30,8(r1)		      |	 2c8:	7f c3 f3 78 	mr      r3,r30
 2c8:	80 01 00 14 	lwz     r0,20(r1)		      |	 2cc:	48 00 00 01 	bl      2cc <devmem_is_allowed+0x30>
 2cc:	38 21 00 10 	addi    r1,r1,16		      |				2cc: R_PPC_PLTREL24	page_is_ram
 2d0:	7c 08 03 a6 	mtlr    r0			      |	 2d0:	7c 63 00 34 	cntlzw  r3,r3
 2d4:	4e 80 00 20 	blr				      |	 2d4:	54 63 df fe 	rlwinm  r3,r3,27,31,31
							      >	 2d8:	83 c1 00 08 	lwz     r30,8(r1)
							      >	 2dc:	80 01 00 14 	lwz     r0,20(r1)
							      >	 2e0:	38 21 00 10 	addi    r1,r1,16
							      >	 2e4:	7c 08 03 a6 	mtlr    r0
							      >	 2e8:	4e 80 00 20 	blr

Disassembly of section .init.text:				Disassembly of section .init.text:

00000000 <mem_topology_setup>:					00000000 <mem_topology_setup>:
   0:	7c 08 02 a6 	mflr    r0				   0:	7c 08 02 a6 	mflr    r0
   4:	90 01 00 04 	stw     r0,4(r1)			   4:	90 01 00 04 	stw     r0,4(r1)
   8:	94 21 ff f0 	stwu    r1,-16(r1)			   8:	94 21 ff f0 	stwu    r1,-16(r1)
   c:	48 00 00 01 	bl      c <mem_topology_setup+0xc>	   c:	48 00 00 01 	bl      c <mem_topology_setup+0xc>
			c: R_PPC_PLTREL24	memblock_end_				c: R_PPC_PLTREL24	memblock_end_
  10:	54 84 a0 3e 	rotlwi  r4,r4,20			  10:	54 84 a0 3e 	rotlwi  r4,r4,20
  14:	3c a0 00 00 	lis     r5,0				  14:	3c a0 00 00 	lis     r5,0
			16: R_PPC_ADDR16_HA	max_pfn					16: R_PPC_ADDR16_HA	max_pfn
  18:	50 64 a0 16 	rlwimi  r4,r3,20,0,11			  18:	50 64 a0 16 	rlwimi  r4,r3,20,0,11
  1c:	3c 60 00 00 	lis     r3,0				  1c:	3c 60 00 00 	lis     r3,0
			1e: R_PPC_ADDR16_HA	max_low_pfn				1e: R_PPC_ADDR16_HA	max_low_pfn
  20:	90 85 00 00 	stw     r4,0(r5)			  20:	90 85 00 00 	stw     r4,0(r5)
			22: R_PPC_ADDR16_LO	max_pfn					22: R_PPC_ADDR16_LO	max_pfn
  24:	38 a0 ff ff 	li      r5,-1				  24:	38 a0 ff ff 	li      r5,-1
  28:	90 83 00 00 	stw     r4,0(r3)			  28:	90 83 00 00 	stw     r4,0(r3)
			2a: R_PPC_ADDR16_LO	max_low_pfn				2a: R_PPC_ADDR16_LO	max_low_pfn
  2c:	3c 60 00 00 	lis     r3,0				  2c:	3c 60 00 00 	lis     r3,0
			2e: R_PPC_ADDR16_HA	min_low_pfn				2e: R_PPC_ADDR16_HA	min_low_pfn
  30:	38 80 00 00 	li      r4,0				  30:	38 80 00 00 	li      r4,0
  34:	38 c0 ff ff 	li      r6,-1				  34:	38 c0 ff ff 	li      r6,-1
  38:	39 00 00 00 	li      r8,0				  38:	39 00 00 00 	li      r8,0
  3c:	90 83 00 00 	stw     r4,0(r3)			  3c:	90 83 00 00 	stw     r4,0(r3)
			3e: R_PPC_ADDR16_LO	min_low_pfn				3e: R_PPC_ADDR16_LO	min_low_pfn
  40:	3c 60 00 00 	lis     r3,0				  40:	3c 60 00 00 	lis     r3,0
			42: R_PPC_ADDR16_HA	memblock				42: R_PPC_ADDR16_HA	memblock
  44:	38 80 00 00 	li      r4,0				  44:	38 80 00 00 	li      r4,0
  48:	38 63 00 00 	addi    r3,r3,0				  48:	38 63 00 00 	addi    r3,r3,0
			4a: R_PPC_ADDR16_LO	memblock				4a: R_PPC_ADDR16_LO	memblock
  4c:	38 e3 00 10 	addi    r7,r3,16			  4c:	38 e3 00 10 	addi    r7,r3,16
  50:	38 60 00 00 	li      r3,0				  50:	38 60 00 00 	li      r3,0
  54:	48 00 00 01 	bl      54 <mem_topology_setup+0x54>	  54:	48 00 00 01 	bl      54 <mem_topology_setup+0x54>
			54: R_PPC_PLTREL24	memblock_set_				54: R_PPC_PLTREL24	memblock_set_
  58:	80 01 00 14 	lwz     r0,20(r1)			  58:	80 01 00 14 	lwz     r0,20(r1)
  5c:	38 21 00 10 	addi    r1,r1,16			  5c:	38 21 00 10 	addi    r1,r1,16
  60:	7c 08 03 a6 	mtlr    r0				  60:	7c 08 03 a6 	mtlr    r0
  64:	4e 80 00 20 	blr					  64:	4e 80 00 20 	blr

00000068 <initmem_init>:					00000068 <initmem_init>:
  68:	7c 08 02 a6 	mflr    r0				  68:	7c 08 02 a6 	mflr    r0
  6c:	90 01 00 04 	stw     r0,4(r1)			  6c:	90 01 00 04 	stw     r0,4(r1)
  70:	94 21 ff f0 	stwu    r1,-16(r1)			  70:	94 21 ff f0 	stwu    r1,-16(r1)
  74:	38 60 00 00 	li      r3,0				  74:	38 60 00 00 	li      r3,0
  78:	48 00 00 01 	bl      78 <initmem_init+0x10>		  78:	48 00 00 01 	bl      78 <initmem_init+0x10>
			78: R_PPC_PLTREL24	sparse_memory				78: R_PPC_PLTREL24	sparse_memory
  7c:	80 01 00 14 	lwz     r0,20(r1)			  7c:	80 01 00 14 	lwz     r0,20(r1)
  80:	38 21 00 10 	addi    r1,r1,16			  80:	38 21 00 10 	addi    r1,r1,16
  84:	7c 08 03 a6 	mtlr    r0				  84:	7c 08 03 a6 	mtlr    r0
  88:	4e 80 00 20 	blr					  88:	4e 80 00 20 	blr

0000008c <paging_init>:						0000008c <paging_init>:
  8c:	7c 08 02 a6 	mflr    r0				  8c:	7c 08 02 a6 	mflr    r0
  90:	90 01 00 04 	stw     r0,4(r1)			  90:	90 01 00 04 	stw     r0,4(r1)
  94:	94 21 ff d0 	stwu    r1,-48(r1)			  94:	94 21 ff d0 	stwu    r1,-48(r1)
  98:	93 21 00 14 	stw     r25,20(r1)			  98:	93 21 00 14 	stw     r25,20(r1)
  9c:	93 41 00 18 	stw     r26,24(r1)			  9c:	93 41 00 18 	stw     r26,24(r1)
  a0:	93 61 00 1c 	stw     r27,28(r1)			  a0:	93 61 00 1c 	stw     r27,28(r1)
  a4:	93 81 00 20 	stw     r28,32(r1)			  a4:	93 81 00 20 	stw     r28,32(r1)
  a8:	93 a1 00 24 	stw     r29,36(r1)			  a8:	93 a1 00 24 	stw     r29,36(r1)
  ac:	93 c1 00 28 	stw     r30,40(r1)			  ac:	93 c1 00 28 	stw     r30,40(r1)
  b0:	48 00 00 01 	bl      b0 <paging_init+0x24>		  b0:	48 00 00 01 	bl      b0 <paging_init+0x24>
			b0: R_PPC_PLTREL24	memblock_phys				b0: R_PPC_PLTREL24	memblock_phys
  b4:	7c 7e 1b 78 	mr      r30,r3				  b4:	7c 7e 1b 78 	mr      r30,r3
  b8:	7c 9d 23 78 	mr      r29,r4				  b8:	7c 9d 23 78 	mr      r29,r4
  bc:	3f 40 ff fe 	lis     r26,-2				  bc:	3f 40 ff fe 	lis     r26,-2
  c0:	48 00 00 01 	bl      c0 <paging_init+0x34>		  c0:	48 00 00 01 	bl      c0 <paging_init+0x34>
			c0: R_PPC_PLTREL24	memblock_end_				c0: R_PPC_PLTREL24	memblock_end_
  c4:	7c 7c 1b 78 	mr      r28,r3				  c4:	7c 7c 1b 78 	mr      r28,r3
  c8:	7c 9b 23 78 	mr      r27,r4				  c8:	7c 9b 23 78 	mr      r27,r4
  cc:	3b 20 00 00 	li      r25,0				  cc:	3b 20 00 00 	li      r25,0
  d0:	38 e1 00 08 	addi    r7,r1,8				  d0:	38 e1 00 08 	addi    r7,r1,8
  d4:	7f 43 d3 78 	mr      r3,r26				  d4:	7f 43 d3 78 	mr      r3,r26
  d8:	93 21 00 10 	stw     r25,16(r1)			  d8:	93 21 00 10 	stw     r25,16(r1)
  dc:	38 a0 00 00 	li      r5,0				  dc:	38 a0 00 00 	li      r5,0
  e0:	38 c0 00 00 	li      r6,0				  e0:	38 c0 00 00 	li      r6,0
  e4:	93 21 00 08 	stw     r25,8(r1)			  e4:	93 21 00 08 	stw     r25,8(r1)
  e8:	48 00 00 01 	bl      e8 <paging_init+0x5c>		  e8:	48 00 00 01 	bl      e8 <paging_init+0x5c>
			e8: R_PPC_PLTREL24	map_kernel_pa				e8: R_PPC_PLTREL24	map_kernel_pa
  ec:	3b 5a 10 00 	addi    r26,r26,4096			  ec:	3b 5a 10 00 	addi    r26,r26,4096
  f0:	2c 1a f0 00 	cmpwi   r26,-4096			  f0:	2c 1a f0 00 	cmpwi   r26,-4096
  f4:	40 82 ff dc 	bne     d0 <paging_init+0x44>		  f4:	40 82 ff dc 	bne     d0 <paging_init+0x44>
  f8:	3c 60 00 00 	lis     r3,0				  f8:	3c 60 00 00 	lis     r3,0
			fa: R_PPC_ADDR16_HA	.rodata.str1.				fa: R_PPC_ADDR16_HA	.rodata.str1.
  fc:	4c c6 31 82 	crclr   4*cr1+eq			  fc:	4c c6 31 82 	crclr   4*cr1+eq
 100:	7f 85 e3 78 	mr      r5,r28				 100:	7f 85 e3 78 	mr      r5,r28
 104:	38 63 00 00 	addi    r3,r3,0				 104:	38 63 00 00 	addi    r3,r3,0
			106: R_PPC_ADDR16_LO	.rodata.str1.				106: R_PPC_ADDR16_LO	.rodata.str1.
 108:	7f 66 db 78 	mr      r6,r27				 108:	7f 66 db 78 	mr      r6,r27
 10c:	7f c7 f3 78 	mr      r7,r30				 10c:	7f c7 f3 78 	mr      r7,r30
 110:	7f a8 eb 78 	mr      r8,r29				 110:	7f a8 eb 78 	mr      r8,r29
 114:	48 00 00 01 	bl      114 <paging_init+0x88>		 114:	48 00 00 01 	bl      114 <paging_init+0x88>
			114: R_PPC_PLTREL24	printk					114: R_PPC_PLTREL24	printk
 118:	7c 7d d8 10 	subfc   r3,r29,r27			 118:	7c 7d d8 10 	subfc   r3,r29,r27
 11c:	4c c6 31 82 	crclr   4*cr1+eq			 11c:	4c c6 31 82 	crclr   4*cr1+eq
 120:	7c be e1 10 	subfe   r5,r30,r28			 120:	7c be e1 10 	subfe   r5,r30,r28
 124:	54 64 60 3e 	rotlwi  r4,r3,12			 124:	54 64 60 3e 	rotlwi  r4,r3,12
 128:	3c 60 00 00 	lis     r3,0				 128:	3c 60 00 00 	lis     r3,0
			12a: R_PPC_ADDR16_HA	.rodata.str1.				12a: R_PPC_ADDR16_HA	.rodata.str1.
 12c:	50 a4 60 26 	rlwimi  r4,r5,12,0,19			 12c:	50 a4 60 26 	rlwimi  r4,r5,12,0,19
 130:	38 63 00 00 	addi    r3,r3,0				 130:	38 63 00 00 	addi    r3,r3,0
			132: R_PPC_ADDR16_LO	.rodata.str1.				132: R_PPC_ADDR16_LO	.rodata.str1.
 134:	48 00 00 01 	bl      134 <paging_init+0xa8>		 134:	48 00 00 01 	bl      134 <paging_init+0xa8>
			134: R_PPC_PLTREL24	printk					134: R_PPC_PLTREL24	printk
 138:	3c 60 00 00 	lis     r3,0				 138:	3c 60 00 00 	lis     r3,0
			13a: R_PPC_ADDR16_HA	max_low_pfn				13a: R_PPC_ADDR16_HA	max_low_pfn
 13c:	80 83 00 00 	lwz     r4,0(r3)			 13c:	80 83 00 00 	lwz     r4,0(r3)
			13e: R_PPC_ADDR16_LO	max_low_pfn				13e: R_PPC_ADDR16_LO	max_low_pfn
 140:	3c 60 00 00 	lis     r3,0				 140:	3c 60 00 00 	lis     r3,0
			142: R_PPC_ADDR16_HA	.bss+0x10				142: R_PPC_ADDR16_HA	.bss+0x10
 144:	94 83 00 00 	stwu    r4,0(r3)			 144:	94 83 00 00 	stwu    r4,0(r3)
			146: R_PPC_ADDR16_LO	.bss+0x10				146: R_PPC_ADDR16_LO	.bss+0x10
 148:	48 00 00 01 	bl      148 <paging_init+0xbc>		 148:	48 00 00 01 	bl      148 <paging_init+0xbc>
			148: R_PPC_PLTREL24	free_area_ini				148: R_PPC_PLTREL24	free_area_ini
 14c:	83 c1 00 28 	lwz     r30,40(r1)			 14c:	83 c1 00 28 	lwz     r30,40(r1)
 150:	83 a1 00 24 	lwz     r29,36(r1)			 150:	83 a1 00 24 	lwz     r29,36(r1)
 154:	83 81 00 20 	lwz     r28,32(r1)			 154:	83 81 00 20 	lwz     r28,32(r1)
 158:	83 61 00 1c 	lwz     r27,28(r1)			 158:	83 61 00 1c 	lwz     r27,28(r1)
 15c:	83 41 00 18 	lwz     r26,24(r1)			 15c:	83 41 00 18 	lwz     r26,24(r1)
 160:	83 21 00 14 	lwz     r25,20(r1)			 160:	83 21 00 14 	lwz     r25,20(r1)
 164:	80 01 00 34 	lwz     r0,52(r1)			 164:	80 01 00 34 	lwz     r0,52(r1)
 168:	38 21 00 30 	addi    r1,r1,48			 168:	38 21 00 30 	addi    r1,r1,48
 16c:	7c 08 03 a6 	mtlr    r0				 16c:	7c 08 03 a6 	mtlr    r0
 170:	4e 80 00 20 	blr					 170:	4e 80 00 20 	blr

00000174 <mem_init>:						00000174 <mem_init>:
 174:	7c 08 02 a6 	mflr    r0				 174:	7c 08 02 a6 	mflr    r0
 178:	90 01 00 04 	stw     r0,4(r1)			 178:	90 01 00 04 	stw     r0,4(r1)
 17c:	94 21 ff e0 	stwu    r1,-32(r1)			 17c:	94 21 ff e0 	stwu    r1,-32(r1)
 180:	3c 60 00 00 	lis     r3,0				 180:	3c 60 00 00 	lis     r3,0
			182: R_PPC_ADDR16_HA	max_low_pfn				182: R_PPC_ADDR16_HA	max_low_pfn
 184:	3c 80 00 00 	lis     r4,0				 184:	3c 80 00 00 	lis     r4,0
			186: R_PPC_ADDR16_HA	max_pfn					186: R_PPC_ADDR16_HA	max_pfn
 188:	93 81 00 10 	stw     r28,16(r1)			 188:	93 81 00 10 	stw     r28,16(r1)
 18c:	3f 80 00 00 	lis     r28,0				 18c:	3f 80 00 00 	lis     r28,0
			18e: R_PPC_ADDR16_HA	high_memory				18e: R_PPC_ADDR16_HA	high_memory
 190:	80 63 00 00 	lwz     r3,0(r3)			 190:	80 63 00 00 	lwz     r3,0(r3)
			192: R_PPC_ADDR16_LO	max_low_pfn				192: R_PPC_ADDR16_LO	max_low_pfn
 194:	80 84 00 00 	lwz     r4,0(r4)			 194:	80 84 00 00 	lwz     r4,0(r4)
			196: R_PPC_ADDR16_LO	max_pfn					196: R_PPC_ADDR16_LO	max_pfn
 198:	54 63 60 26 	rlwinm  r3,r3,12,0,19			 198:	54 63 60 26 	rlwinm  r3,r3,12,0,19
 19c:	3c 63 c0 00 	addis   r3,r3,-16384			 19c:	3c 63 c0 00 	addis   r3,r3,-16384
 1a0:	90 7c 00 00 	stw     r3,0(r28)			 1a0:	90 7c 00 00 	stw     r3,0(r28)
			1a2: R_PPC_ADDR16_LO	high_memory				1a2: R_PPC_ADDR16_LO	high_memory
 1a4:	3c 60 00 00 	lis     r3,0				 1a4:	3c 60 00 00 	lis     r3,0
			1a6: R_PPC_ADDR16_HA	max_mapnr				1a6: R_PPC_ADDR16_HA	max_mapnr
 1a8:	93 a1 00 14 	stw     r29,20(r1)			 1a8:	93 a1 00 14 	stw     r29,20(r1)
 1ac:	93 c1 00 18 	stw     r30,24(r1)			 1ac:	93 c1 00 18 	stw     r30,24(r1)
 1b0:	90 83 00 00 	stw     r4,0(r3)			 1b0:	90 83 00 00 	stw     r4,0(r3)
			1b2: R_PPC_ADDR16_LO	max_mapnr				1b2: R_PPC_ADDR16_LO	max_mapnr
 1b4:	48 00 00 01 	bl      1b4 <mem_init+0x40>		 1b4:	48 00 00 01 	bl      1b4 <mem_init+0x40>
			1b4: R_PPC_PLTREL24	memblock_free				1b4: R_PPC_PLTREL24	memblock_free
 1b8:	38 60 00 00 	li      r3,0				 1b8:	38 60 00 00 	li      r3,0
 1bc:	48 00 00 01 	bl      1bc <mem_init+0x48>		 1bc:	48 00 00 01 	bl      1bc <mem_init+0x48>
			1bc: R_PPC_PLTREL24	mem_init_prin				1bc: R_PPC_PLTREL24	mem_init_prin
 1c0:	3c 60 00 00 	lis     r3,0				 1c0:	3c 60 00 00 	lis     r3,0
			1c2: R_PPC_ADDR16_HA	.rodata.str1.				1c2: R_PPC_ADDR16_HA	.rodata.str1.
 1c4:	4c c6 31 82 	crclr   4*cr1+eq			 1c4:	4c c6 31 82 	crclr   4*cr1+eq
 1c8:	38 63 00 00 	addi    r3,r3,0				 1c8:	38 63 00 00 	addi    r3,r3,0
			1ca: R_PPC_ADDR16_LO	.rodata.str1.				1ca: R_PPC_ADDR16_LO	.rodata.str1.
 1cc:	48 00 00 01 	bl      1cc <mem_init+0x58>		 1cc:	48 00 00 01 	bl      1cc <mem_init+0x58>
			1cc: R_PPC_PLTREL24	printk					1cc: R_PPC_PLTREL24	printk
 1d0:	3c 80 ff fd 	lis     r4,-3				 1d0:	3c 80 ff fd 	lis     r4,-3
 1d4:	3c 60 00 00 	lis     r3,0				 1d4:	3c 60 00 00 	lis     r3,0
			1d6: R_PPC_ADDR16_HA	.rodata.str1.				1d6: R_PPC_ADDR16_HA	.rodata.str1.
 1d8:	4c c6 31 82 	crclr   4*cr1+eq			 1d8:	4c c6 31 82 	crclr   4*cr1+eq
 1dc:	60 9e f0 00 	ori     r30,r4,61440			 1dc:	60 9e f0 00 	ori     r30,r4,61440
 1e0:	38 63 00 00 	addi    r3,r3,0				 1e0:	38 63 00 00 	addi    r3,r3,0
			1e2: R_PPC_ADDR16_LO	.rodata.str1.				1e2: R_PPC_ADDR16_LO	.rodata.str1.
 1e4:	7f c4 f3 78 	mr      r4,r30				 1e4:	7f c4 f3 78 	mr      r4,r30
 1e8:	38 a0 f0 00 	li      r5,-4096			 1e8:	38 a0 f0 00 	li      r5,-4096
 1ec:	48 00 00 01 	bl      1ec <mem_init+0x78>		 1ec:	48 00 00 01 	bl      1ec <mem_init+0x78>
			1ec: R_PPC_PLTREL24	printk					1ec: R_PPC_PLTREL24	printk
 1f0:	3c 80 ff dd 	lis     r4,-35				 1f0:	3c 80 ff dd 	lis     r4,-35
 1f4:	3c 60 00 00 	lis     r3,0				 1f4:	3c 60 00 00 	lis     r3,0
			1f6: R_PPC_ADDR16_HA	.rodata.str1.				1f6: R_PPC_ADDR16_HA	.rodata.str1.
 1f8:	4c c6 31 82 	crclr   4*cr1+eq			 1f8:	4c c6 31 82 	crclr   4*cr1+eq
 1fc:	60 9d f0 00 	ori     r29,r4,61440			 1fc:	60 9d f0 00 	ori     r29,r4,61440
 200:	38 63 00 00 	addi    r3,r3,0				 200:	38 63 00 00 	addi    r3,r3,0
			202: R_PPC_ADDR16_LO	.rodata.str1.				202: R_PPC_ADDR16_LO	.rodata.str1.
 204:	7f a4 eb 78 	mr      r4,r29				 204:	7f a4 eb 78 	mr      r4,r29
 208:	7f c5 f3 78 	mr      r5,r30				 208:	7f c5 f3 78 	mr      r5,r30
 20c:	48 00 00 01 	bl      20c <mem_init+0x98>		 20c:	48 00 00 01 	bl      20c <mem_init+0x98>
			20c: R_PPC_PLTREL24	printk					20c: R_PPC_PLTREL24	printk
 210:	3f c0 00 00 	lis     r30,0				 210:	3f c0 00 00 	lis     r30,0
			212: R_PPC_ADDR16_HA	ioremap_bot				212: R_PPC_ADDR16_HA	ioremap_bot
 214:	3c 60 00 00 	lis     r3,0				 214:	3c 60 00 00 	lis     r3,0
			216: R_PPC_ADDR16_HA	.rodata.str1.				216: R_PPC_ADDR16_HA	.rodata.str1.
 218:	4c c6 31 82 	crclr   4*cr1+eq			 218:	4c c6 31 82 	crclr   4*cr1+eq
 21c:	80 9e 00 00 	lwz     r4,0(r30)			 21c:	80 9e 00 00 	lwz     r4,0(r30)
			21e: R_PPC_ADDR16_LO	ioremap_bot				21e: R_PPC_ADDR16_LO	ioremap_bot
 220:	38 63 00 00 	addi    r3,r3,0				 220:	38 63 00 00 	addi    r3,r3,0
			222: R_PPC_ADDR16_LO	.rodata.str1.				222: R_PPC_ADDR16_LO	.rodata.str1.
 224:	7f a5 eb 78 	mr      r5,r29				 224:	7f a5 eb 78 	mr      r5,r29
 228:	48 00 00 01 	bl      228 <mem_init+0xb4>		 228:	48 00 00 01 	bl      228 <mem_init+0xb4>
			228: R_PPC_PLTREL24	printk					228: R_PPC_PLTREL24	printk
 22c:	80 7c 00 00 	lwz     r3,0(r28)			 22c:	80 7c 00 00 	lwz     r3,0(r28)
			22e: R_PPC_ADDR16_LO	high_memory				22e: R_PPC_ADDR16_LO	high_memory
 230:	3c 80 01 00 	lis     r4,256				 230:	3c 80 01 00 	lis     r4,256
 234:	4c c6 31 82 	crclr   4*cr1+eq			 234:	4c c6 31 82 	crclr   4*cr1+eq
 238:	38 63 ff ff 	addi    r3,r3,-1			 238:	38 63 ff ff 	addi    r3,r3,-1
 23c:	80 be 00 00 	lwz     r5,0(r30)			 23c:	80 be 00 00 	lwz     r5,0(r30)
			23e: R_PPC_ADDR16_LO	ioremap_bot				23e: R_PPC_ADDR16_LO	ioremap_bot
 240:	3c 63 10 00 	addis   r3,r3,4096			 240:	3c 63 10 00 	addis   r3,r3,4096
 244:	54 63 00 06 	rlwinm  r3,r3,0,0,3			 244:	54 63 00 06 	rlwinm  r3,r3,0,0,3
 248:	50 64 02 0c 	rlwimi  r4,r3,0,8,6			 248:	50 64 02 0c 	rlwimi  r4,r3,0,8,6
 24c:	3c 60 00 00 	lis     r3,0				 24c:	3c 60 00 00 	lis     r3,0
			24e: R_PPC_ADDR16_HA	.rodata.str1.				24e: R_PPC_ADDR16_HA	.rodata.str1.
 250:	38 63 00 00 	addi    r3,r3,0				 250:	38 63 00 00 	addi    r3,r3,0
			252: R_PPC_ADDR16_LO	.rodata.str1.				252: R_PPC_ADDR16_LO	.rodata.str1.
 254:	48 00 00 01 	bl      254 <mem_init+0xe0>		 254:	48 00 00 01 	bl      254 <mem_init+0xe0>
			254: R_PPC_PLTREL24	printk					254: R_PPC_PLTREL24	printk
 258:	83 c1 00 18 	lwz     r30,24(r1)			 258:	83 c1 00 18 	lwz     r30,24(r1)
 25c:	83 a1 00 14 	lwz     r29,20(r1)			 25c:	83 a1 00 14 	lwz     r29,20(r1)
 260:	83 81 00 10 	lwz     r28,16(r1)			 260:	83 81 00 10 	lwz     r28,16(r1)
 264:	80 01 00 24 	lwz     r0,36(r1)			 264:	80 01 00 24 	lwz     r0,36(r1)
 268:	38 21 00 20 	addi    r1,r1,32			 268:	38 21 00 20 	addi    r1,r1,32
 26c:	7c 08 03 a6 	mtlr    r0				 26c:	7c 08 03 a6 	mtlr    r0
 270:	4e 80 00 20 	blr					 270:	4e 80 00 20 	blr

00000274 <add_system_ram_resources>:				00000274 <add_system_ram_resources>:
 274:	7c 08 02 a6 	mflr    r0				 274:	7c 08 02 a6 	mflr    r0
 278:	90 01 00 04 	stw     r0,4(r1)			 278:	90 01 00 04 	stw     r0,4(r1)
 27c:	94 21 ff c0 	stwu    r1,-64(r1)			 27c:	94 21 ff c0 	stwu    r1,-64(r1)
 280:	3c 60 00 00 	lis     r3,0				 280:	3c 60 00 00 	lis     r3,0
			282: R_PPC_ADDR16_HA	memblock				282: R_PPC_ADDR16_HA	memblock
 284:	93 a1 00 34 	stw     r29,52(r1)			 284:	93 a1 00 34 	stw     r29,52(r1)
 288:	3b a3 00 00 	addi    r29,r3,0			 288:	3b a3 00 00 	addi    r29,r3,0
			28a: R_PPC_ADDR16_LO	memblock				28a: R_PPC_ADDR16_LO	memblock
 28c:	80 7d 00 10 	lwz     r3,16(r29)			 28c:	80 7d 00 10 	lwz     r3,16(r29)
 290:	93 81 00 30 	stw     r28,48(r1)			 290:	93 81 00 30 	stw     r28,48(r1)
 294:	1c 63 00 18 	mulli   r3,r3,24			 294:	1c 63 00 18 	mulli   r3,r3,24
 298:	83 9d 00 20 	lwz     r28,32(r29)			 298:	83 9d 00 20 	lwz     r28,32(r29)
 29c:	7c 7c 1a 14 	add     r3,r28,r3			 29c:	7c 7c 1a 14 	add     r3,r28,r3
 2a0:	92 a1 00 14 	stw     r21,20(r1)			 2a0:	92 a1 00 14 	stw     r21,20(r1)
 2a4:	7c 1c 18 40 	cmplw   r28,r3				 2a4:	7c 1c 18 40 	cmplw   r28,r3
 2a8:	92 c1 00 18 	stw     r22,24(r1)			 2a8:	92 c1 00 18 	stw     r22,24(r1)
 2ac:	92 e1 00 1c 	stw     r23,28(r1)			 2ac:	92 e1 00 1c 	stw     r23,28(r1)
 2b0:	93 01 00 20 	stw     r24,32(r1)			 2b0:	93 01 00 20 	stw     r24,32(r1)
 2b4:	93 21 00 24 	stw     r25,36(r1)			 2b4:	93 21 00 24 	stw     r25,36(r1)
 2b8:	93 41 00 28 	stw     r26,40(r1)			 2b8:	93 41 00 28 	stw     r26,40(r1)
 2bc:	93 61 00 2c 	stw     r27,44(r1)			 2bc:	93 61 00 2c 	stw     r27,44(r1)
 2c0:	93 c1 00 38 	stw     r30,56(r1)			 2c0:	93 c1 00 38 	stw     r30,56(r1)
 2c4:	40 80 00 ac 	bge     370 <add_system_ram_resources	 2c4:	40 80 00 ac 	bge     370 <add_system_ram_resources
 2c8:	3c 60 00 00 	lis     r3,0				 2c8:	3c 60 00 00 	lis     r3,0
			2ca: R_PPC_ADDR16_HA	kmalloc_cache				2ca: R_PPC_ADDR16_HA	kmalloc_cache
 2cc:	3c 80 00 00 	lis     r4,0				 2cc:	3c 80 00 00 	lis     r4,0
			2ce: R_PPC_ADDR16_HA	.rodata.str1.				2ce: R_PPC_ADDR16_HA	.rodata.str1.
 2d0:	3c a0 81 00 	lis     r5,-32512			 2d0:	3c a0 81 00 	lis     r5,-32512
 2d4:	3c c0 00 00 	lis     r6,0				 2d4:	3c c0 00 00 	lis     r6,0
			2d6: R_PPC_ADDR16_HA	iomem_resourc				2d6: R_PPC_ADDR16_HA	iomem_resourc
 2d8:	3b 7c ff e8 	addi    r27,r28,-24			 2d8:	3b 7c ff e8 	addi    r27,r28,-24
 2dc:	3b 40 00 00 	li      r26,0				 2dc:	3b 40 00 00 	li      r26,0
 2e0:	3b 23 00 00 	addi    r25,r3,0			 2e0:	3b 23 00 00 	addi    r25,r3,0
			2e2: R_PPC_ADDR16_LO	kmalloc_cache				2e2: R_PPC_ADDR16_LO	kmalloc_cache
 2e4:	3b 04 00 00 	addi    r24,r4,0			 2e4:	3b 04 00 00 	addi    r24,r4,0
			2e6: R_PPC_ADDR16_LO	.rodata.str1.				2e6: R_PPC_ADDR16_LO	.rodata.str1.
 2e8:	60 b7 02 00 	ori     r23,r5,512			 2e8:	60 b7 02 00 	ori     r23,r5,512
 2ec:	3b c6 00 00 	addi    r30,r6,0			 2ec:	3b c6 00 00 	addi    r30,r6,0
			2ee: R_PPC_ADDR16_LO	iomem_resourc				2ee: R_PPC_ADDR16_LO	iomem_resourc
 2f0:	80 79 00 18 	lwz     r3,24(r25)			 2f0:	80 79 00 18 	lwz     r3,24(r25)
 2f4:	38 80 0d c0 	li      r4,3520				 2f4:	38 80 0d c0 	li      r4,3520
 2f8:	38 a0 00 28 	li      r5,40				 2f8:	38 a0 00 28 	li      r5,40
 2fc:	82 db 00 1c 	lwz     r22,28(r27)			 2fc:	82 db 00 1c 	lwz     r22,28(r27)
 300:	82 bb 00 24 	lwz     r21,36(r27)			 300:	82 bb 00 24 	lwz     r21,36(r27)
 304:	48 00 00 01 	bl      304 <add_system_ram_resources	 304:	48 00 00 01 	bl      304 <add_system_ram_resources
			304: R_PPC_PLTREL24	kmem_cache_al				304: R_PPC_PLTREL24	kmem_cache_al
 308:	7c 64 1b 78 	mr      r4,r3				 308:	7c 64 1b 78 	mr      r4,r3
 30c:	7c 63 00 34 	cntlzw  r3,r3				 30c:	7c 63 00 34 	cntlzw  r3,r3
 310:	28 04 00 00 	cmplwi  r4,0				 310:	28 04 00 00 	cmplwi  r4,0
 314:	54 63 df fe 	rlwinm  r3,r3,27,31,31			 314:	54 63 df fe 	rlwinm  r3,r3,27,31,31
 318:	0f 03 00 00 	twnei   r3,0				 318:	0f 03 00 00 	twnei   r3,0
 31c:	41 82 00 34 	beq     350 <add_system_ram_resources	 31c:	41 82 00 34 	beq     350 <add_system_ram_resources
 320:	7c 76 aa 14 	add     r3,r22,r21			 320:	7c 76 aa 14 	add     r3,r22,r21
 324:	93 04 00 10 	stw     r24,16(r4)			 324:	93 04 00 10 	stw     r24,16(r4)
 328:	38 63 ff ff 	addi    r3,r3,-1			 328:	38 63 ff ff 	addi    r3,r3,-1
 32c:	90 64 00 0c 	stw     r3,12(r4)			 32c:	90 64 00 0c 	stw     r3,12(r4)
 330:	7f c3 f3 78 	mr      r3,r30				 330:	7f c3 f3 78 	mr      r3,r30
 334:	93 44 00 00 	stw     r26,0(r4)			 334:	93 44 00 00 	stw     r26,0(r4)
 338:	92 c4 00 04 	stw     r22,4(r4)			 338:	92 c4 00 04 	stw     r22,4(r4)
 33c:	93 44 00 08 	stw     r26,8(r4)			 33c:	93 44 00 08 	stw     r26,8(r4)
 340:	92 e4 00 14 	stw     r23,20(r4)			 340:	92 e4 00 14 	stw     r23,20(r4)
 344:	48 00 00 01 	bl      344 <add_system_ram_resources	 344:	48 00 00 01 	bl      344 <add_system_ram_resources
			344: R_PPC_PLTREL24	request_resou				344: R_PPC_PLTREL24	request_resou
 348:	54 63 0f fe 	rlwinm  r3,r3,1,31,31			 348:	54 63 0f fe 	rlwinm  r3,r3,1,31,31
 34c:	0f 03 00 00 	twnei   r3,0				 34c:	0f 03 00 00 	twnei   r3,0
 350:	80 7d 00 10 	lwz     r3,16(r29)			 350:	80 7d 00 10 	lwz     r3,16(r29)
 354:	3b 9c 00 18 	addi    r28,r28,24			 354:	3b 9c 00 18 	addi    r28,r28,24
 358:	3b 7b 00 18 	addi    r27,r27,24			 358:	3b 7b 00 18 	addi    r27,r27,24
 35c:	80 9d 00 20 	lwz     r4,32(r29)			 35c:	80 9d 00 20 	lwz     r4,32(r29)
 360:	1c 63 00 18 	mulli   r3,r3,24			 360:	1c 63 00 18 	mulli   r3,r3,24
 364:	7c 64 1a 14 	add     r3,r4,r3			 364:	7c 64 1a 14 	add     r3,r4,r3
 368:	7c 1c 18 40 	cmplw   r28,r3				 368:	7c 1c 18 40 	cmplw   r28,r3
 36c:	41 80 ff 84 	blt     2f0 <add_system_ram_resources	 36c:	41 80 ff 84 	blt     2f0 <add_system_ram_resources
 370:	38 60 00 00 	li      r3,0				 370:	38 60 00 00 	li      r3,0
 374:	83 c1 00 38 	lwz     r30,56(r1)			 374:	83 c1 00 38 	lwz     r30,56(r1)
 378:	83 a1 00 34 	lwz     r29,52(r1)			 378:	83 a1 00 34 	lwz     r29,52(r1)
 37c:	83 81 00 30 	lwz     r28,48(r1)			 37c:	83 81 00 30 	lwz     r28,48(r1)
 380:	83 61 00 2c 	lwz     r27,44(r1)			 380:	83 61 00 2c 	lwz     r27,44(r1)
 384:	83 41 00 28 	lwz     r26,40(r1)			 384:	83 41 00 28 	lwz     r26,40(r1)
 388:	83 21 00 24 	lwz     r25,36(r1)			 388:	83 21 00 24 	lwz     r25,36(r1)
 38c:	83 01 00 20 	lwz     r24,32(r1)			 38c:	83 01 00 20 	lwz     r24,32(r1)
 390:	82 e1 00 1c 	lwz     r23,28(r1)			 390:	82 e1 00 1c 	lwz     r23,28(r1)
 394:	82 c1 00 18 	lwz     r22,24(r1)			 394:	82 c1 00 18 	lwz     r22,24(r1)
 398:	82 a1 00 14 	lwz     r21,20(r1)			 398:	82 a1 00 14 	lwz     r21,20(r1)
 39c:	80 01 00 44 	lwz     r0,68(r1)			 39c:	80 01 00 44 	lwz     r0,68(r1)
 3a0:	38 21 00 40 	addi    r1,r1,64			 3a0:	38 21 00 40 	addi    r1,r1,64
 3a4:	7c 08 03 a6 	mtlr    r0				 3a4:	7c 08 03 a6 	mtlr    r0
 3a8:	4e 80 00 20 	blr					 3a8:	4e 80 00 20 	blr

--HcAYCG3uE/tztfnV--

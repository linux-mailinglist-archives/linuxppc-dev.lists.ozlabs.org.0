Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E05C524F217
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 07:11:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BZgFK718mzDqRN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Aug 2020 15:11:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BZgBw2LHGzDqRH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Aug 2020 15:08:53 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BZgBf4c5Hz9v04S;
 Mon, 24 Aug 2020 07:08:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id oWlKwc7RY5da; Mon, 24 Aug 2020 07:08:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BZgBf2vFnz9v04R;
 Mon, 24 Aug 2020 07:08:42 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 32C318B7CA;
 Mon, 24 Aug 2020 07:08:47 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2myb4NHGX_Q3; Mon, 24 Aug 2020 07:08:47 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BD99A8B767;
 Mon, 24 Aug 2020 07:08:46 +0200 (CEST)
Subject: Re: Oops decoding help request
To: Giuseppe Sacco <giuseppe@sguazz.it>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <45033654b9663c7b7d32991249195d66f56e2f1b.camel@sguazz.it>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5aaf7abe-0bd1-cea9-5c4c-b8119b01e7f2@csgroup.eu>
Date: Mon, 24 Aug 2020 07:08:39 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <45033654b9663c7b7d32991249195d66f56e2f1b.camel@sguazz.it>
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

Hi,

Le 23/08/2020 à 19:26, Giuseppe Sacco a écrit :
> Hello,
> I am not a kernel developer and I need much help in order to understand
> a kernel Oops (the first of a series of three Oops). It is:

This is a bug in the kernel. It is fixed in 5.9-rc2.

See the following commit: 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/arch/powerpc/mm/book3s32/mmu.c?h=v5.9-rc2&id=541cebb51f3422d4f2c6cb95c1e5cc3dcc9e5021

Christophe

> 
> kernel tried to execute exec-protected page (f1020000) - exploit attempt? (uid: 0)
> BUG: Unable to handle kernel instruction fetch
> Faulting instruction address: 0xf1020000
> Oops: Kernel access of bad area, sig: 11 [#1]
> BE PAGE_SIZE=4K MMU=Hash PowerMac
> Modules linked in: crct10dif_generic (+) crct10dif_common drm_panel_orientation_quirks
> CPU: 0 PID: 71 Comm: systemd-udevd Not tainted 5.9.0-rc1+ #298
> NIP:  f1020000 LR: c00053a4 CTR: f1020000
> REGS: c1c6dd50 TRAP: 0400   Not tainted  (5.9.0-rc1+)
> MSR:  10009032 <EE,ME,IR,DR,RI>  CR: 22222284  XER: 00000000
> 
> GPR00: c0005390 c1c6de08 c1c6b400 00000000 00000cc0 00000008 ef6db038 00000001
> GPR08: 0000002e 00000000 00000000 00000000 22222284 00b6fb58 00000000 00000005
> GPR16: bff0d768 bff0d770 00000000 00000000 01032cc0 00000000 00b0b31f 01020960
> GPR24: 00000000 00b70954 010206c0 ef39f4a0 00000000 00a28380 f1020000 f10193a0
> NIP [f1020000] crct10dif_mod_init+0x0/0x60 [crct10dif_generic]
> LR [c00053a4] do_one_initcall+0x50/0x1f4
> Call Trace:
> [c1c6de08] [c0005390] do_one_initcall+0x3c/0x1f4 (unreliable)
> [c1c6de78] [c0102068] do_init_module+0x6c/0x27c
> [c1c6dea8] [c01053cc] sys_finit_module+0xc0/0x12c
> [c1c6df38] [c001c11c] ret_from_syscall+0x0/0x34
> --- interrupt: c01 at 0x7a7780
>      LR = 0xa1bf64
> Instruction dump:
> XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
> XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX <7c0802a6> 90010004 60000000 9421fff0
> ---[ end trace 257a4bbda691894e ]---
> 
>  From what I understand, this is a problem in the init function of
> module crct10dif_generic jumping at address f1020000.
> 
> I think I understand that f1020000 is an address for data and not for
> code. In fact it belongs to "vmalloc & ioremap" area of the virtual
> memory layout:
>    * 0xffbee000..0xfffff000  : fixmap
>    * 0xff400000..0xff800000  : highmem PTEs
>    * 0xfda27000..0xff400000  : early ioremap
>    * 0xf1000000..0xfda27000  : vmalloc & ioremap
> 
> The init function is:
> 
> 00000000 <init_module>:
>     0:	7c 08 02 a6 	mflr    r0
>     4:	90 01 00 04 	stw     r0,4(r1)
>     8:	48 00 00 01 	bl      8 <init_module+0x8>
>     c:	94 21 ff f0 	stwu    r1,-16(r1)
>    10:	7c 08 02 a6 	mflr    r0
>    14:	3c 60 00 00 	lis     r3,0
>    18:	90 01 00 14 	stw     r0,20(r1)
>    1c:	38 63 00 00 	addi    r3,r3,0
>    20:	80 01 00 14 	lwz     r0,20(r1)
>    24:	38 21 00 10 	addi    r1,r1,16
>    28:	7c 08 03 a6 	mtlr    r0
>    2c:	48 00 00 00 	b       2c <init_module+0x2c>
> 
> and its source code is:
> 
> static int __init crct10dif_mod_init(void)
> {
>          return crypto_register_shash(&alg);
> }
> 
> This is what I am not understanding. The error message seems to imply
> that code jumps to an invalid address, so the problem would be that
> address of function crypto_register_shash is calculated wrongly.
> 
> About stack addresses, please note that CONFIG_VMAP_STACK is not set.
> 
> Is this a correct reasoning?
> 
> Thank you very much,
> Giuseppe
> 

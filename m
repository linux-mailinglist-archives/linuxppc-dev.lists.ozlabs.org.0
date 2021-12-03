Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BA74687A9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 22:40:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J635w4xXSz3c87
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Dec 2021 08:40:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=srs.iliad.fr (client-ip=212.27.33.1; helo=ns.iliad.fr;
 envelope-from=srs0=xiglqk=qu=freebox.fr=mbizon@srs.iliad.fr;
 receiver=<UNKNOWN>)
X-Greylist: delayed 427 seconds by postgrey-1.36 at boromir;
 Sat, 04 Dec 2021 05:50:42 AEDT
Received: from ns.iliad.fr (ns.iliad.fr [212.27.33.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5MN252dnz3058
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 05:50:42 +1100 (AEDT)
Received: from ns.iliad.fr (localhost [127.0.0.1])
 by ns.iliad.fr (Postfix) with ESMTP id EB93320108;
 Fri,  3 Dec 2021 19:43:27 +0100 (CET)
Received: from sakura (freebox.vlq16.iliad.fr [213.36.7.13])
 by ns.iliad.fr (Postfix) with ESMTP id DDB4E20013;
 Fri,  3 Dec 2021 19:43:27 +0100 (CET)
Message-ID: <913068d2c368c80f89d6f9575d6b41e6fab48ae2.camel@freebox.fr>
Subject: Re: Fail to boot 5.15 on mpc8347 with either debug_pagealloc or nobats
From: Maxime Bizon <mbizon@freebox.fr>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Date: Fri, 03 Dec 2021 19:43:27 +0100
In-Reply-To: <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
References: <f23763d551e65d4a225ba13c7898f83853c2aeaf.camel@freebox.fr>
 <68bf4c39-53ce-f88f-383f-5defb1a36b1c@csgroup.eu>
Organization: Freebox
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: ClamAV using ClamSMTP ; ns.iliad.fr ;
 Fri Dec  3 19:43:27 2021 +0100 (CET)
X-Mailman-Approved-At: Sun, 05 Dec 2021 08:40:32 +1100
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
Reply-To: mbizon@freebox.fr
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Fri, 2021-12-03 at 12:49 +0000, Christophe Leroy wrote:

Hello,

> I need to think a bit more about it to find the cleanest solution
> that works for all platforms.

Maybe related, when enabling KASAN on that same platform, it oopses early.

I have picked the patch "powerpc/32s: Fix shift-out-of-bounds in KASAN
init", and that does not fix it


For some mem= values like 769M, all BATs are used for kernel linear
mapping, and there are none left to map the KASAN shadow area in
kasan/book3s_32.c => no oops

If I don't compile kasan/book3s_32.c and use weak implementation => no
oops


But for mem=768M, it oopses

I added some debugs in kasan init and dumped BATs content (BAT 7 is my
debug BAT for uart)

[    0.000000] kasan_init_region: start=0xc0000000 size:0x30000000
[    0.000000] kasan_init_region: k_start:0xf8000000 k_end:0xfe000000 k_size:0x6000000 k_size_base=0x2000000
[    0.000000] kasan_init_region: IF{} k_size_more:0x4000000
[    0.000000] setbat index=3 virt:0xf8000000 phys:0x2a000000 size:0x2000000
[    0.000000] setbat index=4 virt:0xfa000000 phys:0x2c000000 size:0x4000000
[    0.000000] kasan_init_region: final k_cur=0xfe000000
[    0.000000] 
[    0.000000] ---[ Data Block Address Translation ]---
[    0.000000] 0: 0xc0000000-0xcfffffff 0x00000000       256M Kernel rw      m  
[    0.000000] 1: 0xd0000000-0xdfffffff 0x10000000       256M Kernel rw      m  
[    0.000000] 2: 0xe0000000-0xefffffff 0x20000000       256M Kernel rw      m  
[    0.000000] 3: 0xf8000000-0xf9ffffff 0x2a000000        32M Kernel rw      m  
[    0.000000] 4: 0xfa000000-0xfdffffff 0x2c000000        64M Kernel rw      m  
[    0.000000] 5:         -
[    0.000000] 6:         -
[    0.000000] 7: 0xb0000000-0xb00fffff 0xe0000000         1M Kernel rw    i   g
[    0.000000] BUG: Unable to handle kernel data access on read at 0xfd3fce00
[    0.000000] Faulting instruction address: 0xc013ed84
[    0.000000] Oops: Kernel access of bad area, sig: 11 [#1]
[    0.000000] BE PAGE_SIZE=4K 
[    0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 5.15.0+ #379
[    0.000000] NIP:  c013ed84 LR: c0140264 CTR: 00000020
[    0.000000] REGS: c0b07dd0 TRAP: 0300   Not tainted  (5.15.0+)
[    0.000000] MSR:  00001032 <ME,IR,DR,RI>  CR: 28222448  XER: 00000000
[    0.000000] DAR: fd3fce00 DSISR: 20000000 
[    0.000000] GPR00: fd3fd000 c0b07e80 c09c8a20 0000003f 00001000 00000001 c08c67a8 e9fe7fff 
[    0.000000] GPR08: e9fe7000 fd3fce00 00000020 fd3fcfff 00000000 00000000 3ff9c5f0 3fffd79c 
[    0.000000] GPR16: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000 
[    0.000000] GPR24: 00000000 feffffff 00000591 c0b22000 ffffffff 00000000 e9fe7000 00001000 
[    0.000000] NIP [c013ed84] kasan_check_range+0x98/0x2c0
[    0.000000] LR [c0140264] memset+0x34/0x80
[    0.000000] Call Trace:
[    0.000000] [c0b07e80] [c08c630c] memblock_alloc_internal+0x9c/0x108 (unreliable)
[    0.000000] [c0b07e90] [feffffff] 0xfeffffff
[    0.000000] [c0b07eb0] [c08c67a8] memblock_alloc_try_nid+0xf4/0x128
[    0.000000] [c0b07f30] [c08bb7ac] kasan_init_shadow_page_tables+0x84/0x1cc
[    0.000000] [c0b07f60] [c08bba40] kasan_init+0xdc/0x184
[    0.000000] [c0b07f90] [c08b8108] setup_arch+0x18/0x1c4
[    0.000000] [c0b07fc0] [c08b3fd4] start_kernel+0x5c/0x2d4
[    0.000000] [c0b07ff0] [000033c0] 0x33c0
[    0.000000] Instruction dump:
[    0.000000] 93e1000c 83c90000 83e90004 7fdffb79 83c10008 83e1000c 408201cc 2c030000 
[    0.000000] 39290008 41820034 554af87e 7d4903a6 <80690000> 81490004 7c6a5379 408201a8 


It makes no sense to me that we get that fault with a valid BAT
covering that area, BAT are not supposed to be checked first ?

-- 
Maxime




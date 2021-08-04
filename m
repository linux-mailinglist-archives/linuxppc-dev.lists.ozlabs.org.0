Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4383DFAD3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 06:58:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gffdb0cQqz3brZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 14:58:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=du9Q8S3A;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.helo=out3-smtp.messagingengine.com (client-ip=66.111.4.27;
 helo=out3-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm3 header.b=du9Q8S3A; 
 dkim-atps=neutral
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gffd70n03z307g
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 14:58:01 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.42])
 by mailout.nyi.internal (Postfix) with ESMTP id D22BE5C0115;
 Wed,  4 Aug 2021 00:57:58 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Wed, 04 Aug 2021 00:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=0lryY4
 e0pWkzFQkHYnTN+Uj25D78SoHYsCpQWq1zdSA=; b=du9Q8S3ArJU3U/j6RXV7a2
 tE75ZWGT1ar7NvadfQ5+KXEjwom+rg3ZyEFOajIeXseEAI8ByEiAi6+MTexqbjd3
 YAAr29+Ro1jrMIg4Z7OZjEgzNkShA8d5rWkFbAl5vdQtFjXoJBuMawdyXR3TSPHN
 fir2d1JrpulGpcPHlSVPTE79P7aZaIk+kqu9DvevC2H2+8oi21YcdmbcY6LSmg9y
 ++bdvkkthJa9CXz75uB/vX3wtxdZ8oIYL2rIA5pDH0krUHqq8Mbp7AsX4oK19HX7
 +J+Xwz6hNIBaEMKKdpEhOIZ4RhqSyNlTjiuZav2EebZjK23cJ178q1DA5/CdKX/w
 ==
X-ME-Sender: <xms:VB4KYZ7pOc4e_tpNz_nGkftqxgyQ0Ot5Mb8rK9oGxZBcrQcYoTwQAg>
 <xme:VB4KYW6IKoD7UEdfCpgsp2bRLeaJEG3lZsSAUnfyO8Ei9AmPrl_sFRbvtNN451GJJ
 S0XMsNR3UgsWQNmREw>
X-ME-Received: <xmr:VB4KYQdDd-nCN9sk66I-21z0sQ4anxpKw7-BX66pYLFRKaVGrUEEKoI0FZUm7WhKUKRvLWIgB6kPRQ_mkIYJH0iRGfGKKRik1U0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrieehgdekhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
 rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
 gvrhhnpeekjeelgfektdfgveefffduvefghfettdeuveekteduleehleeujeegfffhteel
 keenucffohhmrghinhepuddurdhsohenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
 grmhepmhgrihhlfhhrohhmpehfthhhrghinheslhhinhhugidqmheikehkrdhorhhg
X-ME-Proxy: <xmx:VB4KYSJAV69RxbSl0nBF33m7Voqvja58W7rGbqcGnAAA3FEIDRNBNQ>
 <xmx:VB4KYdKeYOPzKwcafNI1-m8tp3HMLmS7j3Rdywrk4RQ6NoEWstVaqg>
 <xmx:VB4KYbznUqXX-qK1cSLpyrBCQzYgOcmQEiCmha4qC8tQXz3UAKRu0g>
 <xmx:Vh4KYV_yjJdzUvmUhF99J2hWRnkzMl6NWcFTw0JvOnSZ676-ZuoIQw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 4 Aug 2021 00:57:54 -0400 (EDT)
Date: Wed, 4 Aug 2021 14:57:48 +1000 (AEST)
From: Finn Thain <fthain@linux-m68k.org>
To: Stan Johnson <userm57@yahoo.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 31/41] powerpc/32: Dismantle EXC_XFER_STD/LITE/TEMPLATE
In-Reply-To: <683c8156-97b0-5ba7-ce31-2e8613089836@yahoo.com>
Message-ID: <255f92fc-1667-bdd1-fcac-664c8644a96@linux-m68k.org>
References: <cover.1615552866.git.christophe.leroy@csgroup.eu>
 <ca5795d04a220586b7037dbbbe6951dfa9e768eb.1615552867.git.christophe.leroy@csgroup.eu>
 <666e3ab4-372-27c2-4621-7cc3933756dd@linux-m68k.org>
 <20210731173954.Horde.fV2Xkw7-sxjG0DUcZ_JO_g3@messagerie.c-s.fr>
 <1d601b7c-1e39-e372-39a5-e1e98e56e2a5@linux-m68k.org>
 <9b64dde3-6ebd-b446-41d9-61e8cb0d8c39@csgroup.eu>
 <62d36dbb-4b39-f5bd-7962-4dcfbea729b3@linux-m68k.org>
 <683c8156-97b0-5ba7-ce31-2e8613089836@yahoo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: Stan Johnson <userm57@yahoo.com>, linux-kernel@vger.kernel.org,
 Nick Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On Tue, 3 Aug 2021, Stan Johnson wrote:

> Attached you will find the following six files:
> 
> 1) config-5.13-patched_VMAP.txt
> 2) config-5.13-patched_NO_VMAP.txt
> 3) pb3400c-console-5.13-patched_VMAP.txt (using config 1)
> 4) pb3400c-console-5.13-patched_NO_VMAP.txt (using config 2)
> 5) ws-console-5.13-patched_VMAP.txt (using config 1)
> 6) ws-console-5.13-patched_NO_VMAP.txt (using config 2)
> 

Thanks!

> The command lines in BootX were as follows:
> 
> PB 3400c:
> root=/dev/sda13 console=ttyS0 video=chips65550:vmode:14,cmode:16
> 
> Wallstreet:
> root=/dev/sda12 console=ttyS0 video=ofonly
> 
> Notes:
> 
> For 3), the patch seems to have fixed the "hang-at-boot" at the Mac
> OS screen for the PB 3400c. 

I doubt that. I suspect that this is an unrelated failure that only 
affects the Powerbook 3400 and only intermittently. I say that because 
you've also observed this failure in v5.11.

So we should probably ignore this early-boot failure for the moment. Stan, 
if it happens again, please reboot and retry. That may allow us to make 
progress on the other bugs.

> After a successful boot, I didn't see any errors until I accessed the 
> system via ssh. In an ssh window, I entered "dmesg" (no errors) followed 
> by "ls -Rail /usr/bin", and while that was running, the errors appeared. 

Since Stan has a yahoo email address that isn't allowed past the spam 
filter, I'll paste that portion of the console log he sent --

Kernel attempted to write user page (78a930) - exploit attempt? (uid: 1000)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 1619 at arch/powerpc/mm/fault.c:230 do_page_fault+0x484/0x720
Modules linked in:
CPU: 0 PID: 1619 Comm: sshd Not tainted 5.13.0-pmac-VMAP #10
NIP:  c001b780 LR: c001b780 CTR: 00000000
REGS: cb981bc0 TRAP: 0700   Not tainted  (5.13.0-pmac-VMAP)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24942424  XER: 00000000

GPR00: c001b780 cb981c80 c151c1e0 00000021 3ffffbff 085b0000 00000027 c8eb644c
GPR08: 00000023 00000000 00000000 00000000 24942424 0076f8c8 00000000 000186a0
GPR16: afab5544 afab5540 afab553c afab5538 afab5534 afab5530 00000004 0078a934
GPR24: 00000000 00000000 0078a970 02000000 c1497b60 0078a930 00000300 cb981cc0
NIP [c001b780] do_page_fault+0x484/0x720
LR [c001b780] do_page_fault+0x484/0x720
Call Trace:
[cb981c80] [c001b780] do_page_fault+0x484/0x720 (unreliable)
[cb981cb0] [c000424c] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at __copy_tofrom_user+0x110/0x20c
NIP:  c001f9bc LR: c0172b04 CTR: 00000001
REGS: cb981cc0 TRAP: 0300   Not tainted  (5.13.0-pmac-VMAP)
MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 442444e8  XER: 20000000
DAR: 0078a930 DSISR: 0a000000
GPR00: 00000000 cb981d80 c151c1e0 0078a930 cb981db8 00000004 0078a92c 00000100
GPR08: 00000122 10c279a1 10000000 c1800034 242444e2 0076f8c8 00000000 000186a0
GPR16: afab5544 afab5540 afab553c afab5538 afab5534 afab5530 00000004 0078a934
GPR24: 00000000 00000000 0078a970 0078a930 cb981dac cb981dac 00000001 00000004
NIP [c001f9bc] __copy_tofrom_user+0x110/0x20c
LR [c0172b04] core_sys_select+0x3e8/0x594
--- interrupt: 300
[cb981d80] [c0172960] core_sys_select+0x244/0x594 (unreliable)
[cb981ee0] [c0172d98] kern_select+0xe8/0x158
[cb981f30] [c001604c] ret_from_syscall+0x0/0x28
--- interrupt: c00 at 0xa7a4f388
NIP:  a7a4f388 LR: a7a4f35c CTR: 00000000
REGS: cb981f40 TRAP: 0c00   Not tainted  (5.13.0-pmac-VMAP)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 240044e2  XER: 20000000

GPR00: 0000008e afab54e0 a73cc7d0 0000000c 0078a930 0078a970 00000000 00000000
GPR08: 00000004 00000000 00000000 a79e45b0 28004462 0076f8c8 00000000 000186a0
GPR16: afab5544 afab5540 afab553c afab5538 afab5534 afab5530 00000004 00770490
GPR24: afab552f 00000004 00000000 0078a930 00000000 00771734 a7b2fff4 00798cb0
NIP [a7a4f388] 0xa7a4f388
LR [a7a4f35c] 0xa7a4f35c
--- interrupt: c00
Instruction dump:
3884aa30 3863012c 4807685d 807f0080 48042e41 2f830000 419e0148 3c80c079
3c60c076 38841b6c 38630174 4801f701 <0fe00000> 3860000b 4bfffe30 3c80c06b
---[ end trace c6ec12d4725e6f89 ]---

> I'll enter the same commands for the other three boots. It may be 
> important that I didn't see errors until there was significant network 
> access.
> 
> For 4), the PB 3400c also booted normally. Errors started after
> logging in via ssh when I entered "dmesg". To be consistent with the
> first test, I followed that with "ls -Rail /usr/bin" and saw more
> errors. A normal reboot ("shutdown -r now") caused even more errors.
> 

Here's the relevant portion of that log:

Kernel attempted to write user page (ba3bc0) - exploit attempt? (uid: 1000)
------------[ cut here ]------------
Bug: Write fault blocked by KUAP!
WARNING: CPU: 0 PID: 1609 at arch/powerpc/mm/fault.c:230 do_page_fault+0x484/0x720
Modules linked in:
CPU: 0 PID: 1609 Comm: bash Not tainted 5.13.0-pmac-NO_VMAP #11
NIP:  c001b780 LR: c001b780 CTR: 00000000
REGS: c3c5bba0 TRAP: 0700   Not tainted  (5.13.0-pmac-NO_VMAP)
MSR:  00021032 <ME,IR,DR,RI>  CR: 24442424  XER: 00000000

GPR00: c001b780 c3c5bc60 c3842ca0 00000021 3ffffbff 085ac000 00000027 c8eb2444
GPR08: 00000023 00000000 00000000 00000000 24442424 00b6fff4 00180008 00000000
GPR16: c18ac148 c3c5beb0 c8fc3e00 00000000 c7a70000 00ba4260 00000000 00000000
GPR24: c3c5be90 00001000 c7a70000 02000000 c1f43900 00ba3bc0 00000300 c3c5bca0
NIP [c001b780] do_page_fault+0x484/0x720
LR [c001b780] do_page_fault+0x484/0x720
Call Trace:
[c3c5bc60] [c001b780] do_page_fault+0x484/0x720 (unreliable)
[c3c5bc90] [c000424c] DataAccess_virt+0xd4/0xe4
--- interrupt: 300 at __copy_tofrom_user+0xbc/0x20c
NIP:  c001f968 LR: c03258c4 CTR: 00000031
REGS: c3c5bca0 TRAP: 0300   Not tainted  (5.13.0-pmac-NO_VMAP)
MSR:  00009032 <EE,ME,IR,DR,RI>  CR: 42424288  XER: 20000000
DAR: 00ba3bc0 DSISR: 0a000000
GPR00: 00000004 c3c5bd60 c3842ca0 00000084 c7a7096c 00000000 00ba3bbc 20776974
GPR08: 68207469 6c646520 287e290a 00000004 22422282 00b6fff4 00180008 00000000
GPR16: c18ac148 c3c5beb0 c8fc3e00 00000000 c7a70000 00ba4260 00000000 00000000
GPR24: c3c5be90 00001000 c7a70000 c8fc3e00 00001000 c3c5be98 00008000 00ba3260
NIP [c001f968] __copy_tofrom_user+0xbc/0x20c
LR [c03258c4] copy_page_to_iter+0x2c0/0xab8
--- interrupt: 300
[c3c5bd60] [00000000] 0x0 (unreliable)
[c3c5bdb0] [c00f5bb4] filemap_read+0x424/0xa2c
[c3c5be80] [c0156910] vfs_read+0x274/0x340
[c3c5bf00] [c0156ec4] ksys_read+0x70/0x118
[c3c5bf30] [c001604c] ret_from_syscall+0x0/0x28
--- interrupt: c00 at 0x86bc88
NIP:  0086bc88 LR: 0086bc5c CTR: 00000000
REGS: c3c5bf40 TRAP: 0c00   Not tainted  (5.13.0-pmac-NO_VMAP)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 20422224  XER: 20000000

GPR00: 00000003 afa710a0 a799a8c0 00000003 00b9b260 00012b22 00badd88 00000000
GPR08: 0000e279 00012b31 00b9b258 00b9b178 00002564 00b6fff4 00b8b4c0 00000000
GPR16: 00000002 00012b22 00aa2ad0 00000000 00b85730 00b85680 00b87900 00b85620
GPR24: 00b856d0 00b9aa80 00000003 00b85520 00b855d0 00b878a0 00959ff4 0000000e
NIP [0086bc88] 0x86bc88
LR [0086bc5c] 0x86bc5c
--- interrupt: c00
Instruction dump:
3884a9e0 386300f0 48076575 807f0080 48042b59 2f830000 419e0148 3c80c079
3c60c076 38841b24 38630138 4801f419 <0fe00000> 3860000b 4bfffe30 3c80c06b
---[ end trace c6966f6cf6736566 ]---


So the PowerBook 3400 and the PowerBook G3 Series "Wallstreet" may have one 
failure mode in common (?) The "Wallstreet" (stock v5.13), in the log
sent a few days ago, showed:

Kernel attempted to write user page (c6207c) - exploit attempt? (uid: 0)
BUG: Unable to handle kernel data access on write at 0x00c6207c
Faulting instruction address: 0xa77ad1dc
Oops: Kernel access of bad area, sig: 11 [#1]
...

> For 5), login at the Wallstreet X console failed, with errors. After
> logging in via ssh, entering "dmesg" and "ls -Rail /usr/bin" generated
> more errors.
> 

Here's the relevant portion of the log:

------------[ cut here ]------------
kernel BUG at arch/powerpc/kernel/interrupt.c:49!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=4K MMU=Hash SMP NR_CPUS=2 PowerMac
Modules linked in:
CPU: 0 PID: 1859 Comm: xfce4-session Not tainted 5.13.0-pmac-VMAP #10
NIP:  c0011474 LR: c0011464 CTR: 00000000
REGS: e2f75e40 TRAP: 0700   Not tainted  (5.13.0-pmac-VMAP)
MSR:  00021032 <ME,IR,DR,RI>  CR: 2400446c  XER: 20000000

GPR00: c001604c e2f75f00 ca284a60 00000000 00000000 a5205eb0 00000008 00000020
GPR08: ffffffc0 00000001 501200d9 ce030005 ca285010 00c1f778 00000000 00000000
GPR16: 00945b20 009402f8 00000001 a6b87550 a51fd000 afb73220 a6b22c78 a6a6aecc
GPR24: 00000000 ffffffc0 00000020 00000008 a5205eb0 00000000 e2f75f40 000000ae
NIP [c0011474] system_call_exception+0x60/0x164
LR [c0011464] system_call_exception+0x50/0x164
Call Trace:
[e2f75f00] [00009000] 0x9000 (unreliable)
[e2f75f30] [c001604c] ret_from_syscall+0x0/0x28
--- interrupt: c00 at 0xa69d6cb0
NIP:  a69d6cb0 LR: a69d6c3c CTR: 00000000
REGS: e2f75f40 TRAP: 0c00   Not tainted  (5.13.0-pmac-VMAP)
MSR:  0000d032 <EE,PR,ME,IR,DR,RI>  CR: 2400446c  XER: 20000000

GPR00: 000000ae a5205de0 a5687ca0 00000000 00000000 a5205eb0 00000008 00000020
GPR08: ffffffc0 401201ea 401200d9 ffffffff c158f230 00c1f778 00000000 00000000
GPR16: 00945b20 009402f8 00000001 a6b87550 a51fd000 afb73220 a6b22c78 a6a6aecc
GPR24: afb72fc8 00000000 00000001 a5205f30 afb733dc 00000000 a6b85ff4 a5205eb0
NIP [a69d6cb0] 0xa69d6cb0
LR [a69d6c3c] 0xa69d6c3c
--- interrupt: c00
Instruction dump:
7cdb3378 93810020 7cbc2b78 93a10024 7c9d2378 93e1002c 7d3f4b78 4800d629
817e0084 931e0088 69690002 5529fffe <0f090000> 69694000 552997fe 0f090000
---[ end trace c66c6c3c44806276 ]---

> For 6), login at the Wallstreet X console worked, with no errors.
> There were also no errors from entering "dmesg" or "ls -Rail /usr/bin"
> in an ssh window. Everything seems stable.
> 

I think that's consistent with results from a previous test with this 
machine with v5.13 with CONFIG_VMAP_STACK disabled.

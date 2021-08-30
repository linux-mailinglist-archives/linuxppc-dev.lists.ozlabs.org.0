Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673CA3FB216
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 09:53:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GyjGy22Mqz2yMD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Aug 2021 17:52:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=g+TU4UY6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=g+TU4UY6; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GyjGG02frz2xrK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Aug 2021 17:52:21 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GyjGD4hZDz9sWc;
 Mon, 30 Aug 2021 17:52:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1630309941;
 bh=sP+TwshCrNfkpgG1A/2esKEB7tgvvZ+K/tvnLrF8jfk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=g+TU4UY6nWdm2oiNn0nFhYh9kfAKBQ2EMjxZ8QtafxslI1WtFMtuw7ndAoap+n9Z3
 DULp8aR6PEWo07ccMrvj3P9LOuxN2EAFRrvYOKFDArCmiBRHSW1vppS7etNB8jU9R2
 XYan1U2ROSW8cVYJK7VY+abS2WtcjVsbJCMENeAG+gCPbQuIQWYimXP9oB4CgOTXFL
 J1ZOBEnzvHoD2m+9g7511zVKo13N5yO67a04t3wbCM6B8fbFcTjeAOZBsBUtnUqMzb
 ZGhnH9u7eaY6BYnInoNudeNyojkIxTfBH1+FTi2BpTSwN0/difMQyTjMYHh2swrird
 MN8li1eFGoQYw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Nathan Chancellor
 <nathan@kernel.org>
Subject: Re: [PATCH v4 4/4] powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP
In-Reply-To: <5c479866-f31a-3579-9d71-357c85b777d0@csgroup.eu>
References: <b864a92693ca8413ef0b19f0c12065c212899b6e.1625762905.git.christophe.leroy@csgroup.eu>
 <03166d569526be70214fe9370a7bad219d2f41c8.1625762907.git.christophe.leroy@csgroup.eu>
 <YSvYFTSwP5EkXQZ0@Ryzen-9-3900X.localdomain>
 <5c479866-f31a-3579-9d71-357c85b777d0@csgroup.eu>
Date: Mon, 30 Aug 2021 17:52:18 +1000
Message-ID: <87tuj7e5e5.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Hi Nathan,
>
> Le 29/08/2021 =C3=A0 20:55, Nathan Chancellor a =C3=A9crit=C2=A0:
>> Hi Christophe,
>>=20
>> On Thu, Jul 08, 2021 at 04:49:43PM +0000, Christophe Leroy wrote:
>>> This patch converts powerpc to the generic PTDUMP implementation.
>>>
>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>=20
>> This patch as commit e084728393a5 ("powerpc/ptdump: Convert powerpc to
>> GENERIC_PTDUMP") in powerpc/next causes a panic with Fedora's ppc64le
>> config [1] when booting up in QEMU with [2]:
>>=20
>> [    1.621864] BUG: Unable to handle kernel data access on read at 0xc0e=
eff7f00000000
>> [    1.623058] Faulting instruction address: 0xc00000000045e5fc
>> [    1.623832] Oops: Kernel access of bad area, sig: 11 [#1]
>> [    1.624318] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA Pow=
erNV
>> [    1.625015] Modules linked in:
>> [    1.625463] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc7-next=
-20210827 #16
>> [    1.626237] NIP:  c00000000045e5fc LR: c00000000045e580 CTR: c0000000=
00518220
>> [    1.626839] REGS: c00000000752b820 TRAP: 0380   Not tainted  (5.14.0-=
rc7-next-20210827)
>> [    1.627528] MSR:  9000000002009033 <SF,HV,VEC,EE,ME,IR,DR,RI,LE>  CR:=
 84002482  XER: 20000000
>> [    1.628449] CFAR: c000000000518300 IRQMASK: 0
>> [    1.628449] GPR00: c00000000045e580 c00000000752bac0 c0000000028a9300=
 0000000000000000
>> [    1.628449] GPR04: c200800000000000 ffffffffffffffff 000000000000000a=
 0000000000000001
>> [    1.628449] GPR08: c0eeff7f00000000 0000000000000012 0000000000000000=
 0000000000000000
>> [    1.628449] GPR12: 0000000000000000 c000000002b20000 fffffffffffffffe=
 c000000002971a70
>> [    1.628449] GPR16: c000000002960040 c0000000011a8f98 c00000000752bbf0=
 ffffffffffffffff
>> [    1.628449] GPR20: c2008fffffffffff c0eeff7f00000000 c000000002971a68=
 c00a0003ff000000
>> [    1.628449] GPR24: c000000002971a78 0000000000000002 0000000000000001=
 c0000000011a8f98
>> [    1.628449] GPR28: c0000000011a8f98 c0000000028daef8 c200800000000000=
 c200900000000000
>> [    1.634090] NIP [c00000000045e5fc] __walk_page_range+0x2bc/0xce0
>> [    1.635117] LR [c00000000045e580] __walk_page_range+0x240/0xce0
>> [    1.635755] Call Trace:
>> [    1.636018] [c00000000752bac0] [c00000000045e580] __walk_page_range+0=
x240/0xce0 (unreliable)
>> [    1.636811] [c00000000752bbd0] [c00000000045f234] walk_page_range_nov=
ma+0x74/0xb0
>> [    1.637459] [c00000000752bc20] [c000000000518448] ptdump_walk_pgd+0x9=
8/0x170
>> [    1.638138] [c00000000752bc70] [c0000000000aa988] ptdump_check_wx+0x8=
8/0xd0
>> [    1.638738] [c00000000752bd50] [c00000000008d6d8] mark_rodata_ro+0x48=
/0x80
>> [    1.639299] [c00000000752bdb0] [c000000000012a34] kernel_init+0x74/0x=
1a0
>> [    1.639842] [c00000000752be10] [c00000000000cfd4] ret_from_kernel_thr=
ead+0x5c/0x64
>> [    1.640597] Instruction dump:
>> [    1.641021] 38e7ffff 39490010 7ce707b4 7fca5436 79081564 7d4a3838 790=
8f082 794a1f24
>> [    1.641740] 78a8f00e 30e6ffff 7ea85214 7ce73110 <7d48502a> 78f90fa4 2=
c2a0000 39290010
>> [    1.642771] ---[ end trace 6cf72b085097ad52 ]---
>> [    1.643220]
>> [    2.644228] Kernel panic - not syncing: Attempted to kill init! exitc=
ode=3D0x0000000b
>> [    2.645523] ---[ end Kernel panic - not syncing: Attempted to kill in=
it! exitcode=3D0x0000000b ]---
>>=20
>> This is not compiler specific, I can reproduce it with GCC 11.2.0 and
>> binutils 2.37. If there is any additional information I can provide,
>> please let me know.
>
> Can you provide a dissassembly of __walk_page_range() ? Or provide your v=
mlinux binary.

It seems to be walking of the end of the pgd.

[    3.373800] walk_p4d_range: addr c00fff0000000000 end c00fff8000000000
[    3.373852] walk_p4d_range: addr c00fff8000000000 end c010000000000000	<=
- end of pgd at PAGE_OFFSET + 4PB
[    3.373905] walk_p4d_range: addr c010000000000000 end c010008000000000
[    3.373957] walk_p4d_range: addr c010008000000000 end c010010000000000
[    3.374009] walk_p4d_range: addr c010010000000000 end c010018000000000
[    3.374060] walk_p4d_range: addr c010018000000000 end c010020000000000
[    3.376727] walk_p4d_range: addr c010020000000000 end c010028000000000
[    3.376780] walk_p4d_range: addr c010028000000000 end c010030000000000
[    3.376831] walk_p4d_range: addr c010030000000000 end c010038000000000
[    3.376883] walk_p4d_range: addr c010038000000000 end c010040000000000
[    3.376935] walk_p4d_range: addr c010040000000000 end c010048000000000
[    3.376988] walk_p4d_range: addr c010048000000000 end c010050000000000
[    3.377039] walk_p4d_range: addr c010050000000000 end c010058000000000
[    3.377091] walk_p4d_range: addr c010058000000000 end c010060000000000
[    3.377143] walk_p4d_range: addr c010060000000000 end c010068000000000
[    3.377244] walk_pud_range: addr c010060000000000 end c010068000000000
[    3.377374] walk_pmd_range: addr c010060100000000 end c010060140000000
[    3.377817] BUG: Unable to handle kernel data access on read at 0xf906a0=
38d8ba8400
[    3.378247] Faulting instruction address: 0xc00000000045b4a4
[    3.378725] Oops: Kernel access of bad area, sig: 11 [#1]
[    3.378843] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeri=
es
[    3.379118] Modules linked in:
[    3.379422] CPU: 1 PID: 1 Comm: swapper/0 Not tainted 5.14.0-rc2+ #75
[    3.379751] NIP:  c00000000045b4a4 LR: c00000000045b430 CTR: c000000000b=
4b580
[    3.379833] REGS: c0000000085637c0 TRAP: 0300   Not tainted  (5.14.0-rc2=
+)
[    3.379940] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 88002=
28f  XER: 20040000
[    3.380284] CFAR: c0000000001f5744 DAR: f906a038d8ba8400 DSISR: 40000000=
 IRQMASK: 0
[    3.380284] GPR00: c00000000045b430 c000000008563a60 c0000000028a7d00 00=
0000000000003a
[    3.380284] GPR04: 00000000ffffe14d c000000008563748 ffffffffffffffff 00=
000000000001ff
[    3.380284] GPR08: f906a038d8ba8400 c0100601001fffff c01006013fffffff ff=
fffffffffc51e0
[    3.380284] GPR12: 0000000000002000 c0000000ffffee80 0000000000000001 c0=
00000008563be0
[    3.380284] GPR16: c000000001198118 c0000000028daef8 c000000002971a60 c0=
000000014bc868
[    3.380284] GPR20: c010060100200000 c000000002971a58 c000000002971a68 c0=
10060100000000
[    3.380284] GPR24: 0000000000000003 c000000001198118 c000000001198118 c0=
00000001000020
[    3.380284] GPR28: 0000000000000000 c010060140000000 c010068000000000 f9=
06a038d8ba8400
[    3.381235] NIP [c00000000045b4a4] __walk_page_range+0x7f4/0xbd0
[    3.381906] LR [c00000000045b430] __walk_page_range+0x780/0xbd0
[    3.382120] Call Trace:
[    3.382240] [c000000008563a60] [c00000000045b430] __walk_page_range+0x78=
0/0xbd0 (unreliable)
[    3.382445] [c000000008563bc0] [c00000000045ba94] walk_page_range_novma+=
0x74/0xb0
[    3.382548] [c000000008563c10] [c000000000514cd8] ptdump_walk_pgd+0x98/0=
x170
[    3.382630] [c000000008563c60] [c0000000000aaf70] ptdump_check_wx+0xb0/0=
x100
[    3.382774] [c000000008563d40] [c00000000008db18] mark_rodata_ro+0x48/0x=
80
[    3.382849] [c000000008563da0] [c000000000012a18] kernel_init+0x78/0x1c0
[    3.382926] [c000000008563e10] [c00000000000cfd4] ret_from_kernel_thread=
+0x5c/0x64
[    3.383092] Instruction dump:
[    3.383341] 78c8f00e 7fe84a14 e9360000 e94100a8 39290010 7dc94836 7e89ba=
14 7d2900d0
[    3.383516] 7e944838 3934ffff 7c295040 40800098 <e93f0000> 2c290000 4082=
0094 e9990028
[    3.384126] ---[ end trace d8e6479034d7a9d1 ]---

cheers

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46412591DE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 05:16:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Zhkp0NKGzDqjZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 13:16:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZhfG1M8tzDqg9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 13:12:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 45ZhfD3QYHz9s3l;
 Fri, 28 Jun 2019 13:12:52 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Qian Cai <cai@lca.pw>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>
Subject: Re: power9 NUMA crash while reading debugfs imc_cmd
In-Reply-To: <1561670472.5154.98.camel@lca.pw>
References: <1561670472.5154.98.camel@lca.pw>
Date: Fri, 28 Jun 2019 13:12:48 +1000
Message-ID: <87lfxms8r3.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Qian Cai <cai@lca.pw> writes:
> Read of=C2=A0debugfs imc_cmd file for a memory-less node will trigger a c=
rash below
> on this power9 machine which has the following NUMA layout.

What type of machine is it?

cheers

> I don't understand why I only saw it recently on linux-next where it
> was tested everyday. I can reproduce it back to 4.20 where 4.18 seems
> work fine.
>
> # cat /sys/kernel/debug/powerpc/imc/imc_cmd_252 (On a 4.18-based kernel)
> 0x0000000000000000
>
> # numactl -H
> available: 6 nodes (0,8,252-255)
> node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 2=
3 24 25
> 26 27 28 29 30 31 32 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 5=
0 51 52
> 53 54 55 56 57 58 59 60 61 62 63
> node 0 size: 130210 MB
> node 0 free: 128406 MB
> node 8 cpus: 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79 80 81 82 83 =
84 85
> 86 87 88 89 90 91 92 93 94 95 96 97 98 99 100 101 102 103 104 105 106 107=
 108
> 109 110 111 112 113 114 115 116 117 118 119 120 121 122 123 124 125 126 1=
27
> node 8 size: 130784 MB
> node 8 free: 130051 MB
> node 252 cpus:
> node 252 size: 0 MB
> node 252 free: 0 MB
> node 253 cpus:
> node 253 size: 0 MB
> node 253 free: 0 MB
> node 254 cpus:
> node 254 size: 0 MB
> node 254 free: 0 MB
> node 255 cpus:
> node 255 size: 0 MB
> node 255 free: 0 MB
> node distances:
> node=C2=A0=C2=A0=C2=A00=C2=A0=C2=A0=C2=A08=C2=A0=C2=A0252=C2=A0=C2=A0253=
=C2=A0=C2=A0254=C2=A0=C2=A0255=C2=A0
> =C2=A0 0:=C2=A0=C2=A010=C2=A0=C2=A040=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=
=C2=A080=C2=A0=C2=A080=C2=A0
> =C2=A0 8:=C2=A0=C2=A040=C2=A0=C2=A010=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=
=C2=A080=C2=A0=C2=A080=C2=A0
> =C2=A0252:=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A010=C2=A0=C2=A080=C2=A0=
=C2=A080=C2=A0=C2=A080=C2=A0
> =C2=A0253:=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A010=C2=A0=
=C2=A080=C2=A0=C2=A080=C2=A0
> =C2=A0254:=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=
=C2=A010=C2=A0=C2=A080=C2=A0
> =C2=A0255:=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=C2=A080=C2=A0=
=C2=A080=C2=A0=C2=A010
>
> # cat /sys/kernel/debug/powerpc/imc/imc_cmd_252
>
> [ 1139.415461][ T5301] Faulting instruction address: 0xc0000000000d0d58
> [ 1139.415492][ T5301] Oops: Kernel access of bad area, sig: 11 [#1]
> [ 1139.415509][ T5301] LE PAGE_SIZE=3D64K MMU=3DRadix MMU=3DHash SMP NR_C=
PUS=3D256
> DEBUG_PAGEALLOC NUMA PowerNV
> [ 1139.415542][ T5301] Modules linked in: i2c_opal i2c_core ip_tables x_t=
ables
> xfs sd_mod bnx2x mdio ahci libahci tg3 libphy libata firmware_class dm_mi=
rror
> dm_region_hash dm_log dm_mod
> [ 1139.415595][ T5301] CPU: 67 PID: 5301 Comm: cat Not tainted 5.2.0-rc6-=
next-
> 20190627+ #19
> [ 1139.415634][ T5301] NIP:=C2=A0=C2=A0c0000000000d0d58 LR: c00000000049a=
a18 CTR:
> c0000000000d0d50
> [ 1139.415675][ T5301] REGS: c00020194548f9e0 TRAP: 0300=C2=A0=C2=A0=C2=
=A0Not tainted=C2=A0=C2=A0(5.2.0-
> rc6-next-20190627+)
> [ 1139.415705][ T5301] MSR:=C2=A0=C2=A09000000000009033 <SF,HV,EE,ME,IR,D=
R,RI,LE>=C2=A0=C2=A0CR:
> 28022822=C2=A0=C2=A0XER: 00000000
> [ 1139.415777][ T5301] CFAR: c00000000049aa14 DAR: 000000000003fc08 DSISR:
> 40000000 IRQMASK: 0=C2=A0
> [ 1139.415777][ T5301] GPR00: c00000000049aa18 c00020194548fc70 c00000000=
16f8b00
> 000000000003fc08=C2=A0
> [ 1139.415777][ T5301] GPR04: c00020194548fcd0 0000000000000000 000000001=
4884e73
> ffffffff00011eaa=C2=A0
> [ 1139.415777][ T5301] GPR08: 000000007eea5a52 c0000000000d0d50 000000000=
0000000
> 0000000000000000=C2=A0
> [ 1139.415777][ T5301] GPR12: c0000000000d0d50 c000201fff7f8c00 000000000=
0000000
> 0000000000000000=C2=A0
> [ 1139.415777][ T5301] GPR16: 000000000000000d 00007fffeb0c3368 fffffffff=
fffffff
> 0000000000000000=C2=A0
> [ 1139.415777][ T5301] GPR20: 0000000000000000 0000000000000000 000000000=
0000000
> 0000000000020000=C2=A0
> [ 1139.415777][ T5301] GPR24: 0000000000000000 0000000000000000 000000000=
0020000
> 000000010ec90000=C2=A0
> [ 1139.415777][ T5301] GPR28: c00020194548fdf0 c00020049a584ef8 000000000=
0000000
> c00020049a584ea8=C2=A0
> [ 1139.416116][ T5301] NIP [c0000000000d0d58] imc_mem_get+0x8/0x20
> [ 1139.416143][ T5301] LR [c00000000049aa18] simple_attr_read+0x118/0x170
> [ 1139.416158][ T5301] Call Trace:
> [ 1139.416182][ T5301] [c00020194548fc70] [c00000000049a970]
> simple_attr_read+0x70/0x170 (unreliable)
> [ 1139.416255][ T5301] [c00020194548fd10] [c00000000054385c]
> debugfs_attr_read+0x6c/0xb0
> [ 1139.416305][ T5301] [c00020194548fd60] [c000000000454c1c]
> __vfs_read+0x3c/0x70
> [ 1139.416363][ T5301] [c00020194548fd80] [c000000000454d0c] vfs_read+0xb=
c/0x1a0
> [ 1139.416392][ T5301] [c00020194548fdd0] [c00000000045519c]
> ksys_read+0x7c/0x140
> [ 1139.416434][ T5301] [c00020194548fe20] [c00000000000b108]
> system_call+0x5c/0x70
> [ 1139.416473][ T5301] Instruction dump:
> [ 1139.416511][ T5301] 4e800020 60000000 7c0802a6 60000000 7c801d28 38600=
000
> 4e800020 60000000=C2=A0
> [ 1139.416572][ T5301] 60000000 60000000 7c0802a6 60000000 <7d201c28> 386=
00000
> f9240000 4e800020=C2=A0
> [ 1139.416636][ T5301] ---[ end trace c44d1fb4ace04784 ]---
> [ 1139.520686][ T5301]=C2=A0
> [ 1140.520820][ T5301] Kernel panic - not syncing: Fatal exception

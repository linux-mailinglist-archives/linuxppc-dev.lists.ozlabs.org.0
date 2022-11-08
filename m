Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6E86210C9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 13:32:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N66tx1H4mz2xZV
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 23:32:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XlVkP+2W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=94.23.1.103; helo=out0.migadu.com; envelope-from=yajun.deng@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=XlVkP+2W;
	dkim-atps=neutral
X-Greylist: delayed 588 seconds by postgrey-1.36 at boromir; Tue, 08 Nov 2022 13:37:50 AEDT
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N5shZ4wtVz2xrc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 13:37:50 +1100 (AEDT)
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1667874473;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FU21ncL2l11/qz7WY82e+c7SFpEW0tFZRTnQuAorJIg=;
	b=XlVkP+2WVi8HUfkYHA/Tl7vWqIQ7fbPEp84lL1GSstRQExS6nDa/UKEK2sRZC1vN1iSLAp
	obdj1eQl396OaGVMmnMyL6GaMmybDMNepHhsGN8tj4FbxOZoaXe26lZGck42DyYD0lgrny
	04uNbQyaOTa5IJ8x+Wp63FUdkyG8P6s=
Date: Tue, 08 Nov 2022 02:27:53 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Yajun Deng" <yajun.deng@linux.dev>
Message-ID: <58779468e28e026a1aa30a42ca7e8aec@linux.dev>
Subject: Re: [6.1.0-rc3-next-20221104] Boot failure - kernel BUG at 
 mm/memblock.c:519
To: "Sachin Sant" <sachinp@linux.ibm.com>, rppt@linux.ibm.com
In-Reply-To: <E2499567-0D0F-44DA-AC68-1E279009A6DE@linux.ibm.com>
References: <E2499567-0D0F-44DA-AC68-1E279009A6DE@linux.ibm.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Tue, 08 Nov 2022 23:30:58 +1100
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sachin,=0AI didn't have a powerpc architecture machine. I don't know w=
hy this happened.=0A=0AHi Mike,=0ADo you have any suggestions? I tested i=
n tools/testing/memblock, and it was successful.=0A=0ANovember 6, 2022 8:=
07 PM, "Sachin Sant" <sachinp@linux.ibm.com> wrote:=0A=0A> While booting =
recent linux-next on a IBM Power10 Server LPAR=0A> following crash is obs=
erved:=0A> =0A> [ 0.000000] numa: Partition configured for 32 NUMA nodes.=
=0A> [ 0.000000] ------------[ cut here ]------------=0A> [ 0.000000] ker=
nel BUG at mm/memblock.c:519!=0A> [ 0.000000] Oops: Exception in kernel m=
ode, sig: 5 [#1]=0A> [ 0.000000] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CP=
US=3D2048 NUMA pSeries=0A> [ 0.000000] Modules linked in:=0A> [ 0.000000]=
 CPU: 0 PID: 0 Comm: swapper Not tainted 6.1.0-rc3-next-20221104 #1=0A> [=
 0.000000] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 o=
f:IBM,FW1030.00=0A> (NH1030_026) hv:phyp pSeries=0A> [ 0.000000] NIP: c00=
00000004ba240 LR: c0000000004bb240 CTR: c0000000004ba210=0A> [ 0.000000] =
REGS: c000000002a8b7b0 TRAP: 0700 Not tainted (6.1.0-rc3-next-20221104)=
=0A> [ 0.000000] MSR: 8000000000021033 <SF,ME,IR,DR,RI,LE> CR: 24042424 X=
ER: 00000001=0A> [ 0.000000] CFAR: c0000000004ba290 IRQMASK: 1=0A> [ 0.00=
0000] GPR00: c0000000004bb240 c000000002a8ba50 c00000000136ee00 c0000010f=
3ac00a8=0A> [ 0.000000] GPR04: 0000000000000000 c0000010f3ac0090 00000010=
f3ac0000 0000000000000d00=0A> [ 0.000000] GPR08: 0000000000000001 0000000=
000000007 0000000000000001 0000000000000081=0A> [ 0.000000] GPR12: c00000=
00004ba210 c000000002e10000 0000000000000000 000000000000000d=0A> [ 0.000=
000] GPR16: 000000000f6be620 000000000f6be8e8 000000000f6be788 000000000f=
6bed58=0A> [ 0.000000] GPR20: 000000000f6f6d58 c0000000029a8de8 00000010f=
3ad8800 0000000000000080=0A> [ 0.000000] GPR24: 00000010f3ad7b00 00000000=
00000000 0000000000000100 0000000000000d00=0A> [ 0.000000] GPR28: 0000001=
0f3ad7b00 c0000000029a8de8 c0000000029a8e00 0000000000000006=0A> [ 0.0000=
00] NIP [c0000000004ba240] memblock_merge_regions.isra.12+0x40/0x130=0A> =
[ 0.000000] LR [c0000000004bb240] memblock_add_range+0x190/0x300=0A> [ 0.=
000000] Call Trace:=0A> [ 0.000000] [c000000002a8ba50] [0000000000000100]=
 0x100 (unreliable)=0A> [ 0.000000] [c000000002a8ba90] [c0000000004bb240]=
 memblock_add_range+0x190/0x300=0A> [ 0.000000] [c000000002a8bb10] [c0000=
000004bb5e0] memblock_reserve+0x70/0xd0=0A> [ 0.000000] [c000000002a8bba0=
] [c000000002045234] memblock_alloc_range_nid+0x11c/0x1e8=0A> [ 0.000000]=
 [c000000002a8bc60] [c0000000020453a4] memblock_alloc_internal+0xa4/0x110=
=0A> [ 0.000000] [c000000002a8bcb0] [c0000000020456cc] memblock_alloc_try=
_nid+0x94/0xcc=0A> [ 0.000000] [c000000002a8bd40] [c00000000200b570] allo=
c_paca_data+0x7c/0xcc=0A> [ 0.000000] [c000000002a8bdb0] [c00000000200b77=
0] allocate_paca+0x8c/0x28c=0A> [ 0.000000] [c000000002a8be50] [c00000000=
200a26c] setup_arch+0x1c4/0x4d8=0A> [ 0.000000] [c000000002a8bed0] [c0000=
00002004378] start_kernel+0xb4/0xa84=0A> [ 0.000000] [c000000002a8bf90] [=
c00000000000da90] start_here_common+0x1c/0x20=0A> [ 0.000000] Instruction=
 dump:=0A> [ 0.000000] 7c0802a6 fba1ffe8 fbc1fff0 fbe1fff8 7c7d1b78 7c9e2=
378 3be00000 f8010010=0A> [ 0.000000] f821ffc1 e9230000 3969ffff 4800000c=
 <0b0a0000> 7d3f4b78 393f0001 7fbf5840=0A> [ 0.000000] ---[ end trace 000=
0000000000000 ]---=0A> [ 0.000000]=0A> [ 0.000000] Kernel panic - not syn=
cing: Fatal exception=0A> [ 0.000000] Rebooting in 180 seconds..=0A> =0A>=
 This problem was introduced with next-20221101. Git bisect points to=0A>=
 following patch=0A> =0A> commit 3f82c9c4ac377082e1230f5299e0ccce07b15e12=
=0A> Date: Tue Oct 25 15:09:43 2022 +0800=0A> memblock: don't run loop in=
 memblock_add_range() twice=0A> =0A> Reverting this patch helps boot the =
kernel to login prompt.=0A> =0A> Have attached .config=0A> =0A> - Sachin

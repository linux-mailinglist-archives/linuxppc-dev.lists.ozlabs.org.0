Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 23EF9562006
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 18:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYjzT0DPnz3dpv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 02:12:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a0Kdqa5s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a0Kdqa5s;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYjyh547Pz3bpX
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 02:12:11 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25UFJDRd009570;
	Thu, 30 Jun 2022 16:12:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=dxBJwKDBXDsJ9+xIaMGIUZnSRa877RnwHs/tS0mJbCY=;
 b=a0Kdqa5sKH/7GYU+Jp4ogx6ywNXs2Oj3+u2HM0ik7BTKjZyxAdE1hYJb+uTKAn64roci
 cvu3BoDC7rx+05lwwkDsIxoaPZMQPTcteH/KYN0Vhb8HBDDRlk8kRFSK75tJ+Wuk3fqF
 eehdRRGApesLGWp9mMNFNNY8T/nfXiCyqi8b8BmbZTY2720qJSAiQ6pwO6+b+uPKthti
 /lLo91AxPVun/hShQsldAiPXoJ5RjnD7UPdSL3dHlT/xJIfB0Vage2GRZP9WEYEOeHk8
 mNsuLNBD6RkjtzzgDGF6eufWTwInk/YdoBwiWFEkNCamseexS03xBu11gntR8MxAvPni Fw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h1ecbsn15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 16:12:05 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25UG6Yxl020624;
	Thu, 30 Jun 2022 16:12:03 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma02fra.de.ibm.com with ESMTP id 3gwt08xa05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 16:12:03 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25UGC8PV25952596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 16:12:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2851211C058;
	Thu, 30 Jun 2022 16:12:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54D4911C054;
	Thu, 30 Jun 2022 16:12:00 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.87.229])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jun 2022 16:12:00 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH v3 0/2] powerpc rng cleanups
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20220630140108.129434-1-Jason@zx2c4.com>
Date: Thu, 30 Jun 2022 21:41:59 +0530
Message-Id: <DFCB9812-6138-400F-9AF8-DE18B61C3667@linux.ibm.com>
References: <20220630140108.129434-1-Jason@zx2c4.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3696.100.31)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: ICwzmlRDrij6qkEk-JZZCVbsmDtK5SWE
X-Proofpoint-GUID: ICwzmlRDrij6qkEk-JZZCVbsmDtK5SWE
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_11,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300064
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 30-Jun-2022, at 7:31 PM, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>=20
> These are two small cleanups for -next.
>=20
> I'm sending this v3 because very likely
> https://lore.kernel.org/all/20220630121654.1939181-1-Jason@zx2c4.com/
> will land first, in which case this needs a small adjustment.
>=20
> Jason A. Donenfeld (2):
>  powerpc/powernv: rename remaining rng powernv_ functions to pnv_
>  powerpc/kvm: don't crash on missing rng, and use darn
>=20
> arch/powerpc/include/asm/archrandom.h |  7 +--
> arch/powerpc/kvm/book3s_hv_builtin.c  |  7 +--
> arch/powerpc/platforms/powernv/rng.c  | 65 ++++++++++-----------------
> drivers/char/hw_random/powernv-rng.c  |  2 +-
> 4 files changed, 30 insertions(+), 51 deletions(-)
>=20

I tried these 2 patches + previous one (to fix kobject warning) on
top of 5.19.0-rc4-next-20220630 next on a Power8 server.=20

5.19.0-rc4-next-20220630 +
powerpc/powernv: delay rng of node creation until later in boot +
powerpc/powernv: rename remaining rng powernv_ functions to pnv_ +
powerpc/kvm: don't crash on missing rng, and use darn

Unfortunately it fails to boot with following crash

[    0.000000] ftrace: allocated 13 pages with 3 groups
[    0.000000] trace event string verifier disabled
[    0.000000] rcu: Hierarchical RCU implementation.
[    0.000000] rcu: 	RCU restricting CPUs from NR_CPUS=3D2048 to nr_cpu_ids=
=3D80.
[    0.000000] 	Rude variant of Tasks RCU enabled.
[    0.000000] rcu: RCU calculated value of scheduler-enlistment delay is 1=
0 jiffies.
[    0.000000] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D80
[    0.000000] NR_IRQS: 512, nr_irqs: 512, preallocated irqs: 16
[    0.000000] ICS OPAL backend registered
[    0.000000] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.000001] clocksource: timebase: mask: 0xffffffffffffffff max_cycles: =
0x761537d007, max_idle_ns: 440795202126 ns
[    0.000182] clocksource: timebase mult[1f40000] shift[24] registered
[    0.001905] BUG: Unable to handle kernel data access on read at 0x3ffff4=
0000000
[    0.002032] Faulting instruction address: 0xc0000000000d7990
[    0.002132] Oops: Kernel access of bad area, sig: 7 [#1]
[    0.002226] LE PAGE_SIZE=3D64K MMU=3DHash SMP NR_CPUS=3D2048 NUMA PowerNV
[    0.002338] Modules linked in:
[    0.002396] CPU: 0 PID: 0 Comm: swapper/0 Not tainted 5.19.0-rc4-next-20=
220630-dirty #20
[    0.002539] NIP:  c0000000000d7990 LR: c00000000201fa74 CTR: c0000000000=
d7960
[    0.002663] REGS: c000000002a0fa60 TRAP: 0300   Not tainted  (5.19.0-rc4=
-next-20220630-dirty)
[    0.002812] MSR:  9000000002001033 <SF,HV,VEC,ME,IR,DR,RI,LE>  CR: 44000=
228  XER: 20000000
[    0.002979] CFAR: c00000000201fa70 DAR: 0003ffff40000000 DSISR: 00000002=
 IRQMASK: 1=20
[    0.002979] GPR00: c00000000201fa74 c000000002a0fd00 c000000002a12000 c0=
00000002a0fe90=20
[    0.002979] GPR04: 0000000000000001 0000000000000000 c000000000deb578 00=
0000000000006f=20
[    0.002979] GPR08: 0000000000000000 0003ffff40000000 c000000007040080 00=
00000000000000=20
[    0.002979] GPR12: c0000000000d7960 c000000002d00000 0000000000000003 00=
00000000000000=20
[    0.002979] GPR16: 0000000000000000 0000000000000000 0000000000000278 c0=
00000002a4dfe0=20
[    0.002979] GPR20: c000000002a52238 c000000002a52820 c0000000000d7960 c0=
00000000fe6c50=20
[    0.002979] GPR24: 0000000000000001 c000000002a0fe90 c000000000fe6c40 c0=
00000002141ff8=20
[    0.002979] GPR28: 0000000000000800 c0000000070400a0 c000000002ab0150 00=
00000000000000=20
[    0.004279] NIP [c0000000000d7990] pnv_get_random_long+0x30/0xd0
[    0.004390] LR [c00000000201fa74] pnv_get_random_long_early+0x268/0x2d0
[    0.004509] Call Trace:
[    0.004553] [c000000002a0fd00] [c00000000201fa4c] pnv_get_random_long_ea=
rly+0x240/0x2d0 (unreliable)
[    0.004718] [c000000002a0fe20] [c000000002060d5c] random_init+0xc0/0x214
[    0.004844] [c000000002a0fec0] [c0000000020048c0] start_kernel+0x990/0xb=
f8
[    0.004972] [c000000002a0ff90] [c00000000000d878] start_here_common+0x1c=
/0x24
[    0.005102] Instruction dump:
[    0.005156] 3c4c0294 3842a6a0 7c0802a6 60000000 7d2000a6 71290010 418200=
48 e94d0030=20
[    0.005309] 3d22ff73 3929fff8 7d4a482a e92a0008 <7d204eea> e8ea0010 7d28=
03f4 7ce94a78=20
[    0.005465] ---[ end trace 0000000000000000 ]---
[    0.005545]=20
[    1.005574] Kernel panic - not syncing: Fatal exception
[    1.005671] Rebooting in 10 seconds..

Reverting powerpc/kvm: don't crash on missing rng, and use darn helps to bo=
ot
the server successfully.

Thanks
-Sachin


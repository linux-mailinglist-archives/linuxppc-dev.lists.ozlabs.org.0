Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C335F09E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 13:20:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf7852tBWz3cCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 21:20:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXF/yOLh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gXF/yOLh;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf76j0sNPz3bXn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 21:19:40 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28UBDlnW027490;
	Fri, 30 Sep 2022 11:19:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : subject :
 to : cc : references : in-reply-to : message-id : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=h1/CIHBYMoftYiBrb30lNLtAKzNJel0OO0ld4dbfpoI=;
 b=gXF/yOLhqC9MqCozBaIhxAB+UqLIuKnYWftFB1bVCFFDQW4PqpLC6NV0Fn6JPkq/I5/J
 +8Lpo+dgSmczE8b+HsCdCh6zEoU/7K4tAjx2BAMuoCHFCjBdniOojzS2LU/ObYcK1JEk
 +sq8H8HeBNadM5o1XyWfrUZUr06rLCvQhRwVUCjn4WDiJnQopIAZS0o6m0iqEM5LU0Ec
 cZxC1NfYivAyQUnzP6JRClv7+rF7cKe3J6GERv9pfstTThL1XthpWULYjSU3bueElYp3
 xGrHgoarEvevVeF7/oXEyJwQoXYDUtDwxOvfsvA4KnsiXZODySqkkF793NviuFgWBITl eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwyd0r4tn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Sep 2022 11:19:09 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28UBFLbe000707;
	Fri, 30 Sep 2022 11:19:08 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jwyd0r4sh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Sep 2022 11:19:08 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28UB5iDL002412;
	Fri, 30 Sep 2022 11:19:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma04ams.nl.ibm.com with ESMTP id 3juapunnpw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Sep 2022 11:19:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28UBJ4Kx1704498
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Sep 2022 11:19:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7457BA404D;
	Fri, 30 Sep 2022 11:19:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D16C3A4040;
	Fri, 30 Sep 2022 11:19:03 +0000 (GMT)
Received: from localhost (unknown [9.43.5.151])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 30 Sep 2022 11:19:03 +0000 (GMT)
Date: Fri, 30 Sep 2022 15:17:30 +0530
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/kprobes: Fix null pointer reference in
 arch_prepare_kprobe()
To: jniethe5@gmail.com, Li Huafei <lihuafei1@huawei.com>, mpe@ellerman.id.au
References: <20220923093253.177298-1-lihuafei1@huawei.com>
In-Reply-To: <20220923093253.177298-1-lihuafei1@huawei.com>
User-Agent: astroid/4d6b06ad (https://github.com/astroidmail/astroid)
Message-Id: <1664530538.ke6dp49pwh.naveen@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: uGJYGSVxOFWloGVl1xuh9-1IJhAOB9cQ
X-Proofpoint-GUID: ezrBTffBJnLTH4eFVb4kCCNV6ccgWy0H
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-30_04,2022-09-29_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1011 priorityscore=1501 mlxscore=0
 suspectscore=0 bulkscore=0 mlxlogscore=999 impostorscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209300070
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
Cc: peterz@infradead.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, rostedt@goodmis.org, linuxppc-dev@lists.ozlabs.org, mhiramat@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Li Huafei wrote:
> I found a null pointer reference in arch_prepare_kprobe():

Good find!

>=20
>   # echo 'p cmdline_proc_show' > kprobe_events
>   # echo 'p cmdline_proc_show+16' >> kprobe_events

I think we should extend multiple_kprobes selftest to also place=20
contiguous probes to catch such errors.

>   [   67.278533][  T122] Kernel attempted to read user page (0) - exploit=
 attempt? (uid: 0)
>   [   67.279326][  T122] BUG: Kernel NULL pointer dereference on read at =
0x00000000
>   [   67.279738][  T122] Faulting instruction address: 0xc000000000050bfc
>   [   67.280486][  T122] Oops: Kernel access of bad area, sig: 11 [#1]
>   [   67.280846][  T122] LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D204=
8 NUMA PowerNV
>   [   67.281435][  T122] Modules linked in:
>   [   67.281903][  T122] CPU: 0 PID: 122 Comm: sh Not tainted 6.0.0-rc3-0=
0007-gdcf8e5633e2e #10
>   [   67.282547][  T122] NIP:  c000000000050bfc LR: c000000000050bec CTR:=
 0000000000005bdc
>   [   67.282920][  T122] REGS: c0000000348475b0 TRAP: 0300   Not tainted =
 (6.0.0-rc3-00007-gdcf8e5633e2e)
>   [   67.283424][  T122] MSR:  9000000000009033 <SF,HV,EE,ME,IR,DR,RI,LE>=
  CR: 88002444  XER: 20040006
>   [   67.284023][  T122] CFAR: c00000000022d100 DAR: 0000000000000000 DSI=
SR: 40000000 IRQMASK: 0
>   [   67.284023][  T122] GPR00: c000000000050bec c000000034847850 c000000=
0013f6100 c000000001fb7718
>   [   67.284023][  T122] GPR04: c000000000515c10 c000000000e5fe08 c000000=
00133da60 c000000004839300
>   [   67.284023][  T122] GPR08: c0000000014ffb98 0000000000000000 c000000=
000515c0c c000000000e18576
>   [   67.284023][  T122] GPR12: c000000000e60170 c0000000015a0000 0000000=
1155e0460 0000000000000000
>   [   67.284023][  T122] GPR16: 0000000000000000 00007fffe8eeb3c8 0000000=
116320728 0000000000000000
>   [   67.284023][  T122] GPR20: 0000000116320720 0000000000000000 c000000=
0012fa918 0000000000000006
>   [   67.284023][  T122] GPR24: c0000000014ffb98 c0000000011ed360 0000000=
000000000 c000000001fb7928
>   [   67.284023][  T122] GPR28: 0000000000000000 0000000000000000 0000000=
07c0802a6 c000000001fb7918
>   [   67.287799][  T122] NIP [c000000000050bfc] arch_prepare_kprobe+0x10c=
/0x2d0
>   [   67.288490][  T122] LR [c000000000050bec] arch_prepare_kprobe+0xfc/0=
x2d0
>   [   67.289025][  T122] Call Trace:
>   [   67.289268][  T122] [c000000034847850] [c0000000012f77a0] 0xc0000000=
012f77a0 (unreliable)
>   [   67.289999][  T122] [c0000000348478d0] [c000000000231320] register_k=
probe+0x3c0/0x7a0
>   [   67.290439][  T122] [c000000034847940] [c0000000002938c0] __register=
_trace_kprobe+0x140/0x1a0
>   [   67.290898][  T122] [c0000000348479b0] [c0000000002944c4] __trace_kp=
robe_create+0x794/0x1040
>   [   67.291330][  T122] [c000000034847b60] [c0000000002a1614] trace_prob=
e_create+0xc4/0xe0
>   [   67.291717][  T122] [c000000034847bb0] [c00000000029363c] create_or_=
delete_trace_kprobe+0x2c/0x80
>   [   67.292158][  T122] [c000000034847bd0] [c000000000264420] trace_pars=
e_run_command+0xf0/0x210
>   [   67.292611][  T122] [c000000034847c70] [c0000000002934a0] probes_wri=
te+0x20/0x40
>   [   67.292996][  T122] [c000000034847c90] [c00000000045e98c] vfs_write+=
0xfc/0x450
>   [   67.293356][  T122] [c000000034847d50] [c00000000045eec4] ksys_write=
+0x84/0x140
>   [   67.293716][  T122] [c000000034847da0] [c00000000002e4fc] system_cal=
l_exception+0x17c/0x3a0
>   [   67.294186][  T122] [c000000034847e10] [c00000000000c0e8] system_cal=
l_vectored_common+0xe8/0x278
>   [   67.294680][  T122] --- interrupt: 3000 at 0x7fffa5682de0
>   [   67.294937][  T122] NIP:  00007fffa5682de0 LR: 0000000000000000 CTR:=
 0000000000000000
>   [   67.295313][  T122] REGS: c000000034847e80 TRAP: 3000   Not tainted =
 (6.0.0-rc3-00007-gdcf8e5633e2e)
>   [   67.295725][  T122] MSR:  900000000280f033 <SF,HV,VEC,VSX,EE,PR,FP,M=
E,IR,DR,RI,LE>  CR: 44002408  XER: 00000000
>   [   67.296291][  T122] IRQMASK: 0
>   [   67.296291][  T122] GPR00: 0000000000000004 00007fffe8eeaec0 00007ff=
fa5757300 0000000000000001
>   [   67.296291][  T122] GPR04: 0000000116329c60 0000000000000017 0000000=
000116329 0000000000000000
>   [   67.296291][  T122] GPR08: 0000000000000006 0000000000000000 0000000=
000000000 0000000000000000
>   [   67.296291][  T122] GPR12: 0000000000000000 00007fffa580ac60 0000000=
1155e0460 0000000000000000
>   [   67.296291][  T122] GPR16: 0000000000000000 00007fffe8eeb3c8 0000000=
116320728 0000000000000000
>   [   67.296291][  T122] GPR20: 0000000116320720 0000000000000000 0000000=
000000000 0000000000000002
>   [   67.296291][  T122] GPR24: 00000001163206f0 0000000000000020 00007ff=
fe8eeafa0 0000000000000001
>   [   67.296291][  T122] GPR28: 0000000000000000 0000000000000017 0000000=
116329c60 0000000000000001
>   [   67.299570][  T122] NIP [00007fffa5682de0] 0x7fffa5682de0
>   [   67.299837][  T122] LR [0000000000000000] 0x0
>   [   67.300072][  T122] --- interrupt: 3000
>   [   67.300447][  T122] Instruction dump:
>   [   67.300736][  T122] 386319d8 481342f5 60000000 60000000 60000000 e87=
f0028 3863fffc 481dc4d1
>   [   67.301230][  T122] 60000000 2c230000 41820018 e9230058 <81290000> 5=
52936be 2c090001 4182018c
>   [   67.302102][  T122] ---[ end trace 0000000000000000 ]---
>   [   67.302496][  T122]

Please consider trimming the backtrace to only capture the necessary=20
information:
https://docs.kernel.org/process/submitting-patches.html#backtraces-in-commi=
t-mesages

>=20
> The address being probed has some special:
>=20
>   cmdline_proc_show: Probe based on ftrace
>   cmdline_proc_show+16: Probe for the next instruction at the ftrace loca=
tion
>=20
> The ftrace-based kprobe does not generate kprobe::ainsn::insn, it gets
> set to NULL. In arch_prepare_kprobe() it will check for:
>=20
>   ...
>   prev =3D get_kprobe(p->addr - 1);
>   preempt_enable_no_resched();
>   if (prev && ppc_inst_prefixed(ppc_inst_read(prev->ainsn.insn))) {
>   ...
>=20
> If prev is based on ftrace, 'ppc_inst_read(prev->ainsn.insn)' will occur
> with a null pointer reference. At this point prev->addr will not be a
> prefixed instruction, so the check can be skipped.
>=20
> Check if prev is ftrace-based kprobe before reading 'prev->ainsn.insn'
> to fix this problem.
>=20
> Fixes: b4657f7650ba ("powerpc/kprobes: Don't allow breakpoints on suffixe=
s")
> Signed-off-by: Li Huafei <lihuafei1@huawei.com>
> ---
>  arch/powerpc/kernel/kprobes.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/kprobes.c b/arch/powerpc/kernel/kprobes.c
> index 912d4f8a13be..9f6cbbd56809 100644
> --- a/arch/powerpc/kernel/kprobes.c
> +++ b/arch/powerpc/kernel/kprobes.c
> @@ -161,7 +161,12 @@ int arch_prepare_kprobe(struct kprobe *p)
>  	preempt_disable();
>  	prev =3D get_kprobe(p->addr - 1);
>  	preempt_enable_no_resched();
> -	if (prev && ppc_inst_prefixed(ppc_inst_read(prev->ainsn.insn))) {
> +	/*
> +	 * When prev is a ftrace-based kprobe, we don't have an insn, and it
> +	 * doesn't probe for prefixed instruction.
> +	 */
> +	if (prev && !kprobe_ftrace(prev) &&
> +	    ppc_inst_prefixed(ppc_inst_read(prev->ainsn.insn))) {
>  		printk("Cannot register a kprobe on the second word of prefixed instru=
ction\n");
>  		ret =3D -EINVAL;
>  	}

It's fine to keep the if condition on a single line.

Other than that, thanks for the fix!
Reviewed-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


- Naveen

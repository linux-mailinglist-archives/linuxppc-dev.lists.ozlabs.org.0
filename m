Return-Path: <linuxppc-dev+bounces-11872-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6D2B48764
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 10:44:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL0qM4R7fz2xQ1;
	Mon,  8 Sep 2025 18:43:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757321039;
	cv=none; b=P7cIUIL0plsOZpugt/6uKDkC0c41+EKehoZFN2dn5VKH0ywL4pqsq2EeLeXmoGZVhqtqlp4bteBhL9DxPfDXYDGLFGL5nWEOSRACawoZNdupgILMeVwiO5Ez5QZR/IsyNV5Hit8bLi8D07YrFP9OxJkivI4j7X3qRskEYvm3ML43D0Vqbe8iprtWZEOKJOCdpK4pyJUpTQeU1TIgxPsLThdXLs6fI0Nlt2JGVVqtOkkGs+8pfGzSeVZrDLyZUQ9S0hLNxvgTRzhxy7Jl/1anBi7GCkdYcPsmpXbD1sHW4Q/14Z1XENVJ/FXP42gwktIvxG6/yrQj6IWVMYb16cQxgw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757321039; c=relaxed/relaxed;
	bh=cMhxN1ApATCIu7SCIjRuLA79d9t8nTSZQ2UWMunO3qc=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PKTGW4KrStPehBBS7i84ibALYwRZlAD7sG8l6IQhzk2sL5iqXSXgsx5+sl8lLEQFlSCYEDQ2XDYqWmrZhxOTpTefFxLu34PM/aGpdyE97VlK2xuljXx1KYNh4XKthL2RD7Of+0Pho4C8AwCCwxTiIx1dHsHW05hjNDoYeAwa/fbBtaxo6gZeSutXszHK2C/Vzl/ySOeI9HI9JoLI+/53Q/JoQeCRG4gW8SqKCsGksTN4CfkkPrnulmczw9p58+XjooSzRM04vRrsRjgDiiGlz5gTW/bz7Yg3ymkbtBNkvItqHjPYplIJjMDIZIcyeF2uM7tEtgPJrJ9LLZWkud9dsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nvKHHAXL; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nvKHHAXL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL0qL40Zfz2xPy
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 18:43:58 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5886dl9m021177;
	Mon, 8 Sep 2025 08:43:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=cMhxN1
	ApATCIu7SCIjRuLA79d9t8nTSZQ2UWMunO3qc=; b=nvKHHAXLlZ5L3vQWQw0OqP
	7bCDXr5PspHF7EJRrmy28imTV/8EexuSzeI1uuG7R9Us3evviW7ovF0Yk1XMgMTG
	qqC33+W5K8rdBJLNUnZwVUzibK05hMYqJGl+mUu0/FSc9ow0Co11ac2LeVGRNRN1
	HUPD8lpkDW/4j3t03bX92+FQq6H4P0JKjigSjWl15otvfqjWbVqFEvDxzW0Gk1yD
	fA0vW16+WxUUuHAImI7CYNfIKXdX8ZTG9uQTFaKSgQZlWJfGbQdoa3uwavbi1tNT
	h9Y8z5IhieATRgf9b9Z1c8NyFdOmQXg8raG6vAFNdu0XsbN7t2fyaUTxDpENTY5Q
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490bcsg58m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 08:43:40 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58861mWN017181;
	Mon, 8 Sep 2025 08:43:39 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4911gm50c3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Sep 2025 08:43:39 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5888hZlX40108482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Sep 2025 08:43:35 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9B5E62004B;
	Mon,  8 Sep 2025 08:43:35 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4356220040;
	Mon,  8 Sep 2025 08:43:30 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.243.123])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  8 Sep 2025 08:43:29 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [linux-next20250903] Kernel OOPs at perf_callchain_user
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <49cb29fc-003c-422a-98bd-dee8f13aa0b4@linux.ibm.com>
Date: Mon, 8 Sep 2025 14:13:15 +0530
Cc: "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Namhyung Kim <namhyung@kernel.org>, jpoimboe@kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexei Starovoitov <ast@kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <61EEB50C-D1B8-4F8D-BECC-BE8D61480534@linux.ibm.com>
References: <49cb29fc-003c-422a-98bd-dee8f13aa0b4@linux.ibm.com>
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxMCBTYWx0ZWRfX3Xq5my//jCw4
 sKtwjMtWOmHAfusKSSmYv4eWo8E+sc5Y+rHjiH6nzjnWaOWxez2FTpyRv+Jw91Qepwd7NaBcO+o
 +pHWL4uo/e03WWkS6xFSfZVvMIkE3vmOXzj3PMet3n6o9GhedQ1cjCdi3x6/skllaDUKV2HA907
 5bJ4pN0GjzuDcfymBsW29Vs3Ll3kXdoEdW/l7Y/WTyj3xKFaDl8Q+njot71Lt5G9FXY8XjfIM6T
 6bRLJt1TGH4GobWNWJOVVY8xByqb+0I5psAbItH4hIX52EteuwbLfTQ0Jks+ywnM7Ao6ZU4tXM7
 NkC7ZN8tYzLMq6gxIAZNwRJhoUZApoLGlT9qkKNSeA/+OKoXfIUHnSGnBPmm0cbL2tXDHgF3Isw
 2kvdTMj+
X-Authority-Analysis: v=2.4 cv=SKNCVPvH c=1 sm=1 tr=0 ts=68be973c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=qjlTTxJWgx1vW4Ygh5AA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 0tc081tJWCoEu6FfYSjS0n4mQYJlmh4y
X-Proofpoint-ORIG-GUID: 0tc081tJWCoEu6FfYSjS0n4mQYJlmh4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_02,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 adultscore=0 suspectscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060010
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 5 Sep 2025, at 10:14=E2=80=AFAM, Venkat Rao Bagalkote =
<venkat88@linux.ibm.com> wrote:
>=20
> Greetings!!!
>=20
>=20
> IBM CI has reported kernel crash, while running perf test case on =
next20250903 kernel.
>=20
>=20
> Test: =
https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/=
perf/perf_test.py=20
>=20
> Yaml: =
https://github.com/sacsant/avocado-misc-tests/blob/ci/perf/perf_test.py.da=
ta/perf_arnext.yaml
>=20
>=20

Hi Venkat

I tried with linux-next-next-20250905 on powerpc system. And picking =
perf-tools-next from =
https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
Ran =E2=80=9Cperf test=E2=80=9D and couldn=E2=80=99t hit the OOPs

Are you able to recreate on latest linux-next ?

Thanks
Athira

> Traces:
>=20
>=20
> [ 6818.892952] BUG: Kernel NULL pointer dereference at 0x00000590
> [ 6818.892997] Faulting instruction address: 0xc00000000014b960
> [ 6818.893010] Oops: Kernel access of bad area, sig: 11 [#1]
> [ 6818.893024] LE PAGE_SIZE=3D64K MMU=3DHash  SMP NR_CPUS=3D8192 NUMA =
pSeries
> [ 6818.893052] Modules linked in: dm_mod(E) ext4(E) crc16(E) =
mbcache(E) jbd2(E) nft_compat(E) bonding(E) nft_fib_inet(E) =
nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) =
nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) =
nft_chain_nat(E) rfkill(E) ip_set(E) mlx5_ib(E) ib_uverbs(E) ib_core(E) =
pseries_rng(E) vmx_crypto(E) drm(E) drm_panel_orientation_quirks(E) =
xfs(E) sr_mod(E) cdrom(E) sd_mod(E) sg(E) lpfc(E) nvmet_fc(E) =
ibmvscsi(E) ibmveth(E) scsi_transport_srp(E) nvmet(E) mlx5_core(E) =
nvme_fc(E) nvme_fabrics(E) mlxfw(E) nvme_core(E) tls(E) =
scsi_transport_fc(E) psample(E) fuse(E) [last unloaded: scsi_debug(E)]
> [ 6818.893294] CPU: 1 UID: 0 PID: 266107 Comm: sched-messaging Kdump: =
loaded Tainted: G            E  6.17.0-rc4-next-20250903 #1 VOLUNTARY
> [ 6818.893323] Tainted: [E]=3DUNSIGNED_MODULE
> [ 6818.893331] Hardware name: IBM,8375-42A POWER9 (architected) =
0x4e0202 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
> [ 6818.893343] NIP:  c00000000014b960 LR: c00000000014b920 CTR: =
c0000000003b5188
> [ 6818.893357] REGS: c00000020e76f1f0 TRAP: 0380   Tainted: G       E  =
      (6.17.0-rc4-next-20250903)
> [ 6818.893374] MSR:  800000000280b033 =
<SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88822888  XER: 20040000
> [ 6818.893439] CFAR: c0000000004d2e68 IRQMASK: 1
> [ 6818.893439] GPR00: c00000000014b920 c00000020e76f490 =
c000000001c98100 0000000000000000
> [ 6818.893439] GPR04: 00007fffeed48148 0000000000000008 =
0000000000000100 00007fffb90ad054
> [ 6818.893439] GPR08: c00000020e768000 0000000000000000 =
00007fffeed48870 0000000000004000
> [ 6818.893439] GPR12: c0000000003b5188 c000000017fff300 =
0000000000000000 0000000000000000
> [ 6818.893439] GPR16: 0000000000000000 0000000000000000 =
c00000020e76f8e8 fffffffffffffff9
> [ 6818.893439] GPR20: 0000000000000001 fffffffffffffffb =
c000000002d12a80 c00000000120f444
> [ 6818.893439] GPR24: 0000000000000001 fffffffffffffe00 =
c00000020fd31e00 000ffffffffffff8
> [ 6818.893439] GPR28: 00007fffffffffdf 0000000000000000 =
00007fffeed48140 c00000020e76f580
> [ 6818.893652] NIP [c00000000014b960] =
perf_callchain_user_64+0x1b0/0x4f0
> [ 6818.893676] LR [c00000000014b920] =
perf_callchain_user_64+0x170/0x4f0
> [ 6818.893696] Call Trace:
> [ 6818.893709] [c00000020e76f490] [c00000000014b920] =
perf_callchain_user_64+0x170/0x4f0 (unreliable)
> [ 6818.893732] [c00000020e76f530] [c00000000014b794] =
perf_callchain_user+0x20/0x3c
> [ 6818.893760] [c00000020e76f550] [c0000000004af654] =
get_perf_callchain+0x1b0/0x31c
> [ 6818.893782] [c00000020e76f5d0] [c0000000004793f8] =
bpf_get_stackid+0x90/0xec
> [ 6818.893799] [c00000020e76f600] [c0000000003b51fc] =
bpf_get_stackid_raw_tp+0x7c/0xd8
> [ 6818.893816] [c00000020e76f640] [c00800000064b7b4] =
bpf_prog_6f912c7f0c27afc3_on_switch+0x1a4/0x538
> [ 6818.893839] [c00000020e76f6e0] [c0000000003b4254] =
bpf_trace_run4+0xa8/0x1c0
> [ 6818.893853] [c00000020e76f760] [c0000000001bf480] =
__bpf_trace_sched_switch+0x18/0x2c
> [ 6818.893869] [c00000020e76f780] [c00000000120f0c4] =
__schedule+0x4bc/0x7fc
> [ 6818.893885] [c00000020e76f870] [c00000000120f444] =
schedule+0x40/0xd4
> [ 6818.893899] [c00000020e76f8a0] [c00000000120f718] =
schedule_preempt_disabled+0x20/0x30
> [ 6818.893916] [c00000020e76f8c0] [c000000001214560] =
rwsem_down_write_slowpath+0x2c8/0x90c
> [ 6818.893935] [c00000020e76f9a0] [c000000001214c2c] =
down_write+0x88/0x9c
> [ 6818.893951] [c00000020e76f9d0] [c00000000055d8c4] =
__put_anon_vma+0xf8/0x130
> [ 6818.893968] [c00000020e76fa00] [c00000000055db94] =
unlink_anon_vmas+0x268/0x308
> [ 6818.893986] [c00000020e76fa70] [c0000000005343dc] =
free_pgtables+0x100/0x390
> [ 6818.894008] [c00000020e76fb50] [c00000000054a3b0] =
exit_mmap+0x1b4/0x5b0
> [ 6818.894026] [c00000020e76fc90] [c0000000001677dc] =
__mmput+0x64/0x1b4
> [ 6818.894041] [c00000020e76fcc0] [c000000000175338] =
exit_mm+0xdc/0x16c
> [ 6818.894061] [c00000020e76fd00] [c0000000001755d4] =
do_exit+0x20c/0x56c
> [ 6818.894076] [c00000020e76fdb0] [c000000000175b20] =
do_group_exit+0x4c/0xbc
> [ 6818.894095] [c00000020e76fdf0] [c000000000175bb8] =
pid_child_should_wake+0x0/0x80
> [ 6818.894112] [c00000020e76fe10] [c000000000032bf4] =
system_call_exception+0x124/0x320
> [ 6818.894137] [c00000020e76fe50] [c00000000000d05c] =
system_call_vectored_common+0x15c/0x2ec
> [ 6818.894156] ---- interrupt: 3000 at 0x7fffb90ad054
> [ 6818.894169] NIP:  00007fffb90ad054 LR: 00007fffb90ad054 CTR: =
0000000000000000
> [ 6818.894184] REGS: c00000020e76fe80 TRAP: 3000   Tainted: G       E  =
      (6.17.0-rc4-next-20250903)
> [ 6818.894200] MSR:  800000000280f033 =
<SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44888822  XER: 00000000
> [ 6818.894243] IRQMASK: 0
> [ 6818.894243] GPR00: 00000000000000ea 00007fffeed48140 =
00007fffb91e7200 0000000000000000
> [ 6818.894243] GPR04: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000040
> [ 6818.894243] GPR08: 0000000000000000 0000000000000000 =
0000000000000000 0000000000000000
> [ 6818.894243] GPR12: 0000000000000000 00007fffb9c86080 =
000001003dfcae70 00007fffeed482e0
> [ 6818.894243] GPR16: 000001003dfcaa78 0000000010145800 =
000001003dfcaac8 00000000105cf1d0
> [ 6818.894243] GPR20: 00000000105bc6e0 0000000000000000 =
0000000000000800 0000000000000001
> [ 6818.894243] GPR24: 0000000000000000 00007fffb91e0a38 =
0000000000000000 0000000000000001
> [ 6818.894243] GPR28: 00007fffb91e1fa8 00007fffb9c7f0b8 =
fffffffffffff000 0000000000000000
> [ 6818.894410] NIP [00007fffb90ad054] 0x7fffb90ad054
> [ 6818.894425] LR [00007fffb90ad054] 0x7fffb90ad054
> [ 6818.894434] ---- interrupt: 3000
> [ 6818.894441] Code: 41910100 ebc10028 e9210030 7d3e4850 282908f7 =
408100dc e9410038 7d475378 395e0730 7c275040 41820130 e93a0a70 =
<e9290590> 2c290000 41820010 39290470
> [ 6818.894499] ---[ end trace 0000000000000000 ]---
>=20
>=20
>=20
> If you happen to fix this, please add below tag.
>=20
>=20
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>=20
>=20
> Regards,
>=20
> Venkat.
>=20
>=20
>=20



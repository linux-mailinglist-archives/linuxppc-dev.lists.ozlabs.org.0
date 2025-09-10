Return-Path: <linuxppc-dev+bounces-11982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BF9B50CBD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 06:17:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cM6pX1gnMz3cfm;
	Wed, 10 Sep 2025 14:17:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757477828;
	cv=none; b=X6Stqe91dRb+vof/oMfCKAvbXveftdwlXbOjCgUqQ2KClZj2GpVGvYa4CpFjbT/KffsDVwbkUA+t4VGAfSkyEvB1yJMidnUYg8VyQP6oLVJfUtJyKXCwfmWAdTip9+mPAZcJR84RW2dNe7PFk4huXgnZ3P5FmDyJFFUUMpbytDs5snnvLQIoFf+TSzFwdH9FZcLb2Usi4H1R/pHyvQTNxXr5KKTL3D+vj/GBLjXo5+KWyuk7SAHO2rgVyqbWHFr72SlKkHqk2dofD2g9OVAwiRGio3NmKwS38n070eZ03Zak2kTqPivfptEJuwefyGFWjhsyjfTfspc+tDlEmD0BzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757477828; c=relaxed/relaxed;
	bh=5yAJvChSv6BHRsTp5zxQEXhpgHPi7pOtuz8MREcArOI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m3VCaX0eGLh4xAZ+taWgpaK4+8zq/RvDg3jGIaV1jq+Pms8zeVaO7ZZrVcJ4mrQA4cNubu272mCoQmPDGXYrewmf/gbqUeK1AMvpBfvWTUD8J6DVwoi37k3dr3ZsZFur2OHZYwjmDeLP0uceAKJlfb8WCWiq+yOst5/O4oHYEwaYUvfF01xB1/cfQ/fS9oWrAw678uYxai7bUemoFlOi9ahGS4VOoisuqjWelnAyRC4CtmIZp+IT4H1ZA6vqLSXPU/svYia61J1W5bxF5kOVSHtzaSgZ5FuP2p49zWgvWEGBUwzBLPTWTs59hBCmeSGS8Lbqr1OUYayidsFIVOjTGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tl3LifGl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Tl3LifGl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cM6pW16fLz3cfQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 14:17:06 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58A4F4rX018622;
	Wed, 10 Sep 2025 04:16:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=5yAJvC
	hSv6BHRsTp5zxQEXhpgHPi7pOtuz8MREcArOI=; b=Tl3LifGl7uT1JnpgvaMiJ+
	VW21G51lED0F/MfAfZMD/3HhJaQwfOzqGhZJizV5hOPe7ws8fjAYzcjq8HisE1Eb
	g4b2eQ+Lr7/ot/3V0yYH6d8y8tomzWGOg2c/lJJ9TVD5eCb6+9tKErGFRh0ZtEO9
	NjAugJnvDiNNFmun9x61Qo1A1EjDyIpWmgPMyiGoD5/KRcbUIGZ7F3M+QZXdJob4
	J0GGQzbreid4DIkHwzvrGvEBNxkjtTe5ZA1MqF673i9M23aXqy9W0eQwuBBL2C1G
	Dy+OvTNigzK64SoqkiXkXKD6qn3E1+crgSiPmm5oLsonz+hXfmz//UP2JnP3HiZw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 490cmwusdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 04:16:22 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58A11FdW020495;
	Wed, 10 Sep 2025 04:16:21 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 490yp0xqw7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Sep 2025 04:16:21 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58A4GJll8586634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Sep 2025 04:16:19 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F90A5805D;
	Wed, 10 Sep 2025 04:16:19 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EC75C58054;
	Wed, 10 Sep 2025 04:16:12 +0000 (GMT)
Received: from [9.61.242.103] (unknown [9.61.242.103])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 10 Sep 2025 04:16:12 +0000 (GMT)
Message-ID: <b52e1258-9fc5-4b8a-8494-ee56e9f21e20@linux.ibm.com>
Date: Wed, 10 Sep 2025 09:46:11 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [linux-next20250903] Kernel OOPs at perf_callchain_user
Content-Language: en-GB
To: Athira Rajeev <atrajeev@linux.ibm.com>
Cc: "open list:PERFORMANCE EVENTS SUBSYSTEM"
 <linux-perf-users@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Namhyung Kim <namhyung@kernel.org>, jpoimboe@kernel.org,
        Steven Rostedt <rostedt@goodmis.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Alexei Starovoitov <ast@kernel.org>
References: <49cb29fc-003c-422a-98bd-dee8f13aa0b4@linux.ibm.com>
 <61EEB50C-D1B8-4F8D-BECC-BE8D61480534@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <61EEB50C-D1B8-4F8D-BECC-BE8D61480534@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: dmms51XK7c2f5Ye8pfUnvgGIAxjPiN9-
X-Proofpoint-ORIG-GUID: dmms51XK7c2f5Ye8pfUnvgGIAxjPiN9-
X-Authority-Analysis: v=2.4 cv=J52q7BnS c=1 sm=1 tr=0 ts=68c0fb96 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=5ORd3ZSGx9RsCsWIpEcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNSBTYWx0ZWRfXzrY3YPeJe3sI
 a/xxwht7Hp33vacIOscs3+LqsZvrur7VMgheRuY/Dx1qvTOWHkyPgF2Vh09Ear9fGezN0g4ochO
 cBsCgIIyIaolOw5jD4mGWxUkP4iBtzdHevidxVOEVLi9KlV7swxDFbDRlV1+8vnUOasEXzJJlVp
 z+RgGrvCLwEn4h2NVqCizNuiSTFTRv9/oi8+kcUswohmNwhlPbUmNMYEypJ9FvSIAVjAnE79qXj
 CmRG+bjr/A2Vvyb2sze3/5ImXVyJJYWHl4JVdzSPCZ3PCZAMtjr7xiE1zPLbCuud+22HYG9KJU6
 p3LnCJ2ZCkOhhTM7JHnDjUL6QiSBVhsADmwqXlJlFtwtfy+oC7FpvOnbML/39fCJW7+12t9HzfG
 P98Ujvw+
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-09_03,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060025
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 08/09/25 2:13 pm, Athira Rajeev wrote:
>
>> On 5 Sep 2025, at 10:14 AM, Venkat Rao Bagalkote <venkat88@linux.ibm.com> wrote:
>>
>> Greetings!!!
>>
>>
>> IBM CI has reported kernel crash, while running perf test case on next20250903 kernel.
>>
>>
>> Test: https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/perf/perf_test.py
>>
>> Yaml: https://github.com/sacsant/avocado-misc-tests/blob/ci/perf/perf_test.py.data/perf_arnext.yaml
>>
>>
> Hi Venkat
>
> I tried with linux-next-next-20250905 on powerpc system. And picking perf-tools-next from https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git
> Ran “perf test” and couldn’t hit the OOPs
>
> Are you able to recreate on latest linux-next ?
>
> Thanks
> Athira


Hello Athira,


Thanks for looking into this. But unfortunately, I am also not able to 
reproduce it.


Regards,

Venkat.

>> Traces:
>>
>>
>> [ 6818.892952] BUG: Kernel NULL pointer dereference at 0x00000590
>> [ 6818.892997] Faulting instruction address: 0xc00000000014b960
>> [ 6818.893010] Oops: Kernel access of bad area, sig: 11 [#1]
>> [ 6818.893024] LE PAGE_SIZE=64K MMU=Hash  SMP NR_CPUS=8192 NUMA pSeries
>> [ 6818.893052] Modules linked in: dm_mod(E) ext4(E) crc16(E) mbcache(E) jbd2(E) nft_compat(E) bonding(E) nft_fib_inet(E) nft_fib_ipv4(E) nft_fib_ipv6(E) nft_fib(E) nft_reject_inet(E) nf_reject_ipv4(E) nf_reject_ipv6(E) nft_reject(E) nft_ct(E) nft_chain_nat(E) rfkill(E) ip_set(E) mlx5_ib(E) ib_uverbs(E) ib_core(E) pseries_rng(E) vmx_crypto(E) drm(E) drm_panel_orientation_quirks(E) xfs(E) sr_mod(E) cdrom(E) sd_mod(E) sg(E) lpfc(E) nvmet_fc(E) ibmvscsi(E) ibmveth(E) scsi_transport_srp(E) nvmet(E) mlx5_core(E) nvme_fc(E) nvme_fabrics(E) mlxfw(E) nvme_core(E) tls(E) scsi_transport_fc(E) psample(E) fuse(E) [last unloaded: scsi_debug(E)]
>> [ 6818.893294] CPU: 1 UID: 0 PID: 266107 Comm: sched-messaging Kdump: loaded Tainted: G            E  6.17.0-rc4-next-20250903 #1 VOLUNTARY
>> [ 6818.893323] Tainted: [E]=UNSIGNED_MODULE
>> [ 6818.893331] Hardware name: IBM,8375-42A POWER9 (architected) 0x4e0202 0xf000005 of:IBM,FW950.80 (VL950_131) hv:phyp pSeries
>> [ 6818.893343] NIP:  c00000000014b960 LR: c00000000014b920 CTR: c0000000003b5188
>> [ 6818.893357] REGS: c00000020e76f1f0 TRAP: 0380   Tainted: G       E        (6.17.0-rc4-next-20250903)
>> [ 6818.893374] MSR:  800000000280b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 88822888  XER: 20040000
>> [ 6818.893439] CFAR: c0000000004d2e68 IRQMASK: 1
>> [ 6818.893439] GPR00: c00000000014b920 c00000020e76f490 c000000001c98100 0000000000000000
>> [ 6818.893439] GPR04: 00007fffeed48148 0000000000000008 0000000000000100 00007fffb90ad054
>> [ 6818.893439] GPR08: c00000020e768000 0000000000000000 00007fffeed48870 0000000000004000
>> [ 6818.893439] GPR12: c0000000003b5188 c000000017fff300 0000000000000000 0000000000000000
>> [ 6818.893439] GPR16: 0000000000000000 0000000000000000 c00000020e76f8e8 fffffffffffffff9
>> [ 6818.893439] GPR20: 0000000000000001 fffffffffffffffb c000000002d12a80 c00000000120f444
>> [ 6818.893439] GPR24: 0000000000000001 fffffffffffffe00 c00000020fd31e00 000ffffffffffff8
>> [ 6818.893439] GPR28: 00007fffffffffdf 0000000000000000 00007fffeed48140 c00000020e76f580
>> [ 6818.893652] NIP [c00000000014b960] perf_callchain_user_64+0x1b0/0x4f0
>> [ 6818.893676] LR [c00000000014b920] perf_callchain_user_64+0x170/0x4f0
>> [ 6818.893696] Call Trace:
>> [ 6818.893709] [c00000020e76f490] [c00000000014b920] perf_callchain_user_64+0x170/0x4f0 (unreliable)
>> [ 6818.893732] [c00000020e76f530] [c00000000014b794] perf_callchain_user+0x20/0x3c
>> [ 6818.893760] [c00000020e76f550] [c0000000004af654] get_perf_callchain+0x1b0/0x31c
>> [ 6818.893782] [c00000020e76f5d0] [c0000000004793f8] bpf_get_stackid+0x90/0xec
>> [ 6818.893799] [c00000020e76f600] [c0000000003b51fc] bpf_get_stackid_raw_tp+0x7c/0xd8
>> [ 6818.893816] [c00000020e76f640] [c00800000064b7b4] bpf_prog_6f912c7f0c27afc3_on_switch+0x1a4/0x538
>> [ 6818.893839] [c00000020e76f6e0] [c0000000003b4254] bpf_trace_run4+0xa8/0x1c0
>> [ 6818.893853] [c00000020e76f760] [c0000000001bf480] __bpf_trace_sched_switch+0x18/0x2c
>> [ 6818.893869] [c00000020e76f780] [c00000000120f0c4] __schedule+0x4bc/0x7fc
>> [ 6818.893885] [c00000020e76f870] [c00000000120f444] schedule+0x40/0xd4
>> [ 6818.893899] [c00000020e76f8a0] [c00000000120f718] schedule_preempt_disabled+0x20/0x30
>> [ 6818.893916] [c00000020e76f8c0] [c000000001214560] rwsem_down_write_slowpath+0x2c8/0x90c
>> [ 6818.893935] [c00000020e76f9a0] [c000000001214c2c] down_write+0x88/0x9c
>> [ 6818.893951] [c00000020e76f9d0] [c00000000055d8c4] __put_anon_vma+0xf8/0x130
>> [ 6818.893968] [c00000020e76fa00] [c00000000055db94] unlink_anon_vmas+0x268/0x308
>> [ 6818.893986] [c00000020e76fa70] [c0000000005343dc] free_pgtables+0x100/0x390
>> [ 6818.894008] [c00000020e76fb50] [c00000000054a3b0] exit_mmap+0x1b4/0x5b0
>> [ 6818.894026] [c00000020e76fc90] [c0000000001677dc] __mmput+0x64/0x1b4
>> [ 6818.894041] [c00000020e76fcc0] [c000000000175338] exit_mm+0xdc/0x16c
>> [ 6818.894061] [c00000020e76fd00] [c0000000001755d4] do_exit+0x20c/0x56c
>> [ 6818.894076] [c00000020e76fdb0] [c000000000175b20] do_group_exit+0x4c/0xbc
>> [ 6818.894095] [c00000020e76fdf0] [c000000000175bb8] pid_child_should_wake+0x0/0x80
>> [ 6818.894112] [c00000020e76fe10] [c000000000032bf4] system_call_exception+0x124/0x320
>> [ 6818.894137] [c00000020e76fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
>> [ 6818.894156] ---- interrupt: 3000 at 0x7fffb90ad054
>> [ 6818.894169] NIP:  00007fffb90ad054 LR: 00007fffb90ad054 CTR: 0000000000000000
>> [ 6818.894184] REGS: c00000020e76fe80 TRAP: 3000   Tainted: G       E        (6.17.0-rc4-next-20250903)
>> [ 6818.894200] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44888822  XER: 00000000
>> [ 6818.894243] IRQMASK: 0
>> [ 6818.894243] GPR00: 00000000000000ea 00007fffeed48140 00007fffb91e7200 0000000000000000
>> [ 6818.894243] GPR04: 0000000000000000 0000000000000000 0000000000000000 0000000000000040
>> [ 6818.894243] GPR08: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>> [ 6818.894243] GPR12: 0000000000000000 00007fffb9c86080 000001003dfcae70 00007fffeed482e0
>> [ 6818.894243] GPR16: 000001003dfcaa78 0000000010145800 000001003dfcaac8 00000000105cf1d0
>> [ 6818.894243] GPR20: 00000000105bc6e0 0000000000000000 0000000000000800 0000000000000001
>> [ 6818.894243] GPR24: 0000000000000000 00007fffb91e0a38 0000000000000000 0000000000000001
>> [ 6818.894243] GPR28: 00007fffb91e1fa8 00007fffb9c7f0b8 fffffffffffff000 0000000000000000
>> [ 6818.894410] NIP [00007fffb90ad054] 0x7fffb90ad054
>> [ 6818.894425] LR [00007fffb90ad054] 0x7fffb90ad054
>> [ 6818.894434] ---- interrupt: 3000
>> [ 6818.894441] Code: 41910100 ebc10028 e9210030 7d3e4850 282908f7 408100dc e9410038 7d475378 395e0730 7c275040 41820130 e93a0a70 <e9290590> 2c290000 41820010 39290470
>> [ 6818.894499] ---[ end trace 0000000000000000 ]---
>>
>>
>>
>> If you happen to fix this, please add below tag.
>>
>>
>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>
>>
>> Regards,
>>
>> Venkat.
>>
>>
>>
>


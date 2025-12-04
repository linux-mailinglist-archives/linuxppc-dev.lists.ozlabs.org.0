Return-Path: <linuxppc-dev+bounces-14602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC7CA3D6B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 14:36:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMbC91mLzz2xGg;
	Fri, 05 Dec 2025 00:36:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764854925;
	cv=none; b=IiyofASt02JvYW1qn7mP3vE7jZvQMuxsHHuldp7IULB5ZW2Q63ZhbQySRYnKkrm/JrZyPKkvWzTbM7a7zGpBsZr1ZsshpQR6W1a1twH/EiM0PW9UU+k0pbaajBEkn9C0BkmHtZ2XVDoa2VtMeBU5sLC4kFRd6tuBPFGkc1iy1Gro2k3U4mIEHJ2RCB4eM/BeFCcR/NOWzfVmOX/9cSeO5InGFpeW3qKODhN6SvMVCuhzpER2G0qSKKyLBczCfKZXypx6XIMeTBocloz9RqM7zKJtOE1TflMkiJOM+XWk59NI/F5bTIwI8Oe1LZHm4Me8wYr5vN2/aR0bx0DyhgZkYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764854925; c=relaxed/relaxed;
	bh=bc25OxUPMxGCa4F1t/vPJJJOFo3QZi/rbN0wLKgDP00=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fe8JgsIvLc13J2tEOUqgkfs2/AvRj9jY9WHU0UOaqvmGCZWTlXA7sIfguCEYuWkvoDlNftnwQpPTSdHww+/9+nvS6Bl9113P29Sbv8sNx/iH2rrbHm+yeRbDRLmpmcQa3QRc6ka1vvSXf1lLm9w7cNqt6VPIjyo5F3cxESxJ5ViM9lwaBreiH6jCGTiNLyD8f8BaJ0SEq9/Vbj6HBb7t3MahJuY9LLxkwYYpz3nqSKAd39Hf+lLiL3zvHovXNNgoW9LkPpDdGppi0u1yzIyP2M+QRoFxCWjT9g+W8RE5jbtZzfpMERI37fDoST+DphhkYxgNYtC5BSdEsgayr3xLpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ijm5qKsD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=iii@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ijm5qKsD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=iii@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMb1m3KGbz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Dec 2025 00:28:43 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4Ch1pt020195;
	Thu, 4 Dec 2025 13:28:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=bc25Ox
	UPMxGCa4F1t/vPJJJOFo3QZi/rbN0wLKgDP00=; b=Ijm5qKsDQuF0ilFdMjIDQJ
	H+w1h74Fryd5JinhFbctciCfagRNPiChk8bke8vqLe2FcYpgrj5lCj0uRGJtXJyW
	7Nlo3baJgaoKWW8kFSW4bQK/nz+bW5zAFgB0IPFmnI273Kb04flK6I8CINvXP/MU
	UraAFTM9tRcPAVZ5Si85lA4DvE1ND+8eVQu33FkjNF7HfVDsc5BfzOVNZzOO0u2T
	Y45gJ3WHr8cZHs/kf3r0BTpp4yfsTRBlneLdT/KVDTZYe/wtOO7wJPkYt/yDoj7b
	sCzw9y6EE95liMU9rPYhNg3Br9AYpsx7WagIid8cVctSA3VkKmQO3gXjue+TlK1g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja0f15-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 13:28:14 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B4DHaJj003844;
	Thu, 4 Dec 2025 13:28:13 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aqrja0f12-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 13:28:13 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4AoXTP024120;
	Thu, 4 Dec 2025 13:28:12 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4arb5sr2u0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 04 Dec 2025 13:28:12 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B4DS8tf47710634
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 4 Dec 2025 13:28:08 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 881862004B;
	Thu,  4 Dec 2025 13:28:08 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F8A820043;
	Thu,  4 Dec 2025 13:28:07 +0000 (GMT)
Received: from [127.0.0.1] (unknown [9.111.25.150])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  4 Dec 2025 13:28:07 +0000 (GMT)
Message-ID: <4ddbb5a1244cf444f330cc73b7d573f47b02f7eb.camel@linux.ibm.com>
Subject: Re: [PATCH 00/17] Paravirt CPUs and push task for less vCPU
 preemption
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, gregkh@linuxfoundation.org,
        pbonzini@redhat.com, seanjc@google.com, kprateek.nayak@amd.com,
        vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org,
        dietmar.eggemann@arm.com, christophe.leroy@csgroup.eu,
        linux-s390@vger.kernel.org
Date: Thu, 04 Dec 2025 14:28:07 +0100
In-Reply-To: <20251119124449.1149616-1-sshegde@linux.ibm.com>
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NkTHhROwv8hM6suNj8-hS3ocQyxUDJhb
X-Proofpoint-ORIG-GUID: PtBQL-tkHnge3f35R1yqQWE0sFbnp_KL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI5MDAyMCBTYWx0ZWRfX+rJAzX7S9oVk
 gX3CI4vpDBN7LaYUi3qkYKNcXFAOunW37eyz/ZW8jRU9mjEYNWaxYYvo0JGeEedlpZ2wwlYur+s
 Kyz1+UMbSMIWmmJ2UFt0aHpos54Vxt7YxEabB5duxWGe0KrMpwfwzz2w5dQ7QDxmgGU2hageORN
 oC5LN1CosCyRhpRMfB+sk0jSm+sk+CY2oRorK5bLTTwYBxrrcPyIjrtsZh5+BKCHOQvzcLizCF+
 F/7CoEV/oUlcMgwZyImS+3StHYqYjiCM4nxrn8Q6uJrxFqpbGyQ/eb2zyu7biv5VE8kHnARHnwD
 oq/xiUD931TfF0GyrkGZ4gJ4GorS4Jb2DY7Tz0ScfBd80MI8T2EQ81ejqWMfzNRnsgRslcvERWb
 M7obHABQIsa8MTmnT4jBrcLlw86CRg==
X-Authority-Analysis: v=2.4 cv=dYGNHHXe c=1 sm=1 tr=0 ts=69318c6e cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=NEAV23lmAAAA:8 a=bA8r-5xvC28MtSijCsoA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_03,2025-12-03_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 suspectscore=0 clxscore=1011 adultscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511290020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 2025-11-19 at 18:14 +0530, Shrikanth Hegde wrote:
> Detailed problem statement and some of the implementation choices
> were=20
> discussed earlier[1].
>=20
> [1]:
> https://lore.kernel.org/all/20250910174210.1969750-1-sshegde@linux.ibm.co=
m/
>=20
> This is likely the version which would be used for LPC2025 discussion
> on
> this topic. Feel free to provide your suggestion and hoping for a
> solution
> that works for different architectures and it's use cases.
>=20
> All the existing alternatives such as cpu hotplug, creating isolated
> partitions etc break the user affinity. Since number of CPUs to use
> change
> depending on the steal time, it is not driven by User. Hence it would
> be
> wrong to break the affinity. This series allows if the task is pinned
> only paravirt CPUs, it will continue running there.
>=20
> Changes compared v3[1]:
>=20
> - Introduced computation of steal time in powerpc code.
> - Derive number of CPUs to use and mark the remaining as paravirt
> based
> =C2=A0 on steal values.=20
> - Provide debugfs knobs to alter how steal time values being used.
> - Removed static key check for paravirt CPUs (Yury)
> - Removed preempt_disable/enable while calling stopper (Prateek)
> - Made select_idle_sibling and friends aware of paravirt CPUs.
> - Removed 3 unused schedstat fields and introduced 2 related to
> paravirt
> =C2=A0 handling.
> - Handled nohz_full case by enabling tick on it when there is CFS/RT
> on
> =C2=A0 it.
> - Updated helper patch to override arch behaviour for easier
> debugging
> =C2=A0 during development.
> - Kept=20
>=20
> Changes compared to v4[2]:
> - Last two patches were sent out separate instead of being with
> series.
> =C2=A0 That created confusion. Those two patches are debug patches one ca=
n
> =C2=A0 make use to check functionality across acrhitectures. Sorry about
> =C2=A0 that.
> - Use DEVICE_ATTR_RW instead (greg)
> - Made it as PATCH since arch specific handling completes the
> =C2=A0 functionality.
>=20
> [2]:
> https://lore.kernel.org/all/20251119062100.1112520-1-sshegde@linux.ibm.co=
m/
>=20
> TODO:=20
>=20
> - Get performance numbers on PowerPC, x86 and S390. Hopefully by next
> =C2=A0 week. Didn't want to hold the series till then.
>=20
> - The CPUs to mark as paravirt is very simple and doesn't work when
> =C2=A0 vCPUs aren't spread out uniformly across NUMA nodes. Ideal would b=
e
> splice
> =C2=A0 the numbers based on how many CPUs each NUMA node has. It is quite
> =C2=A0 tricky to do specially since cpumask can be on stack too. Given
> =C2=A0 NR_CPUS can be 8192 and nr_possible_nodes 32. Haven't got my head
> into
> =C2=A0 solving it yet. Maybe there is easier way.
>=20
> - DLPAR Add/Remove needs to call init of EC/VP cores (powerpc
> specific)
>=20
> - Userspace tools awareness such as irqbalance.=20
>=20
> - Delve into design of hint from Hyeprvisor(HW Hint). i.e Host
> informs
> =C2=A0 guest which/how many CPUs it has to use at this moment. This
> interface
> =C2=A0 should work across archs with each arch doing its specific
> handling.
>=20
> - Determine the default values for steal time related knobs
> =C2=A0 empirically and document them.
>=20
> - Need to check safety against CPU hotplug specially in
> process_steal.
>=20
>=20
> Applies cleanly on tip/master:
> commit c2ef745151b21d4dcc4b29a1eabf1096f5ba544b
>=20
>=20
> Thanks to srikar for providing the initial code around powerpc steal
> time handling code. Thanks to all who went through and provided
> reviews.
>=20
> PS: I haven't found a better name. Please suggest if you have any.
>=20
> Shrikanth Hegde (17):
> =C2=A0 sched/docs: Document cpu_paravirt_mask and Paravirt CPU concept
> =C2=A0 cpumask: Introduce cpu_paravirt_mask
> =C2=A0 sched/core: Dont allow to use CPU marked as paravirt
> =C2=A0 sched/debug: Remove unused schedstats
> =C2=A0 sched/fair: Add paravirt movements for proc sched file
> =C2=A0 sched/fair: Pass current cpu in select_idle_sibling
> =C2=A0 sched/fair: Don't consider paravirt CPUs for wakeup and load
> balance
> =C2=A0 sched/rt: Don't select paravirt CPU for wakeup and push/pull rt
> task
> =C2=A0 sched/core: Add support for nohz_full CPUs
> =C2=A0 sched/core: Push current task from paravirt CPU
> =C2=A0 sysfs: Add paravirt CPU file
> =C2=A0 powerpc: method to initialize ec and vp cores
> =C2=A0 powerpc: enable/disable paravirt CPUs based on steal time
> =C2=A0 powerpc: process steal values at fixed intervals
> =C2=A0 powerpc: add debugfs file for controlling handling on steal values
> =C2=A0 sysfs: Provide write method for paravirt
> =C2=A0 sysfs: disable arch handling if paravirt file being written
>=20
> =C2=A0.../ABI/testing/sysfs-devices-system-cpu=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 9 +
> =C2=A0Documentation/scheduler/sched-arch.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 37 +++
> =C2=A0arch/powerpc/include/asm/smp.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 1 +
> =C2=A0arch/powerpc/kernel/smp.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> =C2=A0arch/powerpc/platforms/pseries/lpar.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 223
> ++++++++++++++++++
> =C2=A0arch/powerpc/platforms/pseries/pseries.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 |=C2=A0=C2=A0 1 +
> =C2=A0drivers/base/cpu.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 59 +++++
> =C2=A0include/linux/cpumask.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 20 ++
> =C2=A0include/linux/sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +-
> =C2=A0kernel/sched/core.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 106 ++++++++-
> =C2=A0kernel/sched/debug.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 5 +-
> =C2=A0kernel/sched/fair.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 42 +++-
> =C2=A0kernel/sched/rt.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 11 +-
> =C2=A0kernel/sched/sched.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 9 +
> =C2=A014 files changed, 519 insertions(+), 14 deletions(-)

The capability to temporarily exclude CPUs from scheduling might be
beneficial for s390x, where users often run Linux using a proprietary
hypervisor called PR/SM and with high overcommit. In these
circumstances virtual CPUs may not be scheduled by a hypervisor for a
very long time.

Today we have an upstream feature called "Hiperdispatch", which
determines that this is about to happen and uses Capacity Aware
Scheduling to prevent processes from being placed on the affected CPUs.
However, at least when used for this purpose, Capacity Aware Scheduling
is best effort and fails to move tasks away from the affected CPUs
under high load.

Therefore I have decided to smoke test this series.

For the purposes of smoke testing, I set up a number of KVM virtual
machines and start the same benchmark inside each one. Then I collect
and compare the aggregate throughput numbers. I have not done testing
with PR/SM yet, but I plan to do this and report back. I also have not
tested this with VMs that are not 100% utilized yet.

Benchmark parameters:

$ sysbench cpu run --threads=3D$(nproc) --time=3D10
$ schbench -r 10 --json --no-locking=20
$ hackbench --groups 10 --process --loops 5000
$ pgbench -h $WORKDIR --client=3D$(nproc) --time=3D10

Figures:

s390x (16 host CPUs):

Benchmark      #VMs    #CPUs/VM  =CE=94RPS (%)
-----------  ------  ----------  ----------
hackbench        16           4  60.58%
pgbench          16           4  50.01%
hackbench         8           8  46.18%
hackbench         4           8  43.54%
hackbench         2          16  43.23%
hackbench        12           4  42.92%
hackbench         8           4  35.53%
hackbench         4          16  30.98%
pgbench          12           4  18.41%
hackbench         2          24  7.32%
pgbench           8           4  6.84%
pgbench           2          24  3.38%
pgbench           2          16  3.02%
pgbench           4          16  2.08%
hackbench         2          32  1.46%
pgbench           4           8  1.30%
schbench          2          16  0.72%
schbench          4           8  -0.09%
schbench          4           4  -0.20%
schbench          8           8  -0.41%
sysbench          8           4  -0.46%
sysbench          4           8  -0.53%
schbench          8           4  -0.65%
sysbench          2          16  -0.76%
schbench          2           8  -0.77%
sysbench          8           8  -1.72%
schbench          2          24  -1.98%
schbench         12           4  -2.03%
sysbench         12           4  -2.13%
pgbench           2          32  -3.15%
sysbench         16           4  -3.17%
schbench         16           4  -3.50%
sysbench          2           8  -4.01%
pgbench           8           8  -4.10%
schbench          4          16  -5.93%
sysbench          4           4  -5.94%
pgbench           2           4  -6.40%
hackbench         2           8  -10.04%
hackbench         4           4  -10.91%
pgbench           4           4  -11.05%
sysbench          2          24  -13.07%
sysbench          4          16  -13.59%
hackbench         2           4  -13.96%
pgbench           2           8  -16.16%
schbench          2           4  -24.14%
schbench          2          32  -24.25%
sysbench          2           4  -24.98%
sysbench          2          32  -32.84%

x86_64 (32 host CPUs):

Benchmark      #VMs    #CPUs/VM  =CE=94RPS (%)
-----------  ------  ----------  ----------
hackbench         4          32  87.02%
hackbench         8          16  48.45%
hackbench         4          24  47.95%
hackbench         2           8  42.74%
hackbench         2          32  34.90%
pgbench          16           8  27.87%
pgbench          12           8  25.17%
hackbench         8           8  24.92%
hackbench        16           8  22.41%
hackbench        16           4  20.83%
pgbench           8          16  20.40%
hackbench        12           8  20.37%
hackbench         4          16  20.36%
pgbench          16           4  16.60%
pgbench           8           8  14.92%
hackbench        12           4  14.49%
pgbench           4          32  9.49%
pgbench           2          32  7.26%
hackbench         2          24  6.54%
pgbench           4           4  4.67%
pgbench           8           4  3.24%
pgbench          12           4  2.66%
hackbench         4           8  2.53%
pgbench           4           8  1.96%
hackbench         2          16  1.93%
schbench          4          32  1.24%
pgbench           2           8  0.82%
schbench          4           4  0.69%
schbench          2          32  0.44%
schbench          2          16  0.25%
schbench         12           8  -0.02%
sysbench          2           4  -0.02%
schbench          4          24  -0.12%
sysbench          2          16  -0.17%
schbench         12           4  -0.18%
schbench          2           4  -0.19%
sysbench          4           8  -0.23%
schbench          8           4  -0.24%
sysbench          2           8  -0.24%
schbench          4           8  -0.28%
sysbench          8           4  -0.30%
schbench          4          16  -0.37%
schbench          2          24  -0.39%
schbench          8          16  -0.49%
schbench          2           8  -0.67%
pgbench           4          16  -0.68%
schbench          8           8  -0.83%
sysbench          4           4  -0.92%
schbench         16           4  -0.94%
sysbench         12           4  -0.98%
sysbench          8          16  -1.52%
sysbench         16           4  -1.57%
pgbench           2           4  -1.62%
sysbench         12           8  -1.69%
schbench         16           8  -1.97%
sysbench          8           8  -2.08%
hackbench         8           4  -2.11%
pgbench           4          24  -3.20%
pgbench           2          24  -3.35%
sysbench          2          24  -3.81%
pgbench           2          16  -4.55%
sysbench          4          16  -5.10%
sysbench         16           8  -6.56%
sysbench          2          32  -8.24%
sysbench          4          32  -13.54%
sysbench          4          24  -13.62%
hackbench         2           4  -15.40%
hackbench         4           4  -17.71%

There are some huge wins, especially for hackbench, which corresponds
to Shrikanth's findings. There are some significant degradations too,
which I plan to debug. This may simply have to do with the simplistic
heuristic I am using for testing [1].

sysbench, for example, is not supposed to benefit from this series,
because it is not affected by overcommit. However, it definitely should
not degrade by 30%. Interestingly enough, this happens only with
certain combinations of VM and CPU counts, and this is reproducible.

Initially I have seen degradations as bad as -80% with schbench. It
turned out this was caused by userspace per-CPU locking it implements;
turning it off caused the degradation to go away. To me this looks like
something synthetic and not something used by real-world application,
but please correct me if I am wrong - then this will have to be
resolved.


One note regarding the PARAVIRT Kconfig gating: s390x does not
select PARAVIRT	today. For example, steal time we determine based on
CPU timers and clocks, and not hypervisor hints. For now I had to add
dummy paravirt headers to test this series. But I would appreciate if
Kconfig gating was removed.

Others have already commented on the naming, and I would agree that
"paravirt" is really misleading. I cannot say that the previous "cpu-
avoid" one was perfect, but it was much better.


[1] https://github.com/iii-i/linux/commits/iii/poc/cpu-avoid/v3/


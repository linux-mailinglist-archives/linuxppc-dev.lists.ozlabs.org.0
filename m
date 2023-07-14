Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E8339753D4E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jul 2023 16:28:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HeSCuPPF;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2Yjd6DFVz3cBd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 00:28:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HeSCuPPF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2Yhj1HL7z2ygr
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 00:27:16 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EEL3DA031786;
	Fri, 14 Jul 2023 14:25:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=RaYm3+iL2nRghkV2cl2HfIFU9xG0uue+t8rOf4tDuVE=;
 b=HeSCuPPFwIWrH+993IvTtMuMziGA0FY3styoQdJklfhKV0Nqcs8mHSNKsyLdWDckgvzq
 0z44+Sx91mHSUNkkSwrenTPdvX4f//mC0Nye0MMce2+ZqxlYnFOTmHBG2AoLVQ+p0JGE
 YqtcpmAyDS9hV0MABQwj6HZbk6I+W6a4b9bwwvJEc+Dz2JVR12lz/W5WdlQmpmbpLqPA
 wOrCP2yxcMnk/0fnUtQFbN6UVbNteA6I4Z8Q74RqKzq7UNIioin5RT9NKhWBdvv5vFD/
 SC7XHDWaEbSrMWZi5SNJ8WoUQGSLmj72aHNZbZdpuo7AE0+W7OASAPXvRgwBTeISFmzM Cg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru82082a9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 14:25:23 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36EEMJhG002383;
	Fri, 14 Jul 2023 14:25:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru820829k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 14:25:23 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36EDKsSo007376;
	Fri, 14 Jul 2023 14:25:22 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rtpvs1vxy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 14:25:22 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36EEPKSk57934270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Jul 2023 14:25:20 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9651358063;
	Fri, 14 Jul 2023 14:25:20 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AB9A58056;
	Fri, 14 Jul 2023 14:25:12 +0000 (GMT)
Received: from [9.171.88.96] (unknown [9.171.88.96])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Jul 2023 14:25:12 +0000 (GMT)
Message-ID: <6006810f-6419-bc39-7eff-1bd31a572631@linux.vnet.ibm.com>
Date: Fri, 14 Jul 2023 19:55:10 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [RFC][PATCH] sched: Rename DIE domain
Content-Language: en-US
To: Peter Zijlstra <peterz@infradead.org>
References: <20230712141056.GI3100107@hirez.programming.kicks-ass.net>
 <xhsmh1qhduq9d.mognet@vschneid.remote.csb>
From: Shrikanth Hegde <sshegde@linux.vnet.ibm.com>
In-Reply-To: <xhsmh1qhduq9d.mognet@vschneid.remote.csb>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: BKnNwJuVQ5CqwoS76-lOVcxFsFRUxIUy
X-Proofpoint-GUID: JY7YoTQ-OZAhgvru9YZBX9Ytl2G47lgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_06,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1011 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140128
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
Cc: juri.lelli@redhat.com, dave.hansen@linux.intel.com, bsegall@google.com, hpa@zytor.com, agordeev@linux.ibm.com, linux-s390@vger.kernel.org, Valentin Schneider <vschneid@redhat.com>, vincent.guittot@linaro.org, x86@kernel.org, mingo@redhat.com, mgorman@suse.de, borntraeger@linux.ibm.com, gor@linux.ibm.com, hca@linux.ibm.com, npiggin@gmail.com, bp@alien8.de, rostedt@goodmis.org, Thomas Gleixner <tglx@linutronix.de>, dietmar.eggemann@arm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, svens@linux.ibm.com, bristot@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/12/23 8:32 PM, Valentin Schneider wrote:
> On 12/07/23 16:10, Peter Zijlstra wrote:
>> Hi
>>
>> Thomas just tripped over the x86 topology setup creating a 'DIE' domain
>> for the package mask :-)
>>
>> Since these names are SCHED_DEBUG only, rename them.
>> I don't think anybody *should* be relying on this, but who knows.
>>
> 
> FWIW I don't care much about the actual name.
> 
> There are some stray references to DIE in comments - see below. Bit funny
> to see:
> - *  - Package (DIE)
> + *  - Package (PKG)
> 
> With that:
> Acked-by: Valentin Schneider <vschneid@redhat.com>
> 
> ---
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index a80a73909dc2a..190a647534984 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -9439,7 +9439,7 @@ static bool sched_use_asym_prio(struct sched_domain *sd, int cpu)
>   * can only do it if @group is an SMT group and has exactly on busy CPU. Larger
>   * imbalances in the number of CPUS are dealt with in find_busiest_group().
>   *
> - * If we are balancing load within an SMT core, or at DIE domain level, always
> + * If we are balancing load within an SMT core, or at PKG domain level, always
>   * proceed.
>   *
>   * Return: true if @env::dst_cpu can do with asym_packing load balance. False
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index e9d9cf776b7ab..2cdcfec1d1c89 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -1118,7 +1118,7 @@ build_overlap_sched_groups(struct sched_domain *sd, int cpu)
>   *
>   *  - Simultaneous multithreading (SMT)
>   *  - Multi-Core Cache (MC)
> - *  - Package (DIE)
> + *  - Package (PKG)
>   *
>   * Where the last one more or less denotes everything up to a NUMA node.
>   *
> @@ -1140,13 +1140,13 @@ build_overlap_sched_groups(struct sched_domain *sd, int cpu)
>   *
>   * CPU   0   1   2   3   4   5   6   7
>   *
> - * DIE  [                             ]
> + * PKG  [                             ]
>   * MC   [             ] [             ]
>   * SMT  [     ] [     ] [     ] [     ]
>   *
>   *  - or -
>   *
> - * DIE  0-7 0-7 0-7 0-7 0-7 0-7 0-7 0-7
> + * PKG  0-7 0-7 0-7 0-7 0-7 0-7 0-7 0-7
>   * MC	0-3 0-3 0-3 0-3 4-7 4-7 4-7 4-7
>   * SMT  0-1 0-1 2-3 2-3 4-5 4-5 6-7 6-7
>   *
> 

A couple of comments missing the change still? Not sure if it taken care already.

---
 arch/powerpc/kernel/smp.c | 2 +-
 arch/x86/kernel/smpboot.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
index fbbb695bae3d..9b1853bf6b1d 100644
--- a/arch/powerpc/kernel/smp.c
+++ b/arch/powerpc/kernel/smp.c
@@ -1588,7 +1588,7 @@ static void add_cpu_to_masks(int cpu)
 	/* Skip all CPUs already part of current CPU core mask */
 	cpumask_andnot(mask, cpu_online_mask, cpu_core_mask(cpu));
 
-	/* If chip_id is -1; limit the cpu_core_mask to within DIE*/
+	/* If chip_id is -1; limit the cpu_core_mask to within PKG*/
 	if (chip_id == -1)
 		cpumask_and(mask, mask, cpu_cpu_mask(cpu));
 
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index e1aa2cd7734b..3f175e70eb7a 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -647,7 +647,7 @@ static void __init build_sched_topology(void)
 	};
 #endif
 	/*
-	 * When there is NUMA topology inside the package skip the DIE domain
+	 * When there is NUMA topology inside the package skip the PKG domain
 	 * since the NUMA domains will auto-magically create the right spanning
 	 * domains based on the SLIT.
 	 */

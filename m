Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F36888EE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 06:30:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UsEneNbS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V31k31GKpz3vb5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 16:30:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UsEneNbS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam.menghani@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V31hM0FNtz3dXT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Mar 2024 16:29:22 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42P2TKcD002120;
	Mon, 25 Mar 2024 05:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=+W54qSxNSJQWRx6PWgXJJfpx8+VW27a8pwZmgaNlRHg=;
 b=UsEneNbSd039lJDPga9B20LdGeQhJZizXHIGGnzDN7eTbayuUwmgvgEvSxhLZgIR4/v1
 quBEDu0guetYDKW94P7VD0Cs4yu9UEK0v5XpCm5+hVr1vEIn9wor995iSIdl3N6hbqAM
 VmsUAQ/ZcBceaOywa/b2hbWkFT0+yBiyAmKPiDJxbTRCQCGF5+llcS3UrBZTziu0HU9N
 JhNfnI/5NP+IU2Jj6TOp136sJURgrhnR3/byMUuY6A60sMyz94Z+j2l52zkLS4Q06fuk
 LybVhRvrPPtza61oA31I/aH7ufmJdRedViDjdRHs8x2EyM6ge0b8zITCH8fWmVyRsTTY Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x1x53bhuf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:29:13 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42P5PrcF007257;
	Mon, 25 Mar 2024 05:29:13 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x1x53bhuc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:29:13 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42P4e7ji012990;
	Mon, 25 Mar 2024 05:29:11 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x29t076qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Mar 2024 05:29:11 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42P5T6iS28836400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Mar 2024 05:29:08 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15E2820043;
	Mon, 25 Mar 2024 05:29:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 228CB20040;
	Mon, 25 Mar 2024 05:29:04 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 25 Mar 2024 05:29:03 +0000 (GMT)
Date: Mon, 25 Mar 2024 10:59:01 +0530
From: Gautam Menghani <Gautam.Menghani@linux.ibm.com>
To: Gautam Menghani <gautam@linux.ibm.com>
Subject: Re: [PATCH v3] arch/powerpc/kvm: Add support for reading VPA
 counters for pseries guests
Message-ID: <7cfwgtfka55t4ovlbrzzqc2hamwaeoiddzo2e4wabwxy3tzc53@adwgw2asl6a5>
References: <20240322101135.33295-1-gautam@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322101135.33295-1-gautam@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M7nJETb3ZJKBA-1FXGDYvVntb19-h1mC
X-Proofpoint-ORIG-GUID: rJte0QdugKEtcpP_KJfjEtHHsJvS9GfM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-25_02,2024-03-21_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxscore=0
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1011 impostorscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403250029
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, aneesh.kumar@kernel.org, npiggin@gmail.com, naveen.n.rao@linux.ibm.com, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 22, 2024 at 03:41:32PM +0530, Gautam Menghani wrote:
> PAPR hypervisor has introduced three new counters in the VPA area of
> LPAR CPUs for KVM L2 guest (see [1] for terminology) observability - 2
> for context switches from host to guest and vice versa, and 1 counter
> for getting the total time spent inside the KVM guest. Add a tracepoint
> that enables reading the counters for use by ftrace/perf. Note that this
> tracepoint is only available for nestedv2 API (i.e, KVM on PowerVM).
> 
> Also maintain an aggregation of the context switch times in vcpu->arch.
> This will be useful in getting the aggregate times with a pmu driver
> which will be upstreamed in the near future.
> 
> [1] Terminology:
> a. L1 refers to the VM (LPAR) booted on top of PAPR hypervisor
> b. L2 refers to the KVM guest booted on top of L1.
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
> v1 -> v2:
> 1. Fix the build error due to invalid struct member reference.
> 
> v2 -> v3:
> 1. Move the counter disabling and zeroing code to a different function.
> 2. Move the get_lppaca() inside the tracepoint_enabled() branch.
> 3. Add the aggregation logic to maintain total context switch time.
> 
>  arch/powerpc/include/asm/kvm_host.h |  5 +++++
>  arch/powerpc/include/asm/lppaca.h   | 11 +++++++---
>  arch/powerpc/kvm/book3s_hv.c        | 33 +++++++++++++++++++++++++++++
>  arch/powerpc/kvm/trace_hv.h         | 25 ++++++++++++++++++++++
>  4 files changed, 71 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 8abac5321..d953b32dd 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -847,6 +847,11 @@ struct kvm_vcpu_arch {
>  	gpa_t nested_io_gpr;
>  	/* For nested APIv2 guests*/
>  	struct kvmhv_nestedv2_io nestedv2_io;
> +
> +	/* Aggregate context switch and guest run time info (in ns) */
> +	u64 l1_to_l2_cs_agg;
> +	u64 l2_to_l1_cs_agg;
> +	u64 l2_runtime_agg;
>  #endif
>  
>  #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
> diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
> index 61ec2447d..bda6b86b9 100644
> --- a/arch/powerpc/include/asm/lppaca.h
> +++ b/arch/powerpc/include/asm/lppaca.h
> @@ -62,7 +62,8 @@ struct lppaca {
>  	u8	donate_dedicated_cpu;	/* Donate dedicated CPU cycles */
>  	u8	fpregs_in_use;
>  	u8	pmcregs_in_use;
> -	u8	reserved8[28];
> +	u8	l2_accumul_cntrs_enable;  /* Enable usage of counters for KVM guest */
> +	u8	reserved8[27];
>  	__be64	wait_state_cycles;	/* Wait cycles for this proc */
>  	u8	reserved9[28];
>  	__be16	slb_count;		/* # of SLBs to maintain */
> @@ -92,9 +93,13 @@ struct lppaca {
>  	/* cacheline 4-5 */
>  
>  	__be32	page_ins;		/* CMO Hint - # page ins by OS */
> -	u8	reserved12[148];
> +	u8	reserved12[28];
> +	volatile __be64 l1_to_l2_cs_tb;
> +	volatile __be64 l2_to_l1_cs_tb;
> +	volatile __be64 l2_runtime_tb;
> +	u8 reserved13[96];
>  	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
> -	u8	reserved13[96];
> +	u8	reserved14[96];
>  } ____cacheline_aligned;
>  
>  #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8e86eb577..5a0bcb57e 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4108,6 +4108,30 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
>  	}
>  }
>  
> +static void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
> +{
> +	struct lppaca *lp = get_lppaca();
> +	u64 l1_to_l2_ns, l2_to_l1_ns, l2_runtime_ns;
> +
> +	if (!lp->l2_accumul_cntrs_enable)
> +		return;
> +
> +	l1_to_l2_ns = tb_to_ns(be64_to_cpu(lp->l1_to_l2_cs_tb));
> +	l2_to_l1_ns = tb_to_ns(be64_to_cpu(lp->l2_to_l1_cs_tb));
> +	l2_runtime_ns = tb_to_ns(be64_to_cpu(lp->l2_runtime_tb));
> +	trace_kvmppc_vcpu_exit_cs_time(vcpu, l1_to_l2_ns, l2_to_l1_ns,
> +			l2_runtime_ns);
> +	lp->l1_to_l2_cs_tb = 0;
> +	lp->l2_to_l1_cs_tb = 0;
> +	lp->l2_runtime_tb = 0;
> +	lp->l2_accumul_cntrs_enable = 0;
> +
> +	// Maintain an aggregate of context switch times
> +	vcpu->arch.l1_to_l2_cs_agg += l1_to_l2_ns;
> +	vcpu->arch.l2_to_l1_cs_agg += l2_to_l1_ns;
> +	vcpu->arch.l2_runtime_agg += l2_runtime_ns;
> +}
> +
>  static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>  				     unsigned long lpcr, u64 *tb)
>  {
> @@ -4130,6 +4154,11 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>  	kvmppc_gse_put_u64(io->vcpu_run_input, KVMPPC_GSID_LPCR, lpcr);
>  
>  	accumulate_time(vcpu, &vcpu->arch.in_guest);
> +
> +	/* Enable the guest host context switch time tracking */
> +	if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled()))
> +		get_lppaca()->l2_accumul_cntrs_enable = 1;
> +
>  	rc = plpar_guest_run_vcpu(0, vcpu->kvm->arch.lpid, vcpu->vcpu_id,
>  				  &trap, &i);
>  
> @@ -4156,6 +4185,10 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>  
>  	timer_rearm_host_dec(*tb);
>  
> +	/* Record context switch and guest_run_time data */
> +	if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled()))
> +		do_trace_nested_cs_time(vcpu);
> +

There is an issue with this part - when we enable the
tracepoint, run the vcpu, but disable the tracepoint before vcpu exit,
this condition will not be hit and we will continue accumulating the
context switch times in the VPA. I'll send a v4 where I check for the
VPA flag. I'll also incorporate any other changes, if required.

Thanks,
Gautam

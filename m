Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0470F88F0A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:10:59 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oK7us3XK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4fTr5YCZz3vZl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:10:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oK7us3XK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4RmF3bqpz3vfW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 00:07:41 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42RCvb94012838;
	Wed, 27 Mar 2024 13:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=HJbXq1JfXEi1rMHmtFjJFZuzMrTkOEIZ91ZddXivaFo=;
 b=oK7us3XKJbCNTJuQUNwzOVfrxaQOCJDpi4TOyLi+ONbZrKw0OFfSDrcM/yXdbSldORtN
 1aTocjwsFNaEp8gUQNP1mp65oZdAAyCVrtUBjcRUyUIiD/7lqutlGJKAbGSyeFN1OgYw
 xwnaSOkZ0TpkyLbD8syGqhsKu4+4np8oHQng9o3xAEuMssYUCcJtbqeRRsZtqViHdJBW
 0sCBgSnbGQlIzlY3UiGJcsQp39i0uvphZvhVqORoPLXoVSKy8xDQP40Tc5Kg/YmhlVVJ
 x3YqjCtPhmmDww9zoFWLP/6yz6SXf71yGnojpgeKBUiUTJstoZf2PH9ZiVMnzDWw/NRE qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x4kwpg0tv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 13:07:18 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 42RD7Ib4030325;
	Wed, 27 Mar 2024 13:07:18 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x4kwpg0tt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 13:07:18 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42RCk9Lu013343;
	Wed, 27 Mar 2024 13:07:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3x29t0pww7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 27 Mar 2024 13:07:16 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42RD7BH26947116
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 27 Mar 2024 13:07:13 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E410C20043;
	Wed, 27 Mar 2024 13:07:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3502720040;
	Wed, 27 Mar 2024 13:07:07 +0000 (GMT)
Received: from [9.171.20.231] (unknown [9.171.20.231])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 27 Mar 2024 13:07:06 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------h9nzZo2uv0YmqUz3TuIoz8BA"
Message-ID: <3fde44fe-c51a-43ed-847d-d30948504097@linux.ibm.com>
Date: Wed, 27 Mar 2024 18:37:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] arch/powerpc/kvm: Add support for reading VPA counters
 for pseries guests
To: Gautam Menghani <gautam@linux.ibm.com>, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        aneesh.kumar@kernel.org, naveen.n.rao@linux.ibm.com
References: <20240326094035.115835-1-gautam@linux.ibm.com>
Content-Language: en-US
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <20240326094035.115835-1-gautam@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 591AeM7fiW0ZiQtYno-WAOXW3G72ttX3
X-Proofpoint-GUID: YQiLV80SXsJRJIGe869_ryDYiInxRjol
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-27_08,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 bulkscore=0
 mlxlogscore=999 adultscore=0 lowpriorityscore=0 phishscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403270089
X-Mailman-Approved-At: Thu, 28 Mar 2024 08:10:21 +1100
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
Cc: Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------h9nzZo2uv0YmqUz3TuIoz8BA
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/26/24 3:10 PM, Gautam Menghani wrote:
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
> Signed-off-by: Vaibhav Jain<vaibhav@linux.ibm.com>
> Signed-off-by: Gautam Menghani<gautam@linux.ibm.com>
> ---
> v1 -> v2:
> 1. Fix the build error due to invalid struct member reference.
>
> v2 -> v3:
> 1. Move the counter disabling and zeroing code to a different function.
> 2. Move the get_lppaca() inside the tracepoint_enabled() branch.
> 3. Add the aggregation logic to maintain total context switch time.
>
> v3 -> v4:
> 1. After vcpu_run, check the VPA flag instead of checking for tracepoint
> being enabled for disabling the cs time accumulation.
>
>   arch/powerpc/include/asm/kvm_host.h |  5 +++++
>   arch/powerpc/include/asm/lppaca.h   | 11 ++++++++---
>   arch/powerpc/kvm/book3s_hv.c        | 30 +++++++++++++++++++++++++++++
>   arch/powerpc/kvm/trace_hv.h         | 25 ++++++++++++++++++++++++
>   4 files changed, 68 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 8abac5321..d953b32dd 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -847,6 +847,11 @@ struct kvm_vcpu_arch {
>   	gpa_t nested_io_gpr;
>   	/* For nested APIv2 guests*/
>   	struct kvmhv_nestedv2_io nestedv2_io;
> +
> +	/* Aggregate context switch and guest run time info (in ns) */
> +	u64 l1_to_l2_cs_agg;
> +	u64 l2_to_l1_cs_agg;
> +	u64 l2_runtime_agg;
>   #endif
>   
>   #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
> diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
> index 61ec2447d..bda6b86b9 100644
> --- a/arch/powerpc/include/asm/lppaca.h
> +++ b/arch/powerpc/include/asm/lppaca.h
> @@ -62,7 +62,8 @@ struct lppaca {
>   	u8	donate_dedicated_cpu;	/* Donate dedicated CPU cycles */
>   	u8	fpregs_in_use;
>   	u8	pmcregs_in_use;
> -	u8	reserved8[28];
> +	u8	l2_accumul_cntrs_enable;  /* Enable usage of counters for KVM guest */
> +	u8	reserved8[27];
>   	__be64	wait_state_cycles;	/* Wait cycles for this proc */
>   	u8	reserved9[28];
>   	__be16	slb_count;		/* # of SLBs to maintain */
> @@ -92,9 +93,13 @@ struct lppaca {
>   	/* cacheline 4-5 */
>   
>   	__be32	page_ins;		/* CMO Hint - # page ins by OS */
> -	u8	reserved12[148];
> +	u8	reserved12[28];
> +	volatile __be64 l1_to_l2_cs_tb;
> +	volatile __be64 l2_to_l1_cs_tb;
> +	volatile __be64 l2_runtime_tb;
> +	u8 reserved13[96];
>   	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
> -	u8	reserved13[96];
> +	u8	reserved14[96];
>   } ____cacheline_aligned;
>   
>   #define lppaca_of(cpu)	(*paca_ptrs[cpu]->lppaca_ptr)
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8e86eb577..dcd6edd3b 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4108,6 +4108,27 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
>   	}
>   }
>   
> +static void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
> +{
> +	struct lppaca *lp = get_lppaca();
> +	u64 l1_to_l2_ns, l2_to_l1_ns, l2_runtime_ns;
> +
> +	l1_to_l2_ns = tb_to_ns(be64_to_cpu(lp->l1_to_l2_cs_tb));
> +	l2_to_l1_ns = tb_to_ns(be64_to_cpu(lp->l2_to_l1_cs_tb));
> +	l2_runtime_ns = tb_to_ns(be64_to_cpu(lp->l2_runtime_tb));
> +	trace_kvmppc_vcpu_exit_cs_time(vcpu, l1_to_l2_ns, l2_to_l1_ns,
> +					l2_runtime_ns);
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
>   static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>   				     unsigned long lpcr, u64 *tb)
>   {
> @@ -4130,6 +4151,11 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>   	kvmppc_gse_put_u64(io->vcpu_run_input, KVMPPC_GSID_LPCR, lpcr);
>   
>   	accumulate_time(vcpu, &vcpu->arch.in_guest);
> +
> +	/* Enable the guest host context switch time tracking */
> +	if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled()))
> +		get_lppaca()->l2_accumul_cntrs_enable = 1;

can we wrap "get_lppaca()->l2_accumul_cntrs_enable" under wrapper function
like is_l2_accumul_cntrs_enable(), set_l2_accumul_cntrs_enable() and
unset_l2_accumul_cntrs_enable()?

set/unset does not need a parameter and in future incase if we want to
check and set or check and unset, we could have additional code in there.

Maddy

> +
>   	rc = plpar_guest_run_vcpu(0, vcpu->kvm->arch.lpid, vcpu->vcpu_id,
>   				  &trap, &i);
>   
> @@ -4156,6 +4182,10 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
>   
>   	timer_rearm_host_dec(*tb);
>   
> +	/* Record context switch and guest_run_time data */
> +	if (get_lppaca()->l2_accumul_cntrs_enable)
> +		do_trace_nested_cs_time(vcpu);
> +
>   	return trap;
>   }
>   
> diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
> index 8d57c8428..ab19977c9 100644
> --- a/arch/powerpc/kvm/trace_hv.h
> +++ b/arch/powerpc/kvm/trace_hv.h
> @@ -491,6 +491,31 @@ TRACE_EVENT(kvmppc_run_vcpu_enter,
>   	TP_printk("VCPU %d: tgid=%d", __entry->vcpu_id, __entry->tgid)
>   );
>   
> +TRACE_EVENT(kvmppc_vcpu_exit_cs_time,
> +	TP_PROTO(struct kvm_vcpu *vcpu, u64 l1_to_l2_cs, u64 l2_to_l1_cs,
> +		u64 l2_runtime),
> +
> +	TP_ARGS(vcpu, l1_to_l2_cs, l2_to_l1_cs, l2_runtime),
> +
> +	TP_STRUCT__entry(
> +		__field(int,		vcpu_id)
> +		__field(__u64,		l1_to_l2_cs_ns)
> +		__field(__u64,		l2_to_l1_cs_ns)
> +		__field(__u64,		l2_runtime_ns)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->vcpu_id  = vcpu->vcpu_id;
> +		__entry->l1_to_l2_cs_ns = l1_to_l2_cs;
> +		__entry->l2_to_l1_cs_ns = l2_to_l1_cs;
> +		__entry->l2_runtime_ns = l2_runtime;
> +	),
> +
> +	TP_printk("VCPU %d: l1_to_l2_cs_time=%llu-ns l2_to_l1_cs_time=%llu-ns l2_runtime=%llu-ns",
> +		__entry->vcpu_id,  __entry->l1_to_l2_cs_ns,
> +		__entry->l2_to_l1_cs_ns, __entry->l2_runtime_ns)
> +);
> +
>   TRACE_EVENT(kvmppc_run_vcpu_exit,
>   	TP_PROTO(struct kvm_vcpu *vcpu),
>   
--------------h9nzZo2uv0YmqUz3TuIoz8BA
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 3/26/24 3:10 PM, Gautam Menghani
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20240326094035.115835-1-gautam@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">PAPR hypervisor has introduced three new counters in the VPA area of
LPAR CPUs for KVM L2 guest (see [1] for terminology) observability - 2
for context switches from host to guest and vice versa, and 1 counter
for getting the total time spent inside the KVM guest. Add a tracepoint
that enables reading the counters for use by ftrace/perf. Note that this
tracepoint is only available for nestedv2 API (i.e, KVM on PowerVM).

Also maintain an aggregation of the context switch times in vcpu-&gt;arch.
This will be useful in getting the aggregate times with a pmu driver
which will be upstreamed in the near future.

[1] Terminology:
a. L1 refers to the VM (LPAR) booted on top of PAPR hypervisor
b. L2 refers to the KVM guest booted on top of L1.

Signed-off-by: Vaibhav Jain <a class="moz-txt-link-rfc2396E" href="mailto:vaibhav@linux.ibm.com">&lt;vaibhav@linux.ibm.com&gt;</a>
Signed-off-by: Gautam Menghani <a class="moz-txt-link-rfc2396E" href="mailto:gautam@linux.ibm.com">&lt;gautam@linux.ibm.com&gt;</a>
---
v1 -&gt; v2:
1. Fix the build error due to invalid struct member reference.

v2 -&gt; v3:
1. Move the counter disabling and zeroing code to a different function.
2. Move the get_lppaca() inside the tracepoint_enabled() branch.
3. Add the aggregation logic to maintain total context switch time.

v3 -&gt; v4:
1. After vcpu_run, check the VPA flag instead of checking for tracepoint
being enabled for disabling the cs time accumulation.

 arch/powerpc/include/asm/kvm_host.h |  5 +++++
 arch/powerpc/include/asm/lppaca.h   | 11 ++++++++---
 arch/powerpc/kvm/book3s_hv.c        | 30 +++++++++++++++++++++++++++++
 arch/powerpc/kvm/trace_hv.h         | 25 ++++++++++++++++++++++++
 4 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 8abac5321..d953b32dd 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -847,6 +847,11 @@ struct kvm_vcpu_arch {
 	gpa_t nested_io_gpr;
 	/* For nested APIv2 guests*/
 	struct kvmhv_nestedv2_io nestedv2_io;
+
+	/* Aggregate context switch and guest run time info (in ns) */
+	u64 l1_to_l2_cs_agg;
+	u64 l2_to_l1_cs_agg;
+	u64 l2_runtime_agg;
 #endif
 
 #ifdef CONFIG_KVM_BOOK3S_HV_EXIT_TIMING
diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
index 61ec2447d..bda6b86b9 100644
--- a/arch/powerpc/include/asm/lppaca.h
+++ b/arch/powerpc/include/asm/lppaca.h
@@ -62,7 +62,8 @@ struct lppaca {
 	u8	donate_dedicated_cpu;	/* Donate dedicated CPU cycles */
 	u8	fpregs_in_use;
 	u8	pmcregs_in_use;
-	u8	reserved8[28];
+	u8	l2_accumul_cntrs_enable;  /* Enable usage of counters for KVM guest */
+	u8	reserved8[27];
 	__be64	wait_state_cycles;	/* Wait cycles for this proc */
 	u8	reserved9[28];
 	__be16	slb_count;		/* # of SLBs to maintain */
@@ -92,9 +93,13 @@ struct lppaca {
 	/* cacheline 4-5 */
 
 	__be32	page_ins;		/* CMO Hint - # page ins by OS */
-	u8	reserved12[148];
+	u8	reserved12[28];
+	volatile __be64 l1_to_l2_cs_tb;
+	volatile __be64 l2_to_l1_cs_tb;
+	volatile __be64 l2_runtime_tb;
+	u8 reserved13[96];
 	volatile __be64 dtl_idx;	/* Dispatch Trace Log head index */
-	u8	reserved13[96];
+	u8	reserved14[96];
 } ____cacheline_aligned;
 
 #define lppaca_of(cpu)	(*paca_ptrs[cpu]-&gt;lppaca_ptr)
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 8e86eb577..dcd6edd3b 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4108,6 +4108,27 @@ static void vcpu_vpa_increment_dispatch(struct kvm_vcpu *vcpu)
 	}
 }
 
+static void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
+{
+	struct lppaca *lp = get_lppaca();
+	u64 l1_to_l2_ns, l2_to_l1_ns, l2_runtime_ns;
+
+	l1_to_l2_ns = tb_to_ns(be64_to_cpu(lp-&gt;l1_to_l2_cs_tb));
+	l2_to_l1_ns = tb_to_ns(be64_to_cpu(lp-&gt;l2_to_l1_cs_tb));
+	l2_runtime_ns = tb_to_ns(be64_to_cpu(lp-&gt;l2_runtime_tb));
+	trace_kvmppc_vcpu_exit_cs_time(vcpu, l1_to_l2_ns, l2_to_l1_ns,
+					l2_runtime_ns);
+	lp-&gt;l1_to_l2_cs_tb = 0;
+	lp-&gt;l2_to_l1_cs_tb = 0;
+	lp-&gt;l2_runtime_tb = 0;
+	lp-&gt;l2_accumul_cntrs_enable = 0;
+
+	// Maintain an aggregate of context switch times
+	vcpu-&gt;arch.l1_to_l2_cs_agg += l1_to_l2_ns;
+	vcpu-&gt;arch.l2_to_l1_cs_agg += l2_to_l1_ns;
+	vcpu-&gt;arch.l2_runtime_agg += l2_runtime_ns;
+}
+
 static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
 				     unsigned long lpcr, u64 *tb)
 {
@@ -4130,6 +4151,11 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
 	kvmppc_gse_put_u64(io-&gt;vcpu_run_input, KVMPPC_GSID_LPCR, lpcr);
 
 	accumulate_time(vcpu, &amp;vcpu-&gt;arch.in_guest);
+
+	/* Enable the guest host context switch time tracking */
+	if (unlikely(trace_kvmppc_vcpu_exit_cs_time_enabled()))
+		get_lppaca()-&gt;l2_accumul_cntrs_enable = 1;</pre>
    </blockquote>
    <br>
    <font face="monospace">can we wrap "<span
      style="white-space: pre-wrap">get_lppaca()-&gt;l2_accumul_cntrs_enable" under wrapper function</span>
    </font><br>
    <font face="monospace">like is_<span style="white-space: pre-wrap">l2_accumul_cntrs_enable(),  set_</span><span
      style="white-space: pre-wrap">l2_accumul_cntrs_enable()  and </span></font><br>
    <font face="monospace"><span style="white-space: pre-wrap">unset_</span><span
      style="white-space: pre-wrap">l2_accumul_cntrs_enable()?</span></font><br>
    <br>
    <font face="monospace"><span style="white-space: pre-wrap">set/unset does not need a parameter and </span><span
      style="white-space: pre-wrap">in future incase if we want to</span><br>
      <span style="white-space: pre-wrap">check and set or check and unset, we could have additional code in there.</span></font>
    <p><span style="white-space: pre-wrap"><font face="monospace">Maddy</font></span></p>
    <p><span style="white-space: pre-wrap"></span></p>
    <p><span style="white-space: pre-wrap"></span></p>
    <p><span style="white-space: pre-wrap">
</span></p>
    <blockquote type="cite"
      cite="mid:20240326094035.115835-1-gautam@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">
+
 	rc = plpar_guest_run_vcpu(0, vcpu-&gt;kvm-&gt;arch.lpid, vcpu-&gt;vcpu_id,
 				  &amp;trap, &amp;i);
 
@@ -4156,6 +4182,10 @@ static int kvmhv_vcpu_entry_nestedv2(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	timer_rearm_host_dec(*tb);
 
+	/* Record context switch and guest_run_time data */
+	if (get_lppaca()-&gt;l2_accumul_cntrs_enable)
+		do_trace_nested_cs_time(vcpu);
+
 	return trap;
 }
 
diff --git a/arch/powerpc/kvm/trace_hv.h b/arch/powerpc/kvm/trace_hv.h
index 8d57c8428..ab19977c9 100644
--- a/arch/powerpc/kvm/trace_hv.h
+++ b/arch/powerpc/kvm/trace_hv.h
@@ -491,6 +491,31 @@ TRACE_EVENT(kvmppc_run_vcpu_enter,
 	TP_printk("VCPU %d: tgid=%d", __entry-&gt;vcpu_id, __entry-&gt;tgid)
 );
 
+TRACE_EVENT(kvmppc_vcpu_exit_cs_time,
+	TP_PROTO(struct kvm_vcpu *vcpu, u64 l1_to_l2_cs, u64 l2_to_l1_cs,
+		u64 l2_runtime),
+
+	TP_ARGS(vcpu, l1_to_l2_cs, l2_to_l1_cs, l2_runtime),
+
+	TP_STRUCT__entry(
+		__field(int,		vcpu_id)
+		__field(__u64,		l1_to_l2_cs_ns)
+		__field(__u64,		l2_to_l1_cs_ns)
+		__field(__u64,		l2_runtime_ns)
+	),
+
+	TP_fast_assign(
+		__entry-&gt;vcpu_id  = vcpu-&gt;vcpu_id;
+		__entry-&gt;l1_to_l2_cs_ns = l1_to_l2_cs;
+		__entry-&gt;l2_to_l1_cs_ns = l2_to_l1_cs;
+		__entry-&gt;l2_runtime_ns = l2_runtime;
+	),
+
+	TP_printk("VCPU %d: l1_to_l2_cs_time=%llu-ns l2_to_l1_cs_time=%llu-ns l2_runtime=%llu-ns",
+		__entry-&gt;vcpu_id,  __entry-&gt;l1_to_l2_cs_ns,
+		__entry-&gt;l2_to_l1_cs_ns, __entry-&gt;l2_runtime_ns)
+);
+
 TRACE_EVENT(kvmppc_run_vcpu_exit,
 	TP_PROTO(struct kvm_vcpu *vcpu),
 
</pre>
    </blockquote>
  </body>
</html>

--------------h9nzZo2uv0YmqUz3TuIoz8BA--


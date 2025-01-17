Return-Path: <linuxppc-dev+bounces-5365-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3185A15343
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2025 16:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YZPQt2MfDz3cfm;
	Sat, 18 Jan 2025 02:53:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737129206;
	cv=none; b=f/NxtNZI9UpY1KqVfpttola50odREgpYGU5faiqKOmP6ki/ek71vBt2r3eB5lvtyi8BJiUTi1Pq35Z7zAN941AZNh4XDqbKcM5domDx/c4cU2DIOhHr1Rsx/zEHPxhUGASqfT7ZGV/fRvIH4EQQM9bHzY14a1I58Bu0sUNL6/wH8MLmSXhhkeiSYRi5dNVJoXAfrsAHWRqBmttEU6Tt8BC1otgFYgt0iPoEZTsolLb2p1D1E12+AqTWtbuL1OTMyTx52mPu3RREHlezNFH+QcXRVamLgT1/Tc7jqxGIX6Vum4a4R6vVgSWPGkFu2gUjOyFXZ8TBCZfWR+0Ll0E18Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737129206; c=relaxed/relaxed;
	bh=KJazkJgtxGZ1/sgOx5bOSqsPf5bUpZmyrTW6V5rld18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfBX0yYoY1EkvaAiXYMN0oBSQvEuJgq++gzIx4pxvnrIcJTYPTCwxP1VPB9Er0MxcBZGrW5MkAocW0zkuaD/3xpZv/aTHamOY4NeU0laNk7UljfNaOzxgv9Fi/98TWav/bk8foU82QBkHJ3vZGB9oUZMHM2C17rNeonL3gk+3ekvIouGgxgSztbTTIDYKPp46yEXUg+r8saVRSSS+mf8Sa+/akwiyrzJgxwzuXhTdhiOCeDva5fp2VOy6f9Gk+XeSo+6sBiPZuQNJNVGr4lTt2NEQq95TBJQ2xxYpWk9VQn7900pz93pGC4g/YE9OfAMyNa2nHJf/oum1ahFlZRs1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hrwZYIKM; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hrwZYIKM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YZPQs3Y8Yz3bSR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jan 2025 02:53:25 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50HBRSmu019089;
	Fri, 17 Jan 2025 15:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=KJazkJgtxGZ1/sgOx5bOSqsPf5bUpZ
	myrTW6V5rld18=; b=hrwZYIKM7dX7YBffkJz/yRyJcDHuuXiCg04LUWB7gn9gf0
	WIABchfypE1uutBSbMcqscUhYEzQl/ljHGeVlhhLrqvSgCgnbo4JO7MtFH8BGwOD
	Bw/8Zg4AxX0m19gT7xAppCpqQyZ4WVldbxrQjaFSS4uAn0VIpqfgFrE3Fm2ZD9v2
	C6+avWO0Xz3svxK163EHeHiLJ2L3dwFslyVRUZTctCoeYW3yVMebtDkJVBKtNW18
	MBrXxsDhxPCM9E83hOIJfkkmffHQ/JmSWsHa7qBYWWlKgslw7HrbelTrTmQjQ5Dk
	jlIZvNhEwUf2+BgUf25ny2o2D8jb9POLfgWSmFFQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 447bxb3s85-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 15:53:16 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50HFiLPG005083;
	Fri, 17 Jan 2025 15:53:16 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 447bxb3s82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 15:53:16 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50HEQ2RB002734;
	Fri, 17 Jan 2025 15:53:15 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4443byknuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Jan 2025 15:53:15 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50HFrBIS47776178
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 17 Jan 2025 15:53:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD5EC20043;
	Fri, 17 Jan 2025 15:53:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A93D720040;
	Fri, 17 Jan 2025 15:53:08 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.124.211.105])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 17 Jan 2025 15:53:08 +0000 (GMT)
Date: Fri, 17 Jan 2025 21:23:05 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, kconsul@linux.ibm.com, amachhiw@linux.ibm.com
Subject: Re: [PATCH v2 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv
 specific PMU
Message-ID: <zmlauvqrepqbu3i4grwkvhqjwumauhmeojoslnte6ilaevqtgv@alhbbimtyn7t>
References: <20250115143948.369379-1-vaibhav@linux.ibm.com>
 <20250115143948.369379-5-vaibhav@linux.ibm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250115143948.369379-5-vaibhav@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y2QgynrNJiXzfKHcZAb-XmYA60vH9uLy
X-Proofpoint-GUID: z5sLUiR2JNAODfsAjBZ1FuYv2WKMQxFf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-17_06,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 malwarescore=0 mlxlogscore=999
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501170122
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 15, 2025 at 08:09:45PM +0530, Vaibhav Jain wrote:
> Introduce a new PMU named 'kvm-hv' to report Book3s kvm-hv specific
> performance counters. This will expose KVM-HV specific performance
> attributes to user-space via kernel's PMU infrastructure and would enable
> users to monitor active kvm-hv based guests.
> 
> The patch creates necessary scaffolding to for the new PMU callbacks and
> introduces two new exports kvmppc_{,un}register_pmu() that are called from
> kvm-hv init and exit function to perform initialize and cleanup for the
> 'kvm-hv' PMU. The patch doesn't introduce any perf-events yet, which will
> be introduced in later patches
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> 
> ---
> Changelog
> 
> v1->v2:
> * Fixed an issue of kvm-hv not loading on baremetal kvm [Gautam]
> ---
>  arch/powerpc/include/asm/kvm_book3s.h |  12 +++
>  arch/powerpc/kvm/Makefile             |   6 ++
>  arch/powerpc/kvm/book3s_hv.c          |   9 ++
>  arch/powerpc/kvm/book3s_hv_pmu.c      | 133 ++++++++++++++++++++++++++
>  4 files changed, 160 insertions(+)
>  create mode 100644 arch/powerpc/kvm/book3s_hv_pmu.c
> 
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
> index e1ff291ba891..cf91a1493159 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -334,6 +334,9 @@ static inline bool kvmhv_is_nestedv1(void)
>  	return !static_branch_likely(&__kvmhv_is_nestedv2);
>  }
>  
> +int kvmppc_register_pmu(void);
> +void kvmppc_unregister_pmu(void);
> +
>  #else
>  
>  static inline bool kvmhv_is_nestedv2(void)
> @@ -346,6 +349,15 @@ static inline bool kvmhv_is_nestedv1(void)
>  	return false;
>  }
>  
> +static int kvmppc_register_pmu(void)
> +{
> +	return 0;
> +}
> +
> +static void kvmppc_unregister_pmu(void)
> +{
> +}
> +
>  #endif
>  
>  int __kvmhv_nestedv2_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs);
> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 4bd9d1230869..094c3916d9d0 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -92,6 +92,12 @@ kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
>  	$(kvm-book3s_64-builtin-tm-objs-y) \
>  	$(kvm-book3s_64-builtin-xics-objs-y)
>  
> +# enable kvm_hv perf events
> +ifdef CONFIG_HAVE_PERF_EVENTS
> +kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
> +	book3s_hv_pmu.o
> +endif
> +
>  obj-$(CONFIG_GUEST_STATE_BUFFER_TEST) += test-guest-state-buffer.o
>  endif
>  
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 25429905ae90..6365b8126574 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -6662,6 +6662,14 @@ static int kvmppc_book3s_init_hv(void)
>  		return r;
>  	}
>  
> +	r = kvmppc_register_pmu();
> +	if (r == -EOPNOTSUPP) {
> +		pr_info("KVM-HV: PMU not supported %d\n", r);
> +	} else if (r) {
> +		pr_err("KVM-HV: Unable to register PMUs %d\n", r);
> +		goto err;
> +	}
> +

I believe we can simplify this part as follows:

	r = kvmppc_register_pmu();
	if (r) {
		pr_err("KVM-HV: Unable to register PMUs %d\n", r);
		goto err;
	}

This would also require a minor change in kvmppc_register_pmu(), see below


>  	kvm_ops_hv.owner = THIS_MODULE;
>  	kvmppc_hv_ops = &kvm_ops_hv;
>  
> @@ -6676,6 +6684,7 @@ static int kvmppc_book3s_init_hv(void)
>  
>  static void kvmppc_book3s_exit_hv(void)
>  {
> +	kvmppc_unregister_pmu();
>  	kvmppc_uvmem_free();
>  	kvmppc_free_host_rm_ops();
>  	if (kvmppc_radix_possible())
> diff --git a/arch/powerpc/kvm/book3s_hv_pmu.c b/arch/powerpc/kvm/book3s_hv_pmu.c
> new file mode 100644
> index 000000000000..8c6ed30b7654
> --- /dev/null
> +++ b/arch/powerpc/kvm/book3s_hv_pmu.c
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Description: PMUs specific to running nested KVM-HV guests
> + * on Book3S processors (specifically POWER9 and later).
> + */
> +
> +#define pr_fmt(fmt)  "kvmppc-pmu: " fmt
> +
> +#include "asm-generic/local64.h"
> +#include <linux/kernel.h>
> +#include <linux/errno.h>
> +#include <linux/ratelimit.h>
> +#include <linux/kvm_host.h>
> +#include <linux/gfp_types.h>
> +#include <linux/pgtable.h>
> +#include <linux/perf_event.h>
> +#include <linux/spinlock_types.h>
> +#include <linux/spinlock.h>
> +
> +#include <asm/types.h>
> +#include <asm/kvm_ppc.h>
> +#include <asm/kvm_book3s.h>
> +#include <asm/mmu.h>
> +#include <asm/pgalloc.h>
> +#include <asm/pte-walk.h>
> +#include <asm/reg.h>
> +#include <asm/plpar_wrappers.h>
> +#include <asm/firmware.h>
> +
> +enum kvmppc_pmu_eventid {
> +	KVMPPC_EVENT_MAX,
> +};
> +
> +static struct attribute *kvmppc_pmu_events_attr[] = {
> +	NULL,
> +};
> +
> +static const struct attribute_group kvmppc_pmu_events_group = {
> +	.name = "events",
> +	.attrs = kvmppc_pmu_events_attr,
> +};
> +
> +PMU_FORMAT_ATTR(event, "config:0");
> +static struct attribute *kvmppc_pmu_format_attr[] = {
> +	&format_attr_event.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group kvmppc_pmu_format_group = {
> +	.name = "format",
> +	.attrs = kvmppc_pmu_format_attr,
> +};
> +
> +static const struct attribute_group *kvmppc_pmu_attr_groups[] = {
> +	&kvmppc_pmu_events_group,
> +	&kvmppc_pmu_format_group,
> +	NULL,
> +};
> +
> +static int kvmppc_pmu_event_init(struct perf_event *event)
> +{
> +	unsigned int config = event->attr.config;
> +
> +	pr_debug("%s: Event(%p) id=%llu cpu=%x on_cpu=%x config=%u",
> +		 __func__, event, event->id, event->cpu,
> +		 event->oncpu, config);
> +
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	if (config >= KVMPPC_EVENT_MAX)
> +		return -EINVAL;
> +
> +	local64_set(&event->hw.prev_count, 0);
> +	local64_set(&event->count, 0);
> +
> +	return 0;
> +}
> +
> +static void kvmppc_pmu_del(struct perf_event *event, int flags)
> +{
> +}
> +
> +static int kvmppc_pmu_add(struct perf_event *event, int flags)
> +{
> +	return 0;
> +}
> +
> +static void kvmppc_pmu_read(struct perf_event *event)
> +{
> +}
> +
> +/* L1 wide counters PMU */
> +static struct pmu kvmppc_pmu = {
> +	.task_ctx_nr = perf_sw_context,
> +	.name = "kvm-hv",
> +	.event_init = kvmppc_pmu_event_init,
> +	.add = kvmppc_pmu_add,
> +	.del = kvmppc_pmu_del,
> +	.read = kvmppc_pmu_read,
> +	.attr_groups = kvmppc_pmu_attr_groups,
> +	.type = -1,
> +};
> +
> +int kvmppc_register_pmu(void)
> +{
> +	int rc = -EOPNOTSUPP;
> +
> +	/* only support events for nestedv2 right now */
> +	if (kvmhv_is_nestedv2()) {
> +		/* Setup done now register the PMU */
> +		pr_info("Registering kvm-hv pmu");
> +
> +		/* Register only if we arent already registered */
> +		rc = (kvmppc_pmu.type == -1) ?
> +			     perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name,
> +					       -1) : 0;
> +	}
> +
> +	return rc;
> +}
> +EXPORT_SYMBOL_GPL(kvmppc_register_pmu);

We can change the return code to support change suggested above

int kvmppc_register_pmu(void)
{
	int rc;

	/* only support events for nestedv2 right now */
	if (kvmhv_is_nestedv2()) {
		/* Setup done now register the PMU */
		pr_info("Registering kvm-hv pmu");

		/* Register only if we arent already registered */
		rc = (kvmppc_pmu.type == -1) ?
			     perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name,
					       -1) : 0;
	} else {
		pr_info("KVM-HV: PMU not supported %d\n", r);
	}

	return rc;
}

> +
> +void kvmppc_unregister_pmu(void)
> +{
> +	if (kvmhv_is_nestedv2()) {
> +		if (kvmppc_pmu.type != -1)
> +			perf_pmu_unregister(&kvmppc_pmu);
> +
> +		pr_info("kvmhv_pmu unregistered.\n");
> +	}
> +}

We can get rid of nested ifs. That way, the pr_info will also be emitted
only when we actually call perf_pmu_unregister()

	if (kvmhv_is_nestedv2() && kvmppc_pmu.type != -1) {
		perf_pmu_unregister(&kvmppc_pmu);
		pr_info("kvmhv_pmu unregistered.\n");
	}

> +EXPORT_SYMBOL_GPL(kvmppc_unregister_pmu);
> -- 
> 2.47.1
> 


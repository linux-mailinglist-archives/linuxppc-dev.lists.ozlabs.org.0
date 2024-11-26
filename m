Return-Path: <linuxppc-dev+bounces-3564-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F0AFB9D928A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 08:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyDsT3jmVz2ydW;
	Tue, 26 Nov 2024 18:36:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732606589;
	cv=none; b=Nbryx+mURRJX8VuJS1tOq6zP2UJuV54ykZH1Di456RBYK3r1NXum+TTKOkZAb2+aUSlWtkqa/vberEm3dMM0KzSSyZ6FSVL57ybYne7fRYwWtREuhTn0zHB9UqPiQSjk9+EkmS/Vb2QBm7NJ0ZzGvTx6cXPIZ5pB+mVdxmYbGHHgde+5R5lTDh1zH1nhXfB+cHZzlooSwMV17/l6e8gArH9HijXA4AGbinhHsX6YZJpLV86F4mVJ7PuFcPRIXKNYA3W8pGuQ+nFQ7L+H/NK99NBJXNfj7AXDDiWQrDsSY/B1y2RowFWSTPu2Ln4TVAfVYK1zYj5fT94sxoEuGuLFCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732606589; c=relaxed/relaxed;
	bh=M8z2J59zroaFpFRWP3ZjoG0gtIi2tc/nd3q2FavnHd4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TxpxQ6j/iojMKGPFjx1Vt9g2Q6MHvCMvXNTdHljcCeOqdNRRMF8j8lkzgVTRFFHlQzYVdqINjkxzoZKHdXJmweqXudfDRTpAkJQxBU6UuTpW8/fDGP2siRZ23ZbOgj+YBSss2XK/xkAhtXJ6ehTuKiEiBAmen/ge7clZLv7BrT0vKsd/seIbOKdTe4u0o4RbND0pF2W33tdaokK2hBsXncb+s9FwdY8fADDSk1AlQAvVSL271E0oH+MlpBy3J3Z48jGkhFcPHZJdd38wyYxwwbShAaCAb8xtgvxuSHjOwVVRGDT/rxixZznR+m7o3erb3f6zmFqv1kjBSfPulgLt6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m+Iu/WqI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m+Iu/WqI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyDsR4pP7z2xg8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 18:36:26 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ2R6ow020489;
	Tue, 26 Nov 2024 07:36:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=M8z2J59zroaFpFRWP3ZjoG0gtIi2tc
	/nd3q2FavnHd4=; b=m+Iu/WqI77HP8DFWAwrMjKyAPDauwOjUjv0ZOvEGfOJ7Dm
	qbb4PetfbuHxnpBWIXCBiqH1wdQYn6MkhgDw7se8Ykp/lkrv82YlBzK0nqaV1Ov8
	8XBK/lxi5z2XUb3fVIzNNJbXJPbBaG4L67ZDqCXSgAIkjUftc7eEW1AaPtfDtPnv
	04O/JlNLtZ1KqCnUmCeR9GNakqwPsWM6lqPV67F7gAtJzaxqBnasvhO5UiR9GLpm
	OFiTdaCi31RmRdIuujRVpmP3xNu2oz+js8wO3zwjvCfqmA7jkp1GBB3JVXZDoMye
	lO+Me80wqCxxvvQQpm01gVPHWuqBxrZi5nTOKg3Q==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43386ncmk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 07:36:16 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4AQ4DuBx026384;
	Tue, 26 Nov 2024 07:36:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 433v30uwkn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 26 Nov 2024 07:36:15 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4AQ7aAlG65667416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 26 Nov 2024 07:36:10 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 672662004B;
	Tue, 26 Nov 2024 07:36:10 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A1372004E;
	Tue, 26 Nov 2024 07:36:07 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.124.222.244])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 26 Nov 2024 07:36:06 +0000 (GMT)
Date: Tue, 26 Nov 2024 13:06:00 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, atrajeev@linux.vnet.ibm.com,
        disgoel@linux.ibm.com, hbathini@linux.ibm.com, adubey@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] powerpc/perf: Add perf interface to expose vpa
 counters
Message-ID: <bjzps4vzszpdys3pyao5zdghrmp4yur5ygckzupkj7ztcy22uq@g77rvavm5jjc>
References: <20241118114114.208964-1-kjain@linux.ibm.com>
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
In-Reply-To: <20241118114114.208964-1-kjain@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 4hPadUlcOOWEM_v9yO8x0RVA1XfH7aSo
X-Proofpoint-ORIG-GUID: 4hPadUlcOOWEM_v9yO8x0RVA1XfH7aSo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 malwarescore=0 spamscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411260059
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Nov 18, 2024 at 05:11:11PM +0530, Kajol Jain wrote:
> To support performance measurement for KVM on PowerVM(KoP)
> feature, PowerVM hypervisor has added couple of new software
> counters in Virtual Process Area(VPA) of the partition.
> 
> Commit e1f288d2f9c69 ("KVM: PPC: Book3S HV nestedv2: Add
> support for reading VPA counters for pseries guests")
> have updated the paca fields with corresponding changes.
> 
> Proposed perf interface is to expose these new software
> counters for monitoring of context switch latencies and
> runtime aggregate. Perf interface driver is called
> "vpa_pmu" and it has dependency on KVM and perf, hence
> added new config called "VPA_PMU" which depends on
> "CONFIG_KVM_BOOK3S_64_HV" and "CONFIG_HV_PERF_CTRS".
> Since, kvm and kvm_host are currently compiled as built-in
> modules, this perf interface takes the same path and
> registered as a module.
> 
> vpa_pmu perf interface needs access to some of the kvm
> functions and structures like kvmhv_get_l2_counters_status(),
> hence kvm_book3s_64.h and kvm_ppc.h are included.
> Below are the events added to monitor KoP:
> 
>   vpa_pmu/l1_to_l2_lat/
>   vpa_pmu/l2_to_l1_lat/
>   vpa_pmu/l2_runtime_agg/
> 
> and vpa_pmu driver supports only per-cpu monitoring with this patch.
> Example usage:
> 
> [command]# perf stat -e vpa_pmu/l1_to_l2_lat/ -a -I 1000
>      1.001017682            727,200      vpa_pmu/l1_to_l2_lat/
>      2.003540491          1,118,824      vpa_pmu/l1_to_l2_lat/
>      3.005699458          1,919,726      vpa_pmu/l1_to_l2_lat/
>      4.007827011          2,364,630      vpa_pmu/l1_to_l2_lat/
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Co-developed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
> Changelog:
> 
> v1 -> v2
> - Rebase the patch on top of kvm typo fix patch:
>   https://github.com/linuxppc/linux/commit/590d2f9347f7974d7954400e5d937672fd844a8b
> - Fix the config check reported by kernel test robot:
>   https://lore.kernel.org/oe-kbuild-all/202411171117.Eq9JtACb-lkp@intel.com/
> 
>  arch/powerpc/include/asm/kvm_book3s_64.h |   3 +
>  arch/powerpc/kvm/book3s_hv.c             |  19 +++
>  arch/powerpc/perf/Makefile               |   2 +
>  arch/powerpc/perf/vpa-pmu.c              | 197 +++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/Kconfig   |  14 ++
>  5 files changed, 235 insertions(+)
>  create mode 100644 arch/powerpc/perf/vpa-pmu.c
> 
> diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/include/asm/kvm_book3s_64.h
> index 11065313d4c1..f620e3126d68 100644
> --- a/arch/powerpc/include/asm/kvm_book3s_64.h
> +++ b/arch/powerpc/include/asm/kvm_book3s_64.h
> @@ -688,6 +688,9 @@ int kvmhv_counters_tracepoint_regfunc(void);
>  void kvmhv_counters_tracepoint_unregfunc(void);
>  int kvmhv_get_l2_counters_status(void);
>  void kvmhv_set_l2_counters_status(int cpu, bool status);
> +u64 kvmhv_get_l1_to_l2_cs_time(void);
> +u64 kvmhv_get_l2_to_l1_cs_time(void);
> +u64 kvmhv_get_l2_runtime_agg(void);
>  
>  #endif /* CONFIG_KVM_BOOK3S_HV_POSSIBLE */
>  
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index d575f7c7ab38..e618533dfc4b 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4153,6 +4153,7 @@ void kvmhv_set_l2_counters_status(int cpu, bool status)
>  	else
>  		lppaca_of(cpu).l2_counters_enable = 0;
>  }
> +EXPORT_SYMBOL(kvmhv_set_l2_counters_status);
>  
>  int kvmhv_counters_tracepoint_regfunc(void)
>  {
> @@ -4192,6 +4193,24 @@ static void do_trace_nested_cs_time(struct kvm_vcpu *vcpu)
>  	*l2_runtime_agg_ptr = l2_runtime_ns;
>  }
>  
> +u64 kvmhv_get_l1_to_l2_cs_time(void)
> +{
> +	return tb_to_ns(be64_to_cpu(get_lppaca()->l1_to_l2_cs_tb));
> +}
> +EXPORT_SYMBOL(kvmhv_get_l1_to_l2_cs_time);
> +
> +u64 kvmhv_get_l2_to_l1_cs_time(void)
> +{
> +	return tb_to_ns(be64_to_cpu(get_lppaca()->l2_to_l1_cs_tb));
> +}
> +EXPORT_SYMBOL(kvmhv_get_l2_to_l1_cs_time);
> +
> +u64 kvmhv_get_l2_runtime_agg(void)
> +{
> +	return tb_to_ns(be64_to_cpu(get_lppaca()->l2_runtime_tb));
> +}
> +EXPORT_SYMBOL(kvmhv_get_l2_runtime_agg);
> +
>  #else
>  int kvmhv_get_l2_counters_status(void)
>  {
> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
> index 4f53d0b97539..ac2cf58d62db 100644
> --- a/arch/powerpc/perf/Makefile
> +++ b/arch/powerpc/perf/Makefile
> @@ -16,6 +16,8 @@ obj-$(CONFIG_FSL_EMB_PERF_EVENT_E500) += e500-pmu.o e6500-pmu.o
>  
>  obj-$(CONFIG_HV_PERF_CTRS) += hv-24x7.o hv-gpci.o hv-common.o
>  
> +obj-$(CONFIG_VPA_PMU) += vpa-pmu.o

Do we need a new config option for this? I see you need 2 dependencies
for vpa_pmu, so can we do the following instead?

obj-$(CONFIG_KVM_BOOK3S_64_HV) += vpa-pmu.o

and then in the init func of vpa_pmu, we can add the check for HV_PERF_CTRS

static int __init pseries_vpa_pmu_init(void)
{
	<snip>

	if (!firmware_has_feature(FW_FEATURE_LPAR) || is_kvm_guest() ||
		!IS_ENABLED(CONFIG_HV_PERF_CTRS))
		return -ENODEV;

Thoughts?

> +
>  obj-$(CONFIG_PPC_8xx) += 8xx-pmu.o
>  
>  obj-$(CONFIG_PPC64)		+= $(obj64-y)
> diff --git a/arch/powerpc/perf/vpa-pmu.c b/arch/powerpc/perf/vpa-pmu.c
> new file mode 100644
> index 000000000000..2c785eee2f71
> --- /dev/null
> +++ b/arch/powerpc/perf/vpa-pmu.c
> @@ -0,0 +1,197 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Performance monitoring support for Virtual Processor Area(VPA) based counters
> + *
> + * Copyright (C) 2024 IBM Corporation
> + */
> +#define pr_fmt(fmt) "vpa_pmu: " fmt
> +
> +#include <linux/module.h>
> +#include <linux/perf_event.h>
> +#include <asm/kvm_ppc.h>
> +#include <asm/kvm_book3s_64.h>
> +
> +#define MODULE_VERS "1.0"
> +#define MODULE_NAME "pseries_vpa_pmu"
> +
> +#define EVENT(_name, _code)     enum{_name = _code}
> +
> +#define VPA_PMU_EVENT_VAR(_id)  event_attr_##_id
> +#define VPA_PMU_EVENT_PTR(_id)  (&event_attr_##_id.attr.attr)
> +
> +static ssize_t vpa_pmu_events_sysfs_show(struct device *dev,
> +				 struct device_attribute *attr, char *page)
> +{
> +	struct perf_pmu_events_attr *pmu_attr;
> +
> +	pmu_attr = container_of(attr, struct perf_pmu_events_attr, attr);
> +
> +	return sprintf(page, "event=0x%02llx\n", pmu_attr->id);
> +}
> +
> +#define VPA_PMU_EVENT_ATTR(_name, _id)				\
> +	PMU_EVENT_ATTR(_name, VPA_PMU_EVENT_VAR(_id), _id,	\
> +			vpa_pmu_events_sysfs_show)
> +
> +EVENT(L1_TO_L2_CS_LAT,	0x1);
> +EVENT(L2_TO_L1_CS_LAT,	0x2);
> +EVENT(L2_RUNTIME_AGG,	0x3);
> +
> +VPA_PMU_EVENT_ATTR(l1_to_l2_lat,  L1_TO_L2_CS_LAT);
> +VPA_PMU_EVENT_ATTR(l2_to_l1_lat,  L2_TO_L1_CS_LAT);
> +VPA_PMU_EVENT_ATTR(l2_runtime_agg, L2_RUNTIME_AGG);
> +
> +static struct attribute *vpa_pmu_events_attr[] = {
> +	VPA_PMU_EVENT_PTR(L1_TO_L2_CS_LAT),
> +	VPA_PMU_EVENT_PTR(L2_TO_L1_CS_LAT),
> +	VPA_PMU_EVENT_PTR(L2_RUNTIME_AGG),
> +	NULL
> +};
> +
> +static const struct attribute_group vpa_pmu_events_group = {
> +	.name = "events",
> +	.attrs = vpa_pmu_events_attr,
> +};
> +
> +PMU_FORMAT_ATTR(event, "config:0-31");
> +static struct attribute *vpa_pmu_format_attr[] = {
> +	&format_attr_event.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group vpa_pmu_format_group = {
> +	.name = "format",
> +	.attrs = vpa_pmu_format_attr,
> +};
> +
> +static const struct attribute_group *vpa_pmu_attr_groups[] = {
> +	&vpa_pmu_events_group,
> +	&vpa_pmu_format_group,
> +	NULL
> +};
> +
> +static int vpa_pmu_event_init(struct perf_event *event)
> +{
> +	if (event->attr.type != event->pmu->type)
> +		return -ENOENT;
> +
> +	/* it does not support event sampling mode */
> +	if (is_sampling_event(event))
> +		return -EOPNOTSUPP;
> +
> +	/* no branch sampling */
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	/* Invalid event code */
> +	if ((event->attr.config <= 0) || (event->attr.config > 3))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +static unsigned long get_counter_data(struct perf_event *event)
> +{
> +	unsigned int config = event->attr.config;
> +	u64 data;
> +
> +	switch (config) {
> +	case L1_TO_L2_CS_LAT:
> +		data = kvmhv_get_l1_to_l2_cs_time();
> +		break;
> +	case L2_TO_L1_CS_LAT:
> +		data = kvmhv_get_l2_to_l1_cs_time();
> +		break;
> +	case L2_RUNTIME_AGG:
> +		data = kvmhv_get_l2_runtime_agg();
> +		break;
> +	default:
> +		data = 0;
> +		break;
> +	}
> +
> +	return data;
> +}
> +
> +static int vpa_pmu_add(struct perf_event *event, int flags)
> +{
> +	u64 data;
> +
> +	kvmhv_set_l2_counters_status(
> +			smp_processor_id(), true);
> +
> +	data = get_counter_data(event);
> +	local64_set(&event->hw.prev_count, data);
> +
> +	return 0;
> +}
> +
> +static void vpa_pmu_read(struct perf_event *event)
> +{
> +	u64 prev_data, new_data, final_data;
> +
> +	prev_data = local64_read(&event->hw.prev_count);
> +	new_data = get_counter_data(event);
> +	final_data = new_data - prev_data;
> +
> +	local64_add(final_data, &event->count);
> +}
> +
> +static void vpa_pmu_del(struct perf_event *event, int flags)
> +{
> +	vpa_pmu_read(event);
> +
> +	/*
> +	 * Disable vpa counter accumulation
> +	 */
> +	kvmhv_set_l2_counters_status(
> +			smp_processor_id(), false);
> +}
> +

This won't work well with the kvm_hv:kvmppc_vcpu_stats tracepoint.
Consider the below scenario:

1. I start recording data with the kvmppc_vcpu_stats tracepoint (with trace-cmd)
and while the data is being recorded, I start using the vpa_pmu driver as well.
2. I now stop the vpa_pmu driver. This disables the l2_counters_enable
counter in lppaca. (The VPA flag can be disabled for 1 or more cpus
depending on the pid/tid options specified)
3. When I hit ctrl^c on the trace-cmd capture, I see partial data with
'trace-cmd report'.

To get around this, we can use the fact that the 'l2_counters_enable'
flag in lppaca supports all non-zero values. So we can see if we can use
that as a counter instead of just using 0/1 to enable/disable recording
of data. This may need some brainstorming to get right.

I see the patches have been pulled in already, but I think we need to
consider the above points.

Thanks,
Gautam


Return-Path: <linuxppc-dev+bounces-4696-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FEFA023B8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 12:01:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRWT42lCBz303B;
	Mon,  6 Jan 2025 22:01:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736161288;
	cv=none; b=fgUhGp9HlzN15tam1jyCWiTY6Iwx2ZG9ZcNP+bJDHj8/n3/Gftw4wUhK+fVQ5R+VxaMoHR2BUcl3jUd6oC5mdFd+xE8HlD1fEZS0T7E9z/Bpc7ChPwyIb305WlcBHsbrIGS1DE4V0zmbb4iLlYzzo/ZbAn40u2abu6xn7X3N3AStNdePxdRBrYH0hnB3ihMOOGXuZ3q9tDxpUqvU+ckmAdPhZOn/yxqLVJ+uiQOG7tHaJQLptSAO5MB8kLjX8H/9sfaDfecX5UUlnY3ZKbe+20j8bmC/YrBNbMMnvgR9ARyf1IE5i7JvxtsVa9Gts8o1eEeBpO58ZFKJzyncEv7HPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736161288; c=relaxed/relaxed;
	bh=GpBaV/V4x+cjkwHuYCty5KQ0sbnGJPjB7aedZdhHiNM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Xf/hXoOoVIEKY4OBlZRMlffcfjUmTLzJAgcOVExc2DKjZCxV4G8/NXKxuhKMnEL0KxuLmxLa6ai2TN69SHHDSy1Wq5E2mQW97W+7ElAm8MUJgzdUclHAsWwp4kMepXojmDB7HWL5kzUeN+tJBegIS/xrXj815jp+a32oUKR8MMpddt+ZB4mye4HpSZNITNNAO4XK9keGiXE6wewQrWCSdT27abccatu2JUXx19NhVt5FIBfJjnnXb4/h0g3kzNwYM5l1V0p/LQ7O5xEKNhr+D33kqCSOSUB9PnH6xHJMf507JSd0RHBqFw8fl4NIhWFMBBHKaCVlsP1DRcsAOS/41A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iGWjlqZ4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iGWjlqZ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRWT30smVz2yjb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 22:01:26 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50685gXe025258;
	Mon, 6 Jan 2025 11:01:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=GpBaV/V4x+cjkwHuYCty5KQ0sbnGJP
	jB7aedZdhHiNM=; b=iGWjlqZ4NFwz13XBJazywdP3mFuV9zp6lYWWbMrQjyDgF1
	SVpmj6VlwI/gnAVZ0hEJzpR0nqeu/sPevfeTr+/SD6rdlVDXZhE1KVMIhoN0Tl5d
	H6agSLwfGgwClWSC2eOdd2c/enqH3rWtkUZBx2r7dQOORTVyeD/l6afQUhxfSQW6
	UCWQaNqO92Er8ed46OjMiwfqXxXva0oMvwdmxUJ8UJ4MgYh1ifJzFdKInF8ivLCp
	bwoIdiHK2+FZ9QDlW1BUpS8qoDxad1gKpjx2oomUn9AyzONK127mLmjDIQaWoXPU
	RvQNnFDNwnCjRqN/HQWu70mIZY65EQ8u1JG2AQhw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440bc2gmmg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 11:01:17 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 506Aqc3w027529;
	Mon, 6 Jan 2025 11:01:17 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 440bc2gmme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 11:01:17 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 506Ag8Fa013571;
	Mon, 6 Jan 2025 11:01:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygannc1y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 11:01:16 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506B1D1v56557986
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 11:01:13 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E3EFC2004B;
	Mon,  6 Jan 2025 11:01:12 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 346F420040;
	Mon,  6 Jan 2025 11:01:09 +0000 (GMT)
Received: from vaibhav?linux.ibm.com (unknown [9.39.19.130])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with SMTP;
	Mon,  6 Jan 2025 11:01:08 +0000 (GMT)
Received: by vaibhav@linux.ibm.com (sSMTP sendmail emulation); Mon, 06 Jan 2025 16:31:08 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Gautam Menghani <gautam@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin
 <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, kconsul@linux.ibm.com, amachhiw@linux.ibm.com
Subject: Re: [PATCH 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv specific
 PMU
In-Reply-To: <a527m2zupgqrxd4ba4lz2xwregcaamnbffj67ixwz7u6j4yxzr@z3wcmd5rfzhb>
References: <20241222140247.174998-1-vaibhav@linux.ibm.com>
 <20241222140247.174998-5-vaibhav@linux.ibm.com>
 <a527m2zupgqrxd4ba4lz2xwregcaamnbffj67ixwz7u6j4yxzr@z3wcmd5rfzhb>
Date: Mon, 06 Jan 2025 16:31:08 +0530
Message-ID: <87o70k1a17.fsf@vajain21.in.ibm.com>
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
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LPwG94gHz8e1b8cVUG5SkTTZLO9CTf8Q
X-Proofpoint-ORIG-GUID: m_viWwPiXn8M3SZEtX06OuNnGOLYf0FC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 mlxscore=0 adultscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 spamscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501060097
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Gautam,

Thanks for reviewing this patch. My responses to your review comments
inline below:

Gautam Menghani <gautam@linux.ibm.com> writes:

> On Sun, Dec 22, 2024 at 07:32:32PM +0530, Vaibhav Jain wrote:
>> Introduce a new PMU named 'kvm-hv' to report Book3s kvm-hv specific
>> performance counters. This will expose KVM-HV specific performance
>> attributes to user-space via kernel's PMU infrastructure and would enable
>> users to monitor active kvm-hv based guests.
>> 
>> The patch creates necessary scaffolding to for the new PMU callbacks and
>> introduces two new exports kvmppc_{,un}register_pmu() that are called from
>> kvm-hv init and exit function to perform initialize and cleanup for the
>> 'kvm-hv' PMU. The patch doesn't introduce any perf-events yet, which will
>> be introduced in later patches
>> 
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>>  arch/powerpc/include/asm/kvm_book3s.h |  12 +++
>>  arch/powerpc/kvm/Makefile             |   6 ++
>>  arch/powerpc/kvm/book3s_hv.c          |   7 ++
>>  arch/powerpc/kvm/book3s_hv_pmu.c      | 133 ++++++++++++++++++++++++++
>>  4 files changed, 158 insertions(+)
>>  create mode 100644 arch/powerpc/kvm/book3s_hv_pmu.c
>> 
>> diff --git a/arch/powerpc/include/asm/kvm_book3s.h b/arch/powerpc/include/asm/kvm_book3s.h
>> index e1ff291ba891..cf91a1493159 100644
>> --- a/arch/powerpc/include/asm/kvm_book3s.h
>> +++ b/arch/powerpc/include/asm/kvm_book3s.h
>> @@ -334,6 +334,9 @@ static inline bool kvmhv_is_nestedv1(void)
>>  	return !static_branch_likely(&__kvmhv_is_nestedv2);
>>  }
>>  
>> +int kvmppc_register_pmu(void);
>> +void kvmppc_unregister_pmu(void);
>> +
>>  #else
>>  
>>  static inline bool kvmhv_is_nestedv2(void)
>> @@ -346,6 +349,15 @@ static inline bool kvmhv_is_nestedv1(void)
>>  	return false;
>>  }
>>  
>> +static int kvmppc_register_pmu(void)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void kvmppc_unregister_pmu(void)
>> +{
>> +}
>> +
>>  #endif
>>  
>>  int __kvmhv_nestedv2_reload_ptregs(struct kvm_vcpu *vcpu, struct pt_regs *regs);
>> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
>> index 4bd9d1230869..094c3916d9d0 100644
>> --- a/arch/powerpc/kvm/Makefile
>> +++ b/arch/powerpc/kvm/Makefile
>> @@ -92,6 +92,12 @@ kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
>>  	$(kvm-book3s_64-builtin-tm-objs-y) \
>>  	$(kvm-book3s_64-builtin-xics-objs-y)
>>  
>> +# enable kvm_hv perf events
>> +ifdef CONFIG_HAVE_PERF_EVENTS
>> +kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) += \
>> +	book3s_hv_pmu.o
>> +endif
>> +
>>  obj-$(CONFIG_GUEST_STATE_BUFFER_TEST) += test-guest-state-buffer.o
>>  endif
>>  
>> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
>> index 25429905ae90..83bcce2fb557 100644
>> --- a/arch/powerpc/kvm/book3s_hv.c
>> +++ b/arch/powerpc/kvm/book3s_hv.c
>> @@ -6662,6 +6662,12 @@ static int kvmppc_book3s_init_hv(void)
>>  		return r;
>>  	}
>>  
>> +	r = kvmppc_register_pmu();
>> +	if (r) {
>> +		pr_err("KVM-HV: Unable to register PMUs %d\n", r);
>> +		goto err;
>> +	}
>> +
>>  	kvm_ops_hv.owner = THIS_MODULE;
>>  	kvmppc_hv_ops = &kvm_ops_hv;
>>  
>> @@ -6676,6 +6682,7 @@ static int kvmppc_book3s_init_hv(void)
>>  
>>  static void kvmppc_book3s_exit_hv(void)
>>  {
>> +	kvmppc_unregister_pmu();
>>  	kvmppc_uvmem_free();
>>  	kvmppc_free_host_rm_ops();
>>  	if (kvmppc_radix_possible())
>> diff --git a/arch/powerpc/kvm/book3s_hv_pmu.c b/arch/powerpc/kvm/book3s_hv_pmu.c
>> new file mode 100644
>> index 000000000000..e72542d5e750
>> --- /dev/null
>> +++ b/arch/powerpc/kvm/book3s_hv_pmu.c
>> @@ -0,0 +1,133 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Description: PMUs specific to running nested KVM-HV guests
>> + * on Book3S processors (specifically POWER9 and later).
>> + */
>> +
>> +#define pr_fmt(fmt)  "kvmppc-pmu: " fmt
>> +
>> +#include "asm-generic/local64.h"
>> +#include <linux/kernel.h>
>> +#include <linux/errno.h>
>> +#include <linux/ratelimit.h>
>> +#include <linux/kvm_host.h>
>> +#include <linux/gfp_types.h>
>> +#include <linux/pgtable.h>
>> +#include <linux/perf_event.h>
>> +#include <linux/spinlock_types.h>
>> +#include <linux/spinlock.h>
>> +
>> +#include <asm/types.h>
>> +#include <asm/kvm_ppc.h>
>> +#include <asm/kvm_book3s.h>
>> +#include <asm/mmu.h>
>> +#include <asm/pgalloc.h>
>> +#include <asm/pte-walk.h>
>> +#include <asm/reg.h>
>> +#include <asm/plpar_wrappers.h>
>> +#include <asm/firmware.h>
>> +
>> +enum kvmppc_pmu_eventid {
>> +	KVMPPC_EVENT_MAX,
>> +};
>> +
>> +static struct attribute *kvmppc_pmu_events_attr[] = {
>> +	NULL,
>> +};
>> +
>> +static const struct attribute_group kvmppc_pmu_events_group = {
>> +	.name = "events",
>> +	.attrs = kvmppc_pmu_events_attr,
>> +};
>> +
>> +PMU_FORMAT_ATTR(event, "config:0");
>> +static struct attribute *kvmppc_pmu_format_attr[] = {
>> +	&format_attr_event.attr,
>> +	NULL,
>> +};
>> +
>> +static struct attribute_group kvmppc_pmu_format_group = {
>> +	.name = "format",
>> +	.attrs = kvmppc_pmu_format_attr,
>> +};
>> +
>> +static const struct attribute_group *kvmppc_pmu_attr_groups[] = {
>> +	&kvmppc_pmu_events_group,
>> +	&kvmppc_pmu_format_group,
>> +	NULL,
>> +};
>> +
>> +static int kvmppc_pmu_event_init(struct perf_event *event)
>> +{
>> +	unsigned int config = event->attr.config;
>> +
>> +	pr_debug("%s: Event(%p) id=%llu cpu=%x on_cpu=%x config=%u",
>> +		 __func__, event, event->id, event->cpu,
>> +		 event->oncpu, config);
>> +
>> +	if (event->attr.type != event->pmu->type)
>> +		return -ENOENT;
>> +
>> +	if (config >= KVMPPC_EVENT_MAX)
>> +		return -EINVAL;
>> +
>> +	local64_set(&event->hw.prev_count, 0);
>> +	local64_set(&event->count, 0);
>> +
>> +	return 0;
>> +}
>> +
>> +static void kvmppc_pmu_del(struct perf_event *event, int flags)
>> +{
>> +}
>> +
>> +static int kvmppc_pmu_add(struct perf_event *event, int flags)
>> +{
>> +	return 0;
>> +}
>> +
>> +static void kvmppc_pmu_read(struct perf_event *event)
>> +{
>> +}
>> +
>> +/* L1 wide counters PMU */
>> +static struct pmu kvmppc_pmu = {
>> +	.task_ctx_nr = perf_sw_context,
>> +	.name = "kvm-hv",
>> +	.event_init = kvmppc_pmu_event_init,
>> +	.add = kvmppc_pmu_add,
>> +	.del = kvmppc_pmu_del,
>> +	.read = kvmppc_pmu_read,
>> +	.attr_groups = kvmppc_pmu_attr_groups,
>> +	.type = -1,
>> +};
>> +
>> +int kvmppc_register_pmu(void)
>> +{
>> +	int rc = -EOPNOTSUPP;
>> +
>> +	/* only support events for nestedv2 right now */
>> +	if (kvmhv_is_nestedv2()) {
>> +		/* Setup done now register the PMU */
>> +		pr_info("Registering kvm-hv pmu");
>> +
>> +		/* Register only if we arent already registyered */
>> +		rc = (kvmppc_pmu.type == -1) ?
>> +			     perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name,
>> +					       -1) : 0;
>> +	}
>> +
>> +	return rc;
>> +}
>> +EXPORT_SYMBOL_GPL(kvmppc_register_pmu);
>
> This logic breaks on bare metal. kvmppc_register_pmu() returns
> -EOPNOTSUPP because of which kvm_hv cannot be loaded.
>
Good catch. Fixing this in v2

>> +
>> +void kvmppc_unregister_pmu(void)
>> +{
>> +	if (kvmhv_is_nestedv2()) {
>> +		if (kvmppc_pmu.type != -1)
>> +			perf_pmu_unregister(&kvmppc_pmu);
>> +
>> +		pr_info("kvmhv_pmu unregistered.\n");
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(kvmppc_unregister_pmu);
>> -- 
>> 2.47.1
>> 

-- 
Cheers
~ Vaibhav


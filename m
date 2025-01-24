Return-Path: <linuxppc-dev+bounces-5552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A7BA1BC6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 19:50:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yfn2S1Tw7z301N;
	Sat, 25 Jan 2025 05:50:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737744656;
	cv=none; b=lWsH2/XbH9TM4EzkWHZbzwTGs0PVl1QmGDrth74mZktu1hjKzOAR1lQxIzfsw4Sr1KyDRp3TR8HzR46V7VVR1OxdyZBriGFgPocjVLRwmZTPW+bi7W/+4/JoIlehJIN/CMb4OBAJhCzlmBQ10Zo1tEOxhzGRslWBgSTzER+1nOa1ovqjPWzD2ox8l/ulWsmphG6gbdoET3AzsLwAYv3E2r9nKH6iq+iiT/dLCGPi+F/7fYxaJClElMy7v37o2dk624a2KzTCWUCufqhQqwdS2kjCgq6GpJ6P1Y2tJFS8WeORSF2OvWhPCfvbh9TReojCt1KlHo2xeCT5rmpXWvm13A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737744656; c=relaxed/relaxed;
	bh=Z8GgqtqmMyolY5jG1Hjed+WcKhmQN74PhYCxZSVP+B8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=R7/daPxcT3T6iyc14MMXsDnR0HhNzDk9D6wwOBnX0nfwfEPGcKo7sAcYYGqAxIAth2Qra43GS36HX+2Uk3gMN7sb2XILuuDXrZKKbW0ICwtxpi1bwM7lS4FGRxhlsaxQWWvc2Ao5DASl2qlngSuvZjLf5Yrao/5DokfopcV5FYTAlBqzryxKxspSXqc2SdbTrKKmpmduwjO7/ZQ+gMQXPcbUUHmxbSQuMLKOATOO4aC4jzCNsOPUA3+jUZCBgv+njyVJcWJLT0Fvp59k5GxNUEkJV2WBTBSIi7Ni0hxxCXQTRko87F3Tbhy45hZHpbGBE5QWNi7BEsaHtVN2j9DT+w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iDxlW6nQ; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=iDxlW6nQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yfn2R2VmNz2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Jan 2025 05:50:55 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OFdVja013427;
	Fri, 24 Jan 2025 18:50:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Z8Ggqt
	qmMyolY5jG1Hjed+WcKhmQN74PhYCxZSVP+B8=; b=iDxlW6nQ62SXbq5JJQ61xz
	YEP18MTBZOP6FrwSUCUYFjgtxEzcaywh7gVBFvqOPZBl388ErU1719224qNYT6d6
	TPFv08jFb12ByBJ/uaT+HYF13sevOzoFU7SbQvn5vMhFMSWOnXIQUpY/FPZZtRxw
	xh5oMxF+onLVa38lk9j1mjiz6sKSM+AaUKsWfePhaWL6I0GfeKDw1L3/GD/+k8p+
	A7aoqTNdSJYMpAo5gWNvQyJGq+yOuPIXco38AF9Xo7mYqoxjhRtuKCMukW6Z3+BT
	MaxFr2Jl8xfqKnAi5uai+a6SMglyCovOu5geOo1IJDRa3NPPYvyYQCWQUtUv/GtQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44cdptrx42-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 18:50:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50OIokFN029316;
	Fri, 24 Jan 2025 18:50:46 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44cdptrx3y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 18:50:46 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50OG0us5019261;
	Fri, 24 Jan 2025 18:50:45 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 448pmsw341-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 18:50:45 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50OIogil27328954
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 18:50:42 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E76362008A;
	Fri, 24 Jan 2025 18:50:41 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7621D20089;
	Fri, 24 Jan 2025 18:50:36 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.247.134])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 24 Jan 2025 18:50:36 +0000 (GMT)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH v3 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv
 specific PMU
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20250123120749.90505-5-vaibhav@linux.ibm.com>
Date: Sat, 25 Jan 2025 00:20:21 +0530
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <40C19755-ABE4-4E23-A75A-1F6F6DDC505A@linux.vnet.ibm.com>
References: <20250123120749.90505-1-vaibhav@linux.ibm.com>
 <20250123120749.90505-5-vaibhav@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iTw0SW9kqfK8yqMAN4Q6x07KqbBYUPTh
X-Proofpoint-GUID: aleTYd-8tAiYtCILKQeyMEzMLjBTsB3L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_08,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 clxscore=1011 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0 spamscore=0
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501240127
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 23 Jan 2025, at 5:37=E2=80=AFPM, Vaibhav Jain =
<vaibhav@linux.ibm.com> wrote:
>=20
> Introduce a new PMU named 'kvm-hv' to report Book3s kvm-hv specific
> performance counters. This will expose KVM-HV specific performance
> attributes to user-space via kernel's PMU infrastructure and would =
enable
> users to monitor active kvm-hv based guests.
>=20
> The patch creates necessary scaffolding to for the new PMU callbacks =
and
> introduces two new exports kvmppc_{,un}register_pmu() that are called =
from
> kvm-hv init and exit function to perform initialize and cleanup for =
the
> 'kvm-hv' PMU. The patch doesn't introduce any perf-events yet, which =
will
> be introduced in later patches
>=20
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>=20
> ---
> Changelog
>=20
> v2->v3:
> * Fixed a build warning reported by kernel build robot.
> Link:
> =
https://lore.kernel.org/oe-kbuild-all/202501171030.3x0gqW8G-lkp@intel.com
>=20
> v1->v2:
> * Fixed an issue of kvm-hv not loading on baremetal kvm [Gautam]
> ---
> arch/powerpc/include/asm/kvm_book3s.h |  20 ++++
> arch/powerpc/kvm/Makefile             |   6 ++
> arch/powerpc/kvm/book3s_hv.c          |   9 ++
> arch/powerpc/kvm/book3s_hv_pmu.c      | 133 ++++++++++++++++++++++++++
> 4 files changed, 168 insertions(+)
> create mode 100644 arch/powerpc/kvm/book3s_hv_pmu.c
>=20
> diff --git a/arch/powerpc/include/asm/kvm_book3s.h =
b/arch/powerpc/include/asm/kvm_book3s.h
> index e1ff291ba891..7a7854c65ebb 100644
> --- a/arch/powerpc/include/asm/kvm_book3s.h
> +++ b/arch/powerpc/include/asm/kvm_book3s.h
> @@ -348,6 +348,26 @@ static inline bool kvmhv_is_nestedv1(void)
>=20
> #endif
>=20
> +/* kvm-ppc pmu registration */
> +#if IS_ENABLED(CONFIG_KVM_BOOK3S_64_HV)
> +#ifdef CONFIG_PERF_EVENTS
> +int kvmppc_register_pmu(void);
> +void kvmppc_unregister_pmu(void);
> +
> +#else
> +
> +static inline int kvmppc_register_pmu(void)
> +{
> + return 0;
> +}
> +
> +static inline void kvmppc_unregister_pmu(void)
> +{
> + /* do nothing */
> +}
> +#endif /* CONFIG_PERF_EVENTS */
> +#endif /* CONFIG_KVM_BOOK3S_64_HV */
> +
> int __kvmhv_nestedv2_reload_ptregs(struct kvm_vcpu *vcpu, struct =
pt_regs *regs);
> int __kvmhv_nestedv2_mark_dirty_ptregs(struct kvm_vcpu *vcpu, struct =
pt_regs *regs);
> int __kvmhv_nestedv2_mark_dirty(struct kvm_vcpu *vcpu, u16 iden);
> diff --git a/arch/powerpc/kvm/Makefile b/arch/powerpc/kvm/Makefile
> index 4bd9d1230869..7645307ff277 100644
> --- a/arch/powerpc/kvm/Makefile
> +++ b/arch/powerpc/kvm/Makefile
> @@ -92,6 +92,12 @@ =
kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) +=3D \
> $(kvm-book3s_64-builtin-tm-objs-y) \
> $(kvm-book3s_64-builtin-xics-objs-y)
>=20
> +# enable kvm_hv perf events
> +ifdef CONFIG_PERF_EVENTS
> +kvm-book3s_64-builtin-objs-$(CONFIG_KVM_BOOK3S_64_HANDLER) +=3D \
> + book3s_hv_pmu.o
> +endif
> +
> obj-$(CONFIG_GUEST_STATE_BUFFER_TEST) +=3D test-guest-state-buffer.o
> endif
>=20
> diff --git a/arch/powerpc/kvm/book3s_hv.c =
b/arch/powerpc/kvm/book3s_hv.c
> index 25429905ae90..6365b8126574 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -6662,6 +6662,14 @@ static int kvmppc_book3s_init_hv(void)
> return r;
> }
>=20
> + r =3D kvmppc_register_pmu();
> + if (r =3D=3D -EOPNOTSUPP) {
> + pr_info("KVM-HV: PMU not supported %d\n", r);
> + } else if (r) {
> + pr_err("KVM-HV: Unable to register PMUs %d\n", r);
> + goto err;
> + }
> +
> kvm_ops_hv.owner =3D THIS_MODULE;
> kvmppc_hv_ops =3D &kvm_ops_hv;
>=20
> @@ -6676,6 +6684,7 @@ static int kvmppc_book3s_init_hv(void)
>=20
> static void kvmppc_book3s_exit_hv(void)
> {
> + kvmppc_unregister_pmu();
> kvmppc_uvmem_free();
> kvmppc_free_host_rm_ops();
> if (kvmppc_radix_possible())
> diff --git a/arch/powerpc/kvm/book3s_hv_pmu.c =
b/arch/powerpc/kvm/book3s_hv_pmu.c
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

Hi Vaibhav

All PMU specific code is under =E2=80=9Carch/powerpc/perf in the kernel =
source. Here since we are introducing a kvm-hv specific PMU, can we =
please have it in arch/powerpc/perf ?

Thanks
Athira
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
> + KVMPPC_EVENT_MAX,
> +};
> +
> +static struct attribute *kvmppc_pmu_events_attr[] =3D {
> + NULL,
> +};
> +
> +static const struct attribute_group kvmppc_pmu_events_group =3D {
> + .name =3D "events",
> + .attrs =3D kvmppc_pmu_events_attr,
> +};
> +
> +PMU_FORMAT_ATTR(event, "config:0");
> +static struct attribute *kvmppc_pmu_format_attr[] =3D {
> + &format_attr_event.attr,
> + NULL,
> +};
> +
> +static struct attribute_group kvmppc_pmu_format_group =3D {
> + .name =3D "format",
> + .attrs =3D kvmppc_pmu_format_attr,
> +};
> +
> +static const struct attribute_group *kvmppc_pmu_attr_groups[] =3D {
> + &kvmppc_pmu_events_group,
> + &kvmppc_pmu_format_group,
> + NULL,
> +};
> +
> +static int kvmppc_pmu_event_init(struct perf_event *event)
> +{
> + unsigned int config =3D event->attr.config;
> +
> + pr_debug("%s: Event(%p) id=3D%llu cpu=3D%x on_cpu=3D%x config=3D%u",
> + __func__, event, event->id, event->cpu,
> + event->oncpu, config);
> +
> + if (event->attr.type !=3D event->pmu->type)
> + return -ENOENT;
> +
> + if (config >=3D KVMPPC_EVENT_MAX)
> + return -EINVAL;
> +
> + local64_set(&event->hw.prev_count, 0);
> + local64_set(&event->count, 0);
> +
> + return 0;
> +}
> +
> +static void kvmppc_pmu_del(struct perf_event *event, int flags)
> +{
> +}
> +
> +static int kvmppc_pmu_add(struct perf_event *event, int flags)
> +{
> + return 0;
> +}
> +
> +static void kvmppc_pmu_read(struct perf_event *event)
> +{
> +}
> +
> +/* L1 wide counters PMU */
> +static struct pmu kvmppc_pmu =3D {
> + .task_ctx_nr =3D perf_sw_context,
> + .name =3D "kvm-hv",
> + .event_init =3D kvmppc_pmu_event_init,
> + .add =3D kvmppc_pmu_add,
> + .del =3D kvmppc_pmu_del,
> + .read =3D kvmppc_pmu_read,
> + .attr_groups =3D kvmppc_pmu_attr_groups,
> + .type =3D -1,
> +};
> +
> +int kvmppc_register_pmu(void)
> +{
> + int rc =3D -EOPNOTSUPP;
> +
> + /* only support events for nestedv2 right now */
> + if (kvmhv_is_nestedv2()) {
> + /* Setup done now register the PMU */
> + pr_info("Registering kvm-hv pmu");
> +
> + /* Register only if we arent already registered */
> + rc =3D (kvmppc_pmu.type =3D=3D -1) ?
> +     perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name,
> +       -1) : 0;
> + }
> +
> + return rc;
> +}
> +EXPORT_SYMBOL_GPL(kvmppc_register_pmu);
> +
> +void kvmppc_unregister_pmu(void)
> +{
> + if (kvmhv_is_nestedv2()) {
> + if (kvmppc_pmu.type !=3D -1)
> + perf_pmu_unregister(&kvmppc_pmu);
> +
> + pr_info("kvmhv_pmu unregistered.\n");
> + }
> +}
> +EXPORT_SYMBOL_GPL(kvmppc_unregister_pmu);
> --=20
> 2.48.1
>=20
>=20
>=20



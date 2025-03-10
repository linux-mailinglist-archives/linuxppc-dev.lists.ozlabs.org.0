Return-Path: <linuxppc-dev+bounces-6840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42E1CA58BB3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 06:34:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZB5DR3sGFz30WQ;
	Mon, 10 Mar 2025 16:34:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741584855;
	cv=none; b=nJNiGf9ZvzjqgMvmJpyIrt84XrIP8XAMX2qBIZ9BLkV/bNuHyFEtz+wxSQpw7wzrWKyxQRxQqBJr4x6x3x/7iWPIRORXfIxYasMDm0nJs65x3oKux3FGusStV+cLsO/R3qV+nW+Vx/SAZrD/JtWuDqt5xAmZKOZ5Rvkpq9Qv6zuull/EGuIetEL7X/ih39vrGPWMRv+bFfQ1RpSkD/6TXAQtfoliJu7Qi9I1bMkhDp8Xu9aP4SF5xs+EeO5OytwcYCrOLRuCQi8DqrrKLOhj4nVDtQvszX41d4qiXW151OvQfDLHaJAy3Tw/FaPD+CQX7rz/nXhl8PHM/8DFWi9RVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741584855; c=relaxed/relaxed;
	bh=kA1zZuivu8hAl685or2a+Q+MiayMZE+IJH7XtubVSJ0=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ScD4q+ck/GYJGn7ikPrTPlNLnG9g0YHLUpdOTJ9DDKokFF6JX+T4vxLHEp8nMhT75Ajg1eaoM/SnI4gJm1D3f1BFiwhOvmM/OaCZD0QhX9jPWJyCLSHJZsPWhXXjO8mORB5hYjph6p2r7Z/r0JvgeKMZ98O+5nkLg8NoQUM5DvFr+z+U9SoouBlItpnxl4PNnOt0UPerdOb9+tpyUcvKDyhZiBrFHkPLSHm9odPo3DR3PGNfnkDccnMaaf+TslCGeJ131DzW+9LNpe1rSRhNIRlYMG8tAS2Whu3mmaOwgehY54QaCz1nTtevxhwMkAMaBRNlmDKwUmMBbCVENJDVZQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T6Xavnc4; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T6Xavnc4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZB5DQ25Zcz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 16:34:13 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529NeaH9028787;
	Mon, 10 Mar 2025 05:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kA1zZu
	ivu8hAl685or2a+Q+MiayMZE+IJH7XtubVSJ0=; b=T6Xavnc42xXfl+gidBDWVm
	tfNSsBwkVnzdOTRWVVnGHVjsDP+kDKumEi0yMZg29y0cW5BwAUTu9aPCzlJgrCA6
	TVP90Kaq5t62PrJjBXLPufq4iWm7IxM+ok7a9GNsRPtaihCyTo/sudvfxPK55JqY
	M+/T8Hj7fN4JkMcNXzl/13ORyEkHhzbkt3sksjBs+ORpz+ZmtRV3kcKg8UwWTNM4
	jFzQR+0ryz5ELyFpsmqR6mpyHCDmOqmv+jyp5ZCspJneCUILDfWN6nlZguYIoI7m
	mIKyzZO3Ipi2cdRaGG4dyQgGiBxo6Y132c+yN7PgTk4hCUSV4q4UC1PgJGJosh5Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459jd4s9xv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 05:34:04 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52A5Y3Ua030014;
	Mon, 10 Mar 2025 05:34:03 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459jd4s9xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 05:34:03 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52A0jY6a006941;
	Mon, 10 Mar 2025 05:34:03 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 45907sw7xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 05:34:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52A5XxDY30671374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Mar 2025 05:33:59 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 869C420043;
	Mon, 10 Mar 2025 05:33:59 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCA3520040;
	Mon, 10 Mar 2025 05:33:53 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.242.98])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 10 Mar 2025 05:33:53 +0000 (GMT)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH v4 4/6] kvm powerpc/book3s-apiv2: Introduce kvm-hv
 specific PMU
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <20250224131522.77104-5-vaibhav@linux.ibm.com>
Date: Mon, 10 Mar 2025 11:03:39 +0530
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <BF8AA073-AEBD-4B4A-9C1E-970942C29345@linux.ibm.com>
References: <20250224131522.77104-1-vaibhav@linux.ibm.com>
 <20250224131522.77104-5-vaibhav@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IhGOvbOwU5zbOsRgg3FzoCU85K-1QLCp
X-Proofpoint-GUID: HQu6aLoXdGEfaOOoHCK-RbuY6DeSo3wl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_01,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 priorityscore=1501 mlxscore=0
 suspectscore=0 malwarescore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100036
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 24 Feb 2025, at 6:45=E2=80=AFPM, Vaibhav Jain =
<vaibhav@linux.ibm.com> wrote:
>=20
> Introduce a new PMU named 'kvm-hv' inside a new module named =
'kvm-hv-pmu'
> to report Book3s kvm-hv specific performance counters. This will =
expose
> KVM-HV specific performance attributes to user-space via kernel's PMU
> infrastructure and would enableusers to monitor active kvm-hv based =
guests.
>=20
> The patch creates necessary scaffolding to for the new PMU callbacks =
and
> introduces the new kernel module name 'kvm-hv-pmu' which is built with
> CONFIG_KVM_BOOK3S_HV_PMU. The patch doesn't introduce any perf-events =
yet,
> which will be introduced in later patches
>=20
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>=20
> ---
> Changelog
>=20
> v3->v4:
> * Introduced a new kernel module named 'kmv-hv-pmu' to host the new =
PMU
> instead of building the as part of KVM-HV module. [ Maddy ]
> * Moved the code from arch/powerpc/kvm to arch/powerpc/perf [ Atheera =
]
> * Added a new config named KVM_BOOK3S_HV_PMU to =
arch/powerpc/kvm/Kconfig
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
> arch/powerpc/kvm/Kconfig       |  13 ++++
> arch/powerpc/perf/Makefile     |   2 +
> arch/powerpc/perf/kvm-hv-pmu.c | 138 +++++++++++++++++++++++++++++++++
> 3 files changed, 153 insertions(+)
> create mode 100644 arch/powerpc/perf/kvm-hv-pmu.c
>=20
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index dbfdc126bf14..5f0ce19e7e27 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -83,6 +83,7 @@ config KVM_BOOK3S_64_HV
> depends on KVM_BOOK3S_64 && PPC_POWERNV
> select KVM_BOOK3S_HV_POSSIBLE
> select KVM_GENERIC_MMU_NOTIFIER
> + select KVM_BOOK3S_HV_PMU
> select CMA
> help
>  Support running unmodified book3s_64 guest kernels in
> @@ -171,6 +172,18 @@ config KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND
>  those buggy L1s which saves the L2 state, at the cost of performance
>  in all nested-capable guest entry/exit.
>=20
> +config KVM_BOOK3S_HV_PMU
> + tristate "Hypervisor Perf events for KVM Book3s-HV"
> + depends on KVM_BOOK3S_64_HV && HV_PERF_CTRS
> + help
> +  Enable Book3s-HV Hypervisor Perf events PMU named 'kvm-hv'. These
> +  Perf events give an overview of hypervisor performance overall
> +  instead of a specific guests. Currently the PMU reports
> +  L0-Hypervisor stats on a kvm-hv enabled PSeries LPAR like:
> +  * Total/Used Guest-Heap
> +  * Total/Used Guest Page-table Memory
> +  * Total amount of Guest Page-table Memory reclaimed
> +
> config KVM_BOOKE_HV
> bool
>=20
> diff --git a/arch/powerpc/perf/Makefile b/arch/powerpc/perf/Makefile
> index ac2cf58d62db..7f53fcb7495a 100644
> --- a/arch/powerpc/perf/Makefile
> +++ b/arch/powerpc/perf/Makefile
> @@ -18,6 +18,8 @@ obj-$(CONFIG_HV_PERF_CTRS) +=3D hv-24x7.o hv-gpci.o =
hv-common.o
>=20
> obj-$(CONFIG_VPA_PMU) +=3D vpa-pmu.o
>=20
> +obj-$(CONFIG_KVM_BOOK3S_HV_PMU) +=3D kvm-hv-pmu.o
> +
> obj-$(CONFIG_PPC_8xx) +=3D 8xx-pmu.o
>=20
> obj-$(CONFIG_PPC64) +=3D $(obj64-y)
> diff --git a/arch/powerpc/perf/kvm-hv-pmu.c =
b/arch/powerpc/perf/kvm-hv-pmu.c
> new file mode 100644
> index 000000000000..c154f54e09e2
> --- /dev/null
> +++ b/arch/powerpc/perf/kvm-hv-pmu.c
> @@ -0,0 +1,138 @@
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
> + .module =3D THIS_MODULE,
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
> +static int __init kvmppc_register_pmu(void)
> +{
> + int rc =3D -EOPNOTSUPP;
> +
> + /* only support events for nestedv2 right now */
> + if (kvmhv_is_nestedv2()) {

We don=E2=80=99t need PVR check here ? Description of module says this =
is supported for power9 and later.
> + /* Setup done now register the PMU */
> + pr_info("Registering kvm-hv pmu");
> +
> + /* Register only if we arent already registered */
Not sure why we need this=E2=80=A6 Have you seen any issue without this =
? I don=E2=80=99t see any similar check in arch/powerpc/perf/vpa-pmu.c ,

> + rc =3D (kvmppc_pmu.type =3D=3D -1) ?
> +     perf_pmu_register(&kvmppc_pmu, kvmppc_pmu.name,
> +       -1) : 0;
> + }
> +
> + return rc;
> +}
> +
> +static void __exit kvmppc_unregister_pmu(void)
> +{
> + if (kvmhv_is_nestedv2()) {
> + if (kvmppc_pmu.type !=3D -1)
> + perf_pmu_unregister(&kvmppc_pmu);
> +
> + pr_info("kvmhv_pmu unregistered.\n");
> + }
> +}
> +
> +module_init(kvmppc_register_pmu);
> +module_exit(kvmppc_unregister_pmu);
> +MODULE_DESCRIPTION("KVM PPC Book3s-hv PMU");
> +MODULE_AUTHOR("Vaibhav Jain <vaibhav@linux.ibm.com>");
> +MODULE_LICENSE("GPL");
> --=20
> 2.48.1
>=20
>=20
>=20



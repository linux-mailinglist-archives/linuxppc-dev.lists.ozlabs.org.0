Return-Path: <linuxppc-dev+bounces-7228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3846DA6A249
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Mar 2025 10:15:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJKfj1MZ1z2yrN;
	Thu, 20 Mar 2025 20:15:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742462109;
	cv=none; b=iNVFg7dalnKGUbAUl9Scz+MY8R1ahp5dWIAj4R4ELkIChkFz8Gd7BVbEueUVZdJxYi2X207d0B2IxWHRhUiXnE32tMqL7hj7okG9X4IUsLMSYutyo+zDK81Fa+ywWP+pmB9hDS02nvr7gFwOvKHJc1oCUfKC7zgjuyYO8JsMIVT1xxW6uvJzyIr6Lc8RboqZ3S4AP/O4H9UjFqs3e+ADeybsyRoA0qldk9sNxElLHFglTuZSsNMKucZeC1qxMmo2KXB3UK9wwJVxhEOprng9GPoOh1jViP/f71C+FaFjKn/ys0uFp7EtKMepBaBZAZq/Sxx7Be+iyivTdWxnGu/o8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742462109; c=relaxed/relaxed;
	bh=9c2KsvgWRUAPh6owXxe+tla9TE3unmNvI9VT56yT0Os=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=MXuk0qzBwrndi8hjKeGoK4XpEwPr8nYPHM+JXXGyLQhB6783w6HZaHS97buCF0cWrDSgESWFayXgXTjRyfXQ1LsOTOZClfoH56MZh06/agAdcn3/Yl7AbZReVs7CyqtA3NO0CWdVqs+7d8UdCrCfTWX6tkSu9WNBpjz2+LenHsaE6wLBAFu1oOb7BEyDv+NnYNov52TNNJFobRtXZhl4cvrpp25QaKYOri3//tgrKlR5yULiSoId6k/TSL+oxJgTPU8gsS/GfJlEJXHMWo2VWehOH6/T4qR/TUVej963E3AJ9xIrkCuXDhzARyIJCi8OsbzPJ+FY4I0vD3AfFi4mQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QfpC0FH+; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=QfpC0FH+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJKfg5BzXz2ySW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 20:15:06 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52K7fQNe011884;
	Thu, 20 Mar 2025 09:14:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9c2Ksv
	gWRUAPh6owXxe+tla9TE3unmNvI9VT56yT0Os=; b=QfpC0FH+oLXEmDJ7ijoOC5
	X0+ZTGDj74UVPjiTFsRTDKhzyz0758mv6lVTNWW3Omqfjwu5nxLaTHHZXsMXgDrG
	6kZL7DR7T+1n0I0+5/1RPtHRkocQExjVCkjZYzq72bMlZNjyoTsawRlVgMVUYDqo
	lQJdvz75buqQlKu9ddtYBOJUuwBfhWNV9AkiEFYBEa0R8BCDpKvHlDRqILSclwtg
	TnX54T3lOXwTj8bojvQz8JTyAplpwfncHZWm3wX5luz88cGKIW9SUgUhKbPGvMVz
	xlR0V8gfuX7tAzNqLlvFSjqHkkLtkAYu/zkEklnxI2Wh+MBVqcQ3nJuGg7TeS72A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fwy25wf7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 09:14:58 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52K9EhAn032342;
	Thu, 20 Mar 2025 09:14:58 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45fwy25wf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 09:14:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52K85Xkm012350;
	Thu, 20 Mar 2025 09:14:57 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45dmvp72x0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Mar 2025 09:14:56 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52K9ErZt40829334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 20 Mar 2025 09:14:53 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1479C20043;
	Thu, 20 Mar 2025 09:14:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2374320040;
	Thu, 20 Mar 2025 09:14:45 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.250.131])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 20 Mar 2025 09:14:44 +0000 (GMT)
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
Subject: Re: [PATCH v5 6/6] powerpc/kvm-hv-pmu: Add perf-events for Hostwide
 counters
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <20250317100834.451452-7-vaibhav@linux.ibm.com>
Date: Thu, 20 Mar 2025 14:44:30 +0530
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B0FA3AB4-52CA-4DBB-8F7E-3838CB0F400F@linux.ibm.com>
References: <20250317100834.451452-1-vaibhav@linux.ibm.com>
 <20250317100834.451452-7-vaibhav@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vcMmGWK0zxr2Q04aSx4ooKAc3JvORBac
X-Proofpoint-GUID: 3FFBHcuvPudiFgRqQdh3EgPhbqmjLEj6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-20_03,2025-03-19_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 bulkscore=0 spamscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503200053
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 17 Mar 2025, at 3:38=E2=80=AFPM, Vaibhav Jain =
<vaibhav@linux.ibm.com> wrote:
>=20
> Update 'kvm-hv-pmu.c' to add five new perf-events mapped to the five
> Hostwide counters. Since these newly introduced perf events are at =
system
> wide scope and can be read from any L1-Lpar CPU, 'kvmppc_pmu' scope =
and
> capabilities are updated appropriately.
>=20
> Also introduce two new helpers. First is kvmppc_update_l0_stats() that =
uses
> the infrastructure introduced in previous patches to issues the
> H_GUEST_GET_STATE hcall L0-PowerVM to fetch guest-state-buffer holding =
the
> latest values of these counters which is then parsed and 'l0_stats'
> variable updated.
>=20
> Second helper is kvmppc_pmu_event_update() which is called from
> 'kvmppv_pmu' callbacks and uses kvmppc_update_l0_stats() to update
> 'l0_stats' and the update the 'struct perf_event's event-counter.
>=20
> Some minor updates to kvmppc_pmu_{add, del, read}() to remove some =
debug
> scaffolding code.
>=20
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>

Thanks Vaibhav for including the changes in V5. Changes looks good to me =
in patches for perf events.

Reviewed-by: Athira Rajeev <atrajeev@linux.ibm.com>

Thanks
Athira
> ---
> Changelog
>=20
> v4->v5:
> * Call kvmppc_pmu_event_update() during pmu's 'del()' callback [ =
Atheera ]
>=20
> v3->v4:
> * Minor tweaks to patch description and code as its now being built as =
a
> separate kernel module.
>=20
> v2->v3:
> None
>=20
> v1->v2:
> None
> ---
> arch/powerpc/perf/kvm-hv-pmu.c | 92 +++++++++++++++++++++++++++++++++-
> 1 file changed, 91 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/perf/kvm-hv-pmu.c =
b/arch/powerpc/perf/kvm-hv-pmu.c
> index 705be24ccb43..ae264c9080ef 100644
> --- a/arch/powerpc/perf/kvm-hv-pmu.c
> +++ b/arch/powerpc/perf/kvm-hv-pmu.c
> @@ -30,6 +30,11 @@
> #include "asm/guest-state-buffer.h"
>=20
> enum kvmppc_pmu_eventid {
> + KVMPPC_EVENT_HOST_HEAP,
> + KVMPPC_EVENT_HOST_HEAP_MAX,
> + KVMPPC_EVENT_HOST_PGTABLE,
> + KVMPPC_EVENT_HOST_PGTABLE_MAX,
> + KVMPPC_EVENT_HOST_PGTABLE_RECLAIM,
> KVMPPC_EVENT_MAX,
> };
>=20
> @@ -61,8 +66,14 @@ static DEFINE_SPINLOCK(lock_l0_stats);
> /* GSB related structs needed to talk to L0 */
> static struct kvmppc_gs_msg *gsm_l0_stats;
> static struct kvmppc_gs_buff *gsb_l0_stats;
> +static struct kvmppc_gs_parser gsp_l0_stats;
>=20
> static struct attribute *kvmppc_pmu_events_attr[] =3D {
> + KVMPPC_PMU_EVENT_ATTR(host_heap, KVMPPC_EVENT_HOST_HEAP),
> + KVMPPC_PMU_EVENT_ATTR(host_heap_max, KVMPPC_EVENT_HOST_HEAP_MAX),
> + KVMPPC_PMU_EVENT_ATTR(host_pagetable, KVMPPC_EVENT_HOST_PGTABLE),
> + KVMPPC_PMU_EVENT_ATTR(host_pagetable_max, =
KVMPPC_EVENT_HOST_PGTABLE_MAX),
> + KVMPPC_PMU_EVENT_ATTR(host_pagetable_reclaim, =
KVMPPC_EVENT_HOST_PGTABLE_RECLAIM),
> NULL,
> };
>=20
> @@ -71,7 +82,7 @@ static const struct attribute_group =
kvmppc_pmu_events_group =3D {
> .attrs =3D kvmppc_pmu_events_attr,
> };
>=20
> -PMU_FORMAT_ATTR(event, "config:0");
> +PMU_FORMAT_ATTR(event, "config:0-5");
> static struct attribute *kvmppc_pmu_format_attr[] =3D {
> &format_attr_event.attr,
> NULL,
> @@ -88,6 +99,79 @@ static const struct attribute_group =
*kvmppc_pmu_attr_groups[] =3D {
> NULL,
> };
>=20
> +/*
> + * Issue the hcall to get the L0-host stats.
> + * Should be called with l0-stat lock held
> + */
> +static int kvmppc_update_l0_stats(void)
> +{
> + int rc;
> +
> + /* With HOST_WIDE flags guestid and vcpuid will be ignored */
> + rc =3D kvmppc_gsb_recv(gsb_l0_stats, KVMPPC_GS_FLAGS_HOST_WIDE);
> + if (rc)
> + goto out;
> +
> + /* Parse the guest state buffer is successful */
> + rc =3D kvmppc_gse_parse(&gsp_l0_stats, gsb_l0_stats);
> + if (rc)
> + goto out;
> +
> + /* Update the l0 returned stats*/
> + memset(&l0_stats, 0, sizeof(l0_stats));
> + rc =3D kvmppc_gsm_refresh_info(gsm_l0_stats, gsb_l0_stats);
> +
> +out:
> + return rc;
> +}
> +
> +/* Update the value of the given perf_event */
> +static int kvmppc_pmu_event_update(struct perf_event *event)
> +{
> + int rc;
> + u64 curr_val, prev_val;
> + unsigned long flags;
> + unsigned int config =3D event->attr.config;
> +
> + /* Ensure no one else is modifying the l0_stats */
> + spin_lock_irqsave(&lock_l0_stats, flags);
> +
> + rc =3D kvmppc_update_l0_stats();
> + if (!rc) {
> + switch (config) {
> + case KVMPPC_EVENT_HOST_HEAP:
> + curr_val =3D l0_stats.guest_heap;
> + break;
> + case KVMPPC_EVENT_HOST_HEAP_MAX:
> + curr_val =3D l0_stats.guest_heap_max;
> + break;
> + case KVMPPC_EVENT_HOST_PGTABLE:
> + curr_val =3D l0_stats.guest_pgtable_size;
> + break;
> + case KVMPPC_EVENT_HOST_PGTABLE_MAX:
> + curr_val =3D l0_stats.guest_pgtable_size_max;
> + break;
> + case KVMPPC_EVENT_HOST_PGTABLE_RECLAIM:
> + curr_val =3D l0_stats.guest_pgtable_reclaim;
> + break;
> + default:
> + rc =3D -ENOENT;
> + break;
> + }
> + }
> +
> + spin_unlock_irqrestore(&lock_l0_stats, flags);
> +
> + /* If no error than update the perf event */
> + if (!rc) {
> + prev_val =3D local64_xchg(&event->hw.prev_count, curr_val);
> + if (curr_val > prev_val)
> + local64_add(curr_val - prev_val, &event->count);
> + }
> +
> + return rc;
> +}
> +
> static int kvmppc_pmu_event_init(struct perf_event *event)
> {
> unsigned int config =3D event->attr.config;
> @@ -110,15 +194,19 @@ static int kvmppc_pmu_event_init(struct =
perf_event *event)
>=20
> static void kvmppc_pmu_del(struct perf_event *event, int flags)
> {
> + kvmppc_pmu_event_update(event);
> }
>=20
> static int kvmppc_pmu_add(struct perf_event *event, int flags)
> {
> + if (flags & PERF_EF_START)
> + return kvmppc_pmu_event_update(event);
> return 0;
> }
>=20
> static void kvmppc_pmu_read(struct perf_event *event)
> {
> + kvmppc_pmu_event_update(event);
> }
>=20
> /* Return the size of the needed guest state buffer */
> @@ -302,6 +390,8 @@ static struct pmu kvmppc_pmu =3D {
> .read =3D kvmppc_pmu_read,
> .attr_groups =3D kvmppc_pmu_attr_groups,
> .type =3D -1,
> + .scope =3D PERF_PMU_SCOPE_SYS_WIDE,
> + .capabilities =3D PERF_PMU_CAP_NO_EXCLUDE | =
PERF_PMU_CAP_NO_INTERRUPT,
> };
>=20
> static int __init kvmppc_register_pmu(void)
> --=20
> 2.48.1
>=20



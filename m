Return-Path: <linuxppc-dev+bounces-6841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF65A58BB6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Mar 2025 06:40:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZB5MF5HhRz30WY;
	Mon, 10 Mar 2025 16:40:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741585209;
	cv=none; b=gzj6xmRvj6YhFHNph14PswbYnt8rfxpQ0wJSNOUmad33xxJKpflWa3b7Jhf6JDmPdGVevgnKZ+GkMim/pDJIu4uUbdlbEhEvNobt9H8S+wJUtXSrNtJGDpeQdoDUDxXuhU03lGF4JI5EB8piizoOzb3hr71wz4jjric0gfYFkTmLcNmF1xc2XxfMXEOSQofLR1/g/G5pD+6w7Dj0nATI/CsydMvtdwA6Ef4X+D6K8TblsjiTAKQbSuzhQ3ZjHLu8+inc9WjBghWinNKJtz51/4hF5DzV88v+c8+C14dzBScseHCcbC6OR0dLcYFTWjompVxiv2wpMYigwB1p1C7xnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741585209; c=relaxed/relaxed;
	bh=NvNkxA2vBwUrWThapNyrogTIsgp1aLvw31piLGhqoj8=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aYfP8wkVsViO8U+IZvFHjTBrlON6lmyebui+UjIWtLub0uCuGmpTPZfuoiBHuQEGrhiT7t68jdQT4vD4Xe8ca1vKtYgR/R8VoDYpO63d0ZEcXtcqt551TFNSaoDSYnXdPbfBoZmgc+0NneWYX3BC3JZ5Fpvk02fAWg9H29OjzCZE8oj4MuxEpoGE3asNd+3hP6kqoE23QHp/gU/zwBuDKBe/07/pdRn4cE7TJyn+FpEvy1uWeDPEAQIFzspx0xX+gTkdqnFyE7jo480lTO2DjUllMcsKX89/GJBuyNTVF/UkAO16QsgCrb0JWkrPxFzneText8sw2MqTOJuXhO866w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I/ND2V2T; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I/ND2V2T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZB5MD5nSnz2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Mar 2025 16:40:08 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 529Kpbhe003748;
	Mon, 10 Mar 2025 05:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=NvNkxA
	2vBwUrWThapNyrogTIsgp1aLvw31piLGhqoj8=; b=I/ND2V2TcjrxSj2q71/LXd
	kUTN3f8erJA93bmauzTgMyOqsW7jIAuATlBuZYSMrqNqEQgIUiUwge5u4pqzZqvX
	T8jt0ac0cNYpGxKe33sKmtlnx5G5BYF65QYlR7TZCoRPe3A3DUscuFOQOFwPnXxT
	q3TjTxHPoHIuhPpxm3+NYlgTLbRhqxFmwznNNVM17dwiW17jGgPmgImaNLeuI7V8
	E90ke1AsjNSaaDjcXlKX6FB2mr3wiH2Ak0TJO1+nDFgm2WIIPWv4J3CRod5idpig
	SqnOzco1YCcFMikaC1QO0fhT+s4KF+YKPbcCWMgpkeC7mGBNO75ObFzaymBk4sQA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459jd4sapv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 05:40:00 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52A5UA8H021977;
	Mon, 10 Mar 2025 05:40:00 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 459jd4sapt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 05:39:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52A2Ve3q027566;
	Mon, 10 Mar 2025 05:39:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4591qkcxrc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 05:39:59 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52A5dtGw51052920
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Mar 2025 05:39:55 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B3112004E;
	Mon, 10 Mar 2025 05:39:55 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A01DE20040;
	Mon, 10 Mar 2025 05:39:49 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.242.98])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 10 Mar 2025 05:39:49 +0000 (GMT)
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
Subject: Re: [PATCH v4 6/6] powerpc/kvm-hv-pmu: Add perf-events for Hostwide
 counters
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <20250224131522.77104-7-vaibhav@linux.ibm.com>
Date: Mon, 10 Mar 2025 11:09:35 +0530
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, gautam@linux.ibm.com, kconsul@linux.ibm.com,
        amachhiw@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <96795462-3AFA-4C90-9E63-ACB9AE3E66EE@linux.ibm.com>
References: <20250224131522.77104-1-vaibhav@linux.ibm.com>
 <20250224131522.77104-7-vaibhav@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rzxxiwsZ0KEdVAvSTqZyHlZvV-qDJf_S
X-Proofpoint-GUID: 0w6CuWq9lsc4T_AjV80394ktL7fvsOWw
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
> ---
> Changelog
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
> index ed371454f7b5..274459bb32d6 100644
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
> + /* Do nothing */
> }

If we don=E2=80=99t read the counter stats in =E2=80=9Cdel=E2=80=9D call =
back, we will loose the final count getting updated, right ?
Del callback needs to call kvmppc_pmu_read. Can you check the difference =
in count stats by calling kvmppc_pmu_read here ?

Thanks
Athira

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
>=20
>=20



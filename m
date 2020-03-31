Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CE2711996D2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 14:51:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s8My0mgvzDr3l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 23:51:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s8Bz44XvzDrBp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 23:43:39 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VCXn1S055448
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 08:43:36 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 303v2sqv6a-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 08:43:36 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <atrajeev@linux.vnet.ibm.com>;
 Tue, 31 Mar 2020 13:43:19 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Mar 2020 13:43:18 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02VCgSQ445744562
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 12:42:28 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0B72D42041;
 Tue, 31 Mar 2020 12:43:32 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F27742042;
 Tue, 31 Mar 2020 12:43:31 +0000 (GMT)
Received: from [9.199.41.176] (unknown [9.199.41.176])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 31 Mar 2020 12:43:31 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH] powerpc/perf: Add documentation around use of
 "ppc_set_pmu_inuse" in PMU core-book3s
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1585568332-11934-1-git-send-email-atrajeev@linux.vnet.ibm.com>
Date: Tue, 31 Mar 2020 18:13:29 +0530
Content-Transfer-Encoding: quoted-printable
References: <1585568332-11934-1-git-send-email-atrajeev@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20033112-0020-0000-0000-000003BEEE1B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033112-0021-0000-0000-000022178E8E
Message-Id: <805739BA-24F9-4E9D-953E-E0CC8801506C@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_04:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 adultscore=0 suspectscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310115
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
Cc: maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,=20

Please ignore this version as I messed up with the author information. I =
am sending a V2 with the proper author name.

Thanks
Athira

> On 30-Mar-2020, at 5:08 PM, Athira Rajeev =
<atrajeev@linux.vnet.ibm.com> wrote:
>=20
> "pmcregs_in_use" flag is part of lppaca (Virtual Process Area),
> which is used to indicate whether Performance Monitoring Unit (PMU) =
and
> PMU sprs are in-use and whether should it be saved/restored by
> hypervisor. ppc_set_pmu_inuse() is used to set/unset the VPA
> flag "pmcregs_in_use". "pmcregs_in_use" flag is set in
> "power_pmu_enable" via ppc_set_pmu_inuse(1) and it is unset
> when there are no active events (n_events =3D=3D 0 condition).
>=20
> Patch here adds documentation on the ppc_set_pmu_inuse() usage.
>=20
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> ---
> arch/powerpc/perf/core-book3s.c | 10 ++++++++++
> 1 file changed, 10 insertions(+)
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index 3086055..48bfdc9 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -1285,6 +1285,11 @@ static void power_pmu_enable(struct pmu *pmu)
> 		goto out;
>=20
> 	if (cpuhw->n_events =3D=3D 0) {
> +		/*
> +		 * Indicate PMU not in-use to Hypervisor.
> +		 * We end-up here via "ctx_sched_out()" from common code =
and
> +		 * "power_pmu_del()".
> +		 */
> 		ppc_set_pmu_inuse(0);
> 		goto out;
> 	}
> @@ -1341,6 +1346,11 @@ static void power_pmu_enable(struct pmu *pmu)
> 	 * Write the new configuration to MMCR* with the freeze
> 	 * bit set and set the hardware events to their initial values.
> 	 * Then unfreeze the events.
> +	 * ppc_set_pmu_inuse(1): "power_pmu_enable" will unset the
> +	 * "pmcregs_in_use" flag when a previous profiling/sampling =
session
> +	 * is completed and un-setting of flag will notify the =
Hypervisor to
> +	 * drop save/restore of PMU sprs. Now that PMU need to be =
enabled, first
> +	 * set the "pmcregs_in_use" flag in VPA.
> 	 */
> 	ppc_set_pmu_inuse(1);
> 	mtspr(SPRN_MMCRA, cpuhw->mmcr[2] & ~MMCRA_SAMPLE_ENABLE);
> --=20
> 1.8.3.1
>=20


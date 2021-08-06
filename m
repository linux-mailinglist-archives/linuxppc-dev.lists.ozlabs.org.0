Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF953E2748
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 11:31:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh0bh35Fcz3cPF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 19:31:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ObmAuoNA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ObmAuoNA; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh0b86ljtz309r
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 19:31:00 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17692oiH015442; Fri, 6 Aug 2021 05:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=4s7oqlwn9w3rtTW7J2kUZb7HP6PQ79F4aMAitgNN7O0=;
 b=ObmAuoNAM7LfSdSeK34gTf2y9rzRDm+SrQZaSWdUxQn39+Bz10Ywfb0N5rogImvEKs7R
 AavWHBufBVSSTCepuXXpiHNkFMjwGm/N1YrzWItk/8o162hyleYQRJqh5WTV2agX7m6W
 hCfyIINdVUEPeaaMfJAIYhD1hW4/IBU6BSueKTsUbYMDewwTuM8fTUzJstJWYvM89feb
 9TYgObY2HJC5xSLgo67jxQbDw+l9LDZjJEtKmuR6oRAgitSG7DNlEMmUMmeoPcpEj9oq
 Z65GLqoBaV44AL8ICvbnyF3PnXUBjhe45eMbVeyJ8aQsv5s7Z3sY2iJwELvMktKjVA9A Ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a859dww78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 05:30:57 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17692vBI015892;
 Fri, 6 Aug 2021 05:30:57 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3a859dww6m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 05:30:56 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1769Mhpc010160;
 Fri, 6 Aug 2021 09:30:55 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma02fra.de.ibm.com with ESMTP id 3a4x58ukx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 06 Aug 2021 09:30:55 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1769UqTa52494652
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 6 Aug 2021 09:30:52 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C26FFA406A;
 Fri,  6 Aug 2021 09:30:52 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DC4A6A4068;
 Fri,  6 Aug 2021 09:30:51 +0000 (GMT)
Received: from [9.195.43.159] (unknown [9.195.43.159])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  6 Aug 2021 09:30:51 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.6\))
Subject: Re: [PATCH v1 16/55] powerpc/64s: Implement PMU override command line
 option
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <20210726035036.739609-17-npiggin@gmail.com>
Date: Fri, 6 Aug 2021 14:58:36 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <4600EC62-5505-4856-AE23-939ED62287B3@linux.vnet.ibm.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-17-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3608.120.23.2.6)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Cssd7fdc2k171g_7OndDAy1JWYpQ-1QM
X-Proofpoint-ORIG-GUID: 7UJt4491db0EiiISZk6mPa2oF_53EwLA
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-06_02:2021-08-05,
 2021-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=999
 clxscore=1011 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0
 mlxscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060063
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 26-Jul-2021, at 9:19 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> It can be useful in simulators (with very constrained environments)
> to allow some PMCs to run from boot so they can be sampled directly
> by a test harness, rather than having to run perf.
>=20
> A previous change freezes counters at boot by default, so provide
> a boot time option to un-freeze (plus a bit more flexibility).
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> .../admin-guide/kernel-parameters.txt         |  7 ++++
> arch/powerpc/perf/core-book3s.c               | 35 +++++++++++++++++++
> 2 files changed, 42 insertions(+)
>=20
> diff --git a/Documentation/admin-guide/kernel-parameters.txt =
b/Documentation/admin-guide/kernel-parameters.txt
> index bdb22006f713..96b7d0ebaa40 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -4089,6 +4089,13 @@
> 			Override pmtimer IOPort with a hex value.
> 			e.g. pmtmr=3D0x508
>=20
> +	pmu=3D		[PPC] Manually enable the PMU.
> +			Enable the PMU by setting MMCR0 to 0 (clear FC =
bit).
> +			This option is implemented for Book3S =
processors.
> +			If a number is given, then MMCR1 is set to that =
number,
> +			otherwise (e.g., 'pmu=3Don'), it is left 0. The =
perf
> +			subsystem is disabled if this option is used.
> +
> 	pm_debug_messages	[SUSPEND,KNL]
> 			Enable suspend/resume debug messages during boot =
up.
>=20
> diff --git a/arch/powerpc/perf/core-book3s.c =
b/arch/powerpc/perf/core-book3s.c
> index 65795cadb475..e7cef4fe17d7 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2428,8 +2428,24 @@ int register_power_pmu(struct power_pmu *pmu)
> }
>=20
> #ifdef CONFIG_PPC64
> +static bool pmu_override =3D false;
> +static unsigned long pmu_override_val;
> +static void do_pmu_override(void *data)
> +{
> +	ppc_set_pmu_inuse(1);
> +	if (pmu_override_val)
> +		mtspr(SPRN_MMCR1, pmu_override_val);
> +	mtspr(SPRN_MMCR0, mfspr(SPRN_MMCR0) & ~MMCR0_FC);

Hi Nick

Here, we are not doing any validity check for the value used to set =
MMCR1.=20
For advanced users, the option to pass value for MMCR1 is fine. But =
other cases, it could result in
invalid event getting used. Do we need to restrict this boot time option =
for only PMC5/6 ?
=20
Thanks
Athira

> +}
> +
> static int __init init_ppc64_pmu(void)
> {
> +	if (cpu_has_feature(CPU_FTR_HVMODE) && pmu_override) {
> +		printk(KERN_WARNING "perf: disabling perf due to pmu=3D =
command line option.\n");
> +		on_each_cpu(do_pmu_override, NULL, 1);
> +		return 0;
> +	}
> +
> 	/* run through all the pmu drivers one at a time */
> 	if (!init_power5_pmu())
> 		return 0;
> @@ -2451,4 +2467,23 @@ static int __init init_ppc64_pmu(void)
> 		return init_generic_compat_pmu();
> }
> early_initcall(init_ppc64_pmu);
> +
> +static int __init pmu_setup(char *str)
> +{
> +	unsigned long val;
> +
> +	if (!early_cpu_has_feature(CPU_FTR_HVMODE))
> +		return 0;
> +
> +	pmu_override =3D true;
> +
> +	if (kstrtoul(str, 0, &val))
> +		val =3D 0;
> +
> +	pmu_override_val =3D val;
> +
> +	return 1;
> +}
> +__setup("pmu=3D", pmu_setup);
> +
> #endif
> --=20
> 2.23.0
>=20


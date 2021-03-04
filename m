Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ACA332CCBB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 07:23:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drgll3nPzz3d3B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 17:22:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jgn2M4eN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jgn2M4eN; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drd5f3tLTz3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 15:23:17 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1244HuoU196332; Wed, 3 Mar 2021 23:23:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : message-id :
 content-type : mime-version : subject : date : in-reply-to : cc : to :
 references; s=pp1; bh=b+I4/2qeloBarrjp1XSOuv1piQZv43S/iWXxWxSPxTs=;
 b=jgn2M4eNiOZ9ZFoUbdwpgbQrbTWY5S3MPm/CTlnsAmjRnVjDyynjgeK6HAV21uzJs+gc
 yszSQTIDLEW8dEcy8L/bvhVJxfz/NCXat4GN1HMiNFQ2IHUt8pZS02vxf483cjzx/kNd
 xTPuuukA8TwRrlEPdBg4Eku5SO4t90BjnPB8oSrKsshgRFeU+IU6La3zQCRYOjR7u3jX
 7Me5PpIW52au68rOM6oi0RkSCPr8Ht8ya09GrhxY0+tm2rsTujoL0GTEGZIKpj4LAzzx
 9nr+TI/L3PSgGNp6wFJVjMoBj2iDW1Rv+bzFjK7Q6RoeGbdr9UgP5FTQaBLvWP/f/6FL wQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372rdcr36s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 23:23:00 -0500
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1244IOXP001937;
 Wed, 3 Mar 2021 23:22:59 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372rdcr367-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 03 Mar 2021 23:22:59 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1244Hd6U026466;
 Thu, 4 Mar 2021 04:22:57 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3712fmjcbf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 04:22:56 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1244MetD34865540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Mar 2021 04:22:40 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1AD2A405B;
 Thu,  4 Mar 2021 04:22:54 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47246A405F;
 Thu,  4 Mar 2021 04:22:51 +0000 (GMT)
Received: from [9.195.43.172] (unknown [9.195.43.172])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  4 Mar 2021 04:22:50 +0000 (GMT)
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Message-Id: <7113CD76-5BAD-45B9-9C08-6E3BDF80786F@linux.vnet.ibm.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_1AF8466C-6531-4534-9627-5B34C86B1428"
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [PATCH v3 1/2] powerpc/perf: Use PVR rather than oprofile field
 to determine CPU version
Date: Thu, 4 Mar 2021 09:52:48 +0530
In-Reply-To: <50ad16925a66ac53890286ceafbf84f6fc324baa.1614600516.git.christophe.leroy@csgroup.eu>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <50ad16925a66ac53890286ceafbf84f6fc324baa.1614600516.git.christophe.leroy@csgroup.eu>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_01:2021-03-03,
 2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 mlxscore=0 spamscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 clxscore=1011 suspectscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103040014
X-Mailman-Approved-At: Thu, 04 Mar 2021 17:22:34 +1100
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
Cc: "Desnes A. Nunes do Rosario" <desnesn@linux.ibm.com>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Rashmica Gupta <rashmica.g@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Apple-Mail=_1AF8466C-6531-4534-9627-5B34C86B1428
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> On 01-Mar-2021, at 5:39 PM, Christophe Leroy =
<christophe.leroy@csgroup.eu> wrote:
>=20
> From: Rashmica Gupta <rashmica.g@gmail.com>
>=20
> Currently the perf CPU backend drivers detect what CPU they're on =
using
> cur_cpu_spec->oprofile_cpu_type.
>=20
> Although that works, it's a bit crufty to be using oprofile related =
fields,
> especially seeing as oprofile is more or less unused these days.
>=20
> It also means perf is reliant on the fragile logic in setup_cpu_spec()
> which detects when we're using a logical PVR and copies back the PMU
> related fields from the raw CPU entry. So lets check the PVR directly.
>=20
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> [chleroy: Added power10 and fixed checkpatch issues]
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Reviewed-and-tested-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com =
<mailto:atrajeev@linux.vnet.ibm.com>>

Thanks
Athira
> ---
> arch/powerpc/perf/e500-pmu.c    | 9 +++++----
> arch/powerpc/perf/e6500-pmu.c   | 5 +++--
> arch/powerpc/perf/hv-24x7.c     | 6 +++---
> arch/powerpc/perf/mpc7450-pmu.c | 5 +++--
> arch/powerpc/perf/power10-pmu.c | 6 ++----
> arch/powerpc/perf/power5+-pmu.c | 6 +++---
> arch/powerpc/perf/power5-pmu.c  | 5 +++--
> arch/powerpc/perf/power6-pmu.c  | 5 +++--
> arch/powerpc/perf/power7-pmu.c  | 7 ++++---
> arch/powerpc/perf/power8-pmu.c  | 5 +++--
> arch/powerpc/perf/power9-pmu.c  | 4 +---
> arch/powerpc/perf/ppc970-pmu.c  | 7 ++++---
> 12 files changed, 37 insertions(+), 33 deletions(-)
>=20
> diff --git a/arch/powerpc/perf/e500-pmu.c =
b/arch/powerpc/perf/e500-pmu.c
> index a59c33bed32a..e3e1a68eb1d5 100644
> --- a/arch/powerpc/perf/e500-pmu.c
> +++ b/arch/powerpc/perf/e500-pmu.c
> @@ -118,12 +118,13 @@ static struct fsl_emb_pmu e500_pmu =3D {
>=20
> static int init_e500_pmu(void)
> {
> -	if (!cur_cpu_spec->oprofile_cpu_type)
> -		return -ENODEV;
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
>=20
> -	if (!strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/e500mc"))
> +	/* ec500mc */
> +	if (PVR_VER(pvr) =3D=3D PVR_VER_E500MC || PVR_VER(pvr) =3D=3D =
PVR_VER_E5500)
> 		num_events =3D 256;
> -	else if (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/e500"))
> +	/* e500 */
> +	else if (PVR_VER(pvr) !=3D PVR_VER_E500V1 && PVR_VER(pvr) !=3D =
PVR_VER_E500V2)
> 		return -ENODEV;
>=20
> 	return register_fsl_emb_pmu(&e500_pmu);
> diff --git a/arch/powerpc/perf/e6500-pmu.c =
b/arch/powerpc/perf/e6500-pmu.c
> index 44ad65da82ed..bd779a2338f8 100644
> --- a/arch/powerpc/perf/e6500-pmu.c
> +++ b/arch/powerpc/perf/e6500-pmu.c
> @@ -107,8 +107,9 @@ static struct fsl_emb_pmu e6500_pmu =3D {
>=20
> static int init_e6500_pmu(void)
> {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -		strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/e6500"))
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) !=3D PVR_VER_E6500)
> 		return -ENODEV;
>=20
> 	return register_fsl_emb_pmu(&e6500_pmu);
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index e5eb33255066..f3f2472fa1c6 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -1718,16 +1718,16 @@ static int hv_24x7_init(void)
> {
> 	int r;
> 	unsigned long hret;
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
> 	struct hv_perf_caps caps;
>=20
> 	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
> 		pr_debug("not a virtualized system, not enabling\n");
> 		return -ENODEV;
> -	} else if (!cur_cpu_spec->oprofile_cpu_type)
> -		return -ENODEV;
> +	}
>=20
> 	/* POWER8 only supports v1, while POWER9 only supports v2. */
> -	if (!strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power8"))
> +	if (PVR_VER(pvr) =3D=3D PVR_POWER8)
> 		interface_version =3D 1;
> 	else {
> 		interface_version =3D 2;
> diff --git a/arch/powerpc/perf/mpc7450-pmu.c =
b/arch/powerpc/perf/mpc7450-pmu.c
> index e39b15b79a83..552d51a925d3 100644
> --- a/arch/powerpc/perf/mpc7450-pmu.c
> +++ b/arch/powerpc/perf/mpc7450-pmu.c
> @@ -417,8 +417,9 @@ struct power_pmu mpc7450_pmu =3D {
>=20
> static int __init init_mpc7450_pmu(void)
> {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/7450"))
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) !=3D PVR_7450)
> 		return -ENODEV;
>=20
> 	return register_power_pmu(&mpc7450_pmu);
> diff --git a/arch/powerpc/perf/power10-pmu.c =
b/arch/powerpc/perf/power10-pmu.c
> index a901c1348cad..d1395844a329 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -566,12 +566,10 @@ int init_power10_pmu(void)
> 	unsigned int pvr;
> 	int rc;
>=20
> -	/* Comes from cpu_specs[] */
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power10"))
> +	pvr =3D mfspr(SPRN_PVR);
> +	if (PVR_VER(pvr) !=3D PVR_POWER10)
> 		return -ENODEV;
>=20
> -	pvr =3D mfspr(SPRN_PVR);
> 	/* Add the ppmu flag for power10 DD1 */
> 	if ((PVR_CFG(pvr) =3D=3D 1))
> 		power10_pmu.flags |=3D PPMU_P10_DD1;
> diff --git a/arch/powerpc/perf/power5+-pmu.c =
b/arch/powerpc/perf/power5+-pmu.c
> index 18732267993a..a79eae40ef6d 100644
> --- a/arch/powerpc/perf/power5+-pmu.c
> +++ b/arch/powerpc/perf/power5+-pmu.c
> @@ -679,9 +679,9 @@ static struct power_pmu power5p_pmu =3D {
>=20
> int init_power5p_pmu(void)
> {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5+")
> -	     && strcmp(cur_cpu_spec->oprofile_cpu_type, =
"ppc64/power5++")))
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) !=3D PVR_POWER5p)
> 		return -ENODEV;
>=20
> 	return register_power_pmu(&power5p_pmu);
> diff --git a/arch/powerpc/perf/power5-pmu.c =
b/arch/powerpc/perf/power5-pmu.c
> index cb611c1e7abe..35a9d7f3b4b9 100644
> --- a/arch/powerpc/perf/power5-pmu.c
> +++ b/arch/powerpc/perf/power5-pmu.c
> @@ -620,8 +620,9 @@ static struct power_pmu power5_pmu =3D {
>=20
> int init_power5_pmu(void)
> {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5"))
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) !=3D PVR_POWER5)
> 		return -ENODEV;
>=20
> 	return register_power_pmu(&power5_pmu);
> diff --git a/arch/powerpc/perf/power6-pmu.c =
b/arch/powerpc/perf/power6-pmu.c
> index 69ef38216418..8aa220c712a7 100644
> --- a/arch/powerpc/perf/power6-pmu.c
> +++ b/arch/powerpc/perf/power6-pmu.c
> @@ -541,8 +541,9 @@ static struct power_pmu power6_pmu =3D {
>=20
> int init_power6_pmu(void)
> {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power6"))
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) !=3D PVR_POWER6)
> 		return -ENODEV;
>=20
> 	return register_power_pmu(&power6_pmu);
> diff --git a/arch/powerpc/perf/power7-pmu.c =
b/arch/powerpc/perf/power7-pmu.c
> index 894c17f9a762..ca7373143b02 100644
> --- a/arch/powerpc/perf/power7-pmu.c
> +++ b/arch/powerpc/perf/power7-pmu.c
> @@ -447,11 +447,12 @@ static struct power_pmu power7_pmu =3D {
>=20
> int init_power7_pmu(void)
> {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power7"))
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) !=3D PVR_POWER7 && PVR_VER(pvr) !=3D =
PVR_POWER7p)
> 		return -ENODEV;
>=20
> -	if (pvr_version_is(PVR_POWER7p))
> +	if (PVR_VER(pvr) =3D=3D PVR_POWER7p)
> 		power7_pmu.flags |=3D PPMU_SIAR_VALID;
>=20
> 	return register_power_pmu(&power7_pmu);
> diff --git a/arch/powerpc/perf/power8-pmu.c =
b/arch/powerpc/perf/power8-pmu.c
> index 5282e8415ddf..5a396ba8bf58 100644
> --- a/arch/powerpc/perf/power8-pmu.c
> +++ b/arch/powerpc/perf/power8-pmu.c
> @@ -381,9 +381,10 @@ static struct power_pmu power8_pmu =3D {
> int init_power8_pmu(void)
> {
> 	int rc;
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
>=20
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power8"))
> +	if (PVR_VER(pvr) !=3D PVR_POWER8E && PVR_VER(pvr) !=3D =
PVR_POWER8NVL &&
> +	    PVR_VER(pvr) !=3D PVR_POWER8)
> 		return -ENODEV;
>=20
> 	rc =3D register_power_pmu(&power8_pmu);
> diff --git a/arch/powerpc/perf/power9-pmu.c =
b/arch/powerpc/perf/power9-pmu.c
> index 2a57e93a79dc..28ba1e98f93d 100644
> --- a/arch/powerpc/perf/power9-pmu.c
> +++ b/arch/powerpc/perf/power9-pmu.c
> @@ -444,9 +444,7 @@ int init_power9_pmu(void)
> 	int rc =3D 0;
> 	unsigned int pvr =3D mfspr(SPRN_PVR);
>=20
> -	/* Comes from cpu_specs[] */
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power9"))
> +	if (PVR_VER(pvr) !=3D PVR_POWER9)
> 		return -ENODEV;
>=20
> 	/* Blacklist events */
> diff --git a/arch/powerpc/perf/ppc970-pmu.c =
b/arch/powerpc/perf/ppc970-pmu.c
> index 1f8263785286..39a0a4d7841c 100644
> --- a/arch/powerpc/perf/ppc970-pmu.c
> +++ b/arch/powerpc/perf/ppc970-pmu.c
> @@ -491,9 +491,10 @@ static struct power_pmu ppc970_pmu =3D {
>=20
> int init_ppc970_pmu(void)
> {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/970")
> -	     && strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/970MP")))
> +	unsigned int pvr =3D mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) !=3D PVR_970 && PVR_VER(pvr) !=3D PVR_970MP &&
> +	    PVR_VER(pvr) !=3D PVR_970FX && PVR_VER(pvr) !=3D PVR_970GX)
> 		return -ENODEV;
>=20
> 	return register_power_pmu(&ppc970_pmu);
> --=20
> 2.25.0
>=20


--Apple-Mail=_1AF8466C-6531-4534-9627-5B34C86B1428
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 01-Mar-2021, at 5:39 PM, Christophe Leroy &lt;<a =
href=3D"mailto:christophe.leroy@csgroup.eu" =
class=3D"">christophe.leroy@csgroup.eu</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">From: =
Rashmica Gupta &lt;<a href=3D"mailto:rashmica.g@gmail.com" =
class=3D"">rashmica.g@gmail.com</a>&gt;<br class=3D""><br =
class=3D"">Currently the perf CPU backend drivers detect what CPU =
they're on using<br class=3D"">cur_cpu_spec-&gt;oprofile_cpu_type.<br =
class=3D""><br class=3D"">Although that works, it's a bit crufty to be =
using oprofile related fields,<br class=3D"">especially seeing as =
oprofile is more or less unused these days.<br class=3D""><br =
class=3D"">It also means perf is reliant on the fragile logic in =
setup_cpu_spec()<br class=3D"">which detects when we're using a logical =
PVR and copies back the PMU<br class=3D"">related fields from the raw =
CPU entry. So lets check the PVR directly.<br class=3D""><br =
class=3D"">Suggested-by: Michael Ellerman &lt;<a =
href=3D"mailto:mpe@ellerman.id.au" =
class=3D"">mpe@ellerman.id.au</a>&gt;<br class=3D"">Signed-off-by: =
Rashmica Gupta &lt;<a href=3D"mailto:rashmica.g@gmail.com" =
class=3D"">rashmica.g@gmail.com</a>&gt;<br class=3D"">Reviewed-by: =
Madhavan Srinivasan &lt;<a href=3D"mailto:maddy@linux.vnet.ibm.com" =
class=3D"">maddy@linux.vnet.ibm.com</a>&gt;<br class=3D"">[chleroy: =
Added power10 and fixed checkpatch issues]<br class=3D"">Signed-off-by: =
Christophe Leroy &lt;<a href=3D"mailto:christophe.leroy@csgroup.eu" =
class=3D"">christophe.leroy@csgroup.eu</a>&gt;<br =
class=3D""></div></div></blockquote><div><br class=3D""></div><span =
style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);" =
class=3D"">Reviewed-and-tested-by: Athira Rajeev &lt;<a =
href=3D"mailto:atrajeev@linux.vnet.ibm.com" =
class=3D"">atrajeev@linux.vnet.ibm.com</a>&gt;</span></div><div><font =
color=3D"#000000" class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D""><br class=3D""></span></font></div><div><font color=3D"#000000"=
 class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" =
class=3D"">Thanks</span></font></div><div><font color=3D"#000000" =
class=3D""><span style=3D"caret-color: rgb(0, 0, 0);" class=3D"">Athira<br=
 class=3D""></span></font><blockquote type=3D"cite" class=3D""><div =
class=3D""><div class=3D"">---<br class=3D""> =
arch/powerpc/perf/e500-pmu.c &nbsp;&nbsp;&nbsp;| 9 +++++----<br =
class=3D""> arch/powerpc/perf/e6500-pmu.c &nbsp;&nbsp;| 5 +++--<br =
class=3D""> arch/powerpc/perf/hv-24x7.c &nbsp;&nbsp;&nbsp;&nbsp;| 6 =
+++---<br class=3D""> arch/powerpc/perf/mpc7450-pmu.c | 5 +++--<br =
class=3D""> arch/powerpc/perf/power10-pmu.c | 6 ++----<br class=3D""> =
arch/powerpc/perf/power5+-pmu.c | 6 +++---<br class=3D""> =
arch/powerpc/perf/power5-pmu.c &nbsp;| 5 +++--<br class=3D""> =
arch/powerpc/perf/power6-pmu.c &nbsp;| 5 +++--<br class=3D""> =
arch/powerpc/perf/power7-pmu.c &nbsp;| 7 ++++---<br class=3D""> =
arch/powerpc/perf/power8-pmu.c &nbsp;| 5 +++--<br class=3D""> =
arch/powerpc/perf/power9-pmu.c &nbsp;| 4 +---<br class=3D""> =
arch/powerpc/perf/ppc970-pmu.c &nbsp;| 7 ++++---<br class=3D""> 12 files =
changed, 37 insertions(+), 33 deletions(-)<br class=3D""><br =
class=3D"">diff --git a/arch/powerpc/perf/e500-pmu.c =
b/arch/powerpc/perf/e500-pmu.c<br class=3D"">index =
a59c33bed32a..e3e1a68eb1d5 100644<br class=3D"">--- =
a/arch/powerpc/perf/e500-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/e500-pmu.c<br class=3D"">@@ -118,12 +118,13 @@ =
static struct fsl_emb_pmu e500_pmu =3D {<br class=3D""><br class=3D""> =
static int init_e500_pmu(void)<br class=3D""> {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type)<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
-ENODEV;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned int pvr =3D =
mfspr(SPRN_PVR);<br class=3D""><br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, "ppc/e500mc"))<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* ec500mc */<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (PVR_VER(pvr) =3D=3D =
PVR_VER_E500MC || PVR_VER(pvr) =3D=3D PVR_VER_E5500)<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>num_events =3D 256;<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>else if =
(strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, "ppc/e500"))<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* e500 */<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>else if (PVR_VER(pvr) !=3D =
PVR_VER_E500V1 &amp;&amp; PVR_VER(pvr) !=3D PVR_VER_E500V2)<br class=3D"">=
 <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return -ENODEV;<br class=3D""><br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
register_fsl_emb_pmu(&amp;e500_pmu);<br class=3D"">diff --git =
a/arch/powerpc/perf/e6500-pmu.c b/arch/powerpc/perf/e6500-pmu.c<br =
class=3D"">index 44ad65da82ed..bd779a2338f8 100644<br class=3D"">--- =
a/arch/powerpc/perf/e6500-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/e6500-pmu.c<br class=3D"">@@ -107,8 +107,9 @@ static =
struct fsl_emb_pmu e6500_pmu =3D {<br class=3D""><br class=3D""> static =
int init_e6500_pmu(void)<br class=3D""> {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, "ppc/e6500"))<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>unsigned int pvr =3D mfspr(SPRN_PVR);<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (PVR_VER(pvr) !=3D PVR_VER_E6500)<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
-ENODEV;<br class=3D""><br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return =
register_fsl_emb_pmu(&amp;e6500_pmu);<br class=3D"">diff --git =
a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c<br =
class=3D"">index e5eb33255066..f3f2472fa1c6 100644<br class=3D"">--- =
a/arch/powerpc/perf/hv-24x7.c<br class=3D"">+++ =
b/arch/powerpc/perf/hv-24x7.c<br class=3D"">@@ -1718,16 +1718,16 @@ =
static int hv_24x7_init(void)<br class=3D""> {<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>int r;<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>unsigned long hret;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned int pvr =3D =
mfspr(SPRN_PVR);<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>struct hv_perf_caps caps;<br =
class=3D""><br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if =
(!firmware_has_feature(FW_FEATURE_LPAR)) {<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>pr_debug("not a virtualized system, not enabling\n");<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return -ENODEV;<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>} else if =
(!cur_cpu_spec-&gt;oprofile_cpu_type)<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
-ENODEV;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>}<br class=3D""><br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* POWER8 only supports v1, while POWER9 only supports v2. */<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (!strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc64/power8"))<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (PVR_VER(pvr) =3D=3D =
PVR_POWER8)<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>interface_version =3D 1;<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>else {<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>interface_version =3D 2;<br =
class=3D"">diff --git a/arch/powerpc/perf/mpc7450-pmu.c =
b/arch/powerpc/perf/mpc7450-pmu.c<br class=3D"">index =
e39b15b79a83..552d51a925d3 100644<br class=3D"">--- =
a/arch/powerpc/perf/mpc7450-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/mpc7450-pmu.c<br class=3D"">@@ -417,8 +417,9 @@ =
struct power_pmu mpc7450_pmu =3D {<br class=3D""><br class=3D""> static =
int __init init_mpc7450_pmu(void)<br class=3D""> {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc/7450"))<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned int pvr =3D =
mfspr(SPRN_PVR);<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(PVR_VER(pvr) !=3D PVR_7450)<br class=3D""> <span class=3D"Apple-tab-span"=
 style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return -ENODEV;<br class=3D""><br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return register_power_pmu(&amp;mpc7450_pmu);<br class=3D"">diff =
--git a/arch/powerpc/perf/power10-pmu.c =
b/arch/powerpc/perf/power10-pmu.c<br class=3D"">index =
a901c1348cad..d1395844a329 100644<br class=3D"">--- =
a/arch/powerpc/perf/power10-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power10-pmu.c<br class=3D"">@@ -566,12 +566,10 @@ =
int init_power10_pmu(void)<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned int pvr;<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>int rc;<br class=3D""><br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>/* Comes =
from cpu_specs[] */<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc64/power10"))<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>pvr =3D mfspr(SPRN_PVR);<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (PVR_VER(pvr) !=3D PVR_POWER10)<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
-ENODEV;<br class=3D""><br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>pvr =3D mfspr(SPRN_PVR);<br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* Add the ppmu flag for power10 DD1 */<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
((PVR_CFG(pvr) =3D=3D 1))<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>power10_pmu.flags |=3D =
PPMU_P10_DD1;<br class=3D"">diff --git a/arch/powerpc/perf/power5+-pmu.c =
b/arch/powerpc/perf/power5+-pmu.c<br class=3D"">index =
18732267993a..a79eae40ef6d 100644<br class=3D"">--- =
a/arch/powerpc/perf/power5+-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power5+-pmu.c<br class=3D"">@@ -679,9 +679,9 @@ =
static struct power_pmu power5p_pmu =3D {<br class=3D""><br class=3D""> =
int init_power5p_pmu(void)<br class=3D""> {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;(strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc64/power5+")<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp; =
strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, "ppc64/power5++")))<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>unsigned int pvr =3D mfspr(SPRN_PVR);<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (PVR_VER(pvr) !=3D PVR_POWER5p)<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
-ENODEV;<br class=3D""><br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return =
register_power_pmu(&amp;power5p_pmu);<br class=3D"">diff --git =
a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c<br =
class=3D"">index cb611c1e7abe..35a9d7f3b4b9 100644<br class=3D"">--- =
a/arch/powerpc/perf/power5-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power5-pmu.c<br class=3D"">@@ -620,8 +620,9 @@ =
static struct power_pmu power5_pmu =3D {<br class=3D""><br class=3D""> =
int init_power5_pmu(void)<br class=3D""> {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc64/power5"))<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned int pvr =3D =
mfspr(SPRN_PVR);<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(PVR_VER(pvr) !=3D PVR_POWER5)<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
-ENODEV;<br class=3D""><br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return =
register_power_pmu(&amp;power5_pmu);<br class=3D"">diff --git =
a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c<br =
class=3D"">index 69ef38216418..8aa220c712a7 100644<br class=3D"">--- =
a/arch/powerpc/perf/power6-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power6-pmu.c<br class=3D"">@@ -541,8 +541,9 @@ =
static struct power_pmu power6_pmu =3D {<br class=3D""><br class=3D""> =
int init_power6_pmu(void)<br class=3D""> {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc64/power6"))<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned int pvr =3D =
mfspr(SPRN_PVR);<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(PVR_VER(pvr) !=3D PVR_POWER6)<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
-ENODEV;<br class=3D""><br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return =
register_power_pmu(&amp;power6_pmu);<br class=3D"">diff --git =
a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c<br =
class=3D"">index 894c17f9a762..ca7373143b02 100644<br class=3D"">--- =
a/arch/powerpc/perf/power7-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power7-pmu.c<br class=3D"">@@ -447,11 +447,12 @@ =
static struct power_pmu power7_pmu =3D {<br class=3D""><br class=3D""> =
int init_power7_pmu(void)<br class=3D""> {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc64/power7"))<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned int pvr =3D =
mfspr(SPRN_PVR);<br class=3D"">+<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(PVR_VER(pvr) !=3D PVR_POWER7 &amp;&amp; PVR_VER(pvr) !=3D =
PVR_POWER7p)<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return -ENODEV;<br class=3D""><br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (pvr_version_is(PVR_POWER7p))<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(PVR_VER(pvr) =3D=3D PVR_POWER7p)<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>power7_pmu.flags |=3D PPMU_SIAR_VALID;<br class=3D""><br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return register_power_pmu(&amp;power7_pmu);<br class=3D"">diff =
--git a/arch/powerpc/perf/power8-pmu.c =
b/arch/powerpc/perf/power8-pmu.c<br class=3D"">index =
5282e8415ddf..5a396ba8bf58 100644<br class=3D"">--- =
a/arch/powerpc/perf/power8-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power8-pmu.c<br class=3D"">@@ -381,9 +381,10 @@ =
static struct power_pmu power8_pmu =3D {<br class=3D""> int =
init_power8_pmu(void)<br class=3D""> {<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>int =
rc;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>unsigned int pvr =3D =
mfspr(SPRN_PVR);<br class=3D""><br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc64/power8"))<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (PVR_VER(pvr) !=3D PVR_POWER8E =
&amp;&amp; PVR_VER(pvr) !=3D PVR_POWER8NVL &amp;&amp;<br class=3D"">+<span=
 class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;PVR_VER(pvr) !=3D PVR_POWER8)<br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
-ENODEV;<br class=3D""><br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>rc =3D =
register_power_pmu(&amp;power8_pmu);<br class=3D"">diff --git =
a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c<br =
class=3D"">index 2a57e93a79dc..28ba1e98f93d 100644<br class=3D"">--- =
a/arch/powerpc/perf/power9-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/power9-pmu.c<br class=3D"">@@ -444,9 +444,7 @@ int =
init_power9_pmu(void)<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>int rc =3D 0;<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>unsigned int pvr =3D mfspr(SPRN_PVR);<br class=3D""><br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* Comes from cpu_specs[] */<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc64/power9"))<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>if (PVR_VER(pvr) !=3D =
PVR_POWER9)<br class=3D""> <span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>return -ENODEV;<br class=3D""><br =
class=3D""> <span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>/* Blacklist events */<br class=3D"">diff --git =
a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c<br =
class=3D"">index 1f8263785286..39a0a4d7841c 100644<br class=3D"">--- =
a/arch/powerpc/perf/ppc970-pmu.c<br class=3D"">+++ =
b/arch/powerpc/perf/ppc970-pmu.c<br class=3D"">@@ -491,9 +491,10 @@ =
static struct power_pmu ppc970_pmu =3D {<br class=3D""><br class=3D""> =
int init_ppc970_pmu(void)<br class=3D""> {<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>if =
(!cur_cpu_spec-&gt;oprofile_cpu_type ||<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;(strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, =
"ppc64/970")<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> =
&nbsp;&nbsp;&nbsp;&nbsp;&amp;&amp; =
strcmp(cur_cpu_spec-&gt;oprofile_cpu_type, "ppc64/970MP")))<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>unsigned int pvr =3D mfspr(SPRN_PVR);<br class=3D"">+<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>if (PVR_VER(pvr) !=3D PVR_970 &amp;&amp; PVR_VER(pvr) !=3D =
PVR_970MP &amp;&amp;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span> &nbsp;&nbsp;&nbsp;PVR_VER(pvr) =
!=3D PVR_970FX &amp;&amp; PVR_VER(pvr) !=3D PVR_970GX)<br class=3D""> =
<span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>return -ENODEV;<br class=3D""><br class=3D""> <span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>return =
register_power_pmu(&amp;ppc970_pmu);<br class=3D"">-- <br =
class=3D"">2.25.0<br class=3D""><br =
class=3D""></div></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_1AF8466C-6531-4534-9627-5B34C86B1428--


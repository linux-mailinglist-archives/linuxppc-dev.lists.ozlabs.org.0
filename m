Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 089E432CBB7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 06:06:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drf346hZyz3d2J
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 16:06:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Vj+mB9IC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vj+mB9IC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drf2Z1Xt1z30Ny
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 16:05:41 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12453eGY101193; Thu, 4 Mar 2021 00:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=H6L0IwF+DrlSp51mAanCqv2skXmdljWhEakgyYnPHF4=;
 b=Vj+mB9IC/QhwRYZkkKRfnhnjlIOU/u59t4S41RL8d731ofJ7BdmtxjVepOSpqoIUw+Zl
 uo3Ntt+jT/abXbpFRicUxdEDf6+c4lGjaySxtXwd33GpiWOn/rGrXTyuFvN/Yy4zl5Gw
 0vHI/UBW3FqDWEYuizuDfiJVJBzIAeN1uIXjPO3F0u6hALuV0ts6c8vGCID5XctZlPew
 k6LtAqsKtevXHGfl0Jxi7J28RsM4Ks0ZpiAAZVjotrgIq8why0eZUgD8LeqOxWWA/SNx
 4o5pSZvbSuJyGB+PL5NImFWJ0hlJs2TEJh6kQ4B8sJrjypzrHYtU1htt7Q91gnCdkfLz /g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372qpy1vw1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 00:05:20 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12454IE4103308;
 Thu, 4 Mar 2021 00:05:20 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 372qpy1vuj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 00:05:20 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1244wWPY015382;
 Thu, 4 Mar 2021 05:05:18 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 371b0192vr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 Mar 2021 05:05:18 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12455IHD26870200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 4 Mar 2021 05:05:18 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 00AB978081;
 Thu,  4 Mar 2021 05:05:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0AD23780C6;
 Thu,  4 Mar 2021 05:05:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.79.210.254])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  4 Mar 2021 05:05:13 +0000 (GMT)
Subject: Re: [PATCH v3 1/2] powerpc/perf: Use PVR rather than oprofile field
 to determine CPU version
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Rashmica Gupta <rashmica.g@gmail.com>, Viresh Kumar
 <viresh.kumar@linaro.org>, Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
References: <50ad16925a66ac53890286ceafbf84f6fc324baa.1614600516.git.christophe.leroy@csgroup.eu>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <a8982899-8ee8-75e8-7921-5cb5a92fe210@linux.ibm.com>
Date: Thu, 4 Mar 2021 10:35:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <50ad16925a66ac53890286ceafbf84f6fc324baa.1614600516.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-04_01:2021-03-03,
 2021-03-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011
 lowpriorityscore=0 phishscore=0 bulkscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103040020
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
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/1/21 5:39 PM, Christophe Leroy wrote:
> From: Rashmica Gupta <rashmica.g@gmail.com>
> 
> Currently the perf CPU backend drivers detect what CPU they're on using
> cur_cpu_spec->oprofile_cpu_type.
> 
> Although that works, it's a bit crufty to be using oprofile related fields,
> especially seeing as oprofile is more or less unused these days.
> 
> It also means perf is reliant on the fragile logic in setup_cpu_spec()
> which detects when we're using a logical PVR and copies back the PMU
> related fields from the raw CPU entry. So lets check the PVR directly.
> 
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Rashmica Gupta <rashmica.g@gmail.com>
> Reviewed-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
> [chleroy: Added power10 and fixed checkpatch issues]
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Patch looks good to me.

Reviewed-and-tested-By: Kajol Jain<kjain@linux.ibm.com> [For 24x7 side changes]

Thanks,
Kajol Jain

> ---
>  arch/powerpc/perf/e500-pmu.c    | 9 +++++----
>  arch/powerpc/perf/e6500-pmu.c   | 5 +++--
>  arch/powerpc/perf/hv-24x7.c     | 6 +++---
>  arch/powerpc/perf/mpc7450-pmu.c | 5 +++--
>  arch/powerpc/perf/power10-pmu.c | 6 ++----
>  arch/powerpc/perf/power5+-pmu.c | 6 +++---
>  arch/powerpc/perf/power5-pmu.c  | 5 +++--
>  arch/powerpc/perf/power6-pmu.c  | 5 +++--
>  arch/powerpc/perf/power7-pmu.c  | 7 ++++---
>  arch/powerpc/perf/power8-pmu.c  | 5 +++--
>  arch/powerpc/perf/power9-pmu.c  | 4 +---
>  arch/powerpc/perf/ppc970-pmu.c  | 7 ++++---
>  12 files changed, 37 insertions(+), 33 deletions(-)
> 
> diff --git a/arch/powerpc/perf/e500-pmu.c b/arch/powerpc/perf/e500-pmu.c
> index a59c33bed32a..e3e1a68eb1d5 100644
> --- a/arch/powerpc/perf/e500-pmu.c
> +++ b/arch/powerpc/perf/e500-pmu.c
> @@ -118,12 +118,13 @@ static struct fsl_emb_pmu e500_pmu = {
>  
>  static int init_e500_pmu(void)
>  {
> -	if (!cur_cpu_spec->oprofile_cpu_type)
> -		return -ENODEV;
> +	unsigned int pvr = mfspr(SPRN_PVR);
>  
> -	if (!strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/e500mc"))
> +	/* ec500mc */
> +	if (PVR_VER(pvr) == PVR_VER_E500MC || PVR_VER(pvr) == PVR_VER_E5500)
>  		num_events = 256;
> -	else if (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/e500"))
> +	/* e500 */
> +	else if (PVR_VER(pvr) != PVR_VER_E500V1 && PVR_VER(pvr) != PVR_VER_E500V2)
>  		return -ENODEV;
>  
>  	return register_fsl_emb_pmu(&e500_pmu);
> diff --git a/arch/powerpc/perf/e6500-pmu.c b/arch/powerpc/perf/e6500-pmu.c
> index 44ad65da82ed..bd779a2338f8 100644
> --- a/arch/powerpc/perf/e6500-pmu.c
> +++ b/arch/powerpc/perf/e6500-pmu.c
> @@ -107,8 +107,9 @@ static struct fsl_emb_pmu e6500_pmu = {
>  
>  static int init_e6500_pmu(void)
>  {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -		strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/e6500"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_VER_E6500)
>  		return -ENODEV;
>  
>  	return register_fsl_emb_pmu(&e6500_pmu);
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index e5eb33255066..f3f2472fa1c6 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -1718,16 +1718,16 @@ static int hv_24x7_init(void)
>  {
>  	int r;
>  	unsigned long hret;
> +	unsigned int pvr = mfspr(SPRN_PVR);
>  	struct hv_perf_caps caps;
>  
>  	if (!firmware_has_feature(FW_FEATURE_LPAR)) {
>  		pr_debug("not a virtualized system, not enabling\n");
>  		return -ENODEV;
> -	} else if (!cur_cpu_spec->oprofile_cpu_type)
> -		return -ENODEV;
> +	}
>  
>  	/* POWER8 only supports v1, while POWER9 only supports v2. */
> -	if (!strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power8"))
> +	if (PVR_VER(pvr) == PVR_POWER8)
>  		interface_version = 1;
>  	else {
>  		interface_version = 2;
> diff --git a/arch/powerpc/perf/mpc7450-pmu.c b/arch/powerpc/perf/mpc7450-pmu.c
> index e39b15b79a83..552d51a925d3 100644
> --- a/arch/powerpc/perf/mpc7450-pmu.c
> +++ b/arch/powerpc/perf/mpc7450-pmu.c
> @@ -417,8 +417,9 @@ struct power_pmu mpc7450_pmu = {
>  
>  static int __init init_mpc7450_pmu(void)
>  {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc/7450"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_7450)
>  		return -ENODEV;
>  
>  	return register_power_pmu(&mpc7450_pmu);
> diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
> index a901c1348cad..d1395844a329 100644
> --- a/arch/powerpc/perf/power10-pmu.c
> +++ b/arch/powerpc/perf/power10-pmu.c
> @@ -566,12 +566,10 @@ int init_power10_pmu(void)
>  	unsigned int pvr;
>  	int rc;
>  
> -	/* Comes from cpu_specs[] */
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power10"))
> +	pvr = mfspr(SPRN_PVR);
> +	if (PVR_VER(pvr) != PVR_POWER10)
>  		return -ENODEV;
>  
> -	pvr = mfspr(SPRN_PVR);
>  	/* Add the ppmu flag for power10 DD1 */
>  	if ((PVR_CFG(pvr) == 1))
>  		power10_pmu.flags |= PPMU_P10_DD1;
> diff --git a/arch/powerpc/perf/power5+-pmu.c b/arch/powerpc/perf/power5+-pmu.c
> index 18732267993a..a79eae40ef6d 100644
> --- a/arch/powerpc/perf/power5+-pmu.c
> +++ b/arch/powerpc/perf/power5+-pmu.c
> @@ -679,9 +679,9 @@ static struct power_pmu power5p_pmu = {
>  
>  int init_power5p_pmu(void)
>  {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5+")
> -	     && strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5++")))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_POWER5p)
>  		return -ENODEV;
>  
>  	return register_power_pmu(&power5p_pmu);
> diff --git a/arch/powerpc/perf/power5-pmu.c b/arch/powerpc/perf/power5-pmu.c
> index cb611c1e7abe..35a9d7f3b4b9 100644
> --- a/arch/powerpc/perf/power5-pmu.c
> +++ b/arch/powerpc/perf/power5-pmu.c
> @@ -620,8 +620,9 @@ static struct power_pmu power5_pmu = {
>  
>  int init_power5_pmu(void)
>  {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power5"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_POWER5)
>  		return -ENODEV;
>  
>  	return register_power_pmu(&power5_pmu);
> diff --git a/arch/powerpc/perf/power6-pmu.c b/arch/powerpc/perf/power6-pmu.c
> index 69ef38216418..8aa220c712a7 100644
> --- a/arch/powerpc/perf/power6-pmu.c
> +++ b/arch/powerpc/perf/power6-pmu.c
> @@ -541,8 +541,9 @@ static struct power_pmu power6_pmu = {
>  
>  int init_power6_pmu(void)
>  {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power6"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_POWER6)
>  		return -ENODEV;
>  
>  	return register_power_pmu(&power6_pmu);
> diff --git a/arch/powerpc/perf/power7-pmu.c b/arch/powerpc/perf/power7-pmu.c
> index 894c17f9a762..ca7373143b02 100644
> --- a/arch/powerpc/perf/power7-pmu.c
> +++ b/arch/powerpc/perf/power7-pmu.c
> @@ -447,11 +447,12 @@ static struct power_pmu power7_pmu = {
>  
>  int init_power7_pmu(void)
>  {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power7"))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_POWER7 && PVR_VER(pvr) != PVR_POWER7p)
>  		return -ENODEV;
>  
> -	if (pvr_version_is(PVR_POWER7p))
> +	if (PVR_VER(pvr) == PVR_POWER7p)
>  		power7_pmu.flags |= PPMU_SIAR_VALID;
>  
>  	return register_power_pmu(&power7_pmu);
> diff --git a/arch/powerpc/perf/power8-pmu.c b/arch/powerpc/perf/power8-pmu.c
> index 5282e8415ddf..5a396ba8bf58 100644
> --- a/arch/powerpc/perf/power8-pmu.c
> +++ b/arch/powerpc/perf/power8-pmu.c
> @@ -381,9 +381,10 @@ static struct power_pmu power8_pmu = {
>  int init_power8_pmu(void)
>  {
>  	int rc;
> +	unsigned int pvr = mfspr(SPRN_PVR);
>  
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power8"))
> +	if (PVR_VER(pvr) != PVR_POWER8E && PVR_VER(pvr) != PVR_POWER8NVL &&
> +	    PVR_VER(pvr) != PVR_POWER8)
>  		return -ENODEV;
>  
>  	rc = register_power_pmu(&power8_pmu);
> diff --git a/arch/powerpc/perf/power9-pmu.c b/arch/powerpc/perf/power9-pmu.c
> index 2a57e93a79dc..28ba1e98f93d 100644
> --- a/arch/powerpc/perf/power9-pmu.c
> +++ b/arch/powerpc/perf/power9-pmu.c
> @@ -444,9 +444,7 @@ int init_power9_pmu(void)
>  	int rc = 0;
>  	unsigned int pvr = mfspr(SPRN_PVR);
>  
> -	/* Comes from cpu_specs[] */
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/power9"))
> +	if (PVR_VER(pvr) != PVR_POWER9)
>  		return -ENODEV;
>  
>  	/* Blacklist events */
> diff --git a/arch/powerpc/perf/ppc970-pmu.c b/arch/powerpc/perf/ppc970-pmu.c
> index 1f8263785286..39a0a4d7841c 100644
> --- a/arch/powerpc/perf/ppc970-pmu.c
> +++ b/arch/powerpc/perf/ppc970-pmu.c
> @@ -491,9 +491,10 @@ static struct power_pmu ppc970_pmu = {
>  
>  int init_ppc970_pmu(void)
>  {
> -	if (!cur_cpu_spec->oprofile_cpu_type ||
> -	    (strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/970")
> -	     && strcmp(cur_cpu_spec->oprofile_cpu_type, "ppc64/970MP")))
> +	unsigned int pvr = mfspr(SPRN_PVR);
> +
> +	if (PVR_VER(pvr) != PVR_970 && PVR_VER(pvr) != PVR_970MP &&
> +	    PVR_VER(pvr) != PVR_970FX && PVR_VER(pvr) != PVR_970GX)
>  		return -ENODEV;
>  
>  	return register_power_pmu(&ppc970_pmu);
> 

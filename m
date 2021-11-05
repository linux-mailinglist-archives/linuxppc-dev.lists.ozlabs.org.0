Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 712444463DC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 14:10:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm1872FZpz3bmr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 00:10:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=d57WZ/wp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=d57WZ/wp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm17P3llXz2xX6
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 00:09:37 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1A5CmaAv028065
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 13:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=LAHZdbAaRq8rxuxZlK62RQDxGC1tj34W1egaotjKrm4=;
 b=d57WZ/wpnRib7oN0E55tvn42Qigr6Hj3/F5PxDql6QaZMe0V0RkjwVW6mWxZ/ZxSgDwa
 J/EyhqVroZIwbiv2eDSqzi+xIdlTqg1WZBLBQkY8lbTUNjP/M2+cJOr86afFiIpq2/Sk
 XG/0Hf56gTM8kvX6h33AULhZXhO0JE/ubJlF/+xxJZJTIwCZShZwrKtsV3NtcXFlMnZE
 c/TgPLuJCe0oQd0xqMaInRCIoXXJkHfykTzwPTbG+9vIbWoY3/t3ODDfSB1fauSk8++K
 c++D5ioUEn96qLgS+xKybnMVxAa7SOGuLum+E76VMfcISBnXdISDgiwrhqs/LYc1cu9I Ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c4xuhyr2a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 13:09:34 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1A5D1N6u009775
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Nov 2021 13:09:33 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3c4xuhyr1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 13:09:33 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1A5D7A4o021342;
 Fri, 5 Nov 2021 13:09:31 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3c4t4cmwy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 05 Nov 2021 13:09:31 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1A5D31jw54067674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Nov 2021 13:03:01 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C3970AE053;
 Fri,  5 Nov 2021 13:09:28 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A1954AE04D;
 Fri,  5 Nov 2021 13:09:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.43.30.131])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Nov 2021 13:09:27 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH 1/2] powerpc: remove cpu_online_cores_map function
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <20211105035042.1398309-1-npiggin@gmail.com>
Date: Fri, 5 Nov 2021 18:39:25 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <9ECFB333-890D-4550-BB94-14813633A677@linux.vnet.ibm.com>
References: <20211105035042.1398309-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5eOSRVk4IovWyo4RXBBA3CXqTUTNpeFv
X-Proofpoint-ORIG-GUID: E7Z_FxCAHeWsjKAruxfTBV_FcZ4YOh-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-05_02,2021-11-03_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 clxscore=1011 malwarescore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=999
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111050076
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 05-Nov-2021, at 9:20 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> This function builds the cores online map with on-stack cpumasks which
> can cause high stack usage with large NR_CPUS.
>=20
> It is not used in any performance sensitive paths, so instead just =
check
> for first thread sibling.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Thanks
- Sachin

> arch/powerpc/include/asm/cputhreads.h     | 33 -----------------------
> arch/powerpc/platforms/powernv/idle.c     | 10 +++----
> arch/powerpc/platforms/powernv/opal-imc.c |  6 ++---
> 3 files changed, 8 insertions(+), 41 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/cputhreads.h =
b/arch/powerpc/include/asm/cputhreads.h
> index b167186aaee4..f26c430f3982 100644
> --- a/arch/powerpc/include/asm/cputhreads.h
> +++ b/arch/powerpc/include/asm/cputhreads.h
> @@ -32,44 +32,11 @@ extern cpumask_t threads_core_mask;
> #define threads_core_mask	(*get_cpu_mask(0))
> #endif
>=20
> -/* cpu_thread_mask_to_cores - Return a cpumask of one per cores
> - *                            hit by the argument
> - *
> - * @threads:	a cpumask of online threads
> - *
> - * This function returns a cpumask which will have one online cpu's
> - * bit set for each core that has at least one thread set in the =
argument.
> - *
> - * This can typically be used for things like IPI for tlb =
invalidations
> - * since those need to be done only once per core/TLB
> - */
> -static inline cpumask_t cpu_thread_mask_to_cores(const struct cpumask =
*threads)
> -{
> -	cpumask_t	tmp, res;
> -	int		i, cpu;
> -
> -	cpumask_clear(&res);
> -	for (i =3D 0; i < NR_CPUS; i +=3D threads_per_core) {
> -		cpumask_shift_left(&tmp, &threads_core_mask, i);
> -		if (cpumask_intersects(threads, &tmp)) {
> -			cpu =3D cpumask_next_and(-1, &tmp, =
cpu_online_mask);
> -			if (cpu < nr_cpu_ids)
> -				cpumask_set_cpu(cpu, &res);
> -		}
> -	}
> -	return res;
> -}
> -
> static inline int cpu_nr_cores(void)
> {
> 	return nr_cpu_ids >> threads_shift;
> }
>=20
> -static inline cpumask_t cpu_online_cores_map(void)
> -{
> -	return cpu_thread_mask_to_cores(cpu_online_mask);
> -}
> -
> #ifdef CONFIG_SMP
> int cpu_core_index_of_thread(int cpu);
> int cpu_first_thread_of_core(int core);
> diff --git a/arch/powerpc/platforms/powernv/idle.c =
b/arch/powerpc/platforms/powernv/idle.c
> index e3ffdc8e8567..70da314fd2d7 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -146,9 +146,13 @@ =
EXPORT_SYMBOL_GPL(pnv_get_supported_cpuidle_states);
> static void pnv_fastsleep_workaround_apply(void *info)
>=20
> {
> +	int cpu =3D smp_processor_id();
> 	int rc;
> 	int *err =3D info;
>=20
> +	if (cpu_first_thread_sibling(cpu) !=3D cpu)
> +		return;
> +
> 	rc =3D opal_config_cpu_idle_state(OPAL_CONFIG_IDLE_FASTSLEEP,
> 					OPAL_CONFIG_IDLE_APPLY);
> 	if (rc)
> @@ -175,7 +179,6 @@ static ssize_t =
store_fastsleep_workaround_applyonce(struct device *dev,
> 		struct device_attribute *attr, const char *buf,
> 		size_t count)
> {
> -	cpumask_t primary_thread_mask;
> 	int err;
> 	u8 val;
>=20
> @@ -200,10 +203,7 @@ static ssize_t =
store_fastsleep_workaround_applyonce(struct device *dev,
> 	power7_fastsleep_workaround_exit =3D false;
>=20
> 	cpus_read_lock();
> -	primary_thread_mask =3D cpu_online_cores_map();
> -	on_each_cpu_mask(&primary_thread_mask,
> -				pnv_fastsleep_workaround_apply,
> -				&err, 1);
> +	on_each_cpu(pnv_fastsleep_workaround_apply, &err, 1);
> 	cpus_read_unlock();
> 	if (err) {
> 		pr_err("fastsleep_workaround_applyonce change failed =
while running pnv_fastsleep_workaround_apply");
> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c =
b/arch/powerpc/platforms/powernv/opal-imc.c
> index 05d3832019b9..3fea5da6d1b3 100644
> --- a/arch/powerpc/platforms/powernv/opal-imc.c
> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
> @@ -200,13 +200,13 @@ static void disable_nest_pmu_counters(void)
>=20
> static void disable_core_pmu_counters(void)
> {
> -	cpumask_t cores_map;
> 	int cpu, rc;
>=20
> 	cpus_read_lock();
> 	/* Disable the IMC Core functions */
> -	cores_map =3D cpu_online_cores_map();
> -	for_each_cpu(cpu, &cores_map) {
> +	for_each_online_cpu(cpu) {
> +		if (cpu_first_thread_sibling(cpu) !=3D cpu)
> +			continue;
> 		rc =3D opal_imc_counters_stop(OPAL_IMC_COUNTERS_CORE,
> 					    =
get_hard_smp_processor_id(cpu));
> 		if (rc)
> --=20
> 2.23.0
>=20


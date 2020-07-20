Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B96682257EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 08:37:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Bqk5Px9zDqfd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:37:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9BmK3j4RzDqMl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:34:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B9BmJ1f9Hz8sZx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:34:56 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B9BmH6NHpz9sSn; Mon, 20 Jul 2020 16:34:55 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B9BmH13msz9sRk;
 Mon, 20 Jul 2020 16:34:54 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K6X3s2016319; Mon, 20 Jul 2020 02:34:53 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bwmkgvuv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 02:34:53 -0400
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06K6XrM3019897;
 Mon, 20 Jul 2020 02:34:53 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bwmkgvs7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 02:34:52 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K6VdEX008154;
 Mon, 20 Jul 2020 06:34:48 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 32brbh29eg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 06:34:48 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06K6Yj4432964866
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 06:34:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B69511C069;
 Mon, 20 Jul 2020 06:34:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 090B211C05B;
 Mon, 20 Jul 2020 06:34:44 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.85.113.150])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 20 Jul 2020 06:34:43 +0000 (GMT)
Date: Mon, 20 Jul 2020 12:04:41 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 5/5] cpuidle-pseries: Block Extended CEDE(1) which adds
 no additional value.
Message-ID: <20200720063441.GF4000@drishya.in.ibm.com>
References: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
 <1594120299-31389-6-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1594120299-31389-6-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_01:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=992
 priorityscore=1501 phishscore=0 clxscore=1015 mlxscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=1 spamscore=0 impostorscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200047
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
Reply-To: svaidy@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-07 16:41:39]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> The Extended CEDE state with latency-hint = 1 is only different from
> normal CEDE (with latency-hint = 0) in that a CPU in Extended CEDE(1)
> does not wakeup on timer events. Both CEDE and Extended CEDE(1) map to
> the same hardware idle state. Since we already get SMT folding from
> the normal CEDE, the Extended CEDE(1) doesn't provide any additional
> value. This patch blocks Extended CEDE(1).
> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>

> ---
>  drivers/cpuidle/cpuidle-pseries.c | 57 ++++++++++++++++++++++++++++++++++++---
>  1 file changed, 54 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index 6f893cd..be0b8b2 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -350,6 +350,43 @@ static int pseries_cpuidle_driver_init(void)
>  	return 0;
>  }
> 
> +#define XCEDE1_HINT	1
> +#define ERR_NO_VALUE_ADD	(-1)
> +#define ERR_NO_EE_WAKEUP	(-2)
> +
> +/*
> + * Returns 0 if the Extende CEDE state with @hint is not blocked in
> + * cpuidle framework.
> + *
> + * Returns ERR_NO_EE_WAKEUP if the Extended CEDE state is blocked due
> + * to not being responsive to external interrupts.
> + *
> + * Returns ERR_NO_VALUE_ADD if the Extended CEDE state does not provide
> + * added value addition over the normal CEDE.
> + */
> +static int cpuidle_xcede_blocked(u8 hint, u64 latency_us, u8 responsive_to_irqs)
> +{
> +
> +	/*
> +	 * We will only allow extended CEDE states that are responsive
> +	 * to irqs do not require an H_PROD to be woken up.
> +	 */
> +	if (!responsive_to_irqs)
> +		return ERR_NO_EE_WAKEUP;
> +
> +	/*
> +	 * We already obtain SMT folding benefits from CEDE (which is
> +	 * CEDE with hint 0). Furthermore, CEDE is also responsive to
> +	 * timer-events, while XCEDE1 requires an external
> +	 * interrupt/H_PROD to be woken up. Hence, block XCEDE1 since
> +	 * it adds no further value.
> +	 */
> +	if (hint == XCEDE1_HINT)
> +		return ERR_NO_VALUE_ADD;
> +
> +	return 0;
> +}
> +
>  static int add_pseries_idle_states(void)
>  {
>  	int nr_states = 2; /* By default we have snooze, CEDE */
> @@ -365,15 +402,29 @@ static int add_pseries_idle_states(void)
>  		char name[CPUIDLE_NAME_LEN];
>  		unsigned int latency_hint = xcede_records[i].latency_hint;
>  		u64 residency_us;
> +		int rc;
> +
> +		if (latency_us < min_latency_us)
> +			min_latency_us = latency_us;
> +
> +		rc = cpuidle_xcede_blocked(latency_hint, latency_us,
> +					   xcede_records[i].responsive_to_irqs);
> 
> -		if (!xcede_records[i].responsive_to_irqs) {
> +		if (rc) {
> +			switch (rc) {
> +			case ERR_NO_VALUE_ADD:
> +				pr_info("cpuidle : Skipping XCEDE%d. No additional value-add\n",
> +					latency_hint);
> +				break;
> +			case ERR_NO_EE_WAKEUP:
>  			pr_info("cpuidle : Skipping XCEDE%d. Not responsive to IRQs\n",
>  				latency_hint);
> +			break;
> +			}
> +
>  			continue;
>  		}
> 
> -		if (latency_us < min_latency_us)
> -			min_latency_us = latency_us;
>  		snprintf(name, CPUIDLE_NAME_LEN, "XCEDE%d", latency_hint);
> 
>  		/*


We need these heuristics to select/reject idle states exposed by
platform firmware to Linux primarily because not all states are really
useful to Linux on a given setup.

--Vaidy


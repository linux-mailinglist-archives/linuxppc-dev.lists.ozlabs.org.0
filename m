Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFA1225748
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 07:58:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B99xv6JsdzDqPQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 15:58:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B99w96VSgzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 15:56:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B99w91zGJz8sWN
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 15:56:41 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B99w91LNBz9sRN; Mon, 20 Jul 2020 15:56:41 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B99w85TPbz9sR4;
 Mon, 20 Jul 2020 15:56:40 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K5Wdo2061721; Mon, 20 Jul 2020 01:56:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bw7yr4by-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 01:56:37 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06K5txpT132749;
 Mon, 20 Jul 2020 01:56:37 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32bw7yr4at-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 01:56:37 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K5sQFY023365;
 Mon, 20 Jul 2020 05:55:25 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 32brq814kw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 05:55:25 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06K5tNaK30081306
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 05:55:23 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E437A405C;
 Mon, 20 Jul 2020 05:55:23 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2667A405B;
 Mon, 20 Jul 2020 05:55:21 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.85.113.150])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 20 Jul 2020 05:55:21 +0000 (GMT)
Date: Mon, 20 Jul 2020 11:25:19 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/5] cpuidle-pseries: Set the latency-hint before
 entering CEDE
Message-ID: <20200720055519.GB4000@drishya.in.ibm.com>
References: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
 <1594120299-31389-2-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1594120299-31389-2-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_01:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 spamscore=0 bulkscore=0 impostorscore=0 clxscore=1015 suspectscore=1
 lowpriorityscore=0 priorityscore=1501 mlxlogscore=948 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200038
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

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-07 16:41:35]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> As per the PAPR, each H_CEDE call is associated with a latency-hint to
> be passed in the VPA field "cede_latency_hint". The CEDE states that
> we were implicitly entering so far is CEDE with latency-hint = 0.
> 
> This patch explicitly sets the latency hint corresponding to the CEDE
> state that we are currently entering. While at it, we save the
> previous hint, to be restored once we wakeup from CEDE. This will be
> required in the future when we expose extended-cede states through the
> cpuidle framework, where each of them will have a different
> cede-latency hint.
> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>


> ---
>  drivers/cpuidle/cpuidle-pseries.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index 4a37252..39d4bb6 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -105,19 +105,27 @@ static void check_and_cede_processor(void)
>  	}
>  }
> 
> +#define NR_CEDE_STATES		1  /* CEDE with latency-hint 0 */
> +#define NR_DEDICATED_STATES	(NR_CEDE_STATES + 1) /* Includes snooze */
> +
> +u8 cede_latency_hint[NR_DEDICATED_STATES];
>  static int dedicated_cede_loop(struct cpuidle_device *dev,
>  				struct cpuidle_driver *drv,
>  				int index)
>  {
> +	u8 old_latency_hint;
> 
>  	pseries_idle_prolog();
>  	get_lppaca()->donate_dedicated_cpu = 1;
> +	old_latency_hint = get_lppaca()->cede_latency_hint;
> +	get_lppaca()->cede_latency_hint = cede_latency_hint[index];
> 
>  	HMT_medium();
>  	check_and_cede_processor();
> 
>  	local_irq_disable();
>  	get_lppaca()->donate_dedicated_cpu = 0;
> +	get_lppaca()->cede_latency_hint = old_latency_hint;
> 
>  	pseries_idle_epilog();
> 
> @@ -149,7 +157,7 @@ static int shared_cede_loop(struct cpuidle_device *dev,
>  /*
>   * States for dedicated partition case.
>   */
> -static struct cpuidle_state dedicated_states[] = {
> +static struct cpuidle_state dedicated_states[NR_DEDICATED_STATES] = {
>  	{ /* Snooze */
>  		.name = "snooze",
>  		.desc = "snooze",


Saving and restoring the current cede hint value helps in maintaining
compatibility with other parts of the kernel.  Over long term we can
make cpuidle driver deterministically set the CEDE hint at each
invocation of H_CEDE call so that we do not have to do multiple
redundant save-restore.

This is a reasonable start to cleanup this cupidle subsystem on PAPR
guests. 

--Vaidy


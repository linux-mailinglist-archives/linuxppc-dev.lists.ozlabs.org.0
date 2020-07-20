Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BBC2257B7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 08:35:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9BmN4HGwzDqMG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:35:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9BkK29KSzDqS1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:33:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B9BkK049dz9CY7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:33:13 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B9BkJ6B75z9sRW; Mon, 20 Jul 2020 16:33:12 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4B9BkJ2N5Gz9sRN;
 Mon, 20 Jul 2020 16:33:12 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K6UdVp090276; Mon, 20 Jul 2020 02:33:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32bw8yrxy6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 02:33:09 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06K6W0Xd094790;
 Mon, 20 Jul 2020 02:33:08 -0400
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32bw8yrxxd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 02:33:08 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K6TrxA001796;
 Mon, 20 Jul 2020 06:33:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma02fra.de.ibm.com with ESMTP id 32brq7tad4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 06:33:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06K6VoH855378026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 06:31:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3727A405F;
 Mon, 20 Jul 2020 06:31:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 451BAA405B;
 Mon, 20 Jul 2020 06:31:48 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.85.113.150])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 20 Jul 2020 06:31:48 +0000 (GMT)
Date: Mon, 20 Jul 2020 12:01:45 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/5] cpuidle-pseries : Include extended CEDE states in
 cpuidle framework
Message-ID: <20200720063145.GE4000@drishya.in.ibm.com>
References: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
 <1594120299-31389-5-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1594120299-31389-5-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_01:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 spamscore=0
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 mlxscore=0
 suspectscore=1 bulkscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200045
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

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-07 16:41:38]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> This patch exposes those extended CEDE states to the cpuidle framework
> which are responsive to external interrupts and do not need an H_PROD.
> 
> Since as per the PAPR, all the extended CEDE states are non-responsive
> to timers, we indicate this to the cpuidle subsystem via the
> CPUIDLE_FLAG_TIMER_STOP flag for all those extende CEDE states which
> can wake up on external interrupts.
> 
> With the patch, we are able to see the extended CEDE state with
> latency hint = 1 exposed via the cpuidle framework.
> 
> 	$ cpupower idle-info
> 	CPUidle driver: pseries_idle
> 	CPUidle governor: menu
> 	analyzing CPU 0:
> 
> 	Number of idle states: 3
> 	Available idle states: snooze CEDE XCEDE1
> 	snooze:
> 	Flags/Description: snooze
> 	Latency: 0
> 	Usage: 33429446
> 	Duration: 27006062
> 	CEDE:
> 	Flags/Description: CEDE
> 	Latency: 1
> 	Usage: 10272
> 	Duration: 110786770
> 	XCEDE1:
> 	Flags/Description: XCEDE1
> 	Latency: 12
> 	Usage: 26445
> 	Duration: 1436433815
> 
> Benchmark results:
> TLDR: Over all we do not see any additional benefit from having XCEDE1 over
> CEDE.
> 
> ebizzy :
> 2 threads bound to a big-core. With this patch, we see a 3.39%
> regression compared to with only CEDE0 latency fixup.
> x With only CEDE0 latency fixup
> * With CEDE0 latency fixup + CEDE1
>     N           Min           Max        Median           Avg        Stddev
> x  10       2893813       5834474       5832448     5327281.3     1055941.4
> *  10       2907329       5834923       5831398     5146614.6     1193874.8
> 
> context_switch2:
> With the context_switch2 there are no observable regressions in the
> results.
> 
> context_switch2 CPU0 CPU1 (Same Big-core, different small-cores).
> No difference with and without patch.
> x without_patch
> * with_patch
>     N           Min           Max        Median           Avg        Stddev
> x 500        343644        348778        345444     345584.02     1035.1658
> * 500        344310        347646        345776     345877.22     802.19501
> 
> context_switch2 CPU0 CPU8 (different big-cores). Minor 0.05% improvement
> with patch
> x without_patch
> * with_patch
>     N           Min           Max        Median           Avg        Stddev
> x 500        287562        288756        288162     288134.76     262.24328
> * 500        287874        288960        288306     288274.66     187.57034
> 
> schbench:
> No regressions observed with schbench
> 
> Without Patch:
> Latency percentiles (usec)
> 	50.0th: 29
> 	75.0th: 40
> 	90.0th: 50
> 	95.0th: 61
> 	*99.0th: 13648
> 	99.5th: 14768
> 	99.9th: 15664
> 	min=0, max=29812
> 
> With Patch:
> Latency percentiles (usec)
> 	50.0th: 30
> 	75.0th: 40
> 	90.0th: 51
> 	95.0th: 59
> 	*99.0th: 13616
> 	99.5th: 14512
> 	99.9th: 15696
> 	min=0, max=15996
> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>

> ---
>  drivers/cpuidle/cpuidle-pseries.c | 50 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 50 insertions(+)
> 
> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index 502f906..6f893cd 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -362,9 +362,59 @@ static int add_pseries_idle_states(void)
>  	for (i = 0; i < nr_xcede_records; i++) {
>  		u64 latency_tb = xcede_records[i].wakeup_latency_tb_ticks;
>  		u64 latency_us = tb_to_ns(latency_tb) / NSEC_PER_USEC;
> +		char name[CPUIDLE_NAME_LEN];
> +		unsigned int latency_hint = xcede_records[i].latency_hint;
> +		u64 residency_us;
> +
> +		if (!xcede_records[i].responsive_to_irqs) {
> +			pr_info("cpuidle : Skipping XCEDE%d. Not responsive to IRQs\n",
> +				latency_hint);
> +			continue;
> +		}
> 
>  		if (latency_us < min_latency_us)
>  			min_latency_us = latency_us;
> +		snprintf(name, CPUIDLE_NAME_LEN, "XCEDE%d", latency_hint);
> +
> +		/*
> +		 * As per the section 14.14.1 of PAPR version 2.8.1
> +		 * says that alling H_CEDE with the value of the cede
> +		 * latency specifier set greater than zero allows the
> +		 * processor timer facility to be disabled (so as not
> +		 * to cause gratuitous wake-ups - the use of H_PROD,
> +		 * or other external interrupt is required to wake the
> +		 * processor in this case).
> +		 *
> +		 * So, inform the cpuidle-subsystem that the timer
> +		 * will be stopped for these states.
> +		 *
> +		 * Also, bump up the latency by 10us, since cpuidle
> +		 * would use timer-offload framework which will need
> +		 * to send an IPI to wakeup a CPU whose timer has
> +		 * expired.
> +		 */
> +		if (latency_hint > 0) {
> +			dedicated_states[nr_states].flags = CPUIDLE_FLAG_TIMER_STOP;
> +			latency_us += 10;
> +		}
> +
> +		/*
> +		 * Thumb rule : Reside in the XCEDE state for at least
> +		 * 10x the time required to enter and exit that state.
> +		 */
> +		residency_us = latency_us * 10;
> +
> +		strlcpy(dedicated_states[nr_states].name, (const char *)name,
> +			CPUIDLE_NAME_LEN);
> +		strlcpy(dedicated_states[nr_states].desc, (const char *)name,
> +			CPUIDLE_NAME_LEN);
> +		dedicated_states[nr_states].exit_latency = latency_us;
> +		dedicated_states[nr_states].target_residency = residency_us;
> +		dedicated_states[nr_states].enter = &dedicated_cede_loop;
> +		cede_latency_hint[nr_states] = latency_hint;
> +		pr_info("cpuidle : Added %s. latency-hint = %d\n",
> +			name, latency_hint);
> +		nr_states++;

This patch demonstrates the various use cases of the previous patches
in the series that helps interface with the platform firmware better.
On current platforms these benefits are very limited, but the
framework built by the previous patches helps Linux exploit new and
enhanced idle states that will be available on newer platform and
firmware.

--Vaidy

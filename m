Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F47225C72B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 18:42:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bj65w6k5mzDr8g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 02:41:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ECZmdnt3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bj5041RbXzDr3S
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 01:51:47 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 083FWikT008161; Thu, 3 Sep 2020 11:51:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=Xie83cS1wBsrOlMl57haKdUq5ISpsEkLKQX01noE+uk=;
 b=ECZmdnt3PLPd32/f4NlvxBaK1RDdwz+N4qVXA3xpA2vKdRak07zVdnwS8tDrInZlUvyZ
 Z9ldOT1NVgKjTN1f6qHHab+e0yRPccpxF7MkBdUtLkbESqZUtRRJeukqWDHVx5C5m0cP
 4e0iyyMKtqrLAI/p1SF3wMGaJYz3IMGgfYSAocgyUcy7DWNHw0QdFma+H9XKxlkfLADZ
 W8w9gIVbZa56z3PGGPHK0T1twb99u7DN/hcrK4X+zOfWudqsPWnkDRHqMETTsJNqkmqV
 NQVXcC9mlYYNHkLNVWkfDtsc5KQjIcLXLzbmff4Ogospi7Ida++Rs7WHqvzuaE+6m9cv Og== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33b2kjsq4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Sep 2020 11:51:38 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 083FpZgn013347;
 Thu, 3 Sep 2020 15:51:35 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 337en8e06x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Sep 2020 15:51:35 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 083FpXnc21234034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Sep 2020 15:51:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 002994C058;
 Thu,  3 Sep 2020 15:51:32 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 302D04C044;
 Thu,  3 Sep 2020 15:51:30 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.77.196.144])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu,  3 Sep 2020 15:51:29 +0000 (GMT)
Date: Thu, 3 Sep 2020 21:21:26 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] cpuidle-pseries: Fix CEDE latency conversion from tb
 to us
Message-ID: <20200903155100.GA3831@drishya.in.ibm.com>
References: <1599125247-28488-1-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1599125247-28488-1-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-03_07:2020-09-03,
 2020-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=1 priorityscore=1501 mlxlogscore=921 clxscore=1011
 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0 phishscore=0
 mlxscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009030136
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
Cc: linux-pm@vger.kernel.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Joel Stanley <joel@jms.id.au>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-09-03 14:57:27]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> CEDE(0)") sets the exit latency of CEDE(0) based on the latency values
> of the Extended CEDE states advertised by the platform. The values
> advertised by the platform are in timebase ticks. However the cpuidle
> framework requires the latency values in microseconds.
> 
> If the tb-ticks value advertised by the platform correspond to a value
> smaller than 1us, during the conversion from tb-ticks to microseconds,
> in the current code, the result becomes zero. This is incorrect as it
> puts a CEDE state on par with the snooze state.
> 
> This patch fixes this by rounding up the result obtained while
> converting the latency value from tb-ticks to microseconds. It also
> prints a warning in case we discover an extended-cede state with
> wakeup latency to be 0. In such a case, ensure that CEDE(0) has a
> non-zero wakeup latency.
> 
> Fixes: commit d947fb4c965c ("cpuidle: pseries: Fixup exit latency for
> CEDE(0)")
> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>

> ---
> v1-->v2: Added a warning if a CEDE state has 0 wakeup latency (Suggested by Joel Stanley)
>          Also added code to ensure that CEDE(0) has a non-zero wakeup latency.	 
>  drivers/cpuidle/cpuidle-pseries.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index ff6d99e..a2b5c6f 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -361,7 +361,10 @@ static void __init fixup_cede0_latency(void)
>  	for (i = 0; i < nr_xcede_records; i++) {
>  		struct xcede_latency_record *record = &payload->records[i];
>  		u64 latency_tb = be64_to_cpu(record->latency_ticks);
> -		u64 latency_us = tb_to_ns(latency_tb) / NSEC_PER_USEC;
> +		u64 latency_us = DIV_ROUND_UP_ULL(tb_to_ns(latency_tb), NSEC_PER_USEC);

This would fix the issue of rounding down to zero.

> +
> +		if (latency_us == 0)
> +			pr_warn("cpuidle: xcede record %d has an unrealistic latency of 0us.\n", i);

+1  This should not happen.

>  		if (latency_us < min_latency_us)
>  			min_latency_us = latency_us;
> @@ -378,10 +381,14 @@ static void __init fixup_cede0_latency(void)
>  	 * Perform the fix-up.
>  	 */
>  	if (min_latency_us < dedicated_states[1].exit_latency) {
> -		u64 cede0_latency = min_latency_us - 1;
> +		/*
> +		 * We set a minimum of 1us wakeup latency for cede0 to
> +		 * distinguish it from snooze
> +		 */
> +		u64 cede0_latency = 1;
> 
> -		if (cede0_latency <= 0)
> -			cede0_latency = min_latency_us;
> +		if (min_latency_us > cede0_latency)
> +			cede0_latency = min_latency_us - 1;

Good checks to expect cede latency of 1us or more.

>  		dedicated_states[1].exit_latency = cede0_latency;
>  		dedicated_states[1].target_residency = 10 * (cede0_latency);

--Vaidy


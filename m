Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 724F422575A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 08:11:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9BDl6jxTzDqHr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:11:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9BBd1RDTzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:09:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4B9BBc61lWz8sZx
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 16:09:12 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4B9BBc4s6bz9sRW; Mon, 20 Jul 2020 16:09:12 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 4B9BBc1Mttz9sRN;
 Mon, 20 Jul 2020 16:09:11 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K65Vgu116672; Mon, 20 Jul 2020 02:09:10 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d2m2uq4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 02:09:10 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06K66ASq120782;
 Mon, 20 Jul 2020 02:09:09 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d2m2uq39-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 02:09:09 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K66VEA003323;
 Mon, 20 Jul 2020 06:09:07 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 32brq814vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 06:09:06 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06K6946M44630240
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 06:09:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 815ACA4059;
 Mon, 20 Jul 2020 06:09:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D71B9A404D;
 Mon, 20 Jul 2020 06:09:02 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.85.113.150])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 20 Jul 2020 06:09:02 +0000 (GMT)
Date: Mon, 20 Jul 2020 11:39:00 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/5] cpuidle-pseries: Add function to parse extended CEDE
 records
Message-ID: <20200720060900.GC4000@drishya.in.ibm.com>
References: <1594120299-31389-1-git-send-email-ego@linux.vnet.ibm.com>
 <1594120299-31389-3-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <1594120299-31389-3-git-send-email-ego@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_01:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1015 suspectscore=1 phishscore=0 spamscore=0 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007200045
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

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-07-07 16:41:36]:

> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> Currently we use CEDE with latency-hint 0 as the only other idle state
> on a dedicated LPAR apart from the polling "snooze" state.
> 
> The platform might support additional extended CEDE idle states, which
> can be discovered through the "ibm,get-system-parameter" rtas-call
> made with CEDE_LATENCY_TOKEN.
> 
> This patch adds a function to obtain information about the extended
> CEDE idle states from the platform and parse the contents to populate
> an array of extended CEDE states. These idle states thus discovered
> will be added to the cpuidle framework in the next patch.
> 
> dmesg on a POWER9 LPAR, demonstrating the output of parsing the
> extended CEDE latency parameters.
> 
> [    5.913180] xcede : xcede_record_size = 10
> [    5.913183] xcede : Record 0 : hint = 1, latency =0x400 tb-ticks, Wake-on-irq = 1
> [    5.913188] xcede : Record 1 : hint = 2, latency =0x3e8000 tb-ticks, Wake-on-irq = 0
> [    5.913193] cpuidle : Skipping the 2 Extended CEDE idle states
> 
> Signed-off-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>

>
> ---
>  drivers/cpuidle/cpuidle-pseries.c | 129 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 127 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/cpuidle/cpuidle-pseries.c b/drivers/cpuidle/cpuidle-pseries.c
> index 39d4bb6..c13549b 100644
> --- a/drivers/cpuidle/cpuidle-pseries.c
> +++ b/drivers/cpuidle/cpuidle-pseries.c
> @@ -21,6 +21,7 @@
>  #include <asm/runlatch.h>
>  #include <asm/idle.h>
>  #include <asm/plpar_wrappers.h>
> +#include <asm/rtas.h>
> 
>  struct cpuidle_driver pseries_idle_driver = {
>  	.name             = "pseries_idle",
> @@ -105,9 +106,120 @@ static void check_and_cede_processor(void)
>  	}
>  }
> 
> -#define NR_CEDE_STATES		1  /* CEDE with latency-hint 0 */
> +struct xcede_latency_records {
> +	u8  latency_hint;
> +	u64 wakeup_latency_tb_ticks;
> +	u8  responsive_to_irqs;
> +};
> +
> +/*
> + * XCEDE : Extended CEDE states discovered through the
> + *         "ibm,get-systems-parameter" rtas-call with the token
> + *         CEDE_LATENCY_TOKEN
> + */
> +#define MAX_XCEDE_STATES		4
> +#define	XCEDE_LATENCY_RECORD_SIZE	10
> +#define XCEDE_LATENCY_PARAM_MAX_LENGTH	(2 + 2 + \
> +					(MAX_XCEDE_STATES * XCEDE_LATENCY_RECORD_SIZE))
> +
> +#define CEDE_LATENCY_TOKEN		45
> +
> +#define NR_CEDE_STATES		(MAX_XCEDE_STATES + 1) /* CEDE with latency-hint 0 */
>  #define NR_DEDICATED_STATES	(NR_CEDE_STATES + 1) /* Includes snooze */
> 
> +struct xcede_latency_records xcede_records[MAX_XCEDE_STATES];
> +unsigned int nr_xcede_records;
> +char xcede_parameters[XCEDE_LATENCY_PARAM_MAX_LENGTH];
> +
> +static int parse_cede_parameters(void)
> +{
> +	int ret = -1, i;
> +	u16 payload_length;
> +	u8 xcede_record_size;
> +	u32 total_xcede_records_size;
> +	char *payload;
> +
> +	memset(xcede_parameters, 0, XCEDE_LATENCY_PARAM_MAX_LENGTH);
> +
> +	ret = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
> +			NULL, CEDE_LATENCY_TOKEN, __pa(xcede_parameters),
> +			XCEDE_LATENCY_PARAM_MAX_LENGTH);
> +
> +	if (ret) {
> +		pr_err("xcede: Error parsing CEDE_LATENCY_TOKEN\n");
> +		return ret;
> +	}
> +
> +	payload_length = be16_to_cpu(*(__be16 *)(&xcede_parameters[0]));
> +	payload = &xcede_parameters[2];
> +
> +	/*
> +	 * If the platform supports the cede latency settings
> +	 * information system parameter it must provide the following
> +	 * information in the NULL terminated parameter string:
> +	 *
> +	 * a. The first byte is the length ???N??? of each cede
> +	 *    latency setting record minus one (zero indicates a length
> +	 *    of 1 byte).
> +	 *
> +	 * b. For each supported cede latency setting a cede latency
> +	 *    setting record consisting of the first ???N??? bytes as per
> +	 *    the following table.
> +	 *
> +	 *	-----------------------------
> +	 *	| Field           | Field  |
> +	 *	| Name            | Length |
> +	 *	-----------------------------
> +	 *	| Cede Latency    | 1 Byte |
> +	 *	| Specifier Value |        |
> +	 *	-----------------------------
> +	 *	| Maximum wakeup  |        |
> +	 *	| latency in      | 8 Bytes|
> +	 *	| tb-ticks        |        |
> +	 *	-----------------------------
> +	 *	| Responsive to   |        |
> +	 *	| external        | 1 Byte |
> +	 *	| interrupts      |        |
> +	 *	-----------------------------
> +	 *
> +	 * This version has cede latency record size = 10.
> +	 */
> +	xcede_record_size = (u8)payload[0] + 1;

This is standard PAPR interface that has been defined long time ago.
However, new H_CEDE hints that map to new platform features will
appear in the same interface and Linux needs to prepare and be ready
to check and exploit the new hints if they are useful for the given
setup.


> +
> +	if (xcede_record_size != XCEDE_LATENCY_RECORD_SIZE) {
> +		pr_err("xcede : Expected record-size %d. Observed size %d.\n",
> +		       XCEDE_LATENCY_RECORD_SIZE, xcede_record_size);
> +		return -EINVAL;
> +	}
> +
> +	pr_info("xcede : xcede_record_size = %d\n", xcede_record_size);
> +
> +	/*
> +	 * Since the payload_length includes the last NULL byte and
> +	 * the xcede_record_size, the remaining bytes correspond to
> +	 * array of all cede_latency settings.
> +	 */
> +	total_xcede_records_size = payload_length - 2;
> +	nr_xcede_records = total_xcede_records_size / xcede_record_size;
> +
> +	payload++;
> +	for (i = 0; i < nr_xcede_records; i++) {
> +		struct xcede_latency_records *record = &xcede_records[i];
> +
> +		record->latency_hint = (u8)payload[0];
> +		record->wakeup_latency_tb_ticks  =
> +			be64_to_cpu(*(__be64 *)(&payload[1]));
> +		record->responsive_to_irqs = (u8)payload[9];
> +		payload += xcede_record_size;
> +		pr_info("xcede : Record %d : hint = %u, latency =0x%llx tb-ticks, Wake-on-irq = %u\n",
> +			i, record->latency_hint,
> +			record->wakeup_latency_tb_ticks,
> +			record->responsive_to_irqs);
> +	}
> +
> +	return 0;
> +}
> +
>  u8 cede_latency_hint[NR_DEDICATED_STATES];
>  static int dedicated_cede_loop(struct cpuidle_device *dev,
>  				struct cpuidle_driver *drv,
> @@ -238,6 +350,19 @@ static int pseries_cpuidle_driver_init(void)
>  	return 0;
>  }
> 
> +static int add_pseries_idle_states(void)
> +{
> +	int nr_states = 2; /* By default we have snooze, CEDE */
> +
> +	if (parse_cede_parameters())
> +		return nr_states;
> +
> +	pr_info("cpuidle : Skipping the %d Extended CEDE idle states\n",
> +		nr_xcede_records);
> +
> +	return nr_states;

More logic will be added to this function in the subsequent patches to
actually make use of the information that is obtained from the platform
firmware.

--Vaidy


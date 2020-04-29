Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD641BD6D7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 10:08:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BrkQ6qV6zDqLP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Apr 2020 18:08:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Brds1BJ7zDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Apr 2020 18:04:48 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03T7WvPa069563; Wed, 29 Apr 2020 04:02:17 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh6vc5cr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 04:02:16 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03T7f2rA097986;
 Wed, 29 Apr 2020 04:02:16 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30mh6vc5b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 04:02:16 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03T7uRKb022662;
 Wed, 29 Apr 2020 08:02:14 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04fra.de.ibm.com with ESMTP id 30mcu59k5f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 29 Apr 2020 08:02:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03T82BEw43057160
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 29 Apr 2020 08:02:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E943AE051;
 Wed, 29 Apr 2020 08:02:11 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E9D26AE045;
 Wed, 29 Apr 2020 08:02:05 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.81.16])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 29 Apr 2020 08:02:05 +0000 (GMT)
Subject: Re: [PATCH v7 2/5] powerpc/hv-24x7: Add rtas call in hv-24x7 driver
 to get processor details
To: Kajol Jain <kjain@linux.ibm.com>, acme@kernel.org,
 linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
 sukadev@linux.vnet.ibm.com
References: <20200327063642.26175-1-kjain@linux.ibm.com>
 <20200327063642.26175-3-kjain@linux.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <fc2f519f-7dc9-cc72-496e-bc1403aa2178@linux.ibm.com>
Date: Wed, 29 Apr 2020 13:32:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200327063642.26175-3-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-29_02:2020-04-28,
 2020-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 suspectscore=0 bulkscore=0 spamscore=0 mlxscore=0 impostorscore=0
 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004290057
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
Cc: mark.rutland@arm.com, ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com,
 tglx@linutronix.de, jmario@redhat.com, mpetlan@redhat.com,
 peterz@infradead.org, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
 alexander.shishkin@linux.intel.com, linux-perf-users@vger.kernel.org,
 ak@linux.intel.com, yao.jin@linux.intel.com, anju@linux.vnet.ibm.com,
 mamatha4@linux.vnet.ibm.com, jolsa@kernel.org, namhyung@kernel.org,
 mingo@kernel.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/27/20 12:06 PM, Kajol Jain wrote:
> For hv_24x7 socket/chip level events, specific chip-id to which
> the data requested should be added as part of pmu events.
> But number of chips/socket in the system details are not exposed.
>
> Patch implements read_sys_info_pseries() to get system
> parameter values like number of sockets and chips per socket.
> Rtas_call with token "PROCESSOR_MODULE_INFO"
> is used to get these values.

Patch looks good to me.

Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> Sub-sequent patch exports these values via sysfs.
>
> Patch also make these parameters default to 1.
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   arch/powerpc/perf/hv-24x7.c              | 72 ++++++++++++++++++++++++
>   arch/powerpc/platforms/pseries/pseries.h |  3 +
>   2 files changed, 75 insertions(+)
>
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 48e8f4b17b91..9ae00f29bd21 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -20,6 +20,11 @@
>   #include <asm/io.h>
>   #include <linux/byteorder/generic.h>
>
> +#ifdef CONFIG_PPC_RTAS
> +#include <asm/rtas.h>
> +#include <../../platforms/pseries/pseries.h>
> +#endif
> +
>   #include "hv-24x7.h"
>   #include "hv-24x7-catalog.h"
>   #include "hv-common.h"
> @@ -57,6 +62,69 @@ static bool is_physical_domain(unsigned domain)
>   	}
>   }
>
> +#ifdef CONFIG_PPC_RTAS
> +#define PROCESSOR_MODULE_INFO   43
> +#define PROCESSOR_MAX_LENGTH	(8 * 1024)
> +
> +static int strbe16toh(const char *buf, int offset)
> +{
> +	return (buf[offset] << 8) + buf[offset + 1];
> +}
> +
> +static u32		physsockets;	/* Physical sockets */
> +static u32		physchips;	/* Physical chips */
> +
> +/*
> + * Function read_sys_info_pseries() make a rtas_call which require
> + * data buffer of size 8K. As standard 'rtas_data_buf' is of size
> + * 4K, we are adding new local buffer 'rtas_local_data_buf'.
> + */
> +char rtas_local_data_buf[PROCESSOR_MAX_LENGTH] __cacheline_aligned;
> +
> +/*
> + * read_sys_info_pseries()
> + * Retrieve the number of sockets and chips per socket details
> + * through the get-system-parameter rtas call.
> + */
> +void read_sys_info_pseries(void)
> +{
> +	int call_status, len, ntypes;
> +
> +	/*
> +	 * Making system parameter: chips and sockets default to 1.
> +	 */
> +	physsockets = 1;
> +	physchips = 1;
> +	memset(rtas_local_data_buf, 0, PROCESSOR_MAX_LENGTH);
> +	spin_lock(&rtas_data_buf_lock);
> +
> +	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
> +				NULL,
> +				PROCESSOR_MODULE_INFO,
> +				__pa(rtas_local_data_buf),
> +				PROCESSOR_MAX_LENGTH);
> +
> +	spin_unlock(&rtas_data_buf_lock);
> +
> +	if (call_status != 0) {
> +		pr_info("%s %s Error calling get-system-parameter (0x%x)\n",
> +			__FILE__, __func__, call_status);
> +	} else {
> +		rtas_local_data_buf[PROCESSOR_MAX_LENGTH - 1] = '\0';
> +		len = strbe16toh(rtas_local_data_buf, 0);
> +		if (len < 6)
> +			return;
> +
> +		ntypes = strbe16toh(rtas_local_data_buf, 2);
> +
> +		if (!ntypes)
> +			return;
> +		physsockets = strbe16toh(rtas_local_data_buf, 4);
> +		physchips = strbe16toh(rtas_local_data_buf, 6);
> +	}
> +}
> +#endif /* CONFIG_PPC_RTAS */
> +
>   /* Domains for which more than one result element are returned for each event. */
>   static bool domain_needs_aggregation(unsigned int domain)
>   {
> @@ -1605,6 +1673,10 @@ static int hv_24x7_init(void)
>   	if (r)
>   		return r;
>
> +#ifdef CONFIG_PPC_RTAS
> +	read_sys_info_pseries();
> +#endif
> +
>   	return 0;
>   }
>
> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
> index 13fa370a87e4..1727559ce304 100644
> --- a/arch/powerpc/platforms/pseries/pseries.h
> +++ b/arch/powerpc/platforms/pseries/pseries.h
> @@ -19,6 +19,9 @@ extern void request_event_sources_irqs(struct device_node *np,
>   struct pt_regs;
>
>   extern int pSeries_system_reset_exception(struct pt_regs *regs);
> +#ifdef CONFIG_PPC_RTAS
> +extern void read_sys_info_pseries(void);
> +#endif
>   extern int pSeries_machine_check_exception(struct pt_regs *regs);
>   extern long pseries_machine_check_realmode(struct pt_regs *regs);
>


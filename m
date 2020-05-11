Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 391F41CE726
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 May 2020 23:10:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LYVJ412yzDqrX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 07:10:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LYRx5YLRzDqkf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 07:07:57 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04BL6XZI077544; Mon, 11 May 2020 17:07:43 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30wrvpa1ae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 17:07:43 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04BL7bZk080246;
 Mon, 11 May 2020 17:07:43 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30wrvpa19w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 17:07:42 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04BL3bNR023827;
 Mon, 11 May 2020 21:07:41 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 30wm5646fp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 May 2020 21:07:41 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04BL7eE915991052
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 11 May 2020 21:07:40 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 531BA6A051;
 Mon, 11 May 2020 21:07:40 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 000816A04F;
 Mon, 11 May 2020 21:07:39 +0000 (GMT)
Received: from localhost (unknown [9.85.205.196])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 11 May 2020 21:07:39 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v8 2/5] powerpc/hv-24x7: Add rtas call in hv-24x7 driver
 to get processor details
In-Reply-To: <20200506110737.14904-3-kjain@linux.ibm.com>
References: <20200506110737.14904-1-kjain@linux.ibm.com>
 <20200506110737.14904-3-kjain@linux.ibm.com>
Date: Mon, 11 May 2020 16:07:39 -0500
Message-ID: <87blmu2nac.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-11_10:2020-05-11,
 2020-05-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=1
 mlxscore=0 bulkscore=0 malwarescore=0 adultscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2005110152
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
Cc: ravi.bangoria@linux.ibm.com, maddy@linux.vnet.ibm.com,
 anju@linux.vnet.ibm.com, peterz@infradead.org, gregkh@linuxfoundation.org,
 suka@us.ibm.com, alexander.shishkin@linux.intel.com, mingo@kernel.org,
 mpetlan@redhat.com, yao.jin@linux.intel.com, ak@linux.intel.com,
 mamatha4@linux.vnet.ibm.com, acme@kernel.org, jmario@redhat.com,
 namhyung@kernel.org, linuxppc-dev@lists.ozlabs.org, jolsa@kernel.org,
 kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Kajol Jain <kjain@linux.ibm.com> writes:
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 48e8f4b17b91..8cf242aad98f 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -20,6 +20,7 @@
>  #include <asm/io.h>
>  #include <linux/byteorder/generic.h>
>  
> +#include <asm/rtas.h>
>  #include "hv-24x7.h"
>  #include "hv-24x7-catalog.h"
>  #include "hv-common.h"
> @@ -57,6 +58,75 @@ static bool is_physical_domain(unsigned domain)
>  	}
>  }
>  
> +/*
> + * The Processor Module Information system parameter allows transferring
> + * of certain processor module information from the platform to the OS.
> + * Refer PAPR+ document to get parameter token value as '43'.
> + */
> +
> +#define PROCESSOR_MODULE_INFO   43
> +#define PROCESSOR_MAX_LENGTH	(8 * 1024)
> +
> +DEFINE_SPINLOCK(rtas_local_data_buf_lock);
> +EXPORT_SYMBOL(rtas_local_data_buf_lock);

This should be static and not exported, correct?

> +
> +static u32 phys_sockets;	/* Physical sockets */
> +static u32 phys_chipspersocket;	/* Physical chips per socket*/
> +static u32 phys_coresperchip; /* Physical cores per chip */
> +
> +/*
> + * Function read_sys_info_pseries() make a rtas_call which require
> + * data buffer of size 8K. As standard 'rtas_data_buf' is of size
> + * 4K, we are adding new local buffer 'rtas_local_data_buf'.

Sorry if this has been covered before but I don't understand why it
would require a larger buffer; by my reading this call will return *ten
bytes* of output. Also, current versions of PAPR+ limit the output
length to 4002 bytes. I feel like I'm missing something.


> + */
> +static __be16 rtas_local_data_buf[PROCESSOR_MAX_LENGTH] __cacheline_aligned;
> +
> +/*
> + * read_sys_info_pseries()
> + * Retrieve the number of sockets and chips per socket and cores per
> + * chip details through the get-system-parameter rtas call.
> + */
> +void read_sys_info_pseries(void)
> +{
> +	int call_status, len, ntypes;
> +
> +	/*
> +	 * Making system parameter: chips and sockets and cores per chip
> +	 * default to 1.
> +	 */
> +	phys_sockets = 1;
> +	phys_chipspersocket = 1;
> +	phys_coresperchip = 1;
> +	memset(rtas_local_data_buf, 0, PROCESSOR_MAX_LENGTH * sizeof(__be16));

Modifying global state outside of any critical section...? How do
you prevent readers from seeing inconsistent results?


> +	spin_lock(&rtas_local_data_buf_lock);
> +
> +	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
> +				NULL,
> +				PROCESSOR_MODULE_INFO,
> +				__pa(rtas_local_data_buf),
> +				PROCESSOR_MAX_LENGTH);
> +
> +	spin_unlock(&rtas_local_data_buf_lock);

Using this lock this way fails to provide any protection to the data
buffer or the phys_* variables.


> +
> +	if (call_status != 0) {
> +		pr_info("Error calling get-system-parameter (0x%x)\n",
> +			call_status);

To be robust, this should handle busy (-2) and extended delay (990x)
statuses. And if it's going to log errors it should use pr_err() and use
decimal, not hex, to report the RTAS call status, since that's how
they're specified in PAPR+.


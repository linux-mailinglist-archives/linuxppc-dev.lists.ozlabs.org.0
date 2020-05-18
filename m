Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79F8B1D7067
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 07:35:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49QSQg05yFzDqVF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 May 2020 15:35:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49QSP83lRqzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 May 2020 15:34:04 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04I5WNoq048451; Mon, 18 May 2020 01:32:37 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cp7c62g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 01:32:37 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04I5WYxt049633;
 Mon, 18 May 2020 01:32:36 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 312cp7c61m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 01:32:36 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04I5UD8u013603;
 Mon, 18 May 2020 05:32:35 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 3127t60pn7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 18 May 2020 05:32:35 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04I5WXU327460026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 18 May 2020 05:32:33 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3AFED78069;
 Mon, 18 May 2020 05:32:33 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F0877805F;
 Mon, 18 May 2020 05:32:26 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.95.210])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 18 May 2020 05:32:26 +0000 (GMT)
Subject: Re: [PATCH v8 2/5] powerpc/hv-24x7: Add rtas call in hv-24x7 driver
 to get processor details
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20200506110737.14904-1-kjain@linux.ibm.com>
 <20200506110737.14904-3-kjain@linux.ibm.com> <87blmu2nac.fsf@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <9c392907-03b2-bd09-51df-41609e802d6c@linux.ibm.com>
Date: Mon, 18 May 2020 11:02:25 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87blmu2nac.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-18_01:2020-05-15,
 2020-05-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 adultscore=0 mlxlogscore=999 bulkscore=0 cotscore=-2147483648
 priorityscore=1501 malwarescore=0 clxscore=1015 phishscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005180046
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



On 5/12/20 2:37 AM, Nathan Lynch wrote:
> Hi,
> 
> Kajol Jain <kjain@linux.ibm.com> writes:
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index 48e8f4b17b91..8cf242aad98f 100644
>> --- a/arch/powerpc/perf/hv-24x7.c
>> +++ b/arch/powerpc/perf/hv-24x7.c
>> @@ -20,6 +20,7 @@
>>  #include <asm/io.h>
>>  #include <linux/byteorder/generic.h>
>>  
>> +#include <asm/rtas.h>
>>  #include "hv-24x7.h"
>>  #include "hv-24x7-catalog.h"
>>  #include "hv-common.h"
>> @@ -57,6 +58,75 @@ static bool is_physical_domain(unsigned domain)
>>  	}
>>  }
>>  
>> +/*
>> + * The Processor Module Information system parameter allows transferring
>> + * of certain processor module information from the platform to the OS.
>> + * Refer PAPR+ document to get parameter token value as '43'.
>> + */
>> +
>> +#define PROCESSOR_MODULE_INFO   43
>> +#define PROCESSOR_MAX_LENGTH	(8 * 1024)
>> +
>> +DEFINE_SPINLOCK(rtas_local_data_buf_lock);
>> +EXPORT_SYMBOL(rtas_local_data_buf_lock);
> 
> This should be static and not exported, correct?
> 
>> +
>> +static u32 phys_sockets;	/* Physical sockets */
>> +static u32 phys_chipspersocket;	/* Physical chips per socket*/
>> +static u32 phys_coresperchip; /* Physical cores per chip */
>> +
>> +/*
>> + * Function read_sys_info_pseries() make a rtas_call which require
>> + * data buffer of size 8K. As standard 'rtas_data_buf' is of size
>> + * 4K, we are adding new local buffer 'rtas_local_data_buf'.
> 
> Sorry if this has been covered before but I don't understand why it
> would require a larger buffer; by my reading this call will return *ten
> bytes* of output. Also, current versions of PAPR+ limit the output
> length to 4002 bytes. I feel like I'm missing something.
> 

Hi Nathan,
	Thanks for reviewing the patch. Actually when I was testing this patch in
both power8 and power9 machine, I got some issue in power9 because of buffer size.
And I checked the buffer size used in util_linux which is 8192. So, I increase the
buffer size.I will again test it as I did couple of changes after that with 4002 size. 

> 
>> + */
>> +static __be16 rtas_local_data_buf[PROCESSOR_MAX_LENGTH] __cacheline_aligned;
>> +
>> +/*
>> + * read_sys_info_pseries()
>> + * Retrieve the number of sockets and chips per socket and cores per
>> + * chip details through the get-system-parameter rtas call.
>> + */
>> +void read_sys_info_pseries(void)
>> +{
>> +	int call_status, len, ntypes;
>> +
>> +	/*
>> +	 * Making system parameter: chips and sockets and cores per chip
>> +	 * default to 1.
>> +	 */
>> +	phys_sockets = 1;
>> +	phys_chipspersocket = 1;
>> +	phys_coresperchip = 1;
>> +	memset(rtas_local_data_buf, 0, PROCESSOR_MAX_LENGTH * sizeof(__be16));
> 
> Modifying global state outside of any critical section...? How do
> you prevent readers from seeing inconsistent results?

Yes right, Will update.

> 
> 
>> +	spin_lock(&rtas_local_data_buf_lock);
>> +
>> +	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
>> +				NULL,
>> +				PROCESSOR_MODULE_INFO,
>> +				__pa(rtas_local_data_buf),
>> +				PROCESSOR_MAX_LENGTH);
>> +
>> +	spin_unlock(&rtas_local_data_buf_lock);
> 
> Using this lock this way fails to provide any protection to the data
> buffer or the phys_* variables.
> 
> 
>> +
>> +	if (call_status != 0) {
>> +		pr_info("Error calling get-system-parameter (0x%x)\n",
>> +			call_status);
> 
> To be robust, this should handle busy (-2) and extended delay (990x)
> statuses. And if it's going to log errors it should use pr_err() and use
> decimal, not hex, to report the RTAS call status, since that's how
> they're specified in PAPR+.

Thanks for pointing it, Will update.

Thanks,
Kajol Jain
 

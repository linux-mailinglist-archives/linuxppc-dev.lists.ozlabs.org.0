Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2C21C6DC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 11:56:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HBn602lCzDqk5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 19:56:10 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HBl21NqxzDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 19:54:21 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0469VvWX103413; Wed, 6 May 2020 05:53:45 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30u8syypnk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 05:53:45 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0469XAB6107303;
 Wed, 6 May 2020 05:53:45 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30u8syypmx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 05:53:44 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0469oYQ4029071;
 Wed, 6 May 2020 09:53:43 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma04dal.us.ibm.com with ESMTP id 30s0g705ra-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 May 2020 09:53:43 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0469rgL948300448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 May 2020 09:53:42 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 85B0D7805F;
 Wed,  6 May 2020 09:53:42 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AF14D7805E;
 Wed,  6 May 2020 09:53:33 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.39.184])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 May 2020 09:53:33 +0000 (GMT)
From: kajoljain <kjain@linux.ibm.com>
Subject: Re: [PATCH v7 2/5] powerpc/hv-24x7: Add rtas call in hv-24x7 driver
 to get processor details
To: Michael Ellerman <mpe@ellerman.id.au>, acme@kernel.org,
 linuxppc-dev@lists.ozlabs.org, sukadev@linux.vnet.ibm.com
References: <20200327063642.26175-1-kjain@linux.ibm.com>
 <20200327063642.26175-3-kjain@linux.ibm.com>
 <87ftcmfryt.fsf@mpe.ellerman.id.au>
Message-ID: <0b9c9d6c-736e-4981-aa62-6d12e327eeda@linux.ibm.com>
Date: Wed, 6 May 2020 15:23:32 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87ftcmfryt.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-06_03:2020-05-04,
 2020-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 mlxscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2005060072
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



On 4/29/20 5:01 PM, Michael Ellerman wrote:
> Hi Kajol,
> 
> Some comments inline ...
> 
> Kajol Jain <kjain@linux.ibm.com> writes:
>> For hv_24x7 socket/chip level events, specific chip-id to which
>> the data requested should be added as part of pmu events.
>> But number of chips/socket in the system details are not exposed.
>>
>> Patch implements read_sys_info_pseries() to get system
>> parameter values like number of sockets and chips per socket.
>> Rtas_call with token "PROCESSOR_MODULE_INFO"
>> is used to get these values.
>>
>> Sub-sequent patch exports these values via sysfs.
>>
>> Patch also make these parameters default to 1.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/perf/hv-24x7.c              | 72 ++++++++++++++++++++++++
>>  arch/powerpc/platforms/pseries/pseries.h |  3 +
>>  2 files changed, 75 insertions(+)
>>
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index 48e8f4b17b91..9ae00f29bd21 100644
>> --- a/arch/powerpc/perf/hv-24x7.c
>> +++ b/arch/powerpc/perf/hv-24x7.c
>> @@ -20,6 +20,11 @@
>>  #include <asm/io.h>
>>  #include <linux/byteorder/generic.h>
>>  
>> +#ifdef CONFIG_PPC_RTAS
> 
> This driver can only be build on pseries, and pseries always selects
> RTAS. So the ifdef is unncessary.

Hi Michael,
	Thanks for review, I will remove this check.

> 
>> +#include <asm/rtas.h>
>> +#include <../../platforms/pseries/pseries.h>
>> +#endif
> 
> That's not really what the platform header is intended for.
> 
> You should put the extern in arch/powerpc/include/asm somewhere.
> 
> Maybe rtas.h
> 
>> @@ -57,6 +62,69 @@ static bool is_physical_domain(unsigned domain)
>>  	}
>>  }
>>  
>> +#ifdef CONFIG_PPC_RTAS
> 
> Not needed.
> 
>> +#define PROCESSOR_MODULE_INFO   43
> 
> Please document where these come from, presumably LoPAPR somewhere?
> 

Sure, will add the details.

>> +#define PROCESSOR_MAX_LENGTH	(8 * 1024)
>> +
>> +static int strbe16toh(const char *buf, int offset)
>> +{
>> +	return (buf[offset] << 8) + buf[offset + 1];
>> +}
> 
> I'm confused by this. "str" implies string, a string is an array of
> bytes and has no endian. But then be16 implies it's an array of __be16,
> in which case buf should be a __be16 *.
> 

Yes right, actually I was following implementation in util-linux. But what you
suggested make more sense, will update accordingly.

>> +
>> +static u32		physsockets;	/* Physical sockets */
>> +static u32		physchips;	/* Physical chips */
> 
> No tabs there please.

Sure will update.

> 
>> +
>> +/*
>> + * Function read_sys_info_pseries() make a rtas_call which require
>> + * data buffer of size 8K. As standard 'rtas_data_buf' is of size
>> + * 4K, we are adding new local buffer 'rtas_local_data_buf'.
>> + */
>> +char rtas_local_data_buf[PROCESSOR_MAX_LENGTH] __cacheline_aligned;
> 
> static?
> 
>> +/*
>> + * read_sys_info_pseries()
>> + * Retrieve the number of sockets and chips per socket details
>> + * through the get-system-parameter rtas call.
>> + */
>> +void read_sys_info_pseries(void)
>> +{
>> +	int call_status, len, ntypes;
>> +
>> +	/*
>> +	 * Making system parameter: chips and sockets default to 1.
>> +	 */
>> +	physsockets = 1;
>> +	physchips = 1;
>> +	memset(rtas_local_data_buf, 0, PROCESSOR_MAX_LENGTH);
>> +	spin_lock(&rtas_data_buf_lock);
> 
> You're not using the rtas_data_buf, so why are you taking the
> rtas_data_buf_lock?

Sure, I will add new lock specific for rtas_local_data_buf

> 
>> +	call_status = rtas_call(rtas_token("ibm,get-system-parameter"), 3, 1,
>> +				NULL,
>> +				PROCESSOR_MODULE_INFO,
>> +				__pa(rtas_local_data_buf),
>> +				PROCESSOR_MAX_LENGTH);
>> +
>> +	spin_unlock(&rtas_data_buf_lock);
>> +
>> +	if (call_status != 0) {
>> +		pr_info("%s %s Error calling get-system-parameter (0x%x)\n",
>> +			__FILE__, __func__, call_status);
> 
> pr_err(), don't use __FILE__, this file already uses pr_fmt(). Not sure
> __func__ is really necessary either
> 
> 		return;
> 
> Then you can deindent the next block.
> 
>> +	} else {
>> +		rtas_local_data_buf[PROCESSOR_MAX_LENGTH - 1] = '\0';
>> +		len = strbe16toh(rtas_local_data_buf, 0);
> 
> Why isn't the buffer a __be16 array, and then you just use be16_to_cpu() ?
> 
>> +		if (len < 6)
>> +			return;
>> +
>> +		ntypes = strbe16toh(rtas_local_data_buf, 2);
>> +
>> +		if (!ntypes)
>> +			return;
> 
> What is ntype
ntype specify processor module type

> 
>> +		physsockets = strbe16toh(rtas_local_data_buf, 4);
>> +		physchips = strbe16toh(rtas_local_data_buf, 6);
>> +	}
>> +}
>> +#endif /* CONFIG_PPC_RTAS */
>> +
>>  /* Domains for which more than one result element are returned for each event. */
>>  static bool domain_needs_aggregation(unsigned int domain)
>>  {
>> @@ -1605,6 +1673,10 @@ static int hv_24x7_init(void)
>>  	if (r)
>>  		return r;
>>  
>> +#ifdef CONFIG_PPC_RTAS
>> +	read_sys_info_pseries();
>> +#endif
>

Will remove this config checks.

Thanks,
Kajol Jain

 
>> +
>>  	return 0;
>>  }
>>  
>> diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
>> index 13fa370a87e4..1727559ce304 100644
>> --- a/arch/powerpc/platforms/pseries/pseries.h
>> +++ b/arch/powerpc/platforms/pseries/pseries.h
>> @@ -19,6 +19,9 @@ extern void request_event_sources_irqs(struct device_node *np,
>>  struct pt_regs;
>>  
>>  extern int pSeries_system_reset_exception(struct pt_regs *regs);
>> +#ifdef CONFIG_PPC_RTAS
>> +extern void read_sys_info_pseries(void);
>> +#endif
>>  extern int pSeries_machine_check_exception(struct pt_regs *regs);
>>  extern long pseries_machine_check_realmode(struct pt_regs *regs);
> > 
> cheers
> 

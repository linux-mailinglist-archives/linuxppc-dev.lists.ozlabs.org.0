Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F711D0717
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 08:23:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MPjp0vplzDqrs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 16:22:54 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MPgc6nWCzDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 16:21:00 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04D61sOh031007; Wed, 13 May 2020 02:20:46 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101m0y6h0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 02:20:46 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04D62TLR038255;
 Wed, 13 May 2020 02:20:45 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101m0y6g4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 02:20:45 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04D6KOQ5021383;
 Wed, 13 May 2020 06:20:44 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3100ubnapn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 06:20:44 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04D6KgEq59244800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 06:20:42 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 222A06A051;
 Wed, 13 May 2020 06:20:42 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 561556A04D;
 Wed, 13 May 2020 06:20:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.52.192])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 13 May 2020 06:20:34 +0000 (GMT)
Subject: Re: [PATCH v8 5/5] powerpc/hv-24x7: Update post_mobility_fixup() to
 handle migration
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20200506110737.14904-1-kjain@linux.ibm.com>
 <20200506110737.14904-6-kjain@linux.ibm.com> <87eerq2rcc.fsf@linux.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <c6aa251e-ed71-17c1-d60e-f8b447e93c33@linux.ibm.com>
Date: Wed, 13 May 2020 11:50:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <87eerq2rcc.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_01:2020-05-11,
 2020-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 cotscore=-2147483648 impostorscore=0 phishscore=0
 clxscore=1011 mlxlogscore=999 malwarescore=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005130050
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



On 5/12/20 1:10 AM, Nathan Lynch wrote:
> Hello,
> 
> Kajol Jain <kjain@linux.ibm.com> writes:
>> Function 'read_sys_info_pseries()' is added to get system parameter
>> values like number of sockets and chips per socket.
>> and it gets these details via rtas_call with token
>> "PROCESSOR_MODULE_INFO".
>>
>> Incase lpar migrate from one system to another, system
>> parameter details like chips per sockets or number of sockets might
>> change. So, it needs to be re-initialized otherwise, these values
>> corresponds to previous system values.
>> This patch adds a call to 'read_sys_info_pseries()' from
>> 'post-mobility_fixup()' to re-init the physsockets and physchips values
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/mobility.c | 16 ++++++++++++++++
>>  1 file changed, 16 insertions(+)
> 
> Please cc me on patches for this code, thanks.

Hi Nathan,
	Thanks for reviewing the patch. I will cc you on next version of this patchset.
> 
> I see no technical problems with how this patch handles partition
> migration. However:
> 
> "Update post_mobility_fixup() to handle migration" is not an appropriate
> summary for this change. post_mobility_fixup() already handles
> migration. A better summary would be
> 
> "powerpc/pseries: update hv-24x7 info after migration"

Will update.

> 
> 
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>> index b571285f6c14..0fb8f1e6e9d2 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -42,6 +42,12 @@ struct update_props_workarea {
>>  #define MIGRATION_SCOPE	(1)
>>  #define PRRN_SCOPE -2
>>  
>> +#ifdef CONFIG_HV_PERF_CTRS
>> +void read_sys_info_pseries(void);
>> +#else
>> +static inline void read_sys_info_pseries(void) { }
>> +#endif
> 
> This should go in a header.
> 
> 
>>  static int mobility_rtas_call(int token, char *buf, s32 scope)
>>  {
>>  	int rc;
>> @@ -371,6 +377,16 @@ void post_mobility_fixup(void)
>>  	/* Possibly switch to a new RFI flush type */
>>  	pseries_setup_rfi_flush();
>>  
>> +	/*
>> +	 * In case an Lpar migrates from one system to another, system
>> +	 * parameter details like chips per sockets, cores per chip and
>> +	 * number of sockets details might change.
>> +	 * So, they needs to be re-initialized otherwise the
>> +	 * values will correspond to the previous system.
>> +	 * Call read_sys_info_pseries() to reinitialise the values.
>> +	 */
> 
> This is needlessly verbose; any literate reader of this code knows this
> is used immediately after resuming from a suspend (migration). If you
> give your hook a more descriptive name, the comment becomes unnecessary.
> 

Yes make sense, will update.

Thanks,
Kajol Jain

> 
>> +	read_sys_info_pseries();
>> +
> 

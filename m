Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DBC1C4E89
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 08:59:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GVvC61dLzDqcQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 16:59:03 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GVsX41bPzDqV5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 16:57:36 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0456flWT004453; Tue, 5 May 2020 02:57:13 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4gumg2e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 02:57:13 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0456gAwC005174;
 Tue, 5 May 2020 02:57:12 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30s4gumg17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 02:57:12 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0456o6xo025873;
 Tue, 5 May 2020 06:57:10 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 30s0g66pd4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 06:57:10 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0456v92n53018984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 06:57:09 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EF87124054;
 Tue,  5 May 2020 06:57:09 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53540124053;
 Tue,  5 May 2020 06:57:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.84.82])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 06:57:02 +0000 (GMT)
Subject: Re: [PATCH v7 5/5] powerpc/hv-24x7: Update post_mobility_fixup() to
 handle migration
To: Michael Ellerman <mpe@ellerman.id.au>, acme@kernel.org,
 linuxppc-dev@lists.ozlabs.org, sukadev@linux.vnet.ibm.com
References: <20200327063642.26175-1-kjain@linux.ibm.com>
 <20200327063642.26175-6-kjain@linux.ibm.com>
 <877dxyfrpz.fsf@mpe.ellerman.id.au>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <9586f8ef-1f3e-d45c-e0dc-665889a4f190@linux.ibm.com>
Date: Tue, 5 May 2020 12:27:00 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <877dxyfrpz.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_02:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 lowpriorityscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050051
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



On 4/29/20 5:07 PM, Michael Ellerman wrote:
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
>> 'post-mobility_fixup()' to re-init the physsockets and physchips values.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  arch/powerpc/platforms/pseries/mobility.c | 12 ++++++++++++
>>  1 file changed, 12 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
>> index b571285f6c14..226accd6218b 100644
>> --- a/arch/powerpc/platforms/pseries/mobility.c
>> +++ b/arch/powerpc/platforms/pseries/mobility.c
>> @@ -371,6 +371,18 @@ void post_mobility_fixup(void)
>>  	/* Possibly switch to a new RFI flush type */
>>  	pseries_setup_rfi_flush();
>>  
>> +	/*
>> +	 * Incase lpar migrate from one system to another, system
> 
> In case an LPAR migrates
> 
>> +	 * parameter details like chips per sockets and number of sockets
>> +	 * might change. So, it needs to be re-initialized otherwise these
>                              ^                                       ^
>                              they need                               the
>> +	 * values corresponds to previous system.
>                   ^
>                   will correspond to the
> 
>> +	 * Here, adding a call to read_sys_info_pseries() declared in
> 
> Adding is the wrong tense in a comment. When someone reads the comment
> the code has already been added. Past tense would be right, but really
> the comment shouldn't say what you did, it should say why.
> 
>> +	 * platforms/pseries/pseries.h to re-init the physsockets and
>> +	 * physchips value.
> 
> Call read_sys_info_pseries() to reinitialise the values.
> 
>> +	 */
>> +	if (IS_ENABLED(CONFIG_HV_PERF_CTRS) && IS_ENABLED(CONFIG_PPC_RTAS))
>> +		read_sys_info_pseries();
> 
> The RTAS check is not needed. pseries always selects RTAS.
> 
> You shouldn't need the IS_ENABLED() check here though, do it with an
> empty version in the header when CONFIG_HV_PERF_CTRS is not enabled.
> 

Hi Michael,
	Thanks for reviewing the patch. Is something like this you are suggesting. Please
let me know if my understanding is fine.

+#ifndef CONFIG_HV_PERF_CTRS
+#define read_sys_info_pseries() 
+#endif

Thanks,
Kajol Jain
> cheers
> 

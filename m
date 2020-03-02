Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F1750175CF1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Mar 2020 15:25:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WMr72G6LzDq9m
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 01:25:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WMnt2xRNzDqXr
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 01:23:44 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 022EKrQa025261
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 2 Mar 2020 09:23:41 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yfhs3qrcy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 09:23:41 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <maddy@linux.ibm.com>;
 Mon, 2 Mar 2020 14:23:39 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 2 Mar 2020 14:23:34 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 022ENXTY54395004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 Mar 2020 14:23:33 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5210F4C04E;
 Mon,  2 Mar 2020 14:23:33 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA27E4C044;
 Mon,  2 Mar 2020 14:23:27 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.48.197])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  2 Mar 2020 14:23:27 +0000 (GMT)
Subject: Re: [RFC 02/11] perf/core: Data structure to present hazard data
To: Peter Zijlstra <peterz@infradead.org>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>
References: <20200302052355.36365-1-ravi.bangoria@linux.ibm.com>
 <20200302052355.36365-3-ravi.bangoria@linux.ibm.com>
 <20200302095515.GR18400@hirez.programming.kicks-ass.net>
From: maddy <maddy@linux.ibm.com>
Date: Mon, 2 Mar 2020 19:53:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200302095515.GR18400@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20030214-0016-0000-0000-000002EC4BF6
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030214-0017-0000-0000-0000334F8EBF
Message-Id: <c9dc6d62-3847-4080-8122-d62621455372@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-02_04:2020-03-02,
 2020-03-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2003020105
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
Cc: mark.rutland@arm.com, ak@linux.intel.com,
 alexander.shishkin@linux.intel.com, jolsa@redhat.com,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 eranian@google.com, adrian.hunter@intel.com, robert.richter@amd.com,
 yao.jin@linux.intel.com, mingo@redhat.com, paulus@samba.org, acme@kernel.org,
 namhyung@kernel.org, kim.phillips@amd.com, linuxppc-dev@lists.ozlabs.org,
 alexey.budankov@linux.intel.com, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/2/20 3:25 PM, Peter Zijlstra wrote:
> On Mon, Mar 02, 2020 at 10:53:46AM +0530, Ravi Bangoria wrote:
>> From: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
>>
>> Introduce new perf sample_type PERF_SAMPLE_PIPELINE_HAZ to request kernel
>> to provide cpu pipeline hazard data. Also, introduce arch independent
>> structure 'perf_pipeline_haz_data' to pass hazard data to userspace. This
>> is generic structure and arch specific data needs to be converted to this
>> format.
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>>   include/linux/perf_event.h            |  7 ++++++
>>   include/uapi/linux/perf_event.h       | 32 ++++++++++++++++++++++++++-
>>   kernel/events/core.c                  |  6 +++++
>>   tools/include/uapi/linux/perf_event.h | 32 ++++++++++++++++++++++++++-
>>   4 files changed, 75 insertions(+), 2 deletions(-)
>>
>> diff --git a/include/linux/perf_event.h b/include/linux/perf_event.h
>> index 547773f5894e..d5b606e3c57d 100644
>> --- a/include/linux/perf_event.h
>> +++ b/include/linux/perf_event.h
>> @@ -1001,6 +1001,7 @@ struct perf_sample_data {
>>   	u64				stack_user_size;
>>   
>>   	u64				phys_addr;
>> +	struct perf_pipeline_haz_data	pipeline_haz;
>>   } ____cacheline_aligned;
>>   
>>   /* default value for data source */
>> @@ -1021,6 +1022,12 @@ static inline void perf_sample_data_init(struct perf_sample_data *data,
>>   	data->weight = 0;
>>   	data->data_src.val = PERF_MEM_NA;
>>   	data->txn = 0;
>> +	data->pipeline_haz.itype = PERF_HAZ__ITYPE_NA;
>> +	data->pipeline_haz.icache = PERF_HAZ__ICACHE_NA;
>> +	data->pipeline_haz.hazard_stage = PERF_HAZ__PIPE_STAGE_NA;
>> +	data->pipeline_haz.hazard_reason = PERF_HAZ__HREASON_NA;
>> +	data->pipeline_haz.stall_stage = PERF_HAZ__PIPE_STAGE_NA;
>> +	data->pipeline_haz.stall_reason = PERF_HAZ__SREASON_NA;
>>   }
> NAK, Don't touch anything outside of the first cacheline here.

My bad, should have looked at the comment in "struct perf_sample_data {".
Will move it to perf_prepare_sample().

Thanks for comments.
Maddy


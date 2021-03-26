Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 944DF34A32E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 09:33:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6FcY2tpHz3c1j
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 19:33:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rfj/lJxp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rfj/lJxp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6Fc51JvFz302X
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Mar 2021 19:33:24 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12Q85fR3026754; Fri, 26 Mar 2021 04:33:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=cChZkv+v3RHZi9hahy+PJZFUm7hR0ITMKjeluEp3Cr4=;
 b=rfj/lJxp+ifesKphm4RHO2szVX2wzfbBl+KUY0SQxrX5ty1er6JZi5sZ8E5DnKMZrAz5
 NAG22Ke2+v1yNHMyeBLVPQ5p64hgjnznJdJ4EV7aEXOnVnpPoZ7FC88ziH/IOlwHjJmH
 ZXGEEpGoLYwgzn5xTGjRxnVziViS+tnafKWKSW1GVDVKDxHmj8mCD16pQrpjk4T/YMww
 oi7rQhJE4pjrDZ7PkZCFRGU0LpbQD88M3/oxXviT5DgG7V7eDsXb/Fc6RLKN4UvzLE0P
 01UDCxVWbVP0/Q5KgLA5qM2keRLuBLHDOP2zr2H3/jyp3Dyc7d+Yay7vutEB53Z4wmIl Hw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37h9vuk76s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 04:33:07 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12Q8X36d029427;
 Fri, 26 Mar 2021 08:33:03 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37h15a8f3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 26 Mar 2021 08:33:03 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12Q8WBWB41222650
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 26 Mar 2021 08:32:11 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B94E11C058;
 Fri, 26 Mar 2021 08:32:11 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F3ABF11C04A;
 Fri, 26 Mar 2021 08:32:04 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.205.23])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 26 Mar 2021 08:32:04 +0000 (GMT)
Subject: Re: [PATCH V2 1/5] powerpc/perf: Expose processor pipeline stage
 cycles using PERF_SAMPLE_WEIGHT_STRUCT
To: Arnaldo Carvalho de Melo <acme@kernel.org>
References: <1616425047-1666-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1616425047-1666-2-git-send-email-atrajeev@linux.vnet.ibm.com>
 <d7dd633b-e28a-155a-a8e2-0e5a83b4eead@linux.ibm.com>
 <YFyKw1ezDio0z9yM@kernel.org>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <f9f4ff0a-35dc-7adf-2470-d5172e1b4629@linux.ibm.com>
Date: Fri, 26 Mar 2021 14:02:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <YFyKw1ezDio0z9yM@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oZ3ANj_MBJoGv-l7S4yYDP3GjXvdGTJx
X-Proofpoint-GUID: oZ3ANj_MBJoGv-l7S4yYDP3GjXvdGTJx
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-26_02:2021-03-25,
 2021-03-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2103250000 definitions=main-2103260058
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
Cc: ravi.bangoria@linux.ibm.com, Athira Rajeev <atrajeev@linux.vnet.ibm.com>,
 peterz@infradead.org, linux-kernel@vger.kernel.org,
 linux-perf-users@vger.kernel.org, jolsa@kernel.org, kjain@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, kan.liang@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 3/25/21 6:36 PM, Arnaldo Carvalho de Melo wrote:
> Em Wed, Mar 24, 2021 at 10:05:23AM +0530, Madhavan Srinivasan escreveu:
>> On 3/22/21 8:27 PM, Athira Rajeev wrote:
>>> Performance Monitoring Unit (PMU) registers in powerpc provides
>>> information on cycles elapsed between different stages in the
>>> pipeline. This can be used for application tuning. On ISA v3.1
>>> platform, this information is exposed by sampling registers.
>>> Patch adds kernel support to capture two of the cycle counters
>>> as part of perf sample using the sample type:
>>> PERF_SAMPLE_WEIGHT_STRUCT.
>>>
>>> The power PMU function 'get_mem_weight' currently uses 64 bit weight
>>> field of perf_sample_data to capture memory latency. But following the
>>> introduction of PERF_SAMPLE_WEIGHT_TYPE, weight field could contain
>>> 64-bit or 32-bit value depending on the architexture support for
>>> PERF_SAMPLE_WEIGHT_STRUCT. Patches uses WEIGHT_STRUCT to expose the
>>> pipeline stage cycles info. Hence update the ppmu functions to work for
>>> 64-bit and 32-bit weight values.
>>>
>>> If the sample type is PERF_SAMPLE_WEIGHT, use the 64-bit weight field.
>>> if the sample type is PERF_SAMPLE_WEIGHT_STRUCT, memory subsystem
>>> latency is stored in the low 32bits of perf_sample_weight structure.
>>> Also for CPU_FTR_ARCH_31, capture the two cycle counter information in
>>> two 16 bit fields of perf_sample_weight structure.
>> Changes looks fine to me.
> You mean just the kernel part or can I add your Reviewed-by to all the
> patchset?


Yes, kindly add it, I did review the patchset. My bad, i should have 
mentioned it here

or should have replied to the cover letter.


Maddy


>   
>> Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>>
>>
>>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>>> ---
>>>    arch/powerpc/include/asm/perf_event_server.h |  2 +-
>>>    arch/powerpc/perf/core-book3s.c              |  4 ++--
>>>    arch/powerpc/perf/isa207-common.c            | 29 +++++++++++++++++++++++++---
>>>    arch/powerpc/perf/isa207-common.h            |  6 +++++-
>>>    4 files changed, 34 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
>>> index 00e7e671bb4b..112cf092d7b3 100644
>>> --- a/arch/powerpc/include/asm/perf_event_server.h
>>> +++ b/arch/powerpc/include/asm/perf_event_server.h
>>> @@ -43,7 +43,7 @@ struct power_pmu {
>>>    				u64 alt[]);
>>>    	void		(*get_mem_data_src)(union perf_mem_data_src *dsrc,
>>>    				u32 flags, struct pt_regs *regs);
>>> -	void		(*get_mem_weight)(u64 *weight);
>>> +	void		(*get_mem_weight)(u64 *weight, u64 type);
>>>    	unsigned long	group_constraint_mask;
>>>    	unsigned long	group_constraint_val;
>>>    	u64             (*bhrb_filter_map)(u64 branch_sample_type);
>>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
>>> index 766f064f00fb..6936763246bd 100644
>>> --- a/arch/powerpc/perf/core-book3s.c
>>> +++ b/arch/powerpc/perf/core-book3s.c
>>> @@ -2206,9 +2206,9 @@ static void record_and_restart(struct perf_event *event, unsigned long val,
>>>    						ppmu->get_mem_data_src)
>>>    			ppmu->get_mem_data_src(&data.data_src, ppmu->flags, regs);
>>> -		if (event->attr.sample_type & PERF_SAMPLE_WEIGHT &&
>>> +		if (event->attr.sample_type & PERF_SAMPLE_WEIGHT_TYPE &&
>>>    						ppmu->get_mem_weight)
>>> -			ppmu->get_mem_weight(&data.weight.full);
>>> +			ppmu->get_mem_weight(&data.weight.full, event->attr.sample_type);
>>>    		if (perf_event_overflow(event, &data, regs))
>>>    			power_pmu_stop(event, 0);
>>> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
>>> index e4f577da33d8..5dcbdbd54598 100644
>>> --- a/arch/powerpc/perf/isa207-common.c
>>> +++ b/arch/powerpc/perf/isa207-common.c
>>> @@ -284,8 +284,10 @@ void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
>>>    	}
>>>    }
>>> -void isa207_get_mem_weight(u64 *weight)
>>> +void isa207_get_mem_weight(u64 *weight, u64 type)
>>>    {
>>> +	union perf_sample_weight *weight_fields;
>>> +	u64 weight_lat;
>>>    	u64 mmcra = mfspr(SPRN_MMCRA);
>>>    	u64 exp = MMCRA_THR_CTR_EXP(mmcra);
>>>    	u64 mantissa = MMCRA_THR_CTR_MANT(mmcra);
>>> @@ -296,9 +298,30 @@ void isa207_get_mem_weight(u64 *weight)
>>>    		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
>>>    	if (val == 0 || val == 7)
>>> -		*weight = 0;
>>> +		weight_lat = 0;
>>>    	else
>>> -		*weight = mantissa << (2 * exp);
>>> +		weight_lat = mantissa << (2 * exp);
>>> +
>>> +	/*
>>> +	 * Use 64 bit weight field (full) if sample type is
>>> +	 * WEIGHT.
>>> +	 *
>>> +	 * if sample type is WEIGHT_STRUCT:
>>> +	 * - store memory latency in the lower 32 bits.
>>> +	 * - For ISA v3.1, use remaining two 16 bit fields of
>>> +	 *   perf_sample_weight to store cycle counter values
>>> +	 *   from sier2.
>>> +	 */
>>> +	weight_fields = (union perf_sample_weight *)weight;
>>> +	if (type & PERF_SAMPLE_WEIGHT)
>>> +		weight_fields->full = weight_lat;
>>> +	else {
>>> +		weight_fields->var1_dw = (u32)weight_lat;
>>> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>>> +			weight_fields->var2_w = P10_SIER2_FINISH_CYC(mfspr(SPRN_SIER2));
>>> +			weight_fields->var3_w = P10_SIER2_DISPATCH_CYC(mfspr(SPRN_SIER2));
>>> +		}
>>> +	}
>>>    }
>>>    int isa207_get_constraint(u64 event, unsigned long *maskp, unsigned long *valp, u64 event_config1)
>>> diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
>>> index 1af0e8c97ac7..fc30d43c4d0c 100644
>>> --- a/arch/powerpc/perf/isa207-common.h
>>> +++ b/arch/powerpc/perf/isa207-common.h
>>> @@ -265,6 +265,10 @@
>>>    #define ISA207_SIER_DATA_SRC_SHIFT	53
>>>    #define ISA207_SIER_DATA_SRC_MASK	(0x7ull << ISA207_SIER_DATA_SRC_SHIFT)
>>> +/* Bits in SIER2/SIER3 for Power10 */
>>> +#define P10_SIER2_FINISH_CYC(sier2)	(((sier2) >> (63 - 37)) & 0x7fful)
>>> +#define P10_SIER2_DISPATCH_CYC(sier2)	(((sier2) >> (63 - 13)) & 0x7fful)
>>> +
>>>    #define P(a, b)				PERF_MEM_S(a, b)
>>>    #define PH(a, b)			(P(LVL, HIT) | P(a, b))
>>>    #define PM(a, b)			(P(LVL, MISS) | P(a, b))
>>> @@ -278,6 +282,6 @@ int isa207_get_alternatives(u64 event, u64 alt[], int size, unsigned int flags,
>>>    					const unsigned int ev_alt[][MAX_ALT]);
>>>    void isa207_get_mem_data_src(union perf_mem_data_src *dsrc, u32 flags,
>>>    							struct pt_regs *regs);
>>> -void isa207_get_mem_weight(u64 *weight);
>>> +void isa207_get_mem_weight(u64 *weight, u64 type);
>>>    #endif

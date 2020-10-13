Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1A8A28CED8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 15:00:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9bHm3d0ZzDqYn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 00:00:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KX+JTrgs; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9bDJ5tdhzDqWW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 23:57:20 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09DCX3Im186717; Tue, 13 Oct 2020 08:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=HU3ez8iPPOQHeAieHip9pJ/o8bmHny7oOPGA3c1d3ag=;
 b=KX+JTrgsdZVR1j3BreD3ETk6JADliWThQqUN7SssqQ04HmDkgop1dDL6284vOzRPP2Ud
 JAT2taDxg1nVlW+oq9FR2+z2o+gDsASgBqcuB/5JEkTOXgHIHUseuOswiijfDxpe6MjB
 ohi4CdSeptvkP5zlk2n11jSR+cwnTeQJrrOpjGFIvj7PjRhNL7NkiE9o8UFxMpE8bTNJ
 ffs1xaOzoMA2imWfTSnY+1dtEiOkPGgb/x2PJ0HDt2ZodO8KBJk70qQbTjvJDGrls1YK
 AGM5Q7c3M6ng4vUF0coeTsVUJ6ZraY4j2YhcOPnwwXgV6S6NNdzcCaonLZswIN1ZlgrB 3w== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345c8ds151-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 08:57:11 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09DClci7030932;
 Tue, 13 Oct 2020 12:57:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 344558ryh4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 12:57:09 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09DCv7Xp18284878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Oct 2020 12:57:07 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29795A4057;
 Tue, 13 Oct 2020 12:57:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 53BE4A4053;
 Tue, 13 Oct 2020 12:57:06 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.92.151])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 13 Oct 2020 12:57:06 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf: fix Threshold Event CounterMultiplier width
 for P10
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20201012103128.53243-1-maddy@linux.ibm.com>
 <20201012112905.GQ29778@kitsune.suse.cz>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <b840fcf3-6546-159e-e23a-c8fe00123539@linux.ibm.com>
Date: Tue, 13 Oct 2020 18:27:05 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201012112905.GQ29778@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-13_03:2020-10-13,
 2020-10-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 mlxscore=0 bulkscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010130096
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
Cc: atrajeev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/12/20 4:59 PM, Michal Suchánek wrote:
> Hello,
>
> On Mon, Oct 12, 2020 at 04:01:28PM +0530, Madhavan Srinivasan wrote:
>> Power9 and isa v3.1 has 7bit mantissa field for Threshold Event Counter
>                    ^^^ Shouldn't his be 3.0?

My bad, What I meant was

Power9, ISA v3.0 and ISA v3.1 define a 7 bit mantissa field for 
Threshold Event Counter Multiplier(TECM).

Maddy

>
>> Multiplier (TECM). TECM is part of Monitor Mode Control Register A (MMCRA).
>> This field along with Threshold Event Counter Exponent (TECE) is used to
>> get threshould counter value. In Power10, the width of TECM field is
>> increase to 8bits. Patch fixes the current code to modify the MMCRA[TECM]
>> extraction macro to handling this changes.
>>
>> Fixes: 170a315f41c64 ('powerpc/perf: Support to export MMCRA[TEC*] field to userspace')
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>   arch/powerpc/perf/isa207-common.c | 3 +++
>>   arch/powerpc/perf/isa207-common.h | 4 ++++
>>   2 files changed, 7 insertions(+)
>>
>> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
>> index 964437adec18..5fe129f02290 100644
>> --- a/arch/powerpc/perf/isa207-common.c
>> +++ b/arch/powerpc/perf/isa207-common.c
>> @@ -247,6 +247,9 @@ void isa207_get_mem_weight(u64 *weight)
>>   	u64 sier = mfspr(SPRN_SIER);
>>   	u64 val = (sier & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
>>   
>> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
>> +		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
>> +
>>   	if (val == 0 || val == 7)
>>   		*weight = 0;
>>   	else
>> diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
>> index 044de65e96b9..71380e854f48 100644
>> --- a/arch/powerpc/perf/isa207-common.h
>> +++ b/arch/powerpc/perf/isa207-common.h
>> @@ -219,6 +219,10 @@
>>   #define MMCRA_THR_CTR_EXP(v)		(((v) >> MMCRA_THR_CTR_EXP_SHIFT) &\
>>   						MMCRA_THR_CTR_EXP_MASK)
>>   
>> +#define P10_MMCRA_THR_CTR_MANT_MASK	0xFFul
>> +#define P10_MMCRA_THR_CTR_MANT(v)	(((v) >> MMCRA_THR_CTR_MANT_SHIFT) &\
>> +						P10_MMCRA_THR_CTR_MANT_MASK)
>> +
>>   /* MMCRA Threshold Compare bit constant for power9 */
>>   #define p9_MMCRA_THR_CMP_SHIFT	45
>>   
>> -- 
>> 2.26.2
>>

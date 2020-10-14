Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5904F28D9B0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 07:52:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CB1lS3LcRzDqlJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 16:52:20 +1100 (AEDT)
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
 header.s=pp1 header.b=gKHuCF/x; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CB1jN3C45zDqTb
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 16:50:32 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E5Xhsu139407; Wed, 14 Oct 2020 01:50:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=pO0QDP3LZBu82xPwMh0tH9zjOKZAsRTJGlqjBgp5jYc=;
 b=gKHuCF/x9DSNa/t04Hxz84AKf0otwZNhZkFmlVcJZsxNEA1NYndsK57Ou2pc7Gom7AZ6
 MyRLxiNCf5j915n7+bzNfF5ljhpSzie5kkQh91d0uWDcPzoX7JO+eJsoDHzc+MLGmHHl
 MZnXQO5GHe2VCkMM8aXIqr5R5DXggnzlX5OLx83/JQDR4Knhsq/Z1WZ4aaIWwrsIy2UQ
 UALzFMcJfwfUjkWfkswyPkif7A1k9rmHV8Z6e6N+XuGog+txLAUyK9cB064w+ziFARGn
 GPM8fhA9TLmeyrMBg84B9ZZQ9ykn31AI1kybNnssrONawUonkln8PZbJ15GAjXGmBCEr Ug== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345u44rmja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 01:50:25 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09E5iSNs023328;
 Wed, 14 Oct 2020 05:50:23 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 3434k7sy2q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 05:50:23 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 09E5oK1i13500802
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 05:50:21 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE7235205A;
 Wed, 14 Oct 2020 05:50:20 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.199.39.122])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D3F4652051;
 Wed, 14 Oct 2020 05:50:19 +0000 (GMT)
Subject: Re: [PATCH] powerpc/perf: fix Threshold Event CounterMultiplier width
 for P10
To: =?UTF-8?Q?Michal_Such=c3=a1nek?= <msuchanek@suse.de>
References: <20201012103128.53243-1-maddy@linux.ibm.com>
 <20201012112905.GQ29778@kitsune.suse.cz>
 <b840fcf3-6546-159e-e23a-c8fe00123539@linux.ibm.com>
 <20201013155842.GY29778@kitsune.suse.cz>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <e24fef80-9f72-b4cb-3bf8-866eeeba0a80@linux.ibm.com>
Date: Wed, 14 Oct 2020 11:20:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20201013155842.GY29778@kitsune.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_03:2020-10-14,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2010140038
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


On 10/13/20 9:28 PM, Michal Suchánek wrote:
> On Tue, Oct 13, 2020 at 06:27:05PM +0530, Madhavan Srinivasan wrote:
>> On 10/12/20 4:59 PM, Michal Suchánek wrote:
>>> Hello,
>>>
>>> On Mon, Oct 12, 2020 at 04:01:28PM +0530, Madhavan Srinivasan wrote:
>>>> Power9 and isa v3.1 has 7bit mantissa field for Threshold Event Counter
>>>                     ^^^ Shouldn't his be 3.0?
>> My bad, What I meant was
>>
>> Power9, ISA v3.0 and ISA v3.1 define a 7 bit mantissa field for Threshold
>> Event Counter Multiplier(TECM).
> I am really confused.
>
> The following text and the code suggests that the mantissa is 8bit on
> POWER10 and ISA v3.1.

Ok got it. Will fix the CPU_FTR_ARCH_31 check.

Thanks for review

Maddy
>
> Thanks
>
> Michal
>> Maddy
>>
>>>> Multiplier (TECM). TECM is part of Monitor Mode Control Register A (MMCRA).
>>>> This field along with Threshold Event Counter Exponent (TECE) is used to
>>>> get threshould counter value. In Power10, the width of TECM field is
>>>> increase to 8bits. Patch fixes the current code to modify the MMCRA[TECM]
>>>> extraction macro to handling this changes.
>>>>
>>>> Fixes: 170a315f41c64 ('powerpc/perf: Support to export MMCRA[TEC*] field to userspace')
>>>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>>>> ---
>>>>    arch/powerpc/perf/isa207-common.c | 3 +++
>>>>    arch/powerpc/perf/isa207-common.h | 4 ++++
>>>>    2 files changed, 7 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/perf/isa207-common.c b/arch/powerpc/perf/isa207-common.c
>>>> index 964437adec18..5fe129f02290 100644
>>>> --- a/arch/powerpc/perf/isa207-common.c
>>>> +++ b/arch/powerpc/perf/isa207-common.c
>>>> @@ -247,6 +247,9 @@ void isa207_get_mem_weight(u64 *weight)
>>>>    	u64 sier = mfspr(SPRN_SIER);
>>>>    	u64 val = (sier & ISA207_SIER_TYPE_MASK) >> ISA207_SIER_TYPE_SHIFT;
>>>> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
>>>> +		mantissa = P10_MMCRA_THR_CTR_MANT(mmcra);
>>>> +
>>>>    	if (val == 0 || val == 7)
>>>>    		*weight = 0;
>>>>    	else
>>>> diff --git a/arch/powerpc/perf/isa207-common.h b/arch/powerpc/perf/isa207-common.h
>>>> index 044de65e96b9..71380e854f48 100644
>>>> --- a/arch/powerpc/perf/isa207-common.h
>>>> +++ b/arch/powerpc/perf/isa207-common.h
>>>> @@ -219,6 +219,10 @@
>>>>    #define MMCRA_THR_CTR_EXP(v)		(((v) >> MMCRA_THR_CTR_EXP_SHIFT) &\
>>>>    						MMCRA_THR_CTR_EXP_MASK)
>>>> +#define P10_MMCRA_THR_CTR_MANT_MASK	0xFFul
>>>> +#define P10_MMCRA_THR_CTR_MANT(v)	(((v) >> MMCRA_THR_CTR_MANT_SHIFT) &\
>>>> +						P10_MMCRA_THR_CTR_MANT_MASK)
>>>> +
>>>>    /* MMCRA Threshold Compare bit constant for power9 */
>>>>    #define p9_MMCRA_THR_CMP_SHIFT	45
>>>> -- 
>>>> 2.26.2
>>>>

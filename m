Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D7433AA8B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 05:43:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzP1d6PGMz3cVx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 15:43:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ADrXPF4T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ADrXPF4T; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzP1C0sHqz30Lk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 15:42:54 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12F4fEnU029748; Mon, 15 Mar 2021 00:42:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=j8LNqCQn6S5qTytD74OUK2QwYQ44vd6F16Saa1U4nao=;
 b=ADrXPF4T7ajMHTyu0OxI0RtllxSJJ3NRz2Bzq05cYpM1kSbucMkjC4ulDVr359mZ+1/O
 p4+KFrLDQImNFvf0M8qVu/Gu2pNiOfEIMpPRAsEWYQe7cRtRG4ebYREuc8qimxMlY2Dx
 ezGfyHxqZqyllvA1dNsE3oCXK6o6Y92BEjiBvvJ8osvexSilrvy23VTv6AIKN1d6uh7G
 3i/DU2ONQMbmnUIjSj5EYgUK+iZ49Hl7nKABLH/XBcpxAsFlgRW7dXXH1jbb77YkKns2
 hQVraVBM8KwzrXdBUYGqF2oj0h1q03thUYSHKeLovChHAG3swSw8WhJGETqwn4eMdLsz wg== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 379ra7rgav-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 00:42:50 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12F4gc1X010540;
 Mon, 15 Mar 2021 04:42:47 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04fra.de.ibm.com with ESMTP id 378n188rdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 04:42:47 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12F4gjPV42008924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 04:42:45 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48F4452050;
 Mon, 15 Mar 2021 04:42:45 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.80.219.156])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1748F5204E;
 Mon, 15 Mar 2021 04:42:43 +0000 (GMT)
Subject: Re: [PATCH V2 1/2] powerpc/perf: Infrastructure to support checking
 of attr.config*
To: "Paul A. Clarke" <pc@us.ibm.com>
References: <20210226065025.1254973-1-maddy@linux.ibm.com>
 <20210226140340.GA36821@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <36f06b91-d3fe-ad7e-bf73-d7023ce2a62b@linux.ibm.com>
Date: Mon, 15 Mar 2021 10:12:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210226140340.GA36821@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_01:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 clxscore=1015 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103150030
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2/26/21 7:33 PM, Paul A. Clarke wrote:
> Another drive-by review... just some minor nits, below...
>
> On Fri, Feb 26, 2021 at 12:20:24PM +0530, Madhavan Srinivasan wrote:
>> Introduce code to support the checking of attr.config* for
>> values which are reserved for a given platform.
>> Performance Monitoring Unit (PMU) configuration registers
>> have fields that are reserved and specific value to bit field
> I'd reword to "some specific values for bit fields are reserved".
>
>> as reserved. For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
> s/Randome/Random/
> This occurs here, and below, and in patch 2/2.
>
>> and value of 0b11 to this field is reserved.
> s/to/for/
>
>> Writing a non-zero values in these fields or writing invalid
>> value to bit fields will have unknown behaviours.
> Suggest: Writing non-zero or invalid values in these fields
> will have unknown behaviors. (or "behaviours" ;-)
>
> PC

Thanks for the review. Will fix it.

Maddy

>
>> Patch adds a generic call-back function "check_attr_config"
>> in "struct power_pmu", to be called in event_init to
>> check for attr.config* values for a given platform.
>> "check_attr_config" is valid only for raw event type.
>>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>> Changelog v1:
>> -Fixed commit message and in-code comments
>>
>>   arch/powerpc/include/asm/perf_event_server.h |  6 ++++++
>>   arch/powerpc/perf/core-book3s.c              | 14 ++++++++++++++
>>   2 files changed, 20 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/perf_event_server.h b/arch/powerpc/include/asm/perf_event_server.h
>> index 00e7e671bb4b..dde97d7d9253 100644
>> --- a/arch/powerpc/include/asm/perf_event_server.h
>> +++ b/arch/powerpc/include/asm/perf_event_server.h
>> @@ -67,6 +67,12 @@ struct power_pmu {
>>   	 * the pmu supports extended perf regs capability
>>   	 */
>>   	int		capabilities;
>> +	/*
>> +	 * Function to check event code for values which are
>> +	 * reserved. Function takes struct perf_event as input,
>> +	 * since event code could be spread in attr.config*
>> +	 */
>> +	int		(*check_attr_config)(struct perf_event *ev);
>>   };
>>
>>   /*
>> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
>> index 6817331e22ff..c6eeb4fdc5fd 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -1958,6 +1958,20 @@ static int power_pmu_event_init(struct perf_event *event)
>>
>>   		if (ppmu->blacklist_ev && is_event_blacklisted(ev))
>>   			return -EINVAL;
>> +		/*
>> +		 * PMU config registers have fields that are
>> +		 * reserved and specific value to bit field as reserved.
>> +		 * For ex., MMCRA[61:62] is Randome Sampling Mode (SM)
>> +		 * and value of 0b11 to this field is reserved.
>> +		 *
>> +		 * This check is needed only for raw event type,
>> +		 * since tools like fuzzer use raw event type to
>> +		 * provide randomized event code values for test.
>> +		 *
>> +		 */
>> +		if (ppmu->check_attr_config &&
>> +		    ppmu->check_attr_config(event))
>> +			return -EINVAL;
>>   		break;
>>   	default:
>>   		return -ENOENT;
>> -- 
>> 2.26.2
>>

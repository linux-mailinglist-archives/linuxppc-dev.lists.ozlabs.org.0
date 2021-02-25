Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 581C0324A9F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 07:40:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmNSm13jBz3ccL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 17:40:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NYqsdxb7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NYqsdxb7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmNSG1GKnz30Qn
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 17:39:41 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 11P6XkqN030121; Thu, 25 Feb 2021 01:39:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hjUxqf7nEi7fhb5f9+fhBMl0iVly077eH52B28q5eso=;
 b=NYqsdxb7khviaMnBFCfKWQ+ocL/WqmWctTPVzkxlNxCpIJnk/Dkm8JBouxsjpTkLnGy8
 EDapdPhUEwxSrdz8UEdpxdGe8sA6cE/flwONKGfzCjLqo+dY36ElxVkThzlZa2mys89r
 56OP6fVfe4mfOINTnYYFOG8Y7WMO6hHsb3xekgL8Sc8DaBeE0smfcX4QQC/QrRrEJn+X
 nq1SiYv+d9ZICws9YVhDw/6hNKBb/idXbZGamNjMz0fk2ag8KgLOjDZ8g334l79gjfZo
 l+UwMsnZeD7n3C6OgFnYaK3y2EawsdqztIVBs+1tXgATSdx8JEu9diVLtQiymX8ERmJt rw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36wvsf7sys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 01:39:33 -0500
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11P6RN3u023159;
 Thu, 25 Feb 2021 06:39:31 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma01fra.de.ibm.com with ESMTP id 36tt28a6gs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Feb 2021 06:39:31 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11P6dTu427590972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Feb 2021 06:39:29 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0898F4C05C;
 Thu, 25 Feb 2021 06:39:29 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CEDC4C040;
 Thu, 25 Feb 2021 06:39:24 +0000 (GMT)
Received: from Madhavan.PrimaryTP (unknown [9.85.193.159])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Feb 2021 06:39:24 +0000 (GMT)
Subject: Re: [PATCH 1/2] powerpc/perf: Infrastructure to support checking of
 attr.config*
To: "Paul A. Clarke" <pc@us.ibm.com>
References: <20210224142840.1170088-1-maddy@linux.ibm.com>
 <20210224144758.GA566251@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <6ce2cd93-f3c6-0389-2acb-ae1a32b68c14@linux.ibm.com>
Date: Thu, 25 Feb 2021 12:09:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20210224144758.GA566251@li-24c3614c-2adc-11b2-a85c-85f334518bdb.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-02-25_01:2021-02-24,
 2021-02-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 mlxscore=0 suspectscore=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102250055
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2/24/21 8:17 PM, Paul A. Clarke wrote:
> On Wed, Feb 24, 2021 at 07:58:39PM +0530, Madhavan Srinivasan wrote:
>> Introduce code to support the checking of attr.config* for
>> values which are reserved for a given platform.
>> Performance Monitoring Unit (PMU) configuration registers
>> have fileds that are reserved and specific values to bit fields
> s/fileds/fields/
>
>> as reserved. Writing a none zero values in these fields
> Should the previous sentences say something like "required values
> for specific bit fields" or "specific bit fields that are reserved"?
>
> s/none zero/non-zero/
>
>> or writing invalid value to bit fields will have unknown
>> behaviours.
>>
>> Patch here add a generic call-back function "check_attr_config"
> s/add/adds/ or "This patch adds ..." or just "Add ...".


Thanks for the review. Will fix it.


>
>> in "struct power_pmu", to be called in event_init to
>> check for attr.config* values for a given platform.
>> "check_attr_config" is valid only for raw event type.
>>
>> Suggested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
>> ---
>>   arch/powerpc/include/asm/perf_event_server.h |  6 ++++++
>>   arch/powerpc/perf/core-book3s.c              | 12 ++++++++++++
>>   2 files changed, 18 insertions(+)
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
>> index 6817331e22ff..679d67506299 100644
>> --- a/arch/powerpc/perf/core-book3s.c
>> +++ b/arch/powerpc/perf/core-book3s.c
>> @@ -1958,6 +1958,18 @@ static int power_pmu_event_init(struct perf_event *event)
>>
>>   		if (ppmu->blacklist_ev && is_event_blacklisted(ev))
>>   			return -EINVAL;
>> +		/*
>> +		 * PMU config registers have fileds that are
>> +		 * reserved and spacific values to bit fileds be reserved.
> s/spacific/specific/
> s/fileds/fields/
> Same comment about "specific values to bit fields be reserved", and
> rewording that to be more clear.
>
>> +		 * This call-back will check the event code for same.
>> +		 *
>> +		 * Event type hardware and hw_cache will not value
>> +		 * invalid values in the event code which is not true
>> +		 * for raw event type.
> I confess I don't understand what this means. (But it could be just me!)


My bad. What I wanted to say was, this check is needed only

for raw event type, since tools like fuzzer use it to provide

randomized event code values for test. Will fix the comment

Thanks for the review comments.


>
>> +		 */
>> +		if (ppmu->check_attr_config &&
>> +		    ppmu->check_attr_config(event))
>> +			return -EINVAL;
>>   		break;
>>   	default:
>>   		return -ENOENT;
>> -- 
> PC

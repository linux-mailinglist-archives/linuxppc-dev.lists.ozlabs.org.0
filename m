Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6F9800254
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 04:57:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BmTfhFec;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShK511N87z3dFB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 14:57:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BmTfhFec;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShK4763Ycz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 14:56:23 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B13qMsp004977;
	Fri, 1 Dec 2023 03:56:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=UW/OAmV80KHBR96eJ/1ueW7bbGQPu139+gQWTWTOTh4=;
 b=BmTfhFecxF7+cr429rIYhy9rK2j3fRsrd8sJJmkCZTxt0bTbCZMPjGQ1UJGYe/ByzkXG
 3e2y5J5Zv/PJOxHnnlhQZwFj3KOngW0NeHv1g9fKQw/H8v2Z2pLjT2zpEZqGG0UiSUvt
 Px9cBh3KVTWvoBxKYWCYYNasFbntMbNe4DRkf7VR6JRh2NG9ayFJMrEFbPFxp2qzXOKw
 UTxE4VQvfhxbh/GpY5L6OExp1wjnD43gmoMfH1ELjZoxqSIHGPCPSl2xUpnRkmqD7wiz
 vBxA5JxyNIDGXCakybka7U7tnZRkZ54sBuzve0iNGYgyCsrettqdVqTwDXwnHXUK9lBA 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq7y281rq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 03:56:14 +0000
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B13rbXW007263;
	Fri, 1 Dec 2023 03:56:14 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq7y281rb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 03:56:13 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B12JTgS015440;
	Fri, 1 Dec 2023 03:56:11 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ukwy2a6hd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 03:56:11 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B13u8id21693182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Dec 2023 03:56:08 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 51D475805C;
	Fri,  1 Dec 2023 03:56:08 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1E815805D;
	Fri,  1 Dec 2023 03:56:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.87.193])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Dec 2023 03:56:06 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20231129075424.240653-1-haren@linux.ibm.com>
 <87a5qw10do.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
From: Haren Myneni <haren@linux.ibm.com>
Message-ID: <1f37e526-127e-e374-2a0e-ef0ef151b12c@linux.ibm.com>
Date: Thu, 30 Nov 2023 19:56:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87a5qw10do.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: JDJfwVVuPsq6TzUeMj9_t_bjMFfrD4C2
X-Proofpoint-GUID: Mq871PEg8vP3LrPJ3zTag0jwHWleFre2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_01,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010022
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/29/23 5:43 PM, Nathan Lynch wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
>> VAS allocate, modify and deallocate HCALLs returns
>> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
>> delay and expects OS to reissue HCALL after that delay. But using
>> msleep() will often sleep at least 20 msecs even though the
>> hypervisor expects to reissue these HCALLs after 1 or 10msecs.
> 
> I would word this as "the architecture suggests that the OS reissue
> these [...]" instead of framing it as something the platform "expects".
> 
>> It might cause these HCALLs takes longer when multiple threads
>> issue open or close VAS windows simultaneously.
> 
> This is imprecise. Over-sleeping by the OS doesn't cause individual
> hcalls to take longer. It is more accurate to say that the higher-level
> operation (allocate, modify, free) may take longer than necessary in
> cases where the OS must retry the hcalls involved.

Correct, takes longer with multiple threads opening/closing windows. I 
will make it clear.

> 
>> So instead of msleep(), use usleep_range() to ensure sleep with
>> the expected value before issuing HCALL again.
>>
>> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>
>>
>> ---
>> v1 -> v2:
>> - Use usleep_range instead of using RTAS sleep routine as
>>    suggested by Nathan
>> ---
>>   arch/powerpc/platforms/pseries/vas.c | 24 +++++++++++++++++++++++-
>>   1 file changed, 23 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
>> index 71d52a670d95..bade4402741f 100644
>> --- a/arch/powerpc/platforms/pseries/vas.c
>> +++ b/arch/powerpc/platforms/pseries/vas.c
>> @@ -36,9 +36,31 @@ static bool migration_in_progress;
>>   
>>   static long hcall_return_busy_check(long rc)
>>   {
>> +	unsigned int ms;
> 
> This should move down into the H_IS_LONG_BUSY() block if it's not used
> outside of it.
> 
>> +
>>   	/* Check if we are stalled for some time */
>>   	if (H_IS_LONG_BUSY(rc)) {
>> -		msleep(get_longbusy_msecs(rc));
>> +		ms = get_longbusy_msecs(rc);
>> +		/*
>> +		 * Allocate, Modify and Deallocate HCALLs returns
>> +		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
>> +		 * for the long delay. So the delay should always be 1
>> +		 * or 10msecs, but sleeps 1msec in case if the long
>> +		 * delay is > H_LONG_BUSY_ORDER_10_MSEC.
>> +		 */
>> +		if (ms > 10)
>> +			ms = 1;
> 
> It's strange to coerce ms to 1 when it's greater than 10. Just clamp it
> to 10, e.g.
> 
>                  ms = clamp(get_longbusy_msecs(rc), 1, 10);

Sure, these HCALLs should not return > H_LONG_BUSY_ORDER_10_MSEC.

> 
>> +
>> +		/*
>> +		 * msleep() will often sleep at least 20 msecs even
>> +		 * though the hypervisor expects to reissue these
>> +		 * HCALLs after 1 or 10msecs. So use usleep_range()
>> +		 * to sleep with the expected value.
>> +		 *
>> +		 * See Documentation/timers/timers-howto.rst on using
>> +		 * the value range in usleep_range().
>> +		 */
>> +		usleep_range(ms * 100, ms * 1000);
> 
> If there's going to be commentary here I think it should just explain
> why potentially sleeping for less than the suggested time is OK. There
> is wording you can crib in rtas_busy_delay().
> 
> 
>>   		rc = H_BUSY;
>>   	} else if (rc == H_BUSY) {
>>   		cond_resched();
>> -- 
>> 2.26.3

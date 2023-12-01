Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C05800266
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 05:11:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CgdOs3uf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShKPJ4nGvz3cVg
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 15:11:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CgdOs3uf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShKNR1wNMz30fD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Dec 2023 15:10:30 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B14938M021932;
	Fri, 1 Dec 2023 04:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hllCYVrSqvh/onECszaAD+XQRDC7j5BKavopJhIT/3o=;
 b=CgdOs3ufH9yNUBTOL/vgisGkW9m5+XDDP9hKLTUExDR6sdRValZpVUj9mz6fOrSZirT2
 MmdI3nqbgX7u6gUjcFD5ZdHJRtg6VWMv9CBgwLCa8SikGUp4VOOVC1cb0QUppPD0s4gy
 XX9f+FZKYJsG80bJ7qV4Qtge1q+Dh2BII8nT7Gz2KZGRxS/95Ur/l/604FSDuMFN8iFR
 0yYOLWSDJ1CI9D26Ff20BJV8TYKMHEIHrOQuwiZX4ZJR0HQRMkSaRuLAxo1qw/07oX3s
 kiP72TSty2Hqy1frh42IFSL5cvpBrMUZzfyzyEiooqjU6bSpQLHIGqn+3fSu5B1xZi8m rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq6qh9sgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 04:10:20 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B149HHv024771;
	Fri, 1 Dec 2023 04:10:20 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uq6qh9sfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 04:10:20 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B12JPOO029999;
	Fri, 1 Dec 2023 04:10:19 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukun02y2w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Dec 2023 04:10:19 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B14AGSY3736238
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Dec 2023 04:10:16 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B75358059;
	Fri,  1 Dec 2023 04:10:16 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3FF7F58043;
	Fri,  1 Dec 2023 04:10:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.87.193])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  1 Dec 2023 04:10:15 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20231129075424.240653-1-haren@linux.ibm.com>
 <871qc82dts.fsf@mail.lhotse>
From: Haren Myneni <haren@linux.ibm.com>
Message-ID: <98493419-72b3-4392-6bf4-4ac0fd43549d@linux.ibm.com>
Date: Thu, 30 Nov 2023 20:10:14 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <871qc82dts.fsf@mail.lhotse>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: k9V8jpMh_uU2ZbHKQnRak9H2IJgwmgSo
X-Proofpoint-GUID: n3KK-cofpam9jvw-WAQbTlQ-2UQ-Qhrg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-01_01,2023-11-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=999 phishscore=0 spamscore=0 bulkscore=0
 suspectscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312010023
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
Cc: nathanl@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/29/23 6:07 PM, Michael Ellerman wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
>> VAS allocate, modify and deallocate HCALLs returns
>> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
>> delay and expects OS to reissue HCALL after that delay. But using
>> msleep() will often sleep at least 20 msecs even though the
>> hypervisor expects to reissue these HCALLs after 1 or 10msecs.
>> It might cause these HCALLs takes longer when multiple threads
>> issue open or close VAS windows simultaneously.
>>
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
> I don't understand this. The hypervisor asked you to sleep for more than
> 10 milliseconds, so instead you sleep for 1?
> 
> I can understand that we don't want to usleep() for the longer durations
> that could be returned, but so shouldn't the code be using msleep() for
> those values?
> 
> Sleeping for a very short duration definitely seems wrong.

Allocate, modify and deallocate HCALLs return only 1MSECS and 10MSECS 
for long delay. we should not expect > 10MSECS for these HCALLs. Hence 
ms = 1 if ms > 10

But it is confusing. So will use ms = 10 for ms >= 10 as Nathan suggested.

> 
> 
>> +		/*
>> +		 * msleep() will often sleep at least 20 msecs even
>> +		 * though the hypervisor expects to reissue these
>   
> That makes it sound like the hypervisor is reissuing the hcalls.
> 
> Better would be "the hypervisor suggests the kernel should reissue the
> hcall after ...".
> 
>> +		 * HCALLs after 1 or 10msecs. So use usleep_range()
>> +		 * to sleep with the expected value.
>> +		 *
>> +		 * See Documentation/timers/timers-howto.rst on using
>> +		 * the value range in usleep_range().
>> +		 */
>> +		usleep_range(ms * 100, ms * 1000);
> 
> If ms == 1, then that's 100 usecs, which is not 1 millisecond?
> 
> Please use USEC_PER_MSEC.

Using usleep_range() same way as mentioned in  rtas_busy_delay().


Thanks
Haren

> 
>>   		rc = H_BUSY;
>>   	} else if (rc == H_BUSY) {
>>   		cond_resched();
> 
> cheers
> 

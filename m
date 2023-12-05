Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC07C804E27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 10:42:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eseCFvs+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkwYK32Ztz3d9G
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 20:42:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=eseCFvs+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkwXQ6bbtz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 20:41:26 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B58puO7022191;
	Tue, 5 Dec 2023 09:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LOZ71nqKB1YViNGSJ4zg3iIa8bIXA4UwCeigzew7QYg=;
 b=eseCFvs+tpGHcU9LS75utjQyn3ucC+Y9lDcW1dp94dbWjDV0QOeLxwFjdwB6ShD/WZhe
 i3tz8++gh1JQnG2O/2xdQFIUm/SpNq26rCD3z/JvBUAz52qemlXN6ms4P5VTI9n98s9l
 ucmOYl3T+fNx0eM9g8LpEZ9tnn77y34lBRMnDv02w3feYLMhq/ZoT9OnTFiPu7f6+zTm
 QiKI+QbJxbmGYQzah7sXd757A/wIv44Lc146A6Eq+XzUH+MZd+lZ1BEvtAxN1Fxo+mBK
 lNA1gZMkZg6DtLGWcexcFtxAUdeMa9EZqMXM5DN0I85uCYM763C0nS7AZaV/KLCr+Eoi SQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ut0et1rr0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 09:41:20 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3B59GQkS003782;
	Tue, 5 Dec 2023 09:41:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ut0et1rpm-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 09:41:20 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3B57YF52009150;
	Tue, 5 Dec 2023 09:22:02 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3urgdkwkfc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Dec 2023 09:22:02 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3B59M1Ou43713260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 5 Dec 2023 09:22:01 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4DEED5805A;
	Tue,  5 Dec 2023 09:22:01 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 710095805C;
	Tue,  5 Dec 2023 09:22:00 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.87.193])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  5 Dec 2023 09:22:00 +0000 (GMT)
Subject: Re: [PATCH v3] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
To: "Aneesh Kumar K.V (IBM)" <aneesh.kumar@kernel.org>,
        linuxppc-dev@lists.ozlabs.org
References: <20231203020115.860099-1-haren@linux.ibm.com>
 <87r0k283lk.fsf@kernel.org>
From: Haren Myneni <haren@linux.ibm.com>
Message-ID: <ad7853f5-0899-7e0d-89e6-b5c1e4742a11@linux.ibm.com>
Date: Tue, 5 Dec 2023 01:21:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87r0k283lk.fsf@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rXefadSEe9G2p6GfmxHERkp5pnSXiGHX
X-Proofpoint-GUID: eORk87oZ-wQZlAuncq3zvBLUMB4QzN02
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-05_04,2023-12-04_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1011
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2312050078
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



On 12/4/23 6:05 AM, Aneesh Kumar K.V (IBM) wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> 
>> VAS allocate, modify and deallocate HCALLs returns
>> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
>> delay and expects OS to reissue HCALL after that delay. But using
>> msleep() will often sleep at least 20 msecs even though the
>> hypervisor suggests OS reissue these HCALLs after 1 or 10msecs.
>> The open and close VAS window functions hold mutex and then issue
>> these HCALLs. So these operations can take longer than the
>> necessary when multiple threads issue open or close window APIs
>> simultaneously.
>>
>> So instead of msleep(), use usleep_range() to ensure sleep with
>> the expected value before issuing HCALL again.
>>
> 
> Can you summarize if there an user observable impact for the current
> code? We have other code paths using msleep(get_longbusy_msec()). Should
> we audit those usages?

As mentioned in the description, the open and close VAS window APIs can 
take longer with simultaneous calls, especially might affect the 
performance in the case of repeat open/close APIs for each compression 
request. On the large machine configuration which allows more 
simultaneous open windows (Ex: 240 cores provides 4800 VAS credits), the 
user can observe mutex contention around open/close HCAlls and hung-up 
traces in dmesg. I will repost the patch with this update in the commit 
message.

I think applicable to use the similar approach for other HCALLs (like in 
rtas_busy_delay()) but I have not seen any impact so far with other 
HCALLs. So we can add this change later.

Thanks
Haren

> 
> 
>>
>> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
>> Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>
>>
>> ---
>> v1 -> v2:
>> - Use usleep_range instead of using RTAS sleep routine as
>>    suggested by Nathan
>> v2 -> v3:
>> - Sleep 10MSecs even for HCALL delay > 10MSecs and the other
>>    commit / comemnt changes as suggested by Nathan and Ellerman.
>> ---
>>   arch/powerpc/platforms/pseries/vas.c | 25 ++++++++++++++++++++++++-
>>   1 file changed, 24 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
>> index 71d52a670d95..5cf81c564d4b 100644
>> --- a/arch/powerpc/platforms/pseries/vas.c
>> +++ b/arch/powerpc/platforms/pseries/vas.c
>> @@ -38,7 +38,30 @@ static long hcall_return_busy_check(long rc)
>>   {
>>   	/* Check if we are stalled for some time */
>>   	if (H_IS_LONG_BUSY(rc)) {
>> -		msleep(get_longbusy_msecs(rc));
>> +		unsigned int ms;
>> +		/*
>> +		 * Allocate, Modify and Deallocate HCALLs returns
>> +		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
>> +		 * for the long delay. So the sleep time should always
>> +		 * be either 1 or 10msecs, but in case if the HCALL
>> +		 * returns the long delay > 10 msecs, clamp the sleep
>> +		 * time to 10msecs.
>> +		 */
>> +		ms = clamp(get_longbusy_msecs(rc), 1, 10);
>> +
>> +		/*
>> +		 * msleep() will often sleep at least 20 msecs even
>> +		 * though the hypervisor suggests that the OS reissue
>> +		 * HCALLs after 1 or 10msecs. Also the delay hint from
>> +		 * the HCALL is just a suggestion. So OK to pause for
>> +		 * less time than the hinted delay. Use usleep_range()
>> +		 * to ensure we don't sleep much longer than actually
>> +		 * needed.
>> +		 *
>> +		 * See Documentation/timers/timers-howto.rst for
>> +		 * explanation of the range used here.
>> +		 */
>> +		usleep_range(ms * 100, ms * 1000);
>>   		rc = H_BUSY;
>>   	} else if (rc == H_BUSY) {
>>   		cond_resched();
>> -- 
>> 2.26.3

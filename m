Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D49B7365644
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 12:35:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FPg7g5jFCz2yxv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Apr 2021 20:35:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=J6SM0lZC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=J6SM0lZC; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FPg7C2Hxgz2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Apr 2021 20:35:18 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13KAYIS2063898; Tue, 20 Apr 2021 06:35:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=WiMo99gLkUAuR75uZ24zdfzcsbKs1KvaLQmmwdky6SU=;
 b=J6SM0lZCfFH7ulT0Vh6cfO15LsUEN+oIXA+/pBAcwUxaVxixtbzunVT1em166ayV1+eS
 cTnd6GJqc2T2HrKv0ozRI3H0XmPCjSQVqhqpNlIB2hIKPAJgwPieny1z+8DKBbWHygpu
 2B9FEeSkvFu6oXHDBhb3p9i6zXw3ycyBv2rJdtaNXQ7nltwSHJxHeVuLUCj0jUOFWYMX
 em+5MmbYQQcaR6YvdUOCREldUVcOcckwH0wYA0PDEkhlr4Jz1AN1npE7XuduR8m0CAw+
 rdfoqo75XsUGPH52INFjV4XTNFk1IkpCEh3ERD6KCd/yuGBZZ7gJoyvEjoNrD5an9EWU 3Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 381kspdp8j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 06:35:11 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13KAYnuT064967;
 Tue, 20 Apr 2021 06:35:10 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 381kspdp7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 06:35:10 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13KASJVQ030387;
 Tue, 20 Apr 2021 10:35:08 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 37ypxh8w9a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 20 Apr 2021 10:35:08 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13KAZ63r59834630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Apr 2021 10:35:06 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 43E9952067;
 Tue, 20 Apr 2021 10:35:06 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.71.35])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 3E05B52080;
 Tue, 20 Apr 2021 10:35:05 +0000 (GMT)
Subject: Re: [PATCH] powerpc/mce: save ignore_event flag unconditionally for UE
To: Santosh Sivaraj <santosh@fossix.org>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20210407045816.352276-1-ganeshgr@linux.ibm.com>
 <87bla9zae7.fsf@fossix.org>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <9b8c7347-47fe-822d-7fae-9365bb7cde7c@linux.ibm.com>
Date: Tue, 20 Apr 2021 16:05:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <87bla9zae7.fsf@fossix.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nQ0JCt4L_cZATvhwXKKTA3QQMN3XqOnS
X-Proofpoint-ORIG-GUID: ksHL5DHPph4Pp4mUUR84Kj4IrXMo6GLs
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-20_02:2021-04-19,
 2021-04-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 adultscore=0 clxscore=1011 mlxscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 mlxlogscore=999 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104200080
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/20/21 12:54 PM, Santosh Sivaraj wrote:

> Hi Ganesh,
>
> Ganesh Goudar <ganeshgr@linux.ibm.com> writes:
>
>> When we hit an UE while using machine check safe copy routines,
>> ignore_event flag is set and the event is ignored by mce handler,
>> And the flag is also saved for defered handling and printing of
>> mce event information, But as of now saving of this flag is done
>> on checking if the effective address is provided or physical address
>> is calculated, which is not right.
>>
>> Save ignore_event flag regardless of whether the effective address is
>> provided or physical address is calculated.
>>
>> Without this change following log is seen, when the event is to be
>> ignored.
>>
>> [  512.971365] MCE: CPU1: machine check (Severe)  UE Load/Store [Recovered]
>> [  512.971509] MCE: CPU1: NIP: [c0000000000b67c0] memcpy+0x40/0x90
>> [  512.971655] MCE: CPU1: Initiator CPU
>> [  512.971739] MCE: CPU1: Unknown
>> [  512.972209] MCE: CPU1: machine check (Severe)  UE Load/Store [Recovered]
>> [  512.972334] MCE: CPU1: NIP: [c0000000000b6808] memcpy+0x88/0x90
>> [  512.972456] MCE: CPU1: Initiator CPU
>> [  512.972534] MCE: CPU1: Unknown
>>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>>   arch/powerpc/kernel/mce.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
>> index 11f0cae086ed..db9363e131ce 100644
>> --- a/arch/powerpc/kernel/mce.c
>> +++ b/arch/powerpc/kernel/mce.c
>> @@ -131,6 +131,8 @@ void save_mce_event(struct pt_regs *regs, long handled,
>>   	 * Populate the mce error_type and type-specific error_type.
>>   	 */
>>   	mce_set_error_info(mce, mce_err);
>> +	if (mce->error_type == MCE_ERROR_TYPE_UE)
>> +		mce->u.ue_error.ignore_event = mce_err->ignore_event;
>>   
>>   	if (!addr)
>>   		return;
>> @@ -159,7 +161,6 @@ void save_mce_event(struct pt_regs *regs, long handled,
>>   		if (phys_addr != ULONG_MAX) {
>>   			mce->u.ue_error.physical_address_provided = true;
>>   			mce->u.ue_error.physical_address = phys_addr;
>> -			mce->u.ue_error.ignore_event = mce_err->ignore_event;
>>   			machine_check_ue_event(mce);
>>   		}
>>   	}
> Small nit:
> Setting ignore event can happen before the phys_addr check, under the existing
> check for MCE_ERROR_TYPE_UE, instead of repeating the same condition again.

In some cases we may not get effective address also, so it is placed before effective
address check.

>
> Except for the above nit
>
> Reviewed-by: Santosh Sivaraj <santosh@fossix.org>
>
> Thanks,
> Santosh
>> -- 
>> 2.26.2

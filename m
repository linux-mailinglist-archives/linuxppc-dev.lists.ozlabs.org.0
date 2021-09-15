Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA6A840BFEF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 08:56:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H8WGq5Qshz3bj4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Sep 2021 16:56:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FxTr1XGD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hegdevasant@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FxTr1XGD; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H8WFT5W2Bz2yJC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Sep 2021 16:55:41 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.0.43) with SMTP id 18F5uSls021287;
 Wed, 15 Sep 2021 02:55:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ZAQri2igqjnAN0637CS8ZOipc4eldB/IjGczOWy9R8M=;
 b=FxTr1XGDqZ19UK3lePk8d1eti+6ZtfKJv3ncBeS27mBl+D+vwkmkSmDGemAgmqYI6aB+
 6ZctrTpEmfaAx/XOw1KOZGytf5XbRb0CalqAw2SUIItE0//WkyvJs4Ti517XH5AJvvQs
 em+tDxZ/HBL0Hn6aH48h4Y2gX1v50srIC4lBtAxLU0+GtEZMKBc7xQW2uGx5QQ2pt48L
 K7QE1J5k1hXAMNOtQJwsWUovM7Ixa4XDz/Kxc/5VRi0ShnMxMC1V4bv8aEPm5WD1tXR8
 PrlRbg7Cmgz/Ykn1SWQSbvSh2CG4n8FEQeQc00xbVLut9d4QeCRcbHGU57Ni3B6OTclm rw== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3b3b4g933u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 02:55:35 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18F6mKWT023299;
 Wed, 15 Sep 2021 06:55:33 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma01fra.de.ibm.com with ESMTP id 3b0m39a6yt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Sep 2021 06:55:33 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18F6tUlk57672084
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Sep 2021 06:55:30 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFDCD11C054;
 Wed, 15 Sep 2021 06:55:30 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CAE9611C06C;
 Wed, 15 Sep 2021 06:55:29 +0000 (GMT)
Received: from [9.43.61.74] (unknown [9.43.61.74])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 15 Sep 2021 06:55:29 +0000 (GMT)
Subject: Re: [PATCH] powerpc/powernv/flash: Check OPAL flash calls exist
 before using
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210914101630.30613-1-hegdevasant@linux.vnet.ibm.com>
 <87ilz2jr1f.fsf@mpe.ellerman.id.au>
From: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
Message-ID: <b75d10ba-0974-d759-bdba-09c63064ffb6@linux.vnet.ibm.com>
Date: Wed, 15 Sep 2021 12:25:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87ilz2jr1f.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _E0JCLcPL4nrekXr3gGtVXIdWhcGvdvo
X-Proofpoint-GUID: _E0JCLcPL4nrekXr3gGtVXIdWhcGvdvo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.687,Hydra:6.0.235,FMLib:17.0.607.475
 definitions=2020-10-13_15,2020-10-13_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 adultscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109030001
 definitions=main-2109150036
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/15/21 11:53 AM, Michael Ellerman wrote:
> Vasant Hegde <hegdevasant@linux.vnet.ibm.com> writes:
>> Currently only FSP based powernv systems supports firmware update
>> interfaces. Hence check that the token OPAL_FLASH_VALIDATE exists
>> before initalising the flash driver.
>>
>> Signed-off-by: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
>> ---
>>   arch/powerpc/platforms/powernv/opal-flash.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/powernv/opal-flash.c b/arch/powerpc/platforms/powernv/opal-flash.c
>> index 7e7d38b17420..05490fc22fae 100644
>> --- a/arch/powerpc/platforms/powernv/opal-flash.c
>> +++ b/arch/powerpc/platforms/powernv/opal-flash.c
>> @@ -520,6 +520,10 @@ void __init opal_flash_update_init(void)
>>   {
>>   	int ret;
>>   
>> +	/* Firmware update is not supported by firmware */
>> +	if (!opal_check_token(OPAL_FLASH_VALIDATE))
>> +		return;
>> +
> 

Michael,

> That will mean the following files no longer appear on BMC systems:
> 
>    /sys/firmware/opal/image
>    /sys/firmware/opal/validate_flash
>    /sys/firmware/opal/manage_flash
>    /sys/firmware/opal/update_flash
> 
> Presumably those files don't actually work correctly, but are we sure
> their mere existence isn't used by anything at all?

That's correct. We never used these files/interfaces on BMC based systems.

> 
> We've had trouble in the past where removing sysfs files breaks tools
> unexpectedly, see smt_snooze_delay.

AFAIK only update_flash uses these interfaces on baremetal systems.
This change shouldn't break update_flash as these interfaces never used/worked
on BMC based powernv systems.

-Vasant


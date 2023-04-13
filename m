Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 330426E16A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 23:47:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PyCpV0h9Lz3fbW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 07:46:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DmbZZfQ5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DmbZZfQ5;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py1892cjGz3bWC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Apr 2023 23:46:32 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33DDNQAg027774;
	Thu, 13 Apr 2023 13:46:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : cc : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=IknDKo8aPXe8KSIUXHfcta5u2283EZUc+I6HVf7NQNY=;
 b=DmbZZfQ5iAutx8JLs68teO+m0dKIT5sJkbjodU/NzSHhGvNyVG0X/vuogXbYhVr+uUH1
 74Rsa5xgw9XGstibqIJKMf9YEC+1TpHOF3wrfcRicAqPI/yOlmoUkAh9fuXJJ1SHIhQs
 3qjO3oT1VTw7gHAr4KhyEXoMQBEfxrfWbjBuIcaZashYeYLqmtIi4ACdVd2wzOO4xsEX
 FIYq4C7DsLfeC2K2LtTRizUoK4thwcWEvlbo3WQmwbj1Mis6dBdJKVG+ED2tN9umnZl+
 SGA/tpW7FEtfRWD8KKy6u8JTKWafTG8rr6NLsJKlJXdlK7k+ltnICImndczNnx1H8Iz+ ig== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pxf12ap1m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 13:46:20 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33DDbi3m020727;
	Thu, 13 Apr 2023 13:46:20 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3pu0jhbr7c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Apr 2023 13:46:20 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33DDkIX425100928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Apr 2023 13:46:18 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 12F305805F;
	Thu, 13 Apr 2023 13:46:18 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D6FF58059;
	Thu, 13 Apr 2023 13:46:17 +0000 (GMT)
Received: from [9.65.220.56] (unknown [9.65.220.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Apr 2023 13:46:17 +0000 (GMT)
Message-ID: <29ed9474-748f-feb3-6cfd-15da9fca217e@linux.ibm.com>
Date: Thu, 13 Apr 2023 08:46:16 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.9.1
Subject: Re: [PATCH] Remove POWER10_CPU dependency and move
 PPC_MODULE_FEATURE_P10.
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org
References: <20230412181232.2051-1-dtsen@linux.ibm.com>
 <87wn2g9b9l.fsf@mpe.ellerman.id.au>
 <71c63813-bbf1-8baa-3b94-f5184cc5e872@linux.ibm.com>
In-Reply-To: <71c63813-bbf1-8baa-3b94-f5184cc5e872@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: E2Gy5TDZ7eyJlB5R6jjXP3YahDHk4bKK
X-Proofpoint-GUID: E2Gy5TDZ7eyJlB5R6jjXP3YahDHk4bKK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-13_08,2023-04-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304130116
X-Mailman-Approved-At: Fri, 14 Apr 2023 07:43:48 +1000
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
Cc: herbert@gondor.apana.org.au, dtsen@us.ibm.com, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, appro@cryptogams.org, ltcgcw@linux.vnet.ibm.com, leitao@debian.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 4/13/23 8:18 AM, Danny Tsen wrote:
> Hi Michael,
>
> If I do separate patch for moving PPC_MODULE_FEATURE_P10, this will 
> break the build since it is currently defined in aes-gcm-p10-glue.c.  
> And the p10 will be detected when loading the module in 
> module_cpu_feature_match(PPC_MODULE_FEATURE_P10, p10_init); so it 
> won't load if it's not P10.
>
> Thanks.
>
> -Danny
>
> On 4/13/23 8:12 AM, Michael Ellerman wrote:
>> Danny Tsen <dtsen@linux.ibm.com> writes:
>>> Remove Power10 dependency in Kconfig and detect Power10 feature at 
>>> runtime.
>>> Move PPC_MODULE_FEATURE_P10 definition to be in
>>> arch/powerpc/include/asm/cpufeature.h.
>> This should be two patches, one for the Kconfig change and one moving
>> the feature flag.

I think I misunderstood.  I can do two patches one for Kconfig change 
and one moving the feature flag.  I'll fix it.

Thanks.

-Danny

>>
>> Also don't you need a cpu feature check in p10_init()? Otherwise the
>> driver can be loaded on non-P10 CPUs, either by being built-in, or
>> manually.
>>
>> cheers
>>
>>> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
>>> ---
>>>   arch/powerpc/crypto/Kconfig            | 2 +-
>>>   arch/powerpc/crypto/aes-gcm-p10-glue.c | 1 -
>>>   arch/powerpc/include/asm/cpufeature.h  | 1 +
>>>   3 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
>>> index 1f8f02b494e1..7113f9355165 100644
>>> --- a/arch/powerpc/crypto/Kconfig
>>> +++ b/arch/powerpc/crypto/Kconfig
>>> @@ -96,7 +96,7 @@ config CRYPTO_AES_PPC_SPE
>>>     config CRYPTO_AES_GCM_P10
>>>       tristate "Stitched AES/GCM acceleration support on P10 or 
>>> later CPU (PPC)"
>>> -    depends on PPC64 && POWER10_CPU && CPU_LITTLE_ENDIAN
>>> +    depends on PPC64 && CPU_LITTLE_ENDIAN
>>>       select CRYPTO_LIB_AES
>>>       select CRYPTO_ALGAPI
>>>       select CRYPTO_AEAD
>>> diff --git a/arch/powerpc/crypto/aes-gcm-p10-glue.c 
>>> b/arch/powerpc/crypto/aes-gcm-p10-glue.c
>>> index 1533c8cdd26f..bd3475f5348d 100644
>>> --- a/arch/powerpc/crypto/aes-gcm-p10-glue.c
>>> +++ b/arch/powerpc/crypto/aes-gcm-p10-glue.c
>>> @@ -22,7 +22,6 @@
>>>   #include <linux/module.h>
>>>   #include <linux/types.h>
>>>   -#define PPC_MODULE_FEATURE_P10    (32 + 
>>> ilog2(PPC_FEATURE2_ARCH_3_1))
>>>   #define    PPC_ALIGN        16
>>>   #define GCM_IV_SIZE        12
>>>   diff --git a/arch/powerpc/include/asm/cpufeature.h 
>>> b/arch/powerpc/include/asm/cpufeature.h
>>> index f6f790a90367..2dcc66225e7f 100644
>>> --- a/arch/powerpc/include/asm/cpufeature.h
>>> +++ b/arch/powerpc/include/asm/cpufeature.h
>>> @@ -22,6 +22,7 @@
>>>    */
>>>     #define PPC_MODULE_FEATURE_VEC_CRYPTO            (32 + 
>>> ilog2(PPC_FEATURE2_VEC_CRYPTO))
>>> +#define PPC_MODULE_FEATURE_P10                (32 + 
>>> ilog2(PPC_FEATURE2_ARCH_3_1))
>>>     #define cpu_feature(x)        (x)
>>>   --
>>> 2.31.1

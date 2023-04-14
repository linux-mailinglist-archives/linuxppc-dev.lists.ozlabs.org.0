Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C201B6E24B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 15:51:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PydCc4qTNz3ftk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 23:51:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k28EzNgu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k28EzNgu;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pycjx2QkPz3fgR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 23:29:25 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33EDIdW1025912;
	Fri, 14 Apr 2023 13:29:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=L17NEor15alxJnJyRZpYEiLZmDLO42JcdjMLI+tQ52s=;
 b=k28EzNguGaMswoOu1OjTLikcPom2JuC/5+dGXxoeRcKzkRnKwqEGPvrEsMxT9GDHJbVU
 UKr0034wf3T852k1E50/Ne7HEiLr43ahlNP0J/CG4ZWPeBi1q354txo+rI0daGDIVNv0
 c26oKF/S8IkuxHypxBOHbdCCqPHOy+NwsJKGrPC+joI0INGaayFCuVWoXaCYM2QtKHdu
 Gauj8Vi6pAz/myts07wazLGOQUeY+rCXRmdWwKHkVqBbRIXncZBdpp/muSBDMVoqMIBn
 iuhE9Gf/IHj5HM/3XdFXDotlSYnCulRiIvX2wDTsgAxnwS6aTlldpiChDWVSu6BSSr8I Hw== 
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3py7kt8ba9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 13:29:12 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33EDNMdB027913;
	Fri, 14 Apr 2023 13:29:11 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pu0jjs2v7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Apr 2023 13:29:11 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33EDTAfb10879716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Apr 2023 13:29:10 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F18FE5805E;
	Fri, 14 Apr 2023 13:29:09 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 103BE58051;
	Fri, 14 Apr 2023 13:29:09 +0000 (GMT)
Received: from [9.160.183.133] (unknown [9.160.183.133])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Apr 2023 13:29:08 +0000 (GMT)
Message-ID: <29e7972a-17ad-638e-fa2d-1c65ae619c41@linux.ibm.com>
Date: Fri, 14 Apr 2023 08:29:08 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] Remove POWER10_CPU dependency.
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org
References: <20230413194625.10631-1-dtsen@linux.ibm.com>
 <20230413194625.10631-2-dtsen@linux.ibm.com>
 <87ildya9xd.fsf@mpe.ellerman.id.au>
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <87ildya9xd.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TAZXTrc9NthrcIflRSRgsBWMNDFafO9O
X-Proofpoint-ORIG-GUID: TAZXTrc9NthrcIflRSRgsBWMNDFafO9O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-14_06,2023-04-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304140118
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

Thanks Michael.

-Danny

On 4/14/23 8:08 AM, Michael Ellerman wrote:
> Danny Tsen <dtsen@linux.ibm.com> writes:
>> Remove Power10 dependency in Kconfig and detect Power10 feature at runtime.
> ... using the existing call to module_cpu_feature_match() :)
>
>> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
>> ---
>>   arch/powerpc/crypto/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> cheers
>
>> diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
>> index 1f8f02b494e1..7113f9355165 100644
>> --- a/arch/powerpc/crypto/Kconfig
>> +++ b/arch/powerpc/crypto/Kconfig
>> @@ -96,7 +96,7 @@ config CRYPTO_AES_PPC_SPE
>>   
>>   config CRYPTO_AES_GCM_P10
>>   	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
>> -	depends on PPC64 && POWER10_CPU && CPU_LITTLE_ENDIAN
>> +	depends on PPC64 && CPU_LITTLE_ENDIAN
>>   	select CRYPTO_LIB_AES
>>   	select CRYPTO_ALGAPI
>>   	select CRYPTO_AEAD
>> -- 
>> 2.31.1

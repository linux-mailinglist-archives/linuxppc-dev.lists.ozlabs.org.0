Return-Path: <linuxppc-dev+bounces-1459-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FB697C85D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 13:13:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8XvL1ZD1z2yDS;
	Thu, 19 Sep 2024 21:13:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726744414;
	cv=none; b=XaPzBAjjzdSkQaOzkOb8t8i3S8J9pES7kA4GLu1IrCMXrkkcDEsAidh5QH/GpIP5dWc0tH/mJ0RqwedcCoOCBOCOW2quurtrv60SsfzKr0ElXBaoui31+JokXHXEi4/rhoy6nnZpDG9Ws6cyiC8txbUaIfv1obRmiV9jHDREpMeICm8DWixfXRGJHFmJYRwbljivC0ZD7+RFdmtRGy/Gg0oTXVVxhkTe+XmmA7Ns9BD5J4bzft61ToJ2Xw6j0ztpSbB9FvgkKvKL1KW6Bgi5hVL4MxNEWqwMjHzo4Z55vzDXECjcWub2eFNYu3Yzry85MU1pqSZ07Ra4IZtq6MAa6A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726744414; c=relaxed/relaxed;
	bh=rfTOEAXZNZarvbG2AF5ajeIf7S3tcYldEG1+ILtAxS8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V+475nyHx3Jk7nq7l3QuQhXfLJUHRnHVaJ5bDQwLP5mIqIwPJXRzUdt1bpcAWOCOqnO97cmffILODgftqd39khODr0X/9CVrUFJWKyi2V2w3o9DPLh9A5A6e0hN1Tp245kYNbfGE44213Htx1CPyrl5myb4dXV57I57cBxR7uRuqqS/wJEWZ3Y3gRlNotjsfO5SzPtT7sdmWBY1T8c6FwOjRH9wVrjgGYMWyGQA+SsyAbOxP2qSdkgcqzWq4NU4nZABEon+HzCLscV5UwSEjTX60SEFj4Yzl/BQr03encuzLEonRuz1PSRzq1+2LpIz+hVVp4psPPfrNWwtYxkAuWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nfNp3Jat; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nfNp3Jat;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8XvK2sqhz2y66
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 21:13:32 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J6GKgl030026;
	Thu, 19 Sep 2024 11:06:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=r
	fTOEAXZNZarvbG2AF5ajeIf7S3tcYldEG1+ILtAxS8=; b=nfNp3JatxK7CrVZdh
	1tRJiujGQ7yVv6IiviOr2r/96PFplZzRo9ChwyZ3cU9FXinTUiJ1ptvLOkQazj1I
	U2fszw8SaodAhIB+XqHTgpFl4ZNQmuylN8adkkM9nm6AZzmncsOiYnFw/dgedJTG
	xMHAJg6g8dCJO1xOpxzCSL++XYZiIj/4hlG5NluPk19bYT6LZT62IXD1Z28pxIVh
	izV7HvHOI2jJ/wbQWZ7pQaaImFnVkIB7IXgpEduiPiesEXLJKBtVxnGG6+9q2LOt
	YRFKnyrEct/weRVyovRNk6qd/QlUP0sEjnXGHt/qWgoqOmj6X7M5Nj+VBR4DEgIX
	pI1Hw==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41n3udk82x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 11:06:57 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48JA3but001187;
	Thu, 19 Sep 2024 11:06:56 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41nntqgxbh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 11:06:56 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48JB6sRd45220240
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Sep 2024 11:06:55 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C14225805E;
	Thu, 19 Sep 2024 11:06:54 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3741958059;
	Thu, 19 Sep 2024 11:06:54 +0000 (GMT)
Received: from [9.61.250.246] (unknown [9.61.250.246])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Sep 2024 11:06:54 +0000 (GMT)
Message-ID: <1d8bb55a-a498-44b8-a29a-f0916518e483@linux.ibm.com>
Date: Thu, 19 Sep 2024 06:06:53 -0500
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: Removing CRYPTO_AES_GCM_P10.
To: Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, leitao@debian.org, nayna@linux.ibm.com,
        appro@cryptogams.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, ltcgcw@linux.vnet.ibm.com,
        dtsen@us.ibm.com
References: <20240913123043.1636183-1-dtsen@linux.ibm.com>
 <87r09gp7ho.fsf@mail.lhotse>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <87r09gp7ho.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: oB3dgjWHfI2Hj--1h9fBAB0_MbHmV2Ho
X-Proofpoint-ORIG-GUID: oB3dgjWHfI2Hj--1h9fBAB0_MbHmV2Ho
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_08,2024-09-18_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409190071

Thanks Michael.

On 9/18/24 11:55 PM, Michael Ellerman wrote:
> Danny Tsen <dtsen@linux.ibm.com> writes:
>> Removing CRYPTO_AES_GCM_P10 in Kconfig first so that we can apply the
>> subsequent patches to fix data mismatch over ipsec tunnel.
> This change log needs to stand on its own. ie. it needs to explain what
> the problem is and why the feature is being disabled, without reference
> to subsequent patches (which will probably be merged separately).
>
> It should also have a Fixes/stable tag.
>
> And as Christophe said, just adding a dependency on BROKEN is
> sufficient.
>
> cheers
>
>
>> diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
>> index 09ebcbdfb34f..96ca2c4c8827 100644
>> --- a/arch/powerpc/crypto/Kconfig
>> +++ b/arch/powerpc/crypto/Kconfig
>> @@ -105,22 +105,22 @@ config CRYPTO_AES_PPC_SPE
>>   	  architecture specific assembler implementations that work on 1KB
>>   	  tables or 256 bytes S-boxes.
>>   
>> -config CRYPTO_AES_GCM_P10
>> -	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
>> -	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
>> -	select CRYPTO_LIB_AES
>> -	select CRYPTO_ALGAPI
>> -	select CRYPTO_AEAD
>> -	select CRYPTO_SKCIPHER
>> -	help
>> -	  AEAD cipher: AES cipher algorithms (FIPS-197)
>> -	  GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
>> -	  Architecture: powerpc64 using:
>> -	    - little-endian
>> -	    - Power10 or later features
>> -
>> -	  Support for cryptographic acceleration instructions on Power10 or
>> -	  later CPU. This module supports stitched acceleration for AES/GCM.
>> +#config CRYPTO_AES_GCM_P10
>> +#	tristate "Stitched AES/GCM acceleration support on P10 or later CPU (PPC)"
>> +#	depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
>> +#	select CRYPTO_LIB_AES
>> +#	select CRYPTO_ALGAPI
>> +#	select CRYPTO_AEAD
>> +#	select CRYPTO_SKCIPHER
>> +#	help
>> +#	  AEAD cipher: AES cipher algorithms (FIPS-197)
>> +#	  GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
>> +#	  Architecture: powerpc64 using:
>> +#	    - little-endian
>> +#	    - Power10 or later features
>> +#
>> +#	  Support for cryptographic acceleration instructions on Power10 or
>> +#	  later CPU. This module supports stitched acceleration for AES/GCM.
>>   
>>   config CRYPTO_CHACHA20_P10
>>   	tristate "Ciphers: ChaCha20, XChacha20, XChacha12 (P10 or later)"
>> -- 
>> 2.43.0


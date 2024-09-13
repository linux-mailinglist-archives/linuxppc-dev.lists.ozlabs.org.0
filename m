Return-Path: <linuxppc-dev+bounces-1328-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1971978216
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 16:02:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4wxF4kryz2yLJ;
	Sat, 14 Sep 2024 00:02:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726236161;
	cv=none; b=dKVNJxdZXmaq0D2S/Bi1hk9Ef+6Z+ft1356tx+wUT20fWEryUV0rbcYCwTrYhHGhp/H7paV9IZsPCdUJ+Rk94Txu6EqWkXjVTRhga8GikqvlX1adxw1k9jAc+2hvCFc0sUmtcu+lxFEkW9ssotI39re2/YD0xiH1MAH2jlyYI5/RX+E63FUdzITiP7fMpPXVkWBP9QcebUkmGXcUIbqbxyDL/1/Aj1IQ8rrfzP+SS4BGhQdYItvrNVx13FeYHhpVH6MghjVGkB0dz6nLJl6q53yVxbzVM3Z18R3o6d7ZlkWMpom5M+bxOxGtEHD8z/X9P0JFED0ftRAtaCuHYc6/Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726236161; c=relaxed/relaxed;
	bh=q1qnqZh7DY6ryMgArU4Ju8GzleC6GLVXI4Bd3rfPRDM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OmP05DpRo7kMfO1BdEheO7/4uerAUMD7FgCbYwJ+PeqItWuo+P6QpquW1ya0O/MxxIuo33BT4+vUUtQv4HA3kRB4QY/CBkxzvlCGNhRiLRtXPKQZ/3PZSUkvIpcjg4Fy84ZcK5ZkVuf0bohs+p5k1ig/WNXz2RNnsDVj8Q/3xPQBA+ytoPf9bniGI8RkjDfCGh/zbGI1Z/1KhHYSBi4bYAx7fR7uRnDkoiXNa38KXPpCYlj2fiYuLZGghfZ1EB7mtTzQi5oaV3Kf1nQNtEaUXl0HESdAaLRyZsZNGdW/TRIwEVJv7NlDer2kZK5ZfvXi8baS4oiW5gl6adZ4HdCkTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UElQ8sCn; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UElQ8sCn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4wxD72S2z2yK9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 00:02:40 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D7daD9032755;
	Fri, 13 Sep 2024 14:02:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	q1qnqZh7DY6ryMgArU4Ju8GzleC6GLVXI4Bd3rfPRDM=; b=UElQ8sCnQWmar16p
	7X4ABi+d9rh5SjANTV+huVoZ/Xi0qmklOw1ZEtUaJ3iHFEyrAY2mK6wjg9UVagVw
	ur/RxMHrAJNihEW3l61pdjbLpH7syqnTUpiLAQWYF3nlVVF65XCv9jv1q7tvJEoa
	J9aZX7NEdac15UnWtAu/q4ewzyBEirOqa/QxdiwNe7h/dxOao+IPOJ5kYtQoog+K
	gzuyREsT1gvye7bvTFrgYfodG5wBHT64vU0r8o+I1r38gtxIYdOi3BmgZaeRX1uJ
	PG8eKV35fPogodnA1pMa5YlkH4EWucRwarSv5eNPY0Sxox+8DpOmkI5YwMARDxdl
	DwDgUA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gegxag1e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 14:02:26 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48DBXLwQ019911;
	Fri, 13 Sep 2024 14:02:23 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h25qejkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 14:02:23 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48DE2MHH14484092
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 14:02:22 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDB2058051;
	Fri, 13 Sep 2024 14:02:21 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F7865805F;
	Fri, 13 Sep 2024 14:02:21 +0000 (GMT)
Received: from [9.61.250.246] (unknown [9.61.250.246])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Sep 2024 14:02:21 +0000 (GMT)
Message-ID: <89493ea2-b145-489c-94a5-dad8608b9b79@linux.ibm.com>
Date: Fri, 13 Sep 2024 09:02:21 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] crypto: Removing CRYPTO_AES_GCM_P10.
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, leitao@debian.org, nayna@linux.ibm.com,
        appro@cryptogams.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au,
        ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com
References: <20240913123043.1636183-1-dtsen@linux.ibm.com>
 <4742a397-eb68-4a79-a2fa-fc45a81e7c2b@csgroup.eu>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <4742a397-eb68-4a79-a2fa-fc45a81e7c2b@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xSGeI4CdAPMDSHJQLkSpkRO4NYNF-uGP
X-Proofpoint-ORIG-GUID: xSGeI4CdAPMDSHJQLkSpkRO4NYNF-uGP
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_10,2024-09-13_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130095

Got it.  Thanks.

-Danny

On 9/13/24 8:55 AM, Christophe Leroy wrote:
>
>
> Le 13/09/2024 à 14:30, Danny Tsen a écrit :
>> [Vous ne recevez pas souvent de courriers de dtsen@linux.ibm.com. 
>> Découvrez pourquoi ceci est important à 
>> https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Removing CRYPTO_AES_GCM_P10 in Kconfig first so that we can apply the
>> subsequent patches to fix data mismatch over ipsec tunnel.
>
> To deactivate a driver, all you have to do is to add:
>
>     depends on BROKEN
>
> Christophe
>
>
>>
>> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
>> ---
>>   arch/powerpc/crypto/Kconfig | 32 ++++++++++++++++----------------
>>   1 file changed, 16 insertions(+), 16 deletions(-)
>>
>> diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
>> index 09ebcbdfb34f..96ca2c4c8827 100644
>> --- a/arch/powerpc/crypto/Kconfig
>> +++ b/arch/powerpc/crypto/Kconfig
>> @@ -105,22 +105,22 @@ config CRYPTO_AES_PPC_SPE
>>            architecture specific assembler implementations that work 
>> on 1KB
>>            tables or 256 bytes S-boxes.
>>
>> -config CRYPTO_AES_GCM_P10
>> -       tristate "Stitched AES/GCM acceleration support on P10 or 
>> later CPU (PPC)"
>> -       depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
>> -       select CRYPTO_LIB_AES
>> -       select CRYPTO_ALGAPI
>> -       select CRYPTO_AEAD
>> -       select CRYPTO_SKCIPHER
>> -       help
>> -         AEAD cipher: AES cipher algorithms (FIPS-197)
>> -         GCM (Galois/Counter Mode) authenticated encryption mode 
>> (NIST SP800-38D)
>> -         Architecture: powerpc64 using:
>> -           - little-endian
>> -           - Power10 or later features
>> -
>> -         Support for cryptographic acceleration instructions on 
>> Power10 or
>> -         later CPU. This module supports stitched acceleration for 
>> AES/GCM.
>> +#config CRYPTO_AES_GCM_P10
>> +#      tristate "Stitched AES/GCM acceleration support on P10 or 
>> later CPU (PPC)"
>> +#      depends on PPC64 && CPU_LITTLE_ENDIAN && VSX
>> +#      select CRYPTO_LIB_AES
>> +#      select CRYPTO_ALGAPI
>> +#      select CRYPTO_AEAD
>> +#      select CRYPTO_SKCIPHER
>> +#      help
>> +#        AEAD cipher: AES cipher algorithms (FIPS-197)
>> +#        GCM (Galois/Counter Mode) authenticated encryption mode 
>> (NIST SP800-38D)
>> +#        Architecture: powerpc64 using:
>> +#          - little-endian
>> +#          - Power10 or later features
>> +#
>> +#        Support for cryptographic acceleration instructions on 
>> Power10 or
>> +#        later CPU. This module supports stitched acceleration for 
>> AES/GCM.
>>
>>   config CRYPTO_CHACHA20_P10
>>          tristate "Ciphers: ChaCha20, XChacha20, XChacha12 (P10 or 
>> later)"
>> -- 
>> 2.43.0
>>
>>


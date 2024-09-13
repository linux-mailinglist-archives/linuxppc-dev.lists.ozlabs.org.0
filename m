Return-Path: <linuxppc-dev+bounces-1321-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB655977E3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 13:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4s8f4C6cz2xjv;
	Fri, 13 Sep 2024 21:12:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726225938;
	cv=none; b=fWMPtEiIarn22gygVxQ6nvQSlZgSToaM0XhZkD0wgNOPMBlxIqBdQ214/tMNFCVmFaDBq+eNCP20pfwZDLM2z+qwbOfcgW/M5LMhICeL2Jw44/7ioMSOQ/aUow8tizP1qXILvAjB9rbXCa+Mfqxg65T7bVQuDK8UjD14frbl5wYuzKItVUOaRaDKktKGUZjq+KgC6zoBeoWT4TsieH6qm3XT2IzHuQkJ9qmBAK4rIIr1Jvx4Bk+p9dFJhdFkBYGdrFER0UYf+k1YkbhLjJb6pC5EV3gVcoFg8YqpAwlMk0Kvnd7w/EkCSIGzflU69okBFzxkSNZcLGtiFSk1QgA7dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726225938; c=relaxed/relaxed;
	bh=iQhjEs8ki/xL/wsHpZzAsFpWHpcSNMnfW5ARyW8D1N8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZIa9dAInOF0+DLq1eoKnErmcrgH27nr7IC8bT2DezLtU+OLVDzlTza86t5d2cKnTRZnRtyYPd8AbVwyqEtVHWcXy1zkW/bYjymWkLbKdlbI2nUC0DegFoG9dRhNpUvxLDntzRNbbonAwCImB6z0Um8GzlR1j/93OSkkTr0O1PGR6bRaCash60zzRpj64IENfHfo+OGJOYC6V7DIun9+CwdTPZM4ini+ga5xi1t8uk3fhh8HxjfmH/3qVba5CLs5svFCIHsQbk7IyAryNkDmX0KQjJGyBx+CPS71sD9c7EAk4x77WtnTs42o0liWGVZepw5Ya/4MgRfm1BM6NWxVUzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gjGnN6Sg; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gjGnN6Sg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4s8d5g97z2xb9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 21:12:16 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48DA9adk004900;
	Fri, 13 Sep 2024 11:12:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=i
	QhjEs8ki/xL/wsHpZzAsFpWHpcSNMnfW5ARyW8D1N8=; b=gjGnN6SgdzP1JyRO3
	/JSnGmBTuD2hCa/XgyCDkJx0Lr8gPw7QxpthloLqqq5dC1x12VmD0o/eLpE7tJas
	w61Jlf+vZ6DjGD9ZoXJ03KezbeYMhr6k2C+3upG7ZclTZ4pNQ7ZDMG2U953s1WSC
	K5mvAk73Ev5p+Sqg/y5qSiFBS371cKvbwkr9rvqS7/sO+eDPdrvMAlxTz8QVVAZv
	j0jctsSPROMr+Z7jch/F2z8LhFQLE9wvZ+UwXf74qtYqvwxTrDW0SzTFdAKpAkRR
	//iSlsSAzQtkCZECfQW4WTpnOq7XM83iSxb+TyuLhTXqeBKMRcBFA2QQ0LK5qsIK
	oKNmA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gc8qsr6h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:12:03 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48D9dQue013566;
	Fri, 13 Sep 2024 11:12:02 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 41h3cmngaa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:12:02 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48DBC0XW57934088
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 11:12:00 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 83CB658051;
	Fri, 13 Sep 2024 11:12:00 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B06058062;
	Fri, 13 Sep 2024 11:12:00 +0000 (GMT)
Received: from [9.61.250.246] (unknown [9.61.250.246])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Sep 2024 11:12:00 +0000 (GMT)
Message-ID: <3b3e019a-0576-4ef6-a5c7-aa5ebc35d600@linux.ibm.com>
Date: Fri, 13 Sep 2024 06:12:00 -0500
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
Subject: Re: [PATCH 1/1] crypto: Fix data mismatch over ipsec tunnel
 encrypted/decrypted with ppc64le AES/GCM module.
To: Michael Ellerman <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, leitao@debian.org, nayna@linux.ibm.com,
        appro@cryptogams.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, ltcgcw@linux.vnet.ibm.com,
        dtsen@us.ibm.com
References: <20240912174537.1409567-1-dtsen@linux.ibm.com>
 <87seu4qmv6.fsf@mail.lhotse>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <87seu4qmv6.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DDi48tHiC1lCxZTBoadouUmG7ZywYP9p
X-Proofpoint-ORIG-GUID: DDi48tHiC1lCxZTBoadouUmG7ZywYP9p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_09,2024-09-13_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 malwarescore=0 adultscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130076

Hi Michael,

I did think of that.  I can try to remove the feature first and apply 
the subsequent changes.

Thanks.

-Danny

On 9/12/24 10:00 PM, Michael Ellerman wrote:
> Danny Tsen <dtsen@linux.ibm.com> writes:
>> This patch is to fix an issue when simd is not usable that data mismatch
>> may occur over ipsec tunnel. The fix is to register algs as SIMD modules
>> so that the algorithm is excecuted when SIMD instructions is usable.
>>
>> A new module rfc4106(gcm(aes)) is also added. Re-write AES/GCM assembly
>> codes with smaller footprints and small performance gain.
>>
>> This patch has been tested with the kernel crypto module tcrypt.ko and
>> has passed the selftest.  The patch is also tested with
>> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
>>
>> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
>> ---
>>   arch/powerpc/crypto/Kconfig            |    1 +
>>   arch/powerpc/crypto/aes-gcm-p10-glue.c |  141 +-
>>   arch/powerpc/crypto/aes-gcm-p10.S      | 2421 +++++++++++-------------
>>   3 files changed, 1187 insertions(+), 1376 deletions(-)
> As this is a bug fix it should have a Fixes: tag, and probably a stable
> Cc as well.
>
> But that diffstat is really large for a bug fix. Is there no way to fix
> the issue in a smaller patch? Even if that is just disabling the feature
> until it can be fixed in subsequent commits?
>
> cheers
>


Return-Path: <linuxppc-dev+bounces-1794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 24BBF9929FE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2024 13:07:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XMbvw5pbYz2xm5;
	Mon,  7 Oct 2024 22:07:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728299244;
	cv=none; b=HsVYI+/+jn/n/YQzVWZ8oUHfcb6yrh6N7PpUXzP8/Fw+KZ9TORkCh08MHwJ2PioE7/Qn0Y7h96oPoU8fNLNall4nXdyabEFGrUqkLLeK2wbx7jAqltWGFc7srNBr49tgYcg0vsSCkZAcCcjvXyoONj+aaPYyBjIYiJRHO1ddfimgBSsrffAswf+WTsSxPm9VQJ/z1e5EHCBRUBWmr0U6cypGLQ64IxglxA2XZUmDGjE4A5xeZwgOspKRsGwBm8Y2+KZDzaWD6uFpLlrYdl4//VZmo5DLVEXDSGUYy/PDOE3uGwdfRfrImkxAO7NL8qTw7YjM7kDaNC+0EsiCnEtikQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728299244; c=relaxed/relaxed;
	bh=HlfaUppSnhlYTBtOdNhHzLyqLgKPEpMIJGf6GhYDUFw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B2fKgeR3IyQdmp/rw71+4tCvn5QnbvDdo0J5lFYZP9PmyGFWmW7IrMy72rrbQtq95mUE4HrobowvMyPyoWL34f3TYbzSteYeTwnjFi17ZrX0bPi4FcX+ByRGUFXlf6/H2cpxjKBpTOurbIiBXUEO/L4qQ56zT3iPnFCJnmGuJ9iv/CfZBavyDd5nhpAkcvM3kafkXAHlxr7k4tN6Kn46KYG5B3vDG4BOvzcf4yE1NZ+hM43U5pCHQpXTVQX4Sxe8ztgm2iK2t5/zVHyyaCN4Pc82IiR5kuBLJNiz/2rdvAwJlSLFMvBdpCASRLMmGQ3nCxYN0FUWJwGABaCYAi9Bxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkfsrNLI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bkfsrNLI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XMbvv326yz2xHx
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2024 22:07:23 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4979nq3s003196;
	Mon, 7 Oct 2024 11:02:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=H
	lfaUppSnhlYTBtOdNhHzLyqLgKPEpMIJGf6GhYDUFw=; b=bkfsrNLIIeP81w49E
	sxCVoSfOA7o54mDxq4BSn4bML01kfdUMKoCShlwoOa15wuNnxA3sgyyST7y9qkHu
	+f8xWn16qZ0+yF38M8MjKCAaaHxg+mKjQuRIU2X+B/rWbg4Du92yGBZyriPAWgny
	ohZbqT+c/Vl2giYVVpNjNuAxv2s+9A0o5l/U18MwD6MpDsCLq+m8YwJRjrYTwLr0
	5nNqyxbxLrRZCWIsxKF8WeH4fuR84sxHuLC9VZ7rxiaNpZV0Urot/wXaWBMoxDBm
	4wJZrCkSr7m3s+yM4eNouk/0lr2VOmp+3U+yn4N6dxNFVhHbdwkb3Jp33P5XcWWI
	3LB4w==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 424dbv8bkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 11:02:05 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 497Au0CT011512;
	Mon, 7 Oct 2024 11:02:05 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423g5xe745-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 07 Oct 2024 11:02:05 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 497B23iW41812290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Oct 2024 11:02:03 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CC56958056;
	Mon,  7 Oct 2024 11:02:03 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9CF4B58052;
	Mon,  7 Oct 2024 11:02:03 +0000 (GMT)
Received: from [9.61.253.216] (unknown [9.61.253.216])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  7 Oct 2024 11:02:03 +0000 (GMT)
Message-ID: <e1b6c598-0200-49b3-b1af-176826a5e83f@linux.ibm.com>
Date: Mon, 7 Oct 2024 06:02:03 -0500
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
Subject: Re: [PATCH 0/3] crypto: Fix data mismatch over ipsec tunnel
 encrypted/decrypted with ppc64le AES/GCM module.
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, stable@vger.kernel.org, leitao@debian.org,
        nayna@linux.ibm.com, appro@cryptogams.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com
References: <20240923133040.4630-1-dtsen@linux.ibm.com>
 <ZwDQLmwA1LvWx5Dg@gondor.apana.org.au>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <ZwDQLmwA1LvWx5Dg@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Fh1jG0QpfSRCnmdfj-GbvttqGPMGgb90
X-Proofpoint-GUID: Fh1jG0QpfSRCnmdfj-GbvttqGPMGgb90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-07_01,2024-10-07_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 priorityscore=1501 spamscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0 adultscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410070076
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Thanks Herbert.

-Danny

On 10/5/24 12:35 AM, Herbert Xu wrote:
> On Mon, Sep 23, 2024 at 09:30:37AM -0400, Danny Tsen wrote:
>> Fix data mismatch over ipsec tunnel encrypted/decrypted with ppc64le AES/GCM module.
>>
>> This patch is to fix an issue when simd is not usable that data mismatch
>> may occur. The fix is to register algs as SIMD modules so that the
>> algorithm is excecuted when SIMD instructions is usable.
>>
>> A new module rfc4106(gcm(aes)) is also added. Re-write AES/GCM assembly
>> codes with smaller footprints and small performance gain.
>>
>> This patch has been tested with the kernel crypto module tcrypt.ko and
>> has passed the selftest.  The patch is also tested with
>> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
>>
>> Fixes: fd0e9b3e2ee6 ("crypto: p10-aes-gcm - An accelerated AES/GCM stitched implementation")
>> Fixes: cdcecfd9991f ("crypto: p10-aes-gcm - Glue code for AES/GCM stitched implementation")
>> Fixes: 45a4672b9a6e2 ("crypto: p10-aes-gcm - Update Kconfig and Makefile")
>>
>> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
>>
>> Danny Tsen (3):
>>    crypto: Re-write AES/GCM stitched implementation for ppcle64.
>>    crypto: Register modules as SIMD modules for ppcle64 AES/GCM algs.
>>    crypto: added CRYPTO_SIMD in Kconfig for CRYPTO_AES_GCM_P10.
>>
>>   arch/powerpc/crypto/Kconfig            |    2 +-
>>   arch/powerpc/crypto/aes-gcm-p10-glue.c |  141 +-
>>   arch/powerpc/crypto/aes-gcm-p10.S      | 2421 +++++++++++-------------
>>   3 files changed, 1187 insertions(+), 1377 deletions(-)
>>
>> -- 
>> 2.43.0
> All applied.  Thanks.


Return-Path: <linuxppc-dev+bounces-1522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A017897E387
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Sep 2024 22:54:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XBdfT61R4z2xs4;
	Mon, 23 Sep 2024 06:54:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727038481;
	cv=none; b=a71WZ057g7+iCjsbRnWNEz7EITBT5nfwdsGL4TPx2Tcj5pp3+eeXbdXHEGmXJmQdrrjcoihZNyv80WBhyYhxhGc8UD/yB/JxCFxuEOlOkbsKvyNLJztMMYFNBtpLQtB7NecHQ90RRSblyiG4RmYCQjk3Y2vJO/b3CxOoOxPrcjCkehFEHvQSvOQ1sxlPBLQEEDg0iQbwbK40ivAYWipNq3+8e1FX190mPBzk1tTzS96MBKkMv4Yy0SpoekUJTGFJ2m9Z2yK9QpIAzjnxEq6Gf75BRI73JpX2PHK0k2GdEJeFcKxt8ZcPcEpjil56mZHW9LKwX6bV158cQlH6BuY6nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727038481; c=relaxed/relaxed;
	bh=SXtEovATvwsh/6WdQwPpFVGwM2WcxRBkXVMZxUz43oA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f10bi0yqWc/ESMGJ6/WM1GaH7D2MeR9y2YQM6elKpSwXPvCZTOZZVSXV9+e7Q5udRNAxL1QOWJB/QXqZx6j2hR9fAdgbMje/37FT9lYIAUB48KkBIkIajF08Z/SSjcVfdfwdLrlbnCbTyLyt2spKSipfLbdpI/pf9U0tn9sZ6v55VUoKiJr/s/6x+3qDNSv9e6B06m4W3Fjtq/qne/0pyIJ+fjo20OPAJIB6ez4hT9MqwJ6KoXzxemouFiRNLh09HlktwvoQC9KkQVobj1TRt/4ZdsbNoRhOblS/SOj/RbGm4QJfVtK6yYuIvF8T6NCewVGRGOErHucoFnqZw2W8oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DsLE08ok; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DsLE08ok;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XBdfT1LHYz2xm5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Sep 2024 06:54:40 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48MIlQHO025857;
	Sun, 22 Sep 2024 20:49:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=pp1; bh=S
	XtEovATvwsh/6WdQwPpFVGwM2WcxRBkXVMZxUz43oA=; b=DsLE08okN6xtCTybL
	ITkxg4h6eiu2/Lf+ziNTb5OkC0H7uDYhsz87HeJg4jhsaZqhTDrHWCAeMsiWrY0t
	2H9G6hNnrShe/XGl6kqOpsrowbe97+wj05z9ThJN0CpnrYLt7CpTEoPxB7uWiGhw
	h2yqZCY/A3/hsr+Y2z/ftVUPVmy5Frfk6MkQcJE/FqPzf9f9DLILnIVL56nT7iw9
	7qUKUL1TIF8Vaay5869EUpF2zXidZBGAZa2vWUyVy975iQv7BEmb1uR5yVw2gxKn
	B0PTwz4OQGyUQjofKxGmuLJ2s+2CG/XtYgZnS4kLBHYkoD/akMMbjmOH8AHnTQJn
	BiM3w==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41snt0yydv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Sep 2024 20:49:23 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48MG63vu008684;
	Sun, 22 Sep 2024 20:49:22 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41t8v0uejw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Sep 2024 20:49:22 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48MKnLci22807128
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 22 Sep 2024 20:49:21 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3533358056;
	Sun, 22 Sep 2024 20:49:21 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AAB8F58045;
	Sun, 22 Sep 2024 20:49:20 +0000 (GMT)
Received: from [9.61.255.78] (unknown [9.61.255.78])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 22 Sep 2024 20:49:20 +0000 (GMT)
Message-ID: <4dbb0949-02a9-4f52-b9c5-5939d9004455@linux.ibm.com>
Date: Sun, 22 Sep 2024 15:49:20 -0500
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
Subject: Re: [PATCH v3] crypto: Removing CRYPTO_AES_GCM_P10.
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, stable@vger.kernel.org, leitao@debian.org,
        nayna@linux.ibm.com, appro@cryptogams.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mpe@ellerman.id.au, ltcgcw@linux.vnet.ibm.com, dtsen@us.ibm.com
References: <20240919113637.144343-1-dtsen@linux.ibm.com>
 <Zu6SeXGNAqzVJuPS@gondor.apana.org.au>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <Zu6SeXGNAqzVJuPS@gondor.apana.org.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8WOwtgfHcfk_26zwTLDhRuQUOaJF18-m
X-Proofpoint-GUID: 8WOwtgfHcfk_26zwTLDhRuQUOaJF18-m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-22_20,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=850
 priorityscore=1501 suspectscore=0 mlxscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409220159

Thanks Herbert.

-Danny

On 9/21/24 4:31 AM, Herbert Xu wrote:
> On Thu, Sep 19, 2024 at 07:36:37AM -0400, Danny Tsen wrote:
>> Data mismatch found when testing ipsec tunnel with AES/GCM crypto.
>> Disabling CRYPTO_AES_GCM_P10 in Kconfig for this feature.
>>
>> Fixes: fd0e9b3e2ee6 ("crypto: p10-aes-gcm - An accelerated AES/GCM stitched implementation")
>> Fixes: cdcecfd9991f ("crypto: p10-aes-gcm - Glue code for AES/GCM stitched implementation")
>> Fixes: 45a4672b9a6e2 ("crypto: p10-aes-gcm - Update Kconfig and Makefile")
>>
>> Signed-off-by: Danny Tsen <dtsen@linux.ibm.com>
>> ---
>>   arch/powerpc/crypto/Kconfig | 1 +
>>   1 file changed, 1 insertion(+)
> Patch applied.  Thanks.


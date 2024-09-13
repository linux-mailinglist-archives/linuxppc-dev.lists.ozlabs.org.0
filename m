Return-Path: <linuxppc-dev+bounces-1322-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EE70977E6B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 13:21:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4sMF0cS2z2xlF;
	Fri, 13 Sep 2024 21:21:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726226489;
	cv=none; b=W9mYoNf7rY5/lTuas7qG3ikPrqU2alWA9bn1CpG6nLyEjthl8AHpo7ilLkHoR2G+SkC1fpwXi0Cy5BTdzDJ3IpcxcFq9luPzLBTcfxR4v+3nuDcquvEw1x61+lL3ffoCJx9H1omLBdsnLdtD6yALpVmcyIQHiljUmVURjSnKdbGykNg5nV0tKeSnOPBhwJ3oCswrgf9/9WIOmDjGl1qhfNNnOAjBv4i0vaEl5EDa7ytpYz9n/230xBjAZRugGzbaBfedMvjCDbnTvgacEeI0JH74VF4BeJ/voncVD+4wtpDf0HPp5wYViqRuWY/WjI3YMx/AJJv2nYZFoUJlMxWFwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726226489; c=relaxed/relaxed;
	bh=4HcFPBWnwApgx5On/1sqLg13/AJZCZoUy9+GHpENwCs=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=H1m1gu+xbPLAFjr5mPbB7okY2nEXE4RuuMAn9VbjtqXhgyDp25HRu2m8GPMBXFPe91aUdKRkmr/ZCWUB6/hhs5LJFHKVaQBZHDi6dxyBqX0JjuEtyK6KNmqjIq1Q2jRTFfiacDMvMV3khadRUG5MTqaFsaTdjBnrQThpU1lFT2901MA4P/523vOX0zwCbsS6VafjSSqyUa3ehcEviB0XBQNpU2nhQ7MJBBY0fbi1fdICXsxX+eqzx4qUfbnxvIWURVcAl+OT/SqVLS08Y41Ox/AYqm+sHTnjmTw9M96HqzFdib4QydallaSwGptwKk+3IgcWPNymkWl8Cz97PXhhpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WU/FhMgP; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WU/FhMgP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4sMD58H6z2xks
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 21:21:28 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D9Gesb018596;
	Fri, 13 Sep 2024 11:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-type:message-id:date:mime-version:subject:to:cc
	:references:from:in-reply-to; s=pp1; bh=4HcFPBWnwApgx5On/1sqLg13
	/AJZCZoUy9+GHpENwCs=; b=WU/FhMgPvCrpiz0mMqz2QTMmnWi81w358nGrqmgD
	IIwpfmj7rGwuii0xHWlrAh/ZAJxb9FbPG+0mMdsQgvVZ6DOF9/utglbuF+TrhmYE
	97wodUHnG02XbLEpdx/Wehz4YLjiH4RPjCtD7bW7kTRq7Ks7zE0V1tE3GXVyDkBV
	nBITc6bsT++RHo1huz6o7kN1cwReF8vHUPkNMvHWcRNPmkNntP19CBNF2FyaDoQD
	lAZw8TE835jPdJywxccPANEVuJi7/AnKHHj/hMoeuKhnXphH+N/oGyCWr+CYg1PW
	YB7izQqvX815fzFzi+ctdB+x23RFJOlRNshG3avqpDTavA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gegx9hq4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:16:09 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48D8gWbf032069;
	Fri, 13 Sep 2024 11:16:07 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41h2nn5nhe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 11:16:07 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48DBG6fJ60948836
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 11:16:06 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 477AC5805A;
	Fri, 13 Sep 2024 11:16:06 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 097E358051;
	Fri, 13 Sep 2024 11:16:06 +0000 (GMT)
Received: from [9.61.250.246] (unknown [9.61.250.246])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Sep 2024 11:16:05 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------61LJE27GRZwOX5dgOLRijh7e"
Message-ID: <83a1ce2f-c633-42cb-92c6-2477cd2e47f2@linux.ibm.com>
Date: Fri, 13 Sep 2024 06:16:05 -0500
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
To: Kamlesh Gurudasani <kamlesh@ti.com>,
        Michael Ellerman
 <mpe@ellerman.id.au>, linux-crypto@vger.kernel.org
Cc: herbert@gondor.apana.org.au, leitao@debian.org, nayna@linux.ibm.com,
        appro@cryptogams.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, ltcgcw@linux.vnet.ibm.com,
        dtsen@us.ibm.com
References: <20240912174537.1409567-1-dtsen@linux.ibm.com>
 <87seu4qmv6.fsf@mail.lhotse>
 <875xr0m5ss.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
Content-Language: en-US
From: Danny Tsen <dtsen@linux.ibm.com>
In-Reply-To: <875xr0m5ss.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: swxzn0KtqUK92Voo8UFmQW4594oHDMHI
X-Proofpoint-ORIG-GUID: swxzn0KtqUK92Voo8UFmQW4594oHDMHI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_09,2024-09-13_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 clxscore=1011 malwarescore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409130076

This is a multi-part message in MIME format.
--------------61LJE27GRZwOX5dgOLRijh7e
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Yes, checkpath was run.

Not sure what you mean by "some indentation changes.(This can't go with 
fixes patch, will just add the noise)"

Thanks.

On 9/13/24 1:22 AM, Kamlesh Gurudasani wrote:
> Michael Ellerman<mpe@ellerman.id.au> writes:
>
>> Danny Tsen<dtsen@linux.ibm.com> writes:
>>> This patch is to fix an issue when simd is not usable that data mismatch
>>> may occur over ipsec tunnel. The fix is to register algs as SIMD modules
>>> so that the algorithm is excecuted when SIMD instructions is usable.
>>>
>>> A new module rfc4106(gcm(aes)) is also added. Re-write AES/GCM assembly
>>> codes with smaller footprints and small performance gain.
>>>
>>> This patch has been tested with the kernel crypto module tcrypt.ko and
>>> has passed the selftest.  The patch is also tested with
>>> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
>>>
>>> Signed-off-by: Danny Tsen<dtsen@linux.ibm.com>
>>> ---
>>>   arch/powerpc/crypto/Kconfig            |    1 +
>>>   arch/powerpc/crypto/aes-gcm-p10-glue.c |  141 +-
>>>   arch/powerpc/crypto/aes-gcm-p10.S      | 2421 +++++++++++-------------
>>>   3 files changed, 1187 insertions(+), 1376 deletions(-)
>> As this is a bug fix it should have a Fixes: tag, and probably a stable
>> Cc as well.
>>
>> But that diffstat is really large for a bug fix. Is there no way to fix
>> the issue in a smaller patch? Even if that is just disabling the feature
>> until it can be fixed in subsequent commits?
>>
>> cheers
> The commit message says "The fix is to register algs as SIMD modules"
>
> and
>
> "A new module rfc4106(gcm(aes)) is also added."
>
> and I also see some indentation changes.(This can't go with fixes patch,
> will just add the noise)
>
> Would suggest to break the patch in three.
>
> I see a big subject line, have you ran the checkpatch?
>
> Kamlesh
>
--------------61LJE27GRZwOX5dgOLRijh7e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Yes, checkpath was run.  </p>
    <p>Not sure what you mean by "<span style="white-space: pre-wrap">some indentation changes.(This can't go with fixes patch, </span><span
      style="white-space: pre-wrap">will just add the noise)"</span></p>
    <p>Thanks.<br>
    </p>
    <div class="moz-cite-prefix">On 9/13/24 1:22 AM, Kamlesh Gurudasani
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:875xr0m5ss.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me">
      <pre wrap="" class="moz-quote-pre">Michael Ellerman <a class="moz-txt-link-rfc2396E" href="mailto:mpe@ellerman.id.au">&lt;mpe@ellerman.id.au&gt;</a> writes:

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Danny Tsen <a class="moz-txt-link-rfc2396E" href="mailto:dtsen@linux.ibm.com">&lt;dtsen@linux.ibm.com&gt;</a> writes:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">This patch is to fix an issue when simd is not usable that data mismatch
may occur over ipsec tunnel. The fix is to register algs as SIMD modules
so that the algorithm is excecuted when SIMD instructions is usable.

A new module rfc4106(gcm(aes)) is also added. Re-write AES/GCM assembly
codes with smaller footprints and small performance gain.

This patch has been tested with the kernel crypto module tcrypt.ko and
has passed the selftest.  The patch is also tested with
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.

Signed-off-by: Danny Tsen <a class="moz-txt-link-rfc2396E" href="mailto:dtsen@linux.ibm.com">&lt;dtsen@linux.ibm.com&gt;</a>
---
 arch/powerpc/crypto/Kconfig            |    1 +
 arch/powerpc/crypto/aes-gcm-p10-glue.c |  141 +-
 arch/powerpc/crypto/aes-gcm-p10.S      | 2421 +++++++++++-------------
 3 files changed, 1187 insertions(+), 1376 deletions(-)
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">
As this is a bug fix it should have a Fixes: tag, and probably a stable
Cc as well.

But that diffstat is really large for a bug fix. Is there no way to fix
the issue in a smaller patch? Even if that is just disabling the feature
until it can be fixed in subsequent commits?

cheers
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">The commit message says "The fix is to register algs as SIMD modules"

and

"A new module rfc4106(gcm(aes)) is also added."

and I also see some indentation changes.(This can't go with fixes patch,
will just add the noise)

Would suggest to break the patch in three.

I see a big subject line, have you ran the checkpatch?

Kamlesh

</pre>
    </blockquote>
  </body>
</html>

--------------61LJE27GRZwOX5dgOLRijh7e--



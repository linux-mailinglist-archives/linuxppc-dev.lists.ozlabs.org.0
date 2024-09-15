Return-Path: <linuxppc-dev+bounces-1375-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E719794BA
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Sep 2024 08:15:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X5yT470mXz2xm5;
	Sun, 15 Sep 2024 16:15:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.23.248
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726380920;
	cv=none; b=DXRoOwwdvu7wYB62nZgWqJX6//QxJz9hW6BLagRYCvO/cYaHCZe3THST9NDw2DBabcJdy7hnMzchXuIYsVMsLjLApLAS4oQKcF0Z9HUlcwLTKJvdxFm4sltePnjSFR0DleJfl5GOh33utCBzgok+NkKI6ib06nLg+VwgsPiJ2Oy0A/w/o3xxPJSzwPl6/GrPm5Fo1mHzc+lFDlRZmEXhl2xfOUBS7qRxr4hcaUKw2S3jmoud3I/OUYkQvtHEzhPqnkEA+AJAPQyaphbi1qarxAd5o0zMtP8M2L2OhqmjQrFyMYcTLZ3M/ECv2LyUg1ZnaPm00MaQKAjZaXqrmn0Rdw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726380920; c=relaxed/relaxed;
	bh=6R4bT4eG+pR13vlD+1lb47ZNgfISERBM6UKaIOkTBQ8=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D9SZtvqA17SZQCFOYM+UpEbCHJgJ1qg8lyFDUNU6K83hWCQDMaaMjov/rHDU9S9scJZlHlnXY9dZV/XJ0wnqcPFVPdYoCPI6dLYrrbWnEAE1wKq9soEK4Rb6iRF9gP8frobqE2vByZtGlJAr7buO7/fHOTycwAQNfCcHXAwUw75fFZtd3OAKuD1q4tONlKiVa92P4rXEcy35b/jRgDt5cb0S1pkoILoZS1H3H0AkTALOh1sbakC7SubKGIphMWAPpys9g0RIlo3IZartPGZtwqa9O0DLOfQa6jMCKSdxi0Tn39jbnjQRZkKPlsAnOM5awsAy7mw8oZGQaFq+bNo5TQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=R+xzG2YJ; dkim-atps=neutral; spf=pass (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com; envelope-from=kamlesh@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=R+xzG2YJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.23.248; helo=lelv0143.ext.ti.com; envelope-from=kamlesh@ti.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 424 seconds by postgrey-1.37 at boromir; Sun, 15 Sep 2024 16:15:19 AEST
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X5yT30sPGz2xk1
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2024 16:15:17 +1000 (AEST)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48F67bol080272;
	Sun, 15 Sep 2024 01:07:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726380457;
	bh=6R4bT4eG+pR13vlD+1lb47ZNgfISERBM6UKaIOkTBQ8=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=R+xzG2YJQndSEIKqNk3CDItHvOpmLqJwxfZPPp9/2IYsRgKG45vAJhe2iI/fY1WzU
	 ldddRPjr2ogRkRtAjrvsN4+AI/l/7a5dHoEJV55BMDcZipUd7dH93lyIzAgBIMqP8b
	 Yt2/mSX6+2i8tf7HXiNblUOjJsJIFdklMZmIA9oc=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48F67b6q020473
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 15 Sep 2024 01:07:37 -0500
Received: from flwvowa01.ent.ti.com (10.64.41.90) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sun, 15
 Sep 2024 01:07:37 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by flwvowa01.ent.ti.com
 (10.64.41.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.2507.34; Sun, 15 Sep
 2024 01:07:37 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sun, 15 Sep 2024 01:07:37 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48F67a7E048692;
	Sun, 15 Sep 2024 01:07:36 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Danny Tsen <dtsen@linux.ibm.com>, <linux-crypto@vger.kernel.org>
CC: <herbert@gondor.apana.org.au>, <leitao@debian.org>, <nayna@linux.ibm.com>,
        <appro@cryptogams.org>, <linux-kernel@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <ltcgcw@linux.vnet.ibm.com>,
        <dtsen@us.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 1/1] crypto: Fix data mismatch over ipsec tunnel
 encrypted/decrypted with ppc64le AES/GCM module.
In-Reply-To: <83a1ce2f-c633-42cb-92c6-2477cd2e47f2@linux.ibm.com>
References: <20240912174537.1409567-1-dtsen@linux.ibm.com>
 <87seu4qmv6.fsf@mail.lhotse>
 <875xr0m5ss.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
 <83a1ce2f-c633-42cb-92c6-2477cd2e47f2@linux.ibm.com>
Date: Sun, 15 Sep 2024 11:37:35 +0530
Message-ID: <8734m1mouw.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180

Danny Tsen <dtsen@linux.ibm.com> writes:

> Yes, checkpath was run.

As you're splitting the patches anyways, this may not be
needed anymore, but below is guideline for subject line.

https://docs.kernel.org/process/submitting-patches.html

"For these reasons, the summary must be no more than 70-75 characters,
and it must describe both what the patch changes, as well as why the
patch might be necessary.
It is challenging to be both succinct and descriptive, but that is what
a well-written summary should do."

I guess check patch is not checking that.

Also avoid top posting,

Read "Use trimmed interleaved replies in email discussions" from above
document.

Kamlesh

>
> Not sure what you mean by "some indentation changes.(This can't go with 
> fixes patch, will just add the noise)"
>
> Thanks.
>
...
>>> As this is a bug fix it should have a Fixes: tag, and probably a stable
>>> Cc as well.
>>>
>>> But that diffstat is really large for a bug fix. Is there no way to fix
>>> the issue in a smaller patch? Even if that is just disabling the feature
>>> until it can be fixed in subsequent commits?
>>>
>>> cheers
>> The commit message says "The fix is to register algs as SIMD modules"
>>
>> and
>>
>> "A new module rfc4106(gcm(aes)) is also added."
>>
>> and I also see some indentation changes.(This can't go with fixes patch,
>> will just add the noise)
>>
>> Would suggest to break the patch in three.
>>
>> I see a big subject line, have you ran the checkpatch?
>>
>> Kamlesh
>>


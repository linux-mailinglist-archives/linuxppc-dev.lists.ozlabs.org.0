Return-Path: <linuxppc-dev+bounces-1312-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A06977904
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 08:54:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4lR06TKMz2ygy;
	Fri, 13 Sep 2024 16:54:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=198.47.19.141
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726209947;
	cv=none; b=YLIDtivnMrn5pNFNUVXaS9M8cuwEEmUZQ65ia69nfy3WAZg3l4W5aO4bCCw6QUvYwp3mF8Wn4YJHRcPpXRmqRb8oEZayfecamBvxx7KpZnQee9WBMIRbZq4w6rzDAKcuVzBmBg11ZsqLVKtIZMu/nYoSM4k/iiRMtg8RDfYX4FET7C4MFerqijr8/WtTHx0fGbv4Whnc7N95tnsBxbdmNcnMexSG0H8PW+bTGuBZVm7Dm85WUW5YKa23q4dt45d2qdw04AIY/JLxatAStSnQzqamvjdusS+r3f0xoH0pHQ/C22dws+n4r9NC4CgZonwyXcZCFaIcdYvVVOWyaKmyhw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726209947; c=relaxed/relaxed;
	bh=GRmZ18pvPzToAni3UO6ERJ/c8A6oDPuUhhPN9lQ0soI=;
	h=From:To:CC:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=m+PyeCUJP6o7lZrFFUul9agttAZX/U3Hfin82qpGZxF1C6Iix54Urtv0LijvFJxZQzCSRq6bLj7qAngujwN3qTS6xyGQZvODMdjv/ZmNvmy/GdSK0vhVVRG+Q86E/h6sEZAqGgK+dVyDYM6Zl4SElnYMAmoSlJRriG5c9XlAO4Tmi4nnp4wrDDE8fhXj26w0ODKXwTSxO3Lsc4bLilmsfZlt68oyXU7x6QOlDrFLJO9VWw1z5Xgs96swtuq5LRhNG0syZ/xALzv7+A3oW1KdYbMnAMncGv//K2N4UhhkCzQzXikqgZWStbUw3OOtD9wsvsbQThZG6fNcQiwAHmxFcQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=i5tpeFrv; dkim-atps=neutral; spf=pass (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com; envelope-from=kamlesh@ti.com; receiver=lists.ozlabs.org) smtp.mailfrom=ti.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=ti.com header.i=@ti.com header.a=rsa-sha256 header.s=ti-com-17Q1 header.b=i5tpeFrv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=ti.com (client-ip=198.47.19.141; helo=fllv0015.ext.ti.com; envelope-from=kamlesh@ti.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1049 seconds by postgrey-1.37 at boromir; Fri, 13 Sep 2024 16:45:46 AEST
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4lF60zQwz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 16:45:44 +1000 (AEST)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 48D6MSnn029205;
	Fri, 13 Sep 2024 01:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1726208548;
	bh=GRmZ18pvPzToAni3UO6ERJ/c8A6oDPuUhhPN9lQ0soI=;
	h=From:To:CC:Subject:In-Reply-To:References:Date;
	b=i5tpeFrvSkm3jTxmJzVAL1yAIkuc8XzeOBN1R8gIxH+yUpolFpl4hy1hGeAlebZaT
	 hhjBfrGlGQP/h/2akru2NOHfIvCBNY3QtN8j1505YbEi0Emxycm6Cv6RlgPBrf7HGG
	 mNRU+spnwxdVYRPCqzsCldXdK5rpUl8IGGrv/GRU=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 48D6MSS0013694
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 13 Sep 2024 01:22:28 -0500
Received: from DLEE111.ent.ti.com (157.170.170.22) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Fri, 13
 Sep 2024 01:22:28 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE111.ent.ti.com
 (157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Fri, 13 Sep 2024 01:22:28 -0500
Received: from localhost (kamlesh.dhcp.ti.com [172.24.227.123])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 48D6MRWY065337;
	Fri, 13 Sep 2024 01:22:28 -0500
From: Kamlesh Gurudasani <kamlesh@ti.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Danny Tsen <dtsen@linux.ibm.com>,
        <linux-crypto@vger.kernel.org>
CC: <herbert@gondor.apana.org.au>, <leitao@debian.org>, <nayna@linux.ibm.com>,
        <appro@cryptogams.org>, <linux-kernel@vger.kernel.org>,
        <linuxppc-dev@lists.ozlabs.org>, <ltcgcw@linux.vnet.ibm.com>,
        <dtsen@us.ibm.com>, Danny Tsen <dtsen@linux.ibm.com>
Subject: Re: [PATCH 1/1] crypto: Fix data mismatch over ipsec tunnel
 encrypted/decrypted with ppc64le AES/GCM module.
In-Reply-To: <87seu4qmv6.fsf@mail.lhotse>
References: <20240912174537.1409567-1-dtsen@linux.ibm.com>
 <87seu4qmv6.fsf@mail.lhotse>
Date: Fri, 13 Sep 2024 11:52:27 +0530
Message-ID: <875xr0m5ss.fsf@kamlesh.i-did-not-set--mail-host-address--so-tickle-me>
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

Michael Ellerman <mpe@ellerman.id.au> writes:

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
>>  arch/powerpc/crypto/Kconfig            |    1 +
>>  arch/powerpc/crypto/aes-gcm-p10-glue.c |  141 +-
>>  arch/powerpc/crypto/aes-gcm-p10.S      | 2421 +++++++++++-------------
>>  3 files changed, 1187 insertions(+), 1376 deletions(-)
>
> As this is a bug fix it should have a Fixes: tag, and probably a stable
> Cc as well.
>
> But that diffstat is really large for a bug fix. Is there no way to fix
> the issue in a smaller patch? Even if that is just disabling the feature
> until it can be fixed in subsequent commits?
>
> cheers
The commit message says "The fix is to register algs as SIMD modules"

and

"A new module rfc4106(gcm(aes)) is also added."

and I also see some indentation changes.(This can't go with fixes patch,
will just add the noise)

Would suggest to break the patch in three.

I see a big subject line, have you ran the checkpatch?

Kamlesh


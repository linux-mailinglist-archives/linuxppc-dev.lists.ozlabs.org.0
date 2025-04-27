Return-Path: <linuxppc-dev+bounces-8053-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FEAA9E2B5
	for <lists+linuxppc-dev@lfdr.de>; Sun, 27 Apr 2025 13:29:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZlkrX090rz2ynh;
	Sun, 27 Apr 2025 21:29:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745753387;
	cv=none; b=LESgwNEzDuxkwkWSKLmKdzqhbNqOD+1nra3LUAquFxL8GZDEWddPdsNMzRxADUKvb9xrsJn5Jz2W/c2RZakMygSQ1xMKt3p0FIjpJNldebaakkujXiK55b5QjGC44tvVDYWzKoLGnLzFBk7yAu58Sh5IrAQyIGmf0CitoRKRk2elouu6DKfW6Y11XtiTSvgyzBS7OxnhrOeZq2upKiHU2yzsYlsvs3k5dOl5q83MMfFbCK94m0F6HGIklZOEa7LBY2Vgc1Px0CmtHAA3N5nXHXFGpPp8OR7KNPkM42K5UxmAnK2zGwzg+0fdPESs2koSS0m0fqcyt8b++ZqWUgFGxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745753387; c=relaxed/relaxed;
	bh=5AVnMYrfQqCKvIYMObZqGv0ycuhL3WyZhFo4zuHwRSU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=jIDR0AN51upstr2RaTS8VbQ0dn+JZ3vqBEWrhYQE7c//FLcuzctMhqRZXxqYvabOMuBP18RDnSuCR8zv+L+VDqwfZwY0TgdgKvqxTDbyPilP0ojLcCImI0Z7jcFdxrukhJQAi9SJJRS7MX4F88xfePrt5F00OPfcn4x4qi2hgL0Cr6PuSp6J6jHBFZJvio/9xbBmGPIGQDaOkE6nJwDkeQflQnDbFsFEehXeApnxJJZModl9mjOgfkqwWMxRp1pQKNv7FwscIn0EVbMEsYtCMAJxxiURa15Wl2lrhM6eFnu4dRl3G2c2BHedZkpTPOnhBSCqR0MoGnnhWSHWaZrU4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev; dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm1 header.b=cHiGN+ZH; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EjsUXopk; dkim-atps=neutral; spf=pass (client-ip=202.12.124.154; helo=fhigh-b3-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev; receiver=lists.ozlabs.org) smtp.mailfrom=svenpeter.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=svenpeter.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=svenpeter.dev header.i=@svenpeter.dev header.a=rsa-sha256 header.s=fm1 header.b=cHiGN+ZH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=EjsUXopk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=svenpeter.dev (client-ip=202.12.124.154; helo=fhigh-b3-smtp.messagingengine.com; envelope-from=sven@svenpeter.dev; receiver=lists.ozlabs.org)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZlkrT0YZ0z2ym3
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Apr 2025 21:29:44 +1000 (AEST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4F1702540219;
	Sun, 27 Apr 2025 07:29:41 -0400 (EDT)
Received: from phl-imap-07 ([10.202.2.97])
  by phl-compute-04.internal (MEProxy); Sun, 27 Apr 2025 07:29:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svenpeter.dev;
	 h=cc:cc:content-transfer-encoding:content-type:content-type
	:date:date:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=fm1;
	 t=1745753381; x=1745839781; bh=5AVnMYrfQqCKvIYMObZqGv0ycuhL3WyZ
	hFo4zuHwRSU=; b=cHiGN+ZHVQvwAmWDVqx50p8JoFWULaccQJvoTA0aQQhbWoFj
	6J7CETqWlKWiUxtKkRoO5VBEsJc6Am067bGJBPDJwas4PXB2FBqDdwB4cW40fhmj
	wW7+AXxGlx5lVtBORqbrSngOYGPpMo0CvUWAa45O4OOu7+7wunwDjjoonqC7g/zW
	Wdnh+EFjZyvK1jID1HhANCjNFi9iIEdoQ0r7P92cG721VszlAtd/czvo6+R8Hnxd
	ucQR93PRE5ZxsRismq+JU6fyHS6HATK+azAFOjjrYuhZcxpk1Z0JCOm6aexDIxt9
	fT5+7FT2550zPfT/Cm8SqfCMPnSLrPEoNfBqnA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1745753381; x=
	1745839781; bh=5AVnMYrfQqCKvIYMObZqGv0ycuhL3WyZhFo4zuHwRSU=; b=E
	jsUXopkgxavIZ1xItTb/bHcd5C9+Mg0mtnK92mV2vksvqWHpIuKCP+LQ9bu5hBCc
	TZ2zPdMVV72GaMriRYLOEZTZN2BUlRteq/ZRE2Kz93PfwQOjIWE0wawVSOd54nKk
	seKri/NZ/obQ3FAeZXO8dbcnPWXrcLAfqCvty8lppFSb5WdiwkR/0yTZYCUgLtRG
	veElxm/j9xyyoVLMrHwkYYF7cSjcxkS79ZjK941CezfydKUJSLjMV4vODtI/wrcn
	343CLszdcrK/IUnuzPChqz6yiHhvgSImt7VzQWkWukoosIkOqVrsgctzZcDflKy3
	DsI3xeOBJqtDICJKGf9QA==
X-ME-Sender: <xms:IxUOaJOdB7skIWg1gp5gI_f5bSLHlrtJ5DizHoMVXln4GRcU_grfCA>
    <xme:IxUOaL9FSn8d4Om1QrpZrSgSwOPFF8UE367CRXKJQIUYLtao_KGS2rQ5caiW6IfgV
    zZK3DICYOyduSjMrYo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvheejleehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedfufhvvghnucfrvghtvghrfdcuoehsvhgvnhesshhvvghnphgvth
    gvrhdruggvvheqnecuggftrfgrthhtvghrnhepleefteeugeduudeuudeuhfefheegveek
    ueefffdvffektdffffelveffvddvueffnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepshhvvghnsehsvhgvnhhpvghtvghrrdguvghvpdhnsggp
    rhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhish
    htohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegv
    lhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrd
    gtohhmpdhrtghpthhtohepnhgvrghlsehgohhmphgrrdguvghvpdhrtghpthhtohepjhes
    jhgrnhhnrghurdhnvghtpdhrtghpthhtoheprghnughirdhshhihthhisehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehnrghvvggvnheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepmhgrugguhieslhhinhhugidrihgsmhdrtghomhdprhgtphhtthhopehlihhnuhigqd
    grrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:IxUOaISkvdKNkauBTau3Yk86BBkDs_xaQlGa8g1PKqItwEO6sr7_Aw>
    <xmx:IxUOaFsQIYPEGVcnbw5bn1-nmmufSyYvjad865GJP9x0WREMbgpV5g>
    <xmx:IxUOaBd97cPa0WAqm8KOVrSh9n-zwiAuFqZ3Oln3jFSUdNAWa0GCEQ>
    <xmx:IxUOaB2Jm45REZl8uOecpL_ceCAb7Zm9Jwx7F71mScOODKnIaRvMpQ>
    <xmx:JRUOaB2nIin_JYaVvDIelqSp6Cg24ftqlZtTrULSUZnnWHPvRJfd7SeL>
Feedback-ID: i51094778:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3F050BA0070; Sun, 27 Apr 2025 07:29:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-ThreadId: T5434dab6164679dd
Date: Sun, 27 Apr 2025 13:29:17 +0200
From: "Sven Peter" <sven@svenpeter.dev>
To: "Andi Shyti" <andi.shyti@kernel.org>
Cc: "Janne Grunau" <j@jannau.net>, "Alyssa Rosenzweig" <alyssa@rosenzweig.io>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>, "Neal Gompa" <neal@gompa.dev>,
 "Hector Martin" <marcan@marcan.st>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <c6590a37-97b0-4497-8cc1-c4572897f0dc@app.fastmail.com>
In-Reply-To: 
 <dtjvj34q4ojbci67akkxfiskpiro24xupagr5rl4dn3idd6vxh@2emtiwbvpvra>
References: <20250415-pasemi-fixes-v2-0-c543bf53151a@svenpeter.dev>
 <20250415-pasemi-fixes-v2-4-c543bf53151a@svenpeter.dev>
 <dtjvj34q4ojbci67akkxfiskpiro24xupagr5rl4dn3idd6vxh@2emtiwbvpvra>
Subject: Re: [PATCH v2 4/6] i2c: pasemi: Improve error recovery
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,


On Thu, Apr 17, 2025, at 15:07, Andi Shyti wrote:
> Hi Sven, Hector,
>
> ...
>
>> +/*
>> + * The hardware (supposedly) has a 25ms timeout for clock stretching, thus
>> + * use 100ms here which should be plenty.
>> + */
>> +#define TRANSFER_TIMEOUT_MS	100
>
> Please use the PASEMI prefix here. TRANSFER_TIMEOUT_MS it's not a
> naming belonging to this driver.
>
> 100ms looks a bit too much to me, but if you say it works, then
> it works.
>

The problem here is that we only have very outdated documentation for this
hardware and no real idea what changed since Apple bought PASemi and continued
using their i2c controller.
We know that 10ms (which used to be the original timeout iirc) is not nearly
enough and we also know that we need at least 25ms for clock strechting
(assuming nothing changed in the past 10+ years).
We just bumped it to 100ms to be safe after we very rarely got error
reports which we tracked down to timeouts and haven't gotten any reports
since.


I've addressed all your other comments for v3 which I'll send out in a few minutes.


Best,


Sven


Return-Path: <linuxppc-dev+bounces-8668-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CEE3ABC035
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 16:05:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1KGG3ZSlz2xCd;
	Tue, 20 May 2025 00:05:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747663542;
	cv=none; b=oNgo9wZGBXCECYGoTxKIp8uV96u03gxggH9T3Rl9cvop7SYSv0Gzu1rQz0tl8sLx5stAQqOpYRaN8b2eiefHRAFdDZgpE8do7XJbMqe3mGhgtVXjFP3LumQiHhG4qGg5DwSsa9QAdxS/TtzHk+RKH12KHiM//hCVC7aj77kchn5vEuDyHfZ3pveZQWNS3dqIX8DtfoWT3CHlaPMpzKQi0CqU3A+Q9erRQybcbBkIwKBUGOPkP8vl562yS2OYSsuFtKtGdUXaFqRa8zt40GhDwuhjOS3QPrGpmCaPdGF1Mq5/EEqechLE6Yn05KWDYiDNr0yUBH2b0Ofc9yGp0lejYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747663542; c=relaxed/relaxed;
	bh=7aDP1PxL2JQGjb/8p5eedBsndVG0BWpwT7Tr3PT950w=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=g4zwrfAroITVy/L/kkd6sCnwfoHcW7KIT+nxb76JwnYT0eTs2T8Q6qzC7RCNrqTasGV7dYEjSB0T9IKG873jGnxZgix1E/pby+4cvMfonvQBOob1Jz0cjOsgjA/9piTcob7BjKCBrUHewCfi19VHifMTulyZEN+eIFhXeqyQKI7JvO5SIREJu9a6/JC3jrHWNlIafJwex0DCXoUIe3oQpIBPedwz8sh3mTMNdxVCKPuHKRtKheCyrTH0c6cBwzIaZJyT+R4G1+xum10PDd+swqtKm8klPrNQZxJlAVQGwNqCEIOxvN/h7R6tmy514RtfXujS7aEJgdXFBMJoRVee0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=WmADYZ52; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CfT+Phyh; dkim-atps=neutral; spf=pass (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=WmADYZ52;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CfT+Phyh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1KGC3mnFz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 00:05:39 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 95607254013B;
	Mon, 19 May 2025 10:05:36 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Mon, 19 May 2025 10:05:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1747663536;
	 x=1747749936; bh=7aDP1PxL2JQGjb/8p5eedBsndVG0BWpwT7Tr3PT950w=; b=
	WmADYZ52awxZNl1tdwi0Pkm4ywbK5JbHn1fUwLiX/twF0PGVXFz9w2A0EYZbn6IB
	I6PBSvxLSGmw+JOgFqF8Fib8c7qCGjHuJlNNA1mHcFy3IPjAKo2dzJJfrsiIf9to
	/XzWf4HisOtXlTT4qU8di/2sTIspIyOPcIlZ/I+KloCA95uB2rot609fXQ2wTQZl
	NtDl8h8Gq9v5I5K+Nw6S0j2lOZc3ZVPpbDfnq2OsYXeRp64KjzO+kdsjgWnwtud9
	v0xixPWsG5Fo1HaEukHkgdK0GLkaqAyhE+hMUlAoKaI0llf4V5/xkKGxUr937XaG
	7tCRkxdKk97/GdpuYkFBLg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747663536; x=
	1747749936; bh=7aDP1PxL2JQGjb/8p5eedBsndVG0BWpwT7Tr3PT950w=; b=C
	fT+Phyhr6Lnasz51MLXblt31Z/Ac56nV8sCu93ecAM4lkbPjocl5Wy07THREbGsF
	hGqqKWN+xJkNM3vVdLGZERDAt4Xc/0ec+t1ftKM1Qvd/FMboNPruJAwzW+tE2IIn
	ABnuTl/PaygW9gqcwWs3R91R9w/UttY/LkZmFS9CeyY7mkgF+WEcOYd2cfQgX1jE
	MsVcjbJzfITYjUiPMHEkqQlCyx8rMSh7vB+shBvodR//eUfzoSQlliqt49KIrYZQ
	XFWbOJcnrH//CBbF63dgTV05JOHcMIBhu/KJUokcNhLuJhVvyu/kbwi40y+HWO4a
	OgptL/kyI9zr19OYdrOZg==
X-ME-Sender: <xms:rzoraEZUGqiZTiq57iUBcbr23FEQnnapDR-0up3o-IhJ33C_ED4obw>
    <xme:rzoraPbhauczOy3XT6RlN9yEP5In2_9i7tt0Uh5Avw6NDkXiQqZx6DK6Q_IQJ46Rd
    Fxgn1OtRPoWywSAN0k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefvdduheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhepfefhheetffduvdfgieeghfejtedvkeetkeej
    feekkeelffejteevvdeghffhiefhnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnuges
    rghrnhgusgdruggvpdhnsggprhgtphhtthhopeegpdhmohguvgepshhmthhpohhuthdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohidvsegtshdqshhophhrrghsthgv
    rhhirgdrtghomhdprhgtphhtthhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdp
    rhgtphhtthhopehprghulhhushesohiilhgrsghsrdhorhhg
X-ME-Proxy: <xmx:rzoraO-RrSkywlkRDv_dJsa8XHjUze_jIgvyHk6IAKSCzDIB7TmtVQ>
    <xmx:rzoraOpIO79mcjascQXewLy7XnfBhoY6ABKKRO0Np_gz5aOPcvTm3g>
    <xmx:rzoraPoLvA_QUbV2jW9RmFuyrFf-E2k5wcboK1pPBQCfASmmQxnJjA>
    <xmx:rzoraMRRMv1TNziTTDRxNos7N-YXhmi_TeGStGRrhOIHCTGqaHUiSQ>
    <xmx:sDoraPPP6lXuxoo9XzbcTcSm1f7oimuOX4cBBV5un1lwTNaWVzi0_SCU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D51051060061; Mon, 19 May 2025 10:05:35 -0400 (EDT)
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
Precedence: list
MIME-Version: 1.0
X-ThreadId: T75d59e8ff29910ec
Date: Mon, 19 May 2025 16:05:05 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "LEROY Christophe" <christophe.leroy2@cs-soprasteria.com>
Cc: "Nicholas Piggin" <npiggin@gmail.com>,
 "Paul Mackerras" <paulus@ozlabs.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-Id: <233701f4-4d31-40b6-97d3-5abd8b9954ab@app.fastmail.com>
In-Reply-To: <85ae2cb8-f594-46ac-87fd-2a53cdd7ef9e@app.fastmail.com>
References: <aB6teOoVLWkdvyBu@bruin>
 <8bbd9fc6-8edf-46e4-952a-0a4da0a0660c@cs-soprasteria.com>
 <85ae2cb8-f594-46ac-87fd-2a53cdd7ef9e@app.fastmail.com>
Subject: Re: Crash in __do_IRQ with gcc 15
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 13, 2025, at 12:08, Arnd Bergmann wrote:
> On Mon, May 12, 2025, at 20:13, LEROY Christophe wrote:
>> Hi Arnd,
>>
>> Do you know when you will be able to add GCC 15 to 
>> https://mirrors.edge.kernel.org/pub/tools/crosstool/ ?
>
> I have to create a new build environment for gcc-15 after I lost
> access to the machine I used for the earlier builds. I should
> be able to do that within a few weeks, but unfortunately it's
> a little more work than just rerunning my scripts (which I still
> have).

I've uploaded gcc-15.1 binaries now. I've only tested the arm64,
as usual, so please let me know if the powerpc and x86 hosted
ones cause any problems.

     Arnd


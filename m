Return-Path: <linuxppc-dev+bounces-8535-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73083AB5110
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 May 2025 12:09:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZxXHt0d6cz2yFK;
	Tue, 13 May 2025 20:08:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747130938;
	cv=none; b=kZPEWxVIFZhRgruM4NbBLF9d2vmSxO6pRxInZbgzNBCim9mgW1ty/Ds+4Dp5yTdO9TU2PRgmR+5JdBrXhU37IdyLXpeElL3T+/JntCCLSqcXhLLwuEbyrjiOWwUnh958P4uxfvEfFrFq5vnGGmwTaIYLlc63EV5rf6wFy5JE7t66c6kHAGbpJjn2F2wyt7P8qAekG59W+60R4V5bRVhT2vQen3Ds24oWe/6oMiDYa95mQLlRFNC6z1lJw1NG0miq/kVMDTESGmty32YL4sWriXKhTyhhZr9JOl0nWDjA6PwKAw01xlwAkemLAy2Qcfw7Cqb+M1B2IeCwF9iqjNU9PA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747130938; c=relaxed/relaxed;
	bh=MIaNL5Kd2YKPa5wg9ssGZo0JPZ3wlBdDhMAR0JucTqs=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=GNaMXWB+plb43eUCYQ/64IJrvFcBnC0KLlN1tSOGzqgQBSd9cPIRrVCoTIzSb+OsKITCtm8A1DcuNH5yu8TcxtlFC/Xf/BWLuz6YN7fq0gga+GlZh+8M2u7r09yar95SnT5OGn7/It2w6aw5n1z90qOKOJhmfHx9SiYzmY7f7ctNM0ShXjiDRgW+/tbvRNYKf8W/0Z0tLXx32MZhapyPYPuKH5JYXfd1DUVpFaH2mU8233rdHChL5GOJwptufyhKReTNBL1I9OKQh+G80/qIQSUVFqbOQ0cf/X82ndHmrr9xtevR3rzOpoTvx6/umUgbdlCnTCUvKRVOVn/eYTQgCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=0bYUhGma; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=smooNYk5; dkim-atps=neutral; spf=pass (client-ip=103.168.172.152; helo=fhigh-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=0bYUhGma;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=smooNYk5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.152; helo=fhigh-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZxXHs192nz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 May 2025 20:08:56 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 9F37311400D3;
	Tue, 13 May 2025 06:08:54 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-05.internal (MEProxy); Tue, 13 May 2025 06:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1747130934;
	 x=1747217334; bh=MIaNL5Kd2YKPa5wg9ssGZo0JPZ3wlBdDhMAR0JucTqs=; b=
	0bYUhGmasjYo3UtQDhUO1kcYpbAVuA86FmLqieuOuz6oKmKvM6DDcp4pHVbRgi5f
	erM2hmpavLCutp7voFZS2SYOqPmwO77AuR37FphthoWOK45PPNwZe/eDUJrw466o
	WcYUQGg/Ssz677FPjD+UE1DAo84ccSEXYU7khhLxuLpyTIvVgT9o6n2KueZlstOw
	LU5zAc6S2xHD6o66IDAIQGzj3BZA6/PM27Vz/l9jbqxK9wc2CWEbOs+r8ypZnKUV
	MUlMvupxr55NW8xMYSWITAK9ET5LDLkBzHJjyobJVta5C7ELq9XwbzezUUXtp1Gx
	QfHFIGNx+pgvFXcx1LhBOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1747130934; x=
	1747217334; bh=MIaNL5Kd2YKPa5wg9ssGZo0JPZ3wlBdDhMAR0JucTqs=; b=s
	mooNYk5j6wU3/tn+/8GgTdqI8kmYPMpwucoBceXp1Gnbx+x98I8bEdEHSwsLMUHC
	7H2NG7skfdwUHBpa9dtkEEVF1w2tALSweN0KVGZi9O42udy6MkENHWxkqOp+Vz41
	sCApuaAs39JMJiEcoNcAwkJ6008i9RGMdsEvew16ub6ybIcY+UFX/mDg4fsIwoDw
	6vU9Uilt15psmfqrbD6FcPkeE0x9zvfs/irudFaCPz1nLN7XSPS9U3hvnDg+FhLZ
	8jF/UN/DRudWgc74c4fyrZukCM2lJ4ZrTSgeU9vKTIueStkmd91XNlSDrwCWLW2u
	2lUG8UQ70H2rqZrAUjbMw==
X-ME-Sender: <xms:NhojaCdEziZTxFf8ETJzu4THDSHi2bGc1C61YBDNN00_WGP12iQB_A>
    <xme:NhojaMMq-MTXuCAiilT1zslMAZGxTvn24_SAuxNfMSCFx79F2OiKDSTTfgDmd6pO7
    yupWMmLK4n6pJkTWy0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdefkeehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:NhojaDi_OVF6GSGlDA3CIGBnBRNv5040JoK1mVJqR4lYdhcuSwlIPA>
    <xmx:NhojaP8m5pO65mkVD2emyVgzwaWQYAb1Fb4SDKXDEg8uw4TSf_tNkw>
    <xmx:NhojaOt4XxEa-EBYgAFDDFnwy6-0rM9jDuWIHHGaU3DKytMxNr6ffg>
    <xmx:NhojaGE61O-MuBSKge7-msIMcvX8HUrxHKtlu8ZwnyIQGsVq8578vQ>
    <xmx:NhojaKCv3MtzKHeL-ynlZJipqaiy4tO42lTVYJ00TK-PsDp_bg4oZlvx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 47B6A1C20068; Tue, 13 May 2025 06:08:54 -0400 (EDT)
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
Date: Tue, 13 May 2025 12:08:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "LEROY Christophe" <christophe.leroy2@cs-soprasteria.com>
Cc: "Nicholas Piggin" <npiggin@gmail.com>,
 "Paul Mackerras" <paulus@ozlabs.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Message-Id: <85ae2cb8-f594-46ac-87fd-2a53cdd7ef9e@app.fastmail.com>
In-Reply-To: <8bbd9fc6-8edf-46e4-952a-0a4da0a0660c@cs-soprasteria.com>
References: <aB6teOoVLWkdvyBu@bruin>
 <8bbd9fc6-8edf-46e4-952a-0a4da0a0660c@cs-soprasteria.com>
Subject: Re: Crash in __do_IRQ with gcc 15
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 12, 2025, at 20:13, LEROY Christophe wrote:
> Hi Arnd,
>
> Do you know when you will be able to add GCC 15 to 
> https://mirrors.edge.kernel.org/pub/tools/crosstool/ ?

I have to create a new build environment for gcc-15 after I lost
access to the machine I used for the earlier builds. I should
be able to do that within a few weeks, but unfortunately it's
a little more work than just rerunning my scripts (which I still
have).

    Arnd


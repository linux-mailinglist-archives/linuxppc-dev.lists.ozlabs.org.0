Return-Path: <linuxppc-dev+bounces-12148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A790B56149
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 15:53:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cPCS7391qz304h;
	Sat, 13 Sep 2025 23:53:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757771607;
	cv=none; b=KJvTg82eIeuEDDujpem5DLPvy3VqfJ0lSknQVWyirgML+bZXJwHniJmyBi/vqjDjOQif439XGTyr2j2ch3zKKnM47Bx3CWoj00JNC67FKo9d1K5d7x8LbTsTmvr4QKYLjY5bZIkvz3CzItCqqnjmurnJHot++reXYkAjobMjk4zBah2i0OnR7NUtjsW3Soi1xiP4PRiiHGllHrpZYs0Y3c2m01T+0gBQGHDT1bWxcSIcYgIODrSruMVD976t7EHGm/AXUTGS8wzLGoPUw5VTZ1q3rp/p1Bl+TuFiMwU4pOf8hK8nklqobtQQD/6UHkNobIDF/J16+QACxL1Cjnc+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757771607; c=relaxed/relaxed;
	bh=d5lllfBWpkvhbNBBFkWW6ZTCvRDM182jtFLya47zQwQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hKaCiL+KWfCUqaxZEPKqWZJ8Ez/a8aal7XC04RWETczOWpy9/B+o8I+UltIx8EJn1qu989p2JJFjkoSt5AxRiKUjj2UBgLKpCcqcggkL0XL5bC/XFDT6Aw3OXDuL8XsOKQ8Mcn6w+OXvymY/CewoQ3L5NXpJdZD3iFYq1xK6rf+MHF7B2znrxYr332hoYJ42hWXeR1uG/gT3A07s7ZYnBEpmQXzQam8GRBn7FhgskizcDorDdmqCEGPV7kL/vOEdjz2gy9lTB0RcD4t6/OFR05pno3zjNMtQB63AFNIOYsDUsv+l+Xu5snsBHADGPzesq+WThpM/Jmn6X4LQ8LOP0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=AkuxGq7A; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=loUPyhto; dkim-atps=neutral; spf=pass (client-ip=202.12.124.154; helo=fhigh-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=AkuxGq7A;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=loUPyhto;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.154; helo=fhigh-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cPCS36MQzz2xlR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 23:53:23 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3A6807A0096;
	Sat, 13 Sep 2025 09:53:19 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-05.internal (MEProxy); Sat, 13 Sep 2025 09:53:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757771599;
	 x=1757857999; bh=d5lllfBWpkvhbNBBFkWW6ZTCvRDM182jtFLya47zQwQ=; b=
	AkuxGq7AmrBftIoxxIej8BUeyCAcJG1Ymi9BYw7QKl5ttox4BOV65pbqJ9if+E1w
	NUCJlc66mqTN5ToFVlKzlQ+jqZwvUluixJDuocP8B7RsOmuQCIAx6ugTX/jdjxMs
	qcdigYpWpZ7CYM5WpAA/oX4qU0BEd57m7cGL+Ejp3uxnmFPSf30VvoTJXv+p/I4i
	BAia8xzyYO2kQKUg0Y/KloaRtK6yNQF1mrVk62hMsonvauj2v81sKv3GvXMO4J4K
	T73/GPZAyceH+HLAYUikLZJG8qJkKQ5qKRAXrGV99M7ZeQ5YuQ5GhgtcCBk3+t6t
	BsOxhsu93obeMGRjVA5gkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757771599; x=
	1757857999; bh=d5lllfBWpkvhbNBBFkWW6ZTCvRDM182jtFLya47zQwQ=; b=l
	oUPyhtomykpWaNzTOdArnwQLEKmzKcw+tg7OxeJ1cV0wZtzzbKa0+YCd8xzVW2/+
	wNeoNZCVBKHbuWLCVzrzjq39hpI+s2CvjhVfUg6Mx7EqgnmEbW2LGlb/ItnGHRGd
	b7yKNcwvvZysyeO5Q6fqVZ3+799e+uuHjqktyhvaJpB+gDi/yBDs/MdyrDJoZkgJ
	Mh6AEdM2GH5ecP3m7RFWZsocS97aBFNytu2IMxL2gn3uK4KiBh6YmBoeyQZ5KPK+
	trZY2d9ky23sUQpX0FmgVDUrLzOE1B4VSuaZYs8e89DqSjCrQbrqLT1ZGivk2sUC
	RN/UaQI1qhWFDJaJiNRMQ==
X-ME-Sender: <xms:TnfFaCrtr16oqbECbxj_4ca4M90MxSd3_ZcdfXuNTbkW1hRzb05eCw>
    <xme:TnfFaArTqbaQfx7GoOHJwMWVNNdXdC04gpmo8vT0cbbn-t1DHAqb1EtK_V727rP02
    YGoA8ZLRHxvZsAcCfw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefvddutdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeejpdhmohguvgepshhmthhpohhuthdp
    rhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupd
    hrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepohhf
    fhhitghirghlthgvtghhfhhlrghshhihthesghhmrghilhdrtghomhdprhgtphhtthhope
    grshhhsehhvgihqhhurghrkhdrtghomhdprhgtphhtthhopehlihhnuhigphhptgdquggv
    vheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrh
    hnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgifihhltghogies
    fihilhgtohigqdhtvggthhdrtghomh
X-ME-Proxy: <xmx:TnfFaMO5aQej02tLae0TqDFyjE0Fo2G3lNTEmNXdfq3VRmvHeW5jUA>
    <xmx:TnfFaP4HOhIFMqSmh3Bd8_agKhw57LbwAcivjXW6IJqexvVE3oLJhw>
    <xmx:TnfFaO649Pzb3ncpbNCaB0YaFXMGBlfcl6ox12PMceC85AeX2-vFJw>
    <xmx:TnfFaNEf_5mogRldKoP-IeY-z61E1RdEQcAo5WZr-V5hE-NTB547hg>
    <xmx:T3fFaLMeigsrZbMYxBbjKm405RmxLMYlK-2Nl69pCWSdRc5uqqPZEqNz>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4216CC40071; Sat, 13 Sep 2025 09:53:18 -0400 (EDT)
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
X-ThreadId: ADclxERWIs8s
Date: Sat, 13 Sep 2025 15:52:58 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ash Logan" <ash@heyquark.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 officialTechflashYT@gmail.com, "A. Wilcox" <AWilcox@wilcox-tech.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>
Message-Id: <432e049f-886d-4734-ad59-52569a796046@app.fastmail.com>
In-Reply-To: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
References: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
Subject: Re: 32-bit HIGHMEM and game console downstreams
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, Sep 13, 2025, at 12:53, Ash Logan wrote:

Hi Ash,

> All of these are flatmem devices, as that's all the 32-bit PowerPC arch 
> supports, with the Wii U additionally enabling highmem for its 2GB of 
> RAM. Both devices have a small memory area (MEM1) with the "bulk" of RAM 
> starting at 256MiB. The Wii U in particular sounds like a candidate 
> system for densemem - I would like to read up more about this if I can, 
> I was only able to find seemingly unrelated information about CXL when 
> searching online.

I would not expect densemem to make a difference, at least if we go
with 256MB chunks (the size has not been decided, and not much code
exists in the first place).

Like most other machines, this one is probably fine with a combination
of a custom LOWMEM_SIZE setting and using zram-highmem, even if we
end up removing support for highmem page cache.

The smaller devices are probable getting problematic sooner, 96MB
in the Wii is already really tight and this only gets worse over
time.

> I know I'm talking about hobbyist use - and mostly downstream use at 
> that - and I do suspect that in the event of a wider 32-bit deprecation 
> we'd be fine on the final LTS, whatever that ends up being. Still, I 
> think the Wii and Wii U represent a decent number of 32-bit users, so I 
> wanted to add to the conversation here.

Just to be clear: there is no general 32-bit deprecation going on. When
I talked about phasing out 32-bit platforms over time, that is purely
going to be those that have no users left, or the few ones that are
causing more work than they are worth. E.g. The ppc405 ones got
removed recently (after many years of discussion) because they were
making ppc440 maintenance harder and had no known users.

Highmem does get in the way, but unless more -mm folks make a strong
argument in favor of removing it all, it's more likely that we'll
go with Willy's suggestion of keeping highmem on page cache (anon
and file mappings) than just keeling zram, and even that would
still work.

     Arnd


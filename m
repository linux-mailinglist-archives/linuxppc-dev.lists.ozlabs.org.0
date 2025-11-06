Return-Path: <linuxppc-dev+bounces-13824-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5779EC39105
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 05:11:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d27zH6p8bz2yrq;
	Thu,  6 Nov 2025 15:11:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762402267;
	cv=none; b=IBtxE9wO7Jqx53i+j5nSVuNqFFiuWVXfFUlCmab+OvMLC2UEnrGFl4cEcxElNhvSsBID/Chin874/D1owIvK0KL3G2ugkZ+xM8QukH5OsuH5Ex8W0lgtggPuzAB4Z+ie+UdWU7b58FNsST6lT0pw2q+hA4uyKxuaDbRAyf6NGax6Xzmru+AFb6JuW/t+zdQm3qPpHANE12Vd3V8a9yLpSrzN+lbD5vroktnci0f52Ic1M3Sfa2kdlGn5cUAhirgveYDX3rFtzStfI9RIKLZmH68Z9HF6/GCNaTVLOEgZmf0TOfy0GadZfj2IlWZ9LR3Kt6JSUymnqRDeenGdRCzgrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762402267; c=relaxed/relaxed;
	bh=LtvDTjPP3JwYvEGnmbYFBlPCbslew90zymx8tUWNBRw=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=HuvIc4kO7QVvckVgFuIXN9ifDbnKE7m5Eo0HTxqRcHbphQIBqoH4CupvtUxO2SeyEPsqoVBLU1MqKo4URKtolXnvTJbXWiEDHsHhHAtPTcBOyez27/vwJOlcogTU4U4mdGBtfsDt3xZSUryNo3CmJBWkHtv3odqPWfGWD+Q3VwWWEyz/TN8iPIAFk/BDcedvrbkLBI11WBLciFIBy/tIo0hTuPBbOZqn0jnYP5AMkYvhJoAV2ZrkiNypJOdRKznvWM4F7tDXLYNynsnxSWO7cVzOVBgDzeYGBQlde3amzpkNYDIHc4QQPQqDHYFaiHz7g7W/lsoRN9fUHJUd9yAWkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kuviunJD; dkim-atps=neutral; spf=pass (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fhigh-b2-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kuviunJD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fhigh-b2-smtp.messagingengine.com (client-ip=202.12.124.153; helo=fhigh-b2-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fhigh-b2-smtp.messagingengine.com (fhigh-b2-smtp.messagingengine.com [202.12.124.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d27zB4Yrqz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 15:11:01 +1100 (AEDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 6D9EB7A0207;
	Wed,  5 Nov 2025 23:10:57 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Wed, 05 Nov 2025 23:10:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762402257; x=1762488657; bh=LtvDTjPP3JwYvEGnmbYFBlPCbslew90zymx
	8tUWNBRw=; b=kuviunJDLBHDtNDEuNo3DdJBAGE8fry6OdAruBHzhhQxvDftnUs
	JmgBgy45u59QNd8EtWv0t9//xWPCLoRYaHybd5bTZZDDqnt5LFFVTz/a36VboSIC
	cDkDsIh2d9MZbePek0NMAs7gSKwT7Qvz2lYhYgLdhR5naBWtMYszvpfEdCIGBJjs
	NcFeq6VHo7ilIaNwtaItHLxg0vjSyCMjbZrVszNNfZLQHOrePc1ZnHMp3mFGXeLY
	BHGhPg2S4rp7YN9HCMut11Hw/f6Kb+RGf/b8lo5gzA6O5Uy3wsP529i/8YzosiNl
	qeiUAUKEO+1G/9sjwpijetmUCCQKj8DBKiw==
X-ME-Sender: <xms:zx8MaXV-OSn5cc_7Fsa1FDjDreNO4ySGdDAYum6qCDqYYtkNjEvZjw>
    <xme:zx8MabZgJfz8rqEXyQeJMTZxe0V8Ec6XZrnK743QEMgAtf_ToWJnhR20FZbOXyH4D
    O_-lgvdM5zAFqc66cUX-fE7m__BoHLN2lCHKlLZCG9jZUi6Xsy0mw>
X-ME-Received: <xmr:zx8Maezq5rRvi0UbVHoh1DLPYbqTjuMzyNri2Mp0nkWprK5bLX2K9cvM4Q3kgOEW41PMekdYDTUBETLXvMQa6PVG37vYe_lmWak>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeehjeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeduuddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihse
    gtshhgrhhouhhprdgvuhdprhgtphhtthhopehushgvrhhmheejseihrghhohhordgtohhm
    pdhrtghpthhtoheplhhinhhugiesthhrvggslhhighdrohhrghdprhgtphhtthhopehmph
    gvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehnphhighhgihhnsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhesrhgrvhhnsghorhhgrdhorhhgpdhrtghpth
    htohepsggvnhhhsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhgpdhrtghpthhtohep
    lhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:zx8Mab1LoOmyNFde_jppzQ_-jWPc30J27E-avqBmXxfr1FKEXd4EyA>
    <xmx:zx8MafmjEnxJTghUfk5PQVn2LigmaITwZ3LVGaX2fc_qFk89nIlJUQ>
    <xmx:zx8Maa9YzNVgqOJbY-s0JEyTX_txeF3XPcaGagmfItsi5jEKwnv8MA>
    <xmx:zx8MaVIKnOwZ2W1TRJZwCgBPz34hsoqWuvyyLOuq5v458LC2aDtDuQ>
    <xmx:0R8MaZ2nEL4yTA_jBJbD5KaAbjjJ-YeE1QNlYE-gj69bjPw2I8EcZ4Ie>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 23:10:52 -0500 (EST)
Date: Thu, 6 Nov 2025 15:11:04 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Stan Johnson <userm57@yahoo.com>
cc: "Dr. David Alan Gilbert" <linux@treblig.org>, mpe@ellerman.id.au, 
    npiggin@gmail.com, sam@ravnborg.org, benh@kernel.crashing.org, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    rdunlap@infradead.org, Cedar Maxwell <cedarmaxwell@mac.com>
Subject: Re: [PATCH v4] powerpc: Use shared font data
In-Reply-To: <3cc3d311-35b0-42f1-b20f-ed59391bb8e0@csgroup.eu>
Message-ID: <ead4ef3f-9f8c-a98e-b48d-f052bc9492d0@linux-m68k.org>
References: <20230825142754.1487900-1-linux@treblig.org> <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com> <aQeQYNANzlTqJZdR@gallifrey> <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org> <aQgJ95Y3pA-8GdbP@gallifrey>
 <3cc3d311-35b0-42f1-b20f-ed59391bb8e0@csgroup.eu>
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
Content-Type: text/plain; charset=us-ascii
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Wed, 5 Nov 2025, Christophe Leroy wrote:

> 1/ Either build font_sun8x16.o with -fPIC
> ...
> 
> 2/ Or add a PTRRELOC:
> ...

Thanks for your help with this, Christophe.

I fixed up the whitespace problems and forwarded those patches to Stan, 
along with instructions for applying them. He tells me that patch 2 fixed 
the hang. Patch 1 did not.


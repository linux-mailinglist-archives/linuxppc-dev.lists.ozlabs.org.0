Return-Path: <linuxppc-dev+bounces-13876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4561C3AB23
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 12:51:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2LB14KZkz3069;
	Thu,  6 Nov 2025 22:51:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762429865;
	cv=none; b=AXACJdiDEycRpqb2Y2mzeLN4qTOsXY/F1fYrGvFbRIS89rOra0+r45Vwb41ff4PiyaMcZA27ewHzCDYoiR+atypPiD7ROqZklBTLklqiCy3FyMO69/lAUkigg/Q/Slc2qEgD1fs0EcVw4HqEpzVqVa4OGOSvtZ2GQQwWy5/ve8lo1URSqS26gMGoYVubeBGflHageft8BkAwmuQpf2UtIdtrJMohLKa0ICWQVVAbQJAZS+0MJfsNrn70ST52gLf7jmkVz8P6oQLlpkVkKwOQ9tEBx/wWOc/K59yYO5vLJFwDllMJ8P/4TzmxnEjeiGmJWimBUeGSA5UvYIUt2oPqDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762429865; c=relaxed/relaxed;
	bh=hhpk6fTlqp/j4PTFIYbnE1NZ1PyPGfcYM9fGDcyzk+0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=JIDkZtztY830e0SXTJlm+lls9tP34Tz57vZgTRf5VFZxxppCWPppQ2R4b6fqs1+6VZfCeMbPdvpsPj/ZpNM8GwWkTyUzoY3aZE9maRHfSGIZEnT8/eGVrPHaQTSjRp4uZeyDIi221n5vBUxCc7kY6oX/U2bOBgYqiW2vnPrv+cykGnJH+OHIjfKMkiAXS7E81HYiOcTJO/9ticVxfltwuZ2Sak1vUac73vGv/mb2FGEMIl6gGGpykaaKz3X1+ZAj4yUIyreoLfB1aWd3dDiHKt8kx58v3lfYoH7xtHnxHE+6fEohkRcrBUrcAFMz5NRcWjnUgMTk1PrGxoF4SbeFLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=G1Ajto9R; dkim-atps=neutral; spf=pass (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fhigh-a3-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=G1Ajto9R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fhigh-a3-smtp.messagingengine.com (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2L9y13f5z2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 22:51:00 +1100 (AEDT)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 290F214001D6;
	Thu,  6 Nov 2025 06:50:57 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 06 Nov 2025 06:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762429857; x=1762516257; bh=hhpk6fTlqp/j4PTFIYbnE1NZ1PyPGfcYM9f
	GDcyzk+0=; b=G1Ajto9RwBMqq/SUC0v5M94XTt0Avvr01b38aA+oTKroecQZU+2
	2Bq3HBlQl0WocCr9e2PQht2XIxPJ7PYKeBrhdJBYOw9By3mIG/wgYEWimqNGjt+I
	BEe0H6o0iyY33HD+0i0gNuFkBSLFHi4Xt7X/q/notCEPWyQ2DldLhTL890lch2qm
	3A/MTraUzYF6yPTOPpcDnN9LIN8/NL4eRoP5dSxj6tbmRwJTxWksLVM6RFPrVLkZ
	yHxDPZ15UnDRpEdds2e71+NMM90TfkhMbCK7YU7rNeAxMvT3AVQ71XJHcgeFlDuL
	Z5xCp35TAXqGryXJR/LGeXHC6gVRMgo22KQ==
X-ME-Sender: <xms:nosMabhEHUf6c3cJ-3fHyG6uAMNkZRVf-kLwPMBG1B04edU4h6TThg>
    <xme:nosMaegxQeL6DiEPkNTX8LVKGomFHk-jGSf5rBVdYhW1DkmbzXw7KoY5GyfBRDRtr
    lMqam3gMVvOK0YTPzde7Mz4U7XONX55wlmNt1My0fHJZ9wyPwnXn-k>
X-ME-Received: <xmr:nosMaZG6YrPzPdnUC3d55Dsy4x-UONLE8uHoat7CIDloousscl37a6NLDbbSsiGuYN4Jxoaq5ggg72Ydjn7zZHwDP4R8ltH9EU4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeeijedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehmtderredttdejnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelfeeklefggfetkedukeevfffgvdeuheetffekledtfeejteelieejteehgeel
    ieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeduvddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihse
    gtshhgrhhouhhprdgvuhdprhgtphhtthhopehushgvrhhmheejseihrghhohhordgtohhm
    pdhrtghpthhtoheplhhinhhugiesthhrvggslhhighdrohhrghdprhgtphhtthhopehmph
    gvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehnphhighhgihhnsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhesrhgrvhhnsghorhhgrdhorhhgpdhrtghpth
    htohepsggvnhhhsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhgpdhrtghpthhtohep
    lhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:nosMabAB_t1bGxV6bAdxgJoOu0LW9zq53SYSFQ85o1YR6z4NQsL-Bg>
    <xmx:nosMafC62GKoaSwwqCagyjnw9AGjwdDHdXeMNKgE_F36sf-MpBGqPg>
    <xmx:nosMaZMrQeFXP0hvzam01KuUy6esyWIiGhy2yUhhEvlVOKC63d4H6w>
    <xmx:nosMaTPt4OJ7QQ3yobIYFvpbIOPzxaVaUMf4WTmzQ7U3JOR2B-ndOA>
    <xmx:oYsMaUiEX6bcvaWKiRi9b79AUyiP0wavSNvldCxbrtqhA8MF4Pz5iYwQ>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Nov 2025 06:50:51 -0500 (EST)
Date: Thu, 6 Nov 2025 22:50:27 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
cc: Stan Johnson <userm57@yahoo.com>, 
    "Dr. David Alan Gilbert" <linux@treblig.org>, mpe@ellerman.id.au, 
    npiggin@gmail.com, sam@ravnborg.org, benh@kernel.crashing.org, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    rdunlap@infradead.org, Cedar Maxwell <cedarmaxwell@mac.com>, 
    "maddy@linux.ibm.com" <maddy@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc: Use shared font data
In-Reply-To: <994bea8c-7b28-4aae-a6b3-e4f33731cb29@csgroup.eu>
Message-ID: <b4737133-a33c-f4d1-cc4b-0c0b70c45635@linux-m68k.org>
References: <20230825142754.1487900-1-linux@treblig.org> <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com> <aQeQYNANzlTqJZdR@gallifrey> <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org> <aQgJ95Y3pA-8GdbP@gallifrey> <3cc3d311-35b0-42f1-b20f-ed59391bb8e0@csgroup.eu>
 <ead4ef3f-9f8c-a98e-b48d-f052bc9492d0@linux-m68k.org> <994bea8c-7b28-4aae-a6b3-e4f33731cb29@csgroup.eu>
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
Content-Type: multipart/mixed; boundary=-146381177450487057176242982735
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

---146381177450487057176242982735
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE


On Thu, 6 Nov 2025, Christophe Leroy wrote:

> Le 06/11/2025 =C3=A0 05:11, Finn Thain a =C3=A9crit=C2=A0:
> >=20
> > On Wed, 5 Nov 2025, Christophe Leroy wrote:
> >=20
> >> 1/ Either build font_sun8x16.o with -fPIC
> >> ...
> >>
> >> 2/ Or add a PTRRELOC:
> >> ...
> >=20
> > Thanks for your help with this, Christophe.
> >=20
> > I fixed up the whitespace problems and forwarded those patches to Stan,
> > along with instructions for applying them. He tells me that patch 2 fix=
ed
> > the hang. Patch 1 did not.
>=20
> Fine. Then let's use PTRRELOC.
>=20
> Will you or David submit the patch ?
>=20

OK, I'll submit the patch.
---146381177450487057176242982735--


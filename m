Return-Path: <linuxppc-dev+bounces-13680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B32ACC29CB5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 02:41:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0Dnf5K5sz30RN;
	Mon,  3 Nov 2025 12:41:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762134070;
	cv=none; b=m6Vxf6DFlu/5wapIf/4ylAnUOpSG15JdBOKqo1xLlPB8Pb7P5Q5U430zMS2WwSULgdTJlCIt6oZWKTG79x85o+x22huvYDIHbi69gssDKfHsqTEIimFEqhn0whbMmUH/tL01QXSddxEOQb8bf/geWR39bv7k1RF70Gzal+cEF/9N/YePib9mg/QPE+dKze+VriihLNnyTgrtEXoygu5QPRE7nNmOauK9T+3QS+SK5/SuKmwoOUXGDLxZj0hZKt+usxC7socYWxtOTrjr+SVEJ2cDRml79JOzPcAsYFnkGYy9LJ0QTtbakAZeenYICTAE6eJD8FTzuwPNyS2BXmI7dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762134070; c=relaxed/relaxed;
	bh=3VygVh8ojnHZK6FC71RvbSxh7Er0TIana3lDR4kRD/E=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=cJa7GwnRYsyrxF1yr/GLTVOvNAXheAJZwwrjkpa5T3Xc2pncvnssgo7rxnvCgZ9wZBbMfovfAProb6CMmjmGkJIimgslf5E4T38yw/BiJXwgGoJraCfgMUEQUzwApfvyIfD/q1fcv+XHyGdUNbal2sWST3nb9M6c5FQySGmo+q13FXMG9Qb5gL+9HtgSI1fqkcWzYUlhHWVrYYQybscB1A088lOK2Fx0I/oCBASS5cqllSsU2rycyME0dgaABgzPYIskNHjshiGPFcnduD/McjgbItwl9NGksmtiJrpaqoP8NuLMMG5FMjwA9Tr/tBRqJKEhOXVdMlDE26h4vOY6NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DHkSK+8N; dkim-atps=neutral; spf=pass (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fout-a6-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DHkSK+8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fout-a6-smtp.messagingengine.com (client-ip=103.168.172.149; helo=fout-a6-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 470 seconds by postgrey-1.37 at boromir; Mon, 03 Nov 2025 12:41:08 AEDT
Received: from fout-a6-smtp.messagingengine.com (fout-a6-smtp.messagingengine.com [103.168.172.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0Dnc38VXz306d
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 12:41:08 +1100 (AEDT)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfout.phl.internal (Postfix) with ESMTP id C029AEC0188;
	Sun,  2 Nov 2025 20:33:13 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Sun, 02 Nov 2025 20:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762133593; x=1762219993; bh=3VygVh8ojnHZK6FC71RvbSxh7Er0TIana3l
	DR4kRD/E=; b=DHkSK+8N1Ccmb1vOpA9xnwBD2uvM67fxDbua4lqY7tr5MMqC8tn
	D7VIjFLZ7M1N+3cMHqaFYaJznO3kaBoEZXbZj/ofFQ/B2NI0fSJr1tyUczBHtoQ9
	/gkVN7O8Gf7QSCwdzczVNV7ng9McQdeV+mkn13avLKFmfSnLVErE+4C4EvL08x+L
	SewHUYn+juid2nxlZJT9RfpO/t+E5IghW5WOU+g3W0N/SdO9Ov9tx3qroJZL9j36
	qNR+J+xYmbbxKcWIGeKwcPDTGB0DcKatEFT6iB5kL7BMLuf6VyL2xH9pg+TSWg3N
	hfu9PkujdLWLL1bk5VvYa6OvMRkp4OgYJdw==
X-ME-Sender: <xms:VwYIaUD42uoBLLy3ZodfzjcH3tolU_GIRZSpv84Mx9VwgEH6njHKFg>
    <xme:VwYIaSWedtKwTBcsmsAV8FQQFGsy83O6TQ83O1xa6iFjfrn3oOwYQceOO2lULoOp4
    EVMJZvP4AknMElxzPYt_TxY3B3ebjx9kkB6E94mzU1s94ZjiTit3b8>
X-ME-Received: <xmr:VwYIaS_NA9d5Qj8hMggJvosAsk_snx2ATkQb2EW0JIWyK4Jq45SMEPikkydlqSXO73PIzu1aQxa9oIQTO037o0MluHEnNYV6ndE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeeikedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeduuddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesthhrvggslhhighdrohhrgh
    dprhgtphhtthhopehushgvrhhmheejseihrghhohhordgtohhmpdhrtghpthhtohepmhhp
    vgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepnhhpihhgghhinhesghhmrg
    hilhdrtghomhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhr
    ohhuphdrvghupdhrtghpthhtohepshgrmhesrhgrvhhnsghorhhgrdhorhhgpdhrtghpth
    htohepsggvnhhhsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhgpdhrtghpthhtohep
    lhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:VwYIaUTU-BK8uSSVx3SZODS2Ahtsx-YeSDowDEVUpsPCJTxS7d6AeQ>
    <xmx:VwYIaXQP4o8ikIxT9SvV9pi2FH0Cg47DxBUC5DT3UdjIVezfBEG_WQ>
    <xmx:VwYIaQ6eEV-h7m5Zk1y3SdhLVIQinwn7PXxOTZa1eDlXZQS761KIFQ>
    <xmx:VwYIacXtAfEMH2ORcsi_GkuT3F-oxRK7I6v1DDh5HFclSWso5l12oQ>
    <xmx:WQYIaZybGOq_gvBumGA8zbKaoCkhD1OMeVgVO7aflcI9T0hm_UZ5BfH2>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Nov 2025 20:33:09 -0500 (EST)
Date: Mon, 3 Nov 2025 12:33:22 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
cc: Stan Johnson <userm57@yahoo.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
    christophe.leroy@csgroup.eu, sam@ravnborg.org, benh@kernel.crashing.org, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    rdunlap@infradead.org, Cedar Maxwell <cedarmaxwell@mac.com>
Subject: Re: [PATCH v4] powerpc: Use shared font data
In-Reply-To: <aQeQYNANzlTqJZdR@gallifrey>
Message-ID: <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org>
References: <20230825142754.1487900-1-linux@treblig.org> <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com> <aQeQYNANzlTqJZdR@gallifrey>
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


On Sun, 2 Nov 2025, Dr. David Alan Gilbert wrote:

> 
> So I'm not a PPC person specifically; so lets see if the PPC people have 
> any suggestions, but:
> 
>    a) Do you know if there's any way to recreate the same hang/works 
> combination in qemu; I know it has a g3beige model but I don't know how 
> to get something similar to your failing combo.
> 

I guess we could probably reproduce this in QEMU if the BootX bootloader 
could be made to work there. In theory, 'qemu-system-ppc -M g3beige' might 
work.

>    b) Can you get any diagnostics out of the prom on the mac?  Like a PC 
> or anything to have some idea where it hung?
> 

Well, that's the problem: if you enable the CONFIG_BOOTX_TEXT diagnostics, 
the system hangs instead of printing stuff. If you disable the 
CONFIG_BOOTX_TEXT diagnostics (in favour of serial diagnostics) the hang 
goes away.

Anyway, I imagine that the problem with your patch was that it relies on 
font data from a different (read only) section, which is unavailable for 
some reason (MMU not fully configured yet?)

So I've asked Stan to test a patch that simply removes the relevant 
'const' keywords. It's not a solution, but might narrow-down the search.

>    c) Is this only the Powerbooks that are unhappy - are other Macs OK 
> with this - if so, wth is the difference with a powerbook?  Is it a 
> different debian config or something?
> 

The BootX bootloader doesn't work on New World systems, which is probably 
why we don't see this regression on anything newer than a Wallstreet. 

It's likely that other Old World systems are also affected, if they are 
using BootX. We don't yet know whether the regression also affects Old 
World systems using the iQUIK bootloader instead of BootX.


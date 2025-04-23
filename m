Return-Path: <linuxppc-dev+bounces-7941-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6260FA999CC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Apr 2025 22:56:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZjWcF5TRMz2yDH;
	Thu, 24 Apr 2025 06:56:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745441789;
	cv=none; b=OaryQUYmFgGnSN/96mP+0t9Do1uTEolh1276tDy1WKw8go3fMIKE9vbFyg7QKikwJREJgcHKuxLPSvQ8CpwpTuZuT6Gmw+toHkWoMrSLhrn0Vq9P4bMVM8Xr+V/27C1YN68hESspnDlooDvQ1SSNf5XSR5R8j+oh49DgxApgbfHLJU38l+fSV/f4YPL4XjGKRg/UMb4vb9Y7Y4vnvtebVo78gJYYRcU/yOmTigKnZj555Y4xDRI8bGmy+aCZyA/Fgdu1+nnm0vH6CVfJwdIOCRE0vhVU+6iGftXZuBu4AK3bum269DnCyNdgbGXWO7soWD3V9vU3jJ5Xh/5R03dQIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745441789; c=relaxed/relaxed;
	bh=Bb0LHun5eme3JvaCWcXczY1F5v3r5KRrL1ZFam4vbcY=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=PByCrL3Um9gcjuJO80lwYAvLox37k/wQfM9eqvZ7TU39TjH/1VmIs69skG4BGFJjMibps5xT7YidpMx/MYcvvN9Nxzhy52xLyw5+Qo+st1ypaHAeyBG1WGnr/PzXCss3JQqK+p6nGEODJAN/V+CBw3fBsykRJeWBnSv90M1vEkFDFmdWI8ovqpJMP8W4pUIneqlkdxT2AEM/YGAnSUwXGxSweraqI1uRnKVwmzV8tWKt/49PmfgdXCv4Ozr2+zj1q/Rhq3x88s7srLiCknn4gOX99n1JpNiRKt3uYWTbJ7uuWyqIsilb93/eAe5FYndfNa3wYNIq28x4DBKFefOrhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=sFEG/VRM; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I5xgqome; dkim-atps=neutral; spf=pass (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=sFEG/VRM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=I5xgqome;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.154; helo=fhigh-a3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZjWcB3Fykz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Apr 2025 06:56:25 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id CD7EF11401A4;
	Wed, 23 Apr 2025 16:56:22 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-05.internal (MEProxy); Wed, 23 Apr 2025 16:56:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1745441782;
	 x=1745528182; bh=Bb0LHun5eme3JvaCWcXczY1F5v3r5KRrL1ZFam4vbcY=; b=
	sFEG/VRMqOkVkVZASq1+o9nxMN+MNE6oGHnEVxRuHf7ODQUfFljNu3sXdG9NWV+K
	6knGlnjQqi35GJzpRJjLsVypmHK5uVHpxfiFbLM85Gy5MoLo5U93Pgono0+K8cB3
	pbsI3ypwLmBfW/JCzWtzGyDzdBBGsE1qloExacsd9eDTeT47hwqzKGAOcjUIf5/T
	nnniRWn3FsTx8aV0k7aJitK4n+ehsV4DtjqshR8xP/ORMPaG3vEMHsF+H5YAoVKl
	wv52MlQcpEDMt2WhuCHKBBWxdPpOAPkBf3rlauUBmmEbYvfxRXJOpDBJjDhsvRvI
	1ComTwB3ZGwaovCcneBhPw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1745441782; x=
	1745528182; bh=Bb0LHun5eme3JvaCWcXczY1F5v3r5KRrL1ZFam4vbcY=; b=I
	5xgqomehtEMxc600NdY6MPcAgP3SxbaHXrvXjwrfv6O1A00BVbzYQ8W9T/Z885ex
	f3pPssXN9ZqRjfvQDAlFD1rauZLCKtIACR4V+VJa2ygebreemR9ClKa9mOp7OwKZ
	OqxS/ltThjzCRHMrzLy/MrMTGAAq3elEYuY73lrEoeCFY7ODkquZRm3YzqO34iws
	QaPZq6jKmkc6R4F3R0kHq/D9+gKTyWXfvipnh9TQ4QZVZCM+cvWsi+XyesrkpTYz
	sj+PD8Trg53EGEaKggjCEgmJVmbmTw+16+xUFc+hfdO+PKLWQu7XwaQhg4UqOJB0
	NOISyi1fYvHqLjPazk2PA==
X-ME-Sender: <xms:9lMJaD87CsCAjkk85XHwNZZlnlaa0-YPpWtpfTxDhBCGUrCZOdzeig>
    <xme:9lMJaPvvn33kNKB-4LUvadejICTL7_YWJzdqs7a99SH70DlTIRIGXHXSvYIOcpWr7
    XCVR2gKR1h4ET92jlM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeejieduucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    iedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhosghinhdrmhhurhhphhihse
    grrhhmrdgtohhmpdhrtghpthhtohepsggtohhllhhinhhssehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvkhhouhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpdhrtghpthhtohepughm
    rggvnhhgihhnvgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuh
    igqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9lMJaBAIeQtMtD3XTZ193C-81qbbbSlloEDu2bOA_vrQpw-RXvTK3Q>
    <xmx:9lMJaPc6ajNqqpwwivumIo73CuutN-Q2KKfH5o8OQYspS9ywyF3rRQ>
    <xmx:9lMJaIPJLB-bdI381BfdIcKavMVygvcXLGNwc27NZDSfh6z_9TJEgg>
    <xmx:9lMJaBkbyGIBEPm8Q71gmEhMqA4qi98uwRDOI9T9i6yJX7MwxrJkNw>
    <xmx:9lMJaIrwPM1H0E8MfFk6WLps2TACto1q3m9t3TXnLloUvDMBHq9Udm9A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 4076A2220073; Wed, 23 Apr 2025 16:56:22 -0400 (EDT)
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
X-ThreadId: T8f64d9338f7a15a8
Date: Wed, 23 Apr 2025 22:56:01 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Ben Collins" <bcollins@kernel.org>
Cc: dmaengine@vger.kernel.org, "Vinod Koul" <vkoul@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 "Robin Murphy" <robin.murphy@arm.com>
Message-Id: <7d914aa8-dc6f-426c-b7fc-dbb03c6b676c@app.fastmail.com>
In-Reply-To: <2025042316-nippy-lemur-debd6b@boujee-and-buff>
References: <2025042122-bizarre-ibex-b7ed42@boujee-and-buff>
 <fb0b5293-1cf3-4fcc-be9c-b5fe83f32325@app.fastmail.com>
 <2025042202-uncovered-mongrel-aee116@boujee-and-buff>
 <ace8c85d-6dec-499f-8a8a-35d4672c181d@app.fastmail.com>
 <2025042204-apricot-tarsier-b7f5a1@boujee-and-buff>
 <29bdb7e0-6db9-445e-986f-b29af8369c69@app.fastmail.com>
 <2025042216-hungry-hound-77ecae@boujee-and-buff>
 <06765168-a36a-4229-b03b-6ea91157237a@app.fastmail.com>
 <2025042316-nippy-lemur-debd6b@boujee-and-buff>
Subject: Re: [PATCH] fsldma: Support 40 bit DMA addresses where capable
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 23, 2025, at 22:41, Ben Collins wrote:
> On Wed, Apr 23, 2025 at 03:49:16PM -0500, Arnd Bergmann wrote:
>> Looking at the current code I don't see that any more, so it's
>> possible that now any DMA is allowed even if there is no
>> dma-ranges property at all.
>
> It's still there. It hardcodes zone_dma_limit to 31-bits:
>
> arch/powerpc/mm/mem.c: paging_init()
>
> I'm digging into this more. I'll check back when I have a better
> understanding.

zone_dma_limit is the other side of this: you need a ZONE_DMA
and/or ZONE_DMA32 memory zone that lets a driver allocate buffers
from low addresses if the DMA mask is smaller than the available
memory.

      Arnd


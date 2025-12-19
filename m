Return-Path: <linuxppc-dev+bounces-14914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB63ECD1C32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 21:35:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXznS2Swdz2xqj;
	Sat, 20 Dec 2025 07:35:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.149
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766176540;
	cv=none; b=lG3jv6Nr1sZWhWDlFg/ULKzcxEJ7uhBcZdiwQ/mkPfsp8yCOkVoWkCaB1WCUVqTa4seAViwNaYAbbPYt4PniZPOMbfVDAhvGEA3JNoK4siWZ8kh5tDVOpAcCw9RCX40BO43WeojAJIdDwBw0x/mfmhxBsZwDK9Gp96UoF3kVSy8Lss3UU4oKEyaJY2+8ctv0ox2Wi1KjS5cLbvZ8JXFnRufwJJi9MhvCCCwcH5mQGRRrdvlmJD6GrOxCNOAYYWwrjqfPXzMFBRzK1oFsxYJKUrT2fE1d9W59FjewIcgsnhu3PDJWgIL2+gdnBrDsT3I/vWQsC1MZV67eVF7hbq5Wlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766176540; c=relaxed/relaxed;
	bh=3d9fLzjQ/AZqtv2ZVueKEFb1bGfJIO9edpVZ3H1jqFw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ZpQvoz+uSuIThx9C0coFKRQqj6k/OnmWdtucvVNlaUt4leXK15UZyEfxr+ee7+CvyQeRC4Sfs8A8fe6wmr3D0sonn1He3Nj7X5OUCaXOW4XfII4ynogOKX7bEIsn8HdZnSn7wrrNx6elZQQehkyjs9anw9yKqVtqaCfbs/XLxyRu5CQbt8PPuKs8oClJWMEJ68cgrlruhpEfZjI4W85QgtwNkJ0snb5eVCIxLI6PXCiTnwJu4BwZ5MvFMT6Um3oo6jO1Wa23sP9t0j56z3zSUmXVKeABacIeFLdspG7EIn0WREh8Dr/V0/klsuB2ixToc1CjZKQ7I/Z1Rkpt7NXNVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=kYZHsUm3; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Rg/gGMV6; dkim-atps=neutral; spf=pass (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=kYZHsUm3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Rg/gGMV6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.149; helo=fout-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b6-smtp.messagingengine.com (fout-b6-smtp.messagingengine.com [202.12.124.149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXznR1yFpz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 07:35:38 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 29D571D000A9;
	Fri, 19 Dec 2025 15:35:36 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 19 Dec 2025 15:35:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766176536;
	 x=1766262936; bh=3d9fLzjQ/AZqtv2ZVueKEFb1bGfJIO9edpVZ3H1jqFw=; b=
	kYZHsUm3yqBHaQvpro/+WVGIWBVYSVMFfzAK54GcyEOPEhFKvEFuAPrGR+cJTmUh
	WuqFNjPxZvQkkBDtAeuRT4Y6eEryMc/WKH8n1pZWJH0y0k42xCztHwa4qzaYSulv
	c8fjOxu/1OEcujcVhSJRl1VueSwH7a0Ugi7lgTQ5pJVnjDFeQ+QadG4vzWSUDkJf
	Gl2ii6dZ4T7T5QD5RZhU72HA+grnsmxMyM4UoZW8OJbUnvEkKRNTYf6Dyx7OFD1c
	z/BtnKw4w6z4ekb5gkp4VO5JU4ctwu672Z8pByzhuSQ+RGzGy4TN2hQsMMQkhZp4
	yDjEpWPhj/OnA/BzylISAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766176536; x=
	1766262936; bh=3d9fLzjQ/AZqtv2ZVueKEFb1bGfJIO9edpVZ3H1jqFw=; b=R
	g/gGMV6hGJSilE/ezNtky0vmAjZSzpFmvQe4yQSfpUOWkGu4+khqfe+CKsUsbbH/
	NWhG+aLxCk7W9xlqRRomISPzMad0RNuBJ4JzW8+tV77CvLOrZwYZpBfBxOSSIz9v
	cJinNF6Ej5OguuUgo8Ffg2liakO4Iuak9WNah7aNB2NdDJH+Agy4cPQGpoTO0R1I
	E50NjYk69gfh6dHUbDP691rKb0j1Kwmm+hQck5oLYemr4vJt5HIyG0JkVIr8FnPc
	MEIR7CnWx/AMfasIuVZN8J6smZ16rnvAZK0DfZAWUSQvK/TV++Mw9B67WJ7GlM/n
	iHzqzayWG1vya99RM3gvg==
X-ME-Sender: <xms:F7dFaetfjsH_R0FrwIjtYohr1MfQyeE2o_Kf225FkyDcAyfvlGgXag>
    <xme:F7dFaeTM_mVgkLqy_zis7ZjunWXe23L2cRxu6fojMT-CUeK-upeQDeRRCMxTOLG3t
    PM_he3EDc61UZJY2PHV6HnMgC-TNEEwy52aM303P8LlBxIBV9FxxI4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegledvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeduhedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtth
    hopegrnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtghpthhtohepfihilhhlhies
    ihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheptghhlhgvrhhohieskhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    giekieeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtg
    hkrdhorhhgpdhrtghpthhtoheplhhinhhushdrfigrlhhlvghijheslhhinhgrrhhordho
    rhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
X-ME-Proxy: <xmx:F7dFabR9fuVGLS8b2nH0EJEL7gMeVQyE2RmW6pjAmP-j5ztg66sWYA>
    <xmx:F7dFaSWdbgkitKG_ozO6MG4TRqQ12N7HBRnMw8O3mjcTSiNw9HFycw>
    <xmx:F7dFaaautW2GXmPM0khIdUKFWjjMT3nNkDSx5fj18akTdZS3YoKf0g>
    <xmx:F7dFab6-0sXi3QVEQ4kxkCC7Ickcc4xkhCmDssD-fi6cLmyMFZeyFA>
    <xmx:GLdFaZ8lTCnaSOSLz8dsTEi9P5rYOub2PGkiNAXcyFkNFyLQKKniTZRF>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3E0EFC40054; Fri, 19 Dec 2025 15:35:35 -0500 (EST)
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
X-ThreadId: AQxZfb8dcq5J
Date: Fri, 19 Dec 2025 21:34:33 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jason Gunthorpe" <jgg@nvidia.com>, "Arnd Bergmann" <arnd@kernel.org>
Cc: linux-mm@kvack.org, "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, x86@kernel.org
Message-Id: <513078d3-976a-4e6d-b311-dcfcfea99238@app.fastmail.com>
In-Reply-To: <20251219171412.GG254720@nvidia.com>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-4-arnd@kernel.org>
 <20251219171412.GG254720@nvidia.com>
Subject: Re: [PATCH 3/4] ARM: remove support for highmem on VIVT
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Dec 19, 2025, at 18:14, Jason Gunthorpe wrote:
> On Fri, Dec 19, 2025 at 05:15:58PM +0100, Arnd Bergmann wrote:
>>  arch/arm/Kconfig                    |  1 +
>>  arch/arm/configs/gemini_defconfig   |  1 -
>>  arch/arm/configs/multi_v5_defconfig |  1 -
>>  arch/arm/configs/mvebu_v5_defconfig |  1 -
>>  arch/arm/include/asm/highmem.h      | 56 ++---------------------------
>>  arch/arm/mm/cache-feroceon-l2.c     | 31 ++--------------
>>  arch/arm/mm/cache-xsc3l2.c          | 47 +++---------------------
>>  arch/arm/mm/dma-mapping.c           | 12 ++-----
>>  arch/arm/mm/flush.c                 | 19 +++-------
>>  9 files changed, 16 insertions(+), 153 deletions(-)
>
> This looks great, but do you think there should be a boot time crash
> if a VIVT and HIGHMEM are enabled, just incase?

Do you mean in the common code or just for Arm?

We could use the Arm specific cache_is_vivt() macro, but it feels like
the 'dpends on !CPU_CACHE_VIVT' Kconfig check I added is both
safer and simpler.

In common code I don't see a way to detect vivt caches. There is
cpu_dcache_is_aliasing(), but that also seems to cover ARM11
processors with aliasing VIPT caches, which are otherwise fine
here.

     Arnd


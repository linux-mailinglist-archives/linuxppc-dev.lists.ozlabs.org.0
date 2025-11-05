Return-Path: <linuxppc-dev+bounces-13822-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9746DC386CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 00:56:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d22K70vyvz2yG0;
	Thu,  6 Nov 2025 10:56:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.151
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762386971;
	cv=none; b=k1VDP5rZMBux5bIYj/3kwTE5rFslWSARca7MUbsaevaRD2IeKkB7bdKnXmrNJxkYD4tq/FeCVRbbpEowNGyQP2v2OvdyskyEL77cRarfsTeGuDu7SR87GFnEX90j0XGqxR4BxOu17NJsWVIIxhhoIVNuwPkBMtz8IxVwRLeH9I+2epg4OxXj3DGXq/KjCo/hehbuYj+Kd2GemorRAG3jkjWZNGF2AhyP00szMR8yBLtBspn5Y9a/6E8U1pfYsXhZBXl43hkdhWVsdEiQgOIcmo5iB7wHN6bSDBC0Ft6J7nAnLSvXWN8UnDWSVbbS5SysllP4uIY4lOLvuVXL9F1lsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762386971; c=relaxed/relaxed;
	bh=iL1AwDM7kx6YHcSejLAreDgPqBEkWAdgZYGeamSbBxQ=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=IDXKBBHQgvI1g/J7eeyNI3/hZ+MR2lz7GFtvKj6gdM8z16EBJO/BFxT8exPKEEjIbCSMWFGvMe3VV2maJ4skvVoKgalLIuYwwCsmXbs5DKKYC5KPafnWOhork9LoWpqnKS8jlNtrmsh1wwJxLXCXLlfBxi8OydH3o5/JL2a4b7OC+2hjLlPijYTWpR4oyfCN/WLlQtZlocM9tVigauEhAPkQwjTEaNVbabWKqa28KFbmHB+3mwy7PPtzHz/BlGGoq3HrwL2PhRuJUv74ffwiNrn8qjtaXT5pvG0j5WhtT5OrgU922io0b0OBjUtsLZ3iszgGa+CClHBvl9f0vn79zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BqsbypnA; dkim-atps=neutral; spf=pass (client-ip=202.12.124.151; helo=fout-b8-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fout-b8-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=BqsbypnA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fout-b8-smtp.messagingengine.com (client-ip=202.12.124.151; helo=fout-b8-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 462 seconds by postgrey-1.37 at boromir; Thu, 06 Nov 2025 10:56:07 AEDT
Received: from fout-b8-smtp.messagingengine.com (fout-b8-smtp.messagingengine.com [202.12.124.151])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d22K36MHlz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 10:56:07 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 28DB41D001A0;
	Wed,  5 Nov 2025 18:48:20 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Wed, 05 Nov 2025 18:48:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762386500; x=1762472900; bh=iL1AwDM7kx6YHcSejLAreDgPqBEkWAdgZYG
	eamSbBxQ=; b=BqsbypnAjKiIAbMMn/CdDYr/lUyu81RJ3J6tvYW0CfUD7UFK8wi
	WFfHyjl7ndYYJ0yJfWKvFzw9T7i22Y2Ps7pOZyL7eQZm1GXLOGWLde6fqDMMAFO2
	9jq+PUC0dr5G8ghwevqkLK8Aa4OuOXMAeLu6vR0U7wmlw71/WJAsNQeBi0YtjeH/
	gfyXe+jWrqjMk+YgNS7h/kUNpjB4S65oFtunTGXXqw/rTdgn8DhWXyubXUlCmd06
	dAqmrydecHr2hfJcV+TlkoVtDoTqQHVUdVqm4Yi76OrN3CBt0jLto+nw0CF9xo4x
	KbsTg9JUvsL3A1VeQLg7zzVOqk0/DIQWbaA==
X-ME-Sender: <xms:QOILaXHDnKUFbN5gRMkkY1gFF1iqRSTg5OkgULU1Yo_M86Rvr0d-8w>
    <xme:QOILaQIotELrML6VX3biXMNLM_FiLuhuXQvtwevB_alpDlpIUqxJSUj4H2gok7BLT
    uxxeGmjkYfTj5VyJAXXOHcHP9fwPL3qbzpKwKcXFi_A4rKrVkMMjeA>
X-ME-Received: <xmr:QOILaUgO0Kh3EHeCMiy6AfoFGLxycJEj8sHXlDHlQH7zw9jfcqZx-IYLe66vd5DGyrpujQ5r8mFeZBS2F8YmltOmm4XtfAMPBJU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeehvdeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeduuddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesthhrvggslhhighdrohhrgh
    dprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghu
    pdhrtghpthhtohepuhhsvghrmhehjeeshigrhhhoohdrtghomhdprhgtphhtthhopehmph
    gvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopehnphhighhgihhnsehgmhgr
    ihhlrdgtohhmpdhrtghpthhtohepshgrmhesrhgrvhhnsghorhhgrdhorhhgpdhrtghpth
    htohepsggvnhhhsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhgpdhrtghpthhtohep
    lhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:QOILaekBeZqQ34ee6nqZKo8TihAZVfcf41875ffwpDjtg7h2-IR3Ew>
    <xmx:QOILabW8k5RXAufkjwiA2hhYLAoccfcdTmRyAqbnaKivt58wEWHa-w>
    <xmx:QOILabvITBYGXTFuPsrsayWcM-DIhhkt3bwKXDALhISFoACLGyPO0g>
    <xmx:QOILaW6HBnsgeo6MfgEDnOq4hDesmwC59UVkndb4Hb-10c0acM2w8A>
    <xmx:Q-ILaVkizhPhNiiYGMXZnL8T9JiM8izl-rAv8Ayl5scQjEpHWPd5I_n9>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 5 Nov 2025 18:48:13 -0500 (EST)
Date: Thu, 6 Nov 2025 10:48:25 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
    Stan Johnson <userm57@yahoo.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
    sam@ravnborg.org, benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org, 
    linux-kernel@vger.kernel.org, rdunlap@infradead.org, 
    Cedar Maxwell <cedarmaxwell@mac.com>
Subject: Re: [PATCH v4] powerpc: Use shared font data
In-Reply-To: <3cc3d311-35b0-42f1-b20f-ed59391bb8e0@csgroup.eu>
Message-ID: <6c805c35-a23d-569e-42ef-f3d875997048@linux-m68k.org>
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

> > I wonder if bodging those in lib/fonts/Makefile for 
> > lib/fonts/font_sun8x16.c fixes it?
> > But... this is data - there's no code is there - are any of those 
> > flags relevant for data only?
> 
> I think -fPIC is relevant for data-only here because font_sun_8x16 
> contains a pointer to fontdata_sun8x16 in font_sun_8x16.data
> 
> I see two things to try:
> 
> 1/ Either build font_sun8x16.o with -fPIC
> 
> diff --git a/lib/fonts/Makefile b/lib/fonts/Makefile
> index e16f68492174a..844306d7b15e9 100644
> --- a/lib/fonts/Makefile
> +++ b/lib/fonts/Makefile
> @@ -20,3 +20,5 @@ font-objs-$(CONFIG_FONT_6x8)       += font_6x8.o
>  font-objs += $(font-objs-y)
> 
>  obj-$(CONFIG_FONT_SUPPORT)         += font.o
> +
> +CFLAGS_font_sun8x16.o             += -fPIC
> 
> 2/ Or add a PTRRELOC:
> 
> diff --git a/arch/powerpc/kernel/btext.c b/arch/powerpc/kernel/btext.c
> index 7f63f1cdc6c39..fc461cfaf4a34 100644
> --- a/arch/powerpc/kernel/btext.c
> +++ b/arch/powerpc/kernel/btext.c
> @@ -20,6 +20,7 @@
>  #include <asm/io.h>
>  #include <asm/processor.h>
>  #include <asm/udbg.h>
> +#include <asm/setup.h>
> 
>  #define NO_SCROLL
> 
> @@ -463,7 +464,7 @@ static noinline void draw_byte(unsigned char c, long locX,
> long locY)
>  {
>  	unsigned char *base	= calc_base(locX << 3, locY << 4);
>  	unsigned int font_index = c * 16;
> -	const unsigned char *font	= font_sun_8x16.data + font_index;
> +	const unsigned char *font	= PTRRELOC(font_sun_8x16.data) +
> font_index;
>  	int rb			= dispDeviceRowBytes;
> 
>  	rmci_maybe_on();
> 

Patch 2 has the virtue that it only needs to be tested on powerpc.
Patch 1 has the virtue that other architectures might benefit.

Commit 0ebc7feae79a ("powerpc: Use shared font data"), which caused the 
regression, has a sparc equivalent in commit 0f1991949d9b ("sparc: Use 
shared font data"). So I wonder whether CONFIG_EARLYFB has also regressed 
(for CONFIG_SPARC64). Maybe QEMU could help answer that question.


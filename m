Return-Path: <linuxppc-dev+bounces-14913-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AFCCD1BE3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Dec 2025 21:26:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dXzZb1Vd2z2xqj;
	Sat, 20 Dec 2025 07:26:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766175975;
	cv=none; b=DGx3hbrClLWOti3m/F3fAJlj2pPLU0FYrcT49IUzAprHulaMUkpMY9Fsr0wMEeUFqGWShQOAsf7SsbImoPYS4BkUz6HpDikr9/5RaKhQZH6/j3zXpeFnWldinmCFI8Lix5lQTOroY9Twyt/eiIOasSDoru+PDvTTG3OAL9AC9tfbMSgYqEa0f6yP/5Lh6p+MTAA2hpiumY+B6LpmSK+MW+T5DIVZcwWhHo5BOvslIeluzjXjv1UXli/Ikxpfc91k/swOZpdt9H6J/aRGKRdmo1rE27dtwg1A0XB1geQy3iQ481cE44J1Ou6Yo3Zdx6arAKMZv/Tyd0I/YqLh2NOxPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766175975; c=relaxed/relaxed;
	bh=Ajgf0rKRRQ9LFo13Zd/qc7LeQHMbNIDfCQBML/26PZg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=nhOvSvpQ1/SvI7Z6LfJGLFK1DaF98iSQiJ054QJhzpYnmqwT/+p3PdG+ovrVigpYTeqBHldIE/fjxnlfHW6TtkoMipCg8HUj0qk3R/PgiPudizJneM+Mn1dPzZoUZrOvEofYUcYcyxcyUpCNiEHqDJ45JLsG9287Nme8l0uKnfudsMZ0myCJ7/hbEEyeFvvpHFrIhKRl9TO1ISNaoHn0R7VPP5xh/x+Ws/UTnTJbujIQvNFX2KuXFrtaFNUNEA2/LHUkS8jnu28UvagEiQ1G6+fL5f0LnqPPObc1OxPD5TxsV459IpMoaxMu89qlZZpH4ERzlBq3yrbtjVZMmeFS9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Ioywp382; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=og8IXOLt; dkim-atps=neutral; spf=pass (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Ioywp382;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=og8IXOLt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.148; helo=fout-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 322 seconds by postgrey-1.37 at boromir; Sat, 20 Dec 2025 07:26:10 AEDT
Received: from fout-b5-smtp.messagingengine.com (fout-b5-smtp.messagingengine.com [202.12.124.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dXzZV4zKMz2xqG
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Dec 2025 07:26:10 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.stl.internal (Postfix) with ESMTP id 0EDB51D0007A;
	Fri, 19 Dec 2025 15:20:44 -0500 (EST)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-04.internal (MEProxy); Fri, 19 Dec 2025 15:20:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1766175643;
	 x=1766262043; bh=Ajgf0rKRRQ9LFo13Zd/qc7LeQHMbNIDfCQBML/26PZg=; b=
	Ioywp382GijI9RzuguD4NiwqaDlYPhRLkudTYDqIBQ08GKxMFSBofLiIUD6ko0oU
	a02wVJnanc83P0N1IGm4FdSzAfuaB+r/ffrnqdfID10whA7hq1HwpOKd56dnDYIa
	EdKKs1fUmSWioraACcR3WQUzBxBm5yPJWqSYPOMEYC2Q2rLY2InlpUMqj3PiysVa
	NHC/Oe1I/6N1LJff22F8v4n0nUwc8MmLPBq6G5RPyFyAwBnsFMaZgdY6J7uvsHLX
	J2wb79TXw/rde+5pNU8cSjmru4/JtY2VQwsEJXZDPTCJhk6zvYYhePPGPrgrMqSe
	nOpqFdz9nTJAmF15h19D0A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1766175643; x=
	1766262043; bh=Ajgf0rKRRQ9LFo13Zd/qc7LeQHMbNIDfCQBML/26PZg=; b=o
	g8IXOLtfcHmaPL/0tZhx1BWEKNIJZCEw9DZ5WGPkXcXTrBTD126XAEvsCVNE09wm
	rFBXvkfM8nr/Nqk2egzJZPfL4XpKnJH37cR1NXfCri9sByVXjNgX1TVrFGy8gub6
	uzicqc4TpRKy1jhdKI2q+y4ahDGI5qIvNk/81IlehrMxWg0pSwFuB5sf8rCCzfTh
	gd0tBv8kzKJbkBwiE1MVF7HsVOkDtRRGErcdFd/8A4v8cPHxRTAuFDiCcZaHnla6
	3l+aVuWzvnz37xZu0WxD1kTXeYvKUkiqq4E/15FmeRIBaIvH3kSO6P4uoBogdhP9
	SBdE++ev1wYdh1lmiNEXg==
X-ME-Sender: <xms:mLNFaYQBdrGx3L_x-6cVNW-PNixpsjzM1Yd6uyWfxNVxe8ZZ6Glwjw>
    <xme:mLNFaQkR2k01XAMccHs0N2kkNp0_rfQILSSqWH3qZKPoKvaf3MHNxi6IeMoobAgA3
    xfhg5jlgoV4uWdv9LOsw-vu7qgVmUKtjQd5QHMViwDFJwKFV_SUqQo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegledvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeffedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpthhtoheplhhinhhugiesrg
    hrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdr
    ihgurdgruhdprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhmpdhrtg
    hpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtphhtthhopehsuhhrvghn
    sgesghhoohhglhgvrdgtohhmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopegurghvvgdrhhgrnhhsvghnsehinhhtvghlrdgtohhmpdhr
    tghpthhtoheprghrnhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:mLNFaWoje0ZTjN4FWEG307qsoelv8UP7xuwOV-bJDlPneRgqHoxhSQ>
    <xmx:mLNFaY4cHwgKqJc2hMLfk2iQM1BIuaryrhSrPa-TOjP02OcwvFVYmA>
    <xmx:mLNFaYJ0tukoZqhoq8MtrkOcZIcZBCdTfMFUftiVM5EHFLLaD8nt-w>
    <xmx:mLNFaUnow3ag4xv8Fc1BEkx1u7qedoC76aowy9QsDziIR23OT3VabA>
    <xmx:m7NFabOykPl24tgMULroiVZq6vEE9hmNtVVs6Fr7pVsm_3xW_iGmm6Cb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 99661C40072; Fri, 19 Dec 2025 15:20:40 -0500 (EST)
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
X-ThreadId: AhgucsMdbVXw
Date: Fri, 19 Dec 2025 21:20:20 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Dave Hansen" <dave.hansen@intel.com>, "Arnd Bergmann" <arnd@kernel.org>,
 linux-mm@kvack.org
Cc: "Andrew Morton" <akpm@linux-foundation.org>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Jason Gunthorpe" <jgg@nvidia.com>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, x86@kernel.org,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>, "Michal Simek" <monstr@monstr.eu>,
 "David Hildenbrand (Red Hat)" <david@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Nishanth Menon" <nm@ti.com>,
 "Lucas Stach" <l.stach@pengutronix.de>
Message-Id: <bad18ad8-93e8-4150-a85e-a2852e243363@app.fastmail.com>
In-Reply-To: <a3f22579-13ee-4479-a5fd-81c29145c3f3@intel.com>
References: <20251219161559.556737-1-arnd@kernel.org>
 <20251219161559.556737-2-arnd@kernel.org>
 <a3f22579-13ee-4479-a5fd-81c29145c3f3@intel.com>
Subject: Re: [PATCH 1/4] arch/*: increase lowmem size to avoid highmem use
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Dec 19, 2025, at 19:02, Dave Hansen wrote:
> On 12/19/25 08:15, Arnd Bergmann wrote:
>> --- a/arch/x86/Kconfig
>> +++ b/arch/x86/Kconfig
>> @@ -1416,7 +1416,9 @@ config HIGHMEM4G
>>  
>>  choice
>>  	prompt "Memory split" if EXPERT
>> -	default VMSPLIT_3G
>> +	default VMSPLIT_2G_OPT if HIGHMEM && !X86_PAE
>> +	default VMSPLIT_2G if X86_PAE
>> +	default VMSPLIT_3G_OPT
>>  	depends on X86_32
>
> For simplicity, I think this can just be:
>
> -	default VMSPLIT_3G
> +	default VMSPLIT_2G
>
> I doubt the 2G vs. 2G_OPT matters in very many cases. If it does, folks
> can just set it in their config manually.
>
> But, in the end, I don't this this matters all that much. If you think
> having x86 be consistent with ARM, for example, is more important and
> ARM really wants this complexity, I can live with it.

Yes, I think we do want the default of VMSPLIT_3G_OPT for
configs that have neither highmem nor lpae, otherwise the most
common embedded configs go from 3072 MiB to 1792 MiB of virtual
addressing, and that is much more likely to cause regressions
than the 2816 MiB default.

It would be nice to not need the VMSPLIT_2G default for PAE/LPAE,
but that seems like a larger change.

     Arnd


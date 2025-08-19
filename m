Return-Path: <linuxppc-dev+bounces-11151-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF15EB2CC62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 20:49:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5zCL4jzRz2yDr;
	Wed, 20 Aug 2025 04:49:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755629374;
	cv=none; b=DPjrxQMEH9Mal2c3Leb3gGe3lMlSIb/vLKas4zA+OcPFAqTswOhbcRfJ652DAz7ZAWP7Z4rkjqBU54iIYQuBDfm+9jRZp5bkQNE2Hey4fLWi9M6YcznB8IhL15NhwbMYIxCXj7+xd4xoIaJ0QzOgXx723TcZocJQHsfyLGdt85sNSw1sf71IxuEAAmtO8AbA30mZJ843LhzbZJGhngpHnQzliU04neqQjqgFdgulhgWZIsW0csTLZshawOPtpZW4hhJAeHgEkdaB+K8ZS7ZrkMd4Dar9k/V3EeamTqtla75Zn0LDstmSksNDPIoDOccKZ8KlpN7PdUDHIpzZmEUxTA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755629374; c=relaxed/relaxed;
	bh=V0a8rCSgjkAz7gnhnXOKuD7c9T1R+bK+iGUt9hpQUxA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=HJyMITpwTybMPmx82/0uE/v9lGGvuSP/prVUYlujlq6cMFVr3kfRoooxwRfVMnfSvxwknlA+RnaunJqUlHmZfqq7iaoLaTyP9/CcCeF+daI0ykqJGqgSx1jtK7b5728l+0ymx7/lq2GK1bBCullI4KF36Xvh1H5mPN68wSWlUIz1562kGfr5DjLFXkFgkeXHfZBSOyEcB213tcxlfOxm2k1RsVB8VzCMOguUWPorj0if4Y6UqUisbClwnQ7EqAQY6u/w2aOQgKjaxNj+XhH0zusf5mDNl4sa79dypyXHirf+MDtEdyXTUO+wytnSipPSLGVGpGdSkFBD8vCEAqKH9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xmpr6nUl; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xmpr6nUl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5zCK6jPXz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Aug 2025 04:49:33 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A68B6434E0;
	Tue, 19 Aug 2025 18:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F31C4AF09;
	Tue, 19 Aug 2025 18:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755629369;
	bh=7PY2nvBiFg+PmH3kasIozmSCqMsV1czCdVRZ4HT8eEo=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Xmpr6nUlxhT4ML+rFt1gIMnPEVpYqIqWjpUkgUQR5tX3Ea3qBYnKk1IyWsYC7sBet
	 QBsMrRk3r7iMu12daYBH1ylIKK33Dgbw2Y1MuCT43OUlbupun65NOdzuJa9IY8ytGJ
	 F2KoEBiwNJLZb2M/WkquLSxMBkG+zUTjWlAYLvA7NXHrkQmzA8GdxTTiqKCPXXi78g
	 mN0g5G7szNsgyUdSlZmbkMIIrt7pMw7M4uyf1LOzcmC10UoLlqg1CBOGjbTIEq00Ec
	 HfGNVq0UJwNkN4j62cFWRW+/HtCdXt1of9/eic9VtPkqlZST1PzxASg8IfYr3RIGmP
	 SUG+MxNe67pLw==
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 31D3DF40066;
	Tue, 19 Aug 2025 14:49:27 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Tue, 19 Aug 2025 14:49:27 -0400
X-ME-Sender: <xms:NsekaGLkpYYn_tL5rT3yO_BkXqxiddfgdxidgKxcHaH-MXl652p3cQ>
    <xme:NsekaOJlIC7TCSjCwYmRCpvzsFljgqYaxuYOZolEbVOqnFcN0Yb2GZzTgHG2uybzM
    aWMSS4nJkDgbbBx7tg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduheeivdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfnfgvohhn
    ucftohhmrghnohhvshhkhidfuceolhgvohhnsehkvghrnhgvlhdrohhrgheqnecuggftrf
    grthhtvghrnhepjeevffelgfelvdfgvedvteelhefhvdffheegffekveelieevfeejteei
    leeuuedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eplhgvohhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduvdeftdehfeel
    keegqddvjeejleejjedvkedqlhgvohhnpeepkhgvrhhnvghlrdhorhhgsehlvghonhdrnh
    hupdhnsggprhgtphhtthhopeefjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    jhhorhhoseeksgihthgvshdrohhrghdprhgtphhtthhopehrohgsihhnrdhmuhhrphhhhi
    esrghrmhdrtghomhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdp
    rhgtphhtthhopegrsgguihgvlhdrjhgrnhhulhhguhgvsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehr
    ohhsthgvughtsehgohhoughmihhsrdhorhhgpdhrtghpthhtohepghhlihguvghrsehgoh
    hoghhlvgdrtghomhdprhgtphhtthhopehkrghsrghnqdguvghvsehgohhoghhlvghgrhho
    uhhpshdrtghomhdprhgtphhtthhopehsrghgihesghhrihhmsggvrhhgrdhmvg
X-ME-Proxy: <xmx:N8ekaMdwa-bjfjKiy_bnjKe5pj-w5KnECjXqAsQ2QeQdV4SQA7pQwg>
    <xmx:N8ekaPdCW9gH5-vPa6JOMA4aaqp_1mwWnXjSovauczKDDBtpYQ57dA>
    <xmx:N8ekaKnKy6VKuw8SWj7LEaUJFkqm2rbcIMv54YWlw8KOdD3OfERqqw>
    <xmx:N8ekaE8iyeSnMuDLLObkGrzOSgmAQEbj_4QdVJQzRyQ8881Jp0dwDQ>
    <xmx:N8ekaGEni2UyRaNp_TjZoxjj4fIEinDxeQ57M5QUT8SDp3Eg6UepfRUM>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id E45512CE0071; Tue, 19 Aug 2025 14:49:26 -0400 (EDT)
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
X-ThreadId: A0xmfm2pPGfg
Date: Tue, 19 Aug 2025 20:49:08 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Keith Busch" <kbusch@kernel.org>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Leon Romanovsky" <leonro@nvidia.com>,
 "Jason Gunthorpe" <jgg@nvidia.com>,
 "Abdiel Janulgue" <abdiel.janulgue@gmail.com>,
 "Alexander Potapenko" <glider@google.com>,
 "Alex Gaynor" <alex.gaynor@gmail.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Christoph Hellwig" <hch@lst.de>, "Danilo Krummrich" <dakr@kernel.org>,
 iommu@lists.linux.dev, "Jason Wang" <jasowang@redhat.com>,
 "Jens Axboe" <axboe@kernel.dk>, "Joerg Roedel" <joro@8bytes.org>,
 "Jonathan Corbet" <corbet@lwn.net>, "Juergen Gross" <jgross@suse.com>,
 kasan-dev@googlegroups.com, linux-block@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-nvme@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-trace-kernel@vger.kernel.org,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Robin Murphy" <robin.murphy@arm.com>, rust-for-linux@vger.kernel.org,
 "Sagi Grimberg" <sagi@grimberg.me>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Steven Rostedt" <rostedt@goodmis.org>, virtualization@lists.linux.dev,
 "Will Deacon" <will@kernel.org>, xen-devel@lists.xenproject.org
Message-Id: <82f3cf3c-960b-41bc-82a8-ce84353706ed@app.fastmail.com>
In-Reply-To: <aKTAVOBp0u6ZSC4w@kbusch-mbp>
References: <cover.1755624249.git.leon@kernel.org>
 <22b824931bc8ba090979ab902e4c1c2ec8327b65.1755624249.git.leon@kernel.org>
 <aKTAVOBp0u6ZSC4w@kbusch-mbp>
Subject: Re: [PATCH v4 14/16] block-dma: migrate to dma_map_phys instead of map_page
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On Tue, Aug 19, 2025, at 20:20, Keith Busch wrote:
> On Tue, Aug 19, 2025 at 08:36:58PM +0300, Leon Romanovsky wrote:
>>  static bool blk_dma_map_direct(struct request *req, struct device *dma_dev,
>>  		struct blk_dma_iter *iter, struct phys_vec *vec)
>>  {
>> -	iter->addr = dma_map_page(dma_dev, phys_to_page(vec->paddr),
>> -			offset_in_page(vec->paddr), vec->len, rq_dma_dir(req));
>> +	iter->addr = dma_map_phys(dma_dev, vec->paddr, vec->len,
>> +			rq_dma_dir(req), 0);
>
> Looks good.
>
> Reviewed-by: Keith Busch <kbusch@kernel.org>
>
> Just a random thought when I had to double back to check what the "0"
> means: many dma_ api's have a default macro without an "attrs" argument,
> then an _attrs() version for when you need it. Not sure if you want to
> strictly follow that pattern, but merely a suggestion.

At some point,  I had both functions with and without attrs, but Christoph said that it is an artefact and I should introduce one function which accepts attrs but without _attrs in the name.

Thanks 


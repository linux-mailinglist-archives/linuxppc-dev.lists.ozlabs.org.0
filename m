Return-Path: <linuxppc-dev+bounces-3219-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 468039C8D36
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:51:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq34Q5kMWz2xGw;
	Fri, 15 Nov 2024 01:51:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731595862;
	cv=none; b=UJfNR3VYNH49MLqQc63svsvKZbEHWMerwYmhPfmYBm2EfChFBvWFP2l/xv1K+KzDGBXIapSbHfYWVXdQF7+wTQZ9Q+lgaA0tJ2/TMslwK6uqikFtcLYXiZVuzpdoCwDgMgV/oU0xkXIp6Z6OjHVN2+VcqHQa6nVqcQVqW81a/Z6IwSZg9hXIUoF3FskocHqTS+urVwYcoDWhpbALnu+/6c1W8iuT8u0rMPHJWauxXnwkoEPui8W2NIrkd2g/Hj3rjfwNFeQrZjlKKJiQ1nU0lovdKY1ABE0LPT+YHCw9tVHh5MjDAx1LsJvTFLaoR8mVJJroJFnx6PL3FC8CuB7zig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731595862; c=relaxed/relaxed;
	bh=sFWs14+PPXRYtue3bwzu1urfhLPT1BIAspfMaSIijus=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Tv8SGuG2Tju4N/6P7l7kc/l0JvumATrxmg4cLJqbKVeU4b25OcxwDgNn9MLygvcwzkxRgwNW3mzxJ8AxcQ1UclGHjl2Rl7pxWzV0C3VJr3I5J1RLGcHcqFas8P4M53Vk2Ne2IGzq8QEB6HQuFd0ldCczBncYPy0OsnaJB6TXcESpqOHiGo3wvHUF0hVP+/pRPkMZKOZpXjmHrDQBmUhxcr40VoKU9nico8P6GQyA8iaKdqfMXylqIYFuHUf77ZoDhD8M5P/Do1st8c1MvTqLjgHwSxxiUDTBLe0JEeln4Z3EReVws/NigU1Q7vtbHgL7Zac2rVTK4BQY5mM6pEeihA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Ypy31hTp; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Z6Rwc3+J; dkim-atps=neutral; spf=pass (client-ip=103.168.172.153; helo=fhigh-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Ypy31hTp;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Z6Rwc3+J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.153; helo=fhigh-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq34N4pCCz2xGl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:51:00 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 8E2E3114016F;
	Thu, 14 Nov 2024 09:50:57 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 14 Nov 2024 09:50:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1731595857;
	 x=1731682257; bh=sFWs14+PPXRYtue3bwzu1urfhLPT1BIAspfMaSIijus=; b=
	Ypy31hTpCLKlJ5dFN8J/AMed++WeK1GcoUHCZ6PJ3pB2E1RRw4KmTSTv5WX9vYP1
	FkTeYIXGnCu7YgCpzHz24OHLA31eY0Z3Bzv01WOkuIDuOptM01PR5vvll0xCuiv8
	MjEjSSBS68UTU+jNuExNOhhhV50d10wHNBP1z1CCYkv+jN66Iy+Tfnk1RU233xJX
	4Wc6yS9wERVeLFkb2mbmPUYc05BD1beamrD6sC0IgCcUIdIGfAkZrzZA0PwIomUm
	CBVLBvBfIShumadPZRF/S+hTye06db63fRzyNSJfsA4yQXv68YMR522yitCbK9X1
	nLLFXWXjFLcOHHZnV00Xmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1731595857; x=
	1731682257; bh=sFWs14+PPXRYtue3bwzu1urfhLPT1BIAspfMaSIijus=; b=Z
	6Rwc3+JuV7Rj30CPSnmRegEaDf5FgViAQY6FDGmf/dKrwwics4QzQ1rGdf5eaMkn
	IVBhSws3C2CsdDkEcH1m9gCQusgPRmMDq3d/9kr6rI2t29ngSWdElgioTdjWXicy
	yxPIc43KG8LXZ4+ZjyNXf4cDqwqVTIS3cgkyIaKZX0UncQeh6wAVLy8WQK4snObG
	t7KdUiviE9svgD0AsaAw2OmfD2FCs0+w1buxNVUO49cgagwuT8vJ3VykvSEll8ZB
	5FyQ3XyruFyyEr0m6LTyflg7+g1aKHIe+RvSSKDLGE6ztBHH7c039iGfX5/nmQ0q
	cEmA3/aVCxqoFN1TSrAqA==
X-ME-Sender: <xms:UQ42Z6TbDcxYd-ue_gPojRNxqfN8CaZ0Q7wBNDYBGkQHOdfv_qHgTA>
    <xme:UQ42Z_z4YVAj9jlnM8FqCPvjX9WYjj8aO-suXCgM5_l1MjaI3-RW3QCpK43MZr_9Z
    XcONfLFdOoGVFxK2ik>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrvddvgdeilecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredttden
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffg
    vedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeehpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurd
    gruhdprhgtphhtthhopehgvghofhhfsehinhhfrhgruggvrggurdhorhhgpdhrtghpthht
    oheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtph
    htthhopehjkhesohiilhgrsghsrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhn
    vghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UQ42Z33DGUeHj88_CqJjIpbZtoEayoFnFOF7g_SXuldGhXlGUoKoIA>
    <xmx:UQ42Z2D2uU3PHV-5cmtBNTCxKL3pzy613uLPmRTNIGGNda02RutPOg>
    <xmx:UQ42ZzjrS8gvWUcenW_TNtWHvfZ1Sy_zodmYxEo7SHTvc9Zw1Hm5SA>
    <xmx:UQ42ZyoTLmasgCXH3WLsv1t8N07_8i34c0CiT8-gtax9g8rxCW5Ptw>
    <xmx:UQ42ZzdqHn5Bahe9AwfU-vYIM2Fcuk_0D98fPCpOT_qqjoZFeMoJ_cvk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3170A2220072; Thu, 14 Nov 2024 09:50:57 -0500 (EST)
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
Date: Thu, 14 Nov 2024 15:50:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: linux-kernel@vger.kernel.org, "Jeremy Kerr" <jk@ozlabs.org>,
 "Geoff Levand" <geoff@infradead.org>
Message-Id: <2938c8d8-1846-4e27-b56a-176a397f5cf6@app.fastmail.com>
In-Reply-To: <20241114125111.599093-11-mpe@ellerman.id.au>
References: <20241114125111.599093-1-mpe@ellerman.id.au>
 <20241114125111.599093-11-mpe@ellerman.id.au>
Subject: Re: [RFC PATCH 11/20] powerpc/io: Remove PCI_FIX_ADDR
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Nov 14, 2024, at 13:51, Michael Ellerman wrote:
> Now that PPC_INDIRECT_MMIO is removed, PCI_FIX_ADDR does nothing, so
> remove it.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Arnd Bergmann <arnd@arndb.de>
 
>  static inline unsigned char __raw_readb(const volatile void __iomem *addr)
>  {
> -	return *(volatile unsigned char __force *)PCI_FIX_ADDR(addr);
> +	return *(volatile unsigned char __force *)addr;
>  }
>  #define __raw_readb __raw_readb
> 
>  static inline unsigned short __raw_readw(const volatile void __iomem *addr)
>  {
> -	return *(volatile unsigned short __force *)PCI_FIX_ADDR(addr);
> +	return *(volatile unsigned short __force *)addr;
>  }

I think the __raw_ accessors are all identical to the
version in asm-generic and can be removed altogether.

> +#define __do_writeb(val, addr)	out_8(addr, val)
> +#define __do_writew(val, addr)	out_le16(addr, val)
> +#define __do_writel(val, addr)	out_le32(addr, val)
> +#define __do_writeq(val, addr)	out_le64(addr, val)
> +#define __do_writew_be(val, addr) out_be16(addr, val)
> +#define __do_writel_be(val, addr) out_be32(addr, val)
> +#define __do_writeq_be(val, addr) out_be64(addr, val)
 
These should no longer be needed either since 
arch/powerpc/include/asm/io-defs.h only needs to redirect
the inb/outb calls but not readl/writel and the string 
operations.

      Arnd


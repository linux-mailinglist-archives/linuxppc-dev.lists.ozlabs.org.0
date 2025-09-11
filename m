Return-Path: <linuxppc-dev+bounces-12020-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D20E9B5282E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 07:38:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMmYz2nlfz2yFJ;
	Thu, 11 Sep 2025 15:38:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757569111;
	cv=none; b=P6Hfp+U5f8JZq4osfpe9p3tdhuv7iDFk2JGfMHnxlBUP8fEjpFv4Qf27ObNLAxCJ/H3JRpFB6I79HP7pVdY3w0TNjgoXFXQ/gzxHfdCpBhftOBp4ztqc5Uzwgs/KiYnEJpFOxh4ZHBYAUNYe/4s2YcgcX1gDZMwo/URTOMxStOuYiIDJOzvBGyfPCWS/48wyttx13bqK99Z0pXc4C57LE0IgN6z4wnaUNMb/YdyAiVNGEO2uSROu+w2UbM2ZZuOHaUgk2T7uKPb7uXW2XJKnOlvUYwXPehZ1GdIEoFcIH8tdJjNy3odKSvqg/9AROH7OH+NQrAEhFLc+RqkQK4qALA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757569111; c=relaxed/relaxed;
	bh=J4SmUX7P+kpNB7OaZvmmYUNeRGLdLLWkUbpUICDS3qY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PsGoWhPi1K6lFiY02YPOB5wr8Htf41NsB6RtLR5qxIu4SWvMt/R/kdFnLc5dluPAx4ypS48cAh+14bpcF3g7F0kHEkVLotM/c5YPXfPJtr1NXzq5XjXQgDWpkK7b9TNxFlGp/GuO6Y5VdmlIEcvzxa7GkkHzRTjln9h57En7+/Ky/uxb787Caejgwjj/Nz6IzjyXDm0LSsYpQUWUfYY1jGmXFW5+3/6Y0RmDWXsi8YCBBAzcI7baAi9aYsyRFu6kjFLuatHokFJbiKhiFk/I8jfWZgzWV7mX5efRdxDGjG7LnjmlwYPGXddiesoFPx2av/p4Bh0x1qy6ubEum8GSSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=Hs7ZfSyD reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=Hs7ZfSyD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMmYw6fB9z2xnM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 15:38:26 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4cMmYn6jWzz1FQVw;
	Thu, 11 Sep 2025 07:38:21 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4cMmYn1PXCz1FQVP;
	Thu, 11 Sep 2025 07:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1757569101;
	bh=J4SmUX7P+kpNB7OaZvmmYUNeRGLdLLWkUbpUICDS3qY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Hs7ZfSyDOM7aPRu33LOA+3yef+fVto4kU9xa+4YpClIxfuXs1fUOvHNHSbYzTsH95
	 ys3zgWHJHS23RTioc6nK1rRkrbxCam9D5ptr5a/DgIz7xpPRDCQ6Etyd5bStpWc73w
	 7yOC/+8Ounc2FdB1AGu5KYNtNxw+XWF0Y0vJdIXiwXVxxPzwE6FGqoMLKjGAvRTDu6
	 0tRpQ6v9KDjievFY3f8w6p8LSH1LMGdoj0SQczd00LYltcWoPmKILRmn5F8FOypXFd
	 6Zp6gO/YqFuyTXHhSNlsS6DU3Zk+NRltjlY23ffJsltCzkH4eal4Sp3ahPCc/wsqRM
	 gmrx1Brnia8oQ==
Message-ID: <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
Date: Thu, 11 Sep 2025 07:38:15 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Richard Weinberger <richard@nod.at>, Lucas Stach <l.stach@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Ankur Arora <ankur.a.arora@oracle.com>, David Hildenbrand
 <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>,
 Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-09-09 23:23, Arnd Bergmann wrote:
> High memory is one of the least popular features of the Linux kernel.
> Added in 1999 for linux-2.3.16 to support large x86 machines, there
> are very few systems that still need it. I talked about about this
> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
> and there were a few older discussions before[4][5][6].
> 
> While removing a feature that is actively used is clearly a regression
> and not normally done, I expect removing highmem is going to happen
> at some point anyway when there are few enough users, but the question
> is when that time will be.
> 
> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason. Some
> users obviously are alarmed about potentially losing this ability,
> so I hope to get a broad consensus on a specific timeline for how long
> we plan to support highmem in the page cache and to give every user
> sufficient time to migrate to a well-tested alternative setup if that
> is possible, or stay on a highmem-enabled LTS kernel for as long
> as necessary.

We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
used in LEON sparc32 configuration (using 36-bit physical addressing), a
removed CONFIG_HIGHMEM would be a considerable limitation, even after an
introduction of different CONFIG_VMSPLIT_* options for sparc32.

Regards,
Andreas



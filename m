Return-Path: <linuxppc-dev+bounces-12010-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D552BB52139
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 21:37:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMWDn4YVqz3dTY;
	Thu, 11 Sep 2025 05:37:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=116.203.167.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757533065;
	cv=none; b=NNlImhlU6D5gzgLInPIWfrHKbMB2xHdHlE/38dY8o1Vs3IDxhUIjEDdYilhR7Eh2MbqNJqtPc0Ra892TaDg+ChmmWaJ0ugbrfqnbWo/0ARKTc2P9xYBXxLOzZjfDYyXyBjS3LqWijotQAoWGmU/MeNIMJIBZEEOpT9ke2dMAPjGFIe5ZTj1Jfh6whBj4Td3+LGY+3HHiEkmxocBQCq0D7isif9T91XF1XwYUWhACd1oCT3XP8kMGle97L1xkNYtsyaHgc6sYToPTqtPaXtqRnZ3DxdppWKdj+DUB/circExZcbRJJVJeqeQ+Tls4ANPIF4+4UBFd1P+KGDUN4Yg0Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757533065; c=relaxed/relaxed;
	bh=Kvy79l38OjgXam56LG4SBUALLkxIDxyLLpk0bImYB5k=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=coycUErRVngpQlePtQ5QMXkfn54Mt/44Qrm0DXGE42+ZLcmsAdSOwLj1PV3hG0LhxBa2gCYsEoI/qCtw7lHpJFJUrXLBT6VVRc+qEGlPEMAYgdMO4W2qwJ5XafPPHdNgE1yM9QvwNsaEHv7qh798KzBicQdkh9C++v14N7xkIFlHKRHjaDyF8VK0vYmL0m0qdsaou9xjM4BrkTTs4GHFXBagUYYEeR3QLUsbSmCdxZVe7te2b3Ic0VUfSbMWkELQxcMyZoStvPMPoZkuAIKMzIFwmYMgL0YEaBrfqzb892GZu0N9e0qSN/2MR/W3L3nTYoWWhMoFfdDKdq36UsTy5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=permerror (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org) smtp.mailfrom=nod.at
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:195.201.40.130) smtp.mailfrom=nod.at (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMWDm36t4z3dSr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 05:37:43 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id E33972C14AA;
	Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id mZ4QcxbfF_Ic; Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 274732BA98D;
	Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id Q1j44iMB0ybE; Wed, 10 Sep 2025 21:37:38 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id D9D02CE340;
	Wed, 10 Sep 2025 21:37:37 +0200 (CEST)
Date: Wed, 10 Sep 2025 21:37:37 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
	Lucas Stach <l.stach@pengutronix.de>, 
	Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, vbabka <vbabka@suse.cz>, 
	Suren Baghdasaryan <surenb@google.com>, 
	Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>, 
	heiko <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
	Andreas Larsson <andreas@gaisler.com>
Message-ID: <1586788245.22320.1757533057730.JavaMail.zimbra@nod.at>
In-Reply-To: <d9caedb4-41c8-4ef7-99b9-51d891aee555@csgroup.eu>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <d9caedb4-41c8-4ef7-99b9-51d891aee555@csgroup.eu>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [195.201.40.130]
X-Mailer: Zimbra 8.8.12_GA_3807 (ZimbraWebClient - FF141 (Linux)/8.8.12_GA_3809)
Thread-Topic: Reaching consensus on CONFIG_HIGHMEM phaseout
Thread-Index: BY4xIXfJeETYMNF0Cnq/68k1mYFqTg==
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,T_SPF_PERMERROR
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Christophe,

----- Urspr=C3=BCngliche Mail -----
> Von: "Christophe Leroy" <christophe.leroy@csgroup.eu>
> Can you tell which PPC32 model/family you are using ? Is it mpc85xx or
> and/or other variants ? Maybe we can look at keeping CONFIG_HIGHMEM or
> find alternatives for that subset of PPC32 only.

Off the head, MPC8343 and QorIQ P1022.

>=20
> Could you also elaborate a bit on the kind of issues you forsee or fear
> with applications and FPGA device drivers.

Unfortunately, applications in this area often make certain assumptions
about the amount or layout of memory. This becomes a bigger problem when
using FPGA device drivers of questionable quality, which share memory
between the kernel, userspace, and the device itself.
These are mostly out-of-tree drivers, so that's my horse to ride,=20
I'm just mentally preparing myself for "interesting" bugs that will need
to be sorted out.

> FWIW I sent out today a patch that removes CONFIG_HIGHMEM complely on
> powerpc in order to get a better view of the impacted areas and allow
> people to test what it looks like on their system without
> CONFIG_HIGHMEM. See [1].

Oh, that was fast. :-)

Thanks,
//richard


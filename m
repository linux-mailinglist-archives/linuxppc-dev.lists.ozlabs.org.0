Return-Path: <linuxppc-dev+bounces-11991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E1BB5190F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 16:14:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMN3w15m7z3dDk;
	Thu, 11 Sep 2025 00:14:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=116.203.167.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757513676;
	cv=none; b=OK0CYOhlVxVZM7DXuWHuW2+pnPT6CbIpigwKPXUwAurQkM7MhOvlCk9oAUesDQyJaNcBZoefLhqMAsbDKr8K55GigEc4lfhkjHEA55vQIdRLXeNISFpy+ZKYrBFkcCAFb07wQKG3wamt2YS8jk6kk/p8NDB0mTOeAzfOxWF/WuMv0ofCC5DsPNV7QdBa9OG0F4p6yc96EtTNnpfeZ8ytM90m95kQ1jL39Ebku3vlLG/oAF/IT3ceRMeWtwQ2PwVSOJYMht+t6xWXb41lP+FqgbCqLsjM2F5OIBBufs+yHneL/VcLphXu8SPFjWBIWSq8c8j+KtI+GZ+52re0ztdY8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757513676; c=relaxed/relaxed;
	bh=XGf6An9pkuacotas4PAUho44h/2LaY9ZaYpivcI6rZY=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=Mkvq2+P3xDEaAoSPMC1fPQu12JfL9T69Dnr/rgVXzDLMPcnuuSBYGsTvVvNuofRQ9SXyrEBRB9U170TQP67zpZulL9xgqSkAhjPrQUhHaa9kCrhv7PopaUaTeH+2oRzeQ/EeZjd+rkfjYLvnqmbxlk88siXlbVtD3qw3ViZqIZjCtetqq8Ms4GtVxOilEFyL7pa/72G8ve+3BjTNjucqAQOesVwZmSCeZch2jgH+JPl/3andFuHo497yQJKlZ7/6lRcN8897rgYfdh41Krxcl6ROoBK7BuBtXhchoGxR7I/PkZaT8f3u4IGwFUXxBeQlLSYQEeOMBKt/8sXwUPYL4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=permerror (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org) smtp.mailfrom=nod.at
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:195.201.40.130) smtp.mailfrom=nod.at (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org)
X-Greylist: delayed 591 seconds by postgrey-1.37 at boromir; Thu, 11 Sep 2025 00:14:34 AEST
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMN3t5d7Sz3dCH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 00:14:34 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id D2E8683E14;
	Wed, 10 Sep 2025 16:04:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id LaIcEPcDfBsv; Wed, 10 Sep 2025 16:04:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 1A4472FFDA5;
	Wed, 10 Sep 2025 16:04:34 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id X4a51J5LvQXj; Wed, 10 Sep 2025 16:04:33 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id C16AD83E14;
	Wed, 10 Sep 2025 16:04:33 +0200 (CEST)
Date: Wed, 10 Sep 2025 16:04:33 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev@lists.ozlabs.org, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
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
Message-ID: <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
In-Reply-To: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
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
Thread-Index: xOQifXk0CYTOSYO4gO/z6lk9BLmNXg==
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,T_SPF_PERMERROR
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Arnd,

----- Urspr=C3=BCngliche Mail -----
> Von: "Arnd Bergmann" <arnd@arndb.de>
> High memory is one of the least popular features of the Linux kernel.
> Added in 1999 for linux-2.3.16 to support large x86 machines, there
> are very few systems that still need it. I talked about about this
> recently at the Embedded Linux Conference on 32-bit systems [1][2][3]
> and there were a few older discussions before[4][5][6].
>=20
> While removing a feature that is actively used is clearly a regression
> and not normally done, I expect removing highmem is going to happen
> at some point anyway when there are few enough users, but the question
> is when that time will be.
>=20
> I'm still collecting information about which of the remaining highmem
> users plan to keep updating their kernels and for what reason. Some
> users obviously are alarmed about potentially losing this ability,
> so I hope to get a broad consensus on a specific timeline for how long
> we plan to support highmem in the page cache and to give every user
> sufficient time to migrate to a well-tested alternative setup if that
> is possible, or stay on a highmem-enabled LTS kernel for as long
> as necessary.

I am part of a team responsible for products based on various 32-bit SoCs,
so I'm alarmed.
These products, which include ARMv7 and PPC32 architectures with up to 2 Gi=
B of RAM,
are communication systems with five-figure deployments worldwide.

Removing high memory will have an impact on these systems.
The oldest kernel version they run is 4.19 LTS, with upgrades to a more rec=
ent
LTS release currently in progress.
We typically upgrade the kernel every few years and will continue to suppor=
t
these systems for at least the next 10 years.

Even with a new memory split, which could utilize most of the available mem=
ory,
I expect there to be issues with various applications and FPGA device drive=
rs.

Thanks,
//richard


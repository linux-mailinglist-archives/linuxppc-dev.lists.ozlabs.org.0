Return-Path: <linuxppc-dev+bounces-12012-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB71B52254
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 22:33:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMXSl3QP5z3dVB;
	Thu, 11 Sep 2025 06:33:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=116.203.167.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757536391;
	cv=none; b=TK0XDxL8R4ImBML+0vyHbGpLDeVC/PGP0sUC6nIusYrSPf2o6hxd6M4mUuDjY5Bu3rlVD/SdUWApQo/Z3O/eDefEpJ+G6BOPP50phnJXM4zi+alJf3Xqi9Bllifg+km4a91iH7/rAbo1spWvdFFT2h/ogUy/6hlwBFOzt3BRJRFRed1AFiwehVFEbrBNXmK7J/bqK7Rqk995tB+Nt+4NsnOQ5XvpfEzaTqHzSSQqmhfFX36g3Eblw2GDR12jUlBqLskmjnDDzaDwG+bQvpZXwoupyAVoGMhcXzl5lYwuUGLn6THJg8VlgtWm9Q18pe5Mgsq5ShvYaA4HHgp9FaVQtg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757536391; c=relaxed/relaxed;
	bh=Xn32CgfsCdcgiZc5xVsldvxbovwbLiKF6pDU6aeqlX8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=e9wp74Si4Q9H8mDiuTJ272ixdyJC7Yv0sebBiTmKwPDuBgKG1BIWtV5uUqQqRNZJDvLgEeNSJKWQ1g1BDAVnVWpVoPayZ4HjBM9JLl6eZ3WMbRJ46Eor1B7RG9Q7xcsY2vXqxBKtK467c+h3t5JwwI2PcdojO1aKVvqYV66OoalYck0vu6pcS+YTBtkA9xCxWer41CV+deyHfaCr9+7APoGyTdT04AzU1cM3VX9Ql96lSaF6D8ogYOKxWKSyXo94jbM/XRNo8PMQENCHye/oPgjGM69J69Ixw5kz4dj7zc/PkFZcBJpOB74x0Xno1kjaJHpB8L/Drhe2FkXVaLifLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=permerror (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org) smtp.mailfrom=nod.at
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:195.201.40.130) smtp.mailfrom=nod.at (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMXSk37YBz3dT6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 06:33:09 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 511D5CE34D;
	Wed, 10 Sep 2025 22:33:07 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id aSKreuvdlGXI; Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 4BFD3CE34E;
	Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id YO9RM-IU3T_L; Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id 082B5CE34D;
	Wed, 10 Sep 2025 22:33:06 +0200 (CEST)
Date: Wed, 10 Sep 2025 22:33:05 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Dave Hansen <dave@sr71.net>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit <ksummit@lists.linux.dev>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-mips <linux-mips@vger.kernel.org>, 
	linux-mm <linux-mm@kvack.org>, imx <imx@lists.linux.dev>, 
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
Message-ID: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
In-Reply-To: <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
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
Thread-Index: qX92QwLBi0un/69XQpQP6tb4aScRlQ==
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,T_SPF_PERMERROR
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Dave,

----- Urspr=C3=BCngliche Mail -----
> Von: "Dave Hansen" <dave@sr71.net>
>> Even with a new memory split, which could utilize most of the
>> available memory, I expect there to be issues with various
>> applications and FPGA device drivers.
> I'd be really curious what the _actual_ issues would be with a
> non-standard split. There are a lot of "maybe" problems and solutions
> here, but it's hard to move forward without known practical problems to
> tackle.
>=20
> Has anybody run into actual end user visible problems when using one of
> weirdo PAGE_OFFSET configs?

In the past I saw that programs such as the Java Runtime (JRE) ran into
address space limitations due to a 2G/2G split on embedded systems.
Reverting to a 3G/1G split fixed the problems.

Thanks,
//richard


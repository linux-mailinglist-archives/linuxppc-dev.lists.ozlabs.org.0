Return-Path: <linuxppc-dev+bounces-12679-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 420F5BBF2AB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 06 Oct 2025 22:15:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cgVrM70Jtz2ygH;
	Tue,  7 Oct 2025 07:15:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=116.203.167.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759781731;
	cv=none; b=COgzeGPvWsg+0YVMnC1Vme9YtnFM66+O7OlyZ8Mki4a4KrB3nGYcGiNXKxMH/wYSQswh3jqghJuHNxkzE5X3SYlYsTE1+WCsnOu6S8rk2IH5Xoi7rBDx9bFNe8AAu0vaJs4AGwhxtQd6wbAJVHNgrKuJwdjQ3mq2eRMO7aY6C36td/SyeGPoefIblK7ICgrTwxoCl+Bd9ZraKlpQh0RNmfbM3NCzviNIiNKcIrR0HWhqisiA2NCfq1BxoPXxq88clcwruORlZNILy/k2Fr7g0ffTcbn9JzqHj7rC4pvg7f1K1ZvmyL2UcDGjWbZCFEa39RixQQxsqMypwwADX8w+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759781731; c=relaxed/relaxed;
	bh=LhjB5H9mrCqOGAXj5HXNdyEVYPj6mQQyTvJX1KEHiMI=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=cZBXDbPnViDufXsJXl8BZatBPVOT3CswmIYDp+0u8y/MidkuS6jcSEectu67HYQgTGH+a9P0IvSOI9gygaOp8Aw0a4ZRZpSTLy+VcUS6G9r2qux8HrFPjsfy+ggPcN1/OzWWp2Tc8CMEi5olQKjYwuf2bXaCqSfM7VJQzIDTOFjtdCgwYat9ETeorItKNMJqHJ/FrXzDsr7dyuPHUMPQDm585iNIw9PYnc5jaTfzKZq1VCJCGwJSYlczEU3R6KpcrjFNs1lzWuuDHhnmEsi3cNt9NmG1jAJoxZMPK7qE5ewteNLz4zoDWdZjVuxjh/3KIggHGIltS3lCH4b98VNn2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at; spf=permerror (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org) smtp.mailfrom=nod.at
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=nod.at
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Unknown mechanism found: ipv4:195.201.40.130) smtp.mailfrom=nod.at (client-ip=116.203.167.152; helo=lithops.sigma-star.at; envelope-from=richard@nod.at; receiver=lists.ozlabs.org)
Received: from lithops.sigma-star.at (mailout.nod.at [116.203.167.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cgVrL61VCz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 07:15:29 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 853FF2B4F9D;
	Mon,  6 Oct 2025 22:15:23 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id JD4v2hnJ6q9P; Mon,  6 Oct 2025 22:15:22 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by lithops.sigma-star.at (Postfix) with ESMTP id 0C4012B03C9;
	Mon,  6 Oct 2025 22:15:22 +0200 (CEST)
Received: from lithops.sigma-star.at ([127.0.0.1])
	by localhost (lithops.sigma-star.at [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id j6VbrBHYDJpt; Mon,  6 Oct 2025 22:15:21 +0200 (CEST)
Received: from lithops.sigma-star.at (lithops.sigma-star.at [195.201.40.130])
	by lithops.sigma-star.at (Postfix) with ESMTP id B486A2ABFC1;
	Mon,  6 Oct 2025 22:15:21 +0200 (CEST)
Date: Mon, 6 Oct 2025 22:15:21 +0200 (CEST)
From: Richard Weinberger <richard@nod.at>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Dave Hansen <dave@sr71.net>, ksummit <ksummit@lists.linux.dev>, 
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
Message-ID: <1190290449.3827.1759781721487.JavaMail.zimbra@nod.at>
In-Reply-To: <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <497308537.21756.1757513073548.JavaMail.zimbra@nod.at> <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net> <640041197.22387.1757536385810.JavaMail.zimbra@nod.at> <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
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
Thread-Index: 4qe/Jvt6A7Z6bNoIFm3Eugvg7UbUaA==
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,T_SPF_PERMERROR
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

----- Urspr=C3=BCngliche Mail -----
> Von: "Arnd Bergmann" <arnd@arndb.de>
>>> Has anybody run into actual end user visible problems when using one of
>>> weirdo PAGE_OFFSET configs?
>>
>> In the past I saw that programs such as the Java Runtime (JRE) ran into
>> address space limitations due to a 2G/2G split on embedded systems.
>> Reverting to a 3G/1G split fixed the problems.
>=20
> Right, that makes sense, given the tricks they likely play on the
> virtual address space. Are the 2GB devices you maintain using a JRE,
> or was this on other embedded hardware? How common is Java still in
> this type of workload?

Sorry for the late reply, I was on vacation.

No, the devices with the JRE issues are from a different customer.
Since I work as a consultant lots of strange issues get thrown my way

I wouldn't say Java is super common but I still see it from time to time.
=20
Thanks,
//richard


Return-Path: <linuxppc-dev+bounces-11978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16859B508EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 00:39:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLzKF3gs4z3cZ9;
	Wed, 10 Sep 2025 08:39:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757457585;
	cv=none; b=evGrS2o1qNA1E0iunZ7C0z3uLhKGDwEdC5mxugb8PvzhlB63PUE62GrAIdFkL7hG6DSVh5cOUIanbYKHKwwRWl54xRNwS0YkrxKcQsvX2BwkjiId3O04yD4xJcr1jVTsfiXrkKQ0EpQSKxf3OCVJkRWike56KWSnqpYa9DuA2OLv3sUWszYZRZXy/MRkrj0fW6yw/d0JFwr/PKarZ+Tl/PuvkKe2esSnM8j1IleseuManxNeiswb0HNh17WPIGa+C6yoIn72LZtrgUZZ1ai9Ot63Elcyy7sTO0n1CG4UCvs0E/piYeodBAEIm5isexig3Oc0blF/nW12eI00taQADA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757457585; c=relaxed/relaxed;
	bh=o4pJzl4BWqncjRLwqdCVSmCaOJCq8m9Ifms3vJmzKBM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=QxM3Onvssuaq3vH+yQM4Zx2SfWRQ8rcLg2Vu+5bIbJRk67s0ts0wcHagfTV4DjtiP2BDD9QO0Riy0W9/S4JvZ6ZzDNpvrvzJIWeXm2AFAjlGJyXkW6FiVzY7NqosRIedaAKehPZ282wIQIpCbtG0vLv93cLno5SaSLQEpv088U4gwllvPvPBw/ZpI6GoMDkuCesM4MGmaok2dmNQqEBVVcU11JEyuCULcGxS0xlXxWsvm5d5QYoFYiXELXDe0KpmvORY55Ilui4hkgFPiz4fqAq2kwaw//nZ0mPbjNRKXsSxQsbJ3yPeDcLAbTT9v4h/OJB7iMdnm0/JBD2sT1aOZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025082201 header.b=TvOUc/rv; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2025082201 header.b=TvOUc/rv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLzKD39wZz2ynf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 08:39:43 +1000 (AEST)
Received: from ehlo.thunderbird.net (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 589Md5a71810392
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 9 Sep 2025 15:39:05 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 589Md5a71810392
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025082201; t=1757457547;
	bh=o4pJzl4BWqncjRLwqdCVSmCaOJCq8m9Ifms3vJmzKBM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=TvOUc/rvPHuoAgZik4kP6Jrk/1+TPY9+I66slCEYRMAAVaJliSrzt+2sOFL7uxfep
	 TkUyZI254fJRZ0lrODF9atINh0A8S4jLrAmCkJHU6JXLFZKZC0KSUVdi0tmre9KWKN
	 XbKdciAhvqcaNOwc7fFmyUBOA5BxnpqIS4Eb0rGthQiBgS5HHj+CzVzQJOWVF0iflT
	 tgpvUETHe9/40V2F6BCYuDmvwT7GfqNk48CbFXskPApkAJTXDi/C8HYPbnObeJPLQM
	 4VGzdB3lbm4UCWwMufH5gTZgR2KMO3DzwNg9CgZkrpc9Dml+J/eRl9RSkkGtbvpN2l
	 PQy3pTIde+vBg==
Date: Tue, 09 Sep 2025 15:39:05 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
CC: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
        linux-mm@kvack.org, imx@lists.linux.dev,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Richard Weinberger <richard@nod.at>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ankur Arora <ankur.a.arora@oracle.com>,
        David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Matthew Wilcox <willy@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Suren Baghdasaryan <surenb@google.com>,
        Ira Weiny <ira.weiny@intel.com>, Nishanth Menon <nm@ti.com>,
        =?ISO-8859-1?Q?Heiko_St=FCbner?= <heiko@sntech.de>,
        Alexander Sverdlin <alexander.sverdlin@gmail.com>,
        "Chester A. Unal" <chester.a.unal@arinc9.com>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        Andreas Larsson <andreas@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com> <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Message-ID: <F6A7C7F9-54F0-4E97-B21D-FD0EE023B986@zytor.com>
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
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On September 9, 2025 3:24:29 PM PDT, Linus Torvalds <torvalds@linux-foundat=
ion=2Eorg> wrote:
>On Tue, 9 Sept 2025 at 14:39, H=2E Peter Anvin <hpa@zytor=2Ecom> wrote:
>>
>> 1 GB systems used highmem too, sadly=2E And 1 GB was the norm for a big=
 chuck of the late 32-bit era=2E
>
>Well, while on x86 1GB systems did use highmem, they'd typically not
>use very much of it=2E
>
>IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to be
>exact), with something like 120MB highmem=2E
>
>So they'd either lose a bit of memory, or they'd use the 2G:2G split=2E
>
>Or - and I think this is the main point - they'd stay on old kernels
>like the ancient museum pieces they are=2E
>
>I'm not convinced it makes sense to have a modern kernel on a museum piec=
e=2E
>
>         Linus
>

Certainly=2E And the 2:2 split is probably the right thing for the old mac=
hines anyway=2E


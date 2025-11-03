Return-Path: <linuxppc-dev+bounces-13681-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E5FC29CDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 02:48:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0DyY1MF5z3bpS;
	Mon,  3 Nov 2025 12:48:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1098:5b::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762134533;
	cv=none; b=cMYmbQLpmNTVb1XQStE0wqmvjI5WTntx529b/rA15CHwOJ4F0Yd+jlamsvCosWLbzi2AB1+QzS0PwO+aWFq0ZiTs6sSI+fvjWvc1f/olsvHci8iUqsZHsss6w3UAfVodFWo1zYGQ+iT088V5cvONZi24iYEiup5zmzyCiv8b9G7ZuapZRaEIyqyN/4wDrKlZqEwSz1jdWburwKIY6g4gUzJ86bZkFBwi3q9ayZ7MWo9NpzjZXy6/leuvzT3Nje7yL+QPJC7IT5uHTtWZiTHETXJvy9ebUPIATWYQKlSrats5gVw3xRIgsnmvsSeSVkm7Q4yrGe1oCfw82pvwowji1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762134533; c=relaxed/relaxed;
	bh=l4/ObVuIt7UOD/QW6630dekGZj3RSJD8DWfo2+YTWOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=biqmYjemJErFhdtzw/7OGPn1Bm7CcBt0+E+uM/KokIqdSja3zAXjUw65tYXcimyM9m9L0CcFMtwS8uz4G86NkryLBT5XkjaKKnmli8aFcAfJTofsv82bYl2ZJhv+mlCjMckfGrNeGKCec5zT1a9BVF0OW4H4hEj45VNYRagTl+oA81Iwkfws7agC99Nq1ATZia2fmlpvZbskPvkwg7LQnS5zMT/Pd04lZl1cfvXk0wfdtOP7NbnCdCoG8+SqgK5uX8OFEY9w+3lIADZAjUEgq9pKnMTphycpbJDr4h0y4/jMGg6YF7M5lqj2RNUOu2DN/E5AZyWtIptqm1jLFW6SlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org; dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=XmbgW3S6; dkim-atps=neutral; spf=pass (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org) smtp.mailfrom=treblig.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=XmbgW3S6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0DyW1wCXz30RT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 12:48:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=l4/ObVuIt7UOD/QW6630dekGZj3RSJD8DWfo2+YTWOk=; b=XmbgW3S6VCsRsm46
	1LTsab+aVcjrj1ts/Y3mnJOlWtNz6hHwWGQLpRBXWYAKAfQ1EqEhN139HehE19dhw8tFXRrsa8JKB
	l8SapWvl2IQcscJFHyOwbW6L9LrrGIOEzPmh8+S6VRgRi4UAiK448c+3ihAd9DeecaPV6F0sudqp9
	NEgrWmmeg5u9PIJSXmfZpzCQVWCCHl+XYqUTtn8Qjzuad710o8matxi2MFlw0vNOWRi1rdOBEKAJp
	0WW9p0LSHfvIoc0I66uZ8GJC2E9v+a83rSYbFSTAhikuk6TCHmComVdd0rSB4bYVjf7Rmg9dFkkwo
	mPj/FrCR90qp1lvTqg==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1vFjgV-00000001ajA-1fNO;
	Mon, 03 Nov 2025 01:48:39 +0000
Date: Mon, 3 Nov 2025 01:48:39 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Stan Johnson <userm57@yahoo.com>, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, sam@ravnborg.org,
	benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, rdunlap@infradead.org,
	Cedar Maxwell <cedarmaxwell@mac.com>
Subject: Re: [PATCH v4] powerpc: Use shared font data
Message-ID: <aQgJ95Y3pA-8GdbP@gallifrey>
References: <20230825142754.1487900-1-linux@treblig.org>
 <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com>
 <aQeQYNANzlTqJZdR@gallifrey>
 <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 01:43:41 up 7 days,  1:19,  2 users,  load average: 0.02, 0.04, 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Finn Thain (fthain@linux-m68k.org) wrote:
> 
> On Sun, 2 Nov 2025, Dr. David Alan Gilbert wrote:
> 
> > 
> > So I'm not a PPC person specifically; so lets see if the PPC people have 
> > any suggestions, but:
> > 
> >    a) Do you know if there's any way to recreate the same hang/works 
> > combination in qemu; I know it has a g3beige model but I don't know how 
> > to get something similar to your failing combo.
> > 
> 
> I guess we could probably reproduce this in QEMU if the BootX bootloader 
> could be made to work there. In theory, 'qemu-system-ppc -M g3beige' might 
> work.
> 
> >    b) Can you get any diagnostics out of the prom on the mac?  Like a PC 
> > or anything to have some idea where it hung?
> > 
> 
> Well, that's the problem: if you enable the CONFIG_BOOTX_TEXT diagnostics, 
> the system hangs instead of printing stuff. If you disable the 
> CONFIG_BOOTX_TEXT diagnostics (in favour of serial diagnostics) the hang 
> goes away.

Ah, a bug that doesn't like to be seen :-)

> Anyway, I imagine that the problem with your patch was that it relies on 
> font data from a different (read only) section, which is unavailable for 
> some reason (MMU not fully configured yet?)
> 
> So I've asked Stan to test a patch that simply removes the relevant 
> 'const' keywords. It's not a solution, but might narrow-down the search.

I wonder if this is a compiler-flag-ism; I see arch/powerpc/kernel/Makefile
has a pile of special flags, and for btext.o it has a -fPIC
(as well as turning off some other flags).
I wonder if bodging those in lib/fonts/Makefile for lib/fonts/font_sun8x16.c
fixes it?
But... this is data - there's no code is there - are any of those flags
relevant for data only?

> >    c) Is this only the Powerbooks that are unhappy - are other Macs OK 
> > with this - if so, wth is the difference with a powerbook?  Is it a 
> > different debian config or something?
> > 
> 
> The BootX bootloader doesn't work on New World systems, which is probably 
> why we don't see this regression on anything newer than a Wallstreet. 
> 
> It's likely that other Old World systems are also affected, if they are 
> using BootX. We don't yet know whether the regression also affects Old 
> World systems using the iQUIK bootloader instead of BootX.

OK, remember I don't think I've ever tried PPC via MacOS booting, so not
familiar with it.

Dave
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/


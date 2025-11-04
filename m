Return-Path: <linuxppc-dev+bounces-13756-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27B0BC327DB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 18:59:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1GRm17gfz3bfX;
	Wed,  5 Nov 2025 04:59:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1098:5b::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762279156;
	cv=none; b=ErWU2/HD1lhzLi2Gj2PP0jjtRH+jp2nKKEtN14/UylbC7S1qE2pEPJMwBos9DQzxcNBkjLpvwgvHm9Jt++L9T433fhoH+bILqvJxlUJgmCc3+tzK+ZZJGnmnYQPk466LhvLywqIYOt/GW4vsTire7iR8vQSXQlWblp9SN4fwl12jQe783z1pulq/RhtNS9YyFWnGNQBQ3D985P48J1cL3ICxNDH+UXP0FVCeCZIDK8vABmE3tHePjH9R5p9qEf+wSk9hMqKpk3v1JmT6Q+CgnwWI8mNwqQqO2lWRr9nWw+A5oYnaxQJjheQcyKZSuVVUrUeTt6l64EQAhLYc0zWjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762279156; c=relaxed/relaxed;
	bh=J2T93GZ4iRg/mXaOUM2wPtUcrFT6Ce80fUC5fly//tg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GF0US4/zBZTQut7548c902azrbaOHYWbU0NDQBEM2UeA+BkTKTIMVOxTG6M0nzlQICs26xK9H0FeSPUqQQvfa+DZ75DeobsZ3OWI23dqrqh4dQ4Sx+YYrct+9t3KA2h9m4YmDGRd/9VEWY9WFIT2zNgGFQ16oS4tPBnNptVQZl4ZQgZvfTaOAcYNgm3JWH0rEarovLOa3JeXLArS651VNPRI9RgkoTLkXNODRs813wik4xWhiomkuTdU/YdrsMjDe4IpgIhOr/U6rGLAiZrZAg9LFOLMafBBIs91uBGEQQJ46wNBrKZX99joMc4gBjkfGrqDi9u/gjlU3+kIj6LDog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org; dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=FR7PPXiR; dkim-atps=neutral; spf=pass (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org) smtp.mailfrom=treblig.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=FR7PPXiR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1GRj39QTz30V1
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 04:59:12 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=J2T93GZ4iRg/mXaOUM2wPtUcrFT6Ce80fUC5fly//tg=; b=FR7PPXiR6QTPHE7f
	JNYRc8Pv8zmiwEXXZZiML1cGSQ/67sPPxC66c5986choXJCJQo2Ts6kk7lb3rrYmlCaIiOPc5tdyY
	rVA8BmEjDqmB3Gkxkwyd8DUVarGegVTrbeqf2d9QgYSTM9swAM/yh5ORVzF+6AbkLCwM0PN7vBG4p
	bz1WV6OvaTJwt9BrRtr0MLWSqRH76f+MelLBCGGDq2pMw9XVY5EmJx2w+M4UEK15Q1gqH1EduPO7J
	ZZjgdX1ul6cXtnbc4nPt9CosEDsAXm+8DZsV1yyYgQtlYe3TXN/Ttte/H5O8dG6R2r4zYpYcdkKdq
	59PqQ6+C8O/NfqOByw==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1vGLJ7-000000020YW-49uU;
	Tue, 04 Nov 2025 17:59:02 +0000
Date: Tue, 4 Nov 2025 17:59:01 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Stan Johnson <userm57@yahoo.com>, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, sam@ravnborg.org,
	benh@kernel.crashing.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, rdunlap@infradead.org,
	Cedar Maxwell <cedarmaxwell@mac.com>
Subject: Re: [PATCH v4] powerpc: Use shared font data
Message-ID: <aQo-5T8z2nwtNe2p@gallifrey>
References: <20230825142754.1487900-1-linux@treblig.org>
 <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com>
 <aQeQYNANzlTqJZdR@gallifrey>
 <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org>
 <aQgJ95Y3pA-8GdbP@gallifrey>
 <797f0a13-350f-e26d-f1ef-876419e1c013@linux-m68k.org>
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
In-Reply-To: <797f0a13-350f-e26d-f1ef-876419e1c013@linux-m68k.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 17:58:36 up 8 days, 17:34,  2 users,  load average: 0.02, 0.02, 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Finn Thain (fthain@linux-m68k.org) wrote:
> 
> On Mon, 3 Nov 2025, Dr. David Alan Gilbert wrote:
> 
> > 
> > > Anyway, I imagine that the problem with your patch was that it relies 
> > > on font data from a different (read only) section, which is 
> > > unavailable for some reason (MMU not fully configured yet?)
> > > 
> > > So I've asked Stan to test a patch that simply removes the relevant 
> > > 'const' keywords. It's not a solution, but might narrow-down the 
> > > search.
> > 
> 
> Stan tested my patch to remove 'const' from the font_desc and font_data 
> structs but it did not help. (There goes that theory.)
> 
> > I wonder if this is a compiler-flag-ism;  I see 
> > arch/powerpc/kernel/Makefile has a pile of special flags, and for 
> > btext.o it has a -fPIC (as well as turning off some other flags). I 
> > wonder if bodging those in lib/fonts/Makefile for 
> > lib/fonts/font_sun8x16.c fixes it? But... this is data - there's no code 
> > is there - are any of those flags relevant for data only?
> > 
> 
> I don't know. But I'm sure Stan would be willing to test a patch for you.

Can one of you point me at the config you're testing with so I can
try some builds with it.

Dave

> > > 
> > > The BootX bootloader doesn't work on New World systems, which is 
> > > probably why we don't see this regression on anything newer than a 
> > > Wallstreet.
> > > 
> > > It's likely that other Old World systems are also affected, if they 
> > > are using BootX. We don't yet know whether the regression also affects 
> > > Old World systems using the iQUIK bootloader instead of BootX.
> > 
> > OK, remember I don't think I've ever tried PPC via MacOS booting, so not 
> > familiar with it.
> > 
> 
> I will try to set up a MacOS guest in QEMU, to see if the hang can be 
> reproduced that way.
> 
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/


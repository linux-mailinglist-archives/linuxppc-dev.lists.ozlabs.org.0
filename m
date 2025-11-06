Return-Path: <linuxppc-dev+bounces-13877-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 47729C3AC85
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 13:07:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2LY92ZmKz3069;
	Thu,  6 Nov 2025 23:07:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1098:5b::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762430861;
	cv=none; b=HxhbmoocQxlBenC/Q0HnR34CKgssiclXQMqPa0PKqKhSjPUU5MGRwHMdLbhVpJUhbaF7kF8c2iv53GGQUmi9EpMgVL+uDApSPimsKyC/axShmFz+p23xuUtQLgR2yPorlrkEs73uBn8C3L6pQ4d0QmaoqmrYwRPzHyU9i2JRICPBNCyN52DOlp4lsEXbjO2PfXIxN1EgJTNSXAI6bFMNJGDlDZ63SmM7mxwlpAFiUpMLwiZKmagnTfqUpsjwtq0k37iJ4PtiQcZwvyn38M2NsaDQgoXrX+DzeSdmCjNx1v1o8ETaIhJ2R3F6c9JPZ8qZDKaTneFnRiWSEvdlYH9NdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762430861; c=relaxed/relaxed;
	bh=UetBbdwHupT5BrAMXNrAwwA6NJt7jvzEKFrFEbUdlxw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKG6ULcWm/7oHaTRtwFjhGY/v+NAFuc0nfVpxaFO2Kehgc3/xDjHQh2JYlCDdgMmnJrJwqk+Vdln/zz+oiTSrUnstCd8N981DBpO50mvfDI45BM5NlVmx9RvFomzHuUC7MSrhzqmsVnXFEqtLRPL78I1QdS5zYowz/MqqcSKiagqBUe7Cpq8ZrGS7G0ZIZZWp4+qw87KV818QVkZAz4v+0teCIlm6jqBM8qnY/7ofkpKp+hu+HroI3nEGJjnDnu+sjr9bsdSIo0Z+KPFJX33sHj9IxCrp2aPDl4Wmy7Q810mvGCS7LvEz/P69RJoDMGp4Hscw2HHgwThpKnAQixIjg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org; dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=Ocd0jOJ4; dkim-atps=neutral; spf=pass (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org) smtp.mailfrom=treblig.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=Ocd0jOJ4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=dg@treblig.org; receiver=lists.ozlabs.org)
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2LY653RPz2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 23:07:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=UetBbdwHupT5BrAMXNrAwwA6NJt7jvzEKFrFEbUdlxw=; b=Ocd0jOJ4vO+WwI61
	UJ+PA4vA3na5VIBiIckbXEu5p54VWe1UdcvLk1uQbTYWPwL0NmoauEH6xb2R7uxqRSjbsIBlCjwJI
	GlH9N1SkMK/kQPKRvPssAIWi4lTQioRDoY3lPjgljPwjW6e4BUGHJODdZwQzhsjHFvwXiRQHw43np
	hplWbqKIMkYrO0DVIMpNyrgmxc5KcxePUOJeWOZ2gcZbB/7Rkf90s6DXO7ZURdUFlY93Lf30YV56N
	f0QN7+3d7lk2w+acWVphHF7KixqdyQA9e72BwyiY3IHj8VCEICrBSd9aZCYd94ilRm4e2bqyLW65I
	09byKjtuAkOqeBkORQ==;
Received: from dg by mx.treblig.org with local (Exim 4.98.2)
	(envelope-from <dg@treblig.org>)
	id 1vGym3-00000002QZV-0uDZ;
	Thu, 06 Nov 2025 12:07:31 +0000
Date: Thu, 6 Nov 2025 12:07:31 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Finn Thain <fthain@linux-m68k.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Stan Johnson <userm57@yahoo.com>, mpe@ellerman.id.au,
	npiggin@gmail.com, sam@ravnborg.org, benh@kernel.crashing.org,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	rdunlap@infradead.org, Cedar Maxwell <cedarmaxwell@mac.com>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>
Subject: Re: [PATCH v4] powerpc: Use shared font data
Message-ID: <aQyPg1EfDEYF4wB1@gallifrey>
References: <20230825142754.1487900-1-linux@treblig.org>
 <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com>
 <aQeQYNANzlTqJZdR@gallifrey>
 <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org>
 <aQgJ95Y3pA-8GdbP@gallifrey>
 <3cc3d311-35b0-42f1-b20f-ed59391bb8e0@csgroup.eu>
 <ead4ef3f-9f8c-a98e-b48d-f052bc9492d0@linux-m68k.org>
 <994bea8c-7b28-4aae-a6b3-e4f33731cb29@csgroup.eu>
 <b4737133-a33c-f4d1-cc4b-0c0b70c45635@linux-m68k.org>
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
Content-Transfer-Encoding: 8bit
In-Reply-To: <b4737133-a33c-f4d1-cc4b-0c0b70c45635@linux-m68k.org>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.12.48+deb13-amd64 (x86_64)
X-Uptime: 12:07:13 up 10 days, 11:43,  2 users,  load average: 0.09, 0.06,
 0.00
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Finn Thain (fthain@linux-m68k.org) wrote:
> 
> On Thu, 6 Nov 2025, Christophe Leroy wrote:
> 
> > Le 06/11/2025 à 05:11, Finn Thain a écrit :
> > > 
> > > On Wed, 5 Nov 2025, Christophe Leroy wrote:
> > > 
> > >> 1/ Either build font_sun8x16.o with -fPIC
> > >> ...
> > >>
> > >> 2/ Or add a PTRRELOC:
> > >> ...
> > > 
> > > Thanks for your help with this, Christophe.
> > > 
> > > I fixed up the whitespace problems and forwarded those patches to Stan,
> > > along with instructions for applying them. He tells me that patch 2 fixed
> > > the hang. Patch 1 did not.
> > 
> > Fine. Then let's use PTRRELOC.
> > 
> > Will you or David submit the patch ?
> > 
> 
> OK, I'll submit the patch.

Thanks!

Dave

-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/


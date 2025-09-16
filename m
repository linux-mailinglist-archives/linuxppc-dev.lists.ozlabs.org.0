Return-Path: <linuxppc-dev+bounces-12294-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D606B59E7B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 18:58:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR7QC0prsz30NF;
	Wed, 17 Sep 2025 02:58:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758041907;
	cv=none; b=U+z8jw4snZt1wUPJRa0v6bpxLOgIg5rUPAXrX6GdYarcHqkwfK0NpKvDECmHpvbd1lfW9cKEETG6OFZ1yQvFWWI9ukctZETRY5OPYoWWuLcUzJeHI6km2O7NQcvdqYeJbLLbGYGzF9mx7b+jyC2Pj4dZsE9R8wfnAysEie5lGACZmLIEDEnRIyLO4HSo9XpeacUliZhRYvODuJ6FZSIuz6TOC8+HBuzmhioxLprX5uJhrlfTKj0gGy1UtGJKMXF1hG7OlBSblNBjSCGLUITZoVbxXW2x/Wse6lhRoZ+M7t9/GawmaRu3tCzJssW3/0ArDaBWj//ELk2Z9bZgsPzI4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758041907; c=relaxed/relaxed;
	bh=RtBoZ/xmGOPxWtq7vnJ4P8VImUzPAj6YYsLjvymQtyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RH5YYL2LTgJkRPLkpe4DFQrRygdAmwwwK0pujwSjkHUsV85z79bgfxzOy41kKY4fafEpxAgGq+KkZPQX608pN6DvLs5VJIOiknvmC3+qLchGuBZd9ZhFsrFAXJKlGpJWQTXC/g6By08KeG7QUskVdbnVslUcpoZ/eDPN5+Uz+P78haxRhRerjdWRIdYlITwl3hgzMczI59hcpekbqYIHt+CCWWW5vczarwGml30++Jj5vTFXhUm0U4ybdisAzO977S2Ti2IDDLYwFtf9/bWeY/a+IGyZqIluvKRgiu55X9z9pLsB8uoqIKRsavExBh/C7515TeN1eZHxBAgkiBg/mA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR7Q93wZ4z2ygH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 02:58:24 +1000 (AEST)
Received: from gate.crashing.org (localhost [127.0.0.1])
	by gate.crashing.org (8.18.1/8.18.1/Debian-2) with ESMTP id 58GGw3PJ300101;
	Tue, 16 Sep 2025 11:58:03 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.18.1/8.18.1/Submit) id 58GGw21P300100;
	Tue, 16 Sep 2025 11:58:02 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Tue, 16 Sep 2025 11:58:02 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Ash Logan <ash@heyquark.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        officialTechflashYT@gmail.com, "A. Wilcox" <AWilcox@wilcox-tech.com>,
        Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: 32-bit HIGHMEM and game console downstreams
Message-ID: <aMmXGjT6Nne708Xc@gate>
References: <3e8cb683-a084-4847-8f69-e1f4d9125c45@heyquark.com>
 <432e049f-886d-4734-ad59-52569a796046@app.fastmail.com>
 <11e667d6-2210-47f0-a9ec-a134a60e138c@heyquark.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <11e667d6-2210-47f0-a9ec-a134a60e138c@heyquark.com>
X-Spam-Status: No, score=-0.0 required=3.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Sep 16, 2025 at 11:57:00AM +1000, Ash Logan wrote:
> On 13/9/25 23:52, Arnd Bergmann wrote:
> > The smaller devices are probable getting problematic sooner, 96MB
> > in the Wii is already really tight and this only gets worse over
> > time.
> 
> The maintainer of that downstream claims to be able to boot modern text-mode
> distros on the GameCube' 24MB, which I find really impressive!

Hey, I still boot up my imac G3 sometimes (if I can find a keyboard for
it!), it has 64MB of RAM and that needs some handholding to boot already
(the zImage needs some manual header editting to fix its load address,
something like that).

But booting it does :-)

> > Just to be clear: there is no general 32-bit deprecation going on. When
> > I talked about phasing out 32-bit platforms over time, that is purely
> > going to be those that have no users left, or the few ones that are
> > causing more work than they are worth. E.g. The ppc405 ones got
> > removed recently (after many years of discussion) because they were
> > making ppc440 maintenance harder and had no known users.

Good good good.  Way too reasonable!

Thanks,


Segher


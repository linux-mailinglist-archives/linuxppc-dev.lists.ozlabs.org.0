Return-Path: <linuxppc-dev+bounces-10358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 356D1B0DD8D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jul 2025 16:16:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bmfT85bySz2yhb;
	Wed, 23 Jul 2025 00:16:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753193788;
	cv=none; b=J/x1ELyoetYlIFQ03SVNIH2l8D0OnrALcpAtmgZiMywIUd0JxI8PbO5zaho6yDmlPo6j75LshTgrz6ky41xjVlxTzrtIMhoYIjGORTEzHhNjhSR7c2cLxG8X0T5yfR2L7B7lKQEUtZF2xZY0oOy8FPQe+VnoPtGx7mMuGJuRdk0GpIGXktueAbNsVJVG6lH736NPh70cDHGcbAjxEJnN8RPVBab9ekFzOgG4mtXWGHhaUIIasLtSQi7EDJdkju4WXCQ1pr8vxvHeodFYWKO8pTyKjHFgCsP4bNpoJPSDjk359pGa94RrDBxVqeiwRdDWVmAEKgkodZgj2MEl/42IPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753193788; c=relaxed/relaxed;
	bh=NGHIfZZg9vCV7ObhM8p6DUd8A+06EAeVw0cw3XCBIHA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YYelUlrVV4gFh73Zdtdl/H3ol1T1n8LQLgogesKCom7NDn4UyVVAApBzenm6YSuKx+XRABVc3Z3/DA6Vqk2NYDbPQfXIkL/XMvb+brrcTgYRlNGkZC3HwqvB82vNRR/7DmyRhUeP9NepwoBJ64mGLRUuNuKh8w4kow2x0Plq/ebfm9mkD9k4mxTVZpwlJi5NaLdQZZdEq3v6sRdNjE0VMhlm+oHYFop7ViBQPfSZ8HNiGTFyCQ7JuSpTT/FdTl7gDugpjgLsvSot9vvLLZVGZBYQrpCNzI3seEUDyxd/H60sTVM51RCyEqitHy/q3Hx4n4RIaEBuhd2bVEA55OC8aw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ei5JrRZT; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ei5JrRZT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bmfT73gvsz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jul 2025 00:16:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 795766112A;
	Tue, 22 Jul 2025 14:16:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B386DC4CEEB;
	Tue, 22 Jul 2025 14:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1753193783;
	bh=lvlIsTL0552lQuywV3G4MsYNUlFAfmcSfSeYBIIh/yY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ei5JrRZTyN4C5B/4kFm4mwRhz+yqyweq7Xu0VMe2JC6B36JyEJjvIhc0YpT2ob8/3
	 uIgaSeOb/sndGFzmsiBkJyC+aljVAtzdyWS/X4+aylan5gA6gM89fmmOlI1Hv+6l5T
	 FMUDpu5MUXtgb06TpotvnTRYwnOAeo49xyDNAkks=
Date: Tue, 22 Jul 2025 16:08:09 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: x86@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] syscore: Pass context data to callbacks
Message-ID: <2025072218-decipher-spree-327d@gregkh>
References: <20250717103241.2806798-1-thierry.reding@gmail.com>
 <2025071716-phoney-object-1648@gregkh>
 <rzbzah5iigz25jtxyqadnitkzkazxsaxntajhlfrfdslyioevk@pylcjkfh5n42>
 <2025071919-patience-cattishly-cf7c@gregkh>
 <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
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
In-Reply-To: <l54i36uk33je744w4f47tehdopk5dsjotvozfv5b2hehmxrwpq@eins7awyq4dy>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 22, 2025 at 03:56:40PM +0200, Thierry Reding wrote:
> On Sat, Jul 19, 2025 at 08:52:41AM +0200, Greg Kroah-Hartman wrote:
> > On Fri, Jul 18, 2025 at 03:49:37PM +0200, Thierry Reding wrote:
> > > On Thu, Jul 17, 2025 at 02:11:41PM +0200, Greg Kroah-Hartman wrote:
> > > > On Thu, Jul 17, 2025 at 12:32:34PM +0200, Thierry Reding wrote:
> [...]
> > > 	struct syscore;
> > > 
> > > 	struct syscore_ops {
> > > 		int (*suspend)(struct syscore *syscore);
> > > 		void (*resume)(struct syscore *syscore);
> > > 		void (*shutdown)(struct syscore *syscore);
> > > 	};
> > > 
> > > 	struct syscore {
> > > 		const struct syscore_ops *ops;
> > > 		struct list_head node;
> > > 	};
> > > 
> > > Is that what you had in mind?
> > 
> > I missed the list_head, so yes, this would be better, but don't pass
> > back the syscore structure, how about just a void * instead, making the
> > whole container_of() stuff go away?
> 
> Yeah, that's a possibility. I personally don't like passing the void *
> around because it's easier to make mistakes that way. I also find it
> unintuitive because it doesn't immediately show you what the functions
> expect.
> 
> My understanding is that the container_of() should get optimized away
> most of the time, so there aren't any obvious downsides that I can see.

container_of() is just pointer math, but a cast is even faster :)

> But I don't feel very strongly, so if you have a strong preference for
> void pointers, I can do that.

That's what you really want to have here, it's a syscore data type
thing, that the callback wants to reference.  Just like a irqrequest_t
function passes back a void * that the handler "knows" how to deal with
properly.

thanks,

greg k-h


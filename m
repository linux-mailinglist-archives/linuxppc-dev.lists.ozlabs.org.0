Return-Path: <linuxppc-dev+bounces-6397-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 717FCA41257
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 00:48:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1LCX4xycz2ytN;
	Mon, 24 Feb 2025 10:48:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=165.227.176.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740354488;
	cv=none; b=oMlJ0F+yWSrD0xz1tZC755hDWBfqvKJY7UszAAh80s2i6EicCz27HRdAvbMu2Rz1Pp947ZLHPOlRk8D8Shnb9B1UTswhHSQ/f9VTs7g8VIs5jmTbJbZohmhG++YR9jM8A7i5GAQNSua545AT/YO1GQWTPtHGE7bLRbtzUMPMkRfqmmkrlEfwVgxJtoQuqvDXOdq7nfaWcYccMUcTx0L8gBrN8MnprixG7QexxWElJ0matMc/93yY0ha4wUEHjxWgttpYUx0y+LMkS6qm5UGLQOqMTRT8bvTfmotMOc1ED10XZ1RYTJqotz3tjJ/q45rI4xZOJIOzMuAZRpjd+P0VwA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740354488; c=relaxed/relaxed;
	bh=ESEjuP0qNKG7M31LDxN5dSH9PUQiZX8A161LNfHK2gs=;
	h=Date:From:To:Cc:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Subject; b=CpSgQFgI6Fvr74/qQHj1x9vFuVplpXYns9oTYXYyyKyHKQhGetALdsSYMFKI/5s56XJzUNMegsjpDcjOwD8IKj8SrwxjThmbSePyWgwD1cg0e3aliHNN3p+sk97Z2PfSwpZhoD+cmtR8/8g74adj6KzijyZCcX8ra9Nrl6RiIX5HyaXAvuzhVTfTpamAT2ncmw2Y1Y2BTJEToBOL+E4MATCGQzIFpq1xMrjuPGq/04z+Qax3nzceyiRyAvdNdC69HE/OlycoE9YtndksA92DnCXedWvziSOdbU+mmY/qu98C0+xq8/gzN87eiIEZ3iY3U0PUfwdl95wBSn5f5e2bMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=buserror.net; dkim=pass (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=1+v+ww0e; dkim-atps=neutral; spf=pass (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=lists.ozlabs.org) smtp.mailfrom=buserror.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=buserror.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=1+v+ww0e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=lists.ozlabs.org)
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1LCW1xB8z2ysW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 10:48:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=buserror.net; s=rsa_sel; h=Subject:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description;
	bh=ESEjuP0qNKG7M31LDxN5dSH9PUQiZX8A161LNfHK2gs=; b=1+v+ww0eli53gNR6dEhBDOqi2B
	mrW7UtVHR4Yzh81YhZxcdbGJtdQbX0Wu/Ew7/1BUBebZUQQ8ArhhfBhL/GJ0C1qpVgStWr8RVCCMk
	5GjYDXmpB2WORXvs59CtqCoEoNWh+fxUYKMgEsuxU7LV9qRHumXtRtcbpHRb61IuAQ/ildErwsOAH
	FJyH0AnNYosXBzEa8H9KKSFQM3sQ0+8qXyzLk8KIPl1Zb7H+jvVMtD6XvhIgW+7dEPA8EtsmFO/jE
	/4gfAdWIyG1k5Utcfe66gKke/O3HjMVSXUFscRPdrWWMViDr399GxelCcOF1PMttz5jRwigl2yYHE
	PoRjdYtQ==;
Received: from oss by baldur.buserror.net with local (Exim 4.96)
	(envelope-from <oss@buserror.net>)
	id 1tmLfR-00ELyd-2y;
	Sun, 23 Feb 2025 17:45:50 -0600
Date: Sun, 23 Feb 2025 17:45:49 -0600
From: Crystal Wood <oss@buserror.net>
To: Rob Herring <robh@kernel.org>
Cc: j.ne@posteo.net, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org
Message-ID: <Z7uzLeXiXIdVYNM5@buserror.net>
References: <20250207-ppcyaml-v2-0-8137b0c42526@posteo.net>
 <20250207-ppcyaml-v2-9-8137b0c42526@posteo.net>
 <Z6kQpuQf5m-bXTyt@buserror.net>
 <20250210215324.GA1040564-robh@kernel.org>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250210215324.GA1040564-robh@kernel.org>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: robh@kernel.org, j.ne@posteo.net, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, naveen@kernel.org, linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
Subject: Re: [PATCH v2 09/12] dt-bindings: memory-controllers: Convert
 fsl,elbc to YAML
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)

On Mon, Feb 10, 2025 at 03:53:24PM -0600, Rob Herring wrote:
> Generally, if a bus has control registers or resources like clocks, then 
> we tend not to call them 'simple-bus'. And '"specific-bus", 
> "simple-bus"' gives some problems around what driver if any do you 
> bind to. 

Isn't the general idea that you bind to the first one in the list that
you have a driver for, since it goes from most to least specific?

> If you have chip selects, then you have config registers for those. 
> Not really "simple" if you ask me. That being said, you could keep 
> 'simple-bus' here. I would tend to err on making the schema match the 
> actual .dts rather than updating the .dts files on older platforms like 
> these.

By that definition I wonder how much truly qualifies.  Even with
IMMR/CCSR, firmware needs to at least set the base register (which is
itself inside CCSR, so there's no way to avoid relying on knowledge of
what the firmware did, except on 8xx).  Though I acknowledge that eLBC is
a stretch, with FCM and UPM being exceptions.  FCM didn't exist in the
original LBC, and UPM was... kind of considered a fringe use case
until someone hooked NAND up to it.  :-P

The point back then wasn't that such registers don't exist, but that the
OS can use the devices without having to care.  But of course, there's
subjectivity there about what the OS might care about (e.g. UPM).

FWIW, on these chips (especially the later ones) there were all sorts of
things (in general, not specifically LBC-related) that firmware had to
set up to present a coherent system to the OS.  Not all the choices made
there were great, but if we tried to describe all the gory details from
the start I'm sure we would have made an even bigger mess of it.

> > For non-NAND devices this bus generally meets the definition of "an
> > internal I/O bus that cannot be probed for devices" where "devices on the
> > bus can be accessed directly without additional configuration
> > required".  NAND flash is an exception, but those devices have
> > compatibles that are specific to the bus controller.
> 
> NAND bindings have evolved quite a bit if you haven't been paying 
> attention.

I haven't, as I acknowledged... but I was describing how eLBC does it,
and just meant that we're not binding to drivers that don't know about
the bus in that case.  The NAND control registers are part of eLBC/IFC,
not a separate block (the reg in the NAND node itself is just the SRAM
used as a buffer).  I'm not sure what that would be expected to look like
these days.

-Crystal


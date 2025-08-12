Return-Path: <linuxppc-dev+bounces-10856-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0A7B222EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Aug 2025 11:23:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1QzJ3gj8z3dRR;
	Tue, 12 Aug 2025 19:23:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=165.227.176.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754990604;
	cv=none; b=X6uEA2C5TMYQ6ygSXEAv0KljgGl/yFKCiJTSLzLx4CBgAcGlEokV5+s8fp13gknQdjygdCKhIUzHd5s1uAYb8DQ31J7cisJdmNEPWu/kZuJO4YpPWN6umz6EVQxO/nh/j262FtVUi8R3ijNHsbiB6U9VmK6y6hGYKrP4FeX0LSS52mMDH88UqfYDVOZEJ43Lc409jI57B2ruKopl0Iv/lNztSjZP/oOvUuALRqb+ykVHozyO6bJxMKqz46VoMtnwz3Boa6nv0Qkot8OCzw+NyPw8Cp5Ze9IuSs/RriZSbkW6SjpDRJIrY2XMUX4v91BHgjy9eEGpSpHG3WOsNVI4kA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754990604; c=relaxed/relaxed;
	bh=1b80/fGhciNryFEEkQZ7Y1tSDQ+Qxdwq3vTaXU1pxJ4=;
	h=Date:From:To:Cc:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Subject; b=ooBS+qs5DhAAWI7DGh2ipuuOjMd7j2+9UB+k3l+jnOVIJv/a+oaDaxsc6UA0JfUEzFf6yivtiidR1Y22EpOh07wc4eZ77belLNWKvkLwj7/WEIYEIUnczDPtk8qjGsEpDz4HLcbpq1xDE5Jz6ifVqcdFPpJGGLC3gMe5QZ2lTrvDxt5K6mRlyeP68HeeTrVYvAN+8DgCcG94flzfYGkVDPvP8xtn22doyJYW7u8XMGALnCL9Pk+bOTW1aN9O/4qqRpuZfaz7wxSU2OjpOm/cHu/+CIbsKl1u4jGF3LEegnIZqQgb4WwwgDkXSiCB+SBB2Q2JsWOuYkBcpafOVe1JFQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=buserror.net; dkim=pass (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=Vn4Mjsv0; dkim-atps=neutral; spf=pass (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=lists.ozlabs.org) smtp.mailfrom=buserror.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=buserror.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=buserror.net header.i=@buserror.net header.a=rsa-sha256 header.s=rsa_sel header.b=Vn4Mjsv0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=buserror.net (client-ip=165.227.176.147; helo=baldur.buserror.net; envelope-from=oss@buserror.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 2034 seconds by postgrey-1.37 at boromir; Tue, 12 Aug 2025 19:23:23 AEST
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1QzH1n44z3dK8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Aug 2025 19:23:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=buserror.net; s=rsa_sel; h=Subject:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description;
	bh=1b80/fGhciNryFEEkQZ7Y1tSDQ+Qxdwq3vTaXU1pxJ4=; b=Vn4Mjsv0raTVizLSzp3/p6IUdO
	/Fh0rQqfGm8lyNmfkgG9+wRETY3SStSH5NrT4bagU58vBJfXASE3pRpGjraEMO4xHcXsfLARTencf
	mejhQxfu3581k/ZwhzaXMlnSRkpVeGgO4xdJ9t526l1EoryLeFBUv84vWuul9mPMYKd4VewBdFG8d
	2RArV0HGZsk2y2Oi1cJ+6CurwfH7rrSRKlPgHh3IHRnFZJjaRV9kyHVXYeIKc5K7uqB6z1axCIaLb
	Y9K7Y/jhmTo+3P6czyAXVxcxF9FfTeqD8BdGNRcFiD3/ABtIbQOPa5+AsMxb6RR/d0d1sW9zlxec6
	FEwBx1Iw==;
Received: from oss by baldur.buserror.net with local (Exim 4.96)
	(envelope-from <oss@buserror.net>)
	id 1ulkaV-00AoyK-24;
	Tue, 12 Aug 2025 03:42:32 -0500
Date: Tue, 12 Aug 2025 03:42:31 -0500
From: Crystal Wood <oss@buserror.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Message-ID: <aJr-d1tZREOY6U5a@buserror.net>
References: <20250807214432.4173273-1-robh@kernel.org>
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
In-Reply-To: <20250807214432.4173273-1-robh@kernel.org>
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Rcpt-To: robh@kernel.org, tglx@linutronix.de, krzk+dt@kernel.org, conor+dt@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
Subject: Re: [PATCH] dt-bindings: powerpc: Drop duplicate fsl/mpic.txt
X-SA-Exim-Version: 4.2.1 (built Wed, 06 Jul 2022 17:57:39 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)

On Thu, Aug 07, 2025 at 04:44:30PM -0500, Rob Herring (Arm) wrote:
> The chrp,open-pic binding schema already supports the "fsl,mpic"
> compatible. A couple of properties are missing, so add them and remove
> fsl/mpic.txt.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

What about the 4-cell interrupt specifiers?

> -                  0 = external or normal SoC device interrupt
> -
> -                      The interrupt-number cell contains
> -                      the SoC device interrupt number.  The
> -                      type-specific cell is undefined.  The
> -                      interrupt-number is derived from the
> -                      MPIC a block of registers referred to as
> -                      the "Interrupt Source Configuration Registers".
> -                      Each source has 32-bytes of registers
> -                      (vector/priority and destination) in this
> -                      region.   So interrupt 0 is at offset 0x0,
> -                      interrupt 1 is at offset 0x20, and so on.

FWIW, while this description may seem unnecessarily verbose, it's because
it's different from how Freescale hardware docs numbered the IRQs
(IRQ 16 was "internal IRQ 0", etc).

-Crystal


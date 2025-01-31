Return-Path: <linuxppc-dev+bounces-5726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E86FA2389D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 02:34:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkdjB6tSHz30TQ;
	Fri, 31 Jan 2025 12:34:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738287262;
	cv=none; b=OFsZPc0c4lndqjWauS3tM8uIZHcKBAtLFmsbHcH58z0EV0vs2bDvNbmTlRSfc6Y68f1phKt9XtCXTDliTe5ZS43Kq/JceEjci96RKs9nxy5IyOMIX4/FVkFl3LPS4JLuhCRGOuEQbfLG0kqz4xc3p26i74svIoH+oyPIfbSoJlGas8DGb+lje30bfCdBFLxOA4iikKH3/1Dbe5+h/4QZSkJodIWu/1dcDsumj6sY656FhTT2rA/ACetHjpzNCmJhdlqZQRHexLx6VB6GkJJ928VfeBr814MLyqaJRHuPTCoktfhx3OMrrMrRhRKaR5vENqd/Jz2sO00EJfGvKUs/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738287262; c=relaxed/relaxed;
	bh=btX6y7LCAjtLhH96sMmx/H89bgMClbYXOnjJaHB6JxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PgJuyhxj0l8V0zd6LwMQMMn+IO5Q+SHEswhvPKnYECBjV2qzQqFcpyNaoezWZCNznMWGXzAkHEt2SN1OZe24Q+9z6mLlggsabn1iSUYYX+zbBzGHgs8obQ6kbwgV2hqN++8YXYdT0oxtHJ61vHfzFeoySr8s3j4JnW3n19QHPI3dUWYsVFnytfUHU2vebUsifkFBIOzsemMiN8wUeUbo+mw4ZoUObC5j/9MOhFbnAMXgg93JncFd3WnAJlt8J7u4Pz5M6zIJSeGJJWIhMLRj4LL4kIn8wFuYO4X/8oUjbkxqXDgCJ4+XXcrxMt3ixi5q5M5cjxciFadrjOX8a1NeIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org; dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=crcg1y4R; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=crcg1y4R;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ykdj90S9Qz2yn9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 12:34:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ozlabs.org;
	s=201707; t=1738287252;
	bh=btX6y7LCAjtLhH96sMmx/H89bgMClbYXOnjJaHB6JxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=crcg1y4Ro04ess51lr8APuq2wyF0P6V3OmzZKylzEgLJo80Dz3BNzPhF+HGoc50YN
	 vBNPS28KYQUmP/OdZCtED5cr4Wnt9/jJc7zzoS0oHvSRCStoPIxxLXfNq8GkwAFuQP
	 kyHtzLwgSLeNM5KA6tVQP22QmCPD14xInc8BI1SQqq4IVJ1ftvHecpAuN/5NbbCBnV
	 eWVaIxwxmLyd/8SymE0MU5CVOuMZgA2pdw8KshLAaZqoW5VpLT3IDAskj9OLkO5ptD
	 SdF1D+rFYTgiHJvXW4CXnhinvGiV6F0QGnUyyQE2pV6jfwAp1y7Y0B96CIo7vcOM8A
	 /6C5dluMOh+EQ==
Received: by gandalf.ozlabs.org (Postfix, from userid 1003)
	id 4Ykdj00wgnz4wp0; Fri, 31 Jan 2025 12:34:12 +1100 (AEDT)
Date: Fri, 31 Jan 2025 12:27:12 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Nicholas Piggin <npiggin@gmail.com>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/5] powerpc/microwatt: Add SMP support
Message-ID: <Z5wm8EzRoeiKdqEk@thinks.paulus.ozlabs.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org>
 <Z5lgTN0aA_yiETne@thinks.paulus.ozlabs.org>
 <D7EC9DL1YW6K.5NFBT1W937FK@gmail.com>
 <Z5nRYn11vxVuGU7J@thinks.paulus.ozlabs.org>
 <D7EEMQ8UULSQ.YCX4FDTAX6RP@gmail.com>
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
In-Reply-To: <D7EEMQ8UULSQ.YCX4FDTAX6RP@gmail.com>
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 06:12:55PM +1000, Nicholas Piggin wrote:
> On Wed Jan 29, 2025 at 4:57 PM AEST, Paul Mackerras wrote:

> > void __init microwatt_init_smp(void)
> > {
> > 	volatile unsigned char __iomem *syscon;
> > 	int ncpus;
> > 	int timeout;
> >
> > 	syscon = early_ioremap(SYSCON_BASE, 0x100);
> 
> ioremap is not up by SMP init time? I always have to
> trawl through init spaghetti to work it out. I guess it's
> early SMP init.

I had a little difficulty with this, and ended up with this function
(microwatt_init_smp) being called at platform probe time, which is why
the early_ioremap.  We need the secondary CPUs spinning in
__secondary_hold before smp_release_cpus() gets called, because that
is what sends them to generic_secondary_smp_init().
Now smp_release_cpus() is called in setup_arch() before even the
platform's setup_arch() function.  (And also, smp_setup_cpu_maps()
gets called even earlier.)  Hence the choice of the platform probe
function.

On platforms with OF and RTAS, the secondary CPUs are started and left
spinning in __secondary_hold by prom_init(), which is right at the
beginning, before the kernel proper starts executing.  Microwatt
doesn't have OF or RTAS, and the secondary CPUs are held in reset
until microwatt_init_smp() releases them (and then they start at 0).
Doing that as early as possible therefore more-or-less matches what
OF/RTAS platforms do.

Paul.


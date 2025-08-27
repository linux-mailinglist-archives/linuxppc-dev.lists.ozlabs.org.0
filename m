Return-Path: <linuxppc-dev+bounces-11399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB81FB38E87
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 00:36:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBzs85xG0z2xQ2;
	Thu, 28 Aug 2025 08:36:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756334172;
	cv=none; b=GkxfleTJN3foYdWz2c+v1gfkh4raGfY4hbjYKB9oODWJtLsu64Q95FyYF6zzFgUvH42js4yqFdHELfbrq+yALt3oXtv65z2suRSCHayM0GyqFbRkiaktaomVG9/UbQJRNBJQ95euEjeBVzp8whnTUrzARTUYNI3p9e27pwM1Ik/F3JAuzhipEMbTGiAjtzTLhj0DUZiKU60xZqkVSFqZLcbgims2Ck8A60tW2NYqqgWvPyv/q0jZ3YenUz2rONjvTpFv9IyWQ6qlYehkNRZvciMq7wT+YYkG7naI3dF1KLVru4k1XO8I7PHqUYVchpkexC99Z9lXB4WYGOuWFL+/NA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756334172; c=relaxed/relaxed;
	bh=/e2nybfKfAGaQ6hreBOZaTGM4QBi+hL1kbbt5AczH3Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=VvphSUy6AofKmKmwXz2IRYkBxt3yy29MvCeOP7mgUXWfEtqxj6HYDBT7XFdvH8kTfde8egMijj9ySI288Gwx3+KnMUuPHcqXDNYMNw6Xd6A+B5dwc6s4HH5U7QKdHAJN4El2aPpAR3q1NMn1LuqPtTFWfbTTNwxKVTcz6r6oUo5L4zz/g3E+2fzmb23MoT+9i2iAnzS9QgwP1I4qzC+Hm4//pV1dt6jU/pMBZNneAYfu2x/h4BAH18DPkcms1WgPoB+Na9rqOplb9OZYeALDRoBteFQT5oxEP9p3DplgQHDG9iHOZ6hAmu3p6P8MXMkLq2YrHRYxyS1QtebxqN50bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DUpxeAZt; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DUpxeAZt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBzs74KzSz2xQ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 08:36:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F43E4433D;
	Wed, 27 Aug 2025 22:36:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3EBC4CEEB;
	Wed, 27 Aug 2025 22:36:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756334168;
	bh=SuvtG9zPU1paS6zdtAQLH1EmQzS92Y488uepGCslfWI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=DUpxeAZt3sd2SF+CHF9cOy/FaqwBpkfO3QmQLN4WtjqYJww1JgdN330EJgtOo7awf
	 xyWVC65Ik9s82mLjd16u/fsvSuu23dv4M1YBxCe8bO6CXWEgzoRLhpV3WDHPmP25aY
	 MN84rM34MoHWDkORX0/iiQ1n3JoUADeR5wXKbBAovlj1sAMI5uZeJDeOfTYi0lz+zn
	 V5/DUusNTXr35xQCbizoSyjKjZgXsropAj0Da/2jC4EKIm5VEVn251opw5aNwUVvou
	 RRsuPYOe7vPF9M/TvmOxlhhB1X2T3hVX9lRk7L3x0iNPNnhqbMmQokcb4oci+E0njx
	 QPfbX1CvuOzSQ==
Date: Wed, 27 Aug 2025 17:36:06 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Andreas Larsson <andreas@gaisler.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-pci@vger.kernel.org, sparclinux@vger.kernel.org,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Yinghai Lu <yinghai@kernel.org>,
	Igor Mammedov <imammedo@redhat.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	linux-kernel@vger.kernel.org,
	=?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 00/24] PCI: Bridge window selection improvements
Message-ID: <20250827223606.GA915856@bhelgaas>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250822145605.18172-1-ilpo.jarvinen@linux.intel.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 22, 2025 at 05:55:41PM +0300, Ilpo Järvinen wrote:
> This series is based on top of the three resource fitting and
> assignment algorithm fixes (v3).
> 
> PCI resource fitting and assignment code needs to find the bridge
> window a resource belongs to in multiple places, yet, no common
> function for that exists. Thus, each site has its own version of
> the decision, each with their own corner cases, misbehaviors, and
> some resulting in complex interfaces between internal functions.
> ...

> I've tried to look out for any trouble that code under arch/ could
> cause after the flags start to behave differently and therefore ended
> up consolidating arch/ code to use pci_enable_resources(). My
> impression is that strictly speaking only the MIPS code would break
> similar to PCI core's copy of pci_enable_resources(), the others were
> much more lax in checking so they'd likely keep working but
> consolidation seemed still the best approach there as the enable checks
> seemed diverging for no apparent reason.
> ...

>   m68k/PCI: Use pci_enable_resources() in pcibios_enable_device()
>   sparc/PCI: Remove pcibios_enable_device() as they do nothing extra
>   MIPS: PCI: Use pci_enable_resources()
> ...

>  arch/m68k/kernel/pcibios.c   |  39 +-
>  arch/mips/pci/pci-legacy.c   |  38 +-
>  arch/sparc/kernel/leon_pci.c |  27 --
>  arch/sparc/kernel/pci.c      |  27 --
>  arch/sparc/kernel/pcic.c     |  27 --
> ...

I love the fact that you're doing so much cleanup.  Thanks for all the
work in this!

Obviously all this code is quite sensitive, so I put it on
pci/resource to get more exposure in -next.  If it turns out that we
trip over things or just don't feel comfortable yet for v6.18, we can
always defer this part until the next cycle.

I will also watch for acks from the m68k, mips, and sparc maintainers
for those pieces.

Bjorn


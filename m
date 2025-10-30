Return-Path: <linuxppc-dev+bounces-13603-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 725CBC222E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 21:16:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFjx3Vbwz3cZf;
	Fri, 31 Oct 2025 07:16:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=78.133.224.34
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761855365;
	cv=none; b=dEIs56Sz6270w+XdCXZN2gk6e8/9STJgR3bdl9OfKr7W/FthMZWbCqcJtfEuUMZcUUW+rWnbq5pxNpfeieF71LIjOVTv14MAROGNHhgyXc7GQr1xpW2P5wNMe+BcMLvqH9c3ZZ3ZewcmjT2JMNy7mUVodR6zE7uATXLwEUOL3nB/bNPvljRoEuwEg3+7p1PbyalbFcg+4VQETI9X/TJQbYHoOtagbIHlvdanwthjOXxB1u5XpDeMPVjhGzO7m1UH7mMD1MnLw+Dqp0tI49XM79xcqCC26fOqivyenJDsKPw8QOjRV0v1OKcySLTJRL367KpNG1FL2dE3pNw7jh5a1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761855365; c=relaxed/relaxed;
	bh=YgZ29HJf5Ryz1t8e5e1TsmgwXjYMow0kq+OZL3m/CC0=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=nSyCeq38y+b6Oh8cnu7927/Ff0B2XM9vFilMPcDimkOeMb2RctZsNebKTHKgYc97ISx9TufBQFDJivUWoh7PXPb1NGYO3hJOPvRTycQvtvA/locIC+Co6NY0lzJ+R8ocp5c/wkRtmgL/QAU1A9/dI58Gts840xGA/qn5Vh62MhxMgWKOB3BgoELaNw1p54F65aVX8nxsOI3lHAzOAPd78OaWyh4j3f3+Dgz6g3qKE/s+v/Mt0wa4j7/12mfGiskmjAve8f5eWh8FGTQkMvBqwh/eK3xmt53EaOWEebZI6nHdcXCVk57/BoZ8v5V3XRDabZ+cF7h/sWipMiGArxPpOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk; spf=none (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org) smtp.mailfrom=orcam.me.uk
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=orcam.me.uk
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=orcam.me.uk (client-ip=78.133.224.34; helo=angie.orcam.me.uk; envelope-from=macro@orcam.me.uk; receiver=lists.ozlabs.org)
X-Greylist: delayed 335 seconds by postgrey-1.37 at boromir; Fri, 31 Oct 2025 07:16:04 AEDT
Received: from angie.orcam.me.uk (angie.orcam.me.uk [78.133.224.34])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cyFjw2T9kz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 07:16:04 +1100 (AEDT)
Received: by angie.orcam.me.uk (Postfix, from userid 500)
	id 6C88692009D; Thu, 30 Oct 2025 21:10:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by angie.orcam.me.uk (Postfix) with ESMTP id 60ED392009C;
	Thu, 30 Oct 2025 20:10:17 +0000 (GMT)
Date: Thu, 30 Oct 2025 20:10:17 +0000 (GMT)
From: "Maciej W. Rozycki" <macro@orcam.me.uk>
To: Bjorn Helgaas <helgaas@kernel.org>
cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
    Thierry Reding <thierry.reding@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    "Rafael J. Wysocki" <rafael@kernel.org>, x86@kernel.org, 
    linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, 
    linux-mips@vger.kernel.org, loongarch@lists.linux.dev, 
    linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org, 
    linux-pci@vger.kernel.org, linux-acpi@vger.kernel.org, 
    linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/7] MIPS: PCI: Use contextual data instead of global
 variable
In-Reply-To: <20251030153121.GA1624982@bhelgaas>
Message-ID: <alpine.DEB.2.21.2510302003120.1185@angie.orcam.me.uk>
References: <20251030153121.GA1624982@bhelgaas>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 30 Oct 2025, Bjorn Helgaas wrote:

> It does complicate maintenance though.  I think all of mips ultimately
> uses register_pci_controller() and pcibios_scanbus().  Neither really
> contains anything mips-specific, so they duplicate a lot of the code
> in pci_host_probe().  Oh well, I guess that's part of the burden of
> supporting old platforms forever.

 FWIW new MIPS hardware continues being manufactured and if there is 
anything needed to clean up in generic MIPS/PCI platform code, then that 
can certainly be scheduled, subject to developers' resource availability.  
Individual MIPS platforms may vary of course, and with the solely legacy 
ones it will depend on the availability of hardware and engineers willing 
to maintain it.

  Maciej


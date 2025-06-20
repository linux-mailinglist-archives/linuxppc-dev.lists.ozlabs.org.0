Return-Path: <linuxppc-dev+bounces-9580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CBDD9AE1558
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Jun 2025 10:01:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNqff1Sdzz30Qk;
	Fri, 20 Jun 2025 18:00:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750406458;
	cv=none; b=GRBFhzp7zJ7JtyAkSG5ZqZ9rHDHHimkrxDT8Te6aX+YlHJxYLE4kobZh4cJwEh36rcFp6bmXGtkay9gWAJ9nD/9hF0U0HNZNrQAyR/BRkfKfWhgQN6rwJ8udYDx8ld3ccgqkkktccHTmlOPIXFnN9c+lUE3pAgZ1xU6BgynvmXMI4JXocTax3ahSRPkZgYybOWWeRrMWqmJxg2QKfMZ6YuFIeAIFBGDl3X75XvJwc6ZkPQtwJLypfjSJNmCvGi5TGiPc8L852OLH+iC3dh3x0egf2bkyTG4pN6B/v1UthjqjP6dkosnSNcteRzHP8XEk+WEq2C/hu8ad/s/sSWg70Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750406458; c=relaxed/relaxed;
	bh=euQYHkzYJGsmTgfuv9xiO1cDWAyO+5v9JYtJJOd+t0w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Raq4mOLPexaXMX6Zt5Z67qCl+f99ZAB+VCVg6BRS77Di0L5KZIBkyjISKfbK/NwYvcT3qaYw/bjzJ0ux8fRtxwC5e6sRPxonbsUOhpp6XzdlP1//Ty6PNY8+irBoxRELuuuPWn0oU8HmfNiYE1XBRPwsKsM4h7BIM1B/qpxvk482ZzLq+pSdfpc18icrMqeDqknBDNe5tYW1UXDP2eU6pRgNhvLQyvz+eiMT7fisgZ7qcmBX/NDP4N4ZQwvz9y1BqRNhjxTBWkOlfEhETEdbXsuBYNyDcPawa0nDp0ZHgP6FSAccioViDnwP1KA7fDWySUmmmgs6o+goedsAzRSHMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 473 seconds by postgrey-1.37 at boromir; Fri, 20 Jun 2025 18:00:56 AEST
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNqfc5BX1z30QJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 18:00:56 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 35B212C06671;
	Fri, 20 Jun 2025 09:52:55 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2FD183A0857; Fri, 20 Jun 2025 09:52:55 +0200 (CEST)
Date: Fri, 20 Jun 2025 09:52:55 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-pci <linux-pci@vger.kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	christophe leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Shawn Anastasio <sanastasio@raptorengineering.com>
Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with
 broken
Message-ID: <aFUTV87SMdpHRbt8@wunner.de>
References: <20250618201722.GA1220739@bhelgaas>
 <1155677312.1313623.1750361373491.JavaMail.zimbra@raptorengineeringinc.com>
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
In-Reply-To: <1155677312.1313623.1750361373491.JavaMail.zimbra@raptorengineeringinc.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 19, 2025 at 02:29:33PM -0500, Timothy Pearson wrote:
> To be perfectly frank the existing code quality in this driver
> (and the associated EEH driver) is not the best, and it's been
> a frustrating experience trying to hack it into semi-stable
> operation.
> 
> I would vastly prefer to rewrite / integrate into the pciehp driver,
> and we have plans to do so, but that will take an unacceptable amount
> of time vs. trying to fix up the existing driver as a stopgap.
> 
> As you mentioned, pciehp already has this fix, so we just have to
> deal with the duplicated code until we (Raptor) figures out how to
> merge PowerNV support into pciehp.

I don't know how much PCIe hotplug on PowerNV differs from native,
spec-compliant PCIe hotplug.  If the differences are vast (and I
get the feeling they might be if I read terms like "PHB" and
"EEH unfreeze", which sound completely foreign to me), it might
be easier to refactor pnv_php.c and copy patterns or code from
pciehp, than to integrate the functionality from pnv_php.c into
pciehp.

pciehp does carry some historic baggage of its own (such as poll mode),
which you may not want to deal with on PowerNV.

One thing I don't quite understand is, it sounds like you've
attached a PCIe switch to a Root Port and the hotplug ports
are on the PCIe switch.  Aren't those hotplug ports just
bog-standard ones that can be driven by pciehp?  My expectation
would have been that a PowerNV-specific hotplug driver would
only be necessary for hotplug-capable Root Ports.

Thanks,

Lukas


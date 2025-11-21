Return-Path: <linuxppc-dev+bounces-14417-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DB686C7B199
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 18:40:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCjDK4csQz304h;
	Sat, 22 Nov 2025 04:40:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763746833;
	cv=none; b=cYQn3STPleIx/6pLVjlU/KBqvzYhwnPv1lnfXh6nfwBtWPk2ugFYUAEeLup6kL6TbIEsyMCZnQn4nCcL5o3zdbuVvOQ83eKweS1iU+9pnux5wVfwjEypfbxBAzOlfbJc1wA4t4RBokAb/v5IWYNbE0ZqNlhiCHhYDLALABgZItmEmsKJRyNZ2F/hU5ehmaw7myyx/gwCK0JBA1Q+wiRrAMssPTR7Z/mTaExHZUARwuN2IYNVtCPn+LRD8K8LtZsUagfiRhCyT3qmwcAxfvVn6iFUTKFgw+cJDApfdF8yozrWn8wi83HuU7AX6muuRGjjNjYkqAr+dbH7zeinZKkwPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763746833; c=relaxed/relaxed;
	bh=sBtE3wTZfOWNARRTB6bXrcqax1yZdN2sOsBELvKsGgI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORPbbb5YE4jTvf6YiCckaQ0JS/q6qLIZF6O8IGujOR/TTzos+knx+4Bhzy8vwDaliXAY5alyLi5gEfUAGPWLyeSvtSeJDiSLbHu9+ORLx5A4DX8BNUTf092F1lZS8mkEIljLfgqpQDgjUxjSaAPVCai9xr6tvXxej36NEm1/0tDlcZHiCveXoslxXr8XfNj+x/r+Zo/cuFgGR9xfCNU7neW9IzTMRsemPVAHuosh+SRniZ0jgE/sRsZCBNTc4nNujcbboU4Paz3SBBfy5AN9c6KiKCuVsL59g8OcbnUCkOFpLdAszlWcKM1qTssaQ2Ec2tjKC+w632LDLH3tQRO9NA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCjDJ6Lxhz302V
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 04:40:32 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 00D7D2C051EB;
	Fri, 21 Nov 2025 18:40:24 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id CE5EF17677; Fri, 21 Nov 2025 18:40:23 +0100 (CET)
Date: Fri, 21 Nov 2025 18:40:23 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Riana Tauro <riana.tauro@intel.com>,
	"Sean C. Dardis" <sean.c.dardis@intel.com>,
	Farhan Ali <alifm@linux.ibm.com>,
	Benjamin Block <bblock@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Alek Du <alek.du@intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>, qat-linux@intel.com,
	Dave Jiang <dave.jiang@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH 1/2] PCI: Ensure error recoverability at all times
Message-ID: <aSCkB7C5EF2BVdfM@wunner.de>
References: <aRWnAd-PZuHMqBwd@wunner.de>
 <20251113161556.GA2284238@bhelgaas>
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
In-Reply-To: <20251113161556.GA2284238@bhelgaas>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 13, 2025 at 10:15:56AM -0600, Bjorn Helgaas wrote:
> On Thu, Nov 13, 2025 at 10:38:09AM +0100, Lukas Wunner wrote:
> > On Wed, Nov 12, 2025 at 04:38:31PM -0600, Bjorn Helgaas wrote:
> > > On Sun, Oct 12, 2025 at 03:25:01PM +0200, Lukas Wunner wrote:
> > > It would be nice if there were a few more
> > > words about pci_save_state() and pci_restore_state() in
> > > Documentation/.
> > > 
> > > pci_save_state() isn't mentioned at all in Documentation/PCI
> > 
> > Right, it's documented in the Documentation/power directory. :)
> 
> Yes, in the pci.rst I mentioned, but it mostly uses the "saves the
> device's standard configuration registers" wording.
> 
> I'm just wishing for a more concrete mention of "pci_save_state()",
> since that's where the critical "state_saved" flag is updated.

Hm, Documentation/power/pci.rst does contain this:

   "Then, pci_save_state(), pci_prepare_to_sleep(), and
    pci_set_power_state() should be used to save the device’s
    standard configuration registers, to prepare it for system wakeup
    (if necessary), and to put it into a low-power state, respectively."

I'm struggling to find a better way to phrase it.

> And I'm not sure Documentation/ includes anything about the idea of
> a driver using pci_save_state() to capture the state it wants to
> restore after an error.

Right, while pci_save_state() usage is mentioned in the PCI power
management documentation, it's not mentioned at all in the error
recovery context.  So I'm proposing this amendment:

https://lore.kernel.org/r/077596ba70202be0e43fdad3bb9b93d356cbe4ec.1763746079.git.lukas@wunner.de/

Thanks,

Lukas


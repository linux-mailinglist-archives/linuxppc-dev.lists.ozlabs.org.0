Return-Path: <linuxppc-dev+bounces-14468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D383C82A17
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Nov 2025 23:11:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFg561Lhxz2yvG;
	Tue, 25 Nov 2025 09:11:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764022266;
	cv=none; b=BfUgqmBgICHwBFUkPEa487XA3Nk6qQLTIYhbS1xIvla0GWu5x0M/qsvW8eM77d8lr0H/9q19+CEa65sPNq6ncqhenPd4h2RlGUgR9X8Hm/V9EjtRjR0nHHx/Up26Pc+0n/mj/1NBJG0ad9v7Fk/iV/P8VZqQfrGi1b9E6ykBB1L+8dBd/oQaGjmtSxVUZYaxe3flhfAP0m+cQiUFp8ZXJiJy8x0I7wjkX6zH3V2nVYJhAaSro4NTcSsLKnifOOEeVM7fTJlAzZk2gLion3cLYO1D9e19lkARNaah8BtoX02oT64H9kU/NQtpRoUV2Yqpt9mwDiIuU19ox2FiK8Ck2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764022266; c=relaxed/relaxed;
	bh=+222YZJtbP73fGgWXt6cG8eKKrVxWSefS2z8tnxFV8c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=N/U6bTBPMKUyHSuy7zG8/cAoWYQS7jFCNj7xi+iUlRG2cngHdjY9XXQ/WlamA3LG9CCuGJU/cMY0g/BMhixGQZq8pExFaT1bxpIlsj66BV4FpDAWRtO45bSHOPK4AxypmiZfMg0alTGk+CLhsF+XfrcTrN9qPpLu3NkkA4uKCv5wvd++XDvBsclfMCVlrslUA0E3YhvUMW+8Bi8x2EOHpVIzBUzO4U3aPaUGlCoiiUJY/yayjKoAS5VYNKfl3El9UxHJRv4gcIR4YhVRtrBYNbyPQp13XcdTDP7uD43gGNiRNA8y0jnkpt3u+2M6K1jNo1LYltqNaMF/r5/eRr5xIA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e3fXEPDQ; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e3fXEPDQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFg542Z49z2yv5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 09:11:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 917FE41937;
	Mon, 24 Nov 2025 22:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438FAC4CEF1;
	Mon, 24 Nov 2025 22:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764022261;
	bh=UsXhBOBNmqsMTTUB6JBqI/XfVmzEW6sOsIyelQ0NUtM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=e3fXEPDQZ9ePKo45xltu1vITqq4l/JMYSRNcWab//ifrp0oRwC/S20mjMMtp+Kp0u
	 BhE+jGVtEJyQZTThuxLjeUB/7fhc21zIF8pQ6a5+rxF0lWztIS7NtTviE0qghAKzMr
	 UnX6ZriWFHYzpunWDfPnz0wSK07i3winA/gT+3QUK+94Gy18iHwG7Lp2VmwxIvweH7
	 1oCKwUruiiIR5yzZS+Z9HgnoGM7oyYdChfUB1u1lr7O3kKChBL16FIwXtczctrmBJm
	 4hlwKRpTRadwIVDNvgJgkidaA1IX3/vp1o3RpZEaJV6Ae8m6uNnH7TClE6ZjWUme20
	 gM/jag5QqjE2g==
Date: Mon, 24 Nov 2025 16:11:00 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Lukas Wunner <lukas@wunner.de>
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
Message-ID: <20251124221100.GA2717085@bhelgaas>
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
In-Reply-To: <aSCkB7C5EF2BVdfM@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 21, 2025 at 06:40:23PM +0100, Lukas Wunner wrote:
> On Thu, Nov 13, 2025 at 10:15:56AM -0600, Bjorn Helgaas wrote:
> > On Thu, Nov 13, 2025 at 10:38:09AM +0100, Lukas Wunner wrote:
> > > On Wed, Nov 12, 2025 at 04:38:31PM -0600, Bjorn Helgaas wrote:
> > > > On Sun, Oct 12, 2025 at 03:25:01PM +0200, Lukas Wunner wrote:
> > > > It would be nice if there were a few more
> > > > words about pci_save_state() and pci_restore_state() in
> > > > Documentation/.
> > > > 
> > > > pci_save_state() isn't mentioned at all in Documentation/PCI
> > > 
> > > Right, it's documented in the Documentation/power directory. :)
> > 
> > Yes, in the pci.rst I mentioned, but it mostly uses the "saves the
> > device's standard configuration registers" wording.
> > 
> > I'm just wishing for a more concrete mention of "pci_save_state()",
> > since that's where the critical "state_saved" flag is updated.
> 
> Hm, Documentation/power/pci.rst does contain this:
> 
>    "Then, pci_save_state(), pci_prepare_to_sleep(), and
>     pci_set_power_state() should be used to save the device’s
>     standard configuration registers, to prepare it for system wakeup
>     (if necessary), and to put it into a low-power state, respectively."
> 
> I'm struggling to find a better way to phrase it.

The part that seems confusing to me is that pci_save_state() is the
switch that turns off PCI core power management.  The state save part
is not obviously connected with the power management part, at least
from the function name.

But that paragraph goes on to say:

  Moreover, if the driver calls pci_save_state(), the PCI subsystem
  will not execute either pci_prepare_to_sleep(), or
  pci_set_power_state() for its device, so the driver is then
  responsible for handling the device as appropriate.

so the doc actually *does* mention the connection, and although
pci_prepare_to_sleep() and pci_set_power_state() sound sort of like
internal functions, I guess that makes sense because drivers doing
their own power management would be using things like that.

I do raise my eyebrows a bit at them though; there are only seven
drivers that use pci_prepare_to_sleep(), which makes me a little
suspicious -- what is so unique about those drivers?

A bunch of drivers use pci_set_power_state().  Many seem to be rolling
their own PM resets.  Several others use it in suspend/resume for
reasons that aren't obvious to me but are likely legit.

> > And I'm not sure Documentation/ includes anything about the idea of
> > a driver using pci_save_state() to capture the state it wants to
> > restore after an error.
> 
> Right, while pci_save_state() usage is mentioned in the PCI power
> management documentation, it's not mentioned at all in the error
> recovery context.  So I'm proposing this amendment:
> 
> https://lore.kernel.org/r/077596ba70202be0e43fdad3bb9b93d356cbe4ec.1763746079.git.lukas@wunner.de/

Thanks!

Bjorn


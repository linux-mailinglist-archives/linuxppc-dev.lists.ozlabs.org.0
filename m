Return-Path: <linuxppc-dev+bounces-7782-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B1EA9310E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Apr 2025 06:00:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zf1Jk6RQRz3c0H;
	Fri, 18 Apr 2025 14:00:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:37:1000::53df:5f64:0"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744948854;
	cv=none; b=OlHzPYCatt7i1rAMiWk3egAkMWeyX3sbSlxuW6SLFKIlxkkYzLgmpBXunx2UKpgR5RKuXGLlYA3FcpBwwBT3sgbPo0RqudRlFN/gWygejFkK3yTwqBgRzXvdL1r2LmI9rPa5CHKajd0kGZY7QOPmn+bkWzoYlGUQ0tas1XGFmuoTA4sg5gJVyUE7GVkkBYglqMvisDzjbKDuBuS496YydQxP5QxoxNZ3pYdlJD+52qxuOXJqss3+SaCMZyfSb5ueEgScQZMJRJs4SPyEfUGrjA3rmIE6YlCt4ZUT56hKj+VmDxzJnEFUhl5vypCci66Q83eJmF1oB8Nlbk0UscSmsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744948854; c=relaxed/relaxed;
	bh=7kNXwz5nZrYdOZIVirdqWANzY4uT+PyRZviYbUFPIEc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/abbZDf/Kx7SMNFJiVSA1TZpmQYeOkNqcSFg4IjOfplwRAzOLuQcagMcWAaS8q0Cxoz4n0mbtAZvHoq5ndnunCjfJ/XmItxazvbaPkR5l0hd+WMEZqdbskjwrbSjFZWYhvc2Ci+VQ40h9Ycns3tVMM0Vt189zawOqudHzZdNykh8KpjdL1z8qq7bgNJLv2XBTKfUeAxqExM2VSAG0iYZMolU9qDnlB07Ud350nWYmxLPsQMhhL0R2o5iQNUTXhRXIFW4FShlZ+6UDKNoVfFLmHkH8zSeUBZVN+LnHfUknt6Lsakny5nA1DSjeDkqhbQkMbOTiKXdch+6aoJ7JTC1A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=2a01:37:1000::53df:5f64:0; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 338 seconds by postgrey-1.37 at boromir; Fri, 18 Apr 2025 14:00:53 AEST
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [IPv6:2a01:37:1000::53df:5f64:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zf1Jj2m7nz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Apr 2025 14:00:53 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id 265BE2C4C3C8;
	Fri, 18 Apr 2025 05:54:57 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 36457224E6; Fri, 18 Apr 2025 05:55:05 +0200 (CEST)
Date: Fri, 18 Apr 2025 05:55:05 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Keith Busch <kbusch@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>, Sinan Kaya <okaya@kernel.org>,
	Thomas Tai <thomas.tai@oracle.com>, poza@codeaurora.org,
	Christoph Hellwig <hch@lst.de>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCHv3 09/10] PCI: Unify device inaccessible
Message-ID: <aAHNGT60lleXqnW6@wunner.de>
References: <20180918235702.26573-1-keith.busch@intel.com>
 <20180918235702.26573-10-keith.busch@intel.com>
 <e0606dfcf8780bf994432dc373581fdf0af18f8e.camel@kernel.crashing.org>
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
In-Reply-To: <e0606dfcf8780bf994432dc373581fdf0af18f8e.camel@kernel.crashing.org>
X-Spam-Status: No, score=0.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

[cc += PowerPC / EEH maintainers]

Hi Ben,

On Tue, Sep 25, 2018 at 11:10:01AM +1000, Benjamin Herrenschmidt wrote:
> On Tue, 2018-09-18 at 17:57 -0600, Keith Busch wrote:
> > + * pci_dev_set_io_state - Set the new error state if possible.
> > + *
> > + * @dev - pci device to set new error_state
> > + * @new - the state we want dev to be in
> > + *
> > + * Must be called with device_lock held.
> 
> Any reason why you don't do cmpxchg as I originally suggested (sorry
> I've been away and may have missed some previous emails)
> 
> This won't work for PowerPC EEH. We will change the state from a
> readl() so at interrupt time or any other context.
> 
> We really need the cmpxchg variant.

Independently from your request, pci_dev_set_io_state() was
converted to cmpxchg() in 2023 with commit 74ff8864cc84
("PCI: hotplug: Allow marking devices as disconnected during
bind/unbind").

So you may now amend EEH to use pcie_do_recovery() or whatever
you needed this for.

I had kept your e-mail in my inbox as a reminder that there's a
remaining issue here and just came across it while clearing out
other messages.

Thanks,

Lukas


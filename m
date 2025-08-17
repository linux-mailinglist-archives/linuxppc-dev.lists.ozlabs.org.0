Return-Path: <linuxppc-dev+bounces-11072-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E35B29361
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Aug 2025 15:54:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c4clG2VGmz2xgQ;
	Sun, 17 Aug 2025 23:54:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755438842;
	cv=none; b=bNSPk1uJaIntkWoIcDdzEMQNZbSm5iCDhhwVOW6Ff26kJPyM8J3LvbAzN0c6oM3YeqlDPLwxlwQLFry4D04YU//YasVe8XsydD1iutJBl5pnTl8NaZosQLYG5vcg75v9DmfZiLwB/QMZfi3qSTqltEEFSzJwu+eqvHPyFm00noDWCF+q8reJl2Hq++UoqYIzKfZ4x4mEv6f2PKB0XUmjND9Qw2lPxo+ASoutD5L06PhQ3KWYL/2gYBJx3F7I6IzsCVLlxl8gwcFPFIed/KKO4xMii+Yk5LPker6e4pwmcecAYA5KOgiZ8IiavYfdnSCZs4LfcOHcmrDCVwykNxMQaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755438842; c=relaxed/relaxed;
	bh=ivL6tmdbxPn7Hy8woM6xcNf0p/QxFtwM+DYdZwCcA2k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XH1pCQ7SrMnxfV01o/8l462Syr/KklTrMViGVLOd+eF7yw4HZ5LCKHHL/+fHnhcDd7/B48X2GBOSKhikatyFEdghg1xuO2QYAfq8fwxLStWPxcu1Z54arQZvHBGwNlO7RSzDR0PSc+YNCMB6KE9HKDwJI5AhfCbX4ktYLu64mPSof85ac5SUTQPuYxtKkUf5fY3kwdOMp0TxVhZUIW/Py+Af7/l71KNeye54bBVokrxfhxNgcV8ytDOozrnDQ/G0hvGXI0IycthEDOPhiyc6q6mwOOv+LIg4XfIVB/w96GGu4VC4Fep6Tgx5K1MZ0Axr0SAJMYk6WP9Be9BDl2ggiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 512 seconds by postgrey-1.37 at boromir; Sun, 17 Aug 2025 23:54:01 AEST
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c4clF3SmDz2xK5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Aug 2025 23:54:01 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 5E0DC2C051CC;
	Sun, 17 Aug 2025 15:45:25 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2047E3BEDFB; Sun, 17 Aug 2025 15:45:25 +0200 (CEST)
Date: Sun, 17 Aug 2025 15:45:25 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Riana Tauro <riana.tauro@intel.com>,
	Aravind Iddamsetty <aravind.iddamsetty@linux.intel.com>,
	"Sean C. Dardis" <sean.c.dardis@intel.com>,
	Terry Bowman <terry.bowman@amd.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Linas Vepstas <linasvepstas@gmail.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH 1/5] PCI/AER: Allow drivers to opt in to Bus Reset on
 Non-Fatal Errors
Message-ID: <aKHc9RxYHC0CpbeS@wunner.de>
References: <cover.1755008151.git.lukas@wunner.de>
 <28fd805043bb57af390168d05abb30898cf4fc58.1755008151.git.lukas@wunner.de>
 <cd952c82-9f8b-4396-9170-b34d539a8fac@linux.intel.com>
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
In-Reply-To: <cd952c82-9f8b-4396-9170-b34d539a8fac@linux.intel.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Aug 13, 2025 at 04:01:09PM -0700, Sathyanarayanan Kuppuswamy wrote:
> On 8/12/25 10:11 PM, Lukas Wunner wrote:
> > The file Documentation/PCI/pcieaer-howto.rst hints at a rationale for
> > always performing a Bus Reset on Fatal Errors:  "Fatal errors [...] cause
> > the link to be unreliable.  [...] This [reset_link] callback is used to
> > reset the PCIe physical link when a fatal error happens.  If an error
> > message indicates a fatal error, [...] performing link reset at upstream
> > is necessary."
> 
> In the code we don't seem to differentiate link_reset and slot_reset. But
> the Documentation calls them into two steps. Do you think we should
> fix the Documentation?

reset_link and slot_reset are two different things:

* slot_reset is the ->slot_reset() callback in struct pci_error_handlers.

* reset_link is the reset_subordinates() callback passed in to
  pcie_do_recovery().

Commit 8f1bbfbc3596 renamed reset_link() to reset_subordinates() but
neglected to update Documentation/PCI/pcieaer-howto.rst.

Commit b6cf1a42f916 dropped the reset_link() callback from struct
pcie_port_service_driver and dropped default_reset_link() in favor
of passing aer_root_reset() to pcie_do_recovery().  Yet the documentation
continues referring to a "default reset_link callback" and incorrectly
claims that "Upstream Port drivers may provide their own reset_link
functions".

I've begun updating the documentation and intend to submit that separately.

Thanks,

Lukas


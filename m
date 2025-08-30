Return-Path: <linuxppc-dev+bounces-11536-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DF1FB3C92C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 10:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDSYg3gJmz2xgX;
	Sat, 30 Aug 2025 18:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=176.9.242.62
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756541575;
	cv=none; b=KPM05p3cYo6CYHZLp0SNYpMv6UuD/2gACsoIrxHu9WueQ2yPdi5h0m0WN6cOpoCFP8yWqVm3rWzXYZ/E4kxYrw44A0VxD+5vgyf8Of77Z8cPnTg4RQHz36CWzsiWNcmdheiEOKbAQ1sDjCPJWqlS8anM4gZ44XMopRDlS/b5pY7IkE6pr0qmfuYIVSp3TNlwjR/TSJyPpS7hBEh3RCQ4xnzNSUl9OuV6gF5o1J+cmdkgDbZ725+IBaeLo7iZKBjVePelG8AeyVRMsT7BjqnGtKbiYyw2LAKwE8bozh1GOBiv9uWDw40xj7MgqK2QbdKErNK5LF9swemSebVJ/k/dxw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756541575; c=relaxed/relaxed;
	bh=uoDaBDkJxN4DrhbaGMrOi9jnuKXnCi+gTwN3YOh/TfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ee9l/nIEWBhGL38fDGw+/74V6ikusl5X7zaykZt7KpaJIDgZqNNK+omXIZTE77Hw+/mrmSS3egbeCrwXn3lTzXWH1jTh59/Z1BVrYzJzGs9KRlmpKuG0RKzDTf66nMO4nOI02JBujE7QKT8eAhoc2uzuocBv1tO9caWAcFt4uZIJ2+sEOzG+9KmlsfmUWLaZB6M/kfIgo2Xyna7BT47i2QYoey/saIb3dgZ19hSjK+Ffsw0QVohflEkGYJioTTqyDxMbO/hgdbTddTlTl21uwUonalXJw5K/pYZDBmXWmzTgr36AD9crnz83MR6RMGADMeKIu1EDM6OOAwMRcistVw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout3.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout3.hostsharing.net (client-ip=176.9.242.62; helo=bmailout3.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [176.9.242.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDSYf1Z1sz2xPw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 18:12:54 +1000 (AEST)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
	 client-signature RSA-PSS (4096 bits) client-digest SHA256)
	(Client CN "*.hostsharing.net", Issuer "RapidSSL TLS RSA CA G1" (verified OK))
	by bmailout3.hostsharing.net (Postfix) with ESMTPS id 6CBCE2C051E5;
	Sat, 30 Aug 2025 10:12:44 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 2F6123AA697; Sat, 30 Aug 2025 10:12:44 +0200 (CEST)
Date: Sat, 30 Aug 2025 10:12:44 +0200
From: Lukas Wunner <lukas@wunner.de>
To: Linas Vepstas <linasvepstas@gmail.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Terry Bowman <terry.bowman@amd.com>,
	Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
	Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-doc@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH 3/4] PCI/ERR: Amend documentation with DPC and AER
 specifics
Message-ID: <aLKyfNHC2hz__BCS@wunner.de>
References: <cover.1756451884.git.lukas@wunner.de>
 <42726e2fd197959d6228d25552504353ffb53545.1756451884.git.lukas@wunner.de>
 <CAHrUA364QSpcJOu=96JV-3hR9G5M0FSUPNhb4AspULAcXvQP6w@mail.gmail.com>
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
In-Reply-To: <CAHrUA364QSpcJOu=96JV-3hR9G5M0FSUPNhb4AspULAcXvQP6w@mail.gmail.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Aug 29, 2025 at 06:25:08PM -0500, Linas Vepstas wrote:
> On Fri, Aug 29, 2025 at 2:41AM Lukas Wunner <lukas@wunner.de> wrote:
> >
> > +   On platforms supporting Downstream Port Containment, the link to the
> > +   sub-hierarchy with the faulting device is re-enabled in STEP 3 (Link
> > +   Reset). Hence devices in the sub-hierarchy are inaccessible until
> > +   STEP 4 (Slot Reset).
> 
> I'm confused. In the good old days, w/EEH, a slot reset was literally turning
> the power off and on again to the device, for that slot. So it's not so much
> that the device becomes "accessible again", but that it is now fresh, clean
> but also unconfigured. I have not studied DPC, but the way this is worded
> here makes me think that something else is happening.

With DPC, when a Downstream Port (or Root Port) detects an error,
it immediately disables the downstream link, thereby preventing
corrupted data from reaching the rest of the system.  So the error
is "contained" at the Downstream Port.

It is then necessary for system software (i.e. drivers/pci/pcie/dpc.c)
to "release" the Downstream Port out of containment by re-enabling the
link.  This happens in dpc_reset_link() by writing (and thus clearing)
the PCI_EXP_DPC_STATUS_TRIGGER bit in the PCI_EXP_DPC_STATUS register.

In-between, the devices downstream are inaccessible.

Disabling the link results in a Hot Reset being propagated down the
hierarchy below the Downstream Port.  So there's no power cycle
involved.  After the link is re-enabled, devices are in power state
D0_uninitialized and need to be re-initialized by the driver in
->slot_reset() and/or ->resume().

If you feel the above-quoted paragraph isn't accurate or complete
or doesn't capture this sequence of events properly, please let me
know what specifically should be rephrased / amended.

Thanks for taking a look!

Lukas


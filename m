Return-Path: <linuxppc-dev+bounces-14422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A90F4C7CC9D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Nov 2025 11:25:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dD7WH3Cpbz2yD5;
	Sat, 22 Nov 2025 21:24:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.78.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763807099;
	cv=none; b=kh0dh+2ScgAEWw2yWElRJKyV3d2PlwucU6tISqoZeMpb9wItFao7hUhx077s857vioWXzMnqhqMWs6+5VGYwCZ+RDTW+q3SIJiddWyxJhoWemh8xa1GT59RfcZhPVVH3FFrO2b/mRJPBoqgP/jSHRbaG0x4mAJoNVa/UAaE6ML0wNWwPcKA+eYwKiVuWZ9lzu7Q8aHwC34t3uqrjUccMVOoQXIz2eGMrHbKC4GvqFAyh4KEBTFa7HRbN1mj0Mbbg6cTYZ+irMv6qO6KtC/hB7ERo1WWwTOPjG/NwspDKGeKiU6Ohn8Ov5e08PEGmdTI3FcCnFGd+Wg1IkZcknF7AvA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763807099; c=relaxed/relaxed;
	bh=uEVDAQcdQAH/M/JmuPrNmzCWkTCrQG9E+FHKpOEVl4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JsLEzjoHjiuUXWON2JmK7eteNAe+8FUj8uipGyjaXRRH7AEthFp8DHU0xF6kqPFumPAqYAB6fZ/gFCWjBmqtTSgY8gBpfJnbTIk+P+2CUHlkLSsn98LIr907fCr+se5+EmRlM9APakDPfO7umirjA13B/rSU2EtmE4pshOo2vXm7szAlw26Nhw75no0FW9+gcHR66cMgH8gf6UbqT6k3mI3ozXZOecpJX/mvH/6xk65AAnYNkcq/8iYaInZ5RdF6bmwGfAFxVmUEvsS/QDp/jXeoHeXsGWBZdF5wDSfumbqvch4aQ3KV122HVPmi9CPb7RI5qbM1linV26WHmVL8jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout2.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout2.hostsharing.net (client-ip=83.223.78.240; helo=bmailout2.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
Received: from bmailout2.hostsharing.net (bmailout2.hostsharing.net [83.223.78.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dD7WG1gLHz2xqn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Nov 2025 21:24:55 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout2.hostsharing.net (Postfix) with ESMTPS id A58282006F59;
	Sat, 22 Nov 2025 11:24:51 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id 8E32C1BF15; Sat, 22 Nov 2025 11:24:51 +0100 (CET)
Date: Sat, 22 Nov 2025 11:24:51 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Farhan Ali <alifm@linux.ibm.com>
Cc: Bjorn Helgaas <helgaas@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Benjamin Block <bblock@linux.ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver OHalloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
	Linas Vepstas <linasvepstas@gmail.com>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation: PCI: Amend error recovery doc with
 pci_save_state() rules
Message-ID: <aSGPc2qQGgdjp7iV@wunner.de>
References: <077596ba70202be0e43fdad3bb9b93d356cbe4ec.1763746079.git.lukas@wunner.de>
 <ab3158f0-7954-4a89-88da-6d7d69111e3b@linux.ibm.com>
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
In-Reply-To: <ab3158f0-7954-4a89-88da-6d7d69111e3b@linux.ibm.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Nov 21, 2025 at 10:57:24AM -0800, Farhan Ali wrote:
> On 11/21/2025 9:31 AM, Lukas Wunner wrote:
> > +++ b/Documentation/PCI/pci-error-recovery.rst
> > @@ -326,6 +326,21 @@ be recovered, there is nothing more that can be done;  the platform
> >   will typically report a "permanent failure" in such a case.  The
> >   device will be considered "dead" in this case.
> > +Drivers typically need to call pci_restore_state() after reset to
> > +re-initialize the device's config space registers and thereby
> > +bring it from D0\ :sub:`uninitialized` into D0\ :sub:`active` state
> > +(PCIe r7.0 sec 5.3.1.1).  The PCI core invokes pci_save_state()
> > +on enumeration after initializing config space to ensure that a
> > +saved state is available for subsequent error recovery.
> > +Drivers which modify config space on probe may need to invoke
> > +pci_save_state() afterwards to record those changes for later
> > +error recovery.  When going into system suspend, pci_save_state()
> > +is called for every PCI device and that state will be restored
> > +not only on resume, but also on any subsequent error recovery.
> 
> Nit: Should we clarify in the above sentence on what calls the
> pci_save_state() when going into suspend? My assumption is the
> pci_save_state() is called by the PCI core and not the drivers?

Per section 3.1.2 of Documentation/power/pci.rst, pci_save_state()
may be called by either the driver or the PCI core.  Normally it's
the PCI core's responsibility, but a driver may choose to call it
and bring the device into a low power state itself.  The PCI core
recognizes that by looking at the state_saved flag in struct pci_dev
and will then neither call pci_save_state() nor transition the device
to a low power state.  That is the (only) purpose of the flag.

I could maybe add a cross-reference pointing to Documentation/power/pci.rst.
And/or that document could be moved to Documentation/PCI/.

> What should the PCI core do if the saved state recorded is bad? should we
> continue to restore the device with the recorded bad state?

Basically the answer is, it should never happen and if it does,
we've got a bug somewhere.

> On s390 restoring the device with the bad state can break the device
> put into error again.

My (limited) understanding is that you may end up with a bad
saved state on s390 virtualization scenarios because you're
telling the PCI core in the ->error_detected phase() that the
device has recovered and then you try to reset and recover the
device on your own.  I think the solution is to enhance qemu
to integrate better with error recovery on the host.

Thanks,

Lukas


Return-Path: <linuxppc-dev+bounces-15379-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 239EECFD167
	for <lists+linuxppc-dev@lfdr.de>; Wed, 07 Jan 2026 11:04:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmNt86Wnnz2yGL;
	Wed, 07 Jan 2026 21:04:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=83.223.95.100
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767780256;
	cv=none; b=hfZy9P5bh4jf7wAGGeOn0QJGCdSxndvsaYVmKWZBo2y+367ziq/xojo5hCd/KD1fu3IX7h8cwMRJoJyBzDs9WjSu5kFpxtZ263Ms3j/6C8Wh9v90Ar1SlwN9McOAOBjxqWbr0Ynxip0W3nY9oKXT79NQhWBlJ2pOI1+C/14FiQbiiWBgtW9dhm5mOzMftUbNsM0mEfpJxf4bHtb1BNPBL++n5wKOEdE0yp1MHooGHjYdJCU/7V/ikfbsTc9xxf9Q2uCYkU4y1KZkXElAgVo4bdH3R5O+WaNqHA2SFvTSmd0s7YstIx79BJHi2ZP/rJAG53xEI59sqhoopHveCC+uAw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767780256; c=relaxed/relaxed;
	bh=sCvt8SzGI/CM6Qbw3oeNTx0+CWLOhxX+81HvfIkt6Qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PCtmpSz9korUrY7oOBYt2XxJx9Zwk/J6N1DeKGZfuvzQE0EhE15OEKxvZmf5Vydf281zTWJxy0ZP1gR5EV0kPTs9OVYhKGuAdseMut2q6kjCFN/JbaLxDbudoPiNLohWdywkNnAFiAkPF9EDX/wiQ9Al2TJaon29T+cnljnIbBjXBYcV+XYe98ZfnT6K8B6G9l43QLFV6XmgfLzOR+4j8ZQmiGCHb4MN1PlPcJbYoQ9yf4zFnhem+6xGKr3SmgCuRWwGTkUFcdhujwlvtB562vuM3JknPxx2cbzKAUihq3eTnt2qhENsd4u9EWvR0JimpQ8pY32JrnJVMXGAhA8tTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de; spf=pass (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org) smtp.helo=bmailout1.hostsharing.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wunner.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=bmailout1.hostsharing.net (client-ip=83.223.95.100; helo=bmailout1.hostsharing.net; envelope-from=foo00@h08.hostsharing.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 429 seconds by postgrey-1.37 at boromir; Wed, 07 Jan 2026 21:04:15 AEDT
Received: from bmailout1.hostsharing.net (bmailout1.hostsharing.net [83.223.95.100])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmNt73JdYz2xbQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 21:04:15 +1100 (AEDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384
	 client-signature ECDSA (secp384r1) client-digest SHA384)
	(Client CN "*.hostsharing.net", Issuer "GlobalSign GCC R6 AlphaSSL CA 2025" (verified OK))
	by bmailout1.hostsharing.net (Postfix) with ESMTPS id EDF682C06A86;
	Wed,  7 Jan 2026 10:56:24 +0100 (CET)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
	id D862D30996; Wed,  7 Jan 2026 10:56:24 +0100 (CET)
Date: Wed, 7 Jan 2026 10:56:24 +0100
From: Lukas Wunner <lukas@wunner.de>
To: Atharva Tiwari <atharvatiwarilinuxdev@gmail.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] PCI/portdev: Disable AER for Titan Ridge 4C 2018
Message-ID: <aV4tyKPGioCqXTRr@wunner.de>
References: <20260107081445.1100-1-atharvatiwarilinuxdev@gmail.com>
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
In-Reply-To: <20260107081445.1100-1-atharvatiwarilinuxdev@gmail.com>
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jan 07, 2026 at 08:14:35AM +0000, Atharva Tiwari wrote:
> Changes since v1:
> 	Transferred logic to drivers/pci/quicks.c

This should go below the line with the three dashes
so that it's not included in the commit when the patch
is applied to the maintainer's git tree.

> Disable AER for Intel Titan Ridge 4C 2018
> (used in T2 iMacs, where the warnings appear)
> that generate continuous pcieport warnings. such as:
> 
> pcieport 0000:00:1c.4: AER: Correctable error message received from 0000:07:00.0
> pcieport 0000:07:00.0: PCIe Bus Error: severity=Correctable, type=Data Link Layer, (Receiver ID)
> pcieport 0000:07:00.0:   device [8086:15ea] error status/mask=00000080/00002000
> pcieport 0000:07:00.0:    [ 7] BadDLLP
> 
> (see: https://bugzilla.kernel.org/show_bug.cgi?id=220651)

Use a Link: or Closes: tag for the bugzilla URL.

> macOS also disables AER for Thunderbolt devices and controllers in their drivers.

Could you provide a link to the xnu source code
so that we can double-check what they're doing and why?

> +++ b/drivers/pci/quirks.c
> @@ -6340,4 +6340,13 @@ static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
>  }
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_timer_timeout);
>  DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_timer_timeout);
> +
> +static void pci_disable_aer(struct pci_dev *pdev)
> +{
> +	pdev->no_aer = 1;
> +}
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15EA, pci_disable_aer);
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15EB, pci_disable_aer);
> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_INTEL, 0x15EC, pci_disable_aer);
> +

This will disable AER on all arches for all users, yet you've claimed
that the issue is confined to T2 Macs and caused by their firmware.

The proper approach would be to move this quirk to arch/x86/pci/fixups.c
so that it's not compiled on other arches.  Moreover you need a DMI check
to constrain this to T2 Macs so that AER stays enabled on other machines.

Since this is a discrete Thunderbolt controller, it is important to cc
Thunderbolt maintainers to get their feedback, yet your v2 patch wasn't
cc'ed to them.  Please be sure to include them in any follow-up submissions.

Thanks,

Lukas


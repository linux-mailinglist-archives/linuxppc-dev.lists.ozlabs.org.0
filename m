Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AC2316936
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 15:34:41 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DbMj94mczzDvZN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 01:34:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbKYR09ZPzDshk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 23:57:47 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DbKYP3q8lz9sWT; Wed, 10 Feb 2021 23:57:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Oliver O'Halloran <oohall@gmail.com>
In-Reply-To: <20200902013657.1753830-1-oohall@gmail.com>
References: <20200902013657.1753830-1-oohall@gmail.com>
Subject: Re: [PATCH v2] powerpc/powernv/pci: Drop pnv_phb->initialized
Message-Id: <161296170666.3178259.2592113861832242190.b4-ty@ellerman.id.au>
Date: Wed, 10 Feb 2021 23:57:45 +1100 (AEDT)
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Sep 2020 11:36:57 +1000, Oliver O'Halloran wrote:
> The pnv_phb->initialized flag is an odd beast. It was added back in 2012 in
> commit db1266c85261 ("powerpc/powernv: Skip check on PE if necessary") to
> allow devices to be enabled even if the device had not yet been assigned to
> a PE. Allowing the device to be enabled before the PE is configured may
> cause spurious EEH events since none of the IOMMU context has been setup.
> 
> I'm not entirely sure why this was ever necessary. My best guess is that it
> was an workaround for a bug or some other undesireable behaviour from the
> PCI core. Either way, it's unnecessary now since as of commit dc3d8f85bb57
> ("powerpc/powernv/pci: Re-work bus PE configuration") we can guarantee that
> the PE will be configured before the PCI core will allow drivers to bind to
> the device.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/pci: Drop pnv_phb->initialized
      https://git.kernel.org/powerpc/c/24b4c6b1a7fc79fe8142d50cb439944b81b659ff

cheers

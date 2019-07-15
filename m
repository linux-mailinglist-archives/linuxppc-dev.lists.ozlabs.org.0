Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4268344
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 07:28:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nBrZ2wdczDqW3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2019 15:28:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nBmW4ldNzDqK1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2019 15:24:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45nBmW3RrRz9sNH; Mon, 15 Jul 2019 15:24:43 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 33439620680be5225c1b8806579a291e0d761ca0
In-Reply-To: <20190710150517.27114-1-oohall@gmail.com>
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/eeh: Handle hugepages in ioremap space
Message-Id: <45nBmW3RrRz9sNH@ozlabs.org>
Date: Mon, 15 Jul 2019 15:24:43 +1000 (AEST)
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-07-10 at 15:05:17 UTC, Oliver O'Halloran wrote:
> In commit 4a7b06c157a2 ("powerpc/eeh: Handle hugepages in ioremap
> space") support for using hugepages in the vmalloc and ioremap areas was
> enabled for radix. Unfortunately this broke EEH MMIO error checking.
> 
> Detection works by inserting a hook which checks the results of the
> ioreadXX() set of functions.  When a read returns a 0xFFs response we
> need to check for an error which we do by mapping the (virtual) MMIO
> address back to a physical address, then mapping physical address to a
> PCI device via an interval tree.
> 
> When translating virt -> phys we currently assume the ioremap space is
> only populated by PAGE_SIZE mappings. If a hugepage mapping is found we
> emit a WARN_ON(), but otherwise handles the check as though a normal
> page was found. In pathalogical cases such as copying a buffer
> containing a lot of 0xFFs from BAR memory this can result in the system
> not booting because it's too busy printing WARN_ON()s.
> 
> There's no real reason to assume huge pages can't be present and we're
> prefectly capable of handling them, so do that.
> 
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Fixes: 4a7b06c157a2 ("powerpc/eeh: Handle hugepages in ioremap space")
> Reported-by: Sachin Sant <sachinp@linux.vnet.ibm.com>
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> Tested-by: Sachin Sant <sachinp@linux.vnet.ibm.com>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/33439620680be5225c1b8806579a291e0d761ca0

cheers

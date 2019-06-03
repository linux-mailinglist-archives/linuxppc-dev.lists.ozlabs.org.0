Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC34532FBC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 14:34:49 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45HZJ65MdbzDqSB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jun 2019 22:34:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45HZFq4p7TzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jun 2019 22:32:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45HZFp6yhxz9s7h; Mon,  3 Jun 2019 22:32:46 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 02c5f5394918b9b47ff4357b1b18335768cd867d
X-Patchwork-Hint: ignore
Content-Type: text/plain; charset="utf-8";
In-Reply-To: <155568805354.600470.13376593185688810607.stgit@bahia.lan>
To: Greg Kurz <groug@kaod.org>, linux-kernel@vger.kernel.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH] powerpc/powernv/npu: Fix reference leak
Message-Id: <45HZFp6yhxz9s7h@ozlabs.org>
Date: Mon,  3 Jun 2019 22:32:46 +1000 (AEST)
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Alistair Popple <alistair@popple.id.au>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-04-19 at 15:34:13 UTC, Greg Kurz wrote:
> Since 902bdc57451c, get_pci_dev() calls pci_get_domain_bus_and_slot(). This
> has the effect of incrementing the reference count of the PCI device, as
> explained in drivers/pci/search.c:
> 
>  * Given a PCI domain, bus, and slot/function number, the desired PCI
>  * device is located in the list of PCI devices. If the device is
>  * found, its reference count is increased and this function returns a
>  * pointer to its data structure.  The caller must decrement the
>  * reference count by calling pci_dev_put().  If no device is found,
>  * %NULL is returned.
> 
> Nothing was done to call pci_dev_put() and the reference count of GPU and
> NPU PCI devices rockets up.
> 
> A natural way to fix this would be to teach the callers about the change,
> so that they call pci_dev_put() when done with the pointer. This turns
> out to be quite intrusive, as it affects many paths in npu-dma.c,
> pci-ioda.c and vfio_pci_nvlink2.c. Also, the issue appeared in 4.16 and
> some affected code got moved around since then: it would be problematic
> to backport the fix to stable releases.
> 
> All that code never cared for reference counting anyway. Call pci_dev_put()
> from get_pci_dev() to revert to the previous behavior.
> 
> Fixes: 902bdc57451c ("powerpc/powernv/idoa: Remove unnecessary pcidev from pci_dn")
> Cc: stable@vger.kernel.org # v4.16
> Signed-off-by: Greg Kurz <groug@kaod.org>
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/02c5f5394918b9b47ff4357b1b183357

cheers

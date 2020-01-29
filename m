Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 151E514C5E3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 06:35:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486sd06Gc6zDqNF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Jan 2020 16:35:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 486sDh6hNrzDqMn
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2020 16:17:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 486sDh4x2wz9sRR; Wed, 29 Jan 2020 16:17:24 +1100 (AEDT)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: 05dd7da76986937fb288b4213b1fa10dbe0d1b33
In-Reply-To: <20191121134918.7155-2-fbarrat@linux.ibm.com>
To: Frederic Barrat <fbarrat@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 andrew.donnellan@au1.ibm.com, clombard@linux.ibm.com
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH v2 01/11] powerpc/powernv/ioda: Fix ref count for devices
 with their own PE
Message-Id: <486sDh4x2wz9sRR@ozlabs.org>
Date: Wed, 29 Jan 2020 16:17:24 +1100 (AEDT)
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
Cc: aik@ozlabs.ru, Frederic Barrat <fbarrat@linux.ibm.com>, oohall@gmail.com,
 groug@kaod.org, alastair@au1.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2019-11-21 at 13:49:08 UTC, Frederic Barrat wrote:
> The pci_dn structure used to store a pointer to the struct pci_dev, so
> taking a reference on the device was required. However, the pci_dev
> pointer was later removed from the pci_dn structure, but the reference
> was kept for the npu device.
> See commit 902bdc57451c ("powerpc/powernv/idoa: Remove unnecessary
> pcidev from pci_dn").
> 
> We don't need to take a reference on the device when assigning the PE
> as the struct pnv_ioda_pe is cleaned up at the same time as
> the (physical) device is released. Doing so prevents the device from
> being released, which is a problem for opencapi devices, since we want
> to be able to remove them through PCI hotplug.
> 
> Now the ugly part: nvlink npu devices are not meant to be
> released. Because of the above, we've always leaked a reference and
> simply removing it now is dangerous and would likely require more
> work. There's currently no release device callback for nvlink devices
> for example. So to be safe, this patch leaks a reference on the npu
> device, but only for nvlink and not opencapi.
> 
> CC: aik@ozlabs.ru
> CC: oohall@gmail.com
> Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>

Series applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/05dd7da76986937fb288b4213b1fa10dbe0d1b33

cheers

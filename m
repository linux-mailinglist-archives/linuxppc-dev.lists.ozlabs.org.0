Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 623606190F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 03:59:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hpYB6Rl4zDqF5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 11:59:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hng43HVtzDqQ9
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 11:19:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 45hng32RrMz9sP2; Mon,  8 Jul 2019 11:19:43 +1000 (AEST)
X-powerpc-patch-notification: thanks
X-powerpc-patch-commit: dead1c845dbe97e0061dae2017eaf3bd8f8f06ee
In-Reply-To: <20190626023746.94250-1-aik@ozlabs.ru>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
From: Michael Ellerman <patch-notifications@ellerman.id.au>
Subject: Re: [PATCH kernel v2] powerpc/pci/of: Parse unassigned resources
Message-Id: <45hng32RrMz9sP2@ozlabs.org>
Date: Mon,  8 Jul 2019 11:19:43 +1000 (AEST)
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
 Alistair Popple <alistair@popple.id.au>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Paul Mackerras <paulus@samba.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2019-06-26 at 02:37:46 UTC, Alexey Kardashevskiy wrote:
> The pseries platform uses the PCI_PROBE_DEVTREE method of PCI probing
> which reads "assigned-addresses" of every PCI device and initializes
> the device resources. However if the property is missing or zero sized,
> then there is no fallback of any kind and the PCI resources remain
> undiscovered, i.e. pdev->resource[] array remains empty.
> 
> This adds a fallback which parses the "reg" property in pretty much same
> way except it marks resources as "unset" which later make Linux assign
> those resources proper addresses.
> 
> This has an effect when:
> 1. a hypervisor failed to assign any resource for a device;
> 2. /chosen/linux,pci-probe-only=0 is in the DT so the system may try
> assigning a resource.
> Neither is likely to happen under PowerVM.
> 
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>

Applied to powerpc next, thanks.

https://git.kernel.org/powerpc/c/dead1c845dbe97e0061dae2017eaf3bd8f8f06ee

cheers

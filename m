Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 272A146C553
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 21:58:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7t1F03g3z30MC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 07:58:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oNWOya01;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=oNWOya01; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7t0324Psz3cb0
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 07:57:07 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EDE53B81E82;
 Tue,  7 Dec 2021 20:57:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43DACC341C1;
 Tue,  7 Dec 2021 20:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638910624;
 bh=XrslgRHtCWkizJFdxh4LYx0Ea6YIT+zkeRKUg8jgH50=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=oNWOya01lPJvnE3tH25W+i5fvBukvCWqbSt8o6DALtpqSoHuRmTol41FHNBbcEmwf
 ndqs+TUJ09ke7BxWb8HjaLc/fY3tO470dZ4Qyno4Wpq5/bEnoEjzOjsbXmUV1qPZIo
 hVQXatTYM8u7grl3xYsaQbLBxtsdENIZvu9pTIxNja33qod3Ecev9Ir5ev8d5C96pY
 0IK/7dJ9j/4mbDBL0nO4T+nU7isZp4iut/H/gQt557Of3NPt7vq7/9Jpi+jESYyg4O
 IkM/M8qlqvOoGLJfagsdSI/guqcNiYtMrzlfaFPpkvCs0s96NJKjtT7Cv9aAODCAWZ
 Q3dkMDUriYcZA==
Date: Tue, 7 Dec 2021 14:57:03 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V2 13/23] PCI/MSI: Cleanup include zoo
Message-ID: <20211207205703.GA76805@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211206210224.539281124@linutronix.de>
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
Cc: linux-hyperv@vger.kernel.org, linux-mips@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Wei Liu <wei.liu@kernel.org>, Ashok Raj <ashok.raj@intel.com>, x86@kernel.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Megha Dey <megha.dey@intel.com>, Jason Gunthorpe <jgg@nvidia.com>,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 ath11k@lists.infradead.org, Kevin Tian <kevin.tian@intel.com>,
 Heiko Carstens <hca@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>, Cedric Le Goater <clg@kaod.org>,
 Kalle Valo <kvalo@codeaurora.org>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, Marc Zygnier <maz@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Dec 06, 2021 at 11:27:44PM +0100, Thomas Gleixner wrote:
> Get rid of the pile of unneeded includes which accumulated over time.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Tested-by: Juergen Gross <jgross@suse.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Nice, thanks!

> ---
> V2: Address build fail on powerpc - Cedric
> ---
>  drivers/pci/msi.c |   16 ++++------------
>  1 file changed, 4 insertions(+), 12 deletions(-)
> 
> --- a/drivers/pci/msi.c
> +++ b/drivers/pci/msi.c
> @@ -7,22 +7,14 @@
>   * Copyright (C) 2016 Christoph Hellwig.
>   */
>  
> +#include <linux/acpi_iort.h>
>  #include <linux/err.h>
> -#include <linux/mm.h>
> -#include <linux/irq.h>
> -#include <linux/interrupt.h>
>  #include <linux/export.h>
> -#include <linux/ioport.h>
> -#include <linux/pci.h>
> -#include <linux/proc_fs.h>
> -#include <linux/msi.h>
> -#include <linux/smp.h>
> -#include <linux/errno.h>
> -#include <linux/io.h>
> -#include <linux/acpi_iort.h>
> -#include <linux/slab.h>
> +#include <linux/irq.h>
>  #include <linux/irqdomain.h>
> +#include <linux/msi.h>
>  #include <linux/of_irq.h>
> +#include <linux/pci.h>
>  
>  #include "pci.h"
>  
> 

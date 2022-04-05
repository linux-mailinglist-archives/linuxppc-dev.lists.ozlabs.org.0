Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A197A4F3C96
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Apr 2022 18:18:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KXt9F3csDz3bfg
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 02:18:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=d9bKmV/0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=d9bKmV/0; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KXt8d2LVQz2yJ5
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 02:17:37 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D7ACB81D6D;
 Tue,  5 Apr 2022 16:17:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F12D0C385A4;
 Tue,  5 Apr 2022 16:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649175451;
 bh=9i+q2ZN9TmxfoI0nuVfh6ATI7dSt6NeIA1KoAxqH9Wo=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=d9bKmV/0IMeeXRcs+lJgcy2FAU7lLCVkihgX4OgOBMkO1BYdDu8qxnUx2/rqg7UyV
 DzDTTlCGsm+r8VfiUlQkuC+3f3h6koQ2HES1mTi9Q2now2v+7ba3/ryJgnWGydGAmV
 uifbtzr2x1eCuFnu+B0llXSSt6zyAwaXYioJ58oNh0uEp01YDQs/9HLXhdbJ46n/LC
 EMF8fRU7e8J/LFe++amL1j9hkDYSZ8hBWivyrqg8UyGXzu7q/I1r2+SfJ7k9vXv4pl
 yRa6lxE7a2Dru+ZbrOLiv++PMJfDzhFEsrlGh7dWEDnp4DPIpUjAhXyMVe6QwAcqfh
 CyBn92r+JO3Bg==
Date: Tue, 5 Apr 2022 11:17:29 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] pci: hotplug: Prepare cleanup of powerpc's asm/prom.h
Message-ID: <20220405161729.GA71083@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <79201f5fae8d003164ac36ed3be7789db1bc5ab4.1648833421.git.christophe.leroy@csgroup.eu>
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 02, 2022 at 12:11:56PM +0200, Christophe Leroy wrote:
> powerpc's asm/prom.h brings some headers that it doesn't
> need itself.
> 
> In order to clean it up, first add missing headers in
> users of asm/prom.h
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I tidied the subject line to match previous history and applied to
pci/hotplug for v5.19, thanks!

> ---
>  drivers/pci/hotplug/pnv_php.c       | 1 +
>  drivers/pci/hotplug/rpadlpar_core.c | 1 +
>  drivers/pci/hotplug/rpaphp_core.c   | 2 ++
>  drivers/pci/hotplug/rpaphp_pci.c    | 1 +
>  drivers/pci/hotplug/rpaphp_slot.c   | 1 +
>  5 files changed, 6 insertions(+)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index f4c2e6e01be0..881d420637bf 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -9,6 +9,7 @@
>  #include <linux/module.h>
>  #include <linux/pci.h>
>  #include <linux/pci_hotplug.h>
> +#include <linux/of_fdt.h>
>  
>  #include <asm/opal.h>
>  #include <asm/pnv-pci.h>
> diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
> index e6991ff67526..980bb3afd092 100644
> --- a/drivers/pci/hotplug/rpadlpar_core.c
> +++ b/drivers/pci/hotplug/rpadlpar_core.c
> @@ -15,6 +15,7 @@
>  
>  #include <linux/init.h>
>  #include <linux/module.h>
> +#include <linux/of.h>
>  #include <linux/pci.h>
>  #include <linux/string.h>
>  #include <linux/vmalloc.h>
> diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
> index 9887c9de08c3..491986197c47 100644
> --- a/drivers/pci/hotplug/rpaphp_core.c
> +++ b/drivers/pci/hotplug/rpaphp_core.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/moduleparam.h>
> +#include <linux/of.h>
>  #include <linux/pci.h>
>  #include <linux/pci_hotplug.h>
>  #include <linux/smp.h>
> @@ -20,6 +21,7 @@
>  #include <asm/eeh.h>       /* for eeh_add_device() */
>  #include <asm/rtas.h>		/* rtas_call */
>  #include <asm/pci-bridge.h>	/* for pci_controller */
> +#include <asm/prom.h>
>  #include "../pci.h"		/* for pci_add_new_bus */
>  				/* and pci_do_scan_bus */
>  #include "rpaphp.h"
> diff --git a/drivers/pci/hotplug/rpaphp_pci.c b/drivers/pci/hotplug/rpaphp_pci.c
> index c380bdacd146..630f77057c23 100644
> --- a/drivers/pci/hotplug/rpaphp_pci.c
> +++ b/drivers/pci/hotplug/rpaphp_pci.c
> @@ -8,6 +8,7 @@
>   * Send feedback to <lxie@us.ibm.com>
>   *
>   */
> +#include <linux/of.h>
>  #include <linux/pci.h>
>  #include <linux/string.h>
>  
> diff --git a/drivers/pci/hotplug/rpaphp_slot.c b/drivers/pci/hotplug/rpaphp_slot.c
> index 93b4a945c55d..779eab12e981 100644
> --- a/drivers/pci/hotplug/rpaphp_slot.c
> +++ b/drivers/pci/hotplug/rpaphp_slot.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/sysfs.h>
> +#include <linux/of.h>
>  #include <linux/pci.h>
>  #include <linux/string.h>
>  #include <linux/slab.h>
> -- 
> 2.35.1
> 

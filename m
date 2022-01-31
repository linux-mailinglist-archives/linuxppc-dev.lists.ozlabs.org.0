Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCC164A5265
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 23:30:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnjSK4lsxz3c9f
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 09:30:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FWRJLJWX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2f;
 helo=mail-oo1-xc2f.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FWRJLJWX; dkim-atps=neutral
Received: from mail-oo1-xc2f.google.com (mail-oo1-xc2f.google.com
 [IPv6:2607:f8b0:4864:20::c2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnjRk0dKhz2y7J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 09:29:53 +1100 (AEDT)
Received: by mail-oo1-xc2f.google.com with SMTP id
 q145-20020a4a3397000000b002e85c7234b1so3575882ooq.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Jan 2022 14:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=HIrK/ll1TuZEnp2gfWjGUr6nhrl/RDbWrtbWrrFF7+Q=;
 b=FWRJLJWX37blE6SLGzHmlsU0MZaU9sC2V0CKgL2guyKi7ulFdCvCxfSgomLcISQkgy
 Ghq8SQIK4GU/McVbpX2lJ7OYShY6Lw5N7YDemT7S61dxt4UkLuWkbDmiWtLV762XImzN
 iPIwaCk0oidTkqG5YTSOx1D94ZX/cJ8UT38VexR809vDAIRCTgiUw9WdmH8i4zF4TaOY
 sjkQKwFCacqbbThjmKuhVAZ23rOdKjSaGbe/NcrwAPbrDF4+HCEGEKm+QiAzCwCa95P5
 wn42EJBxoXEh5EO4PWRYI2RctRR7vXFMjMJ7lAfqUaFIvg6vDktEasPwIfoCZezXf5fQ
 Un3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mime-version:content-disposition;
 bh=HIrK/ll1TuZEnp2gfWjGUr6nhrl/RDbWrtbWrrFF7+Q=;
 b=n3tVOOk9ICt0sYxqRekSLobqO2Di5/t2woa4wp39wohAGYWKeZuF19STqWntkLIDXg
 MART2M4oESZEWFcGfWFZK2AZrNztfPgxEARDfDMqWaE5o13NZL4mhLrO/A2nxNKjFIMj
 2exqZdI9GKFyXfhgH8ZErILI11G4KKDoEYKCsXCyIK2Oq9GZkXDt9VaE5fPmGvKdPGKG
 BuNNpbbjcvJBHAZqg+ZjQpM1/34P3RtyraFeGooxQ9+m5PbK6PnTqfhD8/JoVfLR1WWT
 lwOrYkz14WQd61mUsoqmua+JtEA/00TUXPZXapII+jLcllNa9NMBU+6evD0U8bgUbn1d
 IzDw==
X-Gm-Message-State: AOAM530A7bVVbpKJ6bnZG+2+gVn6YJ7XX2sF8JrmI/KMgZX3h9ZewN85
 uK4lAMfIRDThFzKx19DiL1I=
X-Google-Smtp-Source: ABdhPJx+o1YTpwbEBbSj59Y5iWO00V4GxVy7uT2QJWPM1Z04rC1/i4P0mk8FIqDSuUFbw+Zw9FPkQg==
X-Received: by 2002:a4a:7656:: with SMTP id w22mr11304612ooe.79.1643668190906; 
 Mon, 31 Jan 2022 14:29:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 g4sm9441095otg.61.2022.01.31.14.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 14:29:50 -0800 (PST)
Date: Mon, 31 Jan 2022 14:29:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [patch V3 28/35] PCI/MSI: Simplify pci_irq_get_affinity()
Message-ID: <20220131222949.GA3467472@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Cc: Nishanth Menon <nm@ti.com>, Mark Rutland <mark.rutland@arm.com>,
 Stuart Yoder <stuyoder@gmail.com>, linux-pci@vger.kernel.org,
 Will Deacon <will@kernel.org>, Peter Ujfalusi <peter.ujfalusi@gmail.com>,
 Ashok Raj <ashok.raj@intel.com>, Jassi Brar <jassisinghbrar@gmail.com>,
 Sinan Kaya <okaya@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Megha Dey <megha.dey@intel.com>,
 Jason Gunthorpe <jgg@nvidia.com>, xen-devel@lists.xenproject.org,
 Kevin Tian <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@kaod.org>, Santosh Shilimkar <ssantosh@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Juergen Gross <jgross@suse.com>, Tero Kristo <kristo@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 LKML <linux-kernel@vger.kernel.org>, iommu@lists.linux-foundation.org,
 Marc Zygnier <maz@kernel.org>, dmaengine@vger.kernel.org,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jan 31, 2022 at 10:16:41PM +0100, Thomas Gleixner wrote:
> Guenter,
> 
> On Mon, Jan 31 2022 at 07:21, Guenter Roeck wrote:
> > Sure. Please see http://server.roeck-us.net/qemu/x86/.
> > The logs are generated with with v5.16.4.
> 
> thanks for providing the data. It definitely helped me to leave the
> state of not seeing the wood for the trees. Fix below.
> 
> Thanks,
> 
>         tglx
> ---
> Subject: PCI/MSI: Remove bogus warning in pci_irq_get_affinity()
> From: Thomas Gleixner <tglx@linutronix.de>
> Date: Mon, 31 Jan 2022 22:02:46 +0100
> 
> The recent overhaul of pci_irq_get_affinity() introduced a regression when
> pci_irq_get_affinity() is called for an MSI-X interrupt which was not
> allocated with affinity descriptor information.
> 
> The original code just returned a NULL pointer in that case, but the rework
> added a WARN_ON() under the assumption that the corresponding WARN_ON() in
> the MSI case can be applied to MSI-X as well.
> 
> In fact the MSI warning in the original code does not make sense either
> because it's legitimate to invoke pci_irq_get_affinity() for a MSI
> interrupt which was not allocated with affinity descriptor information.
> 
> Remove it and just return NULL as the original code did.
> 
> Fixes: f48235900182 ("PCI/MSI: Simplify pci_irq_get_affinity()")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  drivers/pci/msi/msi.c |    3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> --- a/drivers/pci/msi/msi.c
> +++ b/drivers/pci/msi/msi.c
> @@ -1111,7 +1111,8 @@ const struct cpumask *pci_irq_get_affini
>  	if (!desc)
>  		return cpu_possible_mask;
>  
> -	if (WARN_ON_ONCE(!desc->affinity))
> +	/* MSI[X] interrupts can be allocated without affinity descriptor */
> +	if (!desc->affinity)
>  		return NULL;
>  
>  	/*

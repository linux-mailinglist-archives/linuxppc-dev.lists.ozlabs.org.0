Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCC962CE14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 23:52:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCJGh43Fyz3cK7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 09:52:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sZmX6Yg3;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=57u6ql1e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=sZmX6Yg3;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=57u6ql1e;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCJFp4FmYz3cJX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 09:51:58 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668639114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=og7VFGWgga/WDNrUO7ZE1y9YFk0rZZz1Y7SQa3rc/Bo=;
	b=sZmX6Yg3XezzZ2hq1tZefSPYyfecyqklALECXScfxof5PazPB2pQMWRIq3wUTu43H8z6hb
	WEwyl4EmYgpScWUlFaXeaT282S6rdI53Thh1Za1i6LXUb+psAzFJsG3vdZDfFLVyvw/JCw
	cwNu2XjbgPipQlBYCSry4kJc84H4Kg8smh1T7pMdbtgloyQJlj9sRzAx4eomTMleUHdPKo
	hlT3wRrONZpVSFl2GOjlxVJkbhazs1D90M/bX1BePMGs/NwN3nEx3gsHEQESH0iRS6Cpju
	DVXaRP9DDJutgsollRsjdoUnbJGLLBgUHHoh6qVhBUkccGZHxhG2kB4lpTMsRQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668639114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=og7VFGWgga/WDNrUO7ZE1y9YFk0rZZz1Y7SQa3rc/Bo=;
	b=57u6ql1eCbyCY2SupG0ktAPUYRyn+XthnjW8tkxBEfsMcHX0R/8u/XSsMZf/nZLpWEX8UW
	CM5vMBglNyqiNVAA==
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [patch 13/39] PCI/MSI: Use msi_domain_info::bus_token
In-Reply-To: <Y3UjOc2XhwYSVVP1@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.352437595@linutronix.de> <Y3UjOc2XhwYSVVP1@nvidia.com>
Date: Wed, 16 Nov 2022 23:51:54 +0100
Message-ID: <87fseio6lx.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16 2022 at 13:51, Jason Gunthorpe wrote:
> On Fri, Nov 11, 2022 at 02:54:35PM +0100, Thomas Gleixner wrote:
>>  	/* PCI-MSI is oneshot-safe */
>>  	info->chip->flags |= IRQCHIP_ONESHOT_SAFE;
>> +	/* Let the core update the bus token */
>> +	info->bus_token = DOMAIN_BUS_PCI_MSI;
>
> comment seems a bit obvious

:)

> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
> Should the callers be updated to set this in their "struct
> msi_domain_info" ?

For PCI/MSI we can handle that in the core for all of them. :)

The other msi_domain_info usage in various places needs obviously
special care.

Thanks,

        tglx

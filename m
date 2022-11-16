Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5036762CE0C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 23:50:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCJDb1X2Bz3dvD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 09:50:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=i2zVGcjj;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tPDGD/t7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=i2zVGcjj;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=tPDGD/t7;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCJCg6LBjz3cJX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 09:50:07 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668639004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KJINf6BQpwrxQblgElY3Z/Qake6SaBEaI8K197mgKXI=;
	b=i2zVGcjjlmtD6RzaAN7Rd8kq8M9SCk4OpZIQDtcnq05onovT5445baNfe1sWBc2cspfcGV
	lUd0NTWh04skUtkdZpVkqtXRa00FHct9e+ll7+ToZyQ3mGc9rSNCCmckoPMBVGb9UHLlAs
	X/xaF0Gx3UqpT7weCv6SGUUg78LHE6qMqpmJPehXumZ4PZlkS7qbS/J6XZk74LdBKHv1k6
	ismg4/n78osu6aIytwon5YEISBmtQHQHNyhDRs6HSkEFWSGJLWUV/UvR+NQW6MyBGw9JiG
	77+S86sUqEy1+O3RIq/jaOCEVEn+OC4BVRAklJIr0G6vKZRy9NrTKCPVHZKfYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668639004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KJINf6BQpwrxQblgElY3Z/Qake6SaBEaI8K197mgKXI=;
	b=tPDGD/t7fzyzH2BG49DjIxgAsUrKrCtx9CryyXHlRnNXrE1tNhMmGX4Wm6sSFgsZI1yKx/
	K10CADLTJTyEk+AA==
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [patch 12/39] genirq/msi: Add bus token to struct msi_domain_info
In-Reply-To: <Y3Uim3pC3hy3HwH8@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.294554462@linutronix.de> <Y3Uim3pC3hy3HwH8@nvidia.com>
Date: Wed, 16 Nov 2022 23:50:04 +0100
Message-ID: <87iljeo6oz.ffs@tglx>
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

On Wed, Nov 16 2022 at 13:49, Jason Gunthorpe wrote:

> On Fri, Nov 11, 2022 at 02:54:33PM +0100, Thomas Gleixner wrote:
>> From: Ahmed S. Darwish <darwi@linutronix.de>
>> 
>> Add a bus token member to struct msi_domain_info and let
>> msi_create_irq_domain() set the bus token.
>> 
>> That allows to remove the bus token updates at the call sites.
>> 
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> ---
>>  include/linux/msi.h |   19 +++++++++++--------
>>  kernel/irq/msi.c    |    7 +++++--
>>  2 files changed, 16 insertions(+), 10 deletions(-)
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>
>>  struct msi_domain_info {
>> -	u32			flags;
>> -	struct msi_domain_ops	*ops;
>> -	struct irq_chip		*chip;
>> -	void			*chip_data;
>> -	irq_flow_handler_t	handler;
>> -	void			*handler_data;
>> -	const char		*handler_name;
>> -	void			*data;
>> +	u32				flags;
>> +	enum irq_domain_bus_token	bus_token;
>> +	struct msi_domain_ops		*ops;
>> +	struct irq_chip			*chip;
>> +	void				*chip_data;
>> +	irq_flow_handler_t		handler;
>> +	void				*handler_data;
>> +	const char			*handler_name;
>> +	void				*data;
>>  };
>
> This is why I've been frowning on horizontal alignment :(

Yes, it's annoying when you have to adjust it, but it's fundamentaly
simpler to parse than the clogged together word salad.

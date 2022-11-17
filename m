Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C68862D4EE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 09:23:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCXwz07swz3cf2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 19:23:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pRs5JR7b;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VPYEAu0O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pRs5JR7b;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=VPYEAu0O;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCXw04mnYz3cKn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 19:22:24 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668673338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIVX2MwJcu88wyoRSA1ASXFeHTanLRpod2fOiAYk42Q=;
	b=pRs5JR7b+MK5IrHfaCpInQxaDeC9PvLo7Zo1msTJyoCGPbL+6O8u4CqY3P5lAAqWNgdDeS
	Wor/o6pp3iVymD4p2gJG/HMX74WixBFfLFutuf+HsdWohrU85CZzDkvVKrovF6T+T3m+AW
	BDyNHqKpKeCG8Pa2zdgXoqAMhZ4x3ntI+1l75eBvNGQy5jeEGTbkgKSYJuB9Xa+hDLyRPo
	CP3cEuwwh7lHoufv9Otj/O10K7OhQ0HLfG06MINUxbYTEwlTMqaY9g/V9xuSqs+FZfpGMk
	JRzV6t/Z3sPM+330lwYCsVQBePNWNqlFlrM6HYoHwLO+biS1QiI67/gbnW8E4Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668673338;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wIVX2MwJcu88wyoRSA1ASXFeHTanLRpod2fOiAYk42Q=;
	b=VPYEAu0OHciMT2/0zjp9NwK3Ej0xV3gqu1ZiXKKa3Bl2hm2hGGSIINgmAIItBguwG+ofeA
	EnxX6Q1iJQJvdiDQ==
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch 34/39] PCI/MSI: Reject multi-MSI early
In-Reply-To: <20221116163118.GA1116261@bhelgaas>
References: <20221116163118.GA1116261@bhelgaas>
Date: Thu, 17 Nov 2022 09:22:18 +0100
Message-ID: <8735aing79.ffs@tglx>
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16 2022 at 10:31, Bjorn Helgaas wrote:
> On Fri, Nov 11, 2022 at 02:55:09PM +0100, Thomas Gleixner wrote:
>>  
>> +/**
>> + * pci_msi_domain_supports - Check for support of a particular feature flag
>> + * @pdev:		The PCI device to operate on
>> + * @feature_mask:	The feature mask to check for (full match)
>> + * @mode:		If ALLOW_LEGACY this grants the feature when there is no irq domain
>> + *			associated to the device. If DENY_LEGACY the lack of an irq domain
>> + *			makes the feature unsupported
>
> Looks like some of these might be wider than 80 columns, which I think
> was the typical width of this file.

I accommodated to the general sentiment that 80 columns is yesterday. My
new cutoff is 100.

Thanks,

        tglx

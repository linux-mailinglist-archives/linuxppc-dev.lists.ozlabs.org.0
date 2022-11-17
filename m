Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B759F62DEF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 16:01:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCjmx4l4Gz3dvP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 02:01:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yIMYsx8A;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zD3n5Lru;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=yIMYsx8A;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=zD3n5Lru;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCjlz403Rz3c9B
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 02:01:03 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668697259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RP+U+feZlcZmrP3/IlXzJjEfrliAdXsJ/Be3VTH8hM4=;
	b=yIMYsx8Ax/ruYoEaGB1680I3hBo33RXitUEA7+OswjFiHPWiao11xXYIPjCJvTM2HCKaI2
	RY7j8mOW2ncx+3XttulWIEsrwrOODQ+4ZsrTQ7ufRC5IwPXGED+cydt8Wi2iNcTejnW4BH
	GgGs/41wgb0SUGvNk1ONVVc/6kNv3J+M5NACfPeN5D0bLosXCcEsNYnxKhbFXYu51i3MbX
	qaNNPRCMV2c0+ex4tdvDIoqEOm9H/tQsBWcrDGUC7qT1PNY7IBJXiAQ8kQIyhguimgV2rR
	OgoiPXH4zFIqhCiB46/y6o8YQwdobX4ctsnN3sbopkL08t5BQv4ydmABvcHAdg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668697259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RP+U+feZlcZmrP3/IlXzJjEfrliAdXsJ/Be3VTH8hM4=;
	b=zD3n5LruqflYwcA/byHi6Sl3zDk32yjCX+vWdV3TVGvkIuIL5PtPucTyH45LuHX4K2xR9n
	HW/N/3UKH0gtg3DA==
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [patch 39/39] x86/apic: Remove X86_IRQ_ALLOC_CONTIGUOUS_VECTORS
In-Reply-To: <Y3Umh+Pa1WSJ33fD@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122015.865042356@linutronix.de> <Y3Umh+Pa1WSJ33fD@nvidia.com>
Date: Thu, 17 Nov 2022 16:00:58 +0100
Message-ID: <87a64pmxqt.ffs@tglx>
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed
 S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jason, Bjorn, Ashok!

On Wed, Nov 16 2022 at 14:05, Jason Gunthorpe wrote:
> On Fri, Nov 11, 2022 at 02:55:17PM +0100, Thomas Gleixner wrote:
>> Now that the PCI/MSI core code does early checking for multi-MSI support
>> X86_IRQ_ALLOC_CONTIGUOUS_VECTORS is not required anymore.
>
>> Remove the flag and rely on MSI_FLAG_MULTI_PCI_MSI.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>

Thanks for taking the time to go through this pile!

       tglx

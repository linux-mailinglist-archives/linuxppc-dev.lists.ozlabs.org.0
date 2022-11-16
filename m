Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8205862C5EC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:07:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8cd315pz3cBD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:07:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lb4e92ZP;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sYbIvezO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lb4e92ZP;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=sYbIvezO;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8ZZ74Bqz3f7B
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:05:58 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668618356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0nLXzHCM/9XWJ+CMFPSpqROvymes9f+yWx6tRnxa+c=;
	b=lb4e92ZPrWNarh8wXVyzL34Lx5FSRAuYKSVO+wWi99kVOgC6pKy9eyOEUz2LeKKVwAnU9J
	POoEMyE8RXbX+nLRVcwlaMMI6hXH9MaaELMsWDxe9HQfkrYC/FukDwtL/cZ3I2aWaK5m3v
	wfeD2W0O3ZVtfhAfkAymQaSFAXEj2FmNhKJl6EjWye4YCJ+nnWKnifI5ZF7x2Na4O8ELWQ
	sgZ8wVyc3DxUotRZPGm2zaeI/Eni3ScKxnrxJMCzKiNIX/gN3p/uN1SNCt9YknAmeHF4os
	KZ4jKed0PqMc6rVZQQAyyToJe8hXLm94RpQc+LjjxLy5L31FLb69dV8z8uttpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668618356;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b0nLXzHCM/9XWJ+CMFPSpqROvymes9f+yWx6tRnxa+c=;
	b=sYbIvezOT81QU499/hP7iD6CvOFKqoHyM3Yf48D+LHOeB+ppdhzCEz71TqsqPLg1bB8qZy
	0mMPMBKYHddP/QCg==
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch 20/39] PCI/MSI: Move pci_enable_msi() API to api.c
In-Reply-To: <20221116161839.GA1115061@bhelgaas>
References: <20221116161839.GA1115061@bhelgaas>
Date: Wed, 16 Nov 2022 18:05:55 +0100
Message-ID: <87mt8qq170.ffs@tglx>
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

On Wed, Nov 16 2022 at 10:18, Bjorn Helgaas wrote:
> On Fri, Nov 11, 2022 at 02:54:46PM +0100, Thomas Gleixner wrote:
>> From: Ahmed S. Darwish <darwi@linutronix.de>
>> 
>> To distangle the maze in msi.c all exported device-driver MSI APIs are now
>> to be grouped in one file, api.c.
>> 
>> Move pci_enable_msi() and make its kernel-doc comprehensive.
>> 
>> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>
> Nit: suggest "disentangle" or "untangle" for "distangle" here and in
> subsequent patches.

My fault. I suggested the word to Ahmed well knowing that this is one of
the words I never get spelled correctly :)

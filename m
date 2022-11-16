Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 126B762C5E6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:06:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8bc6mHPz3dvq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:06:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EohNRDhs;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ckye8rDI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=EohNRDhs;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Ckye8rDI;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8Xm31Tjz3cKV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:04:24 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668618260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Haup1+EG6/nyZ+dTGHkeO4GoC5W1dC85saJanHjmmb0=;
	b=EohNRDhsZX3YNcyJ4gnN9eEHeeGTGmgS0vaYkSBnpxiqZ4hgpefZJ+mLrZ1AgOloCkEc6K
	6WRNM6BV/MuXhXd9h7W+DB+dfWlXp3tYG3YhqA9XR00/0PXP0381a47uiZbZSao7TpsRUH
	QsUWRy//tMsojpVM/c9tjDo4tUrkKe8h+49ZGDXNd0mtNWROjByJAuZWS1ES66sDt9ah+3
	wdIl5ekfKcRhEljA1oOGPwll/R8fP+CdpI0R/kAuz0hC5I04X41OcpsTM6ItAhc4revBop
	RMDzDqPrCFWvHWyov7+9obntnAbLqGN1GlxjgTe+HYbISWOaaV2YPE73vyCNyA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668618260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Haup1+EG6/nyZ+dTGHkeO4GoC5W1dC85saJanHjmmb0=;
	b=Ckye8rDIgS7J7NV3L3Clr4HG9VuIyyDOMR7gghBvjxvNkIhp0jWte1cUOhVJw7Wf2hYg2L
	CzpJcC4xDl1OgoAg==
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch 15/39] PCI/MSI: Get rid of PCI_MSI_IRQ_DOMAIN
In-Reply-To: <20221116161230.GA1113864@bhelgaas>
References: <20221116161230.GA1113864@bhelgaas>
Date: Wed, 16 Nov 2022 18:04:20 +0100
Message-ID: <87r0y2q19n.ffs@tglx>
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

On Wed, Nov 16 2022 at 10:12, Bjorn Helgaas wrote:
> On Fri, Nov 11, 2022 at 02:54:38PM +0100, Thomas Gleixner wrote:
>> What a zoo:
>> 
>>      PCI_MSI
>> 	select GENERIC_MSI_IRQ
>> 
>>      PCI_MSI_IRQ_DOMAIN
>>      	def_bool y
>> 	depends on PCI_MSI
>> 	select GENERIC_MSI_IRQ_DOMAIN
>> 
>> Ergo PCI_MSI enables PCI_MSI_IRQ_DOMAIN which in turn selects
>> GENERIC_MSI_IRQ_DOMAIN. So all the dependencies on PCI_MSI_IRQ_DOMAIN are
>> just an indirection to PCI_MSI.
>> 
>> Match the reality and just admit that PCI_MSI requires
>> GENERIC_MSI_IRQ_DOMAIN.
>> 
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>
> Just FYI, this will conflict with my work-in-progress to add more
> COMPILE_TEST coverage:
>   https://git.kernel.org/pub/scm/linux/kernel/git/helgaas/pci.git/commit/?id=72b5e7c401a1
>
> No *actual* conflicts, just textually next door, so should be sipmle
> to resolve.  Worst case I can postpone my patch until the next cycle.

Linus should be able to resolve that conflict :)

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB19662CE06
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 23:49:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCJC95k81z3cMJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 09:49:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pybGnpXR;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vXZ17LC/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=pybGnpXR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=vXZ17LC/;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCJBG58KTz3cJX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 09:48:54 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668638928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zTCdp2XTy4WV/TRq6AmcOpzAbhC2i0YQDZLmTTQbvWU=;
	b=pybGnpXR91ye2Jz7fzqWIvvHXHKcBQHy3yhPT4PUnEkoxw0z7Tk9qJdwg6tzaxzuembbZo
	hX8GoArXP6acbEoNPH8yk8yM/QPNxP+YNj4LKRgECkOUSykq+w1cn94gtUFd7w2OGVWIvl
	Arqsfl7G2AaMCZEAqkTF/tix9/S++grna9r8j761roXixlwnVBAikHqYPoGE6bL5i7RxNH
	9pRegwEKn0TA8irJ1+uYDMj2cQ/URQv5ejEzQWBJfQS9Qeta/4tOuCAzsORF8wAAmEA6AK
	JAQXVNVBJYV4vy1m69cuH9qLhLZ6FYnyCynYYYQ54nBwLaYOSyaUPHye7GJn2g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668638928;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=zTCdp2XTy4WV/TRq6AmcOpzAbhC2i0YQDZLmTTQbvWU=;
	b=vXZ17LC/04L0m8gSNNgs6Jaj2t/5aaKWXwozWalYoUWSqn6f9jUPV7Dcjytgns0E8iKu73
	liCze9LCZtU8xTDQ==
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [patch 08/39] genirq/msi: Provide msi_domain_ops::post_free()
In-Reply-To: <Y3Uhk4YZ9MN4x5Jx@nvidia.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122014.063153448@linutronix.de> <Y3Uhk4YZ9MN4x5Jx@nvidia.com>
Date: Wed, 16 Nov 2022 23:48:47 +0100
Message-ID: <87leoao6r4.ffs@tglx>
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

On Wed, Nov 16 2022 at 13:44, Jason Gunthorpe wrote:
> On Fri, Nov 11, 2022 at 02:54:27PM +0100, Thomas Gleixner wrote:
>> To prepare for removing the exposure of __msi_domain_free_irqs() provide a
>> post_free() callback in the MSI domain ops which can be used to solve
>> the problem of the only user of __msi_domain_free_irqs() in arch/powerpc.
>> 
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> ---
>>  include/linux/msi.h |    4 ++++
>>  kernel/irq/msi.c    |    2 ++
>>  2 files changed, 6 insertions(+)
>
> Make sense, but I do wonder why PPC needs this ordering..

Some hypervisor thing.

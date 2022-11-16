Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDE762C5F0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:08:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8dn3zQKz3dvH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:08:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GSlVYVS8;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=llOgpdV3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=GSlVYVS8;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=llOgpdV3;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8bF73Qhz3f8p
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:06:33 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668618391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gMtjvKuzan+EitBOPG6mbHkFHraigrEr8V57kF2xOHg=;
	b=GSlVYVS8cqCCkAtiXSIgcwB7/v7yViOvR7AfIcmAkV1Fwnf9lQi1GBcnX5Y4Ju4s3TqUax
	SI7kdSMfFe52kUeFZogQm5vYXUYsQ711qOhOf6n+5fDc1uCT2j8ibEPRae5U0lLpGIs97Z
	+oTWClBQtsJ9RI/Y/awt0yHaTJkylyAH9nm54r3Ao4AcyOugeX6hASbTTKB68eZNNoG09O
	aOApii33W8z8RhuR+jxUJIV+zaXsWeYkc9ZbH4P9J+xTs3XRmTsdliMVoYaHNewOYjAErU
	Bshc1/9AxWWYhLyd7h5nzJ+ZgqVXWfEPoFB0udtJOlGokuJapopWZ46yQfZLQA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668618391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gMtjvKuzan+EitBOPG6mbHkFHraigrEr8V57kF2xOHg=;
	b=llOgpdV3hMHSBIhQev8a/HMzrlttd0KuM/S/oask7Lf5ArUR3Gu3hdMmAW6RHbysShpDRH
	fHUSj6rq+ZuC3FDw==
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch 22/39] PCI/MSI: Move pci_alloc_irq_vectors() to api.c
In-Reply-To: <20221116162210.GA1115315@bhelgaas>
References: <20221116162210.GA1115315@bhelgaas>
Date: Wed, 16 Nov 2022 18:06:30 +0100
Message-ID: <87k03uq161.ffs@tglx>
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

On Wed, Nov 16 2022 at 10:22, Bjorn Helgaas wrote:
>> + * Allocate up to @max_vecs interrupt vectors on device. MSI-X irq
>
> s/irq/IRQ/
>
>> + * vector allocation has a higher precedence over plain MSI, which has a
>> + * higher precedence over legacy INTx emulation.
>> + *
>> + * Upon a successful allocation, the caller should use pci_irq_vector()
>> + * to get the Linux IRQ number to be passed to request_threaded_irq().
>> + * The driver must call pci_free_irq_vectors() on cleanup.
>> + *
>> + * Return: number of allocated vectors (which might be smaller than
>> + * @max_vecs), -ENOSPC if less than @min_vecs interrupt vectors are
>
> s/less/fewer/ (also in some previous patches, IIRC)

Will fix.

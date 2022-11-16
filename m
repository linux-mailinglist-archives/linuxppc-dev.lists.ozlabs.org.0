Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E05FD62C5D1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:04:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8XZ4tktz3cd4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:04:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KDnklEjx;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/lLRXLA6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=KDnklEjx;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=/lLRXLA6;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8Vf4w0Xz3cB8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:02:34 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668618150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=73/k+Pqe+eIdLrX5pigBKT2S4Kr0WftEUmk46mQSZq4=;
	b=KDnklEjxF7By95INYq+dtxZdCdY/C01Z76Y3GVUU4F3KTF6wB9npHtyJk3/UAgAb2A+Kl2
	OO8l0ogbhCgtGOzGSm278d7Ntq9gnX5OWX3a6rnZ4IXbyxowohL3X/waIh8pZdLxNBb0T6
	AL5Ba0JCMIs8eN7MF+cdBQIMfREMbj5b283h9U+0gizZueBJ2TbopR81DOJDkA+yLscvLG
	5FHYQIDq160F+/ffXyNSwf1Pr1MYqKx6AnPF4ABlFzMU4zcMo5Y3U2X2+lhW6JuSf+6b83
	w3dIwnYYAiAmM5Vry7hYiK9ZrD8cGZlRqSpgOZrAqzDh3QEn/1udH8Sv89Gl7w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668618150;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=73/k+Pqe+eIdLrX5pigBKT2S4Kr0WftEUmk46mQSZq4=;
	b=/lLRXLA6lsq9XHJeSKJip6VCUSvS/TfY12kAhlPgvsYIqLFWJcn73WeC2hRsndLX2l+7Fj
	tgC7oNEGsKmJLACQ==
To: Ashok Raj <ashok.raj@intel.com>
Subject: Re: [patch 02/39] iommu/vt-d: Remove bogus check for multi MSI-X
In-Reply-To: <Y3UHVGptkWZnIEgI@a4bf019067fa.jf.intel.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.713848846@linutronix.de>
 <Y3UHVGptkWZnIEgI@a4bf019067fa.jf.intel.com>
Date: Wed, 16 Nov 2022 18:02:30 +0100
Message-ID: <87wn7uq1cp.ffs@tglx>
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, "Ahmed
 S. Darwish" <darwi@linutronix.de>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Dan Williams <dan.j.williams@intel.com>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16 2022 at 07:52, Ashok Raj wrote:
> On Fri, Nov 11, 2022 at 02:54:17PM +0100, Thomas Gleixner wrote:
>> PCI/Multi-MSI is MSI specific and not supported for MSI-X.
>> 
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> ---
>>  drivers/iommu/intel/irq_remapping.c |    3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> --- a/drivers/iommu/intel/irq_remapping.c
>> +++ b/drivers/iommu/intel/irq_remapping.c
>> @@ -1334,8 +1334,7 @@ static int intel_irq_remapping_alloc(str
>>  
>>  	if (!info || !iommu)
>>  		return -EINVAL;
>> -	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI &&
>> -	    info->type != X86_IRQ_ALLOC_TYPE_PCI_MSIX)
>> +	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI)
>>  		return -EINVAL;
>>  
>>  	/*
>> 
>
> This check is only making sure that when multi-msi is requested that the
> type has to be either MSI/MSIX.

MSI-X does not support multi vector allocations on a single entry.

> Wouldn't this change return -EINVAL when type = MSIX?

Rightfully so. MSIX vectors are allocated one by one. Has been that way
forever.

Thanks,

        tglx



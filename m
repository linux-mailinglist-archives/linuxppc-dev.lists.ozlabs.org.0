Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6ACC62C5DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:05:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8YZ5mbSz3cfX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:05:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=p5NIRSDR;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=78yxMdLZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=p5NIRSDR;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=78yxMdLZ;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8WJ0ckVz3cTC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:03:08 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668618185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eOfL205iUtArVsJR5Cv2Qtv3GplSQquUjpKC4BPz1VQ=;
	b=p5NIRSDRdgNg6sjXezPWC2TxqPe4xfBPWZPlRq8AEA+qx8f8LwxdiY6BdbvqwFwhOm29Vy
	TaLKsf6n+wkRGox3pcK4qVEcl6c26bXvfM1KmJX3PrPOWwOYIQxt4oOWY7Ga2LD0021F8h
	p5+FwT1n0Dcp+DGtS0QSwAw/kahUq5WSdDie+MF66QsWtLakAl4cBB4ddCY8iRiJj5FZtT
	nh541QKhFZbf2fpNYqTYfZy5d3Et363GISC8S389rbYTkjtF+hMnzGQjEWU2RQKhiBLSGT
	Q8kpS0iEIcnCwAJK2Z/3UpzF5uIZlyEYC9VqBUHMFRMgWsP8LCgtE9p62TVgOg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668618185;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eOfL205iUtArVsJR5Cv2Qtv3GplSQquUjpKC4BPz1VQ=;
	b=78yxMdLZgx5iu9Ei93SsTPYjPK3n8cN81g/Po4FLgS4BlUxWJhZUPkYMuviNPQ0E4/exmA
	3OJ7HD4B1ghQ8qCg==
To: Ashok Raj <ashok.raj@intel.com>
Subject: Re: [patch 03/39] iommu/amd: Remove bogus check for multi MSI-X
In-Reply-To: <Y3UJkEb7ejrxbW22@a4bf019067fa.jf.intel.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.772447165@linutronix.de>
 <Y3UJkEb7ejrxbW22@a4bf019067fa.jf.intel.com>
Date: Wed, 16 Nov 2022 18:03:04 +0100
Message-ID: <87tu2yq1br.ffs@tglx>
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

On Wed, Nov 16 2022 at 08:02, Ashok Raj wrote:
> On Fri, Nov 11, 2022 at 02:54:19PM +0100, Thomas Gleixner wrote:
>> PCI/Multi-MSI is MSI specific and not supported for MSI-X
>> 
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>> ---
>>  drivers/iommu/amd/iommu.c |    3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>> 
>> --- a/drivers/iommu/amd/iommu.c
>> +++ b/drivers/iommu/amd/iommu.c
>> @@ -3294,8 +3294,7 @@ static int irq_remapping_alloc(struct ir
>>  
>>  	if (!info)
>>  		return -EINVAL;
>> -	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI &&
>> -	    info->type != X86_IRQ_ALLOC_TYPE_PCI_MSIX)
>> +	if (nr_irqs > 1 && info->type != X86_IRQ_ALLOC_TYPE_PCI_MSI)
>>  		return -EINVAL;
>>  
>>  	/*
>> 
>
> nit:
>
> maybe better to merge patch2/3 since both seem related?

What's better about it? It's two different drivers.

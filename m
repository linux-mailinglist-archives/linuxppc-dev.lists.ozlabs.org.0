Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A0D62C5FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8gw2qv9z3dvT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:10:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=r2dW5nSk;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Nzyh2lhL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=r2dW5nSk;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Nzyh2lhL;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8g20xtjz2xVr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:09:50 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668618587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ikR02Krd2bWM7QtM03WkmIJ/tmd489mqo9OvnzkaC1Q=;
	b=r2dW5nSk/HYqTZyJyGMkOXClLUNOqcudAEPRXrxpFnk03pwPIVcCdDLlCkMSGXKWDV9fvj
	lypp8Awo66GzeAYe7ZRfdSL/G6D+Dhw981l7+zCad0KRsAKQTseh9A/gbJGRIldpYeWyMP
	xfMqgQzvESJ3zHARmKSkKHyllPHVVEzm6SsjIq68SXLibaoRSQsYY49wpjksmnahJT6fdP
	LcBPoBz1lwgJzXAYJlH0fK9/2fOeaUh37NeDH8SKKxayV0OG424QzFld2volH96KRIySGs
	+Ijs3J2xq76VquEuOuJfG6OFxh6m09wLhGTQ64uNq+mL6O8/I4cejDuFBIu/yg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668618587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ikR02Krd2bWM7QtM03WkmIJ/tmd489mqo9OvnzkaC1Q=;
	b=Nzyh2lhLKe+ltyMNeDMuG9x97MhJd7Gn+M/8PLuEUjBxdTR4OlfnkSXmU8dl8u8Oj4LA6x
	d9VOzVCVE9sbLyCQ==
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch 27/39] PCI/MSI: Move pci_disable_msix() to api.c
In-Reply-To: <20221116162617.GA1115753@bhelgaas>
References: <20221116162617.GA1115753@bhelgaas>
Date: Wed, 16 Nov 2022 18:09:46 +0100
Message-ID: <87edu2q10l.ffs@tglx>
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

On Wed, Nov 16 2022 at 10:26, Bjorn Helgaas wrote:
>>  /**
>> + * pci_disable_msix() - Disable MSI-X interrupt mode on device
>> + * @dev: the PCI device to operate on
>> + *
>> + * Legacy device driver API to disable MSI-X interrupt mode on device,
>> + * free earlier-allocated interrupt vectors, and restore INTx emulation.
>
> Isn't INTx *emulation* a PCIe implementation detail?  Doesn't seem
> relevant to callers that it's emulated.

Don't know how the emulation ended up there. It restores INTx which is
obvioulsy not a wire on PCIe... But yes, it's uninteresting.



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DB462DC4C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 14:08:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCgG62g7rz3ccw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 00:08:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WDZLbEqv;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=L9t4AwQo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=WDZLbEqv;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=L9t4AwQo;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCgFB0Fjfz3bhZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 00:07:42 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668690453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttz1/GMaTk8h4TD14aPsbGIxMJv2rHjmwjhSDqhucs0=;
	b=WDZLbEqveG5PJjvIG4M84A7mMytlGNV61Gw/YoP/QDOLetHLKNzxZ+trhb1EyoXlHMRPCY
	uleqRqzLb6qyJafV7I1Gqw77uQ+CL7yRAXYYLJtPbH+CRgOFjb6Vq/SxWxmOk6937uf5ef
	9VwJBtcPyyC7HCh0bYgycC5xCmA/8sST/2E8pOe4E148IEPGtXVFI6q6qZGeNE+j3OY1jo
	QjDBfDC8AF5fbQ+neAWN6pyXgjBX6V6HJ2Yp2YSDLioOXVmnS934gU1wvrFYyMqwWKZSbM
	O90UyTmYC2HHKEnS9SLVobc7Fm3sQmMNZL1LdzKmSNuNEMLk02Fmth8gzQXnZw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668690453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ttz1/GMaTk8h4TD14aPsbGIxMJv2rHjmwjhSDqhucs0=;
	b=L9t4AwQosUgasEO8gwRfKjPJm0d6kdrZ24AvdpYKQri4d72MF1pCCaBP2DVDgm+HALY4kc
	v0LLaVo5cdrzG7Dw==
To: Ashok Raj <ashok.raj@intel.com>
Subject: Re: [patch 01/39] PCI/MSI: Check for MSI enabled in
 __pci_msix_enable()
In-Reply-To: <Y3UEFBJW1toFJZGn@a4bf019067fa.jf.intel.com>
References: <20221111120501.026511281@linutronix.de>
 <20221111122013.653556720@linutronix.de>
 <Y3UEFBJW1toFJZGn@a4bf019067fa.jf.intel.com>
Date: Thu, 17 Nov 2022 14:07:33 +0100
Message-ID: <87cz9ln2zu.ffs@tglx>
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

On Wed, Nov 16 2022 at 07:39, Ashok Raj wrote:
> On Fri, Nov 11, 2022 at 02:54:15PM +0100, Thomas Gleixner wrote:
>
> Can the pre-enabled checks for msi and msix be moved up before any vector
> range check?
>
> not that it matters for how it fails, does EBUSY sound better?

Does any caller care about the error code or about the ordering in which
the caller stupity is detected?

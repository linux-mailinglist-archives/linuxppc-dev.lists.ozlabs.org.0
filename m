Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDEB62C604
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Nov 2022 18:11:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NC8hw6mtSz3fCk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 04:11:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lgI5LXzV;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R8/73oLD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=lgI5LXzV;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=R8/73oLD;
	dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC8gd5RPZz3fDy
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 04:10:21 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668618618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=riVKy3FDYSWFZXezY9fdBLCxdKgItHsmQy7l+uUGAWE=;
	b=lgI5LXzVSOQg0YtaEQV7S5feQFXgrbI2VX9q3gya/BA3P/P7T4Yb6qTGNn/Q2Whhla+j3A
	dTKHyZm6BWVMVm/kClkGMZe0+EnCSpbScLrjOctVuK/uAo1SiO6pLjsMFQaPjAsRZ11CYU
	zY8Y7lX1K4sdVzZ7Jv5+UR4l9vFjqhnd6zQzgePYXjWVr2escDWgl85m1S3R+f9FZN+InK
	Poi0NaG9nNgpx/Zz4ng7tHOT/wNfVgMZNVgDyfCUO02tr6FV7D5VlVX/9iwAUxi9q1Dm+o
	Ye6W+iEaF1tz8T/H/5oP/jycdNqlmxLKjuWkbDvmgyYp5Ck2pxVzWA7lxzlgKw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668618618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=riVKy3FDYSWFZXezY9fdBLCxdKgItHsmQy7l+uUGAWE=;
	b=R8/73oLDty+DVbGH+E1r4hJfOKQQpHEGsRnr533DbvEUFQz6IfkgvdJ8iIqCj6vuaiXCrE
	g5cMgNVvIHM0pHDg==
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch 32/39] PCI/MSI: Reorder functions in msi.c
In-Reply-To: <20221116162843.GA1116077@bhelgaas>
References: <20221116162843.GA1116077@bhelgaas>
Date: Wed, 16 Nov 2022 18:10:18 +0100
Message-ID: <87bkp6q0zp.ffs@tglx>
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

On Wed, Nov 16 2022 at 10:28, Bjorn Helgaas wrote:

> On Fri, Nov 11, 2022 at 02:55:06PM +0100, Thomas Gleixner wrote:
>> From: Ahmed S. Darwish <darwi@linutronix.de>
>> 
>> There is no way to navigate msi.c without banging the head against the wall
>> every now and then because MSI and MSI-X specific functions are
>> intermingled and the code flow is completely non-obvious.
>> 
>> Reorder everthing so common helpers, MSI and MSI-X specific functions are
>> grouped together.
>
> s/everthing/everything/
>
>> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
>> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
>> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
>
> Acked-by: Bjorn Helgaas <bhelgaas@google.com>
>
> I assume this is pure code movement, so I didn't even look at the
> text below.

It is.

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B6D630701
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 01:22:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDZ9l5SXRz3f5J
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 11:22:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HlA1H0xw;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=54xzcv2k;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=darwi@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=HlA1H0xw;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=54xzcv2k;
	dkim-atps=neutral
X-Greylist: delayed 345 seconds by postgrey-1.36 at boromir; Fri, 18 Nov 2022 23:40:12 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDGb03n0rz3c8V
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 23:40:12 +1100 (AEDT)
Date: Fri, 18 Nov 2022 13:34:12 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1668774854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wC43CUGHQ/5Kf6dfYdK3BkocoYb1pAZJ53OoTDcNf8Y=;
	b=HlA1H0xw89I6mNXZxJfbzjZ9tZMqyfafZ+aFSsNCpLNVFZG4Syb23GWBxogyjR8JsPjoz+
	VaJuo4yvuubjsDScFNOYEhnvI/JnS50bh59eCBKM3N2Hq305ykQSGUWvNmepJIi6ASnhEc
	Egre6BUTheWsCqNBhLfaHD5mXybAE0gZ+FrjXOTtPkHjlj1OyuGGhfr+5pqAEy+A0dS6jh
	kcjwSSW9Tqj8sV8GpamJiaL4VlNH9fNu7sKS2Z78pFtMLjks7075EQmH7e+rMAWL9esRD6
	dFYnvxDpqSenJCJPs1AmOrXBDZqyETwBR2olcWtWGEx6Ik89o+rGvcZQw37D4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1668774854;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wC43CUGHQ/5Kf6dfYdK3BkocoYb1pAZJ53OoTDcNf8Y=;
	b=54xzcv2ka0wlcFsUA4oLtl2S4yVRp9s6mDU2H/QJ/HHTk3ITsJRt1buBfx5tYa3HRGPopw
	Vlw+RnH01UQJ2kAg==
From: "Ahmed S. Darwish" <darwi@linutronix.de>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [patch 23/39] PCI/MSI: Move pci_alloc_irq_vectors_affinity() to
 api.c
Message-ID: <Y3d7xJ5hvhxlRrOE@lx-t490>
References: <20221111122014.927531290@linutronix.de>
 <20221116162322.GA1115421@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116162322.GA1115421@bhelgaas>
X-Mailman-Approved-At: Sat, 19 Nov 2022 11:21:11 +1100
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 16, 2022 at 10:23:22AM -0600, Bjorn Helgaas wrote:
> On Fri, Nov 11, 2022 at 02:54:51PM +0100, Thomas Gleixner wrote:
...
> > +
> > +/**
> > + * pci_alloc_irq_vectors_affinity() - Allocate multiple device interrupt
> > + *                                    vectors with affinity requirements
> > + * @dev:      the PCI device to operate on
> > + * @min_vecs: minimum required number of vectors (must be >= 1)
> > + * @max_vecs: maximum desired number of vectors
> > + * @flags:    allocation flags, as in pci_alloc_irq_vectors()
> > + * @affd:     affinity requirements (can be %NULL).
> > + *
> > + * Same as pci_alloc_irq_vectors(), but with the extra @affd parameter.
> > + * Check that function docs, and &struct irq_affinity, for more details.
>
> Is "&struct irq_affinity" some kernel-doc syntax, or is the "&"
> superfluous?
>

Hmmm, I stole it from Documentation/doc-guide/kernel-doc.rst. htmldoc
parses it and generates a link to the referenced structure's kernel-doc.

But, yeah, this was literally the first usage of such a doc pattern in
the entire kernel's C code :)

Thanks,

--
Ahmed S. Darwish
Linutronix GmbH

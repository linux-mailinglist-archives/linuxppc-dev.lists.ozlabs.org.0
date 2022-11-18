Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A4A962F570
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 13:59:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDH1f3VD2z3f34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 23:59:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TnXvNVBF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TnXvNVBF;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDH0g24Bhz3cH6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 23:58:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=J4CE2a9Srvxn0Qx3Ispk4fD7htx4Z++quEKnuvxGERg=; b=TnXvNVBFJrO4X+NPoheahskMC3
	tdIvrpbH20MV6vs8DNk/2yox4p5BwykAU45N5JBs/OXr4rt5jVqWlbGibk7w3kTRu6rWTPiYoTVXw
	2xmDhGjgWc+ifw7WAuA7/VYB73/Njtsce/UekGqh2B1pXZo27sO1m10JuJ5C2JHQufZDT6vEpMT8o
	H+VfDp2wYbo9rsl3z7w3v6GVduCqZQQ2+K3Cfy0JL+bfVjnUn0s2QTqAAnEf6EE04m1NwNXE5X41W
	we8Z2dj1uKp3H9AuQg5os2rA6TNrHXb6pfsuW+DGewM+9vK9Xf0yf5ayBwGLyagPu0/q+1CUROjMY
	z9Npe2iQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow0wr-001zY7-5L; Fri, 18 Nov 2022 12:58:25 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B9EB0300422;
	Fri, 18 Nov 2022 13:58:22 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6FE562D2BCFED; Fri, 18 Nov 2022 13:58:22 +0100 (CET)
Date: Fri, 18 Nov 2022 13:58:22 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Subject: Re: [patch 23/39] PCI/MSI: Move pci_alloc_irq_vectors_affinity() to
 api.c
Message-ID: <Y3eBbgjOq5EXnBQB@hirez.programming.kicks-ass.net>
References: <20221111122014.927531290@linutronix.de>
 <20221116162322.GA1115421@bhelgaas>
 <Y3d7xJ5hvhxlRrOE@lx-t490>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3d7xJ5hvhxlRrOE@lx-t490>
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
Cc: linux-pci@vger.kernel.org, Will Deacon <will@kernel.org>, Dan Williams <dan.j.williams@intel.com>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Dave Jiang <dave.jiang@intel.com>, Ashok Raj <ashok.raj@intel.com>, corbet@lwn.net, Joerg Roedel <joro@8bytes.org>, x86@kernel.org, Jason Gunthorpe <jgg@mellanox.com>, Bjorn Helgaas <helgaas@kernel.org>, Allen Hubbe <allenbh@gmail.com>, Kevin Tian <kevin.tian@intel.com>, Jon Mason <jdmason@kudzu.us>, linuxppc-dev@lists.ozlabs.org, Alex Williamson <alex.williamson@redhat.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Reinette Chatre <reinette.chatre@intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, Marc Zyngier <maz@kernel.org>, Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 18, 2022 at 01:34:12PM +0100, Ahmed S. Darwish wrote:
> On Wed, Nov 16, 2022 at 10:23:22AM -0600, Bjorn Helgaas wrote:
> > On Fri, Nov 11, 2022 at 02:54:51PM +0100, Thomas Gleixner wrote:
> ...
> > > +
> > > +/**
> > > + * pci_alloc_irq_vectors_affinity() - Allocate multiple device interrupt
> > > + *                                    vectors with affinity requirements
> > > + * @dev:      the PCI device to operate on
> > > + * @min_vecs: minimum required number of vectors (must be >= 1)
> > > + * @max_vecs: maximum desired number of vectors
> > > + * @flags:    allocation flags, as in pci_alloc_irq_vectors()
> > > + * @affd:     affinity requirements (can be %NULL).
> > > + *
> > > + * Same as pci_alloc_irq_vectors(), but with the extra @affd parameter.
> > > + * Check that function docs, and &struct irq_affinity, for more details.
> >
> > Is "&struct irq_affinity" some kernel-doc syntax, or is the "&"
> > superfluous?
> >
> 
> Hmmm, I stole it from Documentation/doc-guide/kernel-doc.rst. htmldoc
> parses it and generates a link to the referenced structure's kernel-doc.
> 
> But, yeah, this was literally the first usage of such a doc pattern in
> the entire kernel's C code :)

Perhaps then not start with it and instead try and convince John to make
his script more clever -- this same script already recognises functions
by their () suffix, might as well also key off the 'struct' keyword, no?

This is a Code comment, to be read in a text editor. That & is a syntax
error.


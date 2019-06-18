Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1114A0E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:33:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45SnZ66jqvzDqRG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 22:33:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SnTp0tjqzDqdV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 22:30:05 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x5ICTJJT030631;
 Tue, 18 Jun 2019 07:29:24 -0500
Message-ID: <a2494d627548d788650be4af0ee1d6ed700da134.camel@kernel.crashing.org>
Subject: Re: [PATCH kernel] powerpc/pci/of: Parse unassigned resources
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Alexey Kardashevskiy
 <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Date: Tue, 18 Jun 2019 22:29:19 +1000
In-Reply-To: <87sgs7ozsa.fsf@concordia.ellerman.id.au>
References: <20190614025916.123589-1-aik@ozlabs.ru>
 <87sgs7ozsa.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org, Oliver
 O'Halloran <oohall@gmail.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2019-06-18 at 22:15 +1000, Michael Ellerman wrote:
> Alexey Kardashevskiy <aik@ozlabs.ru> writes:
> > The pseries platform uses the PCI_PROBE_DEVTREE method of PCI probing
> > which is basically reading "assigned-addresses" of every PCI device.
> > However if the property is missing or zero sized, then there is
> > no fallback of any kind and the PCI resources remain undiscovered, i.e.
> > pdev->resource[] array is empty.
> > 
> > This adds a fallback which parses the "reg" property in pretty much same
> > way except it marks resources as "unset" which later makes Linux assign
> > those resources with proper addresses.
> 
> What happens under PowerVM is the big question.
> 
> ie. if we see such a device under PowerVM and then do our own assignment
> what happens?

May or may not work ... EEH will be probably b0rked, but then it
shouldn't happen.

Basically PowerVM itself doesn't do anything special with PCI. It maps
a whole PHB (or virtual PHB) into the guest and doesn't care much
beyond that for MMIOs.

What you see in Linux getting in the way is RTAS. It's the one
assigning BAR values etc... within that region setup by the HV, but
RTAS is running in the guest, from the HV perspective it's all the same
really.

So if such a device did exist, RTAS would lose track but it would still
work from a HW/HV perspective. RTAS-driven services such as EEH would
probably fail though.

But in practice this shouldn't happen bcs RTAS will set assigned-
addresses on everything.

Cheers,
Ben.
 


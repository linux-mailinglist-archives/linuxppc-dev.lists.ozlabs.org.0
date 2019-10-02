Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFB3C4B72
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 12:30:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jsqG3w4bzDqX8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 20:30:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=dhowells@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jsm90PyJzDqXV
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 20:28:07 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2F24E300C76A;
 Wed,  2 Oct 2019 10:28:04 +0000 (UTC)
Received: from warthog.procyon.org.uk (ovpn-125-72.rdu2.redhat.com
 [10.10.125.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7943A5C226;
 Wed,  2 Oct 2019 10:28:00 +0000 (UTC)
Organization: Red Hat UK Ltd. Registered Address: Red Hat UK Ltd, Amberley
 Place, 107-111 Peascod Street, Windsor, Berkshire, SI4 1TE, United
 Kingdom.
 Registered in England and Wales under Company Registration No. 3798903
From: David Howells <dhowells@redhat.com>
In-Reply-To: <20190930121313.GV32742@smile.fi.intel.com>
References: <20190930121313.GV32742@smile.fi.intel.com>
 <20190827151823.75312-1-andriy.shevchenko@linux.intel.com>
 <20190927123913.GA32321@google.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/2] PCI/AER: Use for_each_set_bit()
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <11308.1570012079.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: quoted-printable
Date: Wed, 02 Oct 2019 11:27:59 +0100
Message-ID: <11309.1570012079@warthog.procyon.org.uk>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 02 Oct 2019 10:28:04 +0000 (UTC)
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 dhowells@redhat.com, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <helgaas@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:

> > but I confess to being a little ambivalent.  It's
> > arguably a little easier to read,
> =

> I have another opinion here. Instead of parsing body of for-loop, the na=
me of
> the function tells you exactly what it's done. Besides the fact that rea=
ding
> and parsing two lines, with zero conditionals, is faster.
> =

> > but it's not nearly as efficient
> > (not a great concern here)
> =

> David, do you know why for_each_set_bit() has no optimization for the ca=
ses
> when nbits <=3D BITS_PER_LONG? (Actually find_*bit() family of functions=
)

I've not had anything to do with for_each_set_bit() itself.

By 'nbits', I presume you mean the size parameter - max in the sample bit =
of
code.

It would need per-arch optimisation.  Some arches have an instruction to f=
ind
the next bit and some don't.

Using for_each_set_bit() like this is definitely suboptimal, since
find_first_bit() and find_next_bit() may well be out of line.

It should probably be using something like __ffs() if size <=3D BITS_PER_L=
ONG.

David

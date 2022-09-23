Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 523AC5E7268
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:24:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYcvd3602z3cfl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:24:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYcvC3Lnxz3bSS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 13:24:05 +1000 (AEST)
Received: from [IPv6:::1] (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 28N3LWpA028633;
	Thu, 22 Sep 2022 22:21:33 -0500
Message-ID: <14c592e1d0a6126a66cfab1851d52d097023b74f.camel@kernel.crashing.org>
Subject: Re: [PATCH v2 2/2] powerpc/pci: Prefer PCI domain assignment via DT
 'linux,pci-domain' and alias
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>, Guenter Roeck
 <linux@roeck-us.net>,
        Pali =?ISO-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Date: Fri, 23 Sep 2022 13:21:30 +1000
In-Reply-To: <874jyevz2g.fsf@mpe.ellerman.id.au>
References: <20220706102148.5060-1-pali@kernel.org>
	 <20220706102148.5060-2-pali@kernel.org>
	 <20220813135735.GA3413265@roeck-us.net> <874jyevz2g.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Guowen Shan <gshan@redhat.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Bjorn Helgaas <helgaas@kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-08-15 at 15:46 +1000, Michael Ellerman wrote:
> Guenter Roeck <linux@roeck-us.net> writes:
> > On Wed, Jul 06, 2022 at 12:21:48PM +0200, Pali Roh=C3=A1r wrote:
> > > Other Linux architectures use DT property 'linux,pci-domain' for spec=
ifying
> > > fixed PCI domain of PCI controller specified in Device-Tree.
> > >=20
> > > And lot of Freescale powerpc boards have defined numbered pci alias i=
n
> > > Device-Tree for every PCIe controller which number specify preferred =
PCI
> > > domain.
> > >=20
> > > So prefer usage of DT property 'linux,pci-domain' (via function
> > > of_get_pci_domain_nr()) and DT pci alias (via function of_alias_get_i=
d())
> > > on powerpc architecture for assigning PCI domain to PCI controller.
> > >=20
> > > Fixes: 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on d=
evice-tree properties")
> > > Signed-off-by: Pali Roh=C3=A1r <pali@kernel.org>
> >=20
> > This patch results in a number of boot warnings with various qemu
> > boot tests.
>=20
> Thanks for the report.
>=20
> I have automated qemu boot tests to catch things like this, they even
> have DEBUG_ATOMIC_SLEEP enabled ... but I inadvertantly broke my script
> that checks for "BUG:" in the console log. Sometimes you just can't
> win.

So the problem is

 	spin_lock(&hose_spinlock);

get_phb_number() relies on it for the phb_bitmap allocation. You can
move it out of the lock but you'll have to either:

 - Take the lock inside it to protect the allocation

 - Turn find_first_zero_bit/set_bit into a loop of
find_first_zero_bit+test_and_set_bit() which wouldn't require a lock.

Note about the other "reg" numbering conversation ... I'm pretty sure
that breaks some old PowerMac crap which shows nobody really uses these
things considering how long the patch has been there :-)

I'm pretty sure something somewhere assumes the primary bus is 0. Some
old userspace definitely does though that might no longer be relevant.
The whole business with "domain 0" being special and avoiding domain
numbers in /proc relies on this too...

Cheers,
Ben.

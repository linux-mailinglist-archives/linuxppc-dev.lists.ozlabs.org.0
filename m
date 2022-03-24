Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D8544E6A81
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Mar 2022 23:09:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPfXY01lWz3bNt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 09:09:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E93uG7rM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=E93uG7rM; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPfWt0PBTz2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 09:09:13 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CF43E61435;
 Thu, 24 Mar 2022 22:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15F51C340EC;
 Thu, 24 Mar 2022 22:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648159750;
 bh=dJXmvTZr5UdvSBioFLt7gHEk3eUV5mfLXEidGrj7R3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=E93uG7rMXbl4t4n3pGHFMwSsUg0Iv/aIW/HfELzxf5YRj45WEs2phGH/4fhuSENpH
 qw97m4QnFG3QNcut5yw+HoIZFV2GPd30ATnboC5H9VupGLQrtvMDHOVK1oTzApVxX9
 QMY2ZiK1kGXyHz+0R0drGUozJD5jcC60xB8qzjUVEX/j11+Rx3umkn5vrnKrPfs69i
 ugRfhEAgDy3eu3N+KGRkyqKfI2DIg2UxFArT7t8yplOdl4Dga910cbZwy6mWcmeIFp
 qwZKu0ZJphxhhap5fXikcyiM1IccTw2VZ1ftiwcn+qlXoQ2t7dtOhgYjNbtcBbGQyP
 J5HS5mfoINfeg==
Date: Thu, 24 Mar 2022 17:09:08 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 2/2] powerpc/eeh: Use pcie_reset_state_t type in function
 arguments
Message-ID: <20220324220908.GA171268@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f55dba9c-f00f-3aa9-d84d-1cda2b660dcb@csgroup.eu>
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
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-pci@vger.kernel.org, Oliver O'Halloran <oohall@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 10, 2022 at 09:51:13AM +0100, Christophe Leroy wrote:
> Le 13/07/2021 à 02:25, Krzysztof Wilczyński a écrit :
> > The pcie_reset_state_t type has been introduced in the commit
> > f7bdd12d234d ("pci: New PCI-E reset API") along with the enum
> > pcie_reset_state, but it has never been used for anything else
> > other than to define the members of the enumeration set in the
> > enum pcie_reset_state.
> > 
> > Thus, replace the direct use of enum pcie_reset_state in function
> > arguments and replace it with pcie_reset_state_t type so that the
> > argument type matches the type used in enum pcie_reset_state.
> > 
> > Signed-off-by: Krzysztof Wilczyński <kw@linux.com>
> 
> I don't understand the purpose of this change. Does any tool like
> sparse of so reports an error here ?
> 
> My feeling is that by doing this you loose the added value of using
> an enumerate.
> 
> state is used in a switch/case, that's exactly what we expect from
> an enum.

I think this is true: in the patch below, we remove use of "enum
pcie_reset_state", so the compiler no longer knows that "state" is an
enum, and it cannot verify that "state" has a legal value in the
switch statement.  And at least with "gcc -Wall", it looks like it
*does* complain in that case.

Whether that value is worthwhile, I don't know.  AFAICT this is the
only place that uses "state", so there's not *much* value.

If we did apply the patch below, I think we could probably make "enum
pcie_reset_state" an anonymous enum instead, like the enum for
pci_channel_state_t.

But let's back up for a minute.  This is only used in the
pci_set_pcie_reset_state() path, and that's only used by three
drivers: cxl, genwqe, and ipr, and obviously only on powerpc, since
that's the only arch that implements pcibios_set_pcie_reset_state().

What's special about them?  Why do they need this and no other drivers
do?  And why only on powerpc?

I wonder if that powerpc functionality could be implemented in some
way that's more integrated into the PCI core reset and error handling
framework.

> > ---
> >   arch/powerpc/kernel/eeh.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> > index 3bbdcc86d01b..15485abb89ff 100644
> > --- a/arch/powerpc/kernel/eeh.c
> > +++ b/arch/powerpc/kernel/eeh.c
> > @@ -714,7 +714,7 @@ static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
> >    * Return value:
> >    * 	0 if success
> >    */
> > -int pcibios_set_pcie_reset_state(struct pci_dev *dev, enum pcie_reset_state state)
> > +int pcibios_set_pcie_reset_state(struct pci_dev *dev, pcie_reset_state_t state)
> >   {
> >   	struct eeh_dev *edev = pci_dev_to_eeh_dev(dev);
> >   	struct eeh_pe *pe = eeh_dev_to_pe(edev);

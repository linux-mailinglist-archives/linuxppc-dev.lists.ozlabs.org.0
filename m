Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4FA8016EB
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Dec 2023 23:57:03 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZlTyL5Na;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ShpND5MnQz3dJp
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Dec 2023 09:57:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZlTyL5Na;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ShpMN5BRSz3cTY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Dec 2023 09:56:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 342EACE2886;
	Fri,  1 Dec 2023 22:56:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A08C433C8;
	Fri,  1 Dec 2023 22:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701471371;
	bh=GVeXptVzISkp+LH6rP7ABvt7j/9kuofhAXSzf6mU7l8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ZlTyL5Navjtt+nMUpk0afajOVeVQDR77Pt7SGMWB4Q7v/stMRvKg3qER0HZe0B/tB
	 SOc6ksiIaqIceMMqt2hyLiNeFTVS4WRQ3p6fUsddPqqsV5Bh0BeNEoKk9OKPGDaMlf
	 Wuu/Guum7yPnLVyDB3umrP6cNa74sdsmvkBuxIXV8c9f4XyuMby/fN5k0ejxocAJ/9
	 bGSWcZEPs0mAZucGyrGTFJxwRtOoRXK2dy8JGsNNXP5tQcE59nU3vgWcvPx+tuPqe3
	 SCsPX4Z13RNDe+WXBEL70a7MB7WnSEc7eNxEq/3d9IAffSRPCTblWTd57tl+pLeO78
	 uYLdLsWN9Nviw==
Date: Fri, 1 Dec 2023 16:56:09 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 1/6] x86: Use PCI_HEADER_TYPE_* instead of literals
Message-ID: <20231201225609.GA534714@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231201204447.GA527927@bhelgaas>
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
Cc: x86@kernel.org, Dick Kennedy <dick.kennedy@broadcom.com>, linux-scsi@vger.kernel.org, "Martin K. Petersen" <martin.petersen@oracle.com>, linux-pci@vger.kernel.org, "James E.J. Bottomley" <jejb@linux.ibm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, James Smart <james.smart@broadcom.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc scsi, powerpc folks]

On Fri, Dec 01, 2023 at 02:44:47PM -0600, Bjorn Helgaas wrote:
> On Fri, Nov 24, 2023 at 11:09:13AM +0200, Ilpo Järvinen wrote:
> > Replace 0x7f and 0x80 literals with PCI_HEADER_TYPE_* defines.
> > 
> > Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> 
> Applied entire series on the PCI "enumeration" branch for v6.8,
> thanks!
> 
> If anybody wants to take pieces separately, let me know and I'll drop
> from PCI.

OK, b4 picked up the entire series but I was only cc'd on this first
patch, so I missed the responses about EDAC, xtensa, bcma already
being applied elsewhere.

So I kept these in the PCI tree:

  420ac76610d7 ("scsi: lpfc: Use PCI_HEADER_TYPE_MFD instead of literal")
  3773343dd890 ("powerpc/fsl-pci: Use PCI_HEADER_TYPE_MASK instead of literal")
  197e0da1f1a3 ("x86/pci: Use PCI_HEADER_TYPE_* instead of literals")

and dropped the others.

x86, SCSI, powerpc folks, if you want to take these instead, let me
know and I'll drop them.

> > ---
> >  arch/x86/kernel/aperture_64.c  | 3 +--
> >  arch/x86/kernel/early-quirks.c | 4 ++--
> >  2 files changed, 3 insertions(+), 4 deletions(-)
> > 
> > diff --git a/arch/x86/kernel/aperture_64.c b/arch/x86/kernel/aperture_64.c
> > index 4feaa670d578..89c0c8a3fc7e 100644
> > --- a/arch/x86/kernel/aperture_64.c
> > +++ b/arch/x86/kernel/aperture_64.c
> > @@ -259,10 +259,9 @@ static u32 __init search_agp_bridge(u32 *order, int *valid_agp)
> >  							order);
> >  				}
> >  
> > -				/* No multi-function device? */
> >  				type = read_pci_config_byte(bus, slot, func,
> >  							       PCI_HEADER_TYPE);
> > -				if (!(type & 0x80))
> > +				if (!(type & PCI_HEADER_TYPE_MFD))
> >  					break;
> >  			}
> >  		}
> > diff --git a/arch/x86/kernel/early-quirks.c b/arch/x86/kernel/early-quirks.c
> > index a6c1867fc7aa..59f4aefc6bc1 100644
> > --- a/arch/x86/kernel/early-quirks.c
> > +++ b/arch/x86/kernel/early-quirks.c
> > @@ -779,13 +779,13 @@ static int __init check_dev_quirk(int num, int slot, int func)
> >  	type = read_pci_config_byte(num, slot, func,
> >  				    PCI_HEADER_TYPE);
> >  
> > -	if ((type & 0x7f) == PCI_HEADER_TYPE_BRIDGE) {
> > +	if ((type & PCI_HEADER_TYPE_MASK) == PCI_HEADER_TYPE_BRIDGE) {
> >  		sec = read_pci_config_byte(num, slot, func, PCI_SECONDARY_BUS);
> >  		if (sec > num)
> >  			early_pci_scan_bus(sec);
> >  	}
> >  
> > -	if (!(type & 0x80))
> > +	if (!(type & PCI_HEADER_TYPE_MFD))
> >  		return -1;
> >  
> >  	return 0;
> > -- 
> > 2.30.2
> > 

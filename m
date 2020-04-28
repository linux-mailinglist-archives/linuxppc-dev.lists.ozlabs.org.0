Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BE81BBCBD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 13:45:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49BKZl4zmKzDqsw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 21:45:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=gJ+OP2dO; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49BKY26TRlzDqfZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 21:43:50 +1000 (AEST)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8BED7206A1;
 Tue, 28 Apr 2020 11:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588074227;
 bh=C3RrHaH4L5nHvpS6TTlCiuxHkFrUFi0ST3B70exKPaE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=gJ+OP2dO0LshnikekgssZbBwArnQEgbbqlUxCdMNVB55zlcXhXNYciLXtyEBDsGph
 A3evgVJOW7hGuSR0cSl7gFBoy2CVXveGRfZ4xa+1IhZJCS5MZfEEdMSA7tX55tB71e
 exN+R7klP52nSf0PpCt/SJsQ15jEm7KsGuEHHyFc=
Date: Tue, 28 Apr 2020 06:43:45 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Yicong Yang <yangyicong@hisilicon.com>
Subject: Re: [PATCH v4] pci: Make return value of pcie_capability_read*()
 consistent
Message-ID: <20200428114345.GA123615@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4cc16e59-d346-5523-5072-eebe77d06a08@hisilicon.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Saheed Bolarinwa <refactormyself@gmail.com>, skhan@linuxfoundation.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pci@vger.kernel.org, bjorn@helgaas.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 28, 2020 at 10:19:08AM +0800, Yicong Yang wrote:
> On 2020/4/28 2:13, Bjorn Helgaas wrote:
> >
> > I'm starting to think we're approaching this backwards.  I searched
> > for PCIBIOS_FUNC_NOT_SUPPORTED, PCIBIOS_BAD_VENDOR_ID, and the other
> > error values.  Almost every use is a *return* in a config accessor.
> > There are very, very few *tests* for these values.
> 
> If we have certain reasons to reserve PCI_BIOS* error to identify
> PCI errors in PCI drivers, maybe redefine the PCI_BIOS* to generic
> error codes can solve the issues, and no need to call
> pcibios_err_to_errno() to do the conversion.  Few changes may be
> made to current codes. One possible patch may look like below.
> Otherwise, maybe convert all PCI_BIOS* errors to generic error codes
> is a better idea.
> 
> Not sure it's the best way or not. Just FYI.

That's a brilliant idea!  We should still look carefully at all the
callers of the config accessors, but this would avoid changing all the
arch accessors, so the patch would be dramatically smaller.

> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 83ce1cd..843987c 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -675,14 +675,18 @@ static inline bool pci_dev_msi_enabled(struct pci_dev *pci_dev) { return false;
>  
>  /* Error values that may be returned by PCI functions */
>  #define PCIBIOS_SUCCESSFUL		0x00
> -#define PCIBIOS_FUNC_NOT_SUPPORTED	0x81
> -#define PCIBIOS_BAD_VENDOR_ID		0x83
> -#define PCIBIOS_DEVICE_NOT_FOUND	0x86
> -#define PCIBIOS_BAD_REGISTER_NUMBER	0x87
> -#define PCIBIOS_SET_FAILED		0x88
> -#define PCIBIOS_BUFFER_TOO_SMALL	0x89
> -
> -/* Translate above to generic errno for passing back through non-PCI code */
> +#define PCIBIOS_FUNC_NOT_SUPPORTED	-ENOENT
> +#define PCIBIOS_BAD_VENDOR_ID		-ENOTTY
> +#define PCIBIOS_DEVICE_NOT_FOUND	-ENODEV
> +#define PCIBIOS_BAD_REGISTER_NUMBER	-EFAULT
> +#define PCIBIOS_SET_FAILED		-EIO
> +#define PCIBIOS_BUFFER_TOO_SMALL	-ENOSPC
> +
> +/**
> + * Translate above to generic errno for passing back through non-PCI code
> + *
> + * Deprecated. Use the PCIBIOS_* directly without a translation.
> + */
>  static inline int pcibios_err_to_errno(int err)
>  {
>  	if (err <= PCIBIOS_SUCCESSFUL)
> @@ -690,17 +694,12 @@ static inline int pcibios_err_to_errno(int err)
>  
>  	switch (err) {
>  	case PCIBIOS_FUNC_NOT_SUPPORTED:
> -		return -ENOENT;
>  	case PCIBIOS_BAD_VENDOR_ID:
> -		return -ENOTTY;
>  	case PCIBIOS_DEVICE_NOT_FOUND:
> -		return -ENODEV;
>  	case PCIBIOS_BAD_REGISTER_NUMBER:
> -		return -EFAULT;
>  	case PCIBIOS_SET_FAILED:
> -		return -EIO;
>  	case PCIBIOS_BUFFER_TOO_SMALL:
> -		return -ENOSPC;
> +		return err;
>  	}
>  
>  	return -ERANGE;
> 
> > For example, the only tests for PCIBIOS_FUNC_NOT_SUPPORTED are in
> > xen_pcibios_err_to_errno() and pcibios_err_to_errno(), i.e., we're
> > just converting that value to -ENOENT or the Xen-specific thing.
> >
> > So I think the best approach might be to remove the PCIBIOS_* error
> > values completely and replace them with the corresponding values from
> > pcibios_err_to_errno().  For example, a part of the patch would look
> > like this:
> >
> > diff --git a/arch/mips/pci/ops-emma2rh.c b/arch/mips/pci/ops-emma2rh.c
> > index 65f47344536c..d4d9c902c147 100644
> > --- a/arch/mips/pci/ops-emma2rh.c
> > +++ b/arch/mips/pci/ops-emma2rh.c
> > @@ -100,7 +100,7 @@ static int pci_config_read(struct pci_bus *bus, unsigned int devfn, int where,
> >  		break;
> >  	default:
> >  		emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
> > -		return PCIBIOS_FUNC_NOT_SUPPORTED;
> > +		return -ENOENT;
> >  	}
> >  
> >  	emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
> > @@ -149,7 +149,7 @@ static int pci_config_write(struct pci_bus *bus, unsigned int devfn, int where,
> >  		break;
> >  	default:
> >  		emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
> > -		return PCIBIOS_FUNC_NOT_SUPPORTED;
> > +		return -ENOENT;
> >  	}
> >  	*(volatile u32 *)(base + (PCI_FUNC(devfn) << 8) +
> >  			  (where & 0xfffffffc)) = data;
> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 83ce1cdf5676..f95637a8d391 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -675,7 +675,6 @@ static inline bool pci_dev_msi_enabled(struct pci_dev *pci_dev) { return false;
> >  
> >  /* Error values that may be returned by PCI functions */
> >  #define PCIBIOS_SUCCESSFUL		0x00
> > -#define PCIBIOS_FUNC_NOT_SUPPORTED	0x81
> >  #define PCIBIOS_BAD_VENDOR_ID		0x83
> >  #define PCIBIOS_DEVICE_NOT_FOUND	0x86
> >  #define PCIBIOS_BAD_REGISTER_NUMBER	0x87
> > @@ -689,8 +688,6 @@ static inline int pcibios_err_to_errno(int err)
> >  		return err; /* Assume already errno */
> >  
> >  	switch (err) {
> > -	case PCIBIOS_FUNC_NOT_SUPPORTED:
> > -		return -ENOENT;
> >  	case PCIBIOS_BAD_VENDOR_ID:
> >  		return -ENOTTY;
> >  	case PCIBIOS_DEVICE_NOT_FOUND:
> > .
> >
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7315C1BAC1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 20:15:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499tH14Lr4zDqcN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Apr 2020 04:15:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=RLguQmWj; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499tDj2SH5zDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Apr 2020 04:13:08 +1000 (AEST)
Received: from localhost (mobile-166-175-187-210.mycingular.net
 [166.175.187.210])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6AA46206D4;
 Mon, 27 Apr 2020 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1588011186;
 bh=amoa91+/fv1iEZS2uDEOB1i68WEtXwM37VMMCWmVvvY=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=RLguQmWjlOEE4Q3BkKJhwbHKeKYPeMPYKv24kF5zVXbL9tE9kfsh8FXD+bXN0Fn6Z
 T45bonAT+Fioa2pas+77NwdUYQBh+05bd29drOJqUnTduCmJZvdQtkG1SOS1RfouQu
 UaJxwAiQt8Kcz34eT1h2unTUHPWu1EZO+K6mXA+E=
Date: Mon, 27 Apr 2020 13:13:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Saheed Bolarinwa <refactormyself@gmail.com>
Subject: Re: [PATCH v4] pci: Make return value of pcie_capability_read*()
 consistent
Message-ID: <20200427181304.GA214573@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9811866-8fea-9398-9337-45818136fe84@gmail.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-pci@vger.kernel.org,
 linux-mips@vger.kernel.org, yangyicong@hisilicon.com,
 skhan@linuxfoundation.org, bjorn@helgaas.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Thomas, Michael, linux-mips, linux-ppc, LKML
Background:

  - PCI config accessors (pci_read_config_word(), etc) return 0 or a
    positive error (PCIBIOS_BAD_REGISTER_NUMBER, etc).

  - PCI Express capability accessors (pcie_capability_read_word(),
    etc) return 0, a negative error (-EINVAL), or a positive error
    (PCIBIOS_BAD_REGISTER_NUMBER, etc).

  - The PCI Express case is hard for callers to deal with.  The
    original plan was to convert this case to either return 0 or
    positive errors, just like pci_read_config_word().

  - I'm raising the possibility of instead getting rid of the positive
    PCIBIOS_* error values completely and replacing them with -EINVAL,
    -ENOENT, etc.

  - Very few callers check the return codes at all.  Most of the ones
    that do either check for non-zero or use pcibios_err_to_errno() to
    convert PCIBIOS_* to -EINVAL, etc.

I added MIPS and powerpc folks to CC: just as FYI because you're the
biggest users of PCIBIOS_*.  The intent is that this would be zero
functional change.
]

On Sun, Apr 26, 2020 at 11:51:30AM +0200, Saheed Bolarinwa wrote:
> On 4/25/20 12:30 AM, Bjorn Helgaas wrote:
> > On Fri, Apr 24, 2020 at 04:27:11PM +0200, Bolarinwa Olayemi Saheed wrote:
> > > pcie_capability_read*() could return 0, -EINVAL, or any of the
> > > PCIBIOS_* error codes (which are positive).
> > > This is behaviour is now changed to return only PCIBIOS_* error
> > > codes on error.
> > > This is consistent with pci_read_config_*(). Callers can now have
> > > a consistent way for checking which error has occurred.
> > > 
> > > An audit of the callers of this function was made and no case was found
> > > where there is need for a change within the caller function or their
> > > dependencies down the heirarchy.
> > > Out of all caller functions discovered only 8 functions either persist the
> > > return value of pcie_capability_read*() or directly pass on the return
> > > value.
> > > 
> > > 1.) "./drivers/infiniband/hw/hfi1/pcie.c" :
> > > => pcie_speeds() line-306
> > > 
> > > 	if (ret) {
> > > 		dd_dev_err(dd, "Unable to read from PCI config\n");
> > > 		return ret;
> > > 	}
> > > 
> > > remarks: The variable "ret" is the captured return value.
> > >           This function passes on the return value. The return value was
> > > 	 store only by hfi1_init_dd() line-15076 in
> > >           ./drivers/infiniband/hw/hfi1/chip.c and it behave the same on all
> > > 	 errors. So this patch will not require a change in this function.
> > Thanks for the analysis, but I don't think it's quite complete.
> > Here's the call chain I see:
> > 
> >    local_pci_probe
> >      pci_drv->probe(..)
> >        init_one                        # hfi1_pci_driver.probe method
> >          hfi1_init_dd
> >            pcie_speeds
> >              pcie_capability_read_dword
> 
> Thank you for pointing out the call chain. After checking it, I noticed that
> the
> 
> error is handled within the chain in two places without being passed on.
> 
> 1. init_one() in ./drivers/infiniband/hw/hfil1/init.c
> 
>      ret = hfi1_init_dd(dd);
>             if (ret)
>                     goto clean_bail; /* error already printed */
> 
>    ...
>    clean_bail:
>             hfi1_pcie_cleanup(pdev);  /*EXITS*/
> 
> 2. hfi1_init_dd() in ./drivers/infiniband/hw/hfil1/chip.c
> 
>         ret = pcie_speeds(dd);
>         if (ret)
>                 goto bail_cleanup;
> 
>         ...
> 
>         bail_cleanup:
>                  hfi1_pcie_ddcleanup(dd);  /*EXITS*/
> 
> > If pcie_capability_read_dword() returns any non-zero value, that value
> > propagates all the way up and is eventually returned by init_one().
> > init_one() id called by local_pci_probe(), which interprets:
> > 
> >    < 0 as failure
> >      0 as success, and
> >    > 0 as "success but warn"
> > 
> > So previously an error from pcie_capability_read_dword() could cause
> > either failure or "success but warn" for the probe method, and after
> > this patch those errors will always cause "success but warn".
> > 
> > The current behavior is definitely a bug: if
> > pci_bus_read_config_word() returns PCIBIOS_BAD_REGISTER_NUMBER, that
> > causes pcie_capability_read_dword() to also return
> > PCIBIOS_BAD_REGISTER_NUMBER, which will lead to the probe succeeding
> > with a warning, when it should fail.
> > 
> > I think the fix is to make pcie_speeds() call pcibios_err_to_errno():
> > 
> >    ret = pcie_capability_read_dword(...);
> >    if (ret) {
> >      dd_dev_err(...);
> >      return pcibios_err_to_errno(ret);
> >    }
> 
> I agree that this fix is needed, so that PCIBIOS_* error code are
> not passed on but replaced
> 
> with one consistent with non-PCI error codes.
> 
> > That could be its own separate preparatory patch before this
> > adjustment to pcie_capability_read_dword().
> > 
> > I didn't look at the other cases below, so I don't know whether
> > they are similar hidden problems.
> 
> I will check again, please I will like to clarify if it will be to
> fine to just implement the conversion
> 
> (as suggested for pcie_speeds) in all found references, which passes
> on the error code.

I'm starting to think we're approaching this backwards.  I searched
for PCIBIOS_FUNC_NOT_SUPPORTED, PCIBIOS_BAD_VENDOR_ID, and the other
error values.  Almost every use is a *return* in a config accessor.
There are very, very few *tests* for these values.

For example, the only tests for PCIBIOS_FUNC_NOT_SUPPORTED are in
xen_pcibios_err_to_errno() and pcibios_err_to_errno(), i.e., we're
just converting that value to -ENOENT or the Xen-specific thing.

So I think the best approach might be to remove the PCIBIOS_* error
values completely and replace them with the corresponding values from
pcibios_err_to_errno().  For example, a part of the patch would look
like this:

diff --git a/arch/mips/pci/ops-emma2rh.c b/arch/mips/pci/ops-emma2rh.c
index 65f47344536c..d4d9c902c147 100644
--- a/arch/mips/pci/ops-emma2rh.c
+++ b/arch/mips/pci/ops-emma2rh.c
@@ -100,7 +100,7 @@ static int pci_config_read(struct pci_bus *bus, unsigned int devfn, int where,
 		break;
 	default:
 		emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
-		return PCIBIOS_FUNC_NOT_SUPPORTED;
+		return -ENOENT;
 	}
 
 	emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
@@ -149,7 +149,7 @@ static int pci_config_write(struct pci_bus *bus, unsigned int devfn, int where,
 		break;
 	default:
 		emma2rh_out32(EMMA2RH_PCI_IWIN0_CTR, backup_win0);
-		return PCIBIOS_FUNC_NOT_SUPPORTED;
+		return -ENOENT;
 	}
 	*(volatile u32 *)(base + (PCI_FUNC(devfn) << 8) +
 			  (where & 0xfffffffc)) = data;
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 83ce1cdf5676..f95637a8d391 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -675,7 +675,6 @@ static inline bool pci_dev_msi_enabled(struct pci_dev *pci_dev) { return false;
 
 /* Error values that may be returned by PCI functions */
 #define PCIBIOS_SUCCESSFUL		0x00
-#define PCIBIOS_FUNC_NOT_SUPPORTED	0x81
 #define PCIBIOS_BAD_VENDOR_ID		0x83
 #define PCIBIOS_DEVICE_NOT_FOUND	0x86
 #define PCIBIOS_BAD_REGISTER_NUMBER	0x87
@@ -689,8 +688,6 @@ static inline int pcibios_err_to_errno(int err)
 		return err; /* Assume already errno */
 
 	switch (err) {
-	case PCIBIOS_FUNC_NOT_SUPPORTED:
-		return -ENOENT;
 	case PCIBIOS_BAD_VENDOR_ID:
 		return -ENOTTY;
 	case PCIBIOS_DEVICE_NOT_FOUND:

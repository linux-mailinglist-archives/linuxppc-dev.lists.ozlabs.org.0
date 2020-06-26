Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C335D20B8AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 20:53:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tmHg0N8czDqtQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 04:53:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=n790PbLz; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tmFz24NtzDq7d
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 04:52:06 +1000 (AEST)
Received: from localhost (mobile-166-170-222-206.mycingular.net
 [166.170.222.206])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EDAD02075A;
 Fri, 26 Jun 2020 18:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593197524;
 bh=E5ZeGIaQ4TvxmK01qXTN6ia+aVwiHoFFaYZso3L47YA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=n790PbLzROZKWoZhFf+3iV0hWLyb/W4bEQ791+kAAwLaVp5omcjYgtmZzdRV/vQeO
 QC8lhrpHholCaSmgheL1iCtiGerP/zLk6/3Qqyo8gLLZtwT+jHx0pydM3LZfATP8MY
 GQG89aRpEKi6nyQJjU12vDJcIx8SPa8rhTc3PTCw=
Date: Fri, 26 Jun 2020 13:52:02 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: refactormyself@gmail.com
Subject: Re: [PATCH 0/8 v2] PCI: Align return values of PCIe capability and
 PCI accessors
Message-ID: <20200626185202.GA2923565@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
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
Cc: Don Brace <don.brace@microsemi.com>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-rdma@vger.kernel.org,
 linux-pci@vger.kernel.org, Dennis Dalessandro <dennis.dalessandro@intel.com>,
 esc.storagedev@microsemi.com, Doug Ledford <dledford@redhat.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 skhan@linuxfoundation.org, bjorn@helgaas.com, linuxppc-dev@lists.ozlabs.org,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 09:32:17AM +0200, refactormyself@gmail.com wrote:
> From: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
> 
> 
> PATCH 1/8 to 7/8:
> PCIBIOS_ error codes have positive values and they are passed down the
> call heirarchy from accessors. For functions which are meant to return
> only a negative value on failure, passing on this value is a bug.
> To mitigate this, call pcibios_err_to_errno() before passing on return
> value from PCIe capability accessors call heirarchy. This function
> converts any positive PCIBIOS_ error codes to negative generic error
> values.
> 
> PATCH 8/8:
> The PCIe capability accessors can return 0, -EINVAL, or any PCIBIOS_ error
> code. The pci accessor on the other hand can only return 0 or any PCIBIOS_
> error code.This inconsistency among these accessor makes it harder for
> callers to check for errors.
> Return PCIBIOS_BAD_REGISTER_NUMBER instead of -EINVAL in all PCIe
> capability accessors.
> 
> MERGING:
> These may all be merged via the PCI tree, since it is a collection of
> similar fixes. This way they all get merged at once.
> 
> Version 2:
> * cc to maintainers and mailing lists
> * Edit the Subject to conform with previous style
> * reorder "Signed by" and "Suggested by"
> * made spelling corrections
> * fixed redundant initialisation in PATCH 3/8
> * include missing call to pcibios_err_to_errno() in PATCH 6/8 and 7/8
> 
> 
> Bolarinwa Olayemi Saheed (8):
>   dmaengine: ioatdma: Convert PCIBIOS_* errors to generic -E* errors
>   IB/hfi1: Convert PCIBIOS_* errors to generic -E* errors
>   IB/hfi1: Convert PCIBIOS_* errors to generic -E* errors
>   PCI: Convert PCIBIOS_* errors to generic -E* errors
>   scsi: smartpqi: Convert PCIBIOS_* errors to generic -E* errors
>   PCI/AER: Convert PCIBIOS_* errors to generic -E* errors
>   PCI/AER: Convert PCIBIOS_* errors to generic -E* errors
>   PCI: Align return values of PCIe capability and PCI accessorss
> 
>  drivers/dma/ioat/init.c               |  4 ++--
>  drivers/infiniband/hw/hfi1/pcie.c     | 18 +++++++++++++-----
>  drivers/pci/access.c                  |  8 ++++----
>  drivers/pci/pci.c                     | 10 ++++++++--
>  drivers/pci/pcie/aer.c                | 12 ++++++++++--
>  drivers/scsi/smartpqi/smartpqi_init.c |  6 +++++-
>  6 files changed, 42 insertions(+), 16 deletions(-)

Since these are really fixing a single PCI API problem, not individual
driver-related problems, I squashed the pcibios_err_to_errno() patches
together (except IB/hfi1, since Jason will take those separately) and
applied them to pci/misc, thanks!

The squashed patch as applied is:

commit d20df83b66cc ("PCI: Convert PCIe capability PCIBIOS errors to errno")
Author: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
Date:   Mon Jun 15 09:32:18 2020 +0200

    PCI: Convert PCIe capability PCIBIOS errors to errno
    
    The PCI config accessors (pci_read_config_word(), et al) return
    PCIBIOS_SUCCESSFUL (zero) or positive error values like
    PCIBIOS_FUNC_NOT_SUPPORTED.
    
    The PCIe capability accessors (pcie_capability_read_word(), et al)
    similarly return PCIBIOS errors, but some callers assume they return
    generic errno values like -EINVAL.
    
    For example, the Myri-10G probe function returns a positive PCIBIOS error
    if the pcie_capability_clear_and_set_word() in pcie_set_readrq() fails:
    
      myri10ge_probe
        status = pcie_set_readrq
          return pcie_capability_clear_and_set_word
        if (status)
          return status
    
    A positive return from a PCI driver probe function would cause a "Driver
    probe function unexpectedly returned" warning from local_pci_probe()
    instead of the desired probe failure.
    
    Convert PCIBIOS errors to generic errno for all callers of:
    
      pcie_capability_read_word
      pcie_capability_read_dword
      pcie_capability_write_word
      pcie_capability_write_dword
      pcie_capability_set_word
      pcie_capability_set_dword
      pcie_capability_clear_word
      pcie_capability_clear_dword
      pcie_capability_clear_and_set_word
      pcie_capability_clear_and_set_dword
    
    that check the return code for anything other than zero.
    
    [bhelgaas: commit log, squash together]
    Suggested-by: Bjorn Helgaas <bjorn@helgaas.com>
    Link: https://lore.kernel.org/r/20200615073225.24061-1-refactormyself@gmail.com
    Signed-off-by: Bolarinwa Olayemi Saheed <refactormyself@gmail.com>
    Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>

diff --git a/drivers/dma/ioat/init.c b/drivers/dma/ioat/init.c
index 58d13564f88b..9a6a9ec3cf48 100644
--- a/drivers/dma/ioat/init.c
+++ b/drivers/dma/ioat/init.c
@@ -1195,13 +1195,13 @@ static int ioat3_dma_probe(struct ioatdma_device *ioat_dma, int dca)
 	/* disable relaxed ordering */
 	err = pcie_capability_read_word(pdev, IOAT_DEVCTRL_OFFSET, &val16);
 	if (err)
-		return err;
+		return pcibios_err_to_errno(err);
 
 	/* clear relaxed ordering enable */
 	val16 &= ~IOAT_DEVCTRL_ROE;
 	err = pcie_capability_write_word(pdev, IOAT_DEVCTRL_OFFSET, val16);
 	if (err)
-		return err;
+		return pcibios_err_to_errno(err);
 
 	if (ioat_dma->cap & IOAT_CAP_DPS)
 		writeb(ioat_pending_level + 1,
diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index ce096272f52b..45c51aff9c03 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -5688,6 +5688,7 @@ EXPORT_SYMBOL(pcie_get_readrq);
 int pcie_set_readrq(struct pci_dev *dev, int rq)
 {
 	u16 v;
+	int ret;
 
 	if (rq < 128 || rq > 4096 || !is_power_of_2(rq))
 		return -EINVAL;
@@ -5706,8 +5707,10 @@ int pcie_set_readrq(struct pci_dev *dev, int rq)
 
 	v = (ffs(rq) - 8) << 12;
 
-	return pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
+	ret = pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
 						  PCI_EXP_DEVCTL_READRQ, v);
+
+	return pcibios_err_to_errno(ret);
 }
 EXPORT_SYMBOL(pcie_set_readrq);
 
@@ -5738,6 +5741,7 @@ EXPORT_SYMBOL(pcie_get_mps);
 int pcie_set_mps(struct pci_dev *dev, int mps)
 {
 	u16 v;
+	int ret;
 
 	if (mps < 128 || mps > 4096 || !is_power_of_2(mps))
 		return -EINVAL;
@@ -5747,8 +5751,10 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
 		return -EINVAL;
 	v <<= 5;
 
-	return pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
+	ret = pcie_capability_clear_and_set_word(dev, PCI_EXP_DEVCTL,
 						  PCI_EXP_DEVCTL_PAYLOAD, v);
+
+	return pcibios_err_to_errno(ret);
 }
 EXPORT_SYMBOL(pcie_set_mps);
 
diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
index 3acf56683915..2dbc1fd2910b 100644
--- a/drivers/pci/pcie/aer.c
+++ b/drivers/pci/pcie/aer.c
@@ -224,20 +224,25 @@ int pcie_aer_is_native(struct pci_dev *dev)
 
 int pci_enable_pcie_error_reporting(struct pci_dev *dev)
 {
+	int rc;
+
 	if (!pcie_aer_is_native(dev))
 		return -EIO;
 
-	return pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
+	rc = pcie_capability_set_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
+	return pcibios_err_to_errno(rc);
 }
 EXPORT_SYMBOL_GPL(pci_enable_pcie_error_reporting);
 
 int pci_disable_pcie_error_reporting(struct pci_dev *dev)
 {
+	int rc;
+
 	if (!pcie_aer_is_native(dev))
 		return -EIO;
 
-	return pcie_capability_clear_word(dev, PCI_EXP_DEVCTL,
-					  PCI_EXP_AER_FLAGS);
+	rc = pcie_capability_clear_word(dev, PCI_EXP_DEVCTL, PCI_EXP_AER_FLAGS);
+	return pcibios_err_to_errno(rc);
 }
 EXPORT_SYMBOL_GPL(pci_disable_pcie_error_reporting);
 
diff --git a/drivers/scsi/smartpqi/smartpqi_init.c b/drivers/scsi/smartpqi/smartpqi_init.c
index cd157f11eb22..bd38c8cea56e 100644
--- a/drivers/scsi/smartpqi/smartpqi_init.c
+++ b/drivers/scsi/smartpqi/smartpqi_init.c
@@ -7423,8 +7423,12 @@ static int pqi_ctrl_init_resume(struct pqi_ctrl_info *ctrl_info)
 static inline int pqi_set_pcie_completion_timeout(struct pci_dev *pci_dev,
 	u16 timeout)
 {
-	return pcie_capability_clear_and_set_word(pci_dev, PCI_EXP_DEVCTL2,
+	int rc;
+
+	rc = pcie_capability_clear_and_set_word(pci_dev, PCI_EXP_DEVCTL2,
 		PCI_EXP_DEVCTL2_COMP_TIMEOUT, timeout);
+
+	return pcibios_err_to_errno(rc);
 }
 
 static int pqi_pci_init(struct pqi_ctrl_info *ctrl_info)



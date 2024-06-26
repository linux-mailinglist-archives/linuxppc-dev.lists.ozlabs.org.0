Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C5B91859C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2024 17:22:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h0vHs/2K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8QRt61y8z3cVN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 01:22:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h0vHs/2K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8QRC2y8rz3cF6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 01:21:59 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6930761A55;
	Wed, 26 Jun 2024 15:21:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB84BC116B1;
	Wed, 26 Jun 2024 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719415317;
	bh=8IQ81VX6qQNbtyEW2rTC8cmOk7EiV9iaDpCs1/CLdPI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=h0vHs/2KoepLvPUkxh7l7hpYnG+XDO/Z5oN40qf9ZL8/IVehfV6gR6aanzPZNUSTH
	 CMw4cgUZ0Ox6aRcmlamMhwlKQ90GL1J8TNwVKsjkONV62nD1WQ+QmNhCReQD1BzAUs
	 DpD8FGfuSLnLLR+6fYrU9D+bihlt8NF/X1/f09rFNDFsRvCUWF472j5r3VTmbpDHc/
	 qDlF0B1d3p2JVTp8kaugsjNl0pGKnxqFeZahlnwQCSl89K7q6v/szkE522Bw2ZTVKH
	 F6z5zwlQhUtbCrmSFUfb5QsDbdWbDTg3/NBRkJH5UlRRJ89ULucJi5g7hlokaWgN3f
	 gx5xOQ0cJayQA==
Date: Wed, 26 Jun 2024 10:21:54 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Krishna Kumar <krishnak@linux.ibm.com>
Subject: Re: [PATCH v3 1/2] pci/hotplug/pnv_php: Fix hotplug driver crash on
 Powernv
Message-ID: <20240626152154.GA1467164@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240624121052.233232-2-krishnak@linux.ibm.com>
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
Cc: nathanl@linux.ibm.com, aneesh.kumar@kernel.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, gbatra@linux.ibm.com, bhelgaas@google.com, tpearson@raptorengineering.com, oohall@gmail.com, christophe.leroy@csgroup.eu, linux-pci@vger.kernel.org, brking@linux.vnet.ibm.com, mahesh.salgaonkar@in.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I expect this series would go through the powerpc tree since that's
where most of the chance is.

On Mon, Jun 24, 2024 at 05:39:27PM +0530, Krishna Kumar wrote:
> Description of the problem: The hotplug driver for powerpc
> (pci/hotplug/pnv_php.c) gives kernel crash when we try to
> hot-unplug/disable the PCIe switch/bridge from the PHB.
> 
> Root Cause of Crash: The crash is due to the reason that, though the msi
> data structure has been released during disable/hot-unplug path and it
> has been assigned with NULL, still during unregistartion the code was
> again trying to explicitly disable the msi which causes the Null pointer
> dereference and kernel crash.

s/unregistartion/unregistration/
s/Null/NULL/ to match previous use
s/msi/MSI/ to match spec usage

> Proposed Fix : The fix is to correct the check during unregistration path
> so that the code should not  try to invoke pci_disable_msi/msix() if its
> data structure is already freed.

s/Proposed Fix : The fix is to// ... Just say what the patch does.

If/when the powerpc folks like this, add my:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Gaurav Batra <gbatra@linux.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Brian King <brking@linux.vnet.ibm.com>
> 
> Signed-off-by: Krishna Kumar <krishnak@linux.ibm.com>
> ---
>  drivers/pci/hotplug/pnv_php.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/pnv_php.c b/drivers/pci/hotplug/pnv_php.c
> index 694349be9d0a..573a41869c15 100644
> --- a/drivers/pci/hotplug/pnv_php.c
> +++ b/drivers/pci/hotplug/pnv_php.c
> @@ -40,7 +40,6 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
>  				bool disable_device)
>  {
>  	struct pci_dev *pdev = php_slot->pdev;
> -	int irq = php_slot->irq;
>  	u16 ctrl;
>  
>  	if (php_slot->irq > 0) {
> @@ -59,7 +58,7 @@ static void pnv_php_disable_irq(struct pnv_php_slot *php_slot,
>  		php_slot->wq = NULL;
>  	}
>  
> -	if (disable_device || irq > 0) {
> +	if (disable_device) {
>  		if (pdev->msix_enabled)
>  			pci_disable_msix(pdev);
>  		else if (pdev->msi_enabled)
> -- 
> 2.45.0
> 

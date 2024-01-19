Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 297E2833153
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 00:00:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ut1qqGeK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGw7P0L9Lz3cRc
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 10:00:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ut1qqGeK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGw6T0S5Pz2yk9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 09:59:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F01B161615;
	Fri, 19 Jan 2024 22:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678C5C433C7;
	Fri, 19 Jan 2024 22:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705705165;
	bh=R+D0jk/2xIKckQ4bRuHaV19Q6bC2783kDdOIqDI6aVM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Ut1qqGeKL6SDjjZnM3+TyodeE0wMlOB3DvZ4OZWLukoMnEEAB81JeMxten0zHXHV3
	 fMgjt/MR6sXA4prsQC61w6cjuW8P0GRqE7T1dLDT5CcfUMrMs1ZaQlS+7z4Q4/Rhaq
	 YC4fotRM1zaiBwkGaEMQTDhEnJriNKy76mOYqplqJ21GHCkvscDcd1XUj2Y053W8Yz
	 RdsHZPPpnwOYwVlOYESFQF5HrfJpzRe1ywTfdDBjhfLQpnQ8VY1E31A0eUFLAYE5Na
	 vNtUFQeMuY8JHdjwxWNAKQTINBj4zQycfk5GT7WQK0DNO7FL76GbyKtxhW4X2Cbdq6
	 LksvSEA7an54g==
Date: Fri, 19 Jan 2024 16:59:23 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Subject: Re: [PATCH 1/1] PCI/DPC: Fix TLP Prefix register reading offset
Message-ID: <20240119225923.GA191511@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240118110815.3867-1-ilpo.jarvinen@linux.intel.com>
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
Cc: linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Keith Busch <kbusch@kernel.org>, Oliver O'Halloran <oohall@gmail.com>, Dongdong Liu <liudongdong3@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 18, 2024 at 01:08:15PM +0200, Ilpo Järvinen wrote:
> The TLP Prefix Log Register consists of multiple DWORDs (PCIe r6.1 sec
> 7.9.14.13) but the loop in dpc_process_rp_pio_error() keeps reading
> from the first DWORD. Add the iteration count based offset calculation
> into the config read.

So IIUC the user-visible bug is that we print only the first PIO TLP
Prefix (duplicated several times), and we never print the second,
third, etc Prefixes, right?

I wish we could print them all in a single pci_err(), as we do for the
TLP Header Log, instead of dribbling them out one by one.

> Fixes: f20c4ea49ec4 ("PCI/DPC: Add eDPC support")
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
>  drivers/pci/pcie/dpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
> index 94111e438241..e5d7c12854fa 100644
> --- a/drivers/pci/pcie/dpc.c
> +++ b/drivers/pci/pcie/dpc.c
> @@ -234,7 +234,7 @@ static void dpc_process_rp_pio_error(struct pci_dev *pdev)
>  
>  	for (i = 0; i < pdev->dpc_rp_log_size - 5; i++) {
>  		pci_read_config_dword(pdev,
> -			cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG, &prefix);
> +			cap + PCI_EXP_DPC_RP_PIO_TLPPREFIX_LOG + i * 4, &prefix);
>  		pci_err(pdev, "TLP Prefix Header: dw%d, %#010x\n", i, prefix);
>  	}
>   clear_status:
> -- 
> 2.39.2
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5800A2336B4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jul 2020 18:26:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BHbPx1BD2zDqD3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jul 2020 02:26:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=HjKiDMPw; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BHbC84zg4zDr7W
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jul 2020 02:16:52 +1000 (AEST)
Received: from localhost (mobile-166-175-62-240.mycingular.net
 [166.175.62.240])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 925452072A;
 Thu, 30 Jul 2020 16:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596125809;
 bh=hNfjKS+QR4p8l07gd55PXLnckFNFqYkpyTOwjMmoaSA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=HjKiDMPwCoi7NJ0Jz+lypkIjYiHzaqqEMdVa2qeT2bX1EJ8XMPQmSMm3N8TTlWjAZ
 mprTQhhuobed38hEWxNtazyYchMzB9pCo7YrSzNaFClPDPdzevsQsDD7JoC9YKr6BR
 n3lPugWvDcQkidk96W5jq2v68qfrj8SHGLSknx6U=
Date: Thu, 30 Jul 2020 11:16:48 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Wei Yongjun <weiyongjun1@huawei.com>
Subject: Re: [PATCH -next] PCI: rpadlpar: Make some functions static
Message-ID: <20200730161648.GA2044795@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200721151735.41181-1-weiyongjun1@huawei.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-pci@vger.kernel.org,
 Hulk Robot <hulkci@huawei.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 11:17:35PM +0800, Wei Yongjun wrote:
> The sparse tool report build warnings as follows:
> 
> drivers/pci/hotplug/rpadlpar_core.c:355:5: warning:
>  symbol 'dlpar_remove_pci_slot' was not declared. Should it be static?
> drivers/pci/hotplug/rpadlpar_core.c:461:12: warning:
>  symbol 'rpadlpar_io_init' was not declared. Should it be static?
> drivers/pci/hotplug/rpadlpar_core.c:473:6: warning:
>  symbol 'rpadlpar_io_exit' was not declared. Should it be static?
> 
> Those functions are not used outside of this file, so marks them
> static.
> Also mark rpadlpar_io_exit() as __exit.
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Applied to pci/hotplug for v5.9, thanks!

> ---
>  drivers/pci/hotplug/rpadlpar_core.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/pci/hotplug/rpadlpar_core.c b/drivers/pci/hotplug/rpadlpar_core.c
> index c5eb509c72f0..f979b7098acf 100644
> --- a/drivers/pci/hotplug/rpadlpar_core.c
> +++ b/drivers/pci/hotplug/rpadlpar_core.c
> @@ -352,7 +352,7 @@ static int dlpar_remove_vio_slot(char *drc_name, struct device_node *dn)
>   * -ENODEV		Not a valid drc_name
>   * -EIO			Internal PCI Error
>   */
> -int dlpar_remove_pci_slot(char *drc_name, struct device_node *dn)
> +static int dlpar_remove_pci_slot(char *drc_name, struct device_node *dn)
>  {
>  	struct pci_bus *bus;
>  	struct slot *slot;
> @@ -458,7 +458,7 @@ static inline int is_dlpar_capable(void)
>  	return (int) (rc != RTAS_UNKNOWN_SERVICE);
>  }
>  
> -int __init rpadlpar_io_init(void)
> +static int __init rpadlpar_io_init(void)
>  {
>  
>  	if (!is_dlpar_capable()) {
> @@ -470,7 +470,7 @@ int __init rpadlpar_io_init(void)
>  	return dlpar_sysfs_init();
>  }
>  
> -void rpadlpar_io_exit(void)
> +static void __exit rpadlpar_io_exit(void)
>  {
>  	dlpar_sysfs_exit();
>  }
> 

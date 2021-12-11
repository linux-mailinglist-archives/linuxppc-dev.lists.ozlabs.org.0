Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD7471521
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 18:55:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JBFmc0SkYz3cbT
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 04:55:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=i5MBNOa7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1;
 helo=sin.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=i5MBNOa7; 
 dkim-atps=neutral
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JBFm11r3jz2xCB
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Dec 2021 04:54:57 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 00BA5CE000E;
 Sat, 11 Dec 2021 17:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B49D5C004DD;
 Sat, 11 Dec 2021 17:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639245292;
 bh=Jo5vuURk4kAxgHfUfbWfY4wl1/saPxtBexHyy82NpVI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=i5MBNOa7UbMhaF8Qi1kXozP9kU+uRRnv8rt5PGCSwloZN+Hq+sGPClErbZ02FmHQz
 FZqg0HfwnxjaYSpBTuvuKodKN86pHyZRcv0fTf7EaBYbc7hzj36ozg3PAguJWJCa0c
 VwZnPCExI2LewKGyuDW+sOqh2fH0kkZKTRJ7idKUMI/QOzhOh1/dqjHdBJOgvikrwY
 KUOzLpel2aBXN/K0XJ/5tgiwOikXuteZidjxfLjIxJi1BQulM+Xv8ii6ARNgqM2YVG
 hbBNhQax507aYsOaniPlWMPmd+TtMTOZLfJ4LCJ8XIZleu1Lq/4205NLz1IjYTk+nd
 Kihn5fOrnHkZQ==
Date: Sat, 11 Dec 2021 11:54:50 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>
Subject: Re: [PATCH] PCI/AER: potential dereference of null pointer
Message-ID: <20211211175450.GA398271@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211209094556.2085357-1-jiasheng@iscas.ac.cn>
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
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, oohall@gmail.com,
 bhelgaas@google.com, Rajat Jain <rajatja@google.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[+cc Rajat, author of aer_stats:
db89ccbe52c7 ("PCI/AER: Define aer_stats structure for AER capable devices"
81aa5206f9a7 ("PCI/AER: Add sysfs attributes to provide AER stats and breakdown"]

On Thu, Dec 09, 2021 at 05:45:56PM +0800, Jiasheng Jiang wrote:
> he return value of kzalloc() needs to be checked.
> To avoid use of null pointer in case of the failure of alloc.
> 
> Fixes: db89ccbe52c7 ("PCI/AER: Define aer_stats structure for AER capable devices")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>  drivers/pci/pcie/aer.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index ec943cee5ecc..d04303edf468 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -376,6 +376,8 @@ void pci_aer_init(struct pci_dev *dev)
>  		return;
>  
>  	dev->aer_stats = kzalloc(sizeof(struct aer_stats), GFP_KERNEL);
> +	if (!dev->aer_stats)
> +		return;

Did you actually trip over a null pointer dereference, and if so,
where was it?

I think the intent here was that aer_stats is a non-essential feature,
and if we can't allocate space to keep the statistics, we can still
use the device without the stats.

I *think* all the users of dev->aer_stats check for NULL before
dereferencing it, but if you found a case that doesn't do that, we
should definitely fix it.

In a few cases (aer_stats_dev_attr, aer_stats_rootport_attr), the
check isn't obvious -- it happens in aer_stats_attrs_are_visible().
If aer_stats_attrs_are_visible() finds that aer_stats is NULL, those
sysfs attributes should not be visible, and the corresponding *_show()
functions should never be called.

>  	/*
>  	 * We save/restore PCI_ERR_UNCOR_MASK, PCI_ERR_UNCOR_SEVER,
> -- 
> 2.25.1
> 

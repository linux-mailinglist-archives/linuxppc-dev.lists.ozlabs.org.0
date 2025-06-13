Return-Path: <linuxppc-dev+bounces-9336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5170AD85E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 10:45:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJXzj3vQFz30P3;
	Fri, 13 Jun 2025 18:45:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749804353;
	cv=none; b=RbB+njixsVLx3oFaLmHm1kQRTlYngxQf68B4HrAdhx2B6ll4MG+0dhxZ/cXBdr6itY74wP8Hay4cWkSODzIvhufit49U9kQz2JRQGJ11mhPWwX00Es6YyIGuio276VxiDKRroi3vBHJe7NkVZplRwmzzzCLCLKpaI0vTqnXmkkZsP/0B+bgmmIqA4AIJrbd8XbYtR2lMGDOS0WblEFiWIMZIK7AEU51+AP+X//FStYgnuWZSAK7hTIJaYkCsMui746luxJ92dXwCNkoqN3Tez+2+RCzGUJq0fKZlS/8hzdapdbtJ1cCt6sIupAod7y+AWGM0Qx2w13TGI+HzTBpL/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749804353; c=relaxed/relaxed;
	bh=Gf+A06e4WcDr+kEBaMBUF4ufTyECUTsqvul/Jc4lJ0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fXGIh1LcSvKiHZcBLAF+csM71ZWX+xm4788R9qW9sKCTSLpL2X1ogUl4HVoWUwHbrtQp9InvzSPS33yyej6GRLgfCFOovqqNuLvT1VhNOYy+8Ow+Nab9LWACXgsb1tlRMEkTw2JwvFQS59ICrC2ZYdCiKBaXhAcZdM4R4DFPy2ooYcl7kJBC9FAAOOQFADvQNRX8IgR/wuthC7s0mouCilK5Nn5XZU9DhQbg6C2Dt/yxymVtWprSmOpqtbS/pQvEWD7lbmPb/K1VWg4nwqEYvUJFWUoG0mOxioU5C9Lkjz9PDeb+qwobsSRH15jawqshzEwQlfBslWw+Ulloj00U8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Io6BXJVO; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Io6BXJVO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=mani@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bJXzh5FN9z30NP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Jun 2025 18:45:52 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 692676113B;
	Fri, 13 Jun 2025 08:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4682AC4CEE3;
	Fri, 13 Jun 2025 08:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749804350;
	bh=6PQjGNdTndadBOHPNSprrGjhrgshe7eqm6LfkP0/LiU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Io6BXJVOBa3rGapk/leIugA8Y0mg9CsNPVHgzaioUd+wmmJzgXCNeBylEZf7BTz95
	 /rq0CwhhW0lO46pyfqsFZzIAWgtMxGt1nuoMJC57bG9/3TQj5yWYORirArDMGB2mB8
	 tUThlPLV/GKKLEweCgbFvdjiHomidjbppYF5KTQmm77oG93fGmla/PI/v9r60EtMjZ
	 yORFY3xe0HKEYZOXIoHtrVL5M+ZqLQGXetecA4RaWPYO6TunP6sjBS0U2QdyJy2c9a
	 1y+30HoSoC5Hg5iUcQYn2JQBt3HlzRCJUOAuM2DmLw+Ut89iABTAMGXpe1Pfg6nSZE
	 cgGzTmqFhr5vg==
Date: Fri, 13 Jun 2025 14:15:41 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Hans Zhang <18255117159@163.com>
Cc: bhelgaas@google.com, tglx@linutronix.de, kw@linux.com, 
	manivannan.sadhasivam@linaro.org, mahesh@linux.ibm.com, oohall@gmail.com, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Hans Zhang <hans.zhang@cixtech.com>
Subject: Re: [PATCH 2/2] PCI/AER: Use bool for AER disable state tracking
Message-ID: <ufdexukxobnpyjmfbr7gb2zvlv4xshkwbuinrrr3fowtmjtcyv@xfmmg7wrvjm7>
References: <20250516165223.125083-1-18255117159@163.com>
 <20250516165223.125083-3-18255117159@163.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250516165223.125083-3-18255117159@163.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, May 17, 2025 at 12:52:23AM +0800, Hans Zhang wrote:
> From: Hans Zhang <hans.zhang@cixtech.com>
> 
> Change pcie_aer_disable variable to bool and update pci_no_aer()
> to set it to true. Improves code readability and aligns with modern
> kernel practices.
> 
> Signed-off-by: Hans Zhang <hans.zhang@cixtech.com>

Applied to pci/misc!

- Mani

> ---
>  drivers/pci/pcie/aer.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index a1cf8c7ef628..ade98c5a19b9 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -111,12 +111,12 @@ struct aer_stats {
>  					PCI_ERR_ROOT_MULTI_COR_RCV |	\
>  					PCI_ERR_ROOT_MULTI_UNCOR_RCV)
>  
> -static int pcie_aer_disable;
> +static bool pcie_aer_disable;
>  static pci_ers_result_t aer_root_reset(struct pci_dev *dev);
>  
>  void pci_no_aer(void)
>  {
> -	pcie_aer_disable = 1;
> +	pcie_aer_disable = true;
>  }
>  
>  bool pci_aer_available(void)
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்


Return-Path: <linuxppc-dev+bounces-6160-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D78CA3510B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 23:14:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yv8cQ0WHFz30CN;
	Fri, 14 Feb 2025 09:14:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739484886;
	cv=none; b=VaLQqOfn3aD6vdzDmDvl/AxIBGiLAjJdj2ZUHIf2IFbhDSG9fYbKqT0izzgknF7hAv+eWXRngSv5Un+yqRO3EMdb1xu54JMI6Ic3OQjmhurEa9d4SWTeFXzjjksgetkP9UIP2O9nnmxVCoa3grRIAmNTxP741ofUFJOgwmzYV8XxEnvEPXe6XTZeG3AhWD+js7Uw+5gxnRh5OashLBM4H/ofxlRMVZi9ng8B4/YcwNcAf24290KBtc0XelBvxcN8fMluHc+qqwbda0agUfs5CRebEXijeDSyQQPH2i8uv/cAxzH5aCDuHyYRu2DxHBReV53IvMwn9tdsIADk5CMITA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739484886; c=relaxed/relaxed;
	bh=XG5RlBgKjh+9iyxqUII1wILkqSJBstSN7/E8OUyOjIA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=ip/ECuMvjyhB5NTtzIHSNzyTpVSjzkELnr04qEQcGDuLoN2W1bDmYFSqwAxnThb1sCCaN/6CUe+fjLHhC7H7uHBDrvmDcsbzGJ1cCGoWhJYgwlwRoOD/4Ge6vTpvzf5iJCYcXLWQpqSyGnSUlf9p3GcD94fR1XLOyx7UPfAOOYJzB9UjT+ZrgnnmmezfZqj3NXY/zWiC1LVsc7gbkVjNYHCbR/4HAvTz8qSjmliHJ12ajAxwjN/xwOBpP+r1dL+6trEPK9gMo8dF5ih7tRn7u9V9qKKZWH/vCK/yAjjgQGNxfJ8SW906EIyPOPZ+TFN3/NW0jypYwy34rRXYUS2r8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJpkEmBT; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJpkEmBT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yv8cP2ml7z3054
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 09:14:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CBB08A40B5C;
	Thu, 13 Feb 2025 22:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B9DDC4CED1;
	Thu, 13 Feb 2025 22:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739484882;
	bh=2mCO7TSVY9WnU7z7mJv7Hzum3SA2OJA2XG1d+rd36Zs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BJpkEmBTGtABjVaHBzB+u5PWOMtiEpWZKoKGu8EeS+/la1wEHNCz/SaV4QpBr5ELe
	 Ktzkp1ahxbWY6mIdQUsvih1Zeco/nj5HM43csN8v7FBwPh2tpnBLjIMahaEbwEVmyP
	 wMkTSeUqHYF1RrNb3dkl1laq1ulMv+ooCufsocK4qqautwNvMpg3CPDS8kQLA03cHT
	 DzImEux1NDyBJRAm8R+Mfjv8dPM6ySTCB4BozjpJeUpjMvkN1OJHYOyhpSmdeO/ZZ5
	 MBMRPC3yQJf8o7Zs5T41pR/dUW4FrrvN+HO2TvZa6QuMj9kmG05EzY4G9g/bfiF5kf
	 DHCnvlbPlaZug==
Date: Thu, 13 Feb 2025 16:14:41 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	Karolina Stolarek <karolina.stolarek@oracle.com>,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>
Subject: Re: [PATCH 0/4] PCI: pci_printk() removal (+ related cleanups)
Message-ID: <20250213221441.GA136775@bhelgaas>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216161012.1774-1-ilpo.jarvinen@linux.intel.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 16, 2024 at 06:10:08PM +0200, Ilpo Järvinen wrote:
> include/linux/pci.h provides pci_printk() which is a low-level
> interface with level that is only useful for AER due to error severity
> variations.
> 
> This series cleans up shpchp logging wrappers to avoid using low-level
> pci_printk() unnecessarily and replaces pci_printk() with aer_printk().
> 
> Ilpo Järvinen (4):
>   PCI: shpchp: Remove logging from module init/exit functions
>   PCI: shpchp: Change dbg() -> ctrl_dbg()

I applied the above to pci/hotplug for v6.15, thanks!

>   PCI: shpchp: Cleanup logging and debug wrappers
>   PCI: Descope pci_printk() to aer_printk()
> 
>  drivers/pci/hotplug/shpchp.h      | 18 +-----------------
>  drivers/pci/hotplug/shpchp_core.c | 13 +------------
>  drivers/pci/hotplug/shpchp_hpc.c  |  2 +-
>  drivers/pci/pcie/aer.c            | 10 +++++++---
>  include/linux/pci.h               |  3 ---
>  5 files changed, 10 insertions(+), 36 deletions(-)
> 
> -- 
> 2.39.5
> 


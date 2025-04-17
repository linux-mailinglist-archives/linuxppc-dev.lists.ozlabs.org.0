Return-Path: <linuxppc-dev+bounces-7724-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FA0A912C1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 07:39:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdRY16Hjqz300B;
	Thu, 17 Apr 2025 15:39:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744868373;
	cv=none; b=YhWMaNaDM9oTHl7eKGRhjo+Xu3d2kd7VWF4msEJOcWFgOKa79tTi/R82tXjsFQl4zzcRnr5jjqjb9SZ8OGJaLJmMbykHaHhOeZTYiWIJxTbY48viQbWQujtfCTVyIK7skuezoBWX6mlrytl1tnUWaY3QATPsLrGm+xjWyfPPe27JzcAiYm6PzjsydreSqffhPo4Xxfm3If2Jsq2530vMbBgd8Ge4oqq8Mhmq+QtoBk/H3gzUgZ2VjNcgYYFoYQM04TeMt34Wwv8CJKaTSxX/zH5w6tWfid0RN2z6B5MCJP2bymgcWnJdl4Okl3dImA5LimyF+i+cAvbOnFvcQsG8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744868373; c=relaxed/relaxed;
	bh=f5v426PMT/rcYy79308JbFGxzA66xRwLsnLNveGybTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ug9Re/QiLjykJitfVNKIyF3h8epIBYfxctSn+8DV1Vs8wfDjnQOPWVoY/HLzJbaF4msz7tbKCHm+eHSBWlR089THkGdQmUlVTntVzGaWK19U5ZqBQ59BqoE/HjgX1lTONyI4cEW+/2Jq/8l8me7TvnF09RSV+L37oWy16cujQ7EBhWObHpTSX1W7u6fk4LAMDiEGPtUfbF4K7B9LauG2xw4hJkAVkWWjqPrh0W0uc/VXB/wIUiVb/eP0IDC1Z9rvCYx3lmGdSn0tT2I/0Y1atP9mZBzWELozDw+L1EpheGYbQ9qOWFFsuQNNO+QtgZ1eFudFo7A/5DNrXIE4HKBn8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LdPYdmkn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=LdPYdmkn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdRY02qJbz2yx7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 15:39:31 +1000 (AEST)
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-736c3e7b390so278755b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 22:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744868368; x=1745473168; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=f5v426PMT/rcYy79308JbFGxzA66xRwLsnLNveGybTY=;
        b=LdPYdmknCbSkPhVJEW7I55iBttam+DW0EibJ0sjIaTrEyChDIlubw15+GL0krPssvh
         ZF9QUq0lgJi8CldadEFg45Ji3xzU0zZ1LErdbaF9tBYSFGaMo/Ddv3pklsZBltoD1nNK
         NchbWtOSYnaugWpS5U92gdgvkwbwU3Oq/yHASv+4h9uVSIqUoeokiNAo2sYJ8jWW61b4
         6PaYhkPa181TgY209IoUQj1t/s1iiA04hEw4Lru8fVLrF8j2+xubUTLpJyPy6iQcRBHB
         ZTsCyYJwVYk952WS9lSkOSDHxOpU5Yjfs9pyrzZmASHjIWpL3BHSBZD3ujmEAvuNtlLw
         jz3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744868368; x=1745473168;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f5v426PMT/rcYy79308JbFGxzA66xRwLsnLNveGybTY=;
        b=nCQ5B5fyF+MZbfosKkL5rATmuw3pZysFjZPU8qwiBkw9Ffmea6E4XPNKCljwpaAAud
         YfGQ4JLiIXACF5QF1SMk0ekdFlHW2kpA9aCgjFz1lGmCcrEsRQjBaxJJahWvj5X6sVug
         A/Aq/6NF6Wvp8tBZhLOgW0DnL09lG7qEO8KiB5BtvXrd9Fow59QB/ztUJm06c3T979yH
         iqUVyzjabsDGbC/m0maaOSEwbYi1CirA/RaoYSCH4hJBXAS4LcL3UAhpLGhKHDYzFsf8
         qLwgovGYm3gkiUWkGmFqS60zEpTuJScGHuy0lszQQAiQpAiGyuZUbRaQSBCcJUwwAk6W
         5kAQ==
X-Forwarded-Encrypted: i=1; AJvYcCXk/tUmlze6XPTJCtTYMgTHz0PU6W8oqCgkyx9iFcpR5NoHaHRVkHG26456OfRwqg/tRabVshyNQ1ZpR3c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyKLoOGqDO+5+AA/V9Bn6LOq/xo50XGQwG+KzpzdrtFZJlwEbgw
	BVguMkJNwgac+JzldwDfKMLV57+jvkcNR6RFd+p2g06S8gOAYkwx8TwDbnXIBw==
X-Gm-Gg: ASbGncurcamqmP1z/kJsXP/PfkMsASdsAedQzsoRzP4uwGUyFLA4eyV37bp8dfjVAaT
	jepz0r+qyCFMmnmjnjMJ+2Bll0X3/wbTVOosnQibYe+GRQQIaZchhFf48IIzpUEddK3kM9P0Q37
	S5HFHx0MewolRfKdwFtlsA9O5v5BZL7Kd9wj+hj8s+rW7MCI02gVc8mwh6xL4BrJcR6hKnIoor5
	ufluiq48qtgW5gA+0TT3G7EqPlHlGIodZOxgxEr4/+jYlGD42TBxaz527ohNbgNPlTC0ToTZ81O
	OrVH6Wtf9PRPjBbSyZrrBfiZ5Zgrw9dhKev3R/mwhi9UHRur
X-Google-Smtp-Source: AGHT+IEndgfa94YN7BMZh5STCpP7wGFsaSVlAG8SMJDtj+c3nxd5AzXnq+goeqg6hGMJKi6M/Nlsaw==
X-Received: by 2002:a05:6a20:ce48:b0:1f5:862b:a583 with SMTP id adf61e73a8af0-203b3fbe8ffmr7026509637.34.1744868368169;
        Wed, 16 Apr 2025 22:39:28 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220a988bsm2235387a12.14.2025.04.16.22.39.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 22:39:27 -0700 (PDT)
Date: Thu, 17 Apr 2025 11:09:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] PCI/ERR: Add support for resetting the slot in a
 platforms specific way
Message-ID: <jb4iq364iqwk3swux5cjiczyvdyrkjtqjclefyfjrntepvroyn@7vbvbzu3pd3p>
References: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
 <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
 <Z--cY5Uf6JyTYL9y@wunner.de>
 <3dokyirkf47lqxgx5k2ybij5b5an6qnceifsub3mcmjvzp3kdb@sm7f2jxxepdc>
 <Z__AyQeZmXiNwT7c@wunner.de>
 <rrqn7hlefn7klaczi2jkfta72pwmtentj3zp37yvw3brwpnalk@3eapwfeo5y4d>
 <aABJ_u8-FXeJoPyF@wunner.de>
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
In-Reply-To: <aABJ_u8-FXeJoPyF@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 17, 2025 at 02:23:26AM +0200, Lukas Wunner wrote:
> On Wed, Apr 16, 2025 at 08:34:21PM +0530, Manivannan Sadhasivam wrote:
> > I don't think it is possible to get rid of the powerpc version. It has
> > its own pci_dev::sysdata pointing to 'struct pci_controller' pointer
> > which is internal to powerpc arch code. And the generic code would need
> > 'struct pci_host_bridge' to access the callback.
> 
> Below is my proposal to convert powerpc to the new ->slot_reset() callback.
> Compile-tested only.
> 
> Feel free to include this in your series, alternatively I can submit it
> to powerpc maintainers once your series has landed.  Thanks!
> 
> -- >8 --
> 
> From: Lukas Wunner <lukas@wunner.de>
> Subject: [PATCH] powerpc/powernv/pci: Migrate to pci_host_bridge::reset_slot
>  callback
> 
> struct pci_host_bridge has just been amended with a ->reset_slot()
> callback to allow for a per-host-bridge Secondary Bus Reset procedure.
> 
> PowerNV needs a platform-specific reset procedure and has historically
> implemented it by overriding pcibios_reset_secondary_bus().
> 
> Migrate PowerNV to the new ->reset_slot() callback for simplicity and
> cleanliness.  Assign the callback as soon as the pci_host_bridge is
> allocated through the following call chain:
> 
> pcibios_init()
>   pcibios_scan_phb()
>     pci_create_root_bus()
>       pci_register_host_bridge()
>         pcibios_root_bridge_prepare()
> 
> The powerpc-specific implementation of pcibios_reset_secondary_bus() can
> thus be deleted and the remaining default implementation in the PCI core
> can be made private.  The ->reset_secondary_bus() callback in struct
> pci_controller_ops likewise becomes obsolete and can be deleted.
> 

Looks good to me, thanks! I think it would be better if it is submitted once my
series has landed in mainline (just to avoid immutable branch hassle between
powerpc and PCI trees).

- Mani

> Signed-off-by: Lukas Wunner <lukas@wunner.de>
> ---
>  arch/powerpc/include/asm/pci-bridge.h        |  1 -
>  arch/powerpc/kernel/pci-common.c             | 12 ------------
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 14 +++++++++-----
>  arch/powerpc/platforms/powernv/pci-ioda.c    |  9 +++++++--
>  arch/powerpc/platforms/powernv/pci.h         |  3 ++-
>  drivers/pci/pci.c                            |  2 +-
>  include/linux/pci.h                          |  1 -
>  7 files changed, 19 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
> index 2aa3a091ef20..0de09fc90641 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -36,7 +36,6 @@ struct pci_controller_ops {
>  					    unsigned long type);
>  	void		(*setup_bridge)(struct pci_bus *bus,
>  					unsigned long type);
> -	void		(*reset_secondary_bus)(struct pci_dev *pdev);
>  
>  #ifdef CONFIG_PCI_MSI
>  	int		(*setup_msi_irqs)(struct pci_dev *pdev,
> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
> index eac84d687b53..dad15fbec4e0 100644
> --- a/arch/powerpc/kernel/pci-common.c
> +++ b/arch/powerpc/kernel/pci-common.c
> @@ -233,18 +233,6 @@ void pcibios_setup_bridge(struct pci_bus *bus, unsigned long type)
>  		hose->controller_ops.setup_bridge(bus, type);
>  }
>  
> -void pcibios_reset_secondary_bus(struct pci_dev *dev)
> -{
> -	struct pci_controller *phb = pci_bus_to_host(dev->bus);
> -
> -	if (phb->controller_ops.reset_secondary_bus) {
> -		phb->controller_ops.reset_secondary_bus(dev);
> -		return;
> -	}
> -
> -	pci_reset_secondary_bus(dev);
> -}
> -
>  resource_size_t pcibios_default_alignment(void)
>  {
>  	if (ppc_md.pcibios_default_alignment)
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index db3370d1673c..9b9517cb6ab7 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -890,18 +890,22 @@ static int pnv_eeh_bridge_reset(struct pci_dev *pdev, int option)
>  	return (rc == OPAL_SUCCESS) ? 0 : -EIO;
>  }
>  
> -void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
> +int pnv_pci_reset_secondary_bus(struct pci_host_bridge *host,
> +				struct pci_dev *dev)
>  {
>  	struct pci_controller *hose;
> +	int rc_hot, rc_dea;
>  
>  	if (pci_is_root_bus(dev->bus)) {
>  		hose = pci_bus_to_host(dev->bus);
> -		pnv_eeh_root_reset(hose, EEH_RESET_HOT);
> -		pnv_eeh_root_reset(hose, EEH_RESET_DEACTIVATE);
> +		rc_hot = pnv_eeh_root_reset(hose, EEH_RESET_HOT);
> +		rc_dea = pnv_eeh_root_reset(hose, EEH_RESET_DEACTIVATE);
>  	} else {
> -		pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
> -		pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
> +		rc_hot = pnv_eeh_bridge_reset(dev, EEH_RESET_HOT);
> +		rc_dea = pnv_eeh_bridge_reset(dev, EEH_RESET_DEACTIVATE);
>  	}
> +
> +	return rc_hot ? : rc_dea ? : 0;
>  }
>  
>  static void pnv_eeh_wait_for_pending(struct pci_dn *pdn, const char *type,
> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
> index ae4b549b5ca0..e1b75a4bc681 100644
> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
> @@ -2145,6 +2145,12 @@ static void pnv_pci_ioda_fixup(void)
>  #endif
>  }
>  
> +static int pnv_pci_root_bridge_prepare(struct pci_host_bridge *bridge)
> +{
> +	bridge->reset_slot = pnv_pci_reset_secondary_bus;
> +	return 0;
> +}
> +
>  /*
>   * Returns the alignment for I/O or memory windows for P2P
>   * bridges. That actually depends on how PEs are segmented.
> @@ -2504,7 +2510,6 @@ static const struct pci_controller_ops pnv_pci_ioda_controller_ops = {
>  	.release_device		= pnv_pci_release_device,
>  	.window_alignment	= pnv_pci_window_alignment,
>  	.setup_bridge		= pnv_pci_fixup_bridge_resources,
> -	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
>  	.shutdown		= pnv_pci_ioda_shutdown,
>  #ifdef CONFIG_IOMMU_API
>  	.device_group		= pnv_pci_device_group,
> @@ -2515,7 +2520,6 @@ static const struct pci_controller_ops pnv_npu_ocapi_ioda_controller_ops = {
>  	.enable_device_hook	= pnv_ocapi_enable_device_hook,
>  	.release_device		= pnv_pci_release_device,
>  	.window_alignment	= pnv_pci_window_alignment,
> -	.reset_secondary_bus	= pnv_pci_reset_secondary_bus,
>  	.shutdown		= pnv_pci_ioda_shutdown,
>  };
>  
> @@ -2724,6 +2728,7 @@ static void __init pnv_pci_init_ioda_phb(struct device_node *np,
>  	}
>  
>  	ppc_md.pcibios_default_alignment = pnv_pci_default_alignment;
> +	ppc_md.pcibios_root_bridge_prepare = pnv_pci_root_bridge_prepare;
>  
>  #ifdef CONFIG_PCI_IOV
>  	ppc_md.pcibios_fixup_sriov = pnv_pci_ioda_fixup_iov;
> diff --git a/arch/powerpc/platforms/powernv/pci.h b/arch/powerpc/platforms/powernv/pci.h
> index 42075501663b..44e8969c7729 100644
> --- a/arch/powerpc/platforms/powernv/pci.h
> +++ b/arch/powerpc/platforms/powernv/pci.h
> @@ -275,7 +275,8 @@ extern struct iommu_table *pnv_pci_table_alloc(int nid);
>  
>  extern void pnv_pci_init_ioda2_phb(struct device_node *np);
>  extern void pnv_pci_init_npu2_opencapi_phb(struct device_node *np);
> -extern void pnv_pci_reset_secondary_bus(struct pci_dev *dev);
> +extern int pnv_pci_reset_secondary_bus(struct pci_host_bridge *host,
> +				       struct pci_dev *dev);
>  extern int pnv_eeh_phb_reset(struct pci_controller *hose, int option);
>  
>  extern struct pnv_ioda_pe *pnv_pci_bdfn_to_pe(struct pnv_phb *phb, u16 bdfn);
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 13709bb898a9..fe66d69c6429 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -4980,7 +4980,7 @@ void pci_reset_secondary_bus(struct pci_dev *dev)
>  	pci_write_config_word(dev, PCI_BRIDGE_CONTROL, ctrl);
>  }
>  
> -void __weak pcibios_reset_secondary_bus(struct pci_dev *dev)
> +static void pcibios_reset_secondary_bus(struct pci_dev *dev)
>  {
>  	struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>  	int ret;
> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 76e977af2d52..43d952361e84 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1398,7 +1398,6 @@ int pci_probe_reset_slot(struct pci_slot *slot);
>  int pci_probe_reset_bus(struct pci_bus *bus);
>  int pci_reset_bus(struct pci_dev *dev);
>  void pci_reset_secondary_bus(struct pci_dev *dev);
> -void pcibios_reset_secondary_bus(struct pci_dev *dev);
>  void pci_update_resource(struct pci_dev *dev, int resno);
>  int __must_check pci_assign_resource(struct pci_dev *dev, int i);
>  void pci_release_resource(struct pci_dev *dev, int resno);
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்


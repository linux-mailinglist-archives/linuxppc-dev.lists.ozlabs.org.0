Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52356105F57
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 05:54:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K3xW6bN6zDr7H
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 15:54:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="vTxsmrpB"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K3vj68LczDr5h
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 15:52:49 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id z188so2773098pgb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 20:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ZQUWrE5dLjjqpFvOU7DR6yky6eyZCo2GfAh+IZ6JCWo=;
 b=vTxsmrpBhxtWTLbDsP/z7QFEwbCEC/UXhRDWGJmwxo0GQ8Mg6z24a1PFVon6/gjYrX
 osoYSHk1v/u/jHsB7P+zlWNrfYBh+DZxq79Rt2O2pl9zfKuRVGPKkC5l5QFdUlY0PdiU
 c0fLHWZWWWUDkaGZ9NbHoZvycxnAVD+OsaqcKrMbzN0QlniMMKU2hlTWKf3skzhfpNfc
 pIssdkNwKagUI3QD/yZsAH/Q/aCuo1IutU7Mir/wCpSRI0wqKab8syWTERbabBsSH0hU
 /OJPNdJsdKhLxDxtX6FOPFf0ZoO+bKecXJW66R0DOddBiRbF84FTCNl7aNTIrxprEgHY
 XdQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=ZQUWrE5dLjjqpFvOU7DR6yky6eyZCo2GfAh+IZ6JCWo=;
 b=Z8Yq3HfnmuiAwl1NVT5MQFFDVTC+afPM9ZrCVeciu6DdbOX5jcGX58/hUTE5KAk9Cx
 RdFRFgBQl4epMktr3XthjIjPa3daqoLmhqoX0MntHxY7mmpwqQYT7EAiIcv/7nS0CeL2
 Aq/znv/npGdE/Q9BbM8tvBv0iV2rcTmz3ZoFWvXk9hiMQq6x/+2uBLYpq1IxSlnqxMeS
 VV8Pn93SU3BIBRmG2UgmCIbIpOgwIpKZy912rVGsRPTMPW2mdtv9aQogwvb6i9dGnMY1
 Qnl2537kyrQFKtHQzA/D8C0An8MM5lzdaM/N7477e6suuRZxRM81maPr8lNHGGp44qS2
 qWAQ==
X-Gm-Message-State: APjAAAUciO/85tW6pkn+EwZODCLKsCaKGdomOJq3bn/zo+jD4crtFWOH
 lPJQQiY6kcXGkuIbvbiU7/teqA==
X-Google-Smtp-Source: APXvYqz+zhJhfG2lAUoW9wkX9UxMoygzjqEi3xjlv23p3u8uTBtFf84JtGu/FhUiz5SCpOK5FUskOg==
X-Received: by 2002:a65:41cd:: with SMTP id b13mr13820687pgq.385.1574398366323; 
 Thu, 21 Nov 2019 20:52:46 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id k66sm4756250pgk.16.2019.11.21.20.52.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 20:52:45 -0800 (PST)
Subject: Re: [Very RFC 09/46] powerpc/eeh: Pass eeh_dev to
 eeh_ops->{read|write}_config()
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-10-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <313d8523-d03c-36db-f536-006b0e1b4896@ozlabs.ru>
Date: Fri, 22 Nov 2019 15:52:42 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120012859.23300-10-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: alistair@popple.id.au, s.miroshnichenko@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/11/2019 12:28, Oliver O'Halloran wrote:
> Switch the eeh_ops->{read|write}_config methods to take an eeh_dev structure
> rather than a pci_dn structure to specify the target device. This removes a
> lot of the uses of pci_dn in both the EEH core and in the platform EEH
> support.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>



Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>


09/46, 10/46 and 11/46 can be actually merged into one patch. Oh, well,
may half of 11/46 without s/pdn->phb/edev->controller/.



> ---
>  arch/powerpc/include/asm/eeh.h               |  4 +-
>  arch/powerpc/kernel/eeh.c                    | 22 +++++-----
>  arch/powerpc/kernel/eeh_pe.c                 | 44 ++++++++++----------
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 43 ++++++++++---------
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 16 ++++---
>  5 files changed, 67 insertions(+), 62 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index e11deb284631..62c4ee44ad2c 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -224,8 +224,8 @@ struct eeh_ops {
>  	int (*configure_bridge)(struct eeh_pe *pe);
>  	int (*err_inject)(struct eeh_pe *pe, int type, int func,
>  			  unsigned long addr, unsigned long mask);
> -	int (*read_config)(struct pci_dn *pdn, int where, int size, u32 *val);
> -	int (*write_config)(struct pci_dn *pdn, int where, int size, u32 val);
> +	int (*read_config)(struct eeh_dev *edev, int where, int size, u32 *val);
> +	int (*write_config)(struct eeh_dev *edev, int where, int size, u32 val);
>  	int (*next_error)(struct eeh_pe **pe);
>  	int (*restore_config)(struct pci_dn *pdn);
>  	int (*notify_resume)(struct pci_dn *pdn);
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index a3b93db972fc..7258fa04176d 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -185,21 +185,21 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
>  		pdn->phb->global_number, pdn->busno,
>  		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
>  
> -	eeh_ops->read_config(pdn, PCI_VENDOR_ID, 4, &cfg);
> +	eeh_ops->read_config(edev, PCI_VENDOR_ID, 4, &cfg);
>  	n += scnprintf(buf+n, len-n, "dev/vend:%08x\n", cfg);
>  	pr_warn("EEH: PCI device/vendor: %08x\n", cfg);
>  
> -	eeh_ops->read_config(pdn, PCI_COMMAND, 4, &cfg);
> +	eeh_ops->read_config(edev, PCI_COMMAND, 4, &cfg);
>  	n += scnprintf(buf+n, len-n, "cmd/stat:%x\n", cfg);
>  	pr_warn("EEH: PCI cmd/status register: %08x\n", cfg);
>  
>  	/* Gather bridge-specific registers */
>  	if (edev->mode & EEH_DEV_BRIDGE) {
> -		eeh_ops->read_config(pdn, PCI_SEC_STATUS, 2, &cfg);
> +		eeh_ops->read_config(edev, PCI_SEC_STATUS, 2, &cfg);
>  		n += scnprintf(buf+n, len-n, "sec stat:%x\n", cfg);
>  		pr_warn("EEH: Bridge secondary status: %04x\n", cfg);
>  
> -		eeh_ops->read_config(pdn, PCI_BRIDGE_CONTROL, 2, &cfg);
> +		eeh_ops->read_config(edev, PCI_BRIDGE_CONTROL, 2, &cfg);
>  		n += scnprintf(buf+n, len-n, "brdg ctl:%x\n", cfg);
>  		pr_warn("EEH: Bridge control: %04x\n", cfg);
>  	}
> @@ -207,11 +207,11 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
>  	/* Dump out the PCI-X command and status regs */
>  	cap = edev->pcix_cap;
>  	if (cap) {
> -		eeh_ops->read_config(pdn, cap, 4, &cfg);
> +		eeh_ops->read_config(edev, cap, 4, &cfg);
>  		n += scnprintf(buf+n, len-n, "pcix-cmd:%x\n", cfg);
>  		pr_warn("EEH: PCI-X cmd: %08x\n", cfg);
>  
> -		eeh_ops->read_config(pdn, cap+4, 4, &cfg);
> +		eeh_ops->read_config(edev, cap+4, 4, &cfg);
>  		n += scnprintf(buf+n, len-n, "pcix-stat:%x\n", cfg);
>  		pr_warn("EEH: PCI-X status: %08x\n", cfg);
>  	}
> @@ -223,7 +223,7 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
>  		pr_warn("EEH: PCI-E capabilities and status follow:\n");
>  
>  		for (i=0; i<=8; i++) {
> -			eeh_ops->read_config(pdn, cap+4*i, 4, &cfg);
> +			eeh_ops->read_config(edev, cap+4*i, 4, &cfg);
>  			n += scnprintf(buf+n, len-n, "%02x:%x\n", 4*i, cfg);
>  
>  			if ((i % 4) == 0) {
> @@ -250,7 +250,7 @@ static size_t eeh_dump_dev_log(struct eeh_dev *edev, char *buf, size_t len)
>  		pr_warn("EEH: PCI-E AER capability register set follows:\n");
>  
>  		for (i=0; i<=13; i++) {
> -			eeh_ops->read_config(pdn, cap+4*i, 4, &cfg);
> +			eeh_ops->read_config(edev, cap+4*i, 4, &cfg);
>  			n += scnprintf(buf+n, len-n, "%02x:%x\n", 4*i, cfg);
>  
>  			if ((i % 4) == 0) {
> @@ -918,15 +918,13 @@ int eeh_pe_reset_full(struct eeh_pe *pe, bool include_passed)
>   */
>  void eeh_save_bars(struct eeh_dev *edev)
>  {
> -	struct pci_dn *pdn;
>  	int i;
>  
> -	pdn = eeh_dev_to_pdn(edev);
> -	if (!pdn)
> +	if (!edev)
>  		return;
>  
>  	for (i = 0; i < 16; i++)
> -		eeh_ops->read_config(pdn, i * 4, 4, &edev->config_space[i]);
> +		eeh_ops->read_config(edev, i * 4, 4, &edev->config_space[i]);
>  
>  	/*
>  	 * For PCI bridges including root port, we need enable bus
> diff --git a/arch/powerpc/kernel/eeh_pe.c b/arch/powerpc/kernel/eeh_pe.c
> index 177852e39a25..e11e0830f125 100644
> --- a/arch/powerpc/kernel/eeh_pe.c
> +++ b/arch/powerpc/kernel/eeh_pe.c
> @@ -714,32 +714,32 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
>  
>  	/* Check slot status */
>  	cap = edev->pcie_cap;
> -	eeh_ops->read_config(pdn, cap + PCI_EXP_SLTSTA, 2, &val);
> +	eeh_ops->read_config(edev, cap + PCI_EXP_SLTSTA, 2, &val);
>  	if (!(val & PCI_EXP_SLTSTA_PDS)) {
>  		eeh_edev_dbg(edev, "No card in the slot (0x%04x) !\n", val);
>  		return;
>  	}
>  
>  	/* Check power status if we have the capability */
> -	eeh_ops->read_config(pdn, cap + PCI_EXP_SLTCAP, 2, &val);
> +	eeh_ops->read_config(edev, cap + PCI_EXP_SLTCAP, 2, &val);
>  	if (val & PCI_EXP_SLTCAP_PCP) {
> -		eeh_ops->read_config(pdn, cap + PCI_EXP_SLTCTL, 2, &val);
> +		eeh_ops->read_config(edev, cap + PCI_EXP_SLTCTL, 2, &val);
>  		if (val & PCI_EXP_SLTCTL_PCC) {
>  			eeh_edev_dbg(edev, "In power-off state, power it on ...\n");
>  			val &= ~(PCI_EXP_SLTCTL_PCC | PCI_EXP_SLTCTL_PIC);
>  			val |= (0x0100 & PCI_EXP_SLTCTL_PIC);
> -			eeh_ops->write_config(pdn, cap + PCI_EXP_SLTCTL, 2, val);
> +			eeh_ops->write_config(edev, cap + PCI_EXP_SLTCTL, 2, val);
>  			msleep(2 * 1000);
>  		}
>  	}
>  
>  	/* Enable link */
> -	eeh_ops->read_config(pdn, cap + PCI_EXP_LNKCTL, 2, &val);
> +	eeh_ops->read_config(edev, cap + PCI_EXP_LNKCTL, 2, &val);
>  	val &= ~PCI_EXP_LNKCTL_LD;
> -	eeh_ops->write_config(pdn, cap + PCI_EXP_LNKCTL, 2, val);
> +	eeh_ops->write_config(edev, cap + PCI_EXP_LNKCTL, 2, val);
>  
>  	/* Check link */
> -	eeh_ops->read_config(pdn, cap + PCI_EXP_LNKCAP, 4, &val);
> +	eeh_ops->read_config(edev, cap + PCI_EXP_LNKCAP, 4, &val);
>  	if (!(val & PCI_EXP_LNKCAP_DLLLARC)) {
>  		eeh_edev_dbg(edev, "No link reporting capability (0x%08x) \n", val);
>  		msleep(1000);
> @@ -752,7 +752,7 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
>  		msleep(20);
>  		timeout += 20;
>  
> -		eeh_ops->read_config(pdn, cap + PCI_EXP_LNKSTA, 2, &val);
> +		eeh_ops->read_config(edev, cap + PCI_EXP_LNKSTA, 2, &val);
>  		if (val & PCI_EXP_LNKSTA_DLLLA)
>  			break;
>  	}
> @@ -769,7 +769,6 @@ static void eeh_bridge_check_link(struct eeh_dev *edev)
>  
>  static void eeh_restore_bridge_bars(struct eeh_dev *edev)
>  {
> -	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
>  	int i;
>  
>  	/*
> @@ -777,20 +776,20 @@ static void eeh_restore_bridge_bars(struct eeh_dev *edev)
>  	 * Bus numbers and windows: 0x18 - 0x30
>  	 */
>  	for (i = 4; i < 13; i++)
> -		eeh_ops->write_config(pdn, i*4, 4, edev->config_space[i]);
> +		eeh_ops->write_config(edev, i*4, 4, edev->config_space[i]);
>  	/* Rom: 0x38 */
> -	eeh_ops->write_config(pdn, 14*4, 4, edev->config_space[14]);
> +	eeh_ops->write_config(edev, 14*4, 4, edev->config_space[14]);
>  
>  	/* Cache line & Latency timer: 0xC 0xD */
> -	eeh_ops->write_config(pdn, PCI_CACHE_LINE_SIZE, 1,
> +	eeh_ops->write_config(edev, PCI_CACHE_LINE_SIZE, 1,
>                  SAVED_BYTE(PCI_CACHE_LINE_SIZE));
> -        eeh_ops->write_config(pdn, PCI_LATENCY_TIMER, 1,
> +        eeh_ops->write_config(edev, PCI_LATENCY_TIMER, 1,
>                  SAVED_BYTE(PCI_LATENCY_TIMER));
>  	/* Max latency, min grant, interrupt ping and line: 0x3C */
> -	eeh_ops->write_config(pdn, 15*4, 4, edev->config_space[15]);
> +	eeh_ops->write_config(edev, 15*4, 4, edev->config_space[15]);
>  
>  	/* PCI Command: 0x4 */
> -	eeh_ops->write_config(pdn, PCI_COMMAND, 4, edev->config_space[1] |
> +	eeh_ops->write_config(edev, PCI_COMMAND, 4, edev->config_space[1] |
>  			      PCI_COMMAND_MEMORY | PCI_COMMAND_MASTER);
>  
>  	/* Check the PCIe link is ready */
> @@ -799,28 +798,27 @@ static void eeh_restore_bridge_bars(struct eeh_dev *edev)
>  
>  static void eeh_restore_device_bars(struct eeh_dev *edev)
>  {
> -	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
>  	int i;
>  	u32 cmd;
>  
>  	for (i = 4; i < 10; i++)
> -		eeh_ops->write_config(pdn, i*4, 4, edev->config_space[i]);
> +		eeh_ops->write_config(edev, i*4, 4, edev->config_space[i]);
>  	/* 12 == Expansion ROM Address */
> -	eeh_ops->write_config(pdn, 12*4, 4, edev->config_space[12]);
> +	eeh_ops->write_config(edev, 12*4, 4, edev->config_space[12]);
>  
> -	eeh_ops->write_config(pdn, PCI_CACHE_LINE_SIZE, 1,
> +	eeh_ops->write_config(edev, PCI_CACHE_LINE_SIZE, 1,
>  		SAVED_BYTE(PCI_CACHE_LINE_SIZE));
> -	eeh_ops->write_config(pdn, PCI_LATENCY_TIMER, 1,
> +	eeh_ops->write_config(edev, PCI_LATENCY_TIMER, 1,
>  		SAVED_BYTE(PCI_LATENCY_TIMER));
>  
>  	/* max latency, min grant, interrupt pin and line */
> -	eeh_ops->write_config(pdn, 15*4, 4, edev->config_space[15]);
> +	eeh_ops->write_config(edev, 15*4, 4, edev->config_space[15]);
>  
>  	/*
>  	 * Restore PERR & SERR bits, some devices require it,
>  	 * don't touch the other command bits
>  	 */
> -	eeh_ops->read_config(pdn, PCI_COMMAND, 4, &cmd);
> +	eeh_ops->read_config(edev, PCI_COMMAND, 4, &cmd);
>  	if (edev->config_space[1] & PCI_COMMAND_PARITY)
>  		cmd |= PCI_COMMAND_PARITY;
>  	else
> @@ -829,7 +827,7 @@ static void eeh_restore_device_bars(struct eeh_dev *edev)
>  		cmd |= PCI_COMMAND_SERR;
>  	else
>  		cmd &= ~PCI_COMMAND_SERR;
> -	eeh_ops->write_config(pdn, PCI_COMMAND, 4, cmd);
> +	eeh_ops->write_config(edev, PCI_COMMAND, 4, cmd);
>  }
>  
>  /**
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index b2ac4130fda7..54d8ec77aef2 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -858,32 +858,32 @@ static int __pnv_eeh_bridge_reset(struct pci_dev *dev, int option)
>  	case EEH_RESET_HOT:
>  		/* Don't report linkDown event */
>  		if (aer) {
> -			eeh_ops->read_config(pdn, aer + PCI_ERR_UNCOR_MASK,
> +			eeh_ops->read_config(edev, aer + PCI_ERR_UNCOR_MASK,
>  					     4, &ctrl);
>  			ctrl |= PCI_ERR_UNC_SURPDN;
> -			eeh_ops->write_config(pdn, aer + PCI_ERR_UNCOR_MASK,
> +			eeh_ops->write_config(edev, aer + PCI_ERR_UNCOR_MASK,
>  					      4, ctrl);
>  		}
>  
> -		eeh_ops->read_config(pdn, PCI_BRIDGE_CONTROL, 2, &ctrl);
> +		eeh_ops->read_config(edev, PCI_BRIDGE_CONTROL, 2, &ctrl);
>  		ctrl |= PCI_BRIDGE_CTL_BUS_RESET;
> -		eeh_ops->write_config(pdn, PCI_BRIDGE_CONTROL, 2, ctrl);
> +		eeh_ops->write_config(edev, PCI_BRIDGE_CONTROL, 2, ctrl);
>  
>  		msleep(EEH_PE_RST_HOLD_TIME);
>  		break;
>  	case EEH_RESET_DEACTIVATE:
> -		eeh_ops->read_config(pdn, PCI_BRIDGE_CONTROL, 2, &ctrl);
> +		eeh_ops->read_config(edev, PCI_BRIDGE_CONTROL, 2, &ctrl);
>  		ctrl &= ~PCI_BRIDGE_CTL_BUS_RESET;
> -		eeh_ops->write_config(pdn, PCI_BRIDGE_CONTROL, 2, ctrl);
> +		eeh_ops->write_config(edev, PCI_BRIDGE_CONTROL, 2, ctrl);
>  
>  		msleep(EEH_PE_RST_SETTLE_TIME);
>  
>  		/* Continue reporting linkDown event */
>  		if (aer) {
> -			eeh_ops->read_config(pdn, aer + PCI_ERR_UNCOR_MASK,
> +			eeh_ops->read_config(edev, aer + PCI_ERR_UNCOR_MASK,
>  					     4, &ctrl);
>  			ctrl &= ~PCI_ERR_UNC_SURPDN;
> -			eeh_ops->write_config(pdn, aer + PCI_ERR_UNCOR_MASK,
> +			eeh_ops->write_config(edev, aer + PCI_ERR_UNCOR_MASK,
>  					      4, ctrl);
>  		}
>  
> @@ -952,11 +952,12 @@ void pnv_pci_reset_secondary_bus(struct pci_dev *dev)
>  static void pnv_eeh_wait_for_pending(struct pci_dn *pdn, const char *type,
>  				     int pos, u16 mask)
>  {
> +	struct eeh_dev *edev = pdn->edev;
>  	int i, status = 0;
>  
>  	/* Wait for Transaction Pending bit to be cleared */
>  	for (i = 0; i < 4; i++) {
> -		eeh_ops->read_config(pdn, pos, 2, &status);
> +		eeh_ops->read_config(edev, pos, 2, &status);
>  		if (!(status & mask))
>  			return;
>  
> @@ -977,7 +978,7 @@ static int pnv_eeh_do_flr(struct pci_dn *pdn, int option)
>  	if (WARN_ON(!edev->pcie_cap))
>  		return -ENOTTY;
>  
> -	eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCAP, 4, &reg);
> +	eeh_ops->read_config(edev, edev->pcie_cap + PCI_EXP_DEVCAP, 4, &reg);
>  	if (!(reg & PCI_EXP_DEVCAP_FLR))
>  		return -ENOTTY;
>  
> @@ -987,18 +988,18 @@ static int pnv_eeh_do_flr(struct pci_dn *pdn, int option)
>  		pnv_eeh_wait_for_pending(pdn, "",
>  					 edev->pcie_cap + PCI_EXP_DEVSTA,
>  					 PCI_EXP_DEVSTA_TRPND);
> -		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
> +		eeh_ops->read_config(edev, edev->pcie_cap + PCI_EXP_DEVCTL,
>  				     4, &reg);
>  		reg |= PCI_EXP_DEVCTL_BCR_FLR;
> -		eeh_ops->write_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
> +		eeh_ops->write_config(edev, edev->pcie_cap + PCI_EXP_DEVCTL,
>  				      4, reg);
>  		msleep(EEH_PE_RST_HOLD_TIME);
>  		break;
>  	case EEH_RESET_DEACTIVATE:
> -		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
> +		eeh_ops->read_config(edev, edev->pcie_cap + PCI_EXP_DEVCTL,
>  				     4, &reg);
>  		reg &= ~PCI_EXP_DEVCTL_BCR_FLR;
> -		eeh_ops->write_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
> +		eeh_ops->write_config(edev, edev->pcie_cap + PCI_EXP_DEVCTL,
>  				      4, reg);
>  		msleep(EEH_PE_RST_SETTLE_TIME);
>  		break;
> @@ -1015,7 +1016,7 @@ static int pnv_eeh_do_af_flr(struct pci_dn *pdn, int option)
>  	if (WARN_ON(!edev->af_cap))
>  		return -ENOTTY;
>  
> -	eeh_ops->read_config(pdn, edev->af_cap + PCI_AF_CAP, 1, &cap);
> +	eeh_ops->read_config(edev, edev->af_cap + PCI_AF_CAP, 1, &cap);
>  	if (!(cap & PCI_AF_CAP_TP) || !(cap & PCI_AF_CAP_FLR))
>  		return -ENOTTY;
>  
> @@ -1030,12 +1031,12 @@ static int pnv_eeh_do_af_flr(struct pci_dn *pdn, int option)
>  		pnv_eeh_wait_for_pending(pdn, "AF",
>  					 edev->af_cap + PCI_AF_CTRL,
>  					 PCI_AF_STATUS_TP << 8);
> -		eeh_ops->write_config(pdn, edev->af_cap + PCI_AF_CTRL,
> +		eeh_ops->write_config(edev, edev->af_cap + PCI_AF_CTRL,
>  				      1, PCI_AF_CTRL_FLR);
>  		msleep(EEH_PE_RST_HOLD_TIME);
>  		break;
>  	case EEH_RESET_DEACTIVATE:
> -		eeh_ops->write_config(pdn, edev->af_cap + PCI_AF_CTRL, 1, 0);
> +		eeh_ops->write_config(edev, edev->af_cap + PCI_AF_CTRL, 1, 0);
>  		msleep(EEH_PE_RST_SETTLE_TIME);
>  		break;
>  	}
> @@ -1269,9 +1270,11 @@ static inline bool pnv_eeh_cfg_blocked(struct pci_dn *pdn)
>  	return false;
>  }
>  
> -static int pnv_eeh_read_config(struct pci_dn *pdn,
> +static int pnv_eeh_read_config(struct eeh_dev *edev,
>  			       int where, int size, u32 *val)
>  {
> +	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> +
>  	if (!pdn)
>  		return PCIBIOS_DEVICE_NOT_FOUND;
>  
> @@ -1283,9 +1286,11 @@ static int pnv_eeh_read_config(struct pci_dn *pdn,
>  	return pnv_pci_cfg_read(pdn, where, size, val);
>  }
>  
> -static int pnv_eeh_write_config(struct pci_dn *pdn,
> +static int pnv_eeh_write_config(struct eeh_dev *edev,
>  				int where, int size, u32 val)
>  {
> +	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> +
>  	if (!pdn)
>  		return PCIBIOS_DEVICE_NOT_FOUND;
>  
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index fa704d7052ec..6f911a048339 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -631,29 +631,33 @@ static int pseries_eeh_configure_bridge(struct eeh_pe *pe)
>  
>  /**
>   * pseries_eeh_read_config - Read PCI config space
> - * @pdn: PCI device node
> - * @where: PCI address
> + * @edev: EEH device handle
> + * @where: PCI config space offset
>   * @size: size to read
>   * @val: return value
>   *
>   * Read config space from the speicifed device
>   */
> -static int pseries_eeh_read_config(struct pci_dn *pdn, int where, int size, u32 *val)
> +static int pseries_eeh_read_config(struct eeh_dev *edev, int where, int size, u32 *val)
>  {
> +	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> +
>  	return rtas_read_config(pdn, where, size, val);
>  }
>  
>  /**
>   * pseries_eeh_write_config - Write PCI config space
> - * @pdn: PCI device node
> - * @where: PCI address
> + * @edev: EEH device handle
> + * @where: PCI config space offset
>   * @size: size to write
>   * @val: value to be written
>   *
>   * Write config space to the specified device
>   */
> -static int pseries_eeh_write_config(struct pci_dn *pdn, int where, int size, u32 val)
> +static int pseries_eeh_write_config(struct eeh_dev *edev, int where, int size, u32 val)
>  {
> +	struct pci_dn *pdn = eeh_dev_to_pdn(edev);
> +
>  	return rtas_write_config(pdn, where, size, val);
>  }
>  
> 

-- 
Alexey

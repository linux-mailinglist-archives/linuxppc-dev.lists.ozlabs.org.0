Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FA3106067
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 06:47:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47K56P14ynzDqQ4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2019 16:47:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="yBby/goO"; 
 dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47K54F1y3TzDr7D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2019 16:45:16 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id f3so2577617pjg.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 21:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z7xgEfiNY8XTI3MPtsfha5EdoNRA8uZnRZMpznvy1oU=;
 b=yBby/goOWI/qjNbjMgTTDCpRjVUzlJHQSJ7mruS7PE+atoqiZFExSK8PgyQB9Q0EfI
 YAuJBl8u0XotIcHo+ovpX/HX1n0rN64m4JPj5dc43WHGsKeRK4sP4eySg1u4Jz55KfXL
 BvYAh1CCysxU8cgHTwz8ZiDcb0qXJLPaYgxFAg1i+oINNvYSZfUxWSJUW28ShoWesAtd
 DM1CIrs6to4gb+rZ7ANDZ0WcOuP6gqfLvAAALU4xO5ejN0j3PswbngAGHutNlO03IO69
 G1Orxh1H6kzfGMFx/ew9LmCDyVw6J5vcWx9baV6oIprqp1vJDMvzABl1NtdQYYLFLtdg
 lpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Z7xgEfiNY8XTI3MPtsfha5EdoNRA8uZnRZMpznvy1oU=;
 b=kd42QfizsesQhFevEHSkhK0qdxjHAQ1/AmlNyXoqVNkG0Z/GHDSCP16xIZLZKDHeqq
 4gooRv2PusF8tI1mIRTNQJnG4iDQyOL017oTneBi4gmh165CXgG3b2OSwWEkJ2JhHWnM
 pFTC+YD6AmAAjx3OQp8/LifP9pHVa3JhrdTKCX203KV1NFV7/19gq/bIGCW8yaENmh0o
 5tf5E6Newo00+Cb6s3vRQxqh72AI/SCDuxMGE9nQs4weiPwQJilhA+lFv0COHE70fZLP
 W/8X3yh5F8sF3pDbOZQQaDJzTZvi1qRdIySPdUcbhg2FeePAJrcyoErVEjeWMgV1RU48
 0q0w==
X-Gm-Message-State: APjAAAX/NyQ7PADpxD6hO/XmVUMirhXy645e2Z2aATWpJKQUUWXNLWtc
 GVY2EvfFecUG4dDyUVqPxz5SYA==
X-Google-Smtp-Source: APXvYqy8NcH8YQ0rOVpV/TYssBx2v4cMG3nd+CBiPkNFEnMnl4JsDqcvL69e3t/yImZz87yQn615uQ==
X-Received: by 2002:a17:902:9a02:: with SMTP id
 v2mr12531016plp.221.1574401511715; 
 Thu, 21 Nov 2019 21:45:11 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id c64sm5507345pfb.177.2019.11.21.21.45.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Nov 2019 21:45:10 -0800 (PST)
Subject: Re: [Very RFC 12/46] powerpc/eeh: Split eeh_probe into probe_pdn and
 probe_pdev
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-13-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <cd23b6ad-e17a-b5a4-75e2-612c8fc4647b@ozlabs.ru>
Date: Fri, 22 Nov 2019 16:45:07 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120012859.23300-13-oohall@gmail.com>
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
> The EEH core has a concept of "early probe" and "late probe." When the
> EEH_PROBE_MODE_DEVTREE flag is set (i.e pseries) we call the eeh_ops->probe()
> function in eeh_add_device_early() so the eeh_dev state is initialised based on
> the pci_dn. It's important to realise that this happens *long* before the PCI
> device has been probed and a pci_dev structure created. This is necessary due
> to a PAPR requirement that EEH be enabled before to OS starts interacting
> with the device.
> 
> The late probe is done in eeh_add_device_late() when the EEH_PROBE_MODE_DEV
> flag is set (i.e. PowerNV). The main difference is the late probe happens
> after the pci_dev has been created. As a result there is no actual dependency
> on a pci_dn in the late probe case. Splitting the single eeh_ops->probe()
> function into seperate functions allows us to simplify the late probe case
> since we have access to a pci_dev at that point. Having access to a pci_dev
> means that we can use the functions provided by the PCI core for finding
> capabilities, etc rather than doing it manually.
> 
> It also changes the prototype for the probe functions to be void. Currently
> they return a void *, but both implementations always return NULL so there's
> not much point to it.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/include/asm/eeh.h               |  3 +-
>  arch/powerpc/kernel/eeh.c                    |  6 ++--
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 29 ++++++--------------
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 13 ++++-----
>  4 files changed, 20 insertions(+), 31 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index 67847f8dfe71..466b0165fbcf 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -215,7 +215,8 @@ enum {
>  struct eeh_ops {
>  	char *name;
>  	int (*init)(void);
> -	void* (*probe)(struct pci_dn *pdn, void *data);
> +	void (*probe_pdn)(struct pci_dn *pdn);    /* used on pseries */
> +	void (*probe_pdev)(struct pci_dev *pdev); /* used on powernv */
>  	int (*set_option)(struct eeh_pe *pe, int option);
>  	int (*get_pe_addr)(struct eeh_pe *pe);
>  	int (*get_state)(struct eeh_pe *pe, int *delay);
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index c8039fdb23ba..087a98b42a8c 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1066,7 +1066,7 @@ void eeh_add_device_early(struct pci_dn *pdn)
>  	    (eeh_has_flag(EEH_PROBE_MODE_DEVTREE) && 0 == phb->buid))
>  		return;
>  
> -	eeh_ops->probe(pdn, NULL);
> +	eeh_ops->probe_pdn(pdn);
>  }
>  
>  /**
> @@ -1135,8 +1135,8 @@ void eeh_add_device_late(struct pci_dev *dev)


This guy is called directly from pseries and powernv so it feels like
you do not really need these probe/probe_pdev() as eeh_ops hooks and can
just call them directly.

eeh_add_device_early() is even simpler and only used for pseries (not
now but after 14/46), unless I missed something. Thanks,



>  		dev->dev.archdata.edev = NULL;
>  	}
>  
> -	if (eeh_has_flag(EEH_PROBE_MODE_DEV))
> -		eeh_ops->probe(pdn, NULL);
> +	if (eeh_ops->probe_pdev && eeh_has_flag(EEH_PROBE_MODE_DEV))
> +		eeh_ops->probe_pdev(dev);
>  
>  	edev->pdev = dev;
>  	dev->dev.archdata.edev = edev;
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index 6c5d9f1bc378..8bd5317aa878 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -346,23 +346,13 @@ static int pnv_eeh_find_ecap(struct pci_dn *pdn, int cap)
>  
>  /**
>   * pnv_eeh_probe - Do probe on PCI device
> - * @pdn: PCI device node
> - * @data: unused
> + * @pdev: pci_dev to probe
>   *
> - * When EEH module is installed during system boot, all PCI devices
> - * are checked one by one to see if it supports EEH. The function
> - * is introduced for the purpose. By default, EEH has been enabled
> - * on all PCI devices. That's to say, we only need do necessary
> - * initialization on the corresponding eeh device and create PE
> - * accordingly.
> - *
> - * It's notable that's unsafe to retrieve the EEH device through
> - * the corresponding PCI device. During the PCI device hotplug, which
> - * was possiblly triggered by EEH core, the binding between EEH device
> - * and the PCI device isn't built yet.
> + * Creates (or finds an existing) edev for this pci_dev.
>   */
> -static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
> +static void pnv_eeh_probe_pdev(struct pci_dev *pdev)
>  {
> +	struct pci_dn *pdn = pci_get_pdn(pdev);
>  	struct pci_controller *hose = pdn->phb;
>  	struct pnv_phb *phb = hose->private_data;
>  	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
> @@ -377,11 +367,11 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
>  	 * the probing.
>  	 */
>  	if (!edev || edev->pe)
> -		return NULL;
> +		return;
>  
>  	/* Skip for PCI-ISA bridge */
>  	if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
> -		return NULL;
> +		return;
>  
>  	eeh_edev_dbg(edev, "Probing device\n");
>  
> @@ -411,7 +401,7 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
>  	ret = eeh_add_to_parent_pe(edev);
>  	if (ret) {
>  		eeh_edev_warn(edev, "Failed to add device to PE (code %d)\n", ret);
> -		return NULL;
> +		return;
>  	}
>  
>  	/*
> @@ -469,8 +459,6 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
>  	eeh_save_bars(edev);
>  
>  	eeh_edev_dbg(edev, "EEH enabled on device\n");
> -
> -	return NULL;
>  }
>  
>  /**
> @@ -1673,7 +1661,8 @@ static int pnv_eeh_restore_config(struct eeh_dev *edev)
>  static struct eeh_ops pnv_eeh_ops = {
>  	.name                   = "powernv",
>  	.init                   = pnv_eeh_init,
> -	.probe			= pnv_eeh_probe,
> +	.probe_pdn		= NULL,
> +	.probe_pdev		= pnv_eeh_probe_pdev,
>  	.set_option             = pnv_eeh_set_option,
>  	.get_pe_addr            = pnv_eeh_get_pe_addr,
>  	.get_state              = pnv_eeh_get_state,
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 6f911a048339..3ac23c884f4e 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -229,7 +229,7 @@ static int pseries_eeh_find_ecap(struct pci_dn *pdn, int cap)
>   * are checked one by one to see if it supports EEH. The function
>   * is introduced for the purpose.
>   */
> -static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
> +static void pseries_eeh_probe_pdn(struct pci_dn *pdn)
>  {
>  	struct eeh_dev *edev;
>  	struct eeh_pe pe;
> @@ -240,15 +240,15 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
>  	/* Retrieve OF node and eeh device */
>  	edev = pdn_to_eeh_dev(pdn);
>  	if (!edev || edev->pe)
> -		return NULL;
> +		return;
>  
>  	/* Check class/vendor/device IDs */
>  	if (!pdn->vendor_id || !pdn->device_id || !pdn->class_code)
> -		return NULL;
> +		return;
>  
>  	/* Skip for PCI-ISA bridge */
>          if ((pdn->class_code >> 8) == PCI_CLASS_BRIDGE_ISA)
> -		return NULL;
> +		return;
>  
>  	eeh_edev_dbg(edev, "Probing device\n");
>  
> @@ -315,8 +315,6 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
>  
>  	/* Save memory bars */
>  	eeh_save_bars(edev);
> -
> -	return NULL;
>  }
>  
>  /**
> @@ -755,7 +753,8 @@ static int pseries_notify_resume(struct pci_dn *pdn)
>  static struct eeh_ops pseries_eeh_ops = {
>  	.name			= "pseries",
>  	.init			= pseries_eeh_init,
> -	.probe			= pseries_eeh_probe,
> +	.probe_pdn		= pseries_eeh_probe_pdn,
> +	.probe_pdev 		= NULL,
>  	.set_option		= pseries_eeh_set_option,
>  	.get_pe_addr		= pseries_eeh_get_pe_addr,
>  	.get_state		= pseries_eeh_get_state,
> 

-- 
Alexey

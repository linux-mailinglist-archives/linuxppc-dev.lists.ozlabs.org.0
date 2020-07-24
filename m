Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9159122BD56
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 07:07:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCcdS2XJzzDsF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 15:07:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=y1BOrMgh; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCcZy2VBGzDrMC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 15:05:14 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id w126so4277824pfw.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 22:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=wEaxYPVCVk+WUZLEJJ65xMFYfi8Ku0JTFdWaXxaPyVU=;
 b=y1BOrMgh3TzdNtt4RhxGwCMJaXWdcDo4Gb3pKYG+uAY0PInK11WHCDzsbqOS1FFkT6
 KoJMDi2joUjHLJvE5R4t0joieinU1HxcKw+dfXsG+uWMcVd2vfNeCHfinovOIABoDRD/
 ptfqlE8IM5Z/QMhJz1lA0//01gQU66saCGz5I1PLO8GEhLZn+nUtkBBRxX/DcVLZx1c6
 7xYiuDPW7V9VDww3EyUdLRYcPdnkoVnaSl5oJiMhkb+95G2Zg3WgJ7/GxRl0PefqCShY
 2M/4RoIIE6y43h54fq4W+Cj3hxpXSG1EcLLLWhblbU5nx3YlF5Qy8rjKBD3LpVJ8xKHn
 EfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wEaxYPVCVk+WUZLEJJ65xMFYfi8Ku0JTFdWaXxaPyVU=;
 b=DoG/ja077jWH0LUwC8N2WDN3CzW8dwVNioAD+vxGUgXObCFJFxzb1y/UnQcZxHlpri
 h0mBeZzCCCju8SjoboYPr66UdJ5Np4BH9Wk/PQKIPv8UnAl57Teq6iwY8UXglPn6rqho
 7DYNqAGhZjp4L368ShOFZZxgwA51ZHBaGKKN+hefXX5IskeWY//6YRt6oOiNNSxocGLx
 PrUV2p8LWqFyTf6QVJSlb90NffOK4T9g1PjkDrKspPY3cOPgkHiXZbFOTE8zcDICSmJl
 Uexs3x/TWPoSSLzxsq/2vf+C3OwyXN+f9daGE2Pw/WdxCt8itrHN+B6Ic9p9jDL38uwv
 Zv3A==
X-Gm-Message-State: AOAM532KWjwlJQp/Hf0iHP0KQ2w1xS/+1IV6qn96SqShQbvPvrCekFjy
 vUo7wCw7CnTpMRFIYO7hsOzzGvryXFG3gg==
X-Google-Smtp-Source: ABdhPJxr4HVZcmmqT0zoxgZfHsc3X0aNOoy+miTsopLzZFQJRoJXMe/wQ22PifBCYyLdQzRgOAfBiA==
X-Received: by 2002:a63:3c16:: with SMTP id j22mr7361795pga.335.1595567110333; 
 Thu, 23 Jul 2020 22:05:10 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id az13sm4245347pjb.34.2020.07.23.22.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Jul 2020 22:05:09 -0700 (PDT)
Subject: Re: [PATCH v2 01/14] powerpc/eeh: Remove eeh_dev_phb_init_dynamic()
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200722042628.1425880-1-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <cd81ba06-eaf2-eea7-5e7e-d39a6bed0d11@ozlabs.ru>
Date: Fri, 24 Jul 2020 15:05:06 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200722042628.1425880-1-oohall@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 22/07/2020 14:26, Oliver O'Halloran wrote:
> This function is a one line wrapper around eeh_phb_pe_create() and despite
> the name it doesn't create any eeh_dev structures.

The "eeh_dev_phb_init_dynamic" name does not suggest anything really but
the comment does.


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>



> Replace it with direct
> calls to eeh_phb_pe_create() since that does what it says on the tin
> and removes a layer of indirection.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> v2: Added sub prototype of eeh_phb_pe_create() for the !CONFIG_EEH case.
> ---
>  arch/powerpc/include/asm/eeh.h             |  3 ++-
>  arch/powerpc/kernel/eeh.c                  |  2 +-
>  arch/powerpc/kernel/eeh_dev.c              | 13 -------------
>  arch/powerpc/kernel/of_platform.c          |  4 ++--
>  arch/powerpc/platforms/pseries/pci_dlpar.c |  2 +-
>  5 files changed, 6 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index 964a54292b36..64487b88c569 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -294,7 +294,6 @@ const char *eeh_pe_loc_get(struct eeh_pe *pe);
>  struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
>  
>  struct eeh_dev *eeh_dev_init(struct pci_dn *pdn);
> -void eeh_dev_phb_init_dynamic(struct pci_controller *phb);
>  void eeh_show_enabled(void);
>  int __init eeh_ops_register(struct eeh_ops *ops);
>  int __exit eeh_ops_unregister(const char *name);
> @@ -370,6 +369,8 @@ void pseries_eeh_init_edev_recursive(struct pci_dn *pdn);
>  #else
>  static inline void pseries_eeh_add_device_early(struct pci_dn *pdn) { }
>  static inline void pseries_eeh_add_device_tree_early(struct pci_dn *pdn) { }
> +
> +static inline int eeh_phb_pe_create(struct pci_controller *phb) { return 0; }
>  #endif
>  
>  #ifdef CONFIG_PPC64
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index d407981dec76..859f76020256 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1096,7 +1096,7 @@ static int eeh_init(void)
>  
>  	/* Initialize PHB PEs */
>  	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
> -		eeh_dev_phb_init_dynamic(hose);
> +		eeh_phb_pe_create(hose);
>  
>  	eeh_addr_cache_init();
>  
> diff --git a/arch/powerpc/kernel/eeh_dev.c b/arch/powerpc/kernel/eeh_dev.c
> index 7370185c7a05..8e159a12f10c 100644
> --- a/arch/powerpc/kernel/eeh_dev.c
> +++ b/arch/powerpc/kernel/eeh_dev.c
> @@ -52,16 +52,3 @@ struct eeh_dev *eeh_dev_init(struct pci_dn *pdn)
>  
>  	return edev;
>  }
> -
> -/**
> - * eeh_dev_phb_init_dynamic - Create EEH devices for devices included in PHB
> - * @phb: PHB
> - *
> - * Scan the PHB OF node and its child association, then create the
> - * EEH devices accordingly
> - */
> -void eeh_dev_phb_init_dynamic(struct pci_controller *phb)
> -{
> -	/* EEH PE for PHB */
> -	eeh_phb_pe_create(phb);
> -}
> diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
> index 71a3f97dc988..f89376ff633e 100644
> --- a/arch/powerpc/kernel/of_platform.c
> +++ b/arch/powerpc/kernel/of_platform.c
> @@ -62,8 +62,8 @@ static int of_pci_phb_probe(struct platform_device *dev)
>  	/* Init pci_dn data structures */
>  	pci_devs_phb_init_dynamic(phb);
>  
> -	/* Create EEH PEs for the PHB */
> -	eeh_dev_phb_init_dynamic(phb);
> +	/* Create EEH PE for the PHB */
> +	eeh_phb_pe_create(phb);
>  
>  	/* Scan the bus */
>  	pcibios_scan_phb(phb);
> diff --git a/arch/powerpc/platforms/pseries/pci_dlpar.c b/arch/powerpc/platforms/pseries/pci_dlpar.c
> index b3a38f5a6b68..f9ae17e8a0f4 100644
> --- a/arch/powerpc/platforms/pseries/pci_dlpar.c
> +++ b/arch/powerpc/platforms/pseries/pci_dlpar.c
> @@ -34,7 +34,7 @@ struct pci_controller *init_phb_dynamic(struct device_node *dn)
>  	pci_devs_phb_init_dynamic(phb);
>  
>  	/* Create EEH devices for the PHB */
> -	eeh_dev_phb_init_dynamic(phb);
> +	eeh_phb_pe_create(phb);
>  
>  	if (dn->child)
>  		pseries_eeh_init_edev_recursive(PCI_DN(dn));
> 

-- 
Alexey

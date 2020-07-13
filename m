Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A2E21D340
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 11:56:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B4zZJ1CLszDqWG
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jul 2020 19:56:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=AK4L9w34; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B4zXK3CjbzDq7W
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 19:54:56 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id w17so5287851ply.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jul 2020 02:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3pwHzPXRzfnMAvEg+1qnZXL2Bw0rEdzU/tNkKW+5ui8=;
 b=AK4L9w34MOIVo3HHtTZjaMH8CI721o2yJ5QssPGhvPZVvtTMb4UDxH01P7U6jn/wKl
 XCgkdYWJoy7jnzkiPRhkSxl4Zq1N2yHyvXncpBPcHHwq5AF0ONeD3akVssHwiZivXV/W
 soPLsvau3LAdZZzoxUyQuWzbiAX85k/C1SaG77zBjK4wDnirWi1OThNp9l8I2l0uDUYm
 3KUeKQUw41H/LbeJBR95X+r8ZnyzwumEqyJHYKUjdw6AdD9oRR1TS2M9BOhuZ6tReW1e
 jyMLa8l2RcK+1rkRmWuJVNNV4m+v+ixqsyeTS40xYqui26xmdT7vugQulVUOGocFyX/k
 D/2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=3pwHzPXRzfnMAvEg+1qnZXL2Bw0rEdzU/tNkKW+5ui8=;
 b=WdwoFKbnktE4+GBT5YX2Wxu9kbcfW4AN1nSRyZ0ZLozYSOMmrwhjKfUk8gZuC8gzGh
 703i512YXqiCT7C2OgtehXeLk2+b5Cv0Jp8VOfc992k6wA1Aow/vWXWb2SVYZlUqz2u9
 VsKgYmziVGoWsWvhsz7S6hDGkiywThfe3c7EKkI0KF9XNcPemq777fXRSjLoVA/1lXtq
 xjj8dSPgBScf9z0c9Gt3OeWHd4C+HJexSXY6wPSH5+FzgNV46BO6z9mZf9R1SCmaAd7w
 7zc/TVKjB6PI4O0MGtvSdXyV/3fvJBL5Y9Z12kldvPdtMQaAZGAyXVr3cqWMa2HRki2/
 82tw==
X-Gm-Message-State: AOAM532XFQEZmyG8NfZIXq1h4Dp8rbe7Myg3OxBdxobsZDeq2tT3Ddax
 ie8g5QZBenpUDBIFxOZTQ+6SlA==
X-Google-Smtp-Source: ABdhPJxb8aA30dOOk7KLX56l75CYfyWpy26Q7bt005ItZZN5J9V45pbv0cSfj/98r3hbTtGtFlIx0w==
X-Received: by 2002:a17:902:c391:: with SMTP id
 g17mr70367165plg.330.1594634093638; 
 Mon, 13 Jul 2020 02:54:53 -0700 (PDT)
Received: from [192.168.10.94] (124-171-83-152.dyn.iinet.net.au.
 [124.171.83.152])
 by smtp.gmail.com with ESMTPSA id j17sm12538060pgn.87.2020.07.13.02.54.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Jul 2020 02:54:52 -0700 (PDT)
Subject: Re: [PATCH 05/14] powerpc/eeh: Kill off eeh_ops->get_pe_addr()
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200706013619.459420-1-oohall@gmail.com>
 <20200706013619.459420-6-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <d227871b-efc7-0864-efc4-a92b99a2ff04@ozlabs.ru>
Date: Mon, 13 Jul 2020 19:54:49 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200706013619.459420-6-oohall@gmail.com>
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
Cc: mahesh@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/07/2020 11:36, Oliver O'Halloran wrote:
> This is used in precisely one place which is in pseries specific platform
> code.  There's no need to have the callback in eeh_ops since the platform
> chooses the EEH PE addresses anyway. The PowerNV implementation has always
> been a stub too so remove it.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/include/asm/eeh.h               |  1 -
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 13 ------------
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 22 ++++++++++----------
>  3 files changed, 11 insertions(+), 25 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/eeh.h
> index 3d648e042835..1bddc0dfe099 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -220,7 +220,6 @@ struct eeh_ops {
>  	int (*init)(void);
>  	struct eeh_dev *(*probe)(struct pci_dev *pdev);
>  	int (*set_option)(struct eeh_pe *pe, int option);
> -	int (*get_pe_addr)(struct eeh_pe *pe);
>  	int (*get_state)(struct eeh_pe *pe, int *delay);
>  	int (*reset)(struct eeh_pe *pe, int option);
>  	int (*get_log)(struct eeh_pe *pe, int severity, char *drv_log, unsigned long len);
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index 79409e005fcd..bcd0515d8f79 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -535,18 +535,6 @@ static int pnv_eeh_set_option(struct eeh_pe *pe, int option)
>  	return 0;
>  }
>  
> -/**
> - * pnv_eeh_get_pe_addr - Retrieve PE address
> - * @pe: EEH PE
> - *
> - * Retrieve the PE address according to the given tranditional
> - * PCI BDF (Bus/Device/Function) address.
> - */
> -static int pnv_eeh_get_pe_addr(struct eeh_pe *pe)
> -{
> -	return pe->addr;
> -}
> -
>  static void pnv_eeh_get_phb_diag(struct eeh_pe *pe)
>  {
>  	struct pnv_phb *phb = pe->phb->private_data;
> @@ -1670,7 +1658,6 @@ static struct eeh_ops pnv_eeh_ops = {
>  	.init                   = pnv_eeh_init,
>  	.probe			= pnv_eeh_probe,
>  	.set_option             = pnv_eeh_set_option,
> -	.get_pe_addr            = pnv_eeh_get_pe_addr,
>  	.get_state              = pnv_eeh_get_state,
>  	.reset                  = pnv_eeh_reset,
>  	.get_log                = pnv_eeh_get_log,
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 18a2522b9b5e..088771fa38be 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -32,6 +32,8 @@
>  #include <asm/ppc-pci.h>
>  #include <asm/rtas.h>
>  
> +static int pseries_eeh_get_pe_addr(struct pci_dn *pdn);
> +
>  /* RTAS tokens */
>  static int ibm_set_eeh_option;
>  static int ibm_set_slot_reset;
> @@ -301,7 +303,7 @@ void pseries_eeh_init_edev(struct pci_dn *pdn)
>  		eeh_edev_dbg(edev, "EEH failed to enable on device (code %d)\n", ret);
>  	} else {
>  		/* Retrieve PE address */
> -		edev->pe_config_addr = eeh_ops->get_pe_addr(&pe);
> +		edev->pe_config_addr = pseries_eeh_get_pe_addr(pdn);
>  		pe.addr = edev->pe_config_addr;
>  
>  		/* Some older systems (Power4) allow the ibm,set-eeh-option
> @@ -431,8 +433,10 @@ static int pseries_eeh_set_option(struct eeh_pe *pe, int option)
>   * It's notable that zero'ed return value means invalid PE config
>   * address.
>   */
> -static int pseries_eeh_get_pe_addr(struct eeh_pe *pe)
> +static int pseries_eeh_get_pe_addr(struct pci_dn *pdn)
>  {
> +	int config_addr = rtas_config_addr(pdn->busno, pdn->devfn, 0);

Why not use pe->config_addr (and why we have two addresses in eeh_pe
anyway)?


Ah, I guess I just trust you with this one :)


Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>




> +	int buid = pdn->phb->buid;
>  	int ret = 0;
>  	int rets[3];
>  
> @@ -443,18 +447,16 @@ static int pseries_eeh_get_pe_addr(struct eeh_pe *pe)
>  		 * meaningless.
>  		 */
>  		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> -				pe->config_addr, BUID_HI(pe->phb->buid),
> -				BUID_LO(pe->phb->buid), 1);
> +				config_addr, BUID_HI(buid), BUID_LO(buid), 1);
>  		if (ret || (rets[0] == 0))
>  			return 0;
>  
>  		/* Retrieve the associated PE config address */
>  		ret = rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> -				pe->config_addr, BUID_HI(pe->phb->buid),
> -				BUID_LO(pe->phb->buid), 0);
> +				config_addr, BUID_HI(buid), BUID_LO(buid), 0);
>  		if (ret) {
>  			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
> -				__func__, pe->phb->global_number, pe->config_addr);
> +				__func__, pdn->phb->global_number, config_addr);
>  			return 0;
>  		}
>  
> @@ -463,11 +465,10 @@ static int pseries_eeh_get_pe_addr(struct eeh_pe *pe)
>  
>  	if (ibm_get_config_addr_info != RTAS_UNKNOWN_SERVICE) {
>  		ret = rtas_call(ibm_get_config_addr_info, 4, 2, rets,
> -				pe->config_addr, BUID_HI(pe->phb->buid),
> -				BUID_LO(pe->phb->buid), 0);
> +				config_addr, BUID_HI(buid), BUID_LO(buid), 0);
>  		if (ret) {
>  			pr_warn("%s: Failed to get address for PHB#%x-PE#%x\n",
> -				__func__, pe->phb->global_number, pe->config_addr);
> +				__func__, pdn->phb->global_number, config_addr);
>  			return 0;
>  		}
>  
> @@ -839,7 +840,6 @@ static struct eeh_ops pseries_eeh_ops = {
>  	.init			= pseries_eeh_init,
>  	.probe			= pseries_eeh_probe,
>  	.set_option		= pseries_eeh_set_option,
> -	.get_pe_addr		= pseries_eeh_get_pe_addr,
>  	.get_state		= pseries_eeh_get_state,
>  	.reset			= pseries_eeh_reset,
>  	.get_log		= pseries_eeh_get_log,
> 

-- 
Alexey

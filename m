Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0453D104965
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 04:40:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47JQLJ6HRBzDqtG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Nov 2019 14:40:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="QZhAry7k"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47JQJc2f2LzDqnZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Nov 2019 14:38:38 +1100 (AEDT)
Received: by mail-pg1-x541.google.com with SMTP id h27so877859pgn.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Nov 2019 19:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/7JkYiMPEHh03HtLL3M8ZiXc5ntcJb3nHh+ttw88HRU=;
 b=QZhAry7kERxY9ykFCu4SWYPW2SqARJv7wVx+VjXZg6OWTObAXP0vvgXyr9VH9Rij0p
 ZlnL/FBNtKEP48oHZCKwr05jxFiDlGauIS6OBiVtiNYC0iZmLXbkkffcL39O9U4PB4BX
 lyH641hH73QsxgaPDtJqeWnqxyLxSW1f7ESlKhDgyxFyAZfFe/yQ70zC6nlG3vf3/9N8
 ZkAaf140Y43dPoUp5BbIdYgszd1U8LQcoTg6jmPJCNIwO3MjYPON7mfOTp4mrVFsn14d
 fqVptczmrzWLQN8cPWt82VQ6oMK3ndEk0VssGm3QRU2da5r94JwAV04sqf1ys04TvNNc
 7aHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=/7JkYiMPEHh03HtLL3M8ZiXc5ntcJb3nHh+ttw88HRU=;
 b=L14cPl8l2IHUKZ/M85HWjsTucptLtgIxU23n8iaBpZEwaoQWVnyw+1tnTtdygrX3v2
 cX1avToNjRjIq4dj6AIQqdXArmtP6ag5Oq4gwVQ78m3d9PCAK9jK7TyXoubhhIZoy0k9
 bCs+3XmbTKVBK6AM5sPN7psGQlX9C5a/dPZXsFgN0cyjJqMpx5Z2eriD5EWLE/11mTQP
 ZCmlhntQPT3qXtHEH4B2DvnweSfPPIJEbOhAzut1rw4/fSZL5iSys0WbKZVAfS/x7/wH
 nY/dJVYCTH0NWjOcypJcEDhhBnAy01KAhMdOurv/xWKBG0sORo6po3H9WUEulD4mVJ7n
 q/YQ==
X-Gm-Message-State: APjAAAV+TDlVeQ2hRpWUsE08I/lUITx+S2lTDhnHC3B2Ni80eE1r+jC1
 JmFK/65h6d/cecdVjeHDZ5wuQg==
X-Google-Smtp-Source: APXvYqwhyBRJKdGQrxqBoXr7rfWP0V71KYcMgFisH6QZsiAXbtstumjmcTN2jzx+Q3qEEPhN/gd0FQ==
X-Received: by 2002:a65:4cc9:: with SMTP id n9mr7281552pgt.426.1574307514661; 
 Wed, 20 Nov 2019 19:38:34 -0800 (PST)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id j126sm935125pfg.4.2019.11.20.19.38.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Nov 2019 19:38:33 -0800 (PST)
Subject: Re: [Very RFC 01/46] powerpc/eeh: Don't attempt to restore VF config
 space after reset
To: Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20191120012859.23300-1-oohall@gmail.com>
 <20191120012859.23300-2-oohall@gmail.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <3c3431d7-98ea-b3d1-b815-a020a480db98@ozlabs.ru>
Date: Thu, 21 Nov 2019 14:38:29 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191120012859.23300-2-oohall@gmail.com>
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
> After resetting a VF we call eeh_restore_vf_config() to restore several
> registers in the VFs config space. For physical functions this is normally
> handled by the pci_reinit_device() OPAL call which requests firmware to
> re-program the device with whatever defaults were set at boot time. We
> can't use that for VFs since OPAL (being firmware) doesn't know (or care)
> about VFs.
> 
> However, the fields that are restored here are all marked as reserved for
> VFs in the SR-IOV spec. In other words, eeh_restore_vf_config() doesn't
> actually do anything.
> 
> There is an argument to be made that we should be saving and restoring
> some of these fields since they are marked as "Reserved, but Preserve"
> (ResvP) to allow these fields to be used in new versions of the SR-IOV.
> However, the current code doesn't even do that properly since it assumes
> they can be set to whatever the EEH core has assumed to be correct. If
> the fields *are* used in future versions of the SR-IOV spec this code
> is still broken since it doesn't take into account any changes made
> by the driver, or the Linux IOV core.
> Given the above, just delete the code. It's broken, it's mis-leading,
> and it's getting in the way of doing useful cleanups.


There is still a prototype for this in arch/powerpc/include/asm/eeh.h,
and pci_dn::mps as well.


With the history of this explained offline,

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>





> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
>  arch/powerpc/kernel/eeh.c                    | 59 --------------------
>  arch/powerpc/platforms/powernv/eeh-powernv.c | 39 +++----------
>  arch/powerpc/platforms/pseries/eeh_pseries.c | 26 +--------
>  3 files changed, 8 insertions(+), 116 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index ae0a9c421d7b..a3b93db972fc 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -742,65 +742,6 @@ static void eeh_restore_dev_state(struct eeh_dev *edev, void *userdata)
>  		pci_restore_state(pdev);
>  }
>  
> -int eeh_restore_vf_config(struct pci_dn *pdn)
> -{
> -	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
> -	u32 devctl, cmd, cap2, aer_capctl;
> -	int old_mps;
> -
> -	if (edev->pcie_cap) {
> -		/* Restore MPS */
> -		old_mps = (ffs(pdn->mps) - 8) << 5;
> -		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
> -				     2, &devctl);
> -		devctl &= ~PCI_EXP_DEVCTL_PAYLOAD;
> -		devctl |= old_mps;
> -		eeh_ops->write_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
> -				      2, devctl);
> -
> -		/* Disable Completion Timeout if possible */
> -		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCAP2,
> -				     4, &cap2);
> -		if (cap2 & PCI_EXP_DEVCAP2_COMP_TMOUT_DIS) {
> -			eeh_ops->read_config(pdn,
> -					     edev->pcie_cap + PCI_EXP_DEVCTL2,
> -					     4, &cap2);
> -			cap2 |= PCI_EXP_DEVCTL2_COMP_TMOUT_DIS;
> -			eeh_ops->write_config(pdn,
> -					      edev->pcie_cap + PCI_EXP_DEVCTL2,
> -					      4, cap2);
> -		}
> -	}
> -
> -	/* Enable SERR and parity checking */
> -	eeh_ops->read_config(pdn, PCI_COMMAND, 2, &cmd);
> -	cmd |= (PCI_COMMAND_PARITY | PCI_COMMAND_SERR);
> -	eeh_ops->write_config(pdn, PCI_COMMAND, 2, cmd);
> -
> -	/* Enable report various errors */
> -	if (edev->pcie_cap) {
> -		eeh_ops->read_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
> -				     2, &devctl);
> -		devctl &= ~PCI_EXP_DEVCTL_CERE;
> -		devctl |= (PCI_EXP_DEVCTL_NFERE |
> -			   PCI_EXP_DEVCTL_FERE |
> -			   PCI_EXP_DEVCTL_URRE);
> -		eeh_ops->write_config(pdn, edev->pcie_cap + PCI_EXP_DEVCTL,
> -				      2, devctl);
> -	}
> -
> -	/* Enable ECRC generation and check */
> -	if (edev->pcie_cap && edev->aer_cap) {
> -		eeh_ops->read_config(pdn, edev->aer_cap + PCI_ERR_CAP,
> -				     4, &aer_capctl);
> -		aer_capctl |= (PCI_ERR_CAP_ECRC_GENE | PCI_ERR_CAP_ECRC_CHKE);
> -		eeh_ops->write_config(pdn, edev->aer_cap + PCI_ERR_CAP,
> -				      4, aer_capctl);
> -	}
> -
> -	return 0;
> -}
> -
>  /**
>   * pcibios_set_pcie_reset_state - Set PCI-E reset state
>   * @dev: pci device struct
> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
> index ef727ecd99cd..b2ac4130fda7 100644
> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> @@ -1649,20 +1649,13 @@ static int pnv_eeh_restore_config(struct pci_dn *pdn)
>  	if (!edev)
>  		return -EEXIST;
>  
> -	/*
> -	 * We have to restore the PCI config space after reset since the
> -	 * firmware can't see SRIOV VFs.
> -	 *
> -	 * FIXME: The MPS, error routing rules, timeout setting are worthy
> -	 * to be exported by firmware in extendible way.
> -	 */
> -	if (edev->physfn) {
> -		ret = eeh_restore_vf_config(pdn);
> -	} else {
> -		phb = pdn->phb->private_data;
> -		ret = opal_pci_reinit(phb->opal_id,
> -				      OPAL_REINIT_PCI_DEV, config_addr);
> -	}
> +	/* Nothing to do for VFs */
> +	if (edev->physfn)
> +		return 0;
> +
> +	phb = pdn->phb->private_data;
> +	ret = opal_pci_reinit(phb->opal_id,
> +			      OPAL_REINIT_PCI_DEV, config_addr);
>  
>  	if (ret) {
>  		pr_warn("%s: Can't reinit PCI dev 0x%x (%lld)\n",
> @@ -1691,24 +1684,6 @@ static struct eeh_ops pnv_eeh_ops = {
>  	.notify_resume		= NULL
>  };
>  
> -#ifdef CONFIG_PCI_IOV
> -static void pnv_pci_fixup_vf_mps(struct pci_dev *pdev)
> -{
> -	struct pci_dn *pdn = pci_get_pdn(pdev);
> -	int parent_mps;
> -
> -	if (!pdev->is_virtfn)
> -		return;
> -
> -	/* Synchronize MPS for VF and PF */
> -	parent_mps = pcie_get_mps(pdev->physfn);
> -	if ((128 << pdev->pcie_mpss) >= parent_mps)
> -		pcie_set_mps(pdev, parent_mps);
> -	pdn->mps = pcie_get_mps(pdev);
> -}
> -DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pnv_pci_fixup_vf_mps);
> -#endif /* CONFIG_PCI_IOV */
> -
>  /**
>   * eeh_powernv_init - Register platform dependent EEH operations
>   *
> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
> index 95bbf9102584..fa704d7052ec 100644
> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
> @@ -657,30 +657,6 @@ static int pseries_eeh_write_config(struct pci_dn *pdn, int where, int size, u32
>  	return rtas_write_config(pdn, where, size, val);
>  }
>  
> -static int pseries_eeh_restore_config(struct pci_dn *pdn)
> -{
> -	struct eeh_dev *edev = pdn_to_eeh_dev(pdn);
> -	s64 ret = 0;
> -
> -	if (!edev)
> -		return -EEXIST;
> -
> -	/*
> -	 * FIXME: The MPS, error routing rules, timeout setting are worthy
> -	 * to be exported by firmware in extendible way.
> -	 */
> -	if (edev->physfn)
> -		ret = eeh_restore_vf_config(pdn);
> -
> -	if (ret) {
> -		pr_warn("%s: Can't reinit PCI dev 0x%x (%lld)\n",
> -			__func__, edev->pe_config_addr, ret);
> -		return -EIO;
> -	}
> -
> -	return ret;
> -}
> -
>  #ifdef CONFIG_PCI_IOV
>  int pseries_send_allow_unfreeze(struct pci_dn *pdn,
>  				u16 *vf_pe_array, int cur_vfs)
> @@ -786,7 +762,7 @@ static struct eeh_ops pseries_eeh_ops = {
>  	.read_config		= pseries_eeh_read_config,
>  	.write_config		= pseries_eeh_write_config,
>  	.next_error		= NULL,
> -	.restore_config		= pseries_eeh_restore_config,
> +	.restore_config		= NULL,
>  #ifdef CONFIG_PCI_IOV
>  	.notify_resume		= pseries_notify_resume
>  #endif
> 

-- 
Alexey

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D05454C594
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 04:42:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TmM16j2PzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 12:42:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=ozlabs.ru
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.b="WK8oP7Ox"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TmK45fWSzDqsM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 12:40:56 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id m30so748490pff.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 19:40:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=b62P7Mo8WpUptu1+d0uWSyvVsJNOjAGpBCnaw+nvntI=;
 b=WK8oP7OxgmQkBTUT3jcD0qpZukoOASRZre16sAHNJ1X+vOv2hSdPRmw39Y+Cgcbv2S
 +ibTvk0uSuYQujENd3JRuDkU17IVVnLRM89MauPzsL6ogMmrP5YM9vUpisNcDzFnXsNJ
 mJvw9Zwwd7LYjXF6QNZYl/l2PnVmttY0chdriD17NmM5cHk95nSnxaqbhO62hZORfdEF
 kkrGZl1CONSNCGmqhwC72hNHlWjSp8D6crsZd18SuwINf8sbjL4x4rrbDjFg1HTEXiUk
 TB48SGP7UQE4fo1n1tSRI6x4KamsSpUuuagvUQdy2qU72GeaBix658Zy7eOtG4GvyOC/
 +oqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=b62P7Mo8WpUptu1+d0uWSyvVsJNOjAGpBCnaw+nvntI=;
 b=Yk6Tir8biboyx00aK7mYfNDBTbO+0eezREwQnhlQKsj4P1rflAl179IgVfINbPF/j7
 z2Dn8ERPBTSuXJuOA9+DYGSHHMufsntGfuWXtsPc6iHY8Dr05CUoAmI6Tla0XWTKeKZh
 7YOaD9wzezMj5ng5YrhEy8wo/kv9PoNggAbCiLRLDpm9iI480PhljRJMZt/KL3QUK5z0
 7ZVLZohYWBE7wdreYA83eHG+BzZfe3vC90pli4Z3H9hObBHACYpWop4bO6B4n1jXUncp
 Lc4DohY1XAjaZp1dBcJIgH7TLasNtbwat1YoIIJDmJrlkRRHahyVMGNkZXg436gvnUdB
 oOag==
X-Gm-Message-State: APjAAAXl6gxLsjZUBRMQM3HxSoRizYASyqEhG2+pYRcs9m1uzMRLmpSy
 Szxx2uog/ITZ4U4A62cze5h+sw==
X-Google-Smtp-Source: APXvYqzgKBkEVMo0kp/0GARRYI+58Xpp5STvaAOTb/XsQpzFmLj3qG8Ea5QaTgL5anZ07xpyJAb8Zg==
X-Received: by 2002:a17:90a:dd42:: with SMTP id
 u2mr508358pjv.118.1560998454179; 
 Wed, 19 Jun 2019 19:40:54 -0700 (PDT)
Received: from [10.61.2.175] ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id y11sm21275458pfb.119.2019.06.19.19.40.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jun 2019 19:40:53 -0700 (PDT)
Subject: Re: [PATCH v2 3/6] powerpc/eeh: Improve debug messages around device
 addition
To: Sam Bobroff <sbobroff@linux.ibm.com>
References: <cover.1557203383.git.sbobroff@linux.ibm.com>
 <8deaedffad8ed3327f296a561c2a31c930c65f88.1557203383.git.sbobroff@linux.ibm.com>
 <ef181b9d-54df-23f9-2f06-f0f4d0bd8e8a@ozlabs.ru>
 <20190619042706.GA24143@tungsten.ozlabs.ibm.com>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Openpgp: preference=signencrypt
Autocrypt: addr=aik@ozlabs.ru; keydata=
 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
Message-ID: <e8f68068-bb62-6d2e-f484-d6a111811fbc@ozlabs.ru>
Date: Thu, 20 Jun 2019 12:40:49 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619042706.GA24143@tungsten.ozlabs.ibm.com>
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
Cc: oohall@gmail.com, linuxppc-dev@lists.ozlabs.org, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 19/06/2019 14:27, Sam Bobroff wrote:
> On Tue, Jun 11, 2019 at 03:47:58PM +1000, Alexey Kardashevskiy wrote:
>>
>>
>> On 07/05/2019 14:30, Sam Bobroff wrote:
>>> Also remove useless comment.
>>>
>>> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
>>> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>>  arch/powerpc/kernel/eeh.c                    |  2 +-
>>>  arch/powerpc/platforms/powernv/eeh-powernv.c | 14 ++++++++----
>>>  arch/powerpc/platforms/pseries/eeh_pseries.c | 23 +++++++++++++++-----
>>>  3 files changed, 28 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
>>> index 8d3c36a1f194..b14d89547895 100644
>>> --- a/arch/powerpc/kernel/eeh.c
>>> +++ b/arch/powerpc/kernel/eeh.c
>>> @@ -1291,7 +1291,7 @@ void eeh_add_device_late(struct pci_dev *dev)
>>>  	pdn = pci_get_pdn_by_devfn(dev->bus, dev->devfn);
>>>  	edev = pdn_to_eeh_dev(pdn);
>>>  	if (edev->pdev == dev) {
>>> -		pr_debug("EEH: Already referenced !\n");
>>> +		pr_debug("EEH: Device %s already referenced!\n", pci_name(dev));
>>>  		return;
>>>  	}
>>>  
>>> diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerpc/platforms/powernv/eeh-powernv.c
>>> index 6fc1a463b796..0e374cdba961 100644
>>> --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
>>> +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
>>> @@ -50,10 +50,7 @@ void pnv_pcibios_bus_add_device(struct pci_dev *pdev)
>>>  	if (!pdev->is_virtfn)
>>>  		return;
>>>  
>>> -	/*
>>> -	 * The following operations will fail if VF's sysfs files
>>> -	 * aren't created or its resources aren't finalized.
>>> -	 */
>>> +	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev));
>>
>>
>> dev_dbg() seems more appropriate.
> 
> Oh! It does, or even pci_debug() :-)
> 
> I'll change it if I need to do another version, otherwise I'll clean it
> up later.
> 
>>>  	eeh_add_device_early(pdn);
>>>  	eeh_add_device_late(pdev);
>>>  	eeh_sysfs_add_device(pdev);
>>> @@ -397,6 +394,10 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
>>>  	int ret;
>>>  	int config_addr = (pdn->busno << 8) | (pdn->devfn);
>>>  
>>> +	pr_debug("%s: probing %04x:%02x:%02x.%01x\n",
>>> +		__func__, hose->global_number, pdn->busno,
>>> +		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
>>> +
>>>  	/*
>>>  	 * When probing the root bridge, which doesn't have any
>>>  	 * subordinate PCI devices. We don't have OF node for
>>> @@ -491,6 +492,11 @@ static void *pnv_eeh_probe(struct pci_dn *pdn, void *data)
>>>  	/* Save memory bars */
>>>  	eeh_save_bars(edev);
>>>  
>>> +	pr_debug("%s: EEH enabled on %02x:%02x.%01x PHB#%x-PE#%x\n",
>>> +		__func__, pdn->busno, PCI_SLOT(pdn->devfn),
>>> +		PCI_FUNC(pdn->devfn), edev->pe->phb->global_number,
>>> +		edev->pe->addr);
>>> +
>>>  	return NULL;
>>>  }
>>>  
>>> diff --git a/arch/powerpc/platforms/pseries/eeh_pseries.c b/arch/powerpc/platforms/pseries/eeh_pseries.c
>>> index 7aa50258dd42..ae06878fbdea 100644
>>> --- a/arch/powerpc/platforms/pseries/eeh_pseries.c
>>> +++ b/arch/powerpc/platforms/pseries/eeh_pseries.c
>>> @@ -65,6 +65,8 @@ void pseries_pcibios_bus_add_device(struct pci_dev *pdev)
>>>  	if (!pdev->is_virtfn)
>>>  		return;
>>>  
>>> +	pr_debug("%s: EEH: Setting up device %s.\n", __func__, pci_name(pdev));
>>> +
>>>  	pdn->device_id  =  pdev->device;
>>>  	pdn->vendor_id  =  pdev->vendor;
>>>  	pdn->class_code =  pdev->class;
>>> @@ -251,6 +253,10 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
>>>  	int enable = 0;
>>>  	int ret;
>>>  
>>> +	pr_debug("%s: probing %04x:%02x:%02x.%01x\n",
>>> +		__func__, pdn->phb->global_number, pdn->busno,
>>> +		PCI_SLOT(pdn->devfn), PCI_FUNC(pdn->devfn));
>>> +
>>>  	/* Retrieve OF node and eeh device */
>>>  	edev = pdn_to_eeh_dev(pdn);
>>>  	if (!edev || edev->pe)
>>> @@ -294,7 +300,12 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
>>>  
>>>  	/* Enable EEH on the device */
>>>  	ret = eeh_ops->set_option(&pe, EEH_OPT_ENABLE);
>>> -	if (!ret) {
>>> +	if (ret) {
>>> +		pr_debug("%s: EEH failed to enable on %02x:%02x.%01x PHB#%x-PE#%x (code %d)\n",
>>> +			__func__, pdn->busno, PCI_SLOT(pdn->devfn),
>>> +			PCI_FUNC(pdn->devfn), pe.phb->global_number,
>>> +			pe.addr, ret);
>>> +	} else {
>>
>>
>> edev!=NULL here so you could do dev_dbg(&edev->pdev->dev,...) and skip
>> PCI_SLOT/PCI_FUNC. Or is (edev!=NULL && edev->pdev==NULL) possible (it
>> could be, just asking)?
> 
> I can see that edev will be non-NULL here, but that pr_debug() pattern
> (using the PDN information to form the PCI address) is quite common
> across the EEH code, so I think rather than changing a couple of
> specific cases, I should do a separate cleanup patch and introduce
> something like pdn_debug(pdn, "...."). What do you think?


I'd switch them all to already existing dev_dbg/pci_debug rather than
adding pdn_debug as imho it should not have been used in the first place
really...

> (I don't know exactly when edev->pdev can be NULL.)

... and if you switch to dev_dbg/pci_debug, I think quite soon you'll
know if it can or cannot be NULL :)



> 
>>
>>>  		/* Retrieve PE address */
>>>  		edev->pe_config_addr = eeh_ops->get_pe_addr(&pe);
>>>  		pe.addr = edev->pe_config_addr;
>>> @@ -310,11 +321,6 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
>>>  		if (enable) {
>>>  			eeh_add_flag(EEH_ENABLED);
>>>  			eeh_add_to_parent_pe(edev);
>>> -
>>> -			pr_debug("%s: EEH enabled on %02x:%02x.%01x PHB#%x-PE#%x\n",
>>> -				__func__, pdn->busno, PCI_SLOT(pdn->devfn),
>>> -				PCI_FUNC(pdn->devfn), pe.phb->global_number,
>>> -				pe.addr);
>>>  		} else if (pdn->parent && pdn_to_eeh_dev(pdn->parent) &&
>>>  			   (pdn_to_eeh_dev(pdn->parent))->pe) {
>>>  			/* This device doesn't support EEH, but it may have an
>>> @@ -323,6 +329,11 @@ static void *pseries_eeh_probe(struct pci_dn *pdn, void *data)
>>>  			edev->pe_config_addr = pdn_to_eeh_dev(pdn->parent)->pe_config_addr;
>>>  			eeh_add_to_parent_pe(edev);
>>>  		}
>>> +		pr_debug("%s: EEH %s on %02x:%02x.%01x PHB#%x-PE#%x (code %d)\n",
>>> +			__func__, (enable ? "enabled" : "unsupported"),
>>> +			pdn->busno, PCI_SLOT(pdn->devfn),
>>> +			PCI_FUNC(pdn->devfn), pe.phb->global_number,
>>> +			pe.addr, ret);
>>
>> Same here. I understand though this one is a cut-n-paste :)
>>
>>
>>>  	}
>>>  
>>>  	/* Save memory bars */
>>>
>>
>> -- 
>> Alexey

-- 
Alexey

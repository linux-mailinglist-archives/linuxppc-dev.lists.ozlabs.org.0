Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BABD91CAAE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 16:45:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453L8h1QzVzDqM9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 00:45:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=yadro.com
 (client-ip=89.207.88.251; helo=mta-01.yadro.com;
 envelope-from=s.miroshnichenko@yadro.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=yadro.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=yadro.com header.i=@yadro.com header.b="PQg2qfdf"; 
 dkim-atps=neutral
Received: from mta-01.yadro.com (mta-01.yadro.com [89.207.88.251])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453L6l2rnwzDqGl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 00:44:12 +1000 (AEST)
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id 63E064118F;
 Tue, 14 May 2019 14:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 content-transfer-encoding:content-language:content-type
 :content-type:in-reply-to:mime-version:user-agent:date:date
 :message-id:from:from:references:subject:subject:received
 :received:received; s=mta-01; t=1557845046; x=1559659447; bh=2DM
 NvVFklfNCEeLSPZjU9tmmNt9I98RYHGlfcmQvVrc=; b=PQg2qfdfhJbhPGashi1
 fGfH2auksfC/D0dtUUy4wM6e2/mwOsqq9AjKhqfdOR2fs6flc5y4LK56vdda4//T
 LAwVWZmWygWoip0/BTLXuz3teUp7IuDmecuTOMoGf6xNCXAuFR5dHwxqwFgBwO38
 4lT4fCAlE7JKHOf5Mvz3vTzI=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sNS5FgSOHzSl; Tue, 14 May 2019 17:44:06 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com
 [172.17.10.102])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id E941E404CB;
 Tue, 14 May 2019 17:44:05 +0300 (MSK)
Received: from [172.17.15.60] (172.17.15.60) by T-EXCH-02.corp.yadro.com
 (172.17.10.102) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Tue, 14
 May 2019 17:44:05 +0300
Subject: Re: [PATCH v5 5/8] powerpc/pci/IOV: Add support for runtime enabling
 the VFs
To: Oliver O'Halloran <oohall@gmail.com>
References: <20190311115233.6514-1-s.miroshnichenko@yadro.com>
 <20190311115233.6514-6-s.miroshnichenko@yadro.com>
 <e27c1caebdbc4dc71fb8d132db24f04fa65a7a69.camel@gmail.com>
From: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
Openpgp: preference=signencrypt
Autocrypt: addr=s.miroshnichenko@yadro.com; prefer-encrypt=mutual; keydata=
 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
 lHi50np+KDDPzZS51tw=
Message-ID: <9c452718-089a-e408-0e7d-4ea2c67f1019@yadro.com>
Date: Tue, 14 May 2019 17:44:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <e27c1caebdbc4dc71fb8d132db24f04fa65a7a69.camel@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.60]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
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
Cc: Stewart Smith <stewart@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>, linux-pci@vger.kernel.org,
 linux@yadro.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/30/19 9:00 AM, Oliver O'Halloran wrote:
> On Mon, 2019-03-11 at 14:52 +0300, Sergey Miroshnichenko wrote:
> 
>> When called within pcibios_sriov_enable(), the pci_sriov_get_totalvfs(pdev)
>> returns zero, because the device is yet preparing to enable the VFs.
> 
> I don't think this is correct. The earliest pcibios_sriov_enable() can
> be called is during a driver probe function. The totalvfs field is
> initialised by pci_iov_init() which is called before the device has
> been added to the bus. If it's returning zero then maybe the driver
> limited the number of VFs to zero?
> 
> That said, you need to reset numvfs to zero before changing the value. 
> So limiting the number of pci_dns that are created to the number
> actually required rather than totalvfs doesn't hurt.
> 
>> With this patch it becomes possible to enable VFs via sysfs "sriov_numvfs"
>> on PowerNV.
> 
> I tested on a few of our lab systems with random kernel versions
> spanning from 4.15 to 5.0 and sriov_numvfs seemed to work fine on all
> of them. Is there a specific configuration you're testing that needed
> this change?
> 

Thanks a lot for the review and testing!

I've just received back the hardware (Mellanox ConnectX-4 -
drivers/net/ethernet/mellanox/mlx5), and got surprised: the issue with the
pci_sriov_get_totalvfs(pdev) returning zero can't be reproduced anymore :/ I've rechecked
the code and don't know how could this even happen. I'm sorry about that; if it will
happen again, I have to investigate deeper.

The PCI subsystem doesn't let the number of VFs to be changed from non-zero value to
another non-zero value: it needs to sriov_disable() first. I guess we can rely on that and
don't reset the numvfs to zero explicitly.

I'll change the patch description and resend it in v6 with other fixes of this patchset.

Best regards,
Serge

>> Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
>> ---
>>  arch/powerpc/include/asm/pci-bridge.h     |  4 +--
>>  arch/powerpc/kernel/pci_dn.c              | 32 ++++++++++++++---------
>>  arch/powerpc/platforms/powernv/pci-ioda.c |  4 +--
>>  arch/powerpc/platforms/pseries/pci.c      |  4 +--
>>  4 files changed, 25 insertions(+), 19 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include/asm/pci-bridge.h
>> index fc188e0e9179..6479bc96e0b6 100644
>> --- a/arch/powerpc/include/asm/pci-bridge.h
>> +++ b/arch/powerpc/include/asm/pci-bridge.h
>> @@ -225,8 +225,8 @@ struct pci_dn {
>>  extern struct pci_dn *pci_get_pdn_by_devfn(struct pci_bus *bus,
>>  					   int devfn);
>>  extern struct pci_dn *pci_get_pdn(struct pci_dev *pdev);
>> -extern struct pci_dn *add_dev_pci_data(struct pci_dev *pdev);
>> -extern void remove_dev_pci_data(struct pci_dev *pdev);
>> +extern struct pci_dn *pci_create_vf_pdns(struct pci_dev *pdev, int num_vfs);
>> +extern void pci_destroy_vf_pdns(struct pci_dev *pdev);
>>  extern struct pci_dn *pci_add_device_node_info(struct pci_controller *hose,
>>  					       struct device_node *dn);
>>  extern void pci_remove_device_node_info(struct device_node *dn);
>> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
>> index 7f12882d8882..7fa362f8038d 100644
>> --- a/arch/powerpc/kernel/pci_dn.c
>> +++ b/arch/powerpc/kernel/pci_dn.c
>> @@ -222,18 +222,19 @@ static struct pci_dn *pci_create_pdn_from_dev(struct pci_dev *pdev,
>>  	return pdn;
>>  }
>>  
>> -struct pci_dn *add_dev_pci_data(struct pci_dev *pdev)
>> +struct pci_dn *pci_create_vf_pdns(struct pci_dev *pdev, int num_vfs)
>>  {
>> +	struct pci_dn *pdn = pci_get_pdn(pdev);
>> +
>>  #ifdef CONFIG_PCI_IOV
>> -	struct pci_dn *parent, *pdn;
>> +	struct pci_dn *parent;
>>  	int i;
>>  
>>  	/* Only support IOV for now */
>>  	if (!pdev->is_physfn)
>> -		return pci_get_pdn(pdev);
>> +		return pdn;
>>  
>>  	/* Check if VFs have been populated */
>> -	pdn = pci_get_pdn(pdev);
>>  	if (!pdn || (pdn->flags & PCI_DN_FLAG_IOV_VF))
>>  		return NULL;
>>  
>> @@ -242,33 +243,38 @@ struct pci_dn *add_dev_pci_data(struct pci_dev *pdev)
>>  	if (!parent)
>>  		return NULL;
>>  
>> -	for (i = 0; i < pci_sriov_get_totalvfs(pdev); i++) {
>> +	for (i = 0; i < num_vfs; i++) {
>>  		struct eeh_dev *edev __maybe_unused;
>> +		struct pci_dn *vpdn;
>>  
>> -		pdn = pci_alloc_pdn(parent,
>> -				    pci_iov_virtfn_bus(pdev, i),
>> -				    pci_iov_virtfn_devfn(pdev, i));
>> -		if (!pdn) {
>> +		vpdn = pci_alloc_pdn(parent,
>> +				     pci_iov_virtfn_bus(pdev, i),
>> +				     pci_iov_virtfn_devfn(pdev, i));
>> +		if (!vpdn) {
>>  			dev_warn(&pdev->dev, "%s: Cannot create firmware data for VF#%d\n",
>>  				 __func__, i);
>>  			return NULL;
>>  		}
>>  
>> -		pdn->vf_index = i;
>> +		vpdn->vf_index = i;
>> +		vpdn->vendor_id = pdn->vendor_id;
>> +		vpdn->device_id = pdn->device_id;
>> +		vpdn->class_code = pdn->class_code;
>> +		vpdn->pci_ext_config_space = 0;
>>  
>>  #ifdef CONFIG_EEH
>>  		/* Create the EEH device for the VF */
>> -		edev = eeh_dev_init(pdn);
>> +		edev = eeh_dev_init(vpdn);
>>  		BUG_ON(!edev);
>>  		edev->physfn = pdev;
>>  #endif /* CONFIG_EEH */
>>  	}
>>  #endif /* CONFIG_PCI_IOV */
>>  
>> -	return pci_get_pdn(pdev);
>> +	return pdn;
>>  }
>>  
>> -void remove_dev_pci_data(struct pci_dev *pdev)
>> +void pci_destroy_vf_pdns(struct pci_dev *pdev)
>>  {
>>  #ifdef CONFIG_PCI_IOV
>>  	struct pci_dn *parent;
>> diff --git a/arch/powerpc/platforms/powernv/pci-ioda.c b/arch/powerpc/platforms/powernv/pci-ioda.c
>> index ed500f51d449..979c901535f2 100644
>> --- a/arch/powerpc/platforms/powernv/pci-ioda.c
>> +++ b/arch/powerpc/platforms/powernv/pci-ioda.c
>> @@ -1720,14 +1720,14 @@ int pnv_pcibios_sriov_disable(struct pci_dev *pdev)
>>  	pnv_pci_sriov_disable(pdev);
>>  
>>  	/* Release PCI data */
>> -	remove_dev_pci_data(pdev);
>> +	pci_destroy_vf_pdns(pdev);
>>  	return 0;
>>  }
>>  
>>  int pnv_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>>  {
>>  	/* Allocate PCI data */
>> -	add_dev_pci_data(pdev);
>> +	pci_create_vf_pdns(pdev, num_vfs);
>>  
>>  	return pnv_pci_sriov_enable(pdev, num_vfs);
>>  }
>> diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platforms/pseries/pci.c
>> index 37a77e57893e..5e87596903a6 100644
>> --- a/arch/powerpc/platforms/pseries/pci.c
>> +++ b/arch/powerpc/platforms/pseries/pci.c
>> @@ -205,7 +205,7 @@ int pseries_pci_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>>  int pseries_pcibios_sriov_enable(struct pci_dev *pdev, u16 num_vfs)
>>  {
>>  	/* Allocate PCI data */
>> -	add_dev_pci_data(pdev);
>> +	pci_create_vf_pdns(pdev, num_vfs);
>>  	return pseries_pci_sriov_enable(pdev, num_vfs);
>>  }
>>  
>> @@ -217,7 +217,7 @@ int pseries_pcibios_sriov_disable(struct pci_dev *pdev)
>>  	/* Releasing pe_num_map */
>>  	kfree(pdn->pe_num_map);
>>  	/* Release PCI data */
>> -	remove_dev_pci_data(pdev);
>> +	pci_destroy_vf_pdns(pdev);
>>  	pci_vf_drivers_autoprobe(pdev, true);
>>  	return 0;
>>  }
> 

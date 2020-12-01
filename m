Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCEE42CB070
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 23:47:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cly0N0MQbzDqfk
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 09:47:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=aik@ozlabs.ru;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ozlabs.ru
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ozlabs-ru.20150623.gappssmtp.com
 header.i=@ozlabs-ru.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=ColslUh2; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClxyW61SRzDq63
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 09:45:36 +1100 (AEDT)
Received: by mail-pg1-x544.google.com with SMTP id o4so2160461pgj.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Dec 2020 14:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ozlabs-ru.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Ot2q/P1+rf39GkYCF83FTotBDDxAojkAY4NU2q4IyVA=;
 b=ColslUh2ui7Kx+vl5PL2UUTmCr7EHZOkK1QaiHhVHVDj0VKoOJYhR2giJmIyye1qZ6
 64DjBpo92Mk6JBd8isbmahhrSZGXDtbzDCPbIepRcJaQCDHs3W04HDJlv8b0jc1+l33C
 oMzE62wfGVOSoYz1XfIdl9/QMGf4x1WLeVlqLcIwUNa8PHLsYdmSzNFsWdupfY2YLyBY
 kvXjEHDBU7k0u270t+Nkoj86QT9TfMwa75WYZzjstULUVyukclElgXRVWpakiL2EM2kb
 TNJJizu/ivdOhNW112x1zIvyR+NLTKl0uLgImoARel+YABPEZTZDn7VRYDlFBXehGQBu
 AVZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ot2q/P1+rf39GkYCF83FTotBDDxAojkAY4NU2q4IyVA=;
 b=sYsXexat73RMn+qptAWl6MwgFq/YEqofNwRWZVR8+v2p3mBLlRaM9CfFFJ/4t4ZbYs
 ruPueOvqy48L9Znvf7AZepXuXl0uPz1EuAJP+Yj/E+MnVvy71QBwoWDXyURhGOyqxIbu
 rshdRHn8neGt36VmsPbkCVLvA2kWCj9w2NZXDK25W/nWW+SQVHP/8YJBH3ittncLOYmI
 dMZ9Fb/NNDMQ+556XLephsfU/H/AvxbfPBCAFNgEW7T0NK32RrDYzdddS/tr1XrqBw2b
 L3h28zkZQMfP0oUocAOUo483El6bsXEMlGt3SynSBAu3Zq4Rl8zPvj5QfV1z4trRcvmW
 +Eww==
X-Gm-Message-State: AOAM5321Jc4JukHhDJrNn/1sMx/eCy6TvnT4iouWc4ZfwpWUZKuLiVih
 68PoBH2huKO8Lz1j18lPyyKAdQ==
X-Google-Smtp-Source: ABdhPJx/bML42uRQVrldrDUyMeGG0Roxqh1+EZ6X115dSU4IFmlImJc+Lk5YRfkgjQTERGg/cMdJig==
X-Received: by 2002:a63:1c25:: with SMTP id c37mr4296280pgc.164.1606862733172; 
 Tue, 01 Dec 2020 14:45:33 -0800 (PST)
Received: from [0.0.0.0] (124-171-134-245.dyn.iinet.net.au. [124.171.134.245])
 by smtp.gmail.com with UTF8SMTPSA id
 y19sm573114pge.15.2020.12.01.14.45.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 01 Dec 2020 14:45:32 -0800 (PST)
Subject: Re: [PATCH kernel v2] powerpc/pci: Remove LSI mappings on device
 teardown
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20201201073919.5600-1-aik@ozlabs.ru>
 <350f6a85-77d8-c0bc-3ba5-f3fd3c50ffe1@kaod.org>
From: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-ID: <a36847f8-e8d5-5fe5-4dbe-8d0b5782e94c@ozlabs.ru>
Date: Wed, 2 Dec 2020 09:45:28 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:84.0) Gecko/20100101
 Thunderbird/84.0
MIME-Version: 1.0
In-Reply-To: <350f6a85-77d8-c0bc-3ba5-f3fd3c50ffe1@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 01/12/2020 20:31, Cédric Le Goater wrote:
> On 12/1/20 8:39 AM, Alexey Kardashevskiy wrote:
>> From: Oliver O'Halloran <oohall@gmail.com>
>>
>> When a passthrough IO adapter is removed from a pseries machine using hash
>> MMU and the XIVE interrupt mode, the POWER hypervisor expects the guest OS
>> to clear all page table entries related to the adapter. If some are still
>> present, the RTAS call which isolates the PCI slot returns error 9001
>> "valid outstanding translations" and the removal of the IO adapter fails.
>> This is because when the PHBs are scanned, Linux maps automatically the
>> INTx interrupts in the Linux interrupt number space but these are never
>> removed.
>>
>> This problem can be fixed by adding the corresponding unmap operation when
>> the device is removed. There's no pcibios_* hook for the remove case, but
>> the same effect can be achieved using a bus notifier.
>>
>> Because INTx are shared among PHBs (and potentially across the system),
>> this adds tracking of virq to unmap them only when the last user is gone.
>>
>> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>> [aik: added refcounter]
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> 
> Looks good to me and the system survives all the PCI hotplug tests I used
> to do on my first attempts to fix this issue.
> 
> One comment below,
> 
>> ---
>>
>>
>> Doing this in the generic irq code is just too much for my small brain :-/
> 
> may be more cleanups are required in the PCI/MSI/IRQ PPC layers before
> considering your first approach. You think too much in advance  !
> 
>>
>> ---
>>   arch/powerpc/kernel/pci-common.c | 71 ++++++++++++++++++++++++++++++++
>>   1 file changed, 71 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
>> index be108616a721..0acf17f17253 100644
>> --- a/arch/powerpc/kernel/pci-common.c
>> +++ b/arch/powerpc/kernel/pci-common.c
>> @@ -353,6 +353,55 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
>>   	return NULL;
>>   }
>>   
>> +struct pci_intx_virq {
>> +	int virq;
>> +	struct kref kref;
>> +	struct list_head list_node;
>> +};
>> +
>> +static LIST_HEAD(intx_list);
>> +static DEFINE_MUTEX(intx_mutex);
>> +
>> +static void ppc_pci_intx_release(struct kref *kref)
>> +{
>> +	struct pci_intx_virq *vi = container_of(kref, struct pci_intx_virq, kref);
>> +
>> +	list_del(&vi->list_node);
>> +	irq_dispose_mapping(vi->virq);
>> +	kfree(vi);
>> +}
>> +
>> +static int ppc_pci_unmap_irq_line(struct notifier_block *nb,
>> +			       unsigned long action, void *data)
>> +{
>> +	struct pci_dev *pdev = to_pci_dev(data);
>> +
>> +	if (action == BUS_NOTIFY_DEL_DEVICE) {
>> +		struct pci_intx_virq *vi;
>> +
>> +		mutex_lock(&intx_mutex);
>> +		list_for_each_entry(vi, &intx_list, list_node) {
>> +			if (vi->virq == pdev->irq) {
>> +				kref_put(&vi->kref, ppc_pci_intx_release);
>> +				break;
>> +			}
>> +		}
>> +		mutex_unlock(&intx_mutex);
>> +	}
>> +
>> +	return NOTIFY_DONE;
>> +}
>> +
>> +static struct notifier_block ppc_pci_unmap_irq_notifier = {
>> +	.notifier_call = ppc_pci_unmap_irq_line,
>> +};
>> +
>> +static int ppc_pci_register_irq_notifier(void)
>> +{
>> +	return bus_register_notifier(&pci_bus_type, &ppc_pci_unmap_irq_notifier);
>> +}
>> +arch_initcall(ppc_pci_register_irq_notifier);
>> +
>>   /*
>>    * Reads the interrupt pin to determine if interrupt is use by card.
>>    * If the interrupt is used, then gets the interrupt line from the
>> @@ -361,6 +410,12 @@ struct pci_controller *pci_find_controller_for_domain(int domain_nr)
>>   static int pci_read_irq_line(struct pci_dev *pci_dev)
>>   {
>>   	int virq;
>> +	struct pci_intx_virq *vi, *vitmp;
>> +
>> +	/* Preallocate vi as rewind is complex if this fails after mapping */
> 
> AFAICT, we only need to call irq_dispose_mapping() if allocation fails.

Today - yes but in the future (hierarchical domains or whatever other 
awesome thing we'll use from there) - not necessarily. Too much is 
hidden under irq_create_fwspec_mapping(). Thanks,



> If so, it would be simpler to isolate the code in a pci_intx_register(virq)
> helper and call it from pci_read_irq_line().
> 
>> +	vi = kzalloc(sizeof(struct pci_intx_virq), GFP_KERNEL);
>> +	if (!vi)
>> +		return -1;
>>   
>>   	pr_debug("PCI: Try to map irq for %s...\n", pci_name(pci_dev));
>>   
>> @@ -401,6 +456,22 @@ static int pci_read_irq_line(struct pci_dev *pci_dev)
>>   
>>   	pci_dev->irq = virq;
>>   
>> +	mutex_lock(&intx_mutex);
>> +	list_for_each_entry(vitmp, &intx_list, list_node) {
>> +		if (vitmp->virq == virq) {
>> +			kref_get(&vitmp->kref);
>> +			kfree(vi);
>> +			vi = NULL;
>> +			break;
>> +		}
>> +	}
>> +	if (vi) {
>> +		vi->virq = virq;
>> +		kref_init(&vi->kref);
>> +		list_add_tail(&vi->list_node, &intx_list);
>> +	}
>> +	mutex_unlock(&intx_mutex);
>> +
>>   	return 0;
>>   }
>>   
>>
> 

-- 
Alexey

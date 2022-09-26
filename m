Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88C55EA74F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 15:31:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MbkDn41Jlz2xk6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 23:31:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Ag8DQLYw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Ag8DQLYw;
	dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MbkD500cZz3bSS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 23:31:00 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id y136so6721938pfb.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 06:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=34HQrLL8XykXijqCilvfa/ZVCyRzZE9E0p6xKdWfTeo=;
        b=Ag8DQLYw38ZJFjAouHpldIsGACuyfIyg3iv1KabvFW4O/NFgMyd/MIVstO7Tu5g+dR
         5kCeQbxmLUc90D6YGJmyxMgwbzjxnAT/IyPujiKW9+EkYK8TqpUpPPx2thWR9kGr4/I1
         Wn7uHZrPk68/QqcpJpcw6DFYB2i1hBV7aMON/JZ/qmrIESIS30uO3tPIry8aA1tTHRLL
         gFEiY0juP/T20LxYztmsAYKc9RPSZa+p5MzYv57UIGJIxejr3xODwuEDdFJ9Onrcq8Lj
         M11yYOS+NVlC8fUTi+Qraum8Mqe61ZFhj9/ECWMhY3nOmvtkPPXZke1Eh7ryMrN4FzSs
         cacg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=34HQrLL8XykXijqCilvfa/ZVCyRzZE9E0p6xKdWfTeo=;
        b=f2ps0WZYRxZnFQNrzBnDUEheJfA/DMSsV2OVTd40XtsS3f9pplWl1GR1ALgObggsGR
         NElfE5+H8ZZIJ1//SndWQex6ys3m3VLRN7oXrGwRwkSbiHRN/aJb057fK76sIp+Q1fMt
         eql7i0+qtT6H4n867gYKKgk673s6oKRMQn4AebL9NZkqSB5KpVqm693R0PAMhPONSbgr
         sWOMOSO07GzPfnJSVUZxczsXlKxCVpFIJsvxT5uh8LkZScgVgClkmqgBJMvrw0YM7ji2
         XDM4bbU2D4bW079Aw7hVzMbF92IAD2dPgakcPsgO1ZsBZvMwmVOsWbFVWaZjqbAQ0IyP
         +qtA==
X-Gm-Message-State: ACrzQf1+S2DsHAeh1c7Xsq1FjdvbDhjYOAI0INpSSDwhs0ghC7EU/+qj
	B8plB3S90VvrGPCtVdYJURCqQQ==
X-Google-Smtp-Source: AMsMyM6wNwJOmdCGXbZfH43gSKLBF0mVhs6MvTeuko+W4iwox9xlUPH/fYVin5YduDxUiS8VTQzKnA==
X-Received: by 2002:a63:f014:0:b0:43c:2ad9:ae9 with SMTP id k20-20020a63f014000000b0043c2ad90ae9mr17458324pgh.8.1664199057079;
        Mon, 26 Sep 2022 06:30:57 -0700 (PDT)
Received: from [10.2.223.68] ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id q17-20020aa79831000000b0052d33bf14d6sm12427268pfl.63.2022.09.26.06.30.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 06:30:56 -0700 (PDT)
Message-ID: <5e094839-c643-d2e7-698e-0fb6c0e50c4f@bytedance.com>
Date: Mon, 26 Sep 2022 21:30:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH 1/3] PCI/AER: Use pci_aer_clear_uncorrect_error_status()
 to clear uncorrectable error status
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220922200202.GA1330813@bhelgaas>
From: Zhuo Chen <chenzhuo.1@bytedance.com>
In-Reply-To: <20220922200202.GA1330813@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, martin.petersen@oracle.com, linux-scsi@vger.kernel.org, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, Serge Semin <fancer.lancer@gmail.com>, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/23/22 4:02 AM, Bjorn Helgaas wrote:
> On Mon, Sep 12, 2022 at 01:09:05AM +0800, Zhuo Chen wrote:
>> On 9/12/22 12:22 AM, Serge Semin wrote:
>>> On Fri, Sep 02, 2022 at 02:16:32AM +0800, Zhuo Chen wrote:
>>>> Status bits for ERR_NONFATAL errors only are cleared in
>>>> pci_aer_clear_nonfatal_status(), but we want clear uncorrectable
>>>> error status in ntb_hw_idt.c and lpfc_attr.c. So we add
>>>> pci_aer_clear_uncorrect_error_status() and change to use it.
>>>
>>> What about the next drivers
>>>
>>> drivers/scsi/lpfc/lpfc_attr.c
>>> drivers/crypto/hisilicon/qm.c
>>> drivers/net/ethernet/intel/ice/ice_main.c
>>>
>>> which call the pci_aer_clear_nonfatal_status() method too?
>>
>> ‘pci_aer_clear_nonfatal_status()’ in
>> drivers/net/ethernet/intel/ice/ice_main.c has already been removed and
>> merged in kernel in: https://github.com/torvalds/linux/commit/ca415ea1f03abf34fc8e4cc5fc30a00189b4e776
> 
> It's better if you can use kernel.org URLs that don't depend on
> third parties like github, e.g.,
> 
>    https://git.kernel.org/linus/ca415ea1f03a
> 
Good reminder, I'll pay attention next time.

>> ‘pci_aer_clear_nonfatal_status()’ in drivers/crypto/hisilicon/qm.c will be
>> removed in the next kernel:
>> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/drivers/crypto/hisilicon/qm.c?id=00278564a60e11df8bcca0ececd8b2f55434e406
> 
> This is a problem because 00278564a60e ("crypto: hisilicon - Remove
> pci_aer_clear_nonfatal_status() call") is in Herbert's cryptodev tree,
> and if I apply this series to the PCI tree and Linus merges it before
> Herbert's cryptodev changes, it will break the build.
> 
> I think we need to split this patch up like this:
> 
>    - Add pci_aer_clear_uncorrect_error_status() to PCI core
>    - Convert dpc to use pci_aer_clear_uncorrect_error_status()
>      (I might end up squashing with above)
>    - Convert lpfc to use pci_aer_clear_uncorrect_error_status()
>    - Convert ntb_hw_idt to use pci_aer_clear_uncorrect_error_status()
>    - Unexport pci_aer_clear_nonfatal_status()
> 
> Then I can apply all but the last patch safely.  If the crypto changes
> are merged first, we can add the last one; otherwise we can do it for
> the next cycle.
> 
Good proposal. I will implement these in the next version.

Do I need to put pci related modifications (include patch 2/3 and 3/3) 
in a patch set or just single patches?

>> Uncorrectable error status register was intended to be cleared in
>> drivers/scsi/lpfc/lpfc_attr.c. But originally function was changed in https://github.com/torvalds/linux/commit/e7b0b847de6db161e3917732276e425bc92a2feb
>> and
>> https://github.com/torvalds/linux/commit/894020fdd88c1e9a74c60b67c0f19f1c7696ba2f
> 
> This will be a behavior change for lpfc and ntb_hw_idt.  It looks like
> it changes the behavior back to what it was before e7b0b847de6d
> ("PCI/AER: Clear only ERR_NONFATAL bits during non-fatal recovery"),
> so it might be OK, but splitting these out to their own patches will
> make the change more obvious and we can make sure that's what we want.
> 
> Bjorn

Thanks Bjorn, I will put lpfc and ntb_hw_idt changes in single patchs.
> 
>>>> Use pci_aer_clear_nonfatal_status() in dpc_process_error(), which has
>>>> no functional changes.
>>>>
>>>> Since pci_aer_clear_nonfatal_status() is used only internally, move
>>>> its declaration to the PCI internal header file. Also, no one cares
>>>> about return value of pci_aer_clear_nonfatal_status(), so make it void.
>>>>
>>>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>>>> ---
>>>>    drivers/ntb/hw/idt/ntb_hw_idt.c |  4 ++--
>>>>    drivers/pci/pci.h               |  2 ++
>>>>    drivers/pci/pcie/aer.c          | 23 ++++++++++++++++++-----
>>>>    drivers/pci/pcie/dpc.c          |  3 +--
>>>>    drivers/scsi/lpfc/lpfc_attr.c   |  4 ++--
>>>>    include/linux/aer.h             |  4 ++--
>>>>    6 files changed, 27 insertions(+), 13 deletions(-)
>>>>
>>>> diff --git a/drivers/ntb/hw/idt/ntb_hw_idt.c b/drivers/ntb/hw/idt/ntb_hw_idt.c
>>>> index 733557231ed0..de1dbbc5b9de 100644
>>>> --- a/drivers/ntb/hw/idt/ntb_hw_idt.c
>>>> +++ b/drivers/ntb/hw/idt/ntb_hw_idt.c
>>>> @@ -2657,8 +2657,8 @@ static int idt_init_pci(struct idt_ntb_dev *ndev)
>>>>    	ret = pci_enable_pcie_error_reporting(pdev);
>>>>    	if (ret != 0)
>>>>    		dev_warn(&pdev->dev, "PCIe AER capability disabled\n");
>>>
>>>> -	else /* Cleanup nonfatal error status before getting to init */
>>>> -		pci_aer_clear_nonfatal_status(pdev);
>>>> +	else /* Cleanup uncorrectable error status before getting to init */
>>>> +		pci_aer_clear_uncorrect_error_status(pdev);
>>>
>>>   From the IDT NTB PCIe initialization procedure point of view both of
>>> these methods are equivalent. So for the IDT NTB part:
>>>
>> IDT NTB part is the same as drivers/scsi/lpfc/lpfc_attr.c. The original
>> function is clear uncorrectable error status register including fatal and
>> non-fatal error status bits.
>>
>>> Acked-by: Serge Semin <fancer.lancer@gmail.com>
>>>
>>> -Sergey
>>>
>>>>    	/* First enable the PCI device */
>>>>    	ret = pcim_enable_device(pdev);
>>>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>>>> index e10cdec6c56e..574176f43025 100644
>>>> --- a/drivers/pci/pci.h
>>>> +++ b/drivers/pci/pci.h
>>>> @@ -686,6 +686,7 @@ void pci_aer_init(struct pci_dev *dev);
>>>>    void pci_aer_exit(struct pci_dev *dev);
>>>>    extern const struct attribute_group aer_stats_attr_group;
>>>>    void pci_aer_clear_fatal_status(struct pci_dev *dev);
>>>> +void pci_aer_clear_nonfatal_status(struct pci_dev *dev);
>>>>    int pci_aer_clear_status(struct pci_dev *dev);
>>>>    int pci_aer_raw_clear_status(struct pci_dev *dev);
>>>>    #else
>>>> @@ -693,6 +694,7 @@ static inline void pci_no_aer(void) { }
>>>>    static inline void pci_aer_init(struct pci_dev *d) { }
>>>>    static inline void pci_aer_exit(struct pci_dev *d) { }
>>>>    static inline void pci_aer_clear_fatal_status(struct pci_dev *dev) { }
>>>> +static inline void pci_aer_clear_nonfatal_status(struct pci_dev *dev) { }
>>>>    static inline int pci_aer_clear_status(struct pci_dev *dev) { return -EINVAL; }
>>>>    static inline int pci_aer_raw_clear_status(struct pci_dev *dev) { return -EINVAL; }
>>>>    #endif
>>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>>> index 7952e5efd6cf..d2996afa80f6 100644
>>>> --- a/drivers/pci/pcie/aer.c
>>>> +++ b/drivers/pci/pcie/aer.c
>>>> @@ -251,13 +251,13 @@ int pci_disable_pcie_error_reporting(struct pci_dev *dev)
>>>>    }
>>>>    EXPORT_SYMBOL_GPL(pci_disable_pcie_error_reporting);
>>>> -int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>>>> +void pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>>>>    {
>>>>    	int aer = dev->aer_cap;
>>>>    	u32 status, sev;
>>>>    	if (!pcie_aer_is_native(dev))
>>>> -		return -EIO;
>>>> +		return;
>>>>    	/* Clear status bits for ERR_NONFATAL errors only */
>>>>    	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &status);
>>>> @@ -265,10 +265,7 @@ int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>>>>    	status &= ~sev;
>>>>    	if (status)
>>>>    		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
>>>> -
>>>> -	return 0;
>>>>    }
>>>> -EXPORT_SYMBOL_GPL(pci_aer_clear_nonfatal_status);
>>>>    void pci_aer_clear_fatal_status(struct pci_dev *dev)
>>>>    {
>>>> @@ -286,6 +283,22 @@ void pci_aer_clear_fatal_status(struct pci_dev *dev)
>>>>    		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
>>>>    }
>>>> +int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
>>>> +{
>>>> +	int aer = dev->aer_cap;
>>>> +	u32 status;
>>>> +
>>>> +	if (!pcie_aer_is_native(dev))
>>>> +		return -EIO;
>>>> +
>>>> +	pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, &status);
>>>> +	if (status)
>>>> +		pci_write_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS, status);
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(pci_aer_clear_uncorrect_error_status);
>>>> +
>>>>    /**
>>>>     * pci_aer_raw_clear_status - Clear AER error registers.
>>>>     * @dev: the PCI device
>>>> diff --git a/drivers/pci/pcie/dpc.c b/drivers/pci/pcie/dpc.c
>>>> index 3e9afee02e8d..7942073fbb34 100644
>>>> --- a/drivers/pci/pcie/dpc.c
>>>> +++ b/drivers/pci/pcie/dpc.c
>>>> @@ -288,8 +288,7 @@ void dpc_process_error(struct pci_dev *pdev)
>>>>    		 dpc_get_aer_uncorrect_severity(pdev, &info) &&
>>>>    		 aer_get_device_error_info(pdev, &info)) {
>>>>    		aer_print_error(pdev, &info);
>>>> -		pci_aer_clear_nonfatal_status(pdev);
>>>> -		pci_aer_clear_fatal_status(pdev);
>>>> +		pci_aer_clear_uncorrect_error_status(pdev);
>>>>    	}
>>>>    }
>>>> diff --git a/drivers/scsi/lpfc/lpfc_attr.c b/drivers/scsi/lpfc/lpfc_attr.c
>>>> index 3caaa7c4af48..1ed8d1640325 100644
>>>> --- a/drivers/scsi/lpfc/lpfc_attr.c
>>>> +++ b/drivers/scsi/lpfc/lpfc_attr.c
>>>> @@ -4712,7 +4712,7 @@ static DEVICE_ATTR_RW(lpfc_aer_support);
>>>>     * Description:
>>>>     * If the @buf contains 1 and the device currently has the AER support
>>>>     * enabled, then invokes the kernel AER helper routine
>>>> - * pci_aer_clear_nonfatal_status() to clean up the uncorrectable
>>>> + * pci_aer_clear_uncorrect_error_status() to clean up the uncorrectable
>>>>     * error status register.
>>>>     *
>>>>     * Notes:
>>>> @@ -4738,7 +4738,7 @@ lpfc_aer_cleanup_state(struct device *dev, struct device_attribute *attr,
>>>>    		return -EINVAL;
>>>>    	if (phba->hba_flag & HBA_AER_ENABLED)
>>>> -		rc = pci_aer_clear_nonfatal_status(phba->pcidev);
>>>> +		rc = pci_aer_clear_uncorrect_error_status(phba->pcidev);
>>>>    	if (rc == 0)
>>>>    		return strlen(buf);
>>>> diff --git a/include/linux/aer.h b/include/linux/aer.h
>>>> index 97f64ba1b34a..f638ad955deb 100644
>>>> --- a/include/linux/aer.h
>>>> +++ b/include/linux/aer.h
>>>> @@ -44,7 +44,7 @@ struct aer_capability_regs {
>>>>    /* PCIe port driver needs this function to enable AER */
>>>>    int pci_enable_pcie_error_reporting(struct pci_dev *dev);
>>>>    int pci_disable_pcie_error_reporting(struct pci_dev *dev);
>>>> -int pci_aer_clear_nonfatal_status(struct pci_dev *dev);
>>>> +int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev);
>>>>    void pci_save_aer_state(struct pci_dev *dev);
>>>>    void pci_restore_aer_state(struct pci_dev *dev);
>>>>    #else
>>>> @@ -56,7 +56,7 @@ static inline int pci_disable_pcie_error_reporting(struct pci_dev *dev)
>>>>    {
>>>>    	return -EINVAL;
>>>>    }
>>>> -static inline int pci_aer_clear_nonfatal_status(struct pci_dev *dev)
>>>> +static inline int pci_aer_clear_uncorrect_error_status(struct pci_dev *dev)
>>>>    {
>>>>    	return -EINVAL;
>>>>    }
>>>> -- 
>>>> 2.30.1 (Apple Git-130)
>>>>
>>
>> -- 
>> Thanks,
>> Zhuo Chen

-- 
Thanks,
Zhuo Chen

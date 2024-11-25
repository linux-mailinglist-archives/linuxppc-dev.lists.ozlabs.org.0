Return-Path: <linuxppc-dev+bounces-3544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CC489D7B51
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2024 06:44:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XxZQB1qHhz2yYd;
	Mon, 25 Nov 2024 16:44:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732513442;
	cv=none; b=QxiPwxkIpS/xPduS9nk/z1Xt6d3cNZ4864Th5l82XuwFPN5UMNrKlJbH/jUazGRtsu7K+IsOfT07YqRFexMpBHa+uy0lpiGXioH3PuWMf9n74kmYtMUb9wGEUiOegntjhXwOJPfpIVDjeHv+b8+foBpaJHF8bHhsvrBgnOnTNJCzhGkopGOFoXXyGn3a4qPFfKpYK5DI+ztM8xoGAectktaH3qReZUYwIXHv4zc5gUgFhrECqC7OEF7g0snCF03XTzSVx8uz7iW0oqELb6vs5TyLSo0IPIJAVe+aPaAEHMHlugBGBXsK072eTyphM7nL55NtdtcRzCTOxB1ko2Qntw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732513442; c=relaxed/relaxed;
	bh=6BZaEez2/onj6k/5ttKm7P3puppd4NcQlJSNto8o0cM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=WVOk9uN3tMNIMTwszSrA+PjsibKgaH/YKfTU8d3In+cPJoQaMRaedfBye5+Dn5JCr+zeI5Y1wIpqkfrdsVqqXXcioHLJjGKrTYz6KRCJ+82DGmely9s4cPhWd0gyGT+ggU+GlNN1YzGDtCDSCif3JFQiws+Q1TQ+rYUrjqpL/z6RqPNck/HvDkUADRVb7ZmbCF3IEmHyLdyEdiUzV3FqYzzzEILrHl7LvDTZrqPab950rl1aGTPi8NUpmvNXd00rrNFPq2aKQhJr7vHJCKYflB0jF0c/0gMedyuqOiRO7wukGklcR57feQ2XgYXrULGA9vczxZde7NH6kXBtU0qS9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EItnEvB3; dkim-atps=neutral; spf=pass (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=EItnEvB3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.131; helo=out30-131.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XxZQ74QPJz2xvh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2024 16:43:51 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1732513426; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=6BZaEez2/onj6k/5ttKm7P3puppd4NcQlJSNto8o0cM=;
	b=EItnEvB3CL31iHaQ8h8ZcORR3RA/OarqsNpv7/ZiKqWD3aA5xmxEbK4e59sQ9IhfK3xpzA92VYKAjSi9QuGTxPq0ywrAVBqEh177Sms+nolIuiDVqQSATPH1UEqXG7EobXKB3xVHZU8kNYykp6MPFmAbImAFQnM/SeN3ipYZhkw=
Received: from 30.246.161.197(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WK6G9Wy_1732513422 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 25 Nov 2024 13:43:44 +0800
Message-ID: <11282df5-9126-4b5b-82ae-5f1ef3b8aaf5@linux.alibaba.com>
Date: Mon, 25 Nov 2024 13:43:42 +0800
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: "Bowman, Terry" <terry.bowman@amd.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 bhelgaas@google.com, kbusch@kernel.org, Lukas Wunner <lukas@wunner.de>
Cc: mahesh@linux.ibm.com, oohall@gmail.com,
 sathyanarayanan.kuppuswamy@linux.intel.com
References: <20241112135419.59491-1-xueshuai@linux.alibaba.com>
 <20241112135419.59491-3-xueshuai@linux.alibaba.com>
 <a76394c4-8746-46c0-9cb5-bf0e2e0aa9b5@amd.com>
 <22d27575-fc68-4a7f-9bce-45b91c7dfb98@linux.alibaba.com>
 <9810fadd-2b0b-410b-a8a6-89ddf7a103b9@linux.alibaba.com>
In-Reply-To: <9810fadd-2b0b-410b-a8a6-89ddf7a103b9@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



在 2024/11/17 21:36, Shuai Xue 写道:
> 
> 
> 在 2024/11/16 20:44, Shuai Xue 写道:
>>
>>
>> 在 2024/11/16 04:20, Bowman, Terry 写道:
>>> Hi Shuai,
>>>
>>>
>>> On 11/12/2024 7:54 AM, Shuai Xue wrote:
>>>> The AER driver has historically avoided reading the configuration space of
>>>> an endpoint or RCiEP that reported a fatal error, considering the link to
>>>> that device unreliable. Consequently, when a fatal error occurs, the AER
>>>> and DPC drivers do not report specific error types, resulting in logs like:
>>>>
>>>>    pcieport 0000:30:03.0: EDR: EDR event received
>>>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>>>    nvme nvme0: frozen state error detected, reset controller
>>>>    nvme 0000:34:00.0: ready 0ms after DPC
>>>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>>>
>>>> AER status registers are sticky and Write-1-to-clear. If the link recovered
>>>> after hot reset, we can still safely access AER status of the error device.
>>>> In such case, report fatal errors which helps to figure out the error root
>>>> case.
>>>>
>>>> After this patch, the logs like:
>>>>
>>>>    pcieport 0000:30:03.0: EDR: EDR event received
>>>>    pcieport 0000:30:03.0: DPC: containment event, status:0x0005 source:0x3400
>>>>    pcieport 0000:30:03.0: DPC: ERR_FATAL detected
>>>>    pcieport 0000:30:03.0: AER: broadcast error_detected message
>>>>    nvme nvme0: frozen state error detected, reset controller
>>>>    pcieport 0000:30:03.0: waiting 100 ms for downstream link, after activation
>>>>    nvme 0000:34:00.0: ready 0ms after DPC
>>>>    nvme 0000:34:00.0: PCIe Bus Error: severity=Uncorrectable (Fatal), type=Data Link Layer, (Receiver ID)
>>>>    nvme 0000:34:00.0:   device [144d:a804] error status/mask=00000010/00504000
>>>>    nvme 0000:34:00.0:    [ 4] DLP                    (First)
>>>>    pcieport 0000:30:03.0: AER: broadcast slot_reset message
>>>>
>>>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
>>>> ---
>>>>   drivers/pci/pci.h      |  3 ++-
>>>>   drivers/pci/pcie/aer.c | 11 +++++++----
>>>>   drivers/pci/pcie/dpc.c |  2 +-
>>>>   drivers/pci/pcie/err.c |  9 +++++++++
>>>>   4 files changed, 19 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
>>>> index 0866f79aec54..6f827c313639 100644
>>>> --- a/drivers/pci/pci.h
>>>> +++ b/drivers/pci/pci.h
>>>> @@ -504,7 +504,8 @@ struct aer_err_info {
>>>>       struct pcie_tlp_log tlp;    /* TLP Header */
>>>>   };
>>>> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info);
>>>> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
>>>> +                  bool link_healthy);
>>>>   void aer_print_error(struct pci_dev *dev, struct aer_err_info *info);
>>>>   #endif    /* CONFIG_PCIEAER */
>>>> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
>>>> index 13b8586924ea..97ec1c17b6f4 100644
>>>> --- a/drivers/pci/pcie/aer.c
>>>> +++ b/drivers/pci/pcie/aer.c
>>>> @@ -1200,12 +1200,14 @@ EXPORT_SYMBOL_GPL(aer_recover_queue);
>>>>    * aer_get_device_error_info - read error status from dev and store it to info
>>>>    * @dev: pointer to the device expected to have a error record
>>>>    * @info: pointer to structure to store the error record
>>>> + * @link_healthy: link is healthy or not
>>>>    *
>>>>    * Return 1 on success, 0 on error.
>>>>    *
>>>>    * Note that @info is reused among all error devices. Clear fields properly.
>>>>    */
>>>> -int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>>>> +int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info,
>>>> +                  bool link_healthy)
>>>>   {
>>>>       int type = pci_pcie_type(dev);
>>>>       int aer = dev->aer_cap;
>>>> @@ -1229,7 +1231,8 @@ int aer_get_device_error_info(struct pci_dev *dev, struct aer_err_info *info)
>>>>       } else if (type == PCI_EXP_TYPE_ROOT_PORT ||
>>>>              type == PCI_EXP_TYPE_RC_EC ||
>>>>              type == PCI_EXP_TYPE_DOWNSTREAM ||
>>>> -           info->severity == AER_NONFATAL) {
>>>> +           info->severity == AER_NONFATAL ||
>>>> +           (info->severity == AER_FATAL && link_healthy)) {
>>>>           /* Link is still healthy for IO reads */
>>>>           pci_read_config_dword(dev, aer + PCI_ERR_UNCOR_STATUS,
>>>> @@ -1258,11 +1261,11 @@ static inline void aer_process_err_devices(struct aer_err_info *e_info)
>>>>       /* Report all before handle them, not to lost records by reset etc. */
>>>>       for (i = 0; i < e_info->error_dev_num && e_info->dev[i]; i++) {
>>>> -        if (aer_get_device_error_info(e_info->dev[i], e_info))
>>>> +        if (aer_get_device_error_info(e_info->dev[i], e_info, false))
>>>>               aer_print_error(e_info->dev[i], e_info);
>>>>       }
>>>
>>> Would it be reasonable to detect if the link is intact and set the aer_get_device_error_info()
>>> function's 'link_healthy' parameter accordingly? I was thinking the port upstream capability
>>> link status register could be used to indicate the link viability.
>>>
>>> Regards,
>>> Terry
>>
>> Good idea. I think pciehp_check_link_active is a good implementation to check
>> link_healthy in aer_get_device_error_info().
>>
>>    int pciehp_check_link_active(struct controller *ctrl)
>>    {
>>        struct pci_dev *pdev = ctrl_dev(ctrl);
>>        u16 lnk_status;
>>        int ret;
>>        ret = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnk_status);
>>        if (ret == PCIBIOS_DEVICE_NOT_FOUND || PCI_POSSIBLE_ERROR(lnk_status))
>>            return -ENODEV;
>>        ret = !!(lnk_status & PCI_EXP_LNKSTA_DLLLA);
>>        ctrl_dbg(ctrl, "%s: lnk_status = %x\n", __func__, lnk_status);
>>        return ret;
>>    }
>>
>> Thank you for valuable comments.
>>
>> Best Regards
>> Shuai
> 
> Hi, Bowman,
> 
> After dive into the code details, I found that both dpc_reset_link() and
> aer_root_reset() use pci_bridge_wait_for_secondary_bus() to wait for secondary
> bus to be accessible. IMHO, pci_bridge_wait_for_secondary_bus() is better
> robustness than function like pciehp_check_link_active(). So I think
> reset_subordinates() is good boundary for delineating whether a link is
> accessible.
> 
> Besides, for DPC driver, the link status of upstream port, e.g, rootport, is
> inactive when DPC is triggered, and is recoverd to active until
> dpc_reset_link() success. But for AER driver, the link is active before and
> after aer_root_reset(). As a result, the AER status will be reported twice.
> 


Hi, Bowman, and Bjorn,

Do you have any feedback or other concern?

Thank you.

Best Regards,
Shuai



Return-Path: <linuxppc-dev+bounces-16386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oGBaDj71emnDAAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 06:50:54 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 467D9AC15C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jan 2026 06:50:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1pCZ5JXNz2yFl;
	Thu, 29 Jan 2026 16:50:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769665850;
	cv=none; b=N1sZHyUnKXxj4863kvD1fJcWE7yp/8hqc6DrAAspdEnappu8U42zrTIYK5PcCuhSkXdb8WBLg409BkZkpNtTS5QmZ4wzNStx/gTV2v3PN5ErHK0Pcc/ntQNfuy4bB8jdL6H2o/2WgdhWCEpY4xfVY6qhjcyvnzDECsjItLH5Yj8b6/T2c45vJ6DJZcugpils7CoBDHBDRSd5fKSk9G5hyUFBoJvFpdgdWU9vg0QTMS5SMrtY1X0rZj4uXkajNtNh8OcjSv9ZFEh+g8X4CK048X/EEGwSxCgXKunTvax8tQ7UOfYP6cO81jd2qk5MbTRJt8EHab3oZwKgYYHO3THSJA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769665850; c=relaxed/relaxed;
	bh=47L8+0gFyYpLebjc0X12jOfbcSPJ3pEN7OCUUjygrzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VfP3sSBcjQdb4hSndXVavME+MZjIMmVMIug4vMqVYYH50ZZHZnG2zAYpGoS72iETttyWyUIqbIXXUOLOytEPijCD2Vp6e0ZsyJS75UlPfNXl6EmZsY3FdU7AYt3qcQ6Cw5aiQPyHPZ2MROpViELv3wzYSDlb0DVkxoqY47CTxP44xuAMp1e/uxd3ywzKTmNKJPk+/wA1b1ULkO4cmqS88aZSmLxmkoJ4uYIbUHWTtP4NGChYVZtSz7yUF0lpy/ytWcR9y9t1CVurnuRZqx21qzikWrGt1zYQ/kn5KA6L7xJA9HJ/jnbKmk3TA86s18xrq8YyO9VuJ/A8jJjEKdPBTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=MjCL+UQn; dkim-atps=neutral; spf=pass (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=MjCL+UQn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1pCX0jdwz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 16:50:45 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1769665840; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=47L8+0gFyYpLebjc0X12jOfbcSPJ3pEN7OCUUjygrzE=;
	b=MjCL+UQnon6wXV/CmqVbtAPjkQcFiV+rA0QkZipJ3A1Ws0LwrnRONwKN72jyKfCluQD8vLpOVr29DAWa6pzbj6cG8CwU/5itHT283lx3ruGePYx+yvj/2Inbf4oU5GdhyIPdP24qPFIMzDNpREuw7SSG6EyRIgtLHq2fb1FSxpw=
Received: from 30.246.162.115(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wy6D9kt_1769665838 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 29 Jan 2026 13:50:39 +0800
Message-ID: <40cb885e-278a-43ee-a2ac-18c529256c45@linux.alibaba.com>
Date: Thu, 29 Jan 2026 13:49:58 +0800
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/5] PCI/DPC: Run recovery on device that detected the
 error
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com,
 oohall@gmail.com, terry.bowman@amd.com, tianruidong@linux.alibaba.com,
 lukas@wunner.de
References: <20260124074557.73961-1-xueshuai@linux.alibaba.com>
 <20260124074557.73961-3-xueshuai@linux.alibaba.com>
 <20260127102402.00004da2@huawei.com>
 <09cf1319-619d-4a6b-97f7-188c1a73aea0@linux.alibaba.com>
 <20260128150243.000012d8@huawei.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260128150243.000012d8@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-9.21 / 15.00];
	WHITELIST_DMARC(-7.00)[alibaba.com:D:+];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.alibaba.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[linux.alibaba.com:s=default];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16386-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jonathan.cameron@huawei.com,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:bhelgaas@google.com,m:kbusch@kernel.org,m:sathyanarayanan.kuppuswamy@linux.intel.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:terry.bowman@amd.com,m:tianruidong@linux.alibaba.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,google.com,kernel.org,linux.intel.com,linux.ibm.com,gmail.com,amd.com,linux.alibaba.com,wunner.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[xueshuai@linux.alibaba.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.alibaba.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.alibaba.com:mid,linux.alibaba.com:dkim,alibaba.com:email,intel.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 467D9AC15C
X-Rspamd-Action: no action



On 1/28/26 11:02 PM, Jonathan Cameron wrote:
> On Wed, 28 Jan 2026 20:27:31 +0800
> Shuai Xue <xueshuai@linux.alibaba.com> wrote:
> 
>> On 1/27/26 6:24 PM, Jonathan Cameron wrote:
>>> On Sat, 24 Jan 2026 15:45:54 +0800
>>> Shuai Xue <xueshuai@linux.alibaba.com> wrote:
>>>    
>>>> The current implementation of pcie_do_recovery() assumes that the
>>>> recovery process is executed for the device that detected the error.
>>>> However, the DPC driver currently passes the error port that experienced
>>>> the DPC event to pcie_do_recovery().
>>>>
>>>> Use the SOURCE ID register to correctly identify the device that
>>>> detected the error. When passing the error device, the
>>>> pcie_do_recovery() will find the upstream bridge and walk bridges
>>>> potentially AER affected. And subsequent commits will be able to
>>>> accurately access AER status of the error device.
>>>>
>>>> Should not observe any functional changes.
>>>>
>>>> Reviewed-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
>>>> Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Hi Shuai,
> 
>>>> ---
>>>>    drivers/pci/pci.h      |  2 +-
>>>>    drivers/pci/pcie/dpc.c | 25 +++++++++++++++++++++----
>>>>    drivers/pci/pcie/edr.c |  7 ++++---
>>>>    3 files changed, 26 insertions(+), 8 deletions(-)
>>>>
> ...
> 
>>>> -void dpc_process_error(struct pci_dev *pdev)
>>>> +/**
>>>> + * dpc_process_error - handle the DPC error status
>>>> + * @pdev: the port that experienced the containment event
>>>> + *
>>>> + * Return: the device that detected the error.
>>>> + *
>>>> + * NOTE: The device reference count is increased, the caller must decrement
>>>> + * the reference count by calling pci_dev_put().
>>>> + */
>>>> +struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>>>
>>> Maybe it makes sense to carry the err_port naming for the pci_dev
>>> in here as well?  Seems stronger than just relying on people
>>> reading the documentation you've added.
>>
>> Good point. I think renaming the parameter would improve clarity. However,
>> I'd prefer to handle it in a separate patch to keep this change focused on
>> the functional modification. Would that work for you?
>>
> Sure. Ideal would be a precursor patch, but if it's much easier to
> do on top of this I'm fine with that.
> 
> You are absolutely correct that it should be a separate patch!

Got it.

>>>      
>>>>    {
>>>>    	u16 cap = pdev->dpc_cap, status, source, reason, ext_reason;
>>>>    	struct aer_err_info info = {};
>>>> +	struct pci_dev *err_dev;
>>>>    
>>>>    	pci_read_config_word(pdev, cap + PCI_EXP_DPC_STATUS, &status);
>>>>    
>>>> @@ -279,6 +289,7 @@ void dpc_process_error(struct pci_dev *pdev)
>>>>    			pci_aer_clear_nonfatal_status(pdev);
>>>>    			pci_aer_clear_fatal_status(pdev);
>>>>    		}
>>>> +		err_dev = pci_dev_get(pdev);
>>>>    		break;
>>>>    	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE:
>>>>    	case PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE:
>>>> @@ -290,6 +301,8 @@ void dpc_process_error(struct pci_dev *pdev)
>>>>    				"ERR_FATAL" : "ERR_NONFATAL",
>>>>    			 pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
>>>>    			 PCI_SLOT(source), PCI_FUNC(source));
>>>> +		err_dev = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
>>>> +					    PCI_BUS_NUM(source), source & 0xff);
>>>
>>> Bunch of replication in her with the pci_warn(). Maybe some local variables?
>>> Maybe even rebuild the final parameter from PCI_DEVFN(slot, func) just to make the
>>> association with the print really obvious?
>>
>> Agreed. Here's the improved version:
>>
>> --- a/drivers/pci/pcie/dpc.c
>> +++ b/drivers/pci/pcie/dpc.c
>> @@ -293,17 +293,28 @@ struct pci_dev *dpc_process_error(struct pci_dev *pdev)
>>                   break;
>>           case PCI_EXP_DPC_STATUS_TRIGGER_RSN_NFE:
>>           case PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE:
>> -               pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID,
>> -                                    &source);
>> +       {
>> +               int domain, bus;
>> +               u8 slot, func, devfn;
>> +               const char *err_type;
>> +
>> +               pci_read_config_word(pdev, cap + PCI_EXP_DPC_SOURCE_ID, &source);
>> +
>> +               /* Extract source device location */
>> +               domain = pci_domain_nr(pdev->bus);
>> +               bus = PCI_BUS_NUM(source);
>> +               slot = PCI_SLOT(source);
>> +               func = PCI_FUNC(source);
>> +               devfn = PCI_DEVFN(slot, func);
>> +
>> +               err_type = (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
>> +                          "ERR_FATAL" : "ERR_NONFATAL";
>> +
>>                   pci_warn(pdev, "containment event, status:%#06x, %s received from %04x:%02x:%02x.%d\n",
>> -                        status,
>> -                        (reason == PCI_EXP_DPC_STATUS_TRIGGER_RSN_FE) ?
>> -                               "ERR_FATAL" : "ERR_NONFATAL",
>> -                        pci_domain_nr(pdev->bus), PCI_BUS_NUM(source),
>> -                        PCI_SLOT(source), PCI_FUNC(source));
>> -               err_dev = pci_get_domain_bus_and_slot(pci_domain_nr(pdev->bus),
>> -                                           PCI_BUS_NUM(source), source & 0xff);
>> +                        status, err_type, domain, bus, slot, func);
>> +               err_dev = pci_get_domain_bus_and_slot(domain, bus, devfn);
> Maybe don't bother with local variables for the things only used once.
> e.g.
> 
> 		err_dev = pci_get_domain_bus_and_slot(domain, bus, PCI_DEVFN(slot, func));
> 
> and possibly the same for err_type.
> 
> I don't mind though if you prefer to use locals for everything.

Sure, will remove local devfn and err_type.

> 
> 
> 
>>                   break;
>> +       }
>>           case PCI_EXP_DPC_STATUS_TRIGGER_RSN_IN_EXT:
>>                   ext_reason = status & PCI_EXP_DPC_STATUS_TRIGGER_RSN_EXT;
>>                   pci_warn(pdev, "containment event, status:%#06x: %s detected\n",
>>
>>>
>>> Is there any chance that this might return NULL?   Feels like maybe that's
>>> only a possibility on a broken setup, but I'm not sure of all the wonderful
>>> races around hotplug and DPC occurring before the OS has caught up.
>>
>> Surprise Down events are handled separately in
>> dpc_handle_surprise_removal() and won't reach dpc_process_error().
>> Please correct me if I missed anything.
> 
> Probably fine. I just didn't check particularly closely.
> 
> Jonathan


Thanks for valuable comments.

Best Regards,
Shuai



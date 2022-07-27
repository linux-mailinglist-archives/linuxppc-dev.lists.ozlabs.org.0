Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EFE582347
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 11:38:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lt7xY03nZz3cfW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Jul 2022 19:38:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BAhli0xR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::42f; helo=mail-pf1-x42f.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=BAhli0xR;
	dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lt7wv40c4z3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 19:37:34 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id d10so15620727pfd.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 02:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=vJn+MLWCsk+ei9hsjhMzOKCAi7lwMqHzERz4ilhjRd8=;
        b=BAhli0xR/K813sba6mxZ6qzpHkBuQ4XWkwcm3SYX26nlD7jupj4lyIm8AZWeSTrPTU
         uaNdRXX43CRPYE0tkW/2ileR6tI0bBEP3hf1Gb2uTf1dQGypO3EBgYByss0gfOR3mUZv
         P5/YmzgTICq86WARnnbyd6/1midmJWjkxayGrnR7TaNtYE87DBcqeKyXVMrzn5zQRc9q
         OoQMm93hby7hlcUQ/FBMFOnGABtmX17n4C4lArmjtRL6pgvbiKX5+vJbaIivq7YiUuHs
         WAo3aG1YsmNpvTQ7yZ/TmvahbK4tE5hDB+ARbVgHPrPYTVCXpkGHQ3usbGHYgP6NyQRt
         nDJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=vJn+MLWCsk+ei9hsjhMzOKCAi7lwMqHzERz4ilhjRd8=;
        b=0af6az1JhzDrqkbei7jFzZwBt6F6U3rvYSGbnyIOah/s7PyBQDoKyvRP3Mv/zahi3l
         f2D5YDdjo8odRv1wQoV90WmTgrFNfOolTfbtfj+RMMOqQL1iGSi0iuHmK20stXLGt2u6
         zW+z7iH23xDSZHzFBxfWaidPtmhStkB5oy+4v5e59Agag3Y9ub+fZDKxySLjevbAGd9J
         bsZlqNI4d4RbslC0XiqmUFuZ3raadpxU4dWVP4zIJgh9Gebk7pYUIi7+relwlewSI2z0
         nzq/Z4quTRZmAr6yvuX6bVS+ZNECS2AMx65ji62xUb9GXxc/+lVaF+kKxJpUrvvtsEMC
         w2Yw==
X-Gm-Message-State: AJIora9FdnVQ49jCCC4vcKY+A+r3hFWS49tTvuYz3qIRlQYrcn+C4EuO
	I6KgMZwoqco+8cHNptzZ3ZNljg==
X-Google-Smtp-Source: AGRyM1vpKLg/coFT9BHg45n8K+BH+qcz7PnJfDmPqrf9RdHbYZUKQkVRHlxrGkdE9u9DBN4Z6IWoXw==
X-Received: by 2002:a65:6398:0:b0:415:7d00:c1de with SMTP id h24-20020a656398000000b004157d00c1demr18665628pgv.610.1658914652147;
        Wed, 27 Jul 2022 02:37:32 -0700 (PDT)
Received: from [10.2.192.95] ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id i128-20020a636d86000000b0041a4df3d3e2sm11591867pgc.68.2022.07.27.02.37.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jul 2022 02:37:31 -0700 (PDT)
Message-ID: <b54b068b-fe9a-8609-3e9f-170579affc27@bytedance.com>
Date: Wed, 27 Jul 2022 17:37:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.0.3
Subject: Re: [PATCH v3] PCI/ERR: Use pcie_aer_is_native() to judge whether OS
 owns AER
Content-Language: en-US
From: Zhuo Chen <chenzhuo.1@bytedance.com>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
References: <20220727035334.9997-1-chenzhuo.1@bytedance.com>
 <b5c746db-f6a0-d89e-6db5-e4a206c9237a@linux.intel.com>
 <cfd44d9c-453b-e498-2630-9057947cf3cd@bytedance.com>
In-Reply-To: <cfd44d9c-453b-e498-2630-9057947cf3cd@bytedance.com>
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
Cc: chenzhuo.1@bytedance.com, jan.kiszka@siemens.com, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, lukas@wunner.de, oohall@gmail.com, stuart.w.hayes@gmail.com, bhelgaas@google.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/26/22 1:35 PM, Zhuo Chen wrote:
> 
> On 7/26/22 9:02 PM, Sathyanarayanan Kuppuswamy wrote:
>>
>>
>> On 7/26/22 8:53 PM, Zhuo Chen wrote:
>>> Use pcie_aer_is_native() in place of "host->native_aer ||
>>> pcie_ports_native" to judge whether OS has native control of AER
>>> in pcie_do_recovery().
>>>
>>> Replace "dev->aer_cap && (pcie_ports_native || host->native_aer)" in
>>> get_port_device_capability() with pcie_aer_is_native(), which has no
>>> functional changes.
>>>
>>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>>> ---
>>
>> Patch looks better now. It looks like following two changes
>> can also be replaced with pcie_aer_is_native() check.
>>
>> drivers/pci/pcie/aer.c:1407:    if ((host->native_aer || 
>> pcie_ports_native) && aer) {
>> drivers/pci/pcie/aer.c:1426:    if ((host->native_aer || 
>> pcie_ports_native) && aer) {
> 
> Good advice. But I wonder is there a scenario that dev->rcec ("root") is 
> NULL meanwhile dev->aer_cap is not NULL? If so, replace 
> "(host->native_aer || pcie_ports_native) && aer" with 
> pcie_aer_is_native() will change original function.
> 
Do you mean changing "if ((host->native_aer || pcie_ports_native) && 
aer)" into "if (pcie_aer_is_native(dev) && aer)" ?
I thought changing into "if (pcie_aer_is_native(dev))" before.

One another doubt. Not every pci device support aer. When dev->aer_cap 
is NULL and root->aer_cap is not NULL in aer_root_reset(), 
pcie_aer_is_native() will return false and OS cannot operate root 
register. It's different from just using "(host->native_aer || 
pcie_ports_native)".

Or we can change "if ((host->native_aer || pcie_ports_native) && aer)" 
into "if (pcie_aer_is_native(root))". But in this way, argument NULL 
pointer check should be added in pcie_aer_is_native().

>>
>>
>>
>>> Changelog:
>>> v3:
>>> - Simplify why we use pcie_aer_is_native().
>>> - Revert modification of pci_aer_clear_nonfatal_status() and comments.
>>> v2:
>>> - Add details and note in commit log.
>>> ---
>>>   drivers/pci/pcie/err.c          | 3 +--
>>>   drivers/pci/pcie/portdrv_core.c | 3 +--
>>>   2 files changed, 2 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
>>> index 0c5a143025af..121a53338e44 100644
>>> --- a/drivers/pci/pcie/err.c
>>> +++ b/drivers/pci/pcie/err.c
>>> @@ -184,7 +184,6 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev 
>>> *dev,
>>>       int type = pci_pcie_type(dev);
>>>       struct pci_dev *bridge;
>>>       pci_ers_result_t status = PCI_ERS_RESULT_CAN_RECOVER;
>>> -    struct pci_host_bridge *host = pci_find_host_bridge(dev->bus);
>>>       /*
>>>        * If the error was detected by a Root Port, Downstream Port, 
>>> RCEC,
>>> @@ -243,7 +242,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev 
>>> *dev,
>>>        * it is responsible for clearing this status.  In that case, the
>>>        * signaling device may not even be visible to the OS.
>>>        */
>>> -    if (host->native_aer || pcie_ports_native) {
>>> +    if (pcie_aer_is_native(dev)) {
>>>           pcie_clear_device_status(dev);
>>>           pci_aer_clear_nonfatal_status(dev);
>>>       }
>>> diff --git a/drivers/pci/pcie/portdrv_core.c 
>>> b/drivers/pci/pcie/portdrv_core.c
>>> index 604feeb84ee4..98c18f4a01b2 100644
>>> --- a/drivers/pci/pcie/portdrv_core.c
>>> +++ b/drivers/pci/pcie/portdrv_core.c
>>> @@ -221,8 +221,7 @@ static int get_port_device_capability(struct 
>>> pci_dev *dev)
>>>       }
>>>   #ifdef CONFIG_PCIEAER
>>> -    if (dev->aer_cap && pci_aer_available() &&
>>> -        (pcie_ports_native || host->native_aer)) {
>>> +    if (pcie_aer_is_native(dev) && pci_aer_available()) {
>>>           services |= PCIE_PORT_SERVICE_AER;
>>>           /*
>>
> 
> Thanks,
> Zhuo Chen

-- 
Thanks,
Zhuo Chen

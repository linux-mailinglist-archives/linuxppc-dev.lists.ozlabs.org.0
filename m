Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32EB95EC4BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 15:42:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McLQ93QM3z3cBk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 23:41:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LePq5aNy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::634; helo=mail-pl1-x634.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=LePq5aNy;
	dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McLPY3qfzz3blg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 23:41:20 +1000 (AEST)
Received: by mail-pl1-x634.google.com with SMTP id jm5so9077455plb.13
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 06:41:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=4pzwYFff+/gp6imXGz+Xr/QW1tSB5Pck/AS91fsmU3k=;
        b=LePq5aNygaRO4JwWo4786w9RJBPiOvEJaaocpUnMfXBoPwzGPk2aH8F8r0Y192UysC
         /GVZyqPuEod63zVf/SLGKIbUrkaA1NHkdRx5Ihl8zSriN6TdOCVIqyAOEWdTeu9SEJRm
         zVlJiU5ca/DSoQoraxCyph66is6b6yPPfVDrIOQX1R2GboUsqZXSN9giX+ystSq6zU+e
         OpFstFBRjZX66JhUETQen00Nqpf2MnEK2uhahuwX5CrCMMekAjTst7VBZrvM2mOVNWPu
         +cy5+6fA0vS8uG5yYR50nl8aenZjMrkYrvaFwhjmN9+DYFoG0v9UAN/K7Iu39dqeOnPp
         SjZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4pzwYFff+/gp6imXGz+Xr/QW1tSB5Pck/AS91fsmU3k=;
        b=cXSkJrB1JfsdMC/xUokU0xysnivRZ+S8157l9hqIdK68LU4OnZYAAYZem5+NKiBF6H
         j7nOmbXh/TNm2I9CTbe+sl4shC43aBtp0xnwWNvcdEhgvL2xCMo8JiGeTXaiuHKAGOkw
         Xb+UTe1WyHawaqdefFskQg8s4IcHsdif50giqV/wjRHdPmdZ+J2yKczl9aL50hcofqmX
         M1suNCCEjn1fvdgJJ3dyUlpTyuRNRw8hPRt4EZxUmJm73I8m+4REayte40AXHpnnn3q8
         99slXmqOc3xh//qyOOLQQesi99S6XvdJtmPB9ZmocvWN9ABQihyflnZbFfb/6/DySi/a
         rh1A==
X-Gm-Message-State: ACrzQf0SduGWAEXaPoe82PHNgHzLgf7YqYh8uKS1jCsyN90rull/oRZq
	KKEd1wfb9EL5J5pYW2Ejiq5/ZQ==
X-Google-Smtp-Source: AMsMyM77LunLFCmKosQx6Onu7WC4eGvOAvGGQe2jOricoTl6inaR33JtDw1CPTh3n9Pc1Mv0wYQf5g==
X-Received: by 2002:a17:90a:3f89:b0:205:a54e:2db8 with SMTP id m9-20020a17090a3f8900b00205a54e2db8mr4622868pjc.36.1664286078324;
        Tue, 27 Sep 2022 06:41:18 -0700 (PDT)
Received: from [10.2.223.68] ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id n16-20020a634d50000000b0042c0ffa0e62sm1516141pgl.47.2022.09.27.06.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 06:41:17 -0700 (PDT)
Message-ID: <97ac6c82-81a0-2f63-7d8f-e56d702bc874@bytedance.com>
Date: Tue, 27 Sep 2022 21:41:09 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [External] Re: [PATCH 2/3] PCI/ERR: Clear fatal status in
 pcie_do_recovery()
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220926180906.GA1609498@bhelgaas>
From: Zhuo Chen <chenzhuo.1@bytedance.com>
In-Reply-To: <20220926180906.GA1609498@bhelgaas>
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, jdmason@kudzu.us, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/27/22 2:09 AM, Bjorn Helgaas wrote:
> On Mon, Sep 26, 2022 at 10:01:55PM +0800, Zhuo Chen wrote:
>> On 9/23/22 5:08 AM, Bjorn Helgaas wrote:
>>> On Fri, Sep 02, 2022 at 02:16:33AM +0800, Zhuo Chen wrote:
>>>> When state is pci_channel_io_frozen in pcie_do_recovery(),
>>>> the severity is fatal and fatal status should be cleared.
>>>> So we add pci_aer_clear_fatal_status().
>>>
>>> Seems sensible to me.  Did you find this by code inspection or by
>>> debugging a problem?  If the latter, it would be nice to mention the
>>> symptoms of the problem in the commit log.
>>
>> I found this by code inspection so I may not enumerate what kind of problems
>> this code will cause.
>>>
>>>> Since pcie_aer_is_native() in pci_aer_clear_fatal_status()
>>>> and pci_aer_clear_nonfatal_status() contains the function of
>>>> 'if (host->native_aer || pcie_ports_native)', so we move them
>>>> out of it.
>>>
>>> Wrap commit log to fill 75 columns.
>>>
>>>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>>>> ---
>>>>    drivers/pci/pcie/err.c | 8 ++++++--
>>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
>>>> index 0c5a143025af..e0a8ade4c3fe 100644
>>>> --- a/drivers/pci/pcie/err.c
>>>> +++ b/drivers/pci/pcie/err.c
>>>> @@ -243,10 +243,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>>>    	 * it is responsible for clearing this status.  In that case, the
>>>>    	 * signaling device may not even be visible to the OS.
>>>>    	 */
>>>> -	if (host->native_aer || pcie_ports_native) {
>>>> +	if (host->native_aer || pcie_ports_native)
>>>>    		pcie_clear_device_status(dev);
>>>
>>> pcie_clear_device_status() doesn't check for pcie_aer_is_native()
>>> internally, but after 068c29a248b6 ("PCI/ERR: Clear PCIe Device Status
>>> errors only if OS owns AER") and aa344bc8b727 ("PCI/ERR: Clear AER
>>> status only when we control AER"), both callers check before calling
>>> it.
>>>
>>> I think we should move the check inside pcie_clear_device_status().
>>> That could be a separate preliminary patch.
>>>
>>> There are a couple other places (aer_root_reset() and
>>> get_port_device_capability()) that do the same check and could be
>>> changed to use pcie_aer_is_native() instead.  That could be another
>>> preliminary patch.
>>>
>> Good suggestion. But I have only one doubt. In aer_root_reset(), if we use
>> "if (pcie_aer_is_native(dev) && aer)", when dev->aer_cap
>> is NULL and root->aer_cap is not NULL, pcie_aer_is_native() will return
>> false. It's different from just using "(host->native_aer ||
>> pcie_ports_native)".
>> Or if we can use "if (pcie_aer_is_native(root))", at this time a NULL
>> pointer check should be added in pcie_aer_is_native() because root may be
>> NULL.
> 
> Good point.  In aer_root_reset(), we're updating Root Port registers,
> so I think they should look like:
> 
>    if (pcie_aer_is_native(root) && aer) {
>      ...
>    }
> 
> Does that seem safe and equivalent to you?
> 
> Bjorn

I think ‘if (aer && pcie_aer_is_native(root))’ might be safer,
because when root is NULL, 'aer' will be NUll as well, and the
predicate will return false without entering pcie_aer_is_native(root).


-- 
Thanks,
Zhuo Chen

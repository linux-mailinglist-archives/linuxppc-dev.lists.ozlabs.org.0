Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 924A55EA7D9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Sep 2022 16:02:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mbkwg4K1dz3c71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 00:02:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Cml+idqK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=chenzhuo.1@bytedance.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance-com.20210112.gappssmtp.com header.i=@bytedance-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Cml+idqK;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mbkw14k8Bz2yMj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 00:02:07 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 129so5206388pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 07:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1yGPnS7+tabIF9f3YGZrIJUzZlCgUowefj3Ak6tgbc8=;
        b=Cml+idqKmgZLlpiIB8rfPG/ng2lFM3Uc9sHJGoyFG7EKF7hZNke7PI/XfWak9pHRFi
         efod9Ah4zEqgORi+dMraA2Sbgo/pbkOsElfL2aD04OOna/C7XRrRxw0DfgIIfFkuQBtl
         cmmg93A0HBEzFfB1+OSXJZfXPeyzl0IgyhatrNNxgm2ohJf5RdnnNFXZNdgo7YaW0/yv
         LuuQM2kgG/3u1LhXdaEb1jXfGr5iRHnQ+eWfqiHMVUElxVxahOJVNf9IRTzA3BIZLfv3
         zqpVrMthiVdLVBUkfIC5c7/0nUDogIn6jR/lCahdK1UXLrg6UQyGo+qF4+waB/51xAs+
         2x6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1yGPnS7+tabIF9f3YGZrIJUzZlCgUowefj3Ak6tgbc8=;
        b=xiTEpUwLx57/E2+B5MMwTnsxbtMGIgfih0KACvDDJf2OJZbTJ0DO6ybKMLl99Uwxz1
         Z5yMnO5FiksMmRCOpj1btwbGTQbnUJJU0if/L7fNs0i55PC0FfqXkNVl5O2wU39nzlAa
         mq1fAS0JjBrCmPTnE8KdA7ub2iC6AHAneihL4/Gjn88J6wMCg/+CDjKUYmlPCc+pee+p
         5nRoIWjEJuvUhmicRpr/HsRaaFwnrrKTMyY4s4L/6JBR5pZXqD6MSiyOLSSUM4QRo+6q
         dum5ELl+aKdGe9dweTufPGvxQUAKmdk450QZNLpxSru9eqw1H6DhZJflC3Fu4O9IAx2+
         J3ew==
X-Gm-Message-State: ACrzQf1qp7sc3r++tJEl7nRkCON66kptoIrZ+iLZHoYMpyASXWOaBFhS
	G67+PJl+c5KmVx1PLpaZX1xnKQ==
X-Google-Smtp-Source: AMsMyM56mNVNCK934eTJEzhPKz0Kgne9owdo04+/JMJy5BNbxI/i4itBQ3mjMLHU+WUWOj1bBuUPqA==
X-Received: by 2002:aa7:9f0c:0:b0:546:c556:ac86 with SMTP id g12-20020aa79f0c000000b00546c556ac86mr23732346pfr.55.1664200924322;
        Mon, 26 Sep 2022 07:02:04 -0700 (PDT)
Received: from [10.2.223.68] ([61.120.150.77])
        by smtp.gmail.com with ESMTPSA id b15-20020a63d30f000000b004393cb720afsm10769098pgg.38.2022.09.26.07.01.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 07:02:03 -0700 (PDT)
Message-ID: <1de80c28-33ec-b1bd-a557-91e4166d2da7@bytedance.com>
Date: Mon, 26 Sep 2022 22:01:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH 2/3] PCI/ERR: Clear fatal status in pcie_do_recovery()
Content-Language: en-US
To: Bjorn Helgaas <helgaas@kernel.org>
References: <20220922210853.GA1335665@bhelgaas>
From: Zhuo Chen <chenzhuo.1@bytedance.com>
In-Reply-To: <20220922210853.GA1335665@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: allenbh@gmail.com, dave.jiang@intel.com, linux-scsi@vger.kernel.org, martin.petersen@oracle.com, linux-pci@vger.kernel.org, jejb@linux.ibm.com, jdmason@kudzu.us, james.smart@broadcom.com, fancer.lancer@gmail.com, linux-kernel@vger.kernel.org, ntb@lists.linux.dev, oohall@gmail.com, bhelgaas@google.com, dick.kennedy@broadcom.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/23/22 5:08 AM, Bjorn Helgaas wrote:
> On Fri, Sep 02, 2022 at 02:16:33AM +0800, Zhuo Chen wrote:
>> When state is pci_channel_io_frozen in pcie_do_recovery(),
>> the severity is fatal and fatal status should be cleared.
>> So we add pci_aer_clear_fatal_status().
> 
> Seems sensible to me.  Did you find this by code inspection or by
> debugging a problem?  If the latter, it would be nice to mention the
> symptoms of the problem in the commit log.

I found this by code inspection so I may not enumerate what kind of 
problems this code will cause.
> 
>> Since pcie_aer_is_native() in pci_aer_clear_fatal_status()
>> and pci_aer_clear_nonfatal_status() contains the function of
>> 'if (host->native_aer || pcie_ports_native)', so we move them
>> out of it.
> 
> Wrap commit log to fill 75 columns.
> 
>> Signed-off-by: Zhuo Chen <chenzhuo.1@bytedance.com>
>> ---
>>   drivers/pci/pcie/err.c | 8 ++++++--
>>   1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
>> index 0c5a143025af..e0a8ade4c3fe 100644
>> --- a/drivers/pci/pcie/err.c
>> +++ b/drivers/pci/pcie/err.c
>> @@ -243,10 +243,14 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>   	 * it is responsible for clearing this status.  In that case, the
>>   	 * signaling device may not even be visible to the OS.
>>   	 */
>> -	if (host->native_aer || pcie_ports_native) {
>> +	if (host->native_aer || pcie_ports_native)
>>   		pcie_clear_device_status(dev);
> 
> pcie_clear_device_status() doesn't check for pcie_aer_is_native()
> internally, but after 068c29a248b6 ("PCI/ERR: Clear PCIe Device Status
> errors only if OS owns AER") and aa344bc8b727 ("PCI/ERR: Clear AER
> status only when we control AER"), both callers check before calling
> it.
> 
> I think we should move the check inside pcie_clear_device_status().
> That could be a separate preliminary patch.
> 
> There are a couple other places (aer_root_reset() and
> get_port_device_capability()) that do the same check and could be
> changed to use pcie_aer_is_native() instead.  That could be another
> preliminary patch.
> 
Good suggestion. But I have only one doubt. In aer_root_reset(), if we 
use "if (pcie_aer_is_native(dev) && aer)", when dev->aer_cap
is NULL and root->aer_cap is not NULL, pcie_aer_is_native() will return 
false. It's different from just using "(host->native_aer ||
pcie_ports_native)".
Or if we can use "if (pcie_aer_is_native(root))", at this time a NULL 
pointer check should be added in pcie_aer_is_native() because root may 
be NULL.

> 
>> +	if (state == pci_channel_io_frozen)
>> +		pci_aer_clear_fatal_status(dev);
>> +	else
>>   		pci_aer_clear_nonfatal_status(dev);
>> -	}
>> +
>>   	pci_info(bridge, "device recovery successful\n");
>>   	return status;
>>   
>> -- 
>> 2.30.1 (Apple Git-130)
>>

-- 
Thanks,
Zhuo Chen

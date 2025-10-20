Return-Path: <linuxppc-dev+bounces-13057-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57E9CBF1627
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 14:59:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqwVS134yz303B;
	Mon, 20 Oct 2025 23:59:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760965152;
	cv=none; b=Q611338ICM+fH9n2L9X7hwBRkzJ00ySWSjgumvTVzubTqjGoBcl2zmxDHjZbiYkOQS1Lb4EGu0Yol2eGzLExgYCzmHTGUmSlFEi+lkfs1OjgoV6V040zOQ1Y7odcIa/3QaTT7LRrEHEqoEFcdjIT0Bul1tyb4t/DXqJKRMwNk8n6wsRD9ODq7c3+TP/jscPC8tOGYJQLQP0rwqKgaxXjHB8u8JEIp6Mj6/b1mmh7o1E6HzbqxZXgA7W+TGTKJvmNw/pw9vSSPg0PaG4QqefHdAr9JKpMdI8gKz57cc4UzNaizM9V3DldEULpl0Il2LpRjlE3iCOcZa9ImC1utgh+Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760965152; c=relaxed/relaxed;
	bh=NUZ4OFbIPKN0hupA12avsNJ58g3zFU3PpdC+1cMmplk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=POWHEzkrVqA/h39/uQ7c6+3O2ZbdBTQkdixNpeGdqy4yAAmY59hBVpGPL2/W7PfvKk8GP8W9+50WD7J2PsLOl83+As/Q7pwxMTFZnca8jRA8oYmC9uesGt1VJhtzqcbuntQskuLF6zlz9XtWUJfDoeJPc+zv1x3iBsNkd9u3Mr1+px/Cg1mLXYWYOM7zFnGWxeCp8l77Azyp/m4LDp/BJ0Xkzq5skK13HbKgXNDiMyHAmqJyn1qLsF5ThM+VzQrK6YGF4GV57eJ1SQPDVhfNzZyaHU38oug9NyWDryYmv4Og0yGv8ZzFNQNSdpjqb2a3H901Mz7rcYfhxkz4iSNNJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=B3BcaTow; dkim-atps=neutral; spf=pass (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=B3BcaTow;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqwVP3WKZz300M
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Oct 2025 23:59:07 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760965143; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NUZ4OFbIPKN0hupA12avsNJ58g3zFU3PpdC+1cMmplk=;
	b=B3BcaTowIMWqF86BXWABKb5ZKXA2rMaGGy1l4XTLov0f4lkzimUnI9OI/4h/dp6BGNnLPxeRRbD6lpYObKXXka9/fcTlF6uRi2haF6zkGfxlggVhHZNO9R/iOoBrCWzAhJns85ubqA7B2PyY9ejubQRtvDZf67UhN+UBXJySDSQ=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqcKlem_1760965140 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 20 Oct 2025 20:59:01 +0800
Message-ID: <6d7143a3-196f-49f8-8e71-a5abc81ae84b@linux.alibaba.com>
Date: Mon, 20 Oct 2025 20:58:55 +0800
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
Subject: Re: [PATCH v6 3/5] PCI/AER: Report fatal errors of RCiEP and EP if
 link recoverd
To: Lukas Wunner <lukas@wunner.de>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, bhelgaas@google.com, kbusch@kernel.org,
 sathyanarayanan.kuppuswamy@linux.intel.com, mahesh@linux.ibm.com,
 oohall@gmail.com, Jonathan.Cameron@huawei.com, terry.bowman@amd.com,
 tianruidong@linux.alibaba.com
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
 <20251015024159.56414-4-xueshuai@linux.alibaba.com>
 <aPYKe1UKKkR7qrt1@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aPYKe1UKKkR7qrt1@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/20 18:10, Lukas Wunner 写道:
> On Wed, Oct 15, 2025 at 10:41:57AM +0800, Shuai Xue wrote:
>> +++ b/drivers/pci/pcie/err.c
>> @@ -253,6 +254,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>   			pci_warn(bridge, "subordinate device reset failed\n");
>>   			goto failed;
>>   		}
>> +
>> +		/* Link recovered, report fatal errors of RCiEP or EP */
>> +		if (state == pci_channel_io_frozen &&
>> +		    (type == PCI_EXP_TYPE_ENDPOINT || type == PCI_EXP_TYPE_RC_END)) {
>> +			aer_add_error_device(&info, dev);
>> +			info.severity = AER_FATAL;
>> +			if (aer_get_device_error_info(&info, 0, true))
>> +				aer_print_error(&info, 0);
>> +			pci_dev_put(dev);
>> +		}
>>   	}

Hi, Lukas,

> 
> Where is the the pci_dev_get() to balance the pci_dev_put() here?

The corresponding pci_dev_get() is called in add_error_device(). Please
refer to commit 60271ab044a5 ("PCI/AER: Take reference on error
devices") which introduced this reference counting mechanism.

> 
> It feels awkward to leak AER-specific details into pcie_do_recovery().
> That function is supposed to implement the flow described in
> Documentation/PCI/pci-error-recovery.rst in a platform-agnostic way
> so that powerpc (EEH) and s390 could conceivably take advantage of it.
> 
> Can you find a way to avoid this, e.g. report errors after
> pcie_do_recovery() has concluded?

I understand your concern about keeping pcie_do_recovery()
platform-agnostic. I explored the possibility of reporting errors after
recovery concludes, but unfortunately, this approach isn't feasible due
to the recovery sequence. The issue is that most drivers'
pci_error_handlers implement .slot_reset() which internally calls
pci_restore_state() to restore the device's configuration space and
state. This function also clears the device's AER status registers:

   .slot_reset()
     => pci_restore_state()
       => pci_aer_clear_status()

Therefore, the only window to capture and report the original error
information is between link recovery (after reset_subordinates()) and
before .slot_reset() is called. Once .slot_reset() executes, the error
status is cleared and lost forever.

> 
> I'm also worried that errors are reported *during* recovery.
> I imagine this looks confusing to a user.  The logged messages
> should make it clear that these are errors that occurred *earlier*
> and are reported belatedly.

You raise an excellent point about potential user confusion. The current
aer_print_error() interface doesn't indicate that these are historical
errors being reported belatedly. Would it be acceptable to add a
clarifying message before calling aer_print_error()? For example:

   pci_err(dev, "Reporting error that occurred before recovery:\n");

Alternatively, if you have suggestions for a better approach to make
this timing clear to users, I'd be happy to implement them.

> 
> Thanks,
> 
> Lukas

Thanks for valuable comments.

Best Regards,
Shuai


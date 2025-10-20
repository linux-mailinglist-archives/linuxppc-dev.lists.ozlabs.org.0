Return-Path: <linuxppc-dev+bounces-13061-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE4EBF1CA2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 16:17:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqyDj1dRmz304h;
	Tue, 21 Oct 2025 01:17:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.111
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760969845;
	cv=none; b=McwT9rPXOf17ay3VVu8mNnRg+gaFYA++SH9KvfSXQypX6+alErHgZAFB7EFGOhcESltDEFotwIZYiFti8N/EvJ7qG33lfucCxhYcGX68IB+pF9TwmiD8oX83YVtjajrl0WALPLwHJqYYfziKiJz1cKofo10iS1tDIJCWhcAkWjyyVvMEuhObKpnrarFO4Y1z8ffIx9KoHZVp/IqB6sGJon6otN6CBmS+x49uBu00NKUEiD7aVZCE5ZOSKc1F4jImYxXSw3ckQMnnD+wcgvecUBwpVv91hcBH65sFISXj72xGWvbkCqtAsFX3GDL7Rm3wjZ4xjh8UKfcNp/AgnYI82A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760969845; c=relaxed/relaxed;
	bh=L9u+mE9dC3rDy2AZuVZ/h7CRM8UL4x5A0aYpGW6XD4U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LtJYsv2O4spUmDplfnWvhsXyG5rwu5T371L5tkZtBlzTW4C+vgux1rYk9USAOd8hMY4UQZtdvetgFIhz3/6q6a8CMHr0wcW1b/RC25OBjVm6Q5c4W7fD51eYzic+LrWdHoEd3jhJF6YVdvyzCl3CB+b8rD8LiHjZ5qf6TCbKxWEnGXdA6Mg/WT+E7Y8B3eZRXru+dF2GqIZFTXBXK7TH+ycVjly/VWUA5WCeQX7ROgSZRW+0EvVBkM+YV24VmGKIf4WX8s9z2FPb6rn1CzM+QGb/9+dzwpxtsT6fpqnBAFDakZabusNNpbbOKEcnwVMMbGW+59FwvYTY2saLDg8Eyg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=arsEOfHt; dkim-atps=neutral; spf=pass (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=arsEOfHt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.111; helo=out30-111.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqyDg0DjTz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 01:17:21 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760969837; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=L9u+mE9dC3rDy2AZuVZ/h7CRM8UL4x5A0aYpGW6XD4U=;
	b=arsEOfHtqGvD7GeP+vl7vGf0XQjzpIDDZAS0ijz8ZAQH88P4deMRnvTobS/OTIKrhsbQBkMFBbpGUdDoNer63dJwJqYfDsEd+WkniXJlNEM0alrT0QiTjXkyKKyNVwGIVjV7DKskrEEF1Lx7g6XvLkiUBm/OVe+0N5ehDA01QZw=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqchTRM_1760969834 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 20 Oct 2025 22:17:15 +0800
Message-ID: <43390d36-147f-482c-b31a-d02c2624061f@linux.alibaba.com>
Date: Mon, 20 Oct 2025 22:17:10 +0800
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
 <6d7143a3-196f-49f8-8e71-a5abc81ae84b@linux.alibaba.com>
 <aPY--DJnNam9ejpT@wunner.de>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aPY--DJnNam9ejpT@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi, Lukas,

在 2025/10/20 21:54, Lukas Wunner 写道:
> On Mon, Oct 20, 2025 at 08:58:55PM +0800, Shuai Xue wrote:
>> ??? 2025/10/20 18:10, Lukas Wunner ??????:
>>> On Wed, Oct 15, 2025 at 10:41:57AM +0800, Shuai Xue wrote:
>>>> +++ b/drivers/pci/pcie/err.c
>>>> @@ -253,6 +254,16 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
>>>>    			pci_warn(bridge, "subordinate device reset failed\n");
>>>>    			goto failed;
>>>>    		}
>>>> +
>>>> +		/* Link recovered, report fatal errors of RCiEP or EP */
>>>> +		if (state == pci_channel_io_frozen &&
>>>> +		    (type == PCI_EXP_TYPE_ENDPOINT || type == PCI_EXP_TYPE_RC_END)) {
>>>> +			aer_add_error_device(&info, dev);
>>>> +			info.severity = AER_FATAL;
>>>> +			if (aer_get_device_error_info(&info, 0, true))
>>>> +				aer_print_error(&info, 0);
>>>> +			pci_dev_put(dev);
>>>> +		}
>>>
>>> Where is the the pci_dev_get() to balance the pci_dev_put() here?
>>
>> The corresponding pci_dev_get() is called in add_error_device(). Please
>> refer to commit 60271ab044a5 ("PCI/AER: Take reference on error
>> devices") which introduced this reference counting mechanism.
> 
> That is non-obvious and needs a code comment.

Agreed. I'll add a comment to clarify the reference counting relationship.

> 
>>> It feels awkward to leak AER-specific details into pcie_do_recovery().
>>> That function is supposed to implement the flow described in
>>> Documentation/PCI/pci-error-recovery.rst in a platform-agnostic way
>>> so that powerpc (EEH) and s390 could conceivably take advantage of it.
>>>
>>> Can you find a way to avoid this, e.g. report errors after
>>> pcie_do_recovery() has concluded?
>>
>> I understand your concern about keeping pcie_do_recovery()
>> platform-agnostic.
> 
> The code you're adding above, with the exception of the check for
> pci_channel_io_frozen, should live in a helper in aer.c.
> Then you also don't need to rename add_error_device().

Good point.

That's a much cleaner approach. I'll create a helper function in aer.c,
something like:

void aer_report_frozen_error(struct pci_dev *dev)
{
     struct aer_err_info info;

     if (dev->pci_type != PCI_EXP_TYPE_ENDPOINT &&
         dev->pci_type != PCI_EXP_TYPE_RC_END)
         return;

     aer_info_init(&info);
     aer_add_error_device(&info, dev);
     info.severity = AER_FATAL;
     if (aer_get_device_error_info(&info, 0, true))
         aer_print_error(&info, 0);

     /* pci_dev_put() pairs with pci_dev_get() in aer_add_error_device() */
     pci_dev_put(dev);
}

>> I explored the possibility of reporting errors after
>> recovery concludes, but unfortunately, this approach isn't feasible due
>> to the recovery sequence. The issue is that most drivers'
>> pci_error_handlers implement .slot_reset() which internally calls
>> pci_restore_state() to restore the device's configuration space and
>> state. This function also clears the device's AER status registers:
>>
>>    .slot_reset()
>>      => pci_restore_state()
>>        => pci_aer_clear_status()
> 
> This was added in 2015 by b07461a8e45b.  The commit claims that
> the errors are stale and can be ignored.  It turns out they cannot.
> 
> So maybe pci_restore_state() should print information about the
> errors before clearing them?

While that could work, we would lose the error severity information at
that point, which could lead to duplicate or less informative error
messages compared to what the AER driver provides. The helper function
approach preserves all error details for proper reporting.

> 
> Actually pci_restore_state() is only supposed to restore state,
> as the name implies, and not clear errors.  It seems questionable
> that the commit amended it to do that.
> 
>>> I'm also worried that errors are reported *during* recovery.
>>> I imagine this looks confusing to a user.  The logged messages
>>> should make it clear that these are errors that occurred *earlier*
>>> and are reported belatedly.
>>
>> You raise an excellent point about potential user confusion. The current
>> aer_print_error() interface doesn't indicate that these are historical
>> errors being reported belatedly. Would it be acceptable to add a
>> clarifying message before calling aer_print_error()? For example:
>>
>>    pci_err(dev, "Reporting error that occurred before recovery:\n");
> 
> Yes, something like that.  "Errors reported prior to reset"?  Dunno.

I'll use "Errors reported prior to reset" - it's clear and concise.

> 
> Thanks,
> 
> Lukas

Thanks.
Shuai


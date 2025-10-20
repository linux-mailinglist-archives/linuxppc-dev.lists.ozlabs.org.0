Return-Path: <linuxppc-dev+bounces-13066-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DB8BF2102
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Oct 2025 17:21:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cqzfN2wcsz304h;
	Tue, 21 Oct 2025 02:21:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760973676;
	cv=none; b=LrQs+szHzE7B7/KG3zQyCTdxIQv8JNFCCCR31dMACyyFlI/Wkm3pwk07l23jTOkh8/JmIZTu6EENsQARtLVI7rBH1qVr6LOAzPq2U9tjbGgLEmVIQGYR32XL0HUao4OMyYijyTf2rJZ2MIJU6AdaqNY22MIwLqluTETwe7F+mNQwhrkqdHMNddK74hbWISY2DiMg1IdqDig+Ww0N325G9VMNit/C5cl0AwZZJh13QwOaqmoffgwpMwpoFgU+ZMjp0p420/ohvow9S74M8IBSqDJHUJufSh5wu4afZ8lKdaSRrpCUgQpyCZ8UzaZ3MObokVO7hlYF9qoGuAWvRg7EFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760973676; c=relaxed/relaxed;
	bh=Vou/dzf4KP++tes6RLuekqGJp6PWAI7RQxEaTe2LEz4=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=jzH52XMyodSn6v5gpcF9f1l7bt1TWSmOXP5Jdb7a1fGarrL7DTWVT2srSY3zfsWpc1uYMOT0zxjC40i16nJ+6Bhh65Yevio4pklNZi4NIq4RiX08H9SOGS1ngyZPl+vJC1tx6H+SFZ1YcljU+zLzZLcILCP0mkCwPHz9gj5awMVsC9aGSFZ6rgNy0H6jITVMOD4/zBfUms+/x/BsjZTJaWJvZAWiD2iH0mHi8Cq+E83JPVBfdvnwV4Sd8zpW4Rs3tuMJn9Iq8Aqaa+/HEgvsxMqzXRqhM5sCawY92+vd/xCyJILVoyeQ6HQEefGw+8dDsUD0d3oKci0w51Okxys3nw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FwOLkydk; dkim-atps=neutral; spf=pass (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=FwOLkydk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cqzfL1yQYz2yrm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Oct 2025 02:21:12 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760973668; h=Message-ID:Date:MIME-Version:From:Subject:To:Content-Type;
	bh=Vou/dzf4KP++tes6RLuekqGJp6PWAI7RQxEaTe2LEz4=;
	b=FwOLkydkVJ0wD3mbTRfBIdWiSOLx78ssHQSy9EBOJw6TB+lRjhUGxOk7VriZK544FEvvzQ6uy3+z9wiL12wZlsoK7YgDKXJ9Jhz6SjHgNRo1SdJzmauIdjfiZF3diLXbdDCA0r1iBBcp3yvVcw8WBZf67bwNwWeH335ea43+XWs=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqdMvSw_1760973662 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 20 Oct 2025 23:21:03 +0800
Message-ID: <30fe11dd-3f21-4a61-adb0-74e39087c84c@linux.alibaba.com>
Date: Mon, 20 Oct 2025 23:20:58 +0800
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
From: Shuai Xue <xueshuai@linux.alibaba.com>
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
 <43390d36-147f-482c-b31a-d02c2624061f@linux.alibaba.com>
 <aPZGNP79kJO74W4J@wunner.de>
In-Reply-To: <aPZGNP79kJO74W4J@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/20 22:24, Lukas Wunner 写道:
> On Mon, Oct 20, 2025 at 10:17:10PM +0800, Shuai Xue wrote:
>> void aer_report_frozen_error(struct pci_dev *dev)
>> {
>>      struct aer_err_info info;
>>
>>      if (dev->pci_type != PCI_EXP_TYPE_ENDPOINT &&
>>          dev->pci_type != PCI_EXP_TYPE_RC_END)
>>          return;
>>
>>      aer_info_init(&info);
>>      aer_add_error_device(&info, dev);
>>      info.severity = AER_FATAL;
>>      if (aer_get_device_error_info(&info, 0, true))
>>          aer_print_error(&info, 0);
>>
>>      /* pci_dev_put() pairs with pci_dev_get() in aer_add_error_device() */
>>      pci_dev_put(dev);
>> }

Hi Lukas,
> 
> Much better.  Again, I think you don't need to rename add_error_device()
> and then the code comment even fits on the same line:

Good point. I'll keep the original function name and use the one-line
comment format.

> 
> 	pci_dev_put(dev);  /* pairs with pci_dev_get() in add_error_device() */
> 
>>>>     .slot_reset()
>>>>       => pci_restore_state()
>>>>         => pci_aer_clear_status()
>>>
>>> This was added in 2015 by b07461a8e45b.  The commit claims that
>>> the errors are stale and can be ignored.  It turns out they cannot.
>>>
>>> So maybe pci_restore_state() should print information about the
>>> errors before clearing them?
>>
>> While that could work, we would lose the error severity information at
> 
> Wait, we've got that saved in pci_cap_saved_state, so we could restore
> the severity register, report leftover errors, then clear those errors?

You're right that the severity register is also sticky, so we could
retrieve error severity directly from AER registers.

However, I have concerns about implementing this approach:

1. Scope creep: The current implementation is explicit - we know we're
in an AER error recovery path and intentionally report the missed fatal
errors. Your suggestion would make error reporting implicit during any
device state restoration.

2. Wider impact: pci_save_state() and pci_restore_state() are used
extensively beyond AER error handling - in power management, reset
operations, and various driver flows. Adding error reporting to
pci_restore_state() could generate unexpected error messages in
non-error scenarios.

3. Architectural consistency: As you noted earlier, "pci_restore_state()
is only supposed to restore state, as the name implies, and not clear
errors." Adding error reporting to this function would further violate
this principle - we'd be making it do even more than just restore state.

Would you prefer I implement this broader change, or shall we proceed
with the targeted helper function approach for now? The helper function
solves the immediate problem while keeping the changes focused on the
AER recovery path.

> Thanks,
> 
> Lukas

Thanks.
Shuai


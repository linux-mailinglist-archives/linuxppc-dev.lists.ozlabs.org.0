Return-Path: <linuxppc-dev+bounces-14790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21372CC1744
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 09:07:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVqKc3XTYz2yDY;
	Tue, 16 Dec 2025 19:07:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.112
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765872452;
	cv=none; b=Rv4FQqNhVXqkBcwA4EI4vPrl4hNnoM/RX1TdqMsJF9Bzp0FzGqr6EnlRSAxjoDNGxRzOPRDksEOpYkeLONijNMEtXwgbObcyJRtgtpZXBnSymmFLEWFVBNjtrnAbwinGVnvRLggirS9yPRFU0xaR9Enot1FJYMPb799H9W8dnHibs0n2sgStWi9z9NbVLM+fcy+fT7LHlZeaAVZrYCq87AHb5uwLQqq2tVD9W2NElFS6pGjb6sUpQ0oIPcGsueTjyhYop0eH6BHEquR1VY+kjNpjDpPSqr5+TvCYYD1z/JLqdaFN8kP0WyteWukvBHBBDFW13TL445jrJEEXAAnU1A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765872452; c=relaxed/relaxed;
	bh=VK8v6s5J2+yoFDoXd7lb+JbjMFecehdYTMKnXz9FpIA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=a1xYRkEz2uz+8ZTYeLyKAcvRnvL+0UjMjdmf501mOJ/FqD3reWGBODxq42kPz2BYfcQZxpdcgM7BOLk6YpemlpjTHl3XFcLEXRn2YRwQQChQPbyJGYv8Wkih0ntuxPPGb/ZOrJl505ck3zm4nEBJuTJ7wHOawCQu+X2OlXplpMo3OUOA9tM/dmPA58yB2flVkKu4sBrsSQf1vHgpO5w6TNpljD6XDYA2b/eInx8Ee/itCvV8qv/Yh5FZsTkkLa+FsbuQhoc3llIAx2ygf5Sfc0tcsbz4Fv5D2GuRDrk+DrPPuAXZxnQwn+mIwMBPNnULyeGAxAyogzMweMs5hl3d8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CmIQTym1; dkim-atps=neutral; spf=pass (client-ip=115.124.30.112; helo=out30-112.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=CmIQTym1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.112; helo=out30-112.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVqKZ3PSkz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 19:07:28 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1765872444; h=Message-ID:Date:MIME-Version:Subject:From:To:Content-Type;
	bh=VK8v6s5J2+yoFDoXd7lb+JbjMFecehdYTMKnXz9FpIA=;
	b=CmIQTym19/ZHb18sEEO/WfoAC05DXN2NVM1RCLUq9NPK5RFyam6nH6ASer7pHcyeXeSmWNqrexwoQFkNkGEgKfKJqY2CtiN2Zg6WVJ5VvEyf52ASXOFehUhUCv3KvDXIzfovoiwMHlSCAWPo+WhEEIZcsK//ZefzJ5OvtG9cgQE=
Received: from 30.246.178.18(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WuyWDB0_1765872441 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 16 Dec 2025 16:07:22 +0800
Message-ID: <789970ab-c675-498b-899e-d0d37ddfbc17@linux.alibaba.com>
Date: Tue, 16 Dec 2025 16:07:21 +0800
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
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: Lukas Wunner <lukas@wunner.de>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kbusch@kernel.org,
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
 <30fe11dd-3f21-4a61-adb0-74e39087c84c@linux.alibaba.com>
 <aPoIDW_Yt90VgHL8@wunner.de>
 <239a003e-24dc-4e75-b677-a2c596b31c32@linux.alibaba.com>
In-Reply-To: <239a003e-24dc-4e75-b677-a2c596b31c32@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/24 14:43, Shuai Xue 写道:
> 
> 
> 在 2025/10/23 18:48, Lukas Wunner 写道:
>> On Mon, Oct 20, 2025 at 11:20:58PM +0800, Shuai Xue wrote:
>>> 2025/10/20 22:24, Lukas Wunner:
>>>> On Mon, Oct 20, 2025 at 10:17:10PM +0800, Shuai Xue wrote:
>>>>>>>      .slot_reset()
>>>>>>>        => pci_restore_state()
>>>>>>>          => pci_aer_clear_status()
>>>>>>
>>>>>> This was added in 2015 by b07461a8e45b.  The commit claims that
>>>>>> the errors are stale and can be ignored.  It turns out they cannot.
>>>>>>
>>>>>> So maybe pci_restore_state() should print information about the
>>>>>> errors before clearing them?
>>>>>
>>>>> While that could work, we would lose the error severity information at
>>>>
>>>> Wait, we've got that saved in pci_cap_saved_state, so we could restore
>>>> the severity register, report leftover errors, then clear those errors?
>>>
>>> You're right that the severity register is also sticky, so we could
>>> retrieve error severity directly from AER registers.
>>>
>>> However, I have concerns about implementing this approach:
>> [...]
>>> 3. Architectural consistency: As you noted earlier, "pci_restore_state()
>>> is only supposed to restore state, as the name implies, and not clear
>>> errors." Adding error reporting to this function would further violate
>>> this principle - we'd be making it do even more than just restore state.
>>>
>>> Would you prefer I implement this broader change, or shall we proceed
>>> with the targeted helper function approach for now? The helper function
>>> solves the immediate problem while keeping the changes focused on the
>>> AER recovery path.
>>
>> My opinion is that b07461a8e45b was wrong and that reported errors
>> should not be silently ignored. 
> 
> Thanks for your input and for discussing the history of commit
> b07461a8e45b. I understand its intention to ignore errors specifically
> during enumeration. As far as I know, AdvNonFatalErr events can occur in
> this phase and typically should be ignored to simplify handling.
> 
>> What I'd prefer is that if
>> pci_restore_state() discovers unreported errors, it asks the AER driver
>> to report them.
>>
>> We've already got a helper to do that:  aer_recover_queue()
>> It queues up an entry in AER's kfifo and asks AER to report it.
>>
>> So far the function is only used by GHES.  GHES allocates the
>> aer_regs argument from ghes_estatus_pool using gen_pool_alloc().
>> Consequently aer_recover_work_func() uses ghes_estatus_pool_region_free()
>> to free the allocation.  That prevents using aer_recover_queue()
>> for anything else than GHES.  It would first be necessary to
>> refactor aer_recover_queue() + aer_recover_work_func() such that
>> it can cope with arbitrary allocations (e.g. kmalloc()).
> 
> I agree that aer_recover_queue() and aer_recover_work_func() offer a
> generalized way to report errors.
> 
> However, I’d like to highlight some concerns regarding error discovery
> during pci_restore_state():
> 
> - Errors During Enumeration via Hotplug: Errors such as AdvNonFatalErr
>    seen during enumeration or hotplug are generally intended to be
>    ignored, as handling them adds unnecessary complexity without
>    practical benefits.
> 
> - Errors During Downstream Port Containment (DPC): When an error is
>    detected and not masked, it is expected to propagate through the usual
>    AER path, either reported directly to the OS or to the firmware.
>    Finally, these errors should be cleared and reported in a single
>    cohesive step.
> 
> For missed fatal errors during DPC, queuing additional work to report
> these errors using aer_recover_queue() could introduce significant
> overhead. Specifically: It may result in the bus being reset and the
> device reset again, which could unnecessarily disrupt system operation.
> 
> Do we really need the heavy way?
> 
> I would appreciate more feedback from the community on whether queuing
> another recovery task for errors detected during pci_restore_state()
> 

Hi, ALL,

Gentle ping.

Any feedback is welcomed.

Thanks.
Shuai



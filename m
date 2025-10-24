Return-Path: <linuxppc-dev+bounces-13253-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C4AC048AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Oct 2025 08:44:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ctCzr0k0jz30RJ;
	Fri, 24 Oct 2025 17:44:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.97
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761288247;
	cv=none; b=PlMA11XY2R63CqO2svZQ8U+D6vmdC/vKHzo4GcKEH5n3n2VjQRLLCmac7O6Vl8sB90T6Q6FPSSwN0MOo47f/O4I5XhYWq5eMChcpTv+yOs5MD/CozaJ2pcRPOc+QonPVF3+yHlpx+wBkYtl+js1q/sR5TFbHGhgmxsiawIkFEFtsPWO0FkBwcztF798nJeN6z2zkp3SnYnaj2SW57TDiZlLaRNYYKVG52RM33UdF1sJpObClVAyXHyAJjg4vzW46//vAQ32M8KhCHca2/UOZx6KmyqUFmRT1IhlhHdV199q8uN/eZf9iqp7vu8lU0vz8CuoCAL15R/kHmzV8r21KiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761288247; c=relaxed/relaxed;
	bh=+PtR/2mY5lY5Xflgf0MxYoKPmgArqRLPqH9rrelUPf8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyEsRjdiOoc/cN5b3ChOE41oFjHUCNbUL0tc0WzBtazcIs3Px2Hz4gUWmDruf6dBIXMyxZJ+0wdtPQRYTyn7dYmKnRt5sj5BpmJdDqfyvTcVUwe60AbOj9fBC4i3EH47RqwuUYD3Pg0tNZVmecINOlxr61eE1D55RUFApyy9l4Be8dvacgmY8LNu3fIyKwnqTORc3SqR23nM3qBZ7akijZ05B6ln53nMfpj6rtPJwECxc4/2r5wbW0MCvYBDi3kERJtdBw5NJdT39NsiI0qcObCv6PVbxKvOtzRdD5ewJPUrgx6WbcI8lgbM1XKhvt2De2HA47TpDWTFue0Tpp0qBg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=eqtq3pMv; dkim-atps=neutral; spf=pass (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=eqtq3pMv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.97; helo=out30-97.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-97.freemail.mail.aliyun.com (out30-97.freemail.mail.aliyun.com [115.124.30.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ctCzp0MjGz2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Oct 2025 17:44:04 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1761288239; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=+PtR/2mY5lY5Xflgf0MxYoKPmgArqRLPqH9rrelUPf8=;
	b=eqtq3pMvgRKFBySECegqLHdneaPqEG86UdC89Z5SLaEq4btk0MWMzkoFxVe13evrmOBdQ7sij+OmTZiy44ng0l3+XF73Z/VOfjuevjpOP5LC70Q3ETsY2QhNEMmP53vsC8hfF2cToCWhlRTySevhwjTqAaOYqXArYfoF6U5olkE=
Received: from 30.246.161.241(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqtPi1u_1761288236 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 24 Oct 2025 14:43:57 +0800
Message-ID: <239a003e-24dc-4e75-b677-a2c596b31c32@linux.alibaba.com>
Date: Fri, 24 Oct 2025 14:43:56 +0800
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
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <aPoIDW_Yt90VgHL8@wunner.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/10/23 18:48, Lukas Wunner 写道:
> On Mon, Oct 20, 2025 at 11:20:58PM +0800, Shuai Xue wrote:
>> 2025/10/20 22:24, Lukas Wunner:
>>> On Mon, Oct 20, 2025 at 10:17:10PM +0800, Shuai Xue wrote:
>>>>>>      .slot_reset()
>>>>>>        => pci_restore_state()
>>>>>>          => pci_aer_clear_status()
>>>>>
>>>>> This was added in 2015 by b07461a8e45b.  The commit claims that
>>>>> the errors are stale and can be ignored.  It turns out they cannot.
>>>>>
>>>>> So maybe pci_restore_state() should print information about the
>>>>> errors before clearing them?
>>>>
>>>> While that could work, we would lose the error severity information at
>>>
>>> Wait, we've got that saved in pci_cap_saved_state, so we could restore
>>> the severity register, report leftover errors, then clear those errors?
>>
>> You're right that the severity register is also sticky, so we could
>> retrieve error severity directly from AER registers.
>>
>> However, I have concerns about implementing this approach:
> [...]
>> 3. Architectural consistency: As you noted earlier, "pci_restore_state()
>> is only supposed to restore state, as the name implies, and not clear
>> errors." Adding error reporting to this function would further violate
>> this principle - we'd be making it do even more than just restore state.
>>
>> Would you prefer I implement this broader change, or shall we proceed
>> with the targeted helper function approach for now? The helper function
>> solves the immediate problem while keeping the changes focused on the
>> AER recovery path.
> 
> My opinion is that b07461a8e45b was wrong and that reported errors
> should not be silently ignored. 

Thanks for your input and for discussing the history of commit
b07461a8e45b. I understand its intention to ignore errors specifically
during enumeration. As far as I know, AdvNonFatalErr events can occur in
this phase and typically should be ignored to simplify handling.

> What I'd prefer is that if
> pci_restore_state() discovers unreported errors, it asks the AER driver
> to report them.
> 
> We've already got a helper to do that:  aer_recover_queue()
> It queues up an entry in AER's kfifo and asks AER to report it.
> 
> So far the function is only used by GHES.  GHES allocates the
> aer_regs argument from ghes_estatus_pool using gen_pool_alloc().
> Consequently aer_recover_work_func() uses ghes_estatus_pool_region_free()
> to free the allocation.  That prevents using aer_recover_queue()
> for anything else than GHES.  It would first be necessary to
> refactor aer_recover_queue() + aer_recover_work_func() such that
> it can cope with arbitrary allocations (e.g. kmalloc()).

I agree that aer_recover_queue() and aer_recover_work_func() offer a
generalized way to report errors.

However, I’d like to highlight some concerns regarding error discovery
during pci_restore_state():

- Errors During Enumeration via Hotplug: Errors such as AdvNonFatalErr
   seen during enumeration or hotplug are generally intended to be
   ignored, as handling them adds unnecessary complexity without
   practical benefits.

- Errors During Downstream Port Containment (DPC): When an error is
   detected and not masked, it is expected to propagate through the usual
   AER path, either reported directly to the OS or to the firmware.
   Finally, these errors should be cleared and reported in a single
   cohesive step.

For missed fatal errors during DPC, queuing additional work to report
these errors using aer_recover_queue() could introduce significant
overhead. Specifically: It may result in the bus being reset and the
device reset again, which could unnecessarily disrupt system operation.

Do we really need the heavy way?

I would appreciate more feedback from the community on whether queuing
another recovery task for errors detected during pci_restore_state()

Thanks
Shuai


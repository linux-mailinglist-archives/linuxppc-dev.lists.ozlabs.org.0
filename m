Return-Path: <linuxppc-dev+bounces-10418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFCEB132B9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Jul 2025 03:08:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4br0jK0tcFz30Lt;
	Mon, 28 Jul 2025 11:08:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.98
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753664917;
	cv=none; b=dK4DarnBMyoVn5Uoq2kLPcM4Ns1hQrVT/sxGPoJ1BXpMRtDvA7Vfpj12M9rvjnM5jv6704k3lkbmX+w7TIrM+dBZd0x/zxpG31PXVIHRVgy6XtZSkhufzXnkeHkaUXPEV4YJzhufVuaZeF5t6tp0RrD8jPProoLo19BmiGeVsH7uuxYfsdg7Bl4l1qYtWBa/vYSNflCmphmZvJjB0zVDiTvAdDP6so3oHhtp7S8HGoljMSPpIQTgrg+nUgcV0xdPo+KhgWvH5mRl/bvnDp5IE7hrxnS7u4TgkLXkr6ObCzQA2ml2WVx51tpk6f0iBdWYv8YH+K2edMTTBzpfGdzf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753664917; c=relaxed/relaxed;
	bh=2Iz/DOKZWtt9pD+4iMxQ3XO3FM24VBfncMNR3ZAeizA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jsgVgjqA0jnYWwLae4c+AUG0Cjt+KeC3FxUhWTKdOyMh5KMsebuIJQpgq92m4kQxSarg0Mn1aRIxtd4JC5WoVuRcaCxrJr+EVQKaNuGf6mYcb9IZFAdBWA1qMgS04oEwjGA/h6wfecbRiH5J4Imz8tRWqLNoAhio3A9BgkQG1qIsL1eu/JYaBhIdJS6HvNJnprcleV6SIVQ64JMvXiS+ol472Azl/pjZASjW4jMlY0jc7W6DEaSK5KpL2l6R71OT8LUKHtzQThIu7t13sw0UY7gVzuvAKxyyaA3pJkCFRzMtzYRh0MqtwAx9chxpTj210bLm1Xae0o4siCF58SoBkA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PuBMBSBk; dkim-atps=neutral; spf=pass (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=PuBMBSBk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.98; helo=out30-98.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4br0jH0jwPz307K
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Jul 2025 11:08:33 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753664909; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=2Iz/DOKZWtt9pD+4iMxQ3XO3FM24VBfncMNR3ZAeizA=;
	b=PuBMBSBkhCxErNk9uPJ6nGaYQsVdKIwMgaVODejGEYlsYEkgkCKpPb2nRy9QJYB7OlcS8OgUOKeekP7cvdszW0Mjd/njgeDCJHTUnoQF7P+2Z2xkKd7fYSUogtbijMaG8MlfQfPQQ/J1DTgHvyrKNkALtSiC56H+kIfDlX3sb40=
Received: from 30.246.181.19(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WkBBPjH_1753664905 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 28 Jul 2025 09:08:26 +0800
Message-ID: <4ef01be1-44b2-4bf5-afec-a90d4f71e955@linux.alibaba.com>
Date: Mon, 28 Jul 2025 09:08:25 +0800
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
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
To: Breno Leitao <leitao@debian.org>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Robert Moore <robert.moore@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 acpica-devel@lists.linux.dev, osandov@osandov.com, konrad.wilk@oracle.com,
 linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, kernel-team@meta.com
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
 <7ce9731a-b212-4e27-8809-0559eb36c5f2@linux.alibaba.com>
 <4qh2wbcbzdajh2tvki26qe4tqjazmyvbn7v7aqqhkxpitdrexo@ucch4ppo7i4e>
 <fdb5dced-ea5a-48b8-bbb4-fc3ade7f3df8@linux.alibaba.com>
 <ldlansfiesfxf4a6dzp5z2etquz5jgiq6ttx3al6q7sesgros6@xh4lkevbzsow>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <ldlansfiesfxf4a6dzp5z2etquz5jgiq6ttx3al6q7sesgros6@xh4lkevbzsow>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/7/26 00:16, Breno Leitao 写道:
> Hello Shuai,
> 
> On Fri, Jul 25, 2025 at 03:40:58PM +0800, Shuai Xue wrote:
>>>> APEI does not define an error type named GHES. GHES is just a kernel
>>>> driver name. Many hardware error types can be handled in GHES (see
>>>> ghes_do_proc), for example, AER is routed by GHES when firmware-first
>>>> mode is used. As far as I know, firmware-first mode is commonly used in
>>>> production. Should GHES errors be categorized into AER, memory, and CXL
>>>> memory instead?
>>>
>>> I also considered slicing the data differently initially, but then
>>> realized it would add more complexity than necessary for my needs.
>>>
>>> If you believe we should further subdivide the data, I’m happy to do so.
>>>
>>> You’re suggesting a structure like this, which would then map to the
>>> corresponding CPER_SEC_ sections:
>>>
>>> 	enum hwerr_error_type {
>>> 	HWERR_RECOV_AER,     // maps to CPER_SEC_PCIE
>>> 	HWERR_RECOV_MCE,     // maps to default MCE + CPER_SEC_PCIE
>>
>> CPER_SEC_PCIE is typo?
> 
> Correct, HWERR_RECOV_MCE would map to the regular MCE and not errors
> coming from GHES.
> 
>>> 	HWERR_RECOV_CXL,     // maps to CPER_SEC_CXL_*
>>> 	HWERR_RECOV_MEMORY,  // maps to CPER_SEC_PLATFORM_MEM
>>> 	}
>>>
>>> Additionally, what about events related to CPU, Firmware, or DMA
>>> errors—for example, CPER_SEC_PROC, CPER_SEC_FW, CPER_SEC_DMAR? Should we
>>> include those in the classification as well?
>>
>> I would like to split a error from ghes to its own type,
>> it sounds more reasonable. I can not tell what happened from HWERR_RECOV_AERat all :(
> 
> Makes sense. Regarding your answer, I suppose we might want to have
> something like the following:
> 
> 	enum hwerr_error_type {
> 		HWERR_RECOV_MCE,     // maps to errors in do_machine_check()
> 		HWERR_RECOV_CXL,     // maps to CPER_SEC_CXL_
> 		HWERR_RECOV_PCI,     // maps to AER (pci_dev_aer_stats_incr()) and CPER_SEC_PCIE and CPER_SEC_PCI
> 		HWERR_RECOV_MEMORY,  // maps to CPER_SEC_PLATFORM_MEM_
> 		HWERR_RECOV_CPU,     // maps to CPER_SEC_PROC_
> 		HWERR_RECOV_DMA,     // maps to CPER_SEC_DMAR_
> 		HWERR_RECOV_OTHERS,  // maps to CPER_SEC_FW_, CPER_SEC_DMAR_,
> 	}
> 
> Is this what you think we should track?
> 
> Thanks
> --breno

It sounds good to me.

Thanks.
Shuai



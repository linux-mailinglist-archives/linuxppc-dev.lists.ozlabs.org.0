Return-Path: <linuxppc-dev+bounces-10401-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D15B1194E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 09:41:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpKYm6HDBz3bTf;
	Fri, 25 Jul 2025 17:41:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753429276;
	cv=none; b=B3vYqwci1I56AW9pH0KDHJDa7uawTAGwzge27KS95Xl8VBwxezr4oLWaSIaVd2azZtHjCNEqhjw9DG3Lyh9V43p4LJ5zBdRLenAU1dL7bjk2BypKrcNDweozMCeD0h/dvU0sYzVzbKUy55F4LSc0zvdBtqg8VGAQqcJ9pCbZm4O3rF98fG3gTiDzgsd1IYeB2/73/pZBNCFcraKYU0/Fero63vhLvldafZvFhLcIB8O9SedhJK+WseKZAAVFBd8nsD5J+JpzNeHN1t/0jDqBCQik5evxoUfk7NdwHRCOC4OdCkinXyNwb/rk7azTlhPNy1LUEGgFR6BXGOzL2jz2ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753429276; c=relaxed/relaxed;
	bh=1QOs6c7uf/ZoRQrUor4J2oiDON93b/HTe+azTB+u2VE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IPOLtTVsG17v05anePUmTOdLcQFW30Y+tYNToobGmoxwlCz1r5RbT8sqCkIkmqlBY5mzVUY8C3nQ7hxQOoHzG+mxqIcFPEQiO7nwzaLA4yZR5rVl8ZDM9mZlORjBnoAJJhRr1BYMDfCQVaadSp3OWJk3PQLK4BCp1IVq0ZfgT3ZcYg1o5Dm3lqcFGd64UTc1oe01lBDENALxVICU59Kg821t0TFTPkbT7fz9F8OWLv7uQI32YB6zOyODsD8l6oHaw9A0KO5LLJ5kGl98UN0HuJHQnROGYZfAid5w+iQGlAIM92Pc/TycBXhFOaRo/PnUyxvkBU2zqFBAZvJ183A62A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=coD8Rl20; dkim-atps=neutral; spf=pass (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=coD8Rl20;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpKYk47Fdz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 17:41:13 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753429269; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=1QOs6c7uf/ZoRQrUor4J2oiDON93b/HTe+azTB+u2VE=;
	b=coD8Rl20EH+EhLwWLzNs5Zv7YiIDkWpOKgePCA3LIy9f6V+2tji2ZN4/+C6SjgXKgWlAK3ClyTYNu/e6dKP5XDDqPkfo1ABk/tuFwJYATjehN53+Npp4fAmnrHBw/HduOKXdIj8GbdmJO3x0GpXzkxuZDnKP6Pjy00jknHEkiWA=
Received: from 30.246.181.19(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wjwd8Jg_1753429264 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 25 Jul 2025 15:41:05 +0800
Message-ID: <fdb5dced-ea5a-48b8-bbb4-fc3ade7f3df8@linux.alibaba.com>
Date: Fri, 25 Jul 2025 15:40:58 +0800
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
To: Breno Leitao <leitao@debian.org>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
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
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <4qh2wbcbzdajh2tvki26qe4tqjazmyvbn7v7aqqhkxpitdrexo@ucch4ppo7i4e>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/7/24 21:34, Breno Leitao 写道:
> Hello Shuai,
> 
> On Thu, Jul 24, 2025 at 04:00:09PM +0800, Shuai Xue wrote:
>> 在 2025/7/23 00:56, Breno Leitao 写道:
>>> Introduce a generic infrastructure for tracking recoverable hardware
>>> errors (HW errors that did not cause a panic) and record them for vmcore
>>> consumption. This aids post-mortem crash analysis tools by preserving
>>> a count and timestamp for the last occurrence of such errors.
>>>
>>> Add centralized logging for three common sources of recoverable hardware
>>> errors:
>>
>> The term "recoverable" is highly ambiguous. Even within the x86
>> architecture, different vendors define errors differently. I'm not
>> trying to be pedantic about classification. As far as I know, for 2-bit
>> memory errors detected by scrub, AMD defines them as deferred errors
>> (DE) and handles them with log_error_deferred, while Intel uses
>> machine_check_poll. For 2-bit memory errors consumed by processes,
>> both Intel and AMD use MCE handling via do_machine_check(). Does your
>> HWERR_RECOV_MCE only focus on synchronous UE errors handled in
>> do_machine_check? What makes it special?
> 
> I understand that deferred errors (DE) detected by memory scrubbing are
> typically silent and may not significantly impact system stability. In
> other words, I’m not convinced that including DE metrics in crash dumps
> would be helpful for correlating crashes with hardware issues—it might
> just add noise.
> 
> Do you think it would be valuable to also log these events within
> log_error_deferred()?

Not really, as you meationed, the DE is typically silent in backgroud.
But I hope it is well documented.
> 
>>> -	if (ghes_severity(estatus->error_severity) >= GHES_SEV_PANIC)
>>> +	sev = ghes_severity(estatus->error_severity);
>>> +	if (sev == GHES_SEV_RECOVERABLE || sev ==  GHES_SEV_CORRECTED)
>>> +		hwerr_log_error_type(HWERR_RECOV_GHES);
>>
>> APEI does not define an error type named GHES. GHES is just a kernel
>> driver name. Many hardware error types can be handled in GHES (see
>> ghes_do_proc), for example, AER is routed by GHES when firmware-first
>> mode is used. As far as I know, firmware-first mode is commonly used in
>> production. Should GHES errors be categorized into AER, memory, and CXL
>> memory instead?
> 
> I also considered slicing the data differently initially, but then
> realized it would add more complexity than necessary for my needs.
> 
> If you believe we should further subdivide the data, I’m happy to do so.
> 
> You’re suggesting a structure like this, which would then map to the
> corresponding CPER_SEC_ sections:
> 
> 	enum hwerr_error_type {
> 	HWERR_RECOV_AER,     // maps to CPER_SEC_PCIE
> 	HWERR_RECOV_MCE,     // maps to default MCE + CPER_SEC_PCIE

CPER_SEC_PCIE is typo?

> 	HWERR_RECOV_CXL,     // maps to CPER_SEC_CXL_*
> 	HWERR_RECOV_MEMORY,  // maps to CPER_SEC_PLATFORM_MEM
> 	}
> 
> Additionally, what about events related to CPU, Firmware, or DMA
> errors—for example, CPER_SEC_PROC, CPER_SEC_FW, CPER_SEC_DMAR? Should we
> include those in the classification as well?

I would like to split a error from ghes to its own type,
it sounds more reasonable. I can not tell what happened from HWERR_RECOV_AERat all :(
> 
> 
> Thanks for your review and for the ongoing discussion!
> --breno

Thanks.
Shuai



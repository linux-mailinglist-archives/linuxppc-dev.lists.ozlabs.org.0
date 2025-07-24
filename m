Return-Path: <linuxppc-dev+bounces-10389-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F152B10290
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jul 2025 10:00:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bnk2G05ylz30T9;
	Thu, 24 Jul 2025 18:00:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753344021;
	cv=none; b=FQNtMtaOWugC9c4dJ6rvuGW98F0bWf2GaWFQk4qS5WFTyIRfN4IDMrOkFB9YhYpZt7yFUev/3SqwV8Vfmz1/EgvW/MDLJri0rsaEiTwC0ap70nPZSqFZpDVh9PrOm0nTsVdWAUesmMEXI2gcm1wQenadBr7b5diVNPhukwTNUNlisPMkNFyJND6T2kKjugt1tfC81TQFaQ/z4ZTN8+GlO6L2AMxRJyz6v7tL21cpdabtb6Zaju33bLhBTzKcjwWkYqsMBlCJfiY7Vv446c+tjzWEpjwHJZGytd7U+SyavDFfEHVZZzp/0iRmxCslRhDCIbs9/L0f4Y2j5WlkSkqgEw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753344021; c=relaxed/relaxed;
	bh=nhf3IJcOYSpRMKrPjWNbbcWsyyetTfh18hHD10/wjt4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iR6GEUqggkDah6qZZL9sChE9Ze8QDMQfOv3tlzQZ3BLtMDAWJ0IZ2ku8wJ5+MzJg0fkviocvMWJ/XHof23Hhmj+Ug7AkjPnvGA8bnB3h6/quowSLrkbO6dG9Pw52MTE3jeRIJb2vVWHLYajgL9EbMyP8tXbtYsaTNKC70tFHr7DjKMYNDChc23+ADQ2myamQ1dxwHXU1LpxWGEkW90nM7gyAF1Kxa2Yf1We5KBvz7WsKMKW5CoFkNXjygJMirK28Zu7LGQzFqbAG98DnyzUvihUKv8Ex9d4lIV1MRK1KpVojeoifJS65rFs0KBBVJXvOiRu0z8MbntpRbyJPrVPANQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NPavVHCQ; dkim-atps=neutral; spf=pass (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=NPavVHCQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.124; helo=out30-124.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-124.freemail.mail.aliyun.com (out30-124.freemail.mail.aliyun.com [115.124.30.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bnk2C6R49z30T8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jul 2025 18:00:18 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753344014; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=nhf3IJcOYSpRMKrPjWNbbcWsyyetTfh18hHD10/wjt4=;
	b=NPavVHCQ1VNVVQDWlB0oVFrocNwFe6TTnNsoK4RMISK18ozqDOoBMzvQsmovDdtgQGEpVtY4bt/Z6Ih9K7g3Pmp9H6ykuw+tiaFpqUXIT+lK/v0+0ZhxBey/8TTFlB3HgzFzj10rNxKQBHVh5TvP7u2wRtfuSkPjJeEv+U3bLSA=
Received: from 30.246.181.19(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0Wjlb2GV_1753344010 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 24 Jul 2025 16:00:11 +0800
Message-ID: <7ce9731a-b212-4e27-8809-0559eb36c5f2@linux.alibaba.com>
Date: Thu, 24 Jul 2025 16:00:09 +0800
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
To: Breno Leitao <leitao@debian.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Tony Luck <tony.luck@intel.com>,
 Borislav Petkov <bp@alien8.de>, Robert Moore <robert.moore@intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Cc: linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
 acpica-devel@lists.linux.dev, osandov@osandov.com, konrad.wilk@oracle.com,
 linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-pci@vger.kernel.org, kernel-team@meta.com
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi, Breno,

在 2025/7/23 00:56, Breno Leitao 写道:
> Introduce a generic infrastructure for tracking recoverable hardware
> errors (HW errors that did not cause a panic) and record them for vmcore
> consumption. This aids post-mortem crash analysis tools by preserving
> a count and timestamp for the last occurrence of such errors.
> 
> Add centralized logging for three common sources of recoverable hardware
> errors:

The term "recoverable" is highly ambiguous. Even within the x86
architecture, different vendors define errors differently. I'm not
trying to be pedantic about classification. As far as I know, for 2-bit
memory errors detected by scrub, AMD defines them as deferred errors
(DE) and handles them with log_error_deferred, while Intel uses
machine_check_poll. For 2-bit memory errors consumed by processes, both
Intel and AMD use MCE handling viado_machine_check(). Does your
HWERR_RECOV_MCE only focus on synchronous UE errors handled in
do_machine_check? What makes it special?

> 
>    - PCIe AER Correctable errors
>    - x86 Machine Check Exceptions (MCE)
>    - APEI/CPER GHES corrected or recoverable errors
> 
> hwerror_data is write-only at kernel runtime, and it is meant to be
> read from vmcore using tools like crash/drgn. For example, this is how
> it looks like when opening the crashdump from drgn.
> 
> 	>>> prog['hwerror_data']
> 	(struct hwerror_info[3]){
> 		{
> 			.count = (int)844,
> 			.timestamp = (time64_t)1752852018,
> 		},
> 		...
> 
> This helps fleet operators quickly triage whether a crash may be
> influenced by hardware recoverable errors (which executes a uncommon
> code path in the kernel), especially when recoverable errors occurred
> shortly before a panic, such as the bug fixed by
> commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them
> when destroying the pool")
> 
> This is not intended to replace full hardware diagnostics but provides
> a fast way to correlate hardware events with kernel panics quickly.
> 
> Suggested-by: Tony Luck <tony.luck@intel.com>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Changes in v3:
> - Add more information about this feature in the commit message
>    (Borislav Petkov)
> - Renamed the function to hwerr_log_error_type() and use hwerr as
>    suffix (Borislav Petkov)
> - Make the empty function static inline (kernel test robot)
> - Link to v2: https://lore.kernel.org/r/20250721-vmcore_hw_error-v2-1-ab65a6b43c5a@debian.org
> 
> Changes in v2:
> - Split the counter by recoverable error (Tony Luck)
> - Link to v1: https://lore.kernel.org/r/20250714-vmcore_hw_error-v1-1-8cf45edb6334@debian.org
> ---
>   arch/x86/kernel/cpu/mce/core.c |  3 +++
>   drivers/acpi/apei/ghes.c       |  8 ++++++--
>   drivers/pci/pcie/aer.c         |  2 ++
>   include/linux/vmcore_info.h    | 14 ++++++++++++++
>   kernel/vmcore_info.c           | 18 ++++++++++++++++++
>   5 files changed, 43 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 4da4eab56c81d..cb225a42eebbb 100644
> --- a/arch/x86/kernel/cpu/mce/core.c
> +++ b/arch/x86/kernel/cpu/mce/core.c
> @@ -45,6 +45,7 @@
>   #include <linux/task_work.h>
>   #include <linux/hardirq.h>
>   #include <linux/kexec.h>
> +#include <linux/vmcore_info.h>
>   
>   #include <asm/fred.h>
>   #include <asm/cpu_device_id.h>
> @@ -1692,6 +1693,8 @@ noinstr void do_machine_check(struct pt_regs *regs)
>   out:
>   	instrumentation_end();
>   
> +	/* Given it didn't panic, mark it as recoverable */
> +	hwerr_log_error_type(HWERR_RECOV_MCE);
>   clear:
>   	mce_wrmsrq(MSR_IA32_MCG_STATUS, 0);
>   }
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index a0d54993edb3b..ebda2aa3d68f2 100644
> --- a/drivers/acpi/apei/ghes.c
> +++ b/drivers/acpi/apei/ghes.c
> @@ -43,6 +43,7 @@
>   #include <linux/uuid.h>
>   #include <linux/ras.h>
>   #include <linux/task_work.h>
> +#include <linux/vmcore_info.h>
>   
>   #include <acpi/actbl1.h>
>   #include <acpi/ghes.h>
> @@ -1136,13 +1137,16 @@ static int ghes_proc(struct ghes *ghes)
>   {
>   	struct acpi_hest_generic_status *estatus = ghes->estatus;
>   	u64 buf_paddr;
> -	int rc;
> +	int rc, sev;
>   
>   	rc = ghes_read_estatus(ghes, estatus, &buf_paddr, FIX_APEI_GHES_IRQ);
>   	if (rc)
>   		goto out;
>   
> -	if (ghes_severity(estatus->error_severity) >= GHES_SEV_PANIC)
> +	sev = ghes_severity(estatus->error_severity);
> +	if (sev == GHES_SEV_RECOVERABLE || sev ==  GHES_SEV_CORRECTED)
> +		hwerr_log_error_type(HWERR_RECOV_GHES);

APEI does not define an error type named GHES. GHES is just a kernel
driver name. Many hardware error types can be handled in GHES (see
ghes_do_proc), for example, AER is routed by GHES when firmware-first
mode is used. As far as I know, firmware-first mode is commonly used in
production. Should GHES errors be categorized into AER, memory, and CXL
memory instead?

Thanks.
Shuai


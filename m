Return-Path: <linuxppc-dev+bounces-10444-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1A7B15771
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 04:13:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsG3B07C8z2yKw;
	Wed, 30 Jul 2025 12:13:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753841605;
	cv=none; b=JqSMX7nb5qyUsHyaAqIq/x0Ol+miv26u8FM54DpcQDBsV/4tlX+QnbDBX82kbg1H5YegoSWY6hYOM0g+IjVxhGBSZWER9MJeWMWagbLfOHt/aZNUQ7x2ngYJkR0EyannKZKW7s2pOVJmPp5ioc9ZRjHpEyway2K6nXVgvGrTBRTyklMWUnftcT1XcHf89cUnKtVyu/XU6R9+rXpeXj15WkKpKBLV0VxqcWPY4V5c2Si8bGafxgiEm7U4p4BweD56pf5sI22TES/CvZgU5v8P/9mu1cxM/xkDULMydbCtHwS4ClbBELEOJDQ+TZcypTwRAtUKf0SiT5jTxYFWQ3TU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753841605; c=relaxed/relaxed;
	bh=Dm3eSNIAoLVxqE9erJ6ULR5jgwQF3FgIn6ofz2lHyj4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MBJFPKtqmQo4kMfb4tq2s7vqrpNolb31I9T1I55pAr7jkkkLGRRnHgXLAs5w8puRTJZr8hwsa/i7KPICNpVLV4+UdDnLwl6laOqMsKCqfQRSz7RO8HxPSd3VBe5IMc7PzvseNsbsBY2Uje6QUgx9zNby1ERU8n+i3/a5CaMyDAJqt2zh7aXnaWIXH0Fs7YiSSp2EuHZnghnUNepksXEZlI/Er6YUMY9INnSdN18rAgyNw+KlKjYFYDVB+EwDZGfogeJG/CFfgxbGOSMUQDXPkrMzLUMCbs/w+JDiNUKigauGDFSy5uZVJJ8slqWnCNye7YDY/VY/w29gV3rIp01cXA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xWlp714s; dkim-atps=neutral; spf=pass (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=xWlp714s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsG375ZWxz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 12:13:22 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753841598; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=Dm3eSNIAoLVxqE9erJ6ULR5jgwQF3FgIn6ofz2lHyj4=;
	b=xWlp714s7qIcHZfdwp2qdkmiKCDnR4zAUQ/4/j5K6ZXU+AvkueidJOkhW4fsk9MNwOmgs7A5mb7z3zjat0KIG+7fDk5D3ZkRdG0Oa9H+eQdXVsjvmqD0lmHAMZjZTFnoA72BnNHtIResj2zZRaiRCFOyH7yc7S1N+w6FZHupt+o=
Received: from 30.246.181.19(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WkShN8z_1753841593 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 30 Jul 2025 10:13:15 +0800
Message-ID: <a87c5e74-082f-4be6-bbfd-4867bf72ddcc@linux.alibaba.com>
Date: Wed, 30 Jul 2025 10:13:13 +0800
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
 <4ef01be1-44b2-4bf5-afec-a90d4f71e955@linux.alibaba.com>
 <2a7ok3hdq3hmz45fzosd5vve4qpn6zy5uoogg33warsekigazu@wgfi7qsg5ixo>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <2a7ok3hdq3hmz45fzosd5vve4qpn6zy5uoogg33warsekigazu@wgfi7qsg5ixo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/7/29 21:48, Breno Leitao 写道:
> On Mon, Jul 28, 2025 at 09:08:25AM +0800, Shuai Xue wrote:
>> 在 2025/7/26 00:16, Breno Leitao 写道:
>>> On Fri, Jul 25, 2025 at 03:40:58PM +0800, Shuai Xue wrote:
>>>
>>> 	enum hwerr_error_type {
>>> 		HWERR_RECOV_MCE,     // maps to errors in do_machine_check()
>>> 		HWERR_RECOV_CXL,     // maps to CPER_SEC_CXL_
>>> 		HWERR_RECOV_PCI,     // maps to AER (pci_dev_aer_stats_incr()) and CPER_SEC_PCIE and CPER_SEC_PCI
>>> 		HWERR_RECOV_MEMORY,  // maps to CPER_SEC_PLATFORM_MEM_
>>> 		HWERR_RECOV_CPU,     // maps to CPER_SEC_PROC_
>>> 		HWERR_RECOV_DMA,     // maps to CPER_SEC_DMAR_
>>> 		HWERR_RECOV_OTHERS,  // maps to CPER_SEC_FW_, CPER_SEC_DMAR_,
>>> 	}
>>>
>>> Is this what you think we should track?
>>>
>>> Thanks
>>> --breno
>>
>> It sounds good to me.
> 
> Does the following patch matches your expectation?
> 
> Thanks!
> 
> Author: Breno Leitao <leitao@debian.org>
> Date:   Thu Jul 17 07:39:26 2025 -0700
> 
>      vmcoreinfo: Track and log recoverable hardware errors
>      
>      Introduce a generic infrastructure for tracking recoverable hardware
>      errors (HW errors that did not cause a panic) and record them for vmcore
>      consumption. This aids post-mortem crash analysis tools by preserving
>      a count and timestamp for the last occurrence of such errors.
>      
>      Add centralized logging for sources of recoverable hardware
>      errors based on the subsystem it has been notified.
>      
>      hwerror_data is write-only at kernel runtime, and it is meant to be read
>      from vmcore using tools like crash/drgn. For example, this is how it
>      looks like when opening the crashdump from drgn.
>      
>              >>> prog['hwerror_data']
>              (struct hwerror_info[6]){
>                      {
>                              .count = (int)844,
>                              .timestamp = (time64_t)1752852018,
>                      },
>                      ...
>      
>      This helps fleet operators quickly triage whether a crash may be
>      influenced by hardware recoverable errors (which executes a uncommon
>      code path in the kernel), especially when recoverable errors occurred
>      shortly before a panic, such as the bug fixed by
>      commit ee62ce7a1d90 ("page_pool: Track DMA-mapped pages and unmap them
>      when destroying the pool")
>      
>      This is not intended to replace full hardware diagnostics but provides
>      a fast way to correlate hardware events with kernel panics quickly.
>      
>      Suggested-by: Tony Luck <tony.luck@intel.com>
>      Signed-off-by: Breno Leitao <leitao@debian.org>
> 
> diff --git a/arch/x86/kernel/cpu/mce/core.c b/arch/x86/kernel/cpu/mce/core.c
> index 4da4eab56c81d..f85759453f89a 100644
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
> @@ -1690,6 +1691,9 @@ noinstr void do_machine_check(struct pt_regs *regs)
>   	}
>   
>   out:
> +	/* Given it didn't panic, mark it as recoverable */
> +	hwerr_log_error_type(HWERR_RECOV_MCE);
> +
>   	instrumentation_end();
>   
>   clear:
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index a0d54993edb3b..f0b17efff713e 100644
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
> @@ -867,6 +868,40 @@ int cxl_cper_kfifo_get(struct cxl_cper_work_data *wd)
>   }
>   EXPORT_SYMBOL_NS_GPL(cxl_cper_kfifo_get, "CXL");
>   
> +static void ghes_log_hwerr(int sev, guid_t *sec_type)
> +{
> +	if (sev != CPER_SEV_CORRECTED && sev != CPER_SEV_RECOVERABLE)
> +		return;
> +
> +	if (guid_equal(sec_type, &CPER_SEC_PROC_ARM) ||
> +	    guid_equal(sec_type, &CPER_SEC_PROC_GENERIC) ||
> +	    guid_equal(sec_type, &CPER_SEC_PROC_IA)) {
> +		hwerr_log_error_type(HWERR_RECOV_CPU);
> +		return;
> +	}
> +
> +	if (guid_equal(sec_type, &CPER_SEC_CXL_PROT_ERR) ||
> +	    guid_equal(sec_type, &CPER_SEC_CXL_GEN_MEDIA_GUID) ||
> +	    guid_equal(sec_type, &CPER_SEC_CXL_DRAM_GUID) ||
> +	    guid_equal(sec_type, &CPER_SEC_CXL_MEM_MODULE_GUID)) {
> +		hwerr_log_error_type(HWERR_RECOV_CXL);
> +		return;
> +	}
> +
> +	if (guid_equal(sec_type, &CPER_SEC_PCIE) ||
> +	    guid_equal(sec_type, &CPER_SEC_PCI_X_BUS) {
> +		hwerr_log_error_type(HWERR_RECOV_PCI);
> +		return;
> +	}
> +
> +	if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM)) {
> +		hwerr_log_error_type(HWERR_RECOV_MEMORY);
> +		return;
> +	}
> +
> +	hwerr_log_error_type(HWERR_RECOV_OTHERS);
> +}
> +
>   static void ghes_do_proc(struct ghes *ghes,
>   			 const struct acpi_hest_generic_status *estatus)
>   {
> @@ -888,6 +923,7 @@ static void ghes_do_proc(struct ghes *ghes,
>   		if (gdata->validation_bits & CPER_SEC_VALID_FRU_TEXT)
>   			fru_text = gdata->fru_text;
>   
> +		ghes_log_hwerr(sev, sec_type);
>   		if (guid_equal(sec_type, &CPER_SEC_PLATFORM_MEM)) {
>   			struct cper_sec_mem_err *mem_err = acpi_hest_get_payload(gdata);
>   
> diff --git a/drivers/pci/pcie/aer.c b/drivers/pci/pcie/aer.c
> index e286c197d7167..5ccb6ca347f3f 100644
> --- a/drivers/pci/pcie/aer.c
> +++ b/drivers/pci/pcie/aer.c
> @@ -30,6 +30,7 @@
>   #include <linux/kfifo.h>
>   #include <linux/ratelimit.h>
>   #include <linux/slab.h>
> +#include <linux/vmcore_info.h>
>   #include <acpi/apei.h>
>   #include <acpi/ghes.h>
>   #include <ras/ras_event.h>
> @@ -746,6 +747,7 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>   	switch (info->severity) {
>   	case AER_CORRECTABLE:
>   		aer_info->dev_total_cor_errs++;
> +		hwerr_log_error_type(HWERR_RECOV_PCI);

Hi Breno,

Thanks for working on this! The patch looks good overall, but I noticed
an inconsistency in the AER handling:

In ghes_log_hwerr(), you're counting both CPER_SEV_CORRECTED and
CPER_SEV_RECOVERABLE errors:

However, in the AER section, you're only handling AER_CORRECTABLE cases.
IMHO, Non-fatal errors are recoverable and correspond to
CPER_SEV_RECOVERABLE in the ACPI context.

The mapping should probably be:

- AER_CORRECTABLE → CPER_SEV_CORRECTED
- AER_NONFATAL → CPER_SEV_RECOVERABLE

What do you think?

Thanks,
Shuai



>   		counter = &aer_info->dev_cor_errs[0];
>   		max = AER_MAX_TYPEOF_COR_ERRS;
>   		break;
> diff --git a/include/linux/vmcore_info.h b/include/linux/vmcore_info.h
> index 37e003ae52626..538a3635fb1e5 100644
> --- a/include/linux/vmcore_info.h
> +++ b/include/linux/vmcore_info.h
> @@ -77,4 +77,21 @@ extern u32 *vmcoreinfo_note;
>   Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
>   			  void *data, size_t data_len);
>   void final_note(Elf_Word *buf);
> +
> +enum hwerr_error_type {
> +	HWERR_RECOV_MCE,
> +	HWERR_RECOV_CPU,
> +	HWERR_RECOV_MEMORY,
> +	HWERR_RECOV_PCI,
> +	HWERR_RECOV_CXL,
> +	HWERR_RECOV_OTHERS,
> +	HWERR_RECOV_MAX,
> +};
> +
> +#ifdef CONFIG_VMCORE_INFO
> +noinstr void hwerr_log_error_type(enum hwerr_error_type src);
> +#else
> +static inline void hwerr_log_error_type(enum hwerr_error_type src) {};
> +#endif
> +
>   #endif /* LINUX_VMCORE_INFO_H */
> diff --git a/kernel/vmcore_info.c b/kernel/vmcore_info.c
> index e066d31d08f89..4b5ab45d468f5 100644
> --- a/kernel/vmcore_info.c
> +++ b/kernel/vmcore_info.c
> @@ -31,6 +31,13 @@ u32 *vmcoreinfo_note;
>   /* trusted vmcoreinfo, e.g. we can make a copy in the crash memory */
>   static unsigned char *vmcoreinfo_data_safecopy;
>   
> +struct hwerr_info {
> +	int __data_racy count;
> +	time64_t __data_racy timestamp;
> +};
> +
> +static struct hwerr_info hwerr_data[HWERR_RECOV_MAX];
> +
>   Elf_Word *append_elf_note(Elf_Word *buf, char *name, unsigned int type,
>   			  void *data, size_t data_len)
>   {
> @@ -118,6 +125,17 @@ phys_addr_t __weak paddr_vmcoreinfo_note(void)
>   }
>   EXPORT_SYMBOL(paddr_vmcoreinfo_note);
>   
> +void hwerr_log_error_type(enum hwerr_error_type src)
> +{
> +	if (src < 0 || src >= HWERR_RECOV_MAX)
> +		return;
> +
> +	/* No need to atomics/locks given the precision is not important */
> +	hwerr_data[src].count++;
> +	hwerr_data[src].timestamp = ktime_get_real_seconds();
> +}
> +EXPORT_SYMBOL_GPL(hwerr_log_error_type);
> +
>   static int __init crash_save_vmcoreinfo_init(void)
>   {
>   	vmcoreinfo_data = (unsigned char *)get_zeroed_page(GFP_KERNEL);


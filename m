Return-Path: <linuxppc-dev+bounces-10462-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D680B161CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jul 2025 15:50:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bsYWx6d4rz3blH;
	Wed, 30 Jul 2025 23:50:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.133
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753883453;
	cv=none; b=azE2DBAf7JCfr8rmYoFrJV1eB7xQHw5vT9QKc4WWnOjMWkWCiQA0uo8sdYChBLVWHkfVo6+PHBxsiRX9PhcZk4OTgviTLWY6OpeztSWNwBQN93KXurx4YqQyABb4nIemvE5OsZ5MVjXlg/lpwjCg17c+xixDROz5loai0syjuVRqmCROXA3yhY37EgJETMQXWQuAwU50aWQxImFH7YUUfSpwRlLclpNNL00lgH9fubdVja1cYPttzVPUuBxkbBzSsq7urWWAGf/nhuqZLIpXaxF5cKZxfRwK2QGL/kQb1mK1BUZf0CfWGAav0jdG6oRUPhfnSvcJMhwPxjhMzKxj2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753883453; c=relaxed/relaxed;
	bh=1MpGugib20n3vs7zkXtgRFQ9xp4jr9eeh6RMYkJ++vU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mutXLtKCT0e5polPscRR3QnIHT/dCYEuqwcP0R5bkO1wlu4kk8ewXtlngQo5evi+ntVVVyHbtfKaBQ+6C3GsG4PGKfr4vvhbwsR0FDXPhOPBhoiAwys05YPypyVzM9Ctwec7fnc7UpY+xh0Hp8SP36xOHPp0T4I1yOWGZwUbmwDL9ZZZpPZqlnFa1acPcavT3ObxcYRbnEh1f+PI+cC7ILth0t+TxAWP9jh8lGbatV7SKqN/u6g+nniWIRU+HVjzK4eS4IOzv5JVGXPxYX0Oq8yuKZaZBpIBzUGr1d9X/PP8RlCyF85BODDwBXeHNB+7hoIBG4aIEMu45h30xOKDnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ZRkAWJoR; dkim-atps=neutral; spf=pass (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=ZRkAWJoR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.133; helo=out30-133.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bsYWw22x3z30RK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jul 2025 23:50:50 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1753883446; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=1MpGugib20n3vs7zkXtgRFQ9xp4jr9eeh6RMYkJ++vU=;
	b=ZRkAWJoRR/i2jTyiRsGwEt5QE/bvoo4jwJo4m5uLcV6cr1bEy5R9z1uHEXa7/FVKM2zH63ZzmrT8x5YWMsMGUA5cGCKtFqlR5Fx5Gd9KSIU43KoE0EXeDKkhXFnVbvI3K9ORlHH73AZmr/boX0oqB0mDkXivrnNV+RuTeFzMCZQ=
Received: from 30.246.181.19(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WkV4r6F_1753883440 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 30 Jul 2025 21:50:41 +0800
Message-ID: <a0839ff9-ea8d-44b9-8289-fcd5039e9263@linux.alibaba.com>
Date: Wed, 30 Jul 2025 21:50:39 +0800
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
 <a87c5e74-082f-4be6-bbfd-4867bf72ddcc@linux.alibaba.com>
 <zc4jm3hwvtwo5y2knk2bqzwmpf7ma7bdzs6uv2osavzcdew3nk@lfjrlp6sr7zz>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <zc4jm3hwvtwo5y2knk2bqzwmpf7ma7bdzs6uv2osavzcdew3nk@lfjrlp6sr7zz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



在 2025/7/30 21:11, Breno Leitao 写道:
> Hello Shuai,
> 
> On Wed, Jul 30, 2025 at 10:13:13AM +0800, Shuai Xue wrote:
>> In ghes_log_hwerr(), you're counting both CPER_SEV_CORRECTED and
>> CPER_SEV_RECOVERABLE errors:
> 
> Thanks. I was reading this code a bit more, and I want to make sure my
> understanding is correct, giving I was confused about CORRECTED and
> RECOVERABLE errors.
> 
> CPER_SEV_CORRECTED means it is corrected in the background, and the OS
> was not even notified about it. That includes 1-bit ECC error.

Not quite correct. From ACPI spec:

     > A corrected error is a hardware error condition that has been
     > corrected by the hardware or by the firmware by the time the OSPM is
     > notified about the existence of the error condition.

For example, 1-bit ECC errors can be reported via CMCI interrupt when
the threshold of correctable errors exceeds the desired limit. The Linux
GHES driver then initiates kernel actions like soft-offlining pages.

> THose are not the errors we are interested in, since they are irrelavant
> to the OS.
> 
> If that is true, then I might not want count CPER_SEV_CORRECTED errors
> at all, but only CPER_SEV_RECOVERABLE.

Yes, that's the right approach. Hardware corrects CE errors and software
can continue running without intervention. Since HWERR_RECOV_MCE only
records uncorrected errors, focusing on CPER_SEV_RECOVERABLE is more
appropriate for crash correlation analysis.

> 
>> However, in the AER section, you're only handling AER_CORRECTABLE cases.
>> IMHO, Non-fatal errors are recoverable and correspond to
>> CPER_SEV_RECOVERABLE in the ACPI context.
>>
>> The mapping should probably be:
>>
>> - AER_CORRECTABLE → CPER_SEV_CORRECTED
>> - AER_NONFATAL → CPER_SEV_RECOVERABLE
> 
> Thanks. This means I want to count AER_NONFATAL but not AER_CORRECTABLE.
> Is this right?

Exactly. IMHO, the updated mapping looks correct:

     - GHES: Only CPER_SEV_RECOVERABLE
     - AER: Only AER_NONFATAL (which maps to recoverable errors)
     - MCE: Uncorrected errors that didn't cause panic

> 
> Summarizing, This is the a new version of the change, according to my
> new understanding:
> 
> commit deca1c4b99dcfa64b29fe035f8422b4601212413
> Author: Breno Leitao <leitao@debian.org>
> Date:   Thu Jul 17 07:39:26 2025 -0700
> 
>      vmcoreinfo: Track and log recoverable hardware errors
> 
>      Introduce a generic infrastructure for tracking recoverable hardware
>      errors (HW errors that are visible to the OS but does not cause a panic)
>      and record them for vmcore consumption. This aids post-mortem crash
>      analysis tools by preserving a count and timestamp for the last
>      occurrence of such errors. On the other side, correctable errors, which
>      the OS typically remains unaware of because the underlying hardware
>      handles them transparently, are less relevant and therefore are NOT
>      tracked in this infrastructure.
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

Indentation: needs tab alignment.

The current placement only logs errors that reach the out: label. Errors
that go to `clear` lable won't be recorded. Would it be better to log at
the beginning of do_machine_check() to capture all recoverable MCEs?

>   	instrumentation_end();
> 
>   clear:
> diff --git a/drivers/acpi/apei/ghes.c b/drivers/acpi/apei/ghes.c
> index a0d54993edb3b..9c549c4a1a708 100644
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
> +	if (sev != CPER_SEV_RECOVERABLE)
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
> index e286c197d7167..d814c06cdbee6 100644
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
> @@ -751,6 +752,7 @@ static void pci_dev_aer_stats_incr(struct pci_dev *pdev,
>   		break;
>   	case AER_NONFATAL:
>   		aer_info->dev_total_nonfatal_errs++;
> +		hwerr_log_error_type(HWERR_RECOV_PCI);
>   		counter = &aer_info->dev_nonfatal_errs[0];
>   		max = AER_MAX_TYPEOF_UNCOR_ERRS;
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

Look good for me.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

It would be valuable to get additional review from other RAS experts.

Thanks.
Shuai


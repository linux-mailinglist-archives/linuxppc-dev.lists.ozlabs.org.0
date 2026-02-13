Return-Path: <linuxppc-dev+bounces-16858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QJyeOXGUjmmhDAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Feb 2026 04:03:13 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AC44132864
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Feb 2026 04:03:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBxn23CB6z2ydq;
	Fri, 13 Feb 2026 14:03:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770951782;
	cv=none; b=J4kemovj29x5gQQ3aZz7w8MG2+qnkAqIrdOhxqUzltdDA4a6MQqDPujJh9kOKdI5IlnwcP+p34COo2m2vrUkSAv1z5H22in9vQRV5dcifjPPug8qA47Sinx2/TxuDe4n4tO1Dm9o3/xFkZhjPGK6T7VayeIPgUXYou4ovt7nYnjGf9/y0rPT3BPVCyP621Iu+TPV28fA3gCwdc/30vHvUaMASZLAs43l6t5+WkGtqnh7pLkLVWxens0dhXz6G53OxbI6rH3xbzQ10oTN7SEV0vsQtV6GmAqRVdgQdLNEiS77OqS7yUhDHfKUGqy+0gaGKUnNVkYOOEvSlrsW2o6A9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770951782; c=relaxed/relaxed;
	bh=K5cL1rUjW8lH3PpXOjpFyvJ0RBVPGunsEahu80kYEIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=L61ZQZYUIYai6jg7sjlcpkngNXUqxxkcsaLo31soMGvOabkMmUOq05z/zKszzGqOMmFn/7RwgjLKmiH37YrrzgQDUatVIf+Ar3EM362FPJ3p5EAP3O5475HhAZaCCdJbZLztfvtrNjBvNZZqPQpnmlbWhTXpij9cRC0bwN+Kiecr3Y6n9ciyFzBLjkopTxo1q+c7ABAEoOfh72wwuOiriugHV3Z5XlX/nAbcBg8YpRulK13nRKrm+FmwLcyTauRSHwfFzZtMAS34OLUB4c63FUlT6xr/D6cbFeg5U3xgJzBqvsUrNITQX6bzy9yOMKLdkTprOWQcbmMpAVubhFQQHQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tSVQdw+J; dkim-atps=neutral; spf=pass (client-ip=113.46.200.219; helo=canpmsgout04.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=tSVQdw+J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.219; helo=canpmsgout04.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBxmz23bFz2yY0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Feb 2026 14:02:56 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=K5cL1rUjW8lH3PpXOjpFyvJ0RBVPGunsEahu80kYEIM=;
	b=tSVQdw+JNJXAf1MY/KPskhRvBv85Okf/IgHzgOt+2D5eEBLWqfzS9u47OjAJeMtqzAfWdPhtd
	HvIv83mJ7r9/qriS+SpF+6Ahl4Ra1bl7OmirckSWin+B1oIOwAthF/yVPEQMD+PQghmwUwCG5Ek
	a6V35f7r3GC+IrEZG7cqb78=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4fBxgN1HdXz1prmP;
	Fri, 13 Feb 2026 10:58:08 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 07D9940570;
	Fri, 13 Feb 2026 11:02:50 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 13 Feb 2026 11:02:40 +0800
Message-ID: <efb16ebb-a6e3-01e8-2277-98ac1347d084@huawei.com>
Date: Fri, 13 Feb 2026 11:02:39 +0800
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
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 2/4] crash: Exclude crash kernel memory in crash core
Content-Language: en-US
To: Mike Rapoport <rppt@kernel.org>
CC: <corbet@lwn.net>, <skhan@linuxfoundation.org>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <chenhuacai@kernel.org>, <kernel@xen0n.name>,
	<maddy@linux.ibm.com>, <mpe@ellerman.id.au>, <npiggin@gmail.com>,
	<chleroy@kernel.org>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<vgoyal@redhat.com>, <dyoung@redhat.com>, <rdunlap@infradead.org>,
	<kees@kernel.org>, <elver@google.com>, <paulmck@kernel.org>, <arnd@arndb.de>,
	<fvdl@google.com>, <thuth@redhat.com>, <ardb@kernel.org>,
	<leitao@debian.org>, <osandov@fb.com>, <cfsworks@gmail.com>,
	<sourabhjain@linux.ibm.com>, <ryan.roberts@arm.com>,
	<tangyouling@kylinos.cn>, <eajames@linux.ibm.com>, <hbathini@linux.ibm.com>,
	<ritesh.list@gmail.com>, <songshuaishuai@tinylab.org>, <bjorn@rivosinc.com>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <dwmw@amazon.co.uk>,
	<pbonzini@redhat.com>, <kai.huang@intel.com>, <ubizjak@gmail.com>,
	<coxu@redhat.com>, <fuqiang.wang@easystack.cn>, <liaoyuanhong@vivo.com>,
	<brgerst@gmail.com>, <jbohac@suse.cz>, <x86@kernel.org>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <loongarch@lists.linux.dev>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-riscv@lists.infradead.org>,
	<kexec@lists.infradead.org>
References: <20260212101001.343158-1-ruanjinjie@huawei.com>
 <20260212101001.343158-3-ruanjinjie@huawei.com> <aY4izR61SWal5BAg@kernel.org>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <aY4izR61SWal5BAg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[huawei.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:kees@kernel.org,m:elver@google.com,m:paulmck@kernel.org,m:arnd@arndb.de,m:fvdl@google.com,m:thuth@redhat.com,m:ardb@kernel.org,m:leitao@debian.org,m:osandov@fb.com,m:cfsworks@gmail.com,m:sourabhjain@linux.ibm.com,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:eajames@linux.ibm.com,m:hbathini@linux.ibm.com,m:ritesh.list@gmail.com,m:songshuaishuai@tinylab.org,m:bjorn@rivosinc.com,m:samuel.holland@sifive.com,m:kevin.brodsky@arm.com,m:junhui.liu@pi
 gmoral.tech,m:vishal.moola@gmail.com,m:dwmw@amazon.co.uk,m:pbonzini@redhat.com,m:kai.huang@intel.com,m:ubizjak@gmail.com,m:coxu@redhat.com,m:fuqiang.wang@easystack.cn,m:liaoyuanhong@vivo.com,m:brgerst@gmail.com,m:jbohac@suse.cz,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	TAGGED_FROM(0.00)[bounces-16858-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,google.com,arndb.de,debian.org,fb.com,kylinos.cn,tinylab.org,rivosinc.com,sifive.com,pigmoral.tech,amazon.co.uk,intel.com,easystack.cn,vivo.com,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[huawei.com:+];
	RCPT_COUNT_GT_50(0.00)[64];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	HAS_XOIP(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:mid,huawei.com:dkim,huawei.com:email]
X-Rspamd-Queue-Id: 4AC44132864
X-Rspamd-Action: no action



On 2026/2/13 2:58, Mike Rapoport wrote:
> Hi,
> 
> On Thu, Feb 12, 2026 at 06:09:59PM +0800, Jinjie Ruan wrote:
>> The exclude of crashk_res, crashk_low_res and crashk_cma memory
>> are almost identical across different architectures, handling them
>> in the crash core would eliminate a lot of duplication, so do
>> them in the common code.
>>
>> And move the size calculation (and the realloc if needed) into the
>> generic crash core so that:
>>
>> - New CMA regions or future crash-memory types can automatically
>>   accounted for in crash core;
>>
>> - Each architecture no longer has to play whack-a-mole with
>>   its private array size.
>>
>> To achieve the above goal, 4 architecture-specific functions are
>> introduced:
>>
>> - arch_get_system_nr_ranges() and arch_prepare_elf64_ram_headers().
>>   The 1st function pre-counts the number of memory ranges, and
>>   the 2st function fill the memory ranges into the cmem->ranges[] array,
>>   and count the actual number of ranges filled.
> 
> The names should reflect that these function deal with crash memory ranges.
>  
>> - arch_crash_exclude_mem_range(). Realloc for powerpc. The default
>>   implementation is crash_exclude_mem_range(), and use
>>   crash_exclude_mem_range_guarded() to implement the arch version
>>   for powerpc.
>>
>> - arch_get_crash_memory_ranges(). Get crash memory ranges for arch and
>>   the default implementation is generic across x86, arm64, riscv, and
>>   loongson by using the first two arch functions above. powerpc has its
>>   own implementation by calling get_crash_memory_ranges().
> 
> Hmm, powerpc seems too different from the rest, maybe we shouldn't try to
> squeeze it in?
> 
>> Tested on x86, arm64 and riscv with QEMU.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>  arch/arm64/include/asm/kexec.h             |   9 +-
>>  arch/arm64/kernel/machine_kexec_file.c     |  41 +++-----
>>  arch/loongarch/include/asm/kexec.h         |   9 +-
>>  arch/loongarch/kernel/machine_kexec_file.c |  41 +++-----
>>  arch/powerpc/include/asm/kexec.h           |  13 +++
>>  arch/powerpc/include/asm/kexec_ranges.h    |   3 -
>>  arch/powerpc/kexec/crash.c                 |  68 ++++++++------
>>  arch/powerpc/kexec/file_load_64.c          |  17 ++--
>>  arch/powerpc/kexec/ranges.c                |  18 +---
>>  arch/riscv/include/asm/kexec.h             |   9 +-
>>  arch/riscv/kernel/machine_kexec_file.c     |  37 +++-----
>>  arch/x86/include/asm/kexec.h               |   9 ++
>>  arch/x86/kernel/crash.c                    | 104 +++------------------
>>  include/linux/crash_core.h                 |  75 +++++++++++++--
>>  kernel/crash_core.c                        |  85 +++++++++++++++--
>>  15 files changed, 289 insertions(+), 249 deletions(-)
> 
> TBH, I'd expect this to produce negative diffstat :/

Forcing compatibility with powerpc has brought a lot of inconvenience.

>  
>> diff --git a/arch/arm64/include/asm/kexec.h b/arch/arm64/include/asm/kexec.h
>> index 892e5bebda95..67f790e3ba14 100644
>> --- a/arch/arm64/include/asm/kexec.h
>> +++ b/arch/arm64/include/asm/kexec.h
>> @@ -119,6 +119,7 @@ struct kimage_arch {
>>  };
>>  
>>  #ifdef CONFIG_KEXEC_FILE
>> +struct crash_mem;
>>  extern const struct kexec_file_ops kexec_image_ops;
>>  
>>  int arch_kimage_file_post_load_cleanup(struct kimage *image);
>> @@ -128,7 +129,13 @@ extern int load_other_segments(struct kimage *image,
>>  		unsigned long kernel_load_addr, unsigned long kernel_size,
>>  		char *initrd, unsigned long initrd_len,
>>  		char *cmdline);
>> -#endif
>> +
>> +int arch_get_system_nr_ranges(unsigned int *nr_ranges);
>> +#define arch_get_system_nr_ranges arch_get_system_nr_ranges
>> +
>> +int arch_prepare_elf64_ram_headers(struct crash_mem *cmem);
>> +#define arch_prepare_elf64_ram_headers arch_prepare_elf64_ram_headers
> 
> I think a better practice would be to declare all functions that an
> architecture may override in include/linux/crash_core.h and provide a
> default __weak implementation in kernel/crash_core.c.

This would avoid many function declarations in architecture-specific code.

> 
>> +#endif /* CONFIG_KEXEC_FILE */
>>  
>>  #endif /* __ASSEMBLER__ */
>>  
>> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
>> index 410060ebd86d..506a165117b1 100644
>> --- a/arch/arm64/kernel/machine_kexec_file.c
>> +++ b/arch/arm64/kernel/machine_kexec_file.c
>> @@ -40,23 +40,22 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
>>  }
>>  
>>  #ifdef CONFIG_CRASH_DUMP
>> -static int prepare_elf_headers(void **addr, unsigned long *sz)
>> +int arch_get_system_nr_ranges(unsigned int *nr_ranges)
>>  {
>> -	struct crash_mem *cmem;
>> -	unsigned int nr_ranges;
>> -	int ret;
>> -	u64 i;
>>  	phys_addr_t start, end;
>> +	u64 i;
>>  
>> -	nr_ranges = 2; /* for exclusion of crashkernel region */
>>  	for_each_mem_range(i, &start, &end)
>> -		nr_ranges++;
>> +		(*nr_ranges)++;
>> +
> 
> Won't be simpler to make it 

This is indeed much cleaner.

> 
> 	unsigned int arch_get_system_nr_ranges(void)
> 
> count the ranges and return the result?
> 
>> +	return 0;
>> +}
>>  
>> -	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
>> -	if (!cmem)
>> -		return -ENOMEM;
>> +int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
>> +{
> 
> It seems that this function collects the memory ranges and fills them into
> cmem rather than prepares elf headers.

Yes, the function names were taken from the x86 and riscv
implementations, which caused some confusion.

> 
>> +	phys_addr_t start, end;
>> +	u64 i;
>>  
>> -	cmem->max_nr_ranges = nr_ranges;
>>  	cmem->nr_ranges = 0;
>>  	for_each_mem_range(i, &start, &end) {
>>  		cmem->ranges[cmem->nr_ranges].start = start;
>> @@ -64,22 +63,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>>  		cmem->nr_ranges++;
>>  	}
>>  
>> -	/* Exclude crashkernel region */
>> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
>> -	if (ret)
>> -		goto out;
>> -
>> -	if (crashk_low_res.end) {
>> -		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
>> -		if (ret)
>> -			goto out;
>> -	}
>> -
>> -	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
>> -
>> -out:
>> -	kfree(cmem);
>> -	return ret;
>> +	return 0;
>>  }
>>  #endif
>>  
>> @@ -109,7 +93,8 @@ int load_other_segments(struct kimage *image,
>>  	void *headers;
>>  	unsigned long headers_sz;
>>  	if (image->type == KEXEC_TYPE_CRASH) {
>> -		ret = prepare_elf_headers(&headers, &headers_sz);
>> +		ret = crash_prepare_elf64_headers(true, &headers, &headers_sz,
>> +						  NULL, NULL, NULL);
>>  		if (ret) {
>>  			pr_err("Preparing elf core header failed\n");
>>  			goto out_err;
> 
> Same comments as for arm64 apply for other architectures as well. 
> 
>> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
>> index d35726d6a415..3105d28fd0c6 100644
>> --- a/include/linux/crash_core.h
>> +++ b/include/linux/crash_core.h
>> @@ -2,11 +2,14 @@
>>  #ifndef LINUX_CRASH_CORE_H
>>  #define LINUX_CRASH_CORE_H
>>  
>> -#include <linux/linkage.h>
>>  #include <linux/elfcore.h>
>>  #include <linux/elf.h>
>> +#include <linux/kexec.h>
>> +#include <linux/linkage.h>
>> +#include <linux/vmalloc.h>
>>  
>>  struct kimage;
>> +struct memory_notify;
>>  
>>  struct crash_mem {
>>  	unsigned int max_nr_ranges;
>> @@ -54,6 +57,66 @@ static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long
>>  }
>>  #endif
>>  
>> +extern int crash_exclude_mem_range(struct crash_mem *mem,
>> +				   unsigned long long mstart,
>> +				   unsigned long long mend);
>> +
>> +#ifndef arch_crash_exclude_mem_range
>> +static __always_inline int arch_crash_exclude_mem_range(struct crash_mem **mem_ranges,
>> +							unsigned long long mstart,
>> +							unsigned long long mend)
>> +{
>> +	return crash_exclude_mem_range(*mem_ranges, mstart, mend);
>> +}
>> +#endif
>> +
>> +#ifndef arch_get_system_nr_ranges
>> +static inline int arch_get_system_nr_ranges(unsigned int *nr_ranges)
>> +{
>> +	return -EINVAL;
>> +}
>> +#endif
>> +
>> +#ifndef arch_prepare_elf64_ram_headers
>> +static inline int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
>> +{
>> +	return -EINVAL;
>> +}
>> +#endif
>> +
>> +#ifndef arch_get_crash_memory_ranges
>> +static inline int arch_get_crash_memory_ranges(struct crash_mem **cmem,
>> +					       unsigned long *nr_mem_ranges,
>> +					       struct kimage *image,
>> +					       struct memory_notify *mn)
>> +{
>> +	unsigned int nr_ranges;
>> +	int ret;
>> +
>> +	/*
>> +	 * Exclusion of crash region, crashk_low_res and/or crashk_cma_ranges
>> +	 * may cause range splits. So add extra slots here.
>> +	 */
>> +	nr_ranges = 1 + (crashk_low_res.end != 0) + crashk_cma_cnt;
>> +	ret = arch_get_system_nr_ranges(&nr_ranges);
>> +	if (ret)
>> +		return ret;
>> +
>> +	*cmem = kvzalloc(struct_size(*cmem, ranges, nr_ranges), GFP_KERNEL);
>> +	if (!(*cmem))
>> +		return -ENOMEM;
>> +
>> +	(*cmem)->max_nr_ranges = nr_ranges;
>> +	ret = arch_prepare_elf64_ram_headers(*cmem);
>> +	if (ret) {
>> +		kvfree(*cmem);
>> +		return ret;
>> +	}
>> +
>> +	return 0;
>> +}
> 
> This function is quite large for an inline, should be in
> kernel/crash_core.c IMHO.

Right，inlinie large functions will lead to code bloat.

> 
>> +#endif
>> +
>>  #ifndef crash_get_elfcorehdr_size
>>  static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>>  #endif
>> @@ -61,11 +124,11 @@ static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>>  /* Alignment required for elf header segment */
>>  #define ELF_CORE_HEADER_ALIGN   4096
>>  
>> -extern int crash_exclude_mem_range(struct crash_mem *mem,
>> -				   unsigned long long mstart,
>> -				   unsigned long long mend);
>> -extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>> -				       void **addr, unsigned long *sz);
>> +extern int crash_prepare_elf64_headers(int need_kernel_map,
>> +				       void **addr, unsigned long *sz,
>> +				       unsigned long *nr_mem_ranges,
>> +				       struct kimage *image,
>> +				       struct memory_notify *mn);
>>  
>>  struct kimage;
>>  struct kexec_segment;
>> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
>> index 99dac1aa972a..99a0d6abf88e 100644
>> --- a/kernel/crash_core.c
>> +++ b/kernel/crash_core.c
>> @@ -18,6 +18,7 @@
>>  #include <linux/memblock.h>
>>  #include <linux/kmemleak.h>
>>  #include <linux/crash_core.h>
>> +#include <linux/crash_reserve.h>
>>  #include <linux/reboot.h>
>>  #include <linux/btf.h>
>>  #include <linux/objtool.h>
>> @@ -161,19 +162,80 @@ static inline resource_size_t crash_resource_size(const struct resource *res)
>>  	return !res->end ? 0 : resource_size(res);
>>  }
>>  
>> +static int crash_exclude_mem_ranges(struct crash_mem *cmem,
>> +				    unsigned long *nr_mem_ranges)
>> +{
>> +	int ret, i;
>> +
>> +#if defined(CONFIG_X86_64) || defined(CONFIG_X86_32)
>> +	/*
>> +	 * Exclusion of low 1M may not cause another range split, because the
>> +	 * range of exclude is [0, 1M] and the condition for splitting a new
>> +	 * region is that the start, end parameters are both in a certain
>> +	 * existing region in cmem and cannot be equal to existing region's
>> +	 * start or end. Obviously, the start of [0, 1M] cannot meet this
>> +	 * condition.
>> +	 *
>> +	 * But in order to lest the low 1M could be changed in the future,
>> +	 * (e.g. [start, 1M]), add a extra slot.
>> +	 */
>> +	cmem->max_nr_ranges++;
>>  
>> +	/* Exclude the low 1M because it is always reserved */
>> +	ret = arch_crash_exclude_mem_range(&cmem, 0, SZ_1M - 1);
>> +	if (ret)
>> +		return ret;
>> +#endif
> 
> This should remain in x86.

Yes, this should not be in the generic code.

> 
>>  
>> +	/* Exclude crashkernel region */
>> +	ret = arch_crash_exclude_mem_range(&cmem, crashk_res.start, crashk_res.end);
>> +	if (ret)
>> +		return ret;
>>  
>> -int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>> -			  void **addr, unsigned long *sz)
>> +	if (crashk_low_res.end) {
>> +		ret = arch_crash_exclude_mem_range(&cmem, crashk_low_res.start, crashk_low_res.end);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	for (i = 0; i < crashk_cma_cnt; ++i) {
>> +		ret = arch_crash_exclude_mem_range(&cmem, crashk_cma_ranges[i].start,
>> +						   crashk_cma_ranges[i].end);
>> +		if (ret)
>> +			return ret;
>> +	}
>> +
>> +	/* Return the computed number of memory ranges, for hotplug usage */
>> +	if (nr_mem_ranges)
>> +		*nr_mem_ranges = cmem->nr_ranges;
>> +
>> +	return 0;
>> +}
>> +
>> +int crash_prepare_elf64_headers(int need_kernel_map, void **addr,
>> +				unsigned long *sz, unsigned long *nr_mem_ranges,
>> +				struct kimage *image, struct memory_notify *mn)
> 
> Hmm, we are adding image and mn parameters only for powerpc and we already
> have arch_crash_exclude_mem_range() and arch_get_crash_memory_ranges() to
> accommodate powerpc differences.

Yes, accommodating powerpc has brought a lot of trouble.

> 
> I'd suggest to take a slightly different approach. I'm thinking that we can
> add crash_prepare_elf_headers() that will be similar to current
> x86/arm64/loongarch prepare_elf_headers(), leave
> crash_prepare_elf64_headers() alone and add a helper to exclude common
> ranges, e.g crash_exclude_core_ranges(struct crash_mem *mem).
> 
> The crash_prepare_headers() would be something like this (error handling
> omitted):
> 
> int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz)
> {
> 	unsigned int nr;
> 	struct crash_mem *cmem;
> 
> 	nr = arch_get_system_nr_ranges();
> 	cmem = alloc_cmem(nr);
> 	arch_crash_populate_cmem(cmem);
> 	crash_exclude_core_ranges(cmem);
> 	arch_crash_exclude_ranges(cmem);
> 	crash_prepare_elf64_headers(cmem, need_kernel_map, addr, sz);
> }

This looks fine to me and it can indeed avoid impacting other
architectures that use `crash_prepare_elf64_headers()` but do not use
our generic code.

> 
> powerpc could reuse crash_exclude_core_ranges() provided the latter call
> an overridable arch_crash_exclude_range()

We can do this in two steps: first switch x86/arm64/riscv/loongarch to
the above approach, and then switch powerpc over. This will make the
code easier to review.

> 
> What do you think?

 I think your proposed approach is more elegant and reduces the
disruption to existing code.

> 


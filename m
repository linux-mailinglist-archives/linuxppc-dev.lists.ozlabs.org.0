Return-Path: <linuxppc-dev+bounces-16609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BXmOHILhGl5xQMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 04:16:02 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6684EE40D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 05 Feb 2026 04:16:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f62Rc3CrCz2yFb;
	Thu, 05 Feb 2026 14:15:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=113.46.200.219
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770261356;
	cv=none; b=Xt8E8jP/untZTdE32aWIjPqlbnGA0oimP/0syEphQb5XZo+CojVy7FUfEDilaGbxiSQ35kOE1jGcGeUZhX8ueZJ4th/I+NPd4pwVQOJDSWamu3yTuwIcJ9OpTIxgaG8q3o4VJB4aFVie7aa3GeSeKjnzQtWXrw9PNUi0uw0CWIgn10hWHzLBXxv3QkH0A+1rt+FkfsPmYShoqVqCxOJLX9+z4JMIdfHQZHoEC1xM5fZXZIov8WBAXD72XpFBdBlZ1qiYBHDo/VvOdo1Dm+dbfMeEjSiug3KWRF3CCDlc/ghvF4LZN+LVFZLnJBALaOB3gEtPW4whdkOpzlkeHLAhsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770261356; c=relaxed/relaxed;
	bh=m0YhAEtCzGzoYGvZg42KcYgs+OHxXA5AmpEhewJRkE0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Yhbb1Vp4CTtIT2ioEQ6y64l/kZySq+n73MaosaUZe2MWLKm3i8kP13kNptMIBrAfz4PvMM8RAZnf8/A4mNfXWeZ68BOPFqLwqMFuzVNc+PvKEFS5DOjfLcTm+XpZlemSCuen4CXzXdDM4OHDtEgVRlxq0udgDkEtZG8WV6fxThvDIcbqn+zx88A5F/RDpT3fd5agHd826xLPlveicHmtsopJvOuPx8pys8sDPHGrKVO6dNt8XANB03+HmBdzhYKgLMvlWDBY61NIDI8OFMl31Kag1OhrMap3sJu9nv7CLEMz+hrLnoIhzHimxnoy8tuimDesRRzQsJgwPj8ZFV3eSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mrg81Ley; dkim-atps=neutral; spf=pass (client-ip=113.46.200.219; helo=canpmsgout04.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=mrg81Ley;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=113.46.200.219; helo=canpmsgout04.his.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63546 seconds by postgrey-1.37 at boromir; Thu, 05 Feb 2026 14:15:52 AEDT
Received: from canpmsgout04.his.huawei.com (canpmsgout04.his.huawei.com [113.46.200.219])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f62RX490cz2xHt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Feb 2026 14:15:50 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=m0YhAEtCzGzoYGvZg42KcYgs+OHxXA5AmpEhewJRkE0=;
	b=mrg81Ley9PfGVLZQRfso+yz1ManXQbV+PfgxLEEqszlmqVu7nf5ibUS3D3jz2hxv4nVKl3Pxy
	u1f26cRtxz6qdg+Sa5H47rkNKtSL2+fw1FqsGBvUi1egGqaUWoOeHZW1xEPRfIPMfxyDybkK+me
	y6AzQqnzHgyAcWGTJDZFXnA=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4f62L33nmhz1prQr;
	Thu,  5 Feb 2026 11:11:07 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id A0B3540561;
	Thu,  5 Feb 2026 11:15:44 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 5 Feb 2026 11:15:41 +0800
Message-ID: <113f1d02-69df-b28e-edb9-514d284c6b29@huawei.com>
Date: Thu, 5 Feb 2026 11:15:40 +0800
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
Subject: Re: [PATCH v3 1/3] crash: Exclude crash kernel memory in crash core
Content-Language: en-US
To: Sourabh Jain <sourabhjain@linux.ibm.com>, <corbet@lwn.net>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <chenhuacai@kernel.org>,
	<kernel@xen0n.name>, <maddy@linux.ibm.com>, <mpe@ellerman.id.au>,
	<npiggin@gmail.com>, <chleroy@kernel.org>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<bhe@redhat.com>, <vgoyal@redhat.com>, <dyoung@redhat.com>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<kees@kernel.org>, <elver@google.com>, <arnd@arndb.de>,
	<lirongqing@baidu.com>, <fvdl@google.com>, <leitao@debian.org>,
	<rppt@kernel.org>, <cfsworks@gmail.com>, <osandov@fb.com>, <ardb@kernel.org>,
	<ryan.roberts@arm.com>, <tangyouling@kylinos.cn>, <ritesh.list@gmail.com>,
	<bjorn@rivosinc.com>, <songshuaishuai@tinylab.org>,
	<samuel.holland@sifive.com>, <kevin.brodsky@arm.com>,
	<junhui.liu@pigmoral.tech>, <vishal.moola@gmail.com>, <coxu@redhat.com>,
	<jbohac@suse.cz>, <liaoyuanhong@vivo.com>, <brgerst@gmail.com>,
	<fuqiang.wang@easystack.cn>, <x86@kernel.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<loongarch@lists.linux.dev>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
References: <20260204093728.1447527-1-ruanjinjie@huawei.com>
 <20260204093728.1447527-2-ruanjinjie@huawei.com>
 <4dc944c7-20ad-4e92-b05e-28a9e0c5a2b8@linux.ibm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <4dc944c7-20ad-4e92-b05e-28a9e0c5a2b8@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
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
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[huawei.com:s=dkim];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16609-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:sourabhjain@linux.ibm.com,m:corbet@lwn.net,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:pawan.kumar.gupta@linux.intel.com,m:feng.tang@linux.alibaba.com,m:kees@kernel.org,m:elver@google.com,m:arnd@arndb.de,m:lirongqing@baidu.com,m:fvdl@google.com,m:leitao@debian.org,m:rppt@kernel.org,m:cfsworks@gmail.com,m:osandov@fb.com,m:ardb@kernel.org,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:ritesh.list@gmail.com,m:bjorn@rivosinc.com,m:songshuaishuai@tinylab.org,m:samuel.holland@sifive.com,m:kevin.brodsky@arm.com,m:junhui.liu@pigmoral.tech,m:vishal.moola@gmail.com,m:coxu@redhat.c
 om,m:jbohac@suse.cz,m:liaoyuanhong@vivo.com,m:brgerst@gmail.com,m:fuqiang.wang@easystack.cn,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.ibm.com,lwn.net,arm.com,kernel.org,xen0n.name,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,linux.alibaba.com,google.com,arndb.de,baidu.com,debian.org,fb.com,kylinos.cn,rivosinc.com,tinylab.org,sifive.com,pigmoral.tech,suse.cz,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[huawei.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruanjinjie@huawei.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[57];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	HAS_XOIP(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,huawei.com:dkim,huawei.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E6684EE40D
X-Rspamd-Action: no action



On 2026/2/4 20:32, Sourabh Jain wrote:
> 
> 
> On 04/02/26 15:07, Jinjie Ruan wrote:
>> The exclude of crashk_res, crashk_low_res and crashk_cma memory
>> are almost identical across different architectures, so handling them
>> in the crash core would eliminate a lot of duplication, so do
>> them in the common code.
>>
>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>> ---
>>   arch/arm64/kernel/machine_kexec_file.c     | 12 -------
>>   arch/loongarch/kernel/machine_kexec_file.c | 12 -------
>>   arch/powerpc/kexec/ranges.c                | 16 ++-------
>>   arch/riscv/kernel/machine_kexec_file.c     |  5 +--
>>   arch/x86/kernel/crash.c                    | 39 ++--------------------
>>   kernel/crash_core.c                        | 28 ++++++++++++++++
>>   6 files changed, 34 insertions(+), 78 deletions(-)
>>

[...]

>> -static int crash_exclude_mem_range_guarded(struct crash_mem
>> **mem_ranges,
>> -                       unsigned long long mstart,
>> -                       unsigned long long mend)
>> +static int crash_realloc_mem_range_guarded(struct crash_mem
>> **mem_ranges)
>>   {
>>       struct crash_mem *tmem = *mem_ranges;
>>   @@ -566,7 +564,7 @@ static int
>> crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
>>               return -ENOMEM;
>>       }
>>   -    return crash_exclude_mem_range(tmem, mstart, mend);
>> +    return 0;
>>   }
>>     /**
>> @@ -604,18 +602,10 @@ int get_crash_memory_ranges(struct crash_mem
>> **mem_ranges)
>>               sort_memory_ranges(*mem_ranges, true);
>>       }
>>   -    /* Exclude crashkernel region */
>> -    ret = crash_exclude_mem_range_guarded(mem_ranges,
>> crashk_res.start, crashk_res.end);
>> +    ret = crash_realloc_mem_range_guarded(mem_ranges);
> 
> What if max_nr_ranges - nr_ranges = 1, then no realloc will happen here.
> And in
> elf_header_exclude_ranges we may not enough space to store additional
> memory ranges needed while excluding one or more CMA ranges.

You're absolutely right — if max_nr_ranges - nr_ranges == 1 we skip the
realloc, yet elf_header_exclude_ranges() can easily need more than one
extra slot.

Thanks for catching this.
Jinjie

> 
>>       if (ret)
>>           goto out;
>>   -    for (i = 0; i < crashk_cma_cnt; ++i) {
>> -        ret = crash_exclude_mem_range_guarded(mem_ranges,
>> crashk_cma_ranges[i].start,
>> -                          crashk_cma_ranges[i].end);
>> -        if (ret)
>> -            goto out;
>> -    }
>> -
>>       /*
>>        * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
>>        *        regions are exported to save their context at the time of

[...]

>>   +static int crash_exclude_mem_ranges(struct crash_mem *cmem)
>> +{
>> +    int ret, i;
>> +
>> +    /* Exclude crashkernel region */
>> +    ret = crash_exclude_mem_range(cmem, crashk_res.start,
>> crashk_res.end);
>> +    if (ret)
>> +        return ret;
>> +
>> +    if (crashk_low_res.end) {
>> +        ret = crash_exclude_mem_range(cmem, crashk_low_res.start,
>> crashk_low_res.end);
>> +        if (ret)
>> +            return ret;
>> +    }
>>   +    for (i = 0; i < crashk_cma_cnt; ++i) {
>> +        ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
>> +                          crashk_cma_ranges[i].end);
>> +        if (ret)
>> +            return ret;
>> +    }
>>   +    return ret;
>> +}
>>     int crash_prepare_elf64_headers(struct crash_mem *mem, int
>> need_kernel_map,
>>                 void **addr, unsigned long *sz)
>> @@ -174,6 +197,11 @@ int crash_prepare_elf64_headers(struct crash_mem
>> *mem, int need_kernel_map,
>>       unsigned int cpu, i;
>>       unsigned long long notes_addr;
>>       unsigned long mstart, mend;
>> +    int ret;
>> +
>> +    ret = crash_exclude_mem_ranges(mem);
> 
> I think the assumption here is that mem should have enough space
> to hold the extra ranges created while excluding crash memory ranges.
> Right now, this is not happening on powerpc for the case I mentioned
> in the above comment.

Yes, as you mentioned above.

> 
> Also, if crashk_cma_cnt changes in the future, or if a new type of
> crash memory is added, then every architecture would need to adjust
> the mem allocation accordingly. Instead, could we handle this in
> generic code rather than in architecture-specific code, so that we
> always ensure mem has enough space?

I agree — hard-coding the worst-case count in every arch is a
maintenance trap.
Let's move the size calculation (and the realloc if needed) into the
generic crash core so that:

- New CMA regions or future crash-memory types are automatically
accounted for;

- Each architecture no longer has to play whack-a-mole with its private
array size.

Thanks for the suggestion.

> 
>> +    if (ret)
>> +        return ret;
>>         /* extra phdr for vmcoreinfo ELF note */
>>       nr_phdr = nr_cpus + 1;
> 


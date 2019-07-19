Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5996E1AB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 09:27:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qjJl25t5zDqrq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 17:27:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.132.183.28; helo=mx1.redhat.com;
 envelope-from=lijiang@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qf2B6qJBzDqjR
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 14:59:58 +1000 (AEST)
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A8707C024AF6;
 Fri, 19 Jul 2019 04:59:55 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-123.pek2.redhat.com
 [10.72.12.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C94C363633;
 Fri, 19 Jul 2019 04:59:45 +0000 (UTC)
Subject: Re: [PATCH v3 5/6] fs/core/vmcore: Move sev_active() reference to x86
 arch code
To: "Lendacky, Thomas" <Thomas.Lendacky@amd.com>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 "x86@kernel.org" <x86@kernel.org>
References: <20190718032858.28744-1-bauerman@linux.ibm.com>
 <20190718032858.28744-6-bauerman@linux.ibm.com>
 <4a07bf75-b516-c81b-da7a-4b323e6d7e52@amd.com>
From: lijiang <lijiang@redhat.com>
Message-ID: <c85ae8ff-3b7b-88bf-6b6a-c41b159c9cc2@redhat.com>
Date: Fri, 19 Jul 2019 12:59:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <4a07bf75-b516-c81b-da7a-4b323e6d7e52@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 19 Jul 2019 04:59:56 +0000 (UTC)
X-Mailman-Approved-At: Fri, 19 Jul 2019 17:26:22 +1000
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Baoquan He <bhe@redhat.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Mike Anderson <andmike@linux.ibm.com>,
 Ram Pai <linuxram@us.ibm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Alexey Dobriyan <adobriyan@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

在 2019年07月19日 01:47, Lendacky, Thomas 写道:
> On 7/17/19 10:28 PM, Thiago Jung Bauermann wrote:
>> Secure Encrypted Virtualization is an x86-specific feature, so it shouldn't
>> appear in generic kernel code because it forces non-x86 architectures to
>> define the sev_active() function, which doesn't make a lot of sense.
>>
>> To solve this problem, add an x86 elfcorehdr_read() function to override
>> the generic weak implementation. To do that, it's necessary to make
>> read_from_oldmem() public so that it can be used outside of vmcore.c.
>>
>> Also, remove the export for sev_active() since it's only used in files that
>> won't be built as modules.
>>
>> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> 
> Adding Lianbo and Baoquan, who recently worked on this, for their review.
> 

This change looks good to me.

Reviewed-by: Lianbo Jiang <lijiang@redhat.com>

Thanks.
Lianbo

> Thanks,
> Tom
> 
>> ---
>>  arch/x86/kernel/crash_dump_64.c |  5 +++++
>>  arch/x86/mm/mem_encrypt.c       |  1 -
>>  fs/proc/vmcore.c                |  8 ++++----
>>  include/linux/crash_dump.h      | 14 ++++++++++++++
>>  include/linux/mem_encrypt.h     |  1 -
>>  5 files changed, 23 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/x86/kernel/crash_dump_64.c b/arch/x86/kernel/crash_dump_64.c
>> index 22369dd5de3b..045e82e8945b 100644
>> --- a/arch/x86/kernel/crash_dump_64.c
>> +++ b/arch/x86/kernel/crash_dump_64.c
>> @@ -70,3 +70,8 @@ ssize_t copy_oldmem_page_encrypted(unsigned long pfn, char *buf, size_t csize,
>>  {
>>  	return __copy_oldmem_page(pfn, buf, csize, offset, userbuf, true);
>>  }
>> +
>> +ssize_t elfcorehdr_read(char *buf, size_t count, u64 *ppos)
>> +{
>> +	return read_from_oldmem(buf, count, ppos, 0, sev_active());
>> +}
>> diff --git a/arch/x86/mm/mem_encrypt.c b/arch/x86/mm/mem_encrypt.c
>> index 7139f2f43955..b1e823441093 100644
>> --- a/arch/x86/mm/mem_encrypt.c
>> +++ b/arch/x86/mm/mem_encrypt.c
>> @@ -349,7 +349,6 @@ bool sev_active(void)
>>  {
>>  	return sme_me_mask && sev_enabled;
>>  }
>> -EXPORT_SYMBOL(sev_active);
>>  
>>  /* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
>>  bool force_dma_unencrypted(struct device *dev)
>> diff --git a/fs/proc/vmcore.c b/fs/proc/vmcore.c
>> index 57957c91c6df..ca1f20bedd8c 100644
>> --- a/fs/proc/vmcore.c
>> +++ b/fs/proc/vmcore.c
>> @@ -100,9 +100,9 @@ static int pfn_is_ram(unsigned long pfn)
>>  }
>>  
>>  /* Reads a page from the oldmem device from given offset. */
>> -static ssize_t read_from_oldmem(char *buf, size_t count,
>> -				u64 *ppos, int userbuf,
>> -				bool encrypted)
>> +ssize_t read_from_oldmem(char *buf, size_t count,
>> +			 u64 *ppos, int userbuf,
>> +			 bool encrypted)
>>  {
>>  	unsigned long pfn, offset;
>>  	size_t nr_bytes;
>> @@ -166,7 +166,7 @@ void __weak elfcorehdr_free(unsigned long long addr)
>>   */
>>  ssize_t __weak elfcorehdr_read(char *buf, size_t count, u64 *ppos)
>>  {
>> -	return read_from_oldmem(buf, count, ppos, 0, sev_active());
>> +	return read_from_oldmem(buf, count, ppos, 0, false);
>>  }
>>  
>>  /*
>> diff --git a/include/linux/crash_dump.h b/include/linux/crash_dump.h
>> index f774c5eb9e3c..4664fc1871de 100644
>> --- a/include/linux/crash_dump.h
>> +++ b/include/linux/crash_dump.h
>> @@ -115,4 +115,18 @@ static inline int vmcore_add_device_dump(struct vmcoredd_data *data)
>>  	return -EOPNOTSUPP;
>>  }
>>  #endif /* CONFIG_PROC_VMCORE_DEVICE_DUMP */
>> +
>> +#ifdef CONFIG_PROC_VMCORE
>> +ssize_t read_from_oldmem(char *buf, size_t count,
>> +			 u64 *ppos, int userbuf,
>> +			 bool encrypted);
>> +#else
>> +static inline ssize_t read_from_oldmem(char *buf, size_t count,
>> +				       u64 *ppos, int userbuf,
>> +				       bool encrypted)
>> +{
>> +	return -EOPNOTSUPP;
>> +}
>> +#endif /* CONFIG_PROC_VMCORE */
>> +
>>  #endif /* LINUX_CRASHDUMP_H */
>> diff --git a/include/linux/mem_encrypt.h b/include/linux/mem_encrypt.h
>> index 0c5b0ff9eb29..5c4a18a91f89 100644
>> --- a/include/linux/mem_encrypt.h
>> +++ b/include/linux/mem_encrypt.h
>> @@ -19,7 +19,6 @@
>>  #else	/* !CONFIG_ARCH_HAS_MEM_ENCRYPT */
>>  
>>  static inline bool mem_encrypt_active(void) { return false; }
>> -static inline bool sev_active(void) { return false; }
>>  
>>  #endif	/* CONFIG_ARCH_HAS_MEM_ENCRYPT */
>>  
>>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A0D27B352
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Sep 2020 19:34:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C0V5T459czDqRv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Sep 2020 03:34:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZNdrlVOj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C0V3Q1JkYzDqLx
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Sep 2020 03:33:05 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08SHWs1v161106; Mon, 28 Sep 2020 13:32:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=ro2HfQmxTRjKe/1ij75XDoCBbwbP+cIbtL55Zc+p6eE=;
 b=ZNdrlVOjOKDNvoh49dlQAJudjceCAfWTK6C57K8dlj2WTu++fdFW7KdhhLpumy3+IrRL
 d7cbHxIdgknIHaMHwiVf1Am++Tr4q6Anl+N6GeunCcrR8brhw87fw8e1KIGgHxa/4QE/
 PJY/nlxBLpncZZjmDoOIKDpemwb0GjK+q5ys9JzIp0Y5YSrywmgPMkZQS7uGoz/kwyKi
 va0e8Jn8MxVCQ5EOz8/R/N1ptcGybfh8FhQmD2yM7NT/84SkD4/7+YN6gktrAY+ycpVB
 ofrdyPyUg29euAQeHFWdHr76TS7/jpcmQeliqj6kSgYYO30A4DxKhklatjw81YyHF4vg kw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33uhnwnefu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 13:32:57 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08SHWuGG161306;
 Mon, 28 Sep 2020 13:32:56 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33uhnwnecb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 13:32:56 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08SHRMRm022178;
 Mon, 28 Sep 2020 17:32:44 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 33sw982cb6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 28 Sep 2020 17:32:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08SHWgeI26345944
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 28 Sep 2020 17:32:42 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6CB3FAE055;
 Mon, 28 Sep 2020 17:32:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE01CAE051;
 Mon, 28 Sep 2020 17:32:40 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.85.72.170])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 28 Sep 2020 17:32:40 +0000 (GMT)
Subject: Re: [PATCH v2 2/3] lkdtm/powerpc: Add SLB multihit test
To: Kees Cook <keescook@chromium.org>
References: <20200925103123.21102-1-ganeshgr@linux.ibm.com>
 <20200925103123.21102-3-ganeshgr@linux.ibm.com>
 <202009251244.A4396AFF@keescook>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <183d7485-6f39-5536-9dfa-eaaa145f4b29@linux.ibm.com>
Date: Mon, 28 Sep 2020 23:02:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202009251244.A4396AFF@keescook>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-28_16:2020-09-28,
 2020-09-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009280133
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
Cc: msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 9/26/20 1:27 AM, Kees Cook wrote:
> On Fri, Sep 25, 2020 at 04:01:22PM +0530, Ganesh Goudar wrote:
>> Add support to inject slb multihit errors, to test machine
>> check handling.
> Thank you for more tests in here!
>
>> Based on work by Mahesh Salgaonkar and Michal Suchánek.
>>
>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>> Cc: Michal Suchánek <msuchanek@suse.de>
> Should these be Co-developed-by: with S-o-b?
Sure, ill add.
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>>   drivers/misc/lkdtm/Makefile  |   4 ++
>>   drivers/misc/lkdtm/core.c    |   3 +
>>   drivers/misc/lkdtm/lkdtm.h   |   3 +
>>   drivers/misc/lkdtm/powerpc.c | 132 +++++++++++++++++++++++++++++++++++
>>   4 files changed, 142 insertions(+)
>>   create mode 100644 drivers/misc/lkdtm/powerpc.c
>>
>> diff --git a/drivers/misc/lkdtm/Makefile b/drivers/misc/lkdtm/Makefile
>> index c70b3822013f..6a82f407fbcd 100644
>> --- a/drivers/misc/lkdtm/Makefile
>> +++ b/drivers/misc/lkdtm/Makefile
>> @@ -11,6 +11,10 @@ lkdtm-$(CONFIG_LKDTM)		+= usercopy.o
>>   lkdtm-$(CONFIG_LKDTM)		+= stackleak.o
>>   lkdtm-$(CONFIG_LKDTM)		+= cfi.o
>>   
>> +ifeq ($(CONFIG_PPC64),y)
>> +lkdtm-$(CONFIG_LKDTM)		+= powerpc.o
>> +endif
> This can just be:
>
> lkdtm-$(CONFIG_PPC64)		+= powerpc.o
ok
>> +
>>   KASAN_SANITIZE_stackleak.o	:= n
>>   KCOV_INSTRUMENT_rodata.o	:= n
>>   
>> diff --git a/drivers/misc/lkdtm/core.c b/drivers/misc/lkdtm/core.c
>> index a5e344df9166..8d5db42baa90 100644
>> --- a/drivers/misc/lkdtm/core.c
>> +++ b/drivers/misc/lkdtm/core.c
>> @@ -178,6 +178,9 @@ static const struct crashtype crashtypes[] = {
>>   #ifdef CONFIG_X86_32
>>   	CRASHTYPE(DOUBLE_FAULT),
>>   #endif
>> +#ifdef CONFIG_PPC64
>> +	CRASHTYPE(PPC_SLB_MULTIHIT),
>> +#endif
>>   };
>>   
>>   
>> diff --git a/drivers/misc/lkdtm/lkdtm.h b/drivers/misc/lkdtm/lkdtm.h
>> index 8878538b2c13..b305bd511ee5 100644
>> --- a/drivers/misc/lkdtm/lkdtm.h
>> +++ b/drivers/misc/lkdtm/lkdtm.h
>> @@ -104,4 +104,7 @@ void lkdtm_STACKLEAK_ERASING(void);
>>   /* cfi.c */
>>   void lkdtm_CFI_FORWARD_PROTO(void);
>>   
>> +/* powerpc.c */
>> +void lkdtm_PPC_SLB_MULTIHIT(void);
>> +
>>   #endif
>> diff --git a/drivers/misc/lkdtm/powerpc.c b/drivers/misc/lkdtm/powerpc.c
>> new file mode 100644
>> index 000000000000..d6db18444757
>> --- /dev/null
>> +++ b/drivers/misc/lkdtm/powerpc.c
>> @@ -0,0 +1,132 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
> Please #include "lkdtm.h" here to get the correct pr_fmt heading (and
> any future header adjustments).
Sure
>> +#include <linux/slab.h>
>> +#include <linux/vmalloc.h>
>> +
>> +static inline unsigned long get_slb_index(void)
>> +{
>> +	unsigned long index;
>> +
>> +	index = get_paca()->stab_rr;
>> +
>> +	/*
>> +	 * simple round-robin replacement of slb starting at SLB_NUM_BOLTED.
>> +	 */
>> +	if (index < (mmu_slb_size - 1))
>> +		index++;
>> +	else
>> +		index = SLB_NUM_BOLTED;
>> +	get_paca()->stab_rr = index;
>> +	return index;
>> +}
>> +
>> +#define slb_esid_mask(ssize)	\
>> +	(((ssize) == MMU_SEGSIZE_256M) ? ESID_MASK : ESID_MASK_1T)
>> +
>> +static inline unsigned long mk_esid_data(unsigned long ea, int ssize,
>> +					 unsigned long slot)
>> +{
>> +	return (ea & slb_esid_mask(ssize)) | SLB_ESID_V | slot;
>> +}
>> +
>> +#define slb_vsid_shift(ssize)	\
>> +	((ssize) == MMU_SEGSIZE_256M ? SLB_VSID_SHIFT : SLB_VSID_SHIFT_1T)
>> +
>> +static inline unsigned long mk_vsid_data(unsigned long ea, int ssize,
>> +					 unsigned long flags)
>> +{
>> +	return (get_kernel_vsid(ea, ssize) << slb_vsid_shift(ssize)) | flags |
>> +		((unsigned long)ssize << SLB_VSID_SSIZE_SHIFT);
>> +}
>> +
>> +static void insert_slb_entry(char *p, int ssize)
>> +{
>> +	unsigned long flags, entry;
>> +
>> +	flags = SLB_VSID_KERNEL | mmu_psize_defs[MMU_PAGE_64K].sllp;
>> +	preempt_disable();
>> +
>> +	entry = get_slb_index();
>> +	asm volatile("slbmte %0,%1" :
>> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
>> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
>> +			: "memory");
>> +
>> +	entry = get_slb_index();
>> +	asm volatile("slbmte %0,%1" :
>> +			: "r" (mk_vsid_data((unsigned long)p, ssize, flags)),
>> +			  "r" (mk_esid_data((unsigned long)p, ssize, entry))
>> +			: "memory");
>> +	preempt_enable();
>> +	p[0] = '!';
>> +}
> Can you add some comments to these helpers? It'll help people (me) with
> understanding what is actually being done here (and more importantly,
> what is _expected_ to happen).
Sure, ill add comments.
>> +
>> +static void inject_vmalloc_slb_multihit(void)
>> +{
>> +	char *p;
>> +
>> +	p = vmalloc(2048);
>> +	if (!p)
>> +		return;
>> +
>> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
>> +	vfree(p);
>> +}
>> +
>> +static void inject_kmalloc_slb_multihit(void)
>> +{
>> +	char *p;
>> +
>> +	p = kmalloc(2048, GFP_KERNEL);
>> +	if (!p)
>> +		return;
>> +
>> +	insert_slb_entry(p, MMU_SEGSIZE_1T);
>> +	kfree(p);
>> +}
> It looks like the expected failure injection is actually the "p[0] = '!'" line in the
> "insert" helper? I would expect pr_info/pr_err wrappers, etc, as in
> other lkdtm tests.
Yes "p[0] = '!'" is the final step in this error injection, ill add 
comments.
> If this is the negative test, what does the positive test look like?
> e.g. in other lkdtm tests, first a positive test is done, then a
> negative: first run a legit function, then run a function from a bad
> location.

Yes, this is negative test, As SLB search is very fundamental thing in 
address translation and

used all the time, no positive test required here.

>> +
>> +static void insert_dup_slb_entry_0(void)
>> +{
>> +	unsigned long test_address = 0xC000000000000000;
>> +	volatile unsigned long *test_ptr;
>> +	unsigned long entry, i = 0;
>> +	unsigned long esid, vsid;
>> +
>> +	test_ptr = (unsigned long *)test_address;
>> +	preempt_disable();
>> +
>> +	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
>> +	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
>> +	entry = get_slb_index();
>> +
>> +	/* for i !=0 we would need to mask out the old entry number */
>> +	asm volatile("slbmte %0,%1" :
>> +			: "r" (vsid),
>> +			  "r" (esid | entry)
>> +			: "memory");
>> +
>> +	asm volatile("slbmfee  %0,%1" : "=r" (esid) : "r" (i));
>> +	asm volatile("slbmfev  %0,%1" : "=r" (vsid) : "r" (i));
>> +	entry = get_slb_index();
>> +
>> +	/* for i !=0 we would need to mask out the old entry number */
>> +	asm volatile("slbmte %0,%1" :
>> +			: "r" (vsid),
>> +			  "r" (esid | entry)
>> +			: "memory");
>> +
>> +	pr_info("lkdtm: %s accessing test address 0x%lx: 0x%lx\n",
>> +		__func__, test_address, *test_ptr);
>> +
>> +	preempt_enable();
>> +}
> What does this do?

It tries to inject error in address range where most important kernel 
data structure may fall.

Mahesh and Michal Suchánek correct me if I am wrong.

>> +
>> +void lkdtm_PPC_SLB_MULTIHIT(void)
>> +{
>> +	if (mmu_has_feature(MMU_FTR_HPTE_TABLE)) {
>> +		inject_vmalloc_slb_multihit();
>> +		inject_kmalloc_slb_multihit();
>> +		insert_dup_slb_entry_0();
>> +	}
>> +	pr_info("Recovered from SLB multihit. (Ignore this message on non HPTE machines)");
> Is this bad? If so, I'd expect pr_err("FAIL: ...") Can HPTE machines be
> detected so that an XFAIL can be emitted instead?

Sure, ill add XFAIL print in non HPTE case. And in case of failure we 
will not return

here, so if we hit this print line we are good.

> Since there are three (two?) distinct regions being tested, should these
> be separate tests? Right now there is no way to separate a vmalloc
> failure from a kmalloc failure, and no way to fail the first without
> hiding the result from the latter (or maybe the machine cannot survive
> this test? ... which should also be a comment.)
Sure, ill comment, And yes machine cannot survive these tests in case of 
failure to handle.
> And finally, assuming a successful test (or testing from a separate
> thread later), so there any state that needs to be restored (or cleaned
> up before doing the "insert" calls)?
No, there is nothing to be restored here, Thanks!
> Thanks!
>

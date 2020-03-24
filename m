Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A521902BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 01:19:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mX1S4vtczDqxs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 11:19:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=156.151.31.86; helo=userp2130.oracle.com;
 envelope-from=mike.kravetz@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=aqvpMirK; 
 dkim-atps=neutral
Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mWzq46KWzDqq7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 11:17:59 +1100 (AEDT)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02O09YG8101123;
 Tue, 24 Mar 2020 00:16:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=corp-2020-01-29;
 bh=qucvghpoTdILPTGy1ayS/oGNuZVW39YLrBCxVQGMlkI=;
 b=aqvpMirKBt1NJdtlsrSKhG0fCcNDi73oMY445HOPQD+iQDukide0Gq6NBKjUZ2dn9zUA
 moSyOm1QxcZjgH/GkKKncTrzTpECJnoALJ7Zu1eGMPYX9OqD1CJJOX55NEDWgMGpm5rh
 gv9qoNBF1/gVOpiIhxNFWUdF8eHT+5vcXg/Of8GzT1/ehfvJAsncLuNWSlubn/OxjzwC
 iU7SxxMYR2MJLx8/26Ws0FrylblAoVfzLWJ88IGseK6X67t2WS6Bei/Lhk6oPBjFhEky
 I30desApPc5awCny1pkMcA5X1oy9E/f+MhCdLYASjcAUKrO2ga1OrqnSfu4Cgk0uW5ka Wg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2ywabr1hu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 00:16:57 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 02O07oaW152173;
 Tue, 24 Mar 2020 00:16:56 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2yxw6kj6yb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 Mar 2020 00:16:56 +0000
Received: from abhmp0001.oracle.com (abhmp0001.oracle.com [141.146.116.7])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 02O0Gh8a030687;
 Tue, 24 Mar 2020 00:16:43 GMT
Received: from [192.168.1.206] (/71.63.128.209)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Mon, 23 Mar 2020 17:16:43 -0700
Subject: Re: [PATCH 3/4] hugetlbfs: remove hugetlb_add_hstate() warning for
 existing hstate
To: Mina Almasry <almasrymina@google.com>
References: <20200318220634.32100-1-mike.kravetz@oracle.com>
 <20200318220634.32100-4-mike.kravetz@oracle.com>
 <CAHS8izN1Q+yiZq8zcU8hoojafcQ19W7XQx-HyFm3Ud8hSvN1Nw@mail.gmail.com>
From: Mike Kravetz <mike.kravetz@oracle.com>
Message-ID: <54fd7234-bdd9-de78-9351-16706bae2c08@oracle.com>
Date: Mon, 23 Mar 2020 17:16:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHS8izN1Q+yiZq8zcU8hoojafcQ19W7XQx-HyFm3Ud8hSvN1Nw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0
 malwarescore=0 mlxscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230120
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9569
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 clxscore=1015 adultscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003230120
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
Cc: linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Vasily Gorbik <gor@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 open list <linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S.Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/23/20 5:01 PM, Mina Almasry wrote:
> On Wed, Mar 18, 2020 at 3:07 PM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>>
>> The routine hugetlb_add_hstate prints a warning if the hstate already
>> exists.  This was originally done as part of kernel command line
>> parsing.  If 'hugepagesz=' was specified more than once, the warning
>>         pr_warn("hugepagesz= specified twice, ignoring\n");
>> would be printed.
>>
>> Some architectures want to enable all huge page sizes.  They would
>> call hugetlb_add_hstate for all supported sizes.  However, this was
>> done after command line processing and as a result hstates could have
>> already been created for some sizes.  To make sure no warning were
>> printed, there would often be code like:
>>         if (!size_to_hstate(size)
>>                 hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT)
>>
>> The only time we want to print the warning is as the result of command
>> line processing.  So, remove the warning from hugetlb_add_hstate and
>> add it to the single arch independent routine processing "hugepagesz=".
>> After this, calls to size_to_hstate() in arch specific code can be
>> removed and hugetlb_add_hstate can be called without worrying about
>> warning messages.
>>
>> Signed-off-by: Mike Kravetz <mike.kravetz@oracle.com>
>> ---
>>  arch/arm64/mm/hugetlbpage.c   | 16 ++++------------
>>  arch/powerpc/mm/hugetlbpage.c |  3 +--
>>  arch/riscv/mm/hugetlbpage.c   |  2 +-
>>  arch/sparc/mm/init_64.c       | 19 ++++---------------
>>  arch/x86/mm/hugetlbpage.c     |  2 +-
>>  mm/hugetlb.c                  | 10 +++++++---
>>  6 files changed, 18 insertions(+), 34 deletions(-)
>>
>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>> index 4aa9534a45d7..050809e6f0a9 100644
>> --- a/arch/arm64/mm/hugetlbpage.c
>> +++ b/arch/arm64/mm/hugetlbpage.c
>> @@ -441,22 +441,14 @@ void huge_ptep_clear_flush(struct vm_area_struct *vma,
>>         clear_flush(vma->vm_mm, addr, ptep, pgsize, ncontig);
>>  }
>>
>> -static void __init add_huge_page_size(unsigned long size)
>> -{
>> -       if (size_to_hstate(size))
>> -               return;
>> -
>> -       hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
>> -}
>> -
>>  static int __init hugetlbpage_init(void)
>>  {
>>  #ifdef CONFIG_ARM64_4K_PAGES
>> -       add_huge_page_size(PUD_SIZE);
>> +       hugetlb_add_hstate(ilog2(PUD_SIZE) - PAGE_SHIFT);
>>  #endif
>> -       add_huge_page_size(CONT_PMD_SIZE);
>> -       add_huge_page_size(PMD_SIZE);
>> -       add_huge_page_size(CONT_PTE_SIZE);
>> +       hugetlb_add_hstate(ilog2(CONT_PMD_SIZE) - PAGE_SHIFT);
>> +       hugetlb_add_hstate(ilog2(PMD_SIZE) - PAGE_SHIFT);
>> +       hugetlb_add_hstate(ilog2(CONT_PTE_SIZE) - PAGE_SHIFT);
>>
>>         return 0;
>>  }
>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
>> index 166960ba1236..f46464ba6fb4 100644
>> --- a/arch/powerpc/mm/hugetlbpage.c
>> +++ b/arch/powerpc/mm/hugetlbpage.c
>> @@ -584,8 +584,7 @@ static int __init add_huge_page_size(unsigned long long size)
>>         if (!arch_hugetlb_valid_size(size))
>>                 return -EINVAL;
>>
>> -       if (!size_to_hstate(size))
>> -               hugetlb_add_hstate(shift - PAGE_SHIFT);
>> +       hugetlb_add_hstate(shift - PAGE_SHIFT);
>>         return 0;
>>  }
>>
>> diff --git a/arch/riscv/mm/hugetlbpage.c b/arch/riscv/mm/hugetlbpage.c
>> index bdf89d7eb714..beaa91941db8 100644
>> --- a/arch/riscv/mm/hugetlbpage.c
>> +++ b/arch/riscv/mm/hugetlbpage.c
>> @@ -26,7 +26,7 @@ bool __init arch_hugetlb_valid_size(unsigned long long size)
>>  static __init int gigantic_pages_init(void)
>>  {
>>         /* With CONTIG_ALLOC, we can allocate gigantic pages at runtime */
>> -       if (IS_ENABLED(CONFIG_64BIT) && !size_to_hstate(1UL << PUD_SHIFT))
>> +       if (IS_ENABLED(CONFIG_64BIT))
>>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>>         return 0;
>>  }
>> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
>> index 5c29203fd460..8f619edc8f8c 100644
>> --- a/arch/sparc/mm/init_64.c
>> +++ b/arch/sparc/mm/init_64.c
>> @@ -325,23 +325,12 @@ static void __update_mmu_tsb_insert(struct mm_struct *mm, unsigned long tsb_inde
>>  }
>>
>>  #ifdef CONFIG_HUGETLB_PAGE
>> -static void __init add_huge_page_size(unsigned long size)
>> -{
>> -       unsigned int order;
>> -
>> -       if (size_to_hstate(size))
>> -               return;
>> -
>> -       order = ilog2(size) - PAGE_SHIFT;
>> -       hugetlb_add_hstate(order);
>> -}
>> -
>>  static int __init hugetlbpage_init(void)
>>  {
>> -       add_huge_page_size(1UL << HPAGE_64K_SHIFT);
>> -       add_huge_page_size(1UL << HPAGE_SHIFT);
>> -       add_huge_page_size(1UL << HPAGE_256MB_SHIFT);
>> -       add_huge_page_size(1UL << HPAGE_2GB_SHIFT);
>> +       hugetlb_add_hstate(HPAGE_64K_SHIFT - PAGE_SHIFT);
>> +       hugetlb_add_hstate(HPAGE_SHIFT - PAGE_SHIFT);
>> +       hugetlb_add_hstate(HPAGE_256MB_SHIFT - PAGE_SHIFT);
>> +       hugetlb_add_hstate(HPAGE_2GB_SHIFT - PAGE_SHIFT);
>>
>>         return 0;
>>  }
>> diff --git a/arch/x86/mm/hugetlbpage.c b/arch/x86/mm/hugetlbpage.c
>> index dd3ed09f6c23..8a3f586e1217 100644
>> --- a/arch/x86/mm/hugetlbpage.c
>> +++ b/arch/x86/mm/hugetlbpage.c
>> @@ -195,7 +195,7 @@ bool __init arch_hugetlb_valid_size(unsigned long long size)
>>  static __init int gigantic_pages_init(void)
>>  {
>>         /* With compaction or CMA we can allocate gigantic pages at runtime */
>> -       if (boot_cpu_has(X86_FEATURE_GBPAGES) && !size_to_hstate(1UL << PUD_SHIFT))
>> +       if (boot_cpu_has(X86_FEATURE_GBPAGES))
>>                 hugetlb_add_hstate(PUD_SHIFT - PAGE_SHIFT);
>>         return 0;
>>  }
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index cd4ec07080fb..cc85b4f156ca 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -3116,8 +3116,7 @@ static int __init hugetlb_init(void)
>>                 }
>>
>>                 default_hstate_size = HPAGE_SIZE;
>> -               if (!size_to_hstate(default_hstate_size))
>> -                       hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
>> +               hugetlb_add_hstate(HUGETLB_PAGE_ORDER);
>>         }
>>         default_hstate_idx = hstate_index(size_to_hstate(default_hstate_size));
>>         if (default_hstate_max_huge_pages) {
>> @@ -3155,7 +3154,6 @@ void __init hugetlb_add_hstate(unsigned int order)
>>         unsigned long i;
>>
>>         if (size_to_hstate(PAGE_SIZE << order)) {
>> -               pr_warn("hugepagesz= specified twice, ignoring\n");
>>                 return;
>>         }
>>         BUG_ON(hugetlb_max_hstate >= HUGE_MAX_HSTATE);
>> @@ -3231,6 +3229,12 @@ static int __init hugepagesz_setup(char *s)
>>                 return 0;
>>         }
>>
>> +       if (size_to_hstate(size)) {
>> +               pr_warn("HugeTLB: hugepagesz %s specified twice, ignoring\n",
>> +                       saved_s);
>> +               return 0;
>> +       }
>> +
> 
> Not too familiar with the code but I'm a bit confused by this print.
> AFAICT this prints the warning when hugepagesz= refers to a hugepage
> that is already added via hugetlb_add_hstate, but there is a default
> hstate added here without the user specifying hugepagesz, no?

Correct.

>                                                               Does
> that mean the warning prints if you specify this size?

The code which adds the default hstate (in hugetlb_init) runs after this
code which is reading/processing command line options.  So, the case you
are concerned with will not happen.

Thanks for taking a look,
-- 
Mike Kravetz

> 'HugeTLB: hugepage size already supported: xxxxx' or
> 'HugeTLB: hugepage size xxxx specified twice or is default size, ignoring.'
> 
> Or don't print anything if it's the default size.
> 
>>         hugetlb_add_hstate(ilog2(size) - PAGE_SHIFT);
>>         return 1;
>>  }
>> --
>> 2.24.1

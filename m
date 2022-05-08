Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D8C51EDB6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 15:13:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kx4W74BQnz3cFj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 23:13:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132;
 helo=out30-132.freemail.mail.aliyun.com;
 envelope-from=baolin.wang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-132.freemail.mail.aliyun.com
 (out30-132.freemail.mail.aliyun.com [115.124.30.132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kx4Vf6LYqz2xh0
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 23:13:14 +1000 (AEST)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04407;
 MF=baolin.wang@linux.alibaba.com; NM=1; PH=DS; RN=31; SR=0;
 TI=SMTPD_---0VCaT1jO_1652015583; 
Received: from 30.15.195.77(mailfrom:baolin.wang@linux.alibaba.com
 fp:SMTPD_---0VCaT1jO_1652015583) by smtp.aliyun-inc.com(127.0.0.1);
 Sun, 08 May 2022 21:13:05 +0800
Message-ID: <474b8548-4e17-a6e7-a0f7-8f248aabe462@linux.alibaba.com>
Date: Sun, 8 May 2022 21:13:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v2 2/3] mm: rmap: Fix CONT-PTE/PMD size hugetlb issue when
 migration
To: kernel test robot <lkp@intel.com>, akpm@linux-foundation.org,
 mike.kravetz@oracle.com, catalin.marinas@arm.com, will@kernel.org
References: <1ec8a987be1a5400e077260a300d0079564b1472.1652002221.git.baolin.wang@linux.alibaba.com>
 <202205081910.mStoC5rj-lkp@intel.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <202205081910.mStoC5rj-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: dalias@libc.org, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-kernel@vger.kernel.org, James.Bottomley@hansenpartnership.com,
 paulus@samba.org, sparclinux@vger.kernel.org, agordeev@linux.ibm.com,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, arnd@arndb.de,
 ysato@users.sourceforge.jp, deller@gmx.de, borntraeger@linux.ibm.com,
 gor@linux.ibm.com, hca@linux.ibm.com, linux-arm-kernel@lists.infradead.org,
 tsbogend@alpha.franken.de, kbuild-all@lists.01.org,
 linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, svens@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 5/8/2022 8:01 PM, kernel test robot wrote:
> Hi Baolin,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on akpm-mm/mm-everything]
> [also build test ERROR on next-20220506]
> [cannot apply to hnaz-mm/master arm64/for-next/core linus/master v5.18-rc5]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Baolin-Wang/Fix-CONT-PTE-PMD-size-hugetlb-issue-when-unmapping-or-migrating/20220508-174036
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
> config: x86_64-randconfig-a013 (https://download.01.org/0day-ci/archive/20220508/202205081910.mStoC5rj-lkp@intel.com/config)
> compiler: gcc-11 (Debian 11.2.0-20) 11.2.0
> reproduce (this is a W=1 build):
>          # https://github.com/intel-lab-lkp/linux/commit/907981b27213707fdb2f8a24c107d6752a09a773
>          git remote add linux-review https://github.com/intel-lab-lkp/linux
>          git fetch --no-tags linux-review Baolin-Wang/Fix-CONT-PTE-PMD-size-hugetlb-issue-when-unmapping-or-migrating/20220508-174036
>          git checkout 907981b27213707fdb2f8a24c107d6752a09a773
>          # save the config file
>          mkdir build_dir && cp config build_dir/.config
>          make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     mm/rmap.c: In function 'try_to_migrate_one':
>>> mm/rmap.c:1931:34: error: implicit declaration of function 'huge_ptep_clear_flush'; did you mean 'ptep_clear_flush'? [-Werror=implicit-function-declaration]
>      1931 |                         pteval = huge_ptep_clear_flush(vma, address, pvmw.pte);
>           |                                  ^~~~~~~~~~~~~~~~~~~~~
>           |                                  ptep_clear_flush
>>> mm/rmap.c:1931:34: error: incompatible types when assigning to type 'pte_t' from type 'int'
>>> mm/rmap.c:2023:41: error: implicit declaration of function 'set_huge_pte_at'; did you mean 'set_huge_swap_pte_at'? [-Werror=implicit-function-declaration]
>      2023 |                                         set_huge_pte_at(mm, address, pvmw.pte, pteval);
>           |                                         ^~~~~~~~~~~~~~~
>           |                                         set_huge_swap_pte_at
>     cc1: some warnings being treated as errors

Thanks for reporting. I think I should add some dummy functions in 
hugetlb.h file if the CONFIG_HUGETLB_PAGE is not selected. I can pass 
the building with below changes and your config file.

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 306d6ef..9f71043 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -1093,6 +1093,17 @@ static inline void set_huge_swap_pte_at(struct 
mm_struct *mm, unsigned long addr
                                         pte_t *ptep, pte_t pte, 
unsigned long sz)
  {
  }
+
+static inline pte_t huge_ptep_clear_flush(struct vm_area_struct *vma,
+                                         unsigned long addr, pte_t *ptep)
+{
+       return ptep_get(ptep);
+}
+
+static inline void set_huge_pte_at(struct mm_struct *mm, unsigned long 
addr,
+                                  pte_t *ptep, pte_t pte)
+{
+}
  #endif /* CONFIG_HUGETLB_PAGE */

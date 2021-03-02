Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BFDD23295CA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 05:01:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqNjH62PNz3cbW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 15:01:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DqNhx2Grlz30Jb
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 15:01:03 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4931BED1;
 Mon,  1 Mar 2021 20:00:59 -0800 (PST)
Received: from [10.163.67.84] (unknown [10.163.67.84])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 287403F73B;
 Mon,  1 Mar 2021 20:00:55 -0800 (PST)
Subject: Re: [PATCH] mm: Generalize HUGETLB_PAGE_SIZE_VARIABLE
To: kernel test robot <lkp@intel.com>, linux-mm@kvack.org
References: <1614577853-7452-1-git-send-email-anshuman.khandual@arm.com>
 <202103011736.uYkOLJKy-lkp@intel.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <eaa998f0-248f-59d9-c410-873e12a79afe@arm.com>
Date: Tue, 2 Mar 2021 09:31:29 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <202103011736.uYkOLJKy-lkp@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
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
Cc: kbuild-all@lists.01.org, Paul Mackerras <paulus@samba.org>,
 linux-ia64@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/1/21 3:22 PM, kernel test robot wrote:
> Hi Anshuman,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on powerpc/next]
> [also build test ERROR on linus/master v5.12-rc1 next-20210301]
> [cannot apply to hnaz-linux-mm/master]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-Generalize-HUGETLB_PAGE_SIZE_VARIABLE/20210301-135205
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
> config: ia64-randconfig-r003-20210301 (attached as .config)
> compiler: ia64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/fe78e3508e5221ac13aa288136e2a6506211be68
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Anshuman-Khandual/mm-Generalize-HUGETLB_PAGE_SIZE_VARIABLE/20210301-135205
>         git checkout fe78e3508e5221ac13aa288136e2a6506211be68
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-9.3.0 make.cross ARCH=ia64 
> 
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from arch/ia64/include/asm/pgtable.h:154,
>                     from include/linux/pgtable.h:6,
>                     from include/linux/mm.h:33,
>                     from mm/page_alloc.c:19:
>    arch/ia64/include/asm/mmu_context.h: In function 'reload_context':
>    arch/ia64/include/asm/mmu_context.h:127:41: warning: variable 'old_rr4' set but not used [-Wunused-but-set-variable]
>      127 |  unsigned long rr0, rr1, rr2, rr3, rr4, old_rr4;
>          |                                         ^~~~~~~
>    In file included from include/linux/kconfig.h:7,
>                     from <command-line>:
>    mm/page_alloc.c: At top level:
>>> ./include/generated/autoconf.h:269:36: error: expected identifier or '(' before numeric constant
>      269 | #define CONFIG_FORCE_MAX_ZONEORDER 11
>          |                                    ^~
>    include/linux/mmzone.h:29:19: note: in expansion of macro 'CONFIG_FORCE_MAX_ZONEORDER'
>       29 | #define MAX_ORDER CONFIG_FORCE_MAX_ZONEORDER
>          |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~
>    include/linux/pageblock-flags.h:48:27: note: in expansion of macro 'MAX_ORDER'
>       48 | #define pageblock_order  (MAX_ORDER-1)
>          |                           ^~~~~~~~~
>    mm/page_alloc.c:250:14: note: in expansion of macro 'pageblock_order'
>      250 | unsigned int pageblock_order __read_mostly;
>          |              ^~~~~~~~~~~~~~~
>    mm/page_alloc.c:2618:5: warning: no previous prototype for 'find_suitable_fallback' [-Wmissing-prototypes]
>     2618 | int find_suitable_fallback(struct free_area *area, unsigned int order,
>          |     ^~~~~~~~~~~~~~~~~~~~~~
>    mm/page_alloc.c:3596:15: warning: no previous prototype for 'should_fail_alloc_page' [-Wmissing-prototypes]
>     3596 | noinline bool should_fail_alloc_page(gfp_t gfp_mask, unsigned int order)
>          |               ^~~~~~~~~~~~~~~~~~~~~~
>    mm/page_alloc.c:6257:23: warning: no previous prototype for 'memmap_init' [-Wmissing-prototypes]
>     6257 | void __meminit __weak memmap_init(unsigned long size, int nid,
>          |                       ^~~~~~~~~~~
>    mm/page_alloc.c: In function 'set_pageblock_order':
>>> mm/page_alloc.c:6798:6: error: 'HPAGE_SHIFT' undeclared (first use in this function); did you mean 'PAGE_SHIFT'?
>     6798 |  if (HPAGE_SHIFT > PAGE_SHIFT)
>          |      ^~~~~~~~~~~
>          |      PAGE_SHIFT
>    mm/page_alloc.c:6798:6: note: each undeclared identifier is reported only once for each function it appears in
>>> mm/page_alloc.c:6799:11: error: 'HUGETLB_PAGE_ORDER' undeclared (first use in this function)
>     6799 |   order = HUGETLB_PAGE_ORDER;
>          |           ^~~~~~~~~~~~~~~~~~
>>> mm/page_alloc.c:6808:18: error: lvalue required as left operand of assignment
>     6808 |  pageblock_order = order;
>          |                  ^
> 
> Kconfig warnings: (for reference only)
>    WARNING: unmet direct dependencies detected for HUGETLB_PAGE_SIZE_VARIABLE
>    Depends on HUGETLB_PAGE
>    Selected by
>    - IA64

This shows that HUGETLB_PAGE_SIZE_VARIABLE could be selected without HUGETLB_PAGE
being enabled, which was not intended. The dependency on HUGETLB_PAGE need to be
explicit for HUGETLB_PAGE_SIZE_VARIABLE.

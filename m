Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4188DF2923
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 09:32:11 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477xTh5CfqzF6DB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 19:32:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 477xDp3v3pzF5mv
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 19:20:56 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 867FF7A7;
 Wed,  6 Nov 2019 20:44:18 -0800 (PST)
Received: from [10.163.1.1] (unknown [10.163.1.1])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C69DD3F71A;
 Wed,  6 Nov 2019 20:43:56 -0800 (PST)
Subject: Re: [PATCH V8] mm/debug: Add tests validating architecture page table
 helpers
To: Vineet Gupta <Vineet.Gupta1@synopsys.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Andrew Morton <akpm@linux-foundation.org>
References: <1572240562-23630-1-git-send-email-anshuman.khandual@arm.com>
 <e0aa8d49-5511-15e4-f413-62c99eea4fab@arm.com>
 <e0dc3636-8c6e-0177-9a7f-fefd28c74f27@synopsys.com>
 <dc2746c9-bde4-ac00-88d1-2bd1cea1f105@arm.com>
 <b93ffe1f-b198-a042-ecd4-b0f2b0171f72@synopsys.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <da665683-6946-b411-57f9-e1689d4b50fe@arm.com>
Date: Thu, 7 Nov 2019 10:14:30 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b93ffe1f-b198-a042-ecd4-b0f2b0171f72@synopsys.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>, James Hogan <jhogan@kernel.org>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, "x86@kernel.org" <x86@kernel.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 Ralf Baechle <ralf@linux-mips.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/06/2019 11:37 PM, Vineet Gupta wrote:
> On 11/5/19 7:03 PM, Anshuman Khandual wrote:
>> But should not pfn_pmd() be encapsulated inside HAVE_ARCH_TRANSPARENT_HUGEPAGE
>> at the minimum (but I would say it should be available always, nonetheless) when
>> the platform subscribes to THP irrespective of whether THP is enabled or not.
> 
> For ARC it was only introduced/needed when I added THP support so it is dependent
> in some way.
Right, it is dependent.

> 
>> I could see in the file (arch/arc/include/asm/pgtable.h) that fetching pfn_pmd()
>> and all other basic PMD definitions is conditional on CONFIG_TRANSPARENT_HUGEPAGE.
>>
>> #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> #include <asm/hugepage.h>
>> #endif
>>
>> IIUC, CONFIG_TRANSPARENT_HUGEPAGE should only encapsulate PMD page table helpers
>> which are expected from generic THP code (pmd_trans_huge, pmdp_set_access_flags
>> etc) but not the basic PMD helpers like pmd_pfn, pmd_mkyoung, pmd_mkdirty,
>> pmd_mkclean etc. 
> 
> ARC only has 2 levels of paging, so these don't make any sense in general and
> needed only for THP case.
> I case of arch/arm you see it is only defined in pgtable-3level.h

There is no uniformity for all these across architectures. It has been bit
difficult to get some of these required helpers right (compile and run) on
different platforms.

> 
>> Hence wondering will it be possible to accommodate following
>> code change on arc platform (not even compiled) in order to fix the problem ?
> 
> I'm open to making changes in ARC code but lets do the right thing.
> 
>>   */
>> -#ifdef CONFIG_TRANSPARENT_HUGEPAGE
>> +#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE
>>  #include <asm/hugepage.h>
>>  #endif
> 
> This in wrong.  CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE is a just a glue toggle,
> used only in Kconfig files (and not in any "C" code).  It enables generic Kconfig
> code to allow visibility of CONFIG_TRANSPARENT_HUGEPAGE w/o every arch needing to
> do a me too.
> 
> I think you need to use CONFIG_TRANSPARENT_HUGEPAGE to guard appropriate tests. I
> understand that it only

We can probably replace CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE wrapper with
CONFIG_TRANSPARENT_HUGEPAGE. But CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
explicitly depends on CONFIG_TRANSPARENT_HUGEPAGE as a prerequisite. Could
you please confirm if the following change on this test will work on ARC
platform for both THP and !THP cases ? Thank you.

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 621ac09..99ebc7c 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -67,7 +67,7 @@ static void __init pte_basic_tests(unsigned long pfn, pgprot_t prot)
 	WARN_ON(pte_write(pte_wrprotect(pte)));
 }
 
-#ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
 {
 	pmd_t pmd = pfn_pmd(pfn, prot);
@@ -85,9 +85,6 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
 	 */
 	WARN_ON(!pmd_bad(pmd_mkhuge(pmd)));
 }
-#else
-static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot) { }
-#endif
 
 #ifdef CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot)
@@ -112,6 +109,10 @@ static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot)
 #else
 static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
 #endif
+#else
+static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot) { }
+static void __init pud_basic_tests(unsigned long pfn, pgprot_t prot) { }
+#endif
 
 static void __init p4d_basic_tests(unsigned long pfn, pgprot_t prot)
 {

> -Vineet
> 

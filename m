Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09658B680F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 18:28:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46YQQB2fXqzDqhC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2019 02:28:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="pyjpbDaw"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46YQMn4ycYzF3HR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2019 02:26:13 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46YQMh22Z3z9v1BX;
 Wed, 18 Sep 2019 18:26:08 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pyjpbDaw; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9Y0Ay24P9bpW; Wed, 18 Sep 2019 18:26:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46YQMh0fTtz9v1BW;
 Wed, 18 Sep 2019 18:26:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1568823968; bh=UgJ2Vcem+ArVILPonqQdgD2fYngRPmGDyA7SB2VX37Y=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pyjpbDawotebglj/v7nzS+SZ56zwKmvl8UJSMakTVDe9dCV/6GjdddMgM+KIG8OC1
 kUNBRNCHr1KKmqumixwnPv1WdKVo4bZRwpWAfR0t7CPiiV7bBbJcoAYH63FALSqftC
 hwtslTTRJYeOY7/1Aq03nzD37Ir1v6MuTgWj7N0c=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FA068B93C;
 Wed, 18 Sep 2019 18:26:09 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WQXgO4akDWdq; Wed, 18 Sep 2019 18:26:09 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F41388B937;
 Wed, 18 Sep 2019 18:26:03 +0200 (CEST)
Subject: Re: [PATCH V2 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
 <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
 <95ed9d92-dd43-4c45-2e52-738aed7f2fb5@c-s.fr>
 <f872e6f4-a5cb-069d-2034-78961930cb9f@arm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <64504101-d9dd-f273-02f9-e9a8b178eecc@c-s.fr>
Date: Wed, 18 Sep 2019 18:26:03 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <f872e6f4-a5cb-069d-2034-78961930cb9f@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
 linux-arm-kernel@lists.infradead.org,
 Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 18/09/2019 à 07:04, Anshuman Khandual a écrit :
> 
> 
> On 09/13/2019 03:31 PM, Christophe Leroy wrote:
>>
>>
>> Le 13/09/2019 à 11:02, Anshuman Khandual a écrit :
>>>
>>>>> +#if !defined(__PAGETABLE_PMD_FOLDED) && !defined(__ARCH_HAS_4LEVEL_HACK)
>>>>
>>>> #ifdefs have to be avoided as much as possible, see below
>>>
>>> Yeah but it has been bit difficult to avoid all these $ifdef because of the
>>> availability (or lack of it) for all these pgtable helpers in various config
>>> combinations on all platforms.
>>
>> As far as I can see these pgtable helpers should exist everywhere at least via asm-generic/ files.
> 
> But they might not actually do the right thing.
> 
>>
>> Can you spot a particular config which fails ?
> 
> Lets consider the following example (after removing the $ifdefs around it)
> which though builds successfully but fails to pass the intended test. This
> is with arm64 config 4K pages sizes with 39 bits VA space which ends up
> with a 3 level page table arrangement.
> 
> static void __init p4d_clear_tests(p4d_t *p4dp)
> {
>          p4d_t p4d = READ_ONCE(*p4dp);

My suggestion was not to completely drop the #ifdef but to do like you 
did in pgd_clear_tests() for instance, ie to add the following test on 
top of the function:

	if (mm_pud_folded(mm) || is_defined(__ARCH_HAS_5LEVEL_HACK))
		return;

> 
>          p4d = __p4d(p4d_val(p4d) | RANDOM_ORVALUE);
>          WRITE_ONCE(*p4dp, p4d);
>          p4d_clear(p4dp);
>          p4d = READ_ONCE(*p4dp);
>          WARN_ON(!p4d_none(p4d));
> }
> 
> The following test hits an error at WARN_ON(!p4d_none(p4d))
> 
> [   16.757333] ------------[ cut here ]------------
> [   16.758019] WARNING: CPU: 11 PID: 1 at mm/arch_pgtable_test.c:187 arch_pgtable_tests_init+0x24c/0x474
> [   16.759455] Modules linked in:
> [   16.759952] CPU: 11 PID: 1 Comm: swapper/0 Not tainted 5.3.0-next-20190916-00005-g61c218153bb8-dirty #222
> [   16.761449] Hardware name: linux,dummy-virt (DT)
> [   16.762185] pstate: 00400005 (nzcv daif +PAN -UAO)
> [   16.762964] pc : arch_pgtable_tests_init+0x24c/0x474
> [   16.763750] lr : arch_pgtable_tests_init+0x174/0x474
> [   16.764534] sp : ffffffc011d7bd50
> [   16.765065] x29: ffffffc011d7bd50 x28: ffffffff1756bac0
> [   16.765908] x27: ffffff85ddaf3000 x26: 00000000000002e8
> [   16.766767] x25: ffffffc0111ce000 x24: ffffff85ddaf32e8
> [   16.767606] x23: ffffff85ddaef278 x22: 00000045cc844000
> [   16.768445] x21: 000000065daef003 x20: ffffffff17540000
> [   16.769283] x19: ffffff85ddb60000 x18: 0000000000000014
> [   16.770122] x17: 00000000980426bb x16: 00000000698594c6
> [   16.770976] x15: 0000000066e25a88 x14: 0000000000000000
> [   16.771813] x13: ffffffff17540000 x12: 000000000000000a
> [   16.772651] x11: ffffff85fcfd0a40 x10: 0000000000000001
> [   16.773488] x9 : 0000000000000008 x8 : ffffffc01143ab26
> [   16.774336] x7 : 0000000000000000 x6 : 0000000000000000
> [   16.775180] x5 : 0000000000000000 x4 : 0000000000000000
> [   16.776018] x3 : ffffffff1756bbe8 x2 : 000000065daeb003
> [   16.776856] x1 : 000000000065daeb x0 : fffffffffffff000
> [   16.777693] Call trace:
> [   16.778092]  arch_pgtable_tests_init+0x24c/0x474
> [   16.778843]  do_one_initcall+0x74/0x1b0
> [   16.779458]  kernel_init_freeable+0x1cc/0x290
> [   16.780151]  kernel_init+0x10/0x100
> [   16.780710]  ret_from_fork+0x10/0x18
> [   16.781282] ---[ end trace 042e6c40c0a3b038 ]---
> 
> On arm64 (4K page size|39 bits VA|3 level page table)
> 
> #elif CONFIG_PGTABLE_LEVELS == 3	/* Applicable here */
> #define __ARCH_USE_5LEVEL_HACK
> #include <asm-generic/pgtable-nopud.h>
> 
> Which pulls in
> 
> #include <asm-generic/pgtable-nop4d-hack.h>
> 
> which pulls in
> 
> #include <asm-generic/5level-fixup.h>
> 
> which defines
> 
> static inline int p4d_none(p4d_t p4d)
> {
>          return 0;
> }
> 
> which will invariably trigger WARN_ON(!p4d_none(p4d)).
> 
> Similarly for next test p4d_populate_tests() which will always be
> successful because p4d_bad() invariably returns negative.
> 
> static inline int p4d_bad(p4d_t p4d)
> {
>          return 0;
> }
> 
> static void __init p4d_populate_tests(struct mm_struct *mm, p4d_t *p4dp,
>                                        pud_t *pudp)
> {
>          p4d_t p4d;
> 
>          /*
>           * This entry points to next level page table page.
>           * Hence this must not qualify as p4d_bad().
>           */
>          pud_clear(pudp);
>          p4d_clear(p4dp);
>          p4d_populate(mm, p4dp, pudp);
>          p4d = READ_ONCE(*p4dp);
>          WARN_ON(p4d_bad(p4d));
> }
> 
> We should not run these tests for the above config because they are
> not applicable and will invariably produce same result.
> 
>>
>>>
>>>>
>>
>> [...]
>>
>>>>> +#if !defined(__PAGETABLE_PUD_FOLDED) && !defined(__ARCH_HAS_5LEVEL_HACK)
>>>>
>>>> The same can be done here.
>>>
>>> IIRC not only the page table helpers but there are data types (pxx_t) which
>>> were not present on various configs and these wrappers help prevent build
>>> failures. Any ways will try and see if this can be improved further. But
>>> meanwhile if you have some suggestions, please do let me know.
>>
>> pgt_t and pmd_t are everywhere I guess.
>> then pud_t and p4d_t have fallbacks in asm-generic files.
> 
> Lets take another example where it fails to compile. On arm64 with 16K
> page size, 48 bits VA, 4 level page table arrangement in the following
> test, pgd_populate() does not have the required signature.
> 
> static void pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp, p4d_t *p4dp)
> {
>          pgd_t pgd;
> 
>          if (mm_p4d_folded(mm))
>                  return;
> 
>         /*
>           * This entry points to next level page table page.
>           * Hence this must not qualify as pgd_bad().
>           */
>          p4d_clear(p4dp);
>          pgd_clear(pgdp);
>          pgd_populate(mm, pgdp, p4dp);
>          pgd = READ_ONCE(*pgdp);
>          WARN_ON(pgd_bad(pgd));
> }
> 
> mm/arch_pgtable_test.c: In function ‘pgd_populate_tests’:
> mm/arch_pgtable_test.c:254:25: error: passing argument 3 of ‘pgd_populate’ from incompatible pointer type [-Werror=incompatible-pointer-types]
>    pgd_populate(mm, pgdp, p4dp);
>                           ^~~~
> In file included from mm/arch_pgtable_test.c:27:0:
> ./arch/arm64/include/asm/pgalloc.h:81:20: note: expected ‘pud_t * {aka struct <anonymous> *}’ but argument is of type ‘pgd_t * {aka struct <anonymous> *}’
>   static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, pud_t *pudp)
> 
> The build failure is because p4d_t * maps to pgd_t * but the applicable
> (it does not fallback on generic ones) pgd_populate() expects a pud_t *.
> 
> Except for archs which have 5 level page able, pgd_populate() always accepts
> lower level page table pointers as the last argument as they dont have that
> many levels.
> 
> arch/x86/include/asm/pgalloc.h:static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
> arch/s390/include/asm/pgalloc.h:static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, p4d_t *p4d)
> 
> But others
> 
> arch/arm64/include/asm/pgalloc.h:static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgdp, pud_t *pudp)
> arch/m68k/include/asm/motorola_pgalloc.h:static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, pmd_t *pmd)
> arch/mips/include/asm/pgalloc.h:static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, pud_t *pud)
> arch/powerpc/include/asm/book3s/64/pgalloc.h:static inline void pgd_populate(struct mm_struct *mm, pgd_t *pgd, pud_t *pud)
> 
> I remember going through all these combinations before arriving at the
> current state of #ifdef exclusions. Probably, to solved this all platforms
> have to define pxx_populate() helpers assuming they support 5 level page
> table.
> 
>>
>> So it shouldn't be an issue. Maybe if a couple of arches miss them, the best would be to fix the arches, since that's the purpose of your testsuite isn't it ?
> 
> The run time failures as explained previously is because of the folding which
> needs to be protected as they are not even applicable. The compile time
> failures are because pxx_populate() signatures are platform specific depending
> on how many page table levels they really support.
> 

So IIUC, the compiletime problem is around __ARCH_HAS_5LEVEL_HACK. For 
all #if !defined(__PAGETABLE_PXX_FOLDED), something equivalent to the 
following should make the trick.

	if (mm_pxx_folded())
		return;


For the __ARCH_HAS_5LEVEL_HACK stuff, I think we should be able to 
regroup all impacted functions inside a single #ifdef 
__ARCH_HAS_5LEVEL_HACK

Christophe

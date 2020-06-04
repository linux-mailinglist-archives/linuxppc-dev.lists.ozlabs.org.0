Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0421F1EE6DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 16:45:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d7q11qVHzDqsD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 00:45:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d7hL1yNvzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jun 2020 00:39:11 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49d7hB0LCzzB09bC;
 Thu,  4 Jun 2020 16:39:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HcnqsAQAgwl5; Thu,  4 Jun 2020 16:39:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49d7h96hCgzB09bB;
 Thu,  4 Jun 2020 16:39:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CFDAC8B8CE;
 Thu,  4 Jun 2020 16:39:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Sy6zOSmi2CZ5; Thu,  4 Jun 2020 16:39:07 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [10.25.210.22])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 620E88B8C9;
 Thu,  4 Jun 2020 16:39:07 +0200 (CEST)
Subject: Re: linux-next: build failure on powerpc 8xx with 16k pages
To: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>
References: <dc2b16e1-b719-5500-508d-ae97bf50c4a6@csgroup.eu>
 <20200604111723.GA1267@willie-the-truck>
 <20200604120007.GA4117@hirez.programming.kicks-ass.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1160ea76-729b-60a2-31d6-998c57b77858@csgroup.eu>
Date: Thu, 4 Jun 2020 14:35:14 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200604120007.GA4117@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/04/2020 12:00 PM, Peter Zijlstra wrote:
> On Thu, Jun 04, 2020 at 12:17:23PM +0100, Will Deacon wrote:
>> Hi, [+Peter]
>>
>> On Thu, Jun 04, 2020 at 10:48:03AM +0000, Christophe Leroy wrote:
>>> Using mpc885_ads_defconfig with CONFIG_PPC_16K_PAGES instead of
>>> CONFIG_PPC_4K_PAGES, getting the following build failure:
>>>
>>>    CC      mm/gup.o
>>> In file included from ./include/linux/kernel.h:11:0,
>>>                   from mm/gup.c:2:
>>> In function 'gup_hugepte.constprop',
>>>      inlined from 'gup_huge_pd.isra.78' at mm/gup.c:2465:8:
>>> ./include/linux/compiler.h:392:38: error: call to '__compiletime_assert_257'
>>> declared with attribute error: Unsupported access size for
>>> {READ,WRITE}_ONCE().
>>>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>>                                        ^
>>> ./include/linux/compiler.h:373:4: note: in definition of macro
>>> '__compiletime_assert'
>>>      prefix ## suffix();    \
>>>      ^
>>> ./include/linux/compiler.h:392:2: note: in expansion of macro
>>> '_compiletime_assert'
>>>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>>    ^
>>> ./include/linux/compiler.h:405:2: note: in expansion of macro
>>> 'compiletime_assert'
>>>    compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
>>>    ^
>>> ./include/linux/compiler.h:291:2: note: in expansion of macro
>>> 'compiletime_assert_rwonce_type'
>>>    compiletime_assert_rwonce_type(x);    \
>>>    ^
>>> mm/gup.c:2428:8: note: in expansion of macro 'READ_ONCE'
>>>    pte = READ_ONCE(*ptep);
>>>          ^
>>> In function 'gup_get_pte',
>>>      inlined from 'gup_pte_range' at mm/gup.c:2228:9,
>>>      inlined from 'gup_pmd_range' at mm/gup.c:2613:15,
>>>      inlined from 'gup_pud_range' at mm/gup.c:2641:15,
>>>      inlined from 'gup_p4d_range' at mm/gup.c:2666:15,
>>>      inlined from 'gup_pgd_range' at mm/gup.c:2694:15,
>>>      inlined from 'internal_get_user_pages_fast' at mm/gup.c:2785:3:
>>
>> At first glance, this looks like a real bug in the 16k page code -- you're
>> loading the pte non-atomically on the fast GUP path and so you're prone to
>> tearing, which probably isn't what you want. For a short-term hack, I'd
>> suggest having CONFIG_HAVE_FAST_GUP depend on !CONFIG_PPC_16K_PAGES, but if
>> you want to support this them you'll need to rework your pte_t so that it
>> can be loaded atomically.
> 
> Looking at commit 55c8fc3f49302, they're all the exact same value, so
> what they could do is grow another special gup_get_pte() variant that
> just loads the first value.
> 
> Also, per that very same commit, there's a distinct lack of WRITE_ONCE()
> in the pte_update() / __set_pte_at() paths for much of Power.
> 

Thanks for the idea.

Now I get the same issue at

    CC      mm/mincore.o
In file included from ./include/asm-generic/bug.h:5:0,
                  from ./arch/powerpc/include/asm/bug.h:109,
                  from ./include/linux/bug.h:5,
                  from ./include/linux/mmdebug.h:5,
                  from ./include/linux/mm.h:9,
                  from ./include/linux/pagemap.h:8,
                  from mm/mincore.c:11:
In function 'huge_ptep_get',
     inlined from 'mincore_hugetlb' at mm/mincore.c:35:20:
./include/linux/compiler.h:392:38: error: call to 
'__compiletime_assert_218' declared with attribute error: Unsupported 
access size for {READ,WRITE}_ONCE().
   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                       ^
./include/linux/compiler.h:373:4: note: in definition of macro 
'__compiletime_assert'
     prefix ## suffix();    \
     ^
./include/linux/compiler.h:392:2: note: in expansion of macro 
'_compiletime_assert'
   _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
   ^
./include/linux/compiler.h:405:2: note: in expansion of macro 
'compiletime_assert'
   compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
   ^
./include/linux/compiler.h:291:2: note: in expansion of macro 
'compiletime_assert_rwonce_type'
   compiletime_assert_rwonce_type(x);    \
   ^
./include/asm-generic/hugetlb.h:125:9: note: in expansion of macro 
'READ_ONCE'
   return READ_ONCE(*ptep);
          ^
make[2]: *** [mm/mincore.o] Error 1

I guess for this one I have to implement platform specific huge_ptep_get()

Christophe

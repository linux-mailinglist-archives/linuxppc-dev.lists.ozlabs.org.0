Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 10A7E1EE645
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Jun 2020 16:05:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49d6wm6YykzDqlR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jun 2020 00:04:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49d6pt56lGzDqmJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Jun 2020 23:59:47 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49d6pf2rwCzB09Zt;
 Thu,  4 Jun 2020 15:59:38 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xNYjkAss7B_l; Thu,  4 Jun 2020 15:59:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49d6pf1vcCzB09Zq;
 Thu,  4 Jun 2020 15:59:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 30FE18B8C6;
 Thu,  4 Jun 2020 15:59:40 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 7rmDmWjkLUfq; Thu,  4 Jun 2020 15:59:40 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [10.25.210.22])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B7C278B8C4;
 Thu,  4 Jun 2020 15:59:39 +0200 (CEST)
Subject: Re: linux-next: build failure on powerpc 8xx with 16k pages
To: Will Deacon <will@kernel.org>
References: <dc2b16e1-b719-5500-508d-ae97bf50c4a6@csgroup.eu>
 <20200604111723.GA1267@willie-the-truck>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <96fdc23c-ca08-6b6a-ebdd-23cedfada77d@csgroup.eu>
Date: Thu, 4 Jun 2020 13:55:45 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20200604111723.GA1267@willie-the-truck>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, peterz@infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/04/2020 11:17 AM, Will Deacon wrote:
> Hi, [+Peter]
> 
> On Thu, Jun 04, 2020 at 10:48:03AM +0000, Christophe Leroy wrote:
>> Using mpc885_ads_defconfig with CONFIG_PPC_16K_PAGES instead of
>> CONFIG_PPC_4K_PAGES, getting the following build failure:
>>
>>    CC      mm/gup.o
>> In file included from ./include/linux/kernel.h:11:0,
>>                   from mm/gup.c:2:
>> In function 'gup_hugepte.constprop',
>>      inlined from 'gup_huge_pd.isra.78' at mm/gup.c:2465:8:
>> ./include/linux/compiler.h:392:38: error: call to '__compiletime_assert_257'
>> declared with attribute error: Unsupported access size for
>> {READ,WRITE}_ONCE().
>>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>                                        ^
>> ./include/linux/compiler.h:373:4: note: in definition of macro
>> '__compiletime_assert'
>>      prefix ## suffix();    \
>>      ^
>> ./include/linux/compiler.h:392:2: note: in expansion of macro
>> '_compiletime_assert'
>>    _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
>>    ^
>> ./include/linux/compiler.h:405:2: note: in expansion of macro
>> 'compiletime_assert'
>>    compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
>>    ^
>> ./include/linux/compiler.h:291:2: note: in expansion of macro
>> 'compiletime_assert_rwonce_type'
>>    compiletime_assert_rwonce_type(x);    \
>>    ^
>> mm/gup.c:2428:8: note: in expansion of macro 'READ_ONCE'
>>    pte = READ_ONCE(*ptep);
>>          ^
>> In function 'gup_get_pte',
>>      inlined from 'gup_pte_range' at mm/gup.c:2228:9,
>>      inlined from 'gup_pmd_range' at mm/gup.c:2613:15,
>>      inlined from 'gup_pud_range' at mm/gup.c:2641:15,
>>      inlined from 'gup_p4d_range' at mm/gup.c:2666:15,
>>      inlined from 'gup_pgd_range' at mm/gup.c:2694:15,
>>      inlined from 'internal_get_user_pages_fast' at mm/gup.c:2785:3:
> 
> At first glance, this looks like a real bug in the 16k page code -- you're
> loading the pte non-atomically on the fast GUP path and so you're prone to
> tearing, which probably isn't what you want. For a short-term hack, I'd
> suggest having CONFIG_HAVE_FAST_GUP depend on !CONFIG_PPC_16K_PAGES, but if
> you want to support this them you'll need to rework your pte_t so that it
> can be loaded atomically.

What do you mean by *rework* pte_t ?
pte are 32 bits words in size and are spread every 4 words in memory. 
Therefore pte_t has to be 128 bits because unlike huge_pte handling 
which always use huge_pte_offset() in loops, many many places in the 
kernel do pte++, so we need the pte type to be the size of the interval 
from one pte to the next one.

Christophe

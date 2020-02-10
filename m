Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 13031157303
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 11:50:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GN3R1CVpzDqPT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Feb 2020 21:50:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=RdSNVpl3; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GMyz4LJfzDqNd
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2020 21:46:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48GMyn4XNDzB09b8;
 Mon, 10 Feb 2020 11:46:25 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=RdSNVpl3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 2YKBWszaeG8b; Mon, 10 Feb 2020 11:46:25 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48GMyn31lmzB09b6;
 Mon, 10 Feb 2020 11:46:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581331585; bh=3VdT8leEAlfSLQpPQKoxenZVPWjYs1yN+U09thgTRJA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RdSNVpl3eRdV3gPJ7XDvUegm6wZGug8ejVpKq74HLxDjFS3pwYqC+BZGFoUQ1Oq78
 SVulkxR8i/NmQfPxXj9q1ZP6MDJ4/eVa8ThwXr9rdv9XZ0ODywoTCAXN5cQTc5KVGa
 aEm6pzX4mgbIsgNXEcKTlXONuuV1vYFncq9hDwgQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 295478B7B8;
 Mon, 10 Feb 2020 11:46:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VHUUj31ZCU6T; Mon, 10 Feb 2020 11:46:29 +0100 (CET)
Received: from [172.25.230.102] (po15451.idsi0.si.c-s.fr [172.25.230.102])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6A8808B7B5;
 Mon, 10 Feb 2020 11:46:23 +0100 (CET)
Subject: Re: [PATCH V13] mm/debug: Add tests validating architecture page
 table helpers
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
References: <1580897674-16456-1-git-send-email-anshuman.khandual@arm.com>
 <202002060619.wEOdAZU1%lkp@intel.com>
 <78d3ce6b-e100-2561-6b09-124c29731d1a@arm.com>
 <20200209205231.44d098f8749e88190b8ba10c@linux-foundation.org>
 <955229f7-f161-f720-0e75-a3163f63817d@arm.com>
 <aef1048f-68c4-d14f-e669-8f288ba9ac7a@c-s.fr>
 <20200210100200.GB25745@shell.armlinux.org.uk>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7cb3a5bb-eaea-a01c-4047-e3c000b7ad1d@c-s.fr>
Date: Mon, 10 Feb 2020 11:46:23 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200210100200.GB25745@shell.armlinux.org.uk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 10 Feb 2020 21:47:06 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, uclinux-h8-devel@lists.sourceforge.jp,
 linux-m68k@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-riscv@lists.infradead.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, kbuild test robot <lkp@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Max Filippov <jcmvbkbc@gmail.com>,
 x86@kernel.org, Matthew Wilcox <willy@infradead.org>,
 Steven Price <Steven.Price@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>, Mark Salter <msalter@redhat.com>,
 Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-alpha@vger.kernel.org,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>, linux-c6x-dev@linux-c6x.org,
 Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Guan Xuetao <gxt@pku.edu.cn>,
 Vlastimil Babka <vbabka@suse.cz>, Richard Henderson <rth@twiddle.net>,
 linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, kbuild-all@lists.01.org,
 Brian Cain <bcain@codeaurora.org>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, Qian Cai <cai@lca.pw>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/02/2020 à 11:02, Russell King - ARM Linux admin a écrit :
> On Mon, Feb 10, 2020 at 07:38:38AM +0100, Christophe Leroy wrote:
>>
>>
>> Le 10/02/2020 à 06:35, Anshuman Khandual a écrit :
>>>
>>>
>>> On 02/10/2020 10:22 AM, Andrew Morton wrote:
>>>> On Thu, 6 Feb 2020 13:49:35 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>>>
>>>>>
>>>>> On 02/06/2020 04:40 AM, kbuild test robot wrote:
>>>>>> Hi Anshuman,
>>>>>>
>>>>>> Thank you for the patch! Yet something to improve:
>>>>>>
>>>>>> [auto build test ERROR on powerpc/next]
>>>>>> [also build test ERROR on s390/features linus/master arc/for-next v5.5]
>>>>>> [cannot apply to mmotm/master tip/x86/core arm64/for-next/core next-20200205]
>>>>>> [if your patch is applied to the wrong git tree, please drop us a note to help
>>>>>> improve the system. BTW, we also suggest to use '--base' option to specify the
>>>>>> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>>>>>>
>>>>>> url:    https://github.com/0day-ci/linux/commits/Anshuman-Khandual/mm-debug-Add-tests-validating-architecture-page-table-helpers/20200205-215507
>>>>>> base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git next
>>>>>> config: ia64-allmodconfig (attached as .config)
>>>>>> compiler: ia64-linux-gcc (GCC) 7.5.0
>>>>>> reproduce:
>>>>>>           wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
>>>>>>           chmod +x ~/bin/make.cross
>>>>>>           # save the attached .config to linux build tree
>>>>>>           GCC_VERSION=7.5.0 make.cross ARCH=ia64
>>>>>>
>>>>>> If you fix the issue, kindly add following tag
>>>>>> Reported-by: kbuild test robot <lkp@intel.com>
>>>>>>
>>>>>> All error/warnings (new ones prefixed by >>):
>>>>>>
>>>>>>      In file included from include/asm-generic/pgtable-nopud.h:8:0,
>>>>>>                       from arch/ia64/include/asm/pgtable.h:586,
>>>>>>                       from include/linux/mm.h:99,
>>>>>>                       from include/linux/highmem.h:8,
>>>>>>                       from mm/debug_vm_pgtable.c:14:
>>>>>>      mm/debug_vm_pgtable.c: In function 'pud_clear_tests':
>>>>>>>> include/asm-generic/pgtable-nop4d-hack.h:47:32: error: implicit declaration of function '__pgd'; did you mean '__p4d'? [-Werror=implicit-function-declaration]
>>>>>>       #define __pud(x)    ((pud_t) { __pgd(x) })
>>>>>>                                      ^
>>>>>>>> mm/debug_vm_pgtable.c:141:8: note: in expansion of macro '__pud'
>>>>>>        pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
>>>>>>              ^~~~~
>>>>>>>> include/asm-generic/pgtable-nop4d-hack.h:47:22: warning: missing braces around initializer [-Wmissing-braces]
>>>>>>       #define __pud(x)    ((pud_t) { __pgd(x) })
>>>>>>                            ^
>>>>>>>> mm/debug_vm_pgtable.c:141:8: note: in expansion of macro '__pud'
>>>>>>        pud = __pud(pud_val(pud) | RANDOM_ORVALUE);
>>>>>>              ^~~~~
>>>>>>      cc1: some warnings being treated as errors
>>>>>
>>>>> This build failure is expected now given that we have allowed DEBUG_VM_PGTABLE
>>>>> with EXPERT without platform requiring ARCH_HAS_DEBUG_VM_PGTABLE. This problem
>>>>> i.e build failure caused without a platform __pgd(), is known to exist both on
>>>>> ia64 and arm (32bit) platforms. Please refer https://lkml.org/lkml/2019/9/24/314
>>>>> for details where this was discussed earlier.
>>>>>
>>>>
>>>> I'd prefer not to merge a patch which is known to cause build
>>>> regressions.  Is there some temporary thing we can do to prevent these
>>>> errors until arch maintainers(?) get around to implementing the
>>>> long-term fixes?
>>>
>>> We could explicitly disable CONFIG_DEBUG_VM_PGTABLE on ia64 and arm platforms
>>> which will ensure that others can still use the EXPERT path.
>>>
>>> config DEBUG_VM_PGTABLE
>>> 	bool "Debug arch page table for semantics compliance"
>>> 	depends on MMU
>>> 	depends on !(IA64 || ARM)
>>> 	depends on ARCH_HAS_DEBUG_VM_PGTABLE || EXPERT
>>> 	default n if !ARCH_HAS_DEBUG_VM_PGTABLE
>>> 	default y if DEBUG_VM
>>>
>>
>> On both ia32 and arm, the fix is trivial.
>>
>> Can we include the fix within this patch, just the same way as the
>> mm_p4d_folded() fix for x86 ?
> 
> Why should arm include a macro for something that nothing (apart from
> this checker) requires?  If the checker requires it but the rest of
> the kernel does not, it suggests that the checker isn't actually
> correct, and the results can't be relied upon.
> 

As far as I can see, the problem is that arm opencodes part of the API 
instead of including asm-generic/pgtable-nopmd.h

Here, the ARM has 2 levels, ie only PGD and PTE. But instead of defining 
__pgd and __pte and getting everything else from asm-generic, it defines 
a __pmd then redefines the folded levels like the pud, etc ...

That's exactly what the checker aims at detecting: architectures than do 
not properly use the standard linux page table structures.

Christophe

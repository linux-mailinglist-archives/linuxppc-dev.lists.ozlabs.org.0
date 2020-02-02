Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AE69914FC48
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 09:27:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 489PGR60P0zDqXL
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Feb 2020 19:27:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 489PDz5sFGzDqPy
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Feb 2020 19:26:24 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C77E1045;
 Sun,  2 Feb 2020 00:26:22 -0800 (PST)
Received: from [10.163.1.42] (unknown [10.163.1.42])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 53D883F68E;
 Sun,  2 Feb 2020 00:29:45 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Christophe Leroy <christophe.leroy@c-s.fr>, linux-mm@kvack.org
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <68ed6488-aa25-ab41-8da6-f0ddeb15d52b@c-s.fr>
 <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <eecaf6d6-66d2-1c17-ce02-74ed399fc58e@arm.com>
Date: Sun, 2 Feb 2020 13:56:04 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <49754f74-53a7-0e4a-bb16-53617f8c902c@arm.com>
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
 linux-snps-arc@lists.infradead.org, Ingo Molnar <mingo@kernel.org>,
 Kees Cook <keescook@chromium.org>,
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



On 01/30/2020 06:34 PM, Anshuman Khandual wrote:
> On 01/28/2020 10:35 PM, Christophe Leroy wrote:
>>
>> Le 28/01/2020 à 02:27, Anshuman Khandual a écrit :
>>> This adds tests which will validate architecture page table helpers and
>>> other accessors in their compliance with expected generic MM semantics.
>>> This will help various architectures in validating changes to existing
>>> page table helpers or addition of new ones.
>>>
>>> This test covers basic page table entry transformations including but not
>>> limited to old, young, dirty, clean, write, write protect etc at various
>>> level along with populating intermediate entries with next page table page
>>> and validating them.
>>>
>>> Test page table pages are allocated from system memory with required size
>>> and alignments. The mapped pfns at page table levels are derived from a
>>> real pfn representing a valid kernel text symbol. This test gets called
>>> right after page_alloc_init_late().
>>>
>>> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
>>> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
>>> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
>>> arm64. Going forward, other architectures too can enable this after fixing
>>> build or runtime problems (if any) with their page table helpers.
>>>
>>> Folks interested in making sure that a given platform's page table helpers
>>> conform to expected generic MM semantics should enable the above config
>>> which will just trigger this test during boot. Any non conformity here will
>>> be reported as an warning which would need to be fixed. This test will help
>>> catch any changes to the agreed upon semantics expected from generic MM and
>>> enable platforms to accommodate it thereafter.
>>>
>> [...]
>>
>>> Tested-by: Christophe Leroy <christophe.leroy@c-s.fr>        #PPC32
>> Also tested on PPC64 (under QEMU): book3s/64 64k pages, book3s/64 4k pages and book3e/64
> Hmm but earlier Michael Ellerman had reported some problems while
> running these tests on PPC64, a soft lock up in hash__pte_update()
> and a kernel BUG (radix MMU). Are those problems gone away now ?
> 
> Details in this thread - https://patchwork.kernel.org/patch/11214603/
> 

It is always better to have more platforms enabled than not. But lets keep
this test disabled on PPC64 for now, if there is any inconsistency between
results while running this under QEMU and on actual systems.

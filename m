Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 252E514AECE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 06:00:28 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 486DvX6SldzDqHg
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2020 16:00:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 486Drx2f4dzDqFB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2020 15:58:06 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B96C31B;
 Mon, 27 Jan 2020 20:58:03 -0800 (PST)
Received: from [10.163.1.151] (unknown [10.163.1.151])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97BA23F68E;
 Mon, 27 Jan 2020 20:57:49 -0800 (PST)
Subject: Re: [PATCH V12] mm/debug: Add tests validating architecture page
 table helpers
To: Qian Cai <cai@lca.pw>
References: <1580174873-18117-1-git-send-email-anshuman.khandual@arm.com>
 <14882A91-17DE-4ABD-ABF2-08E7CCEDF660@lca.pw>
 <214c0d53-eb34-9b0c-2e4e-1aa005146331@arm.com>
 <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <012158b7-a40e-050f-cd1b-d6ce7faf042f@arm.com>
Date: Tue, 28 Jan 2020 10:27:46 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <016A776F-EFD9-4D2B-A3A9-788008617D95@lca.pw>
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Linux-MM <linux-mm@kvack.org>, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>, Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, "Kirill A . Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, Vlastimil Babka <vbabka@suse.cz>,
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



On 01/28/2020 09:03 AM, Qian Cai wrote:
> 
> 
>> On Jan 27, 2020, at 10:06 PM, Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>
>>
>>
>> On 01/28/2020 07:41 AM, Qian Cai wrote:
>>>
>>>
>>>> On Jan 27, 2020, at 8:28 PM, Anshuman Khandual <Anshuman.Khandual@arm.com> wrote:
>>>>
>>>> This adds tests which will validate architecture page table helpers and
>>>> other accessors in their compliance with expected generic MM semantics.
>>>> This will help various architectures in validating changes to existing
>>>> page table helpers or addition of new ones.
>>>>
>>>> This test covers basic page table entry transformations including but not
>>>> limited to old, young, dirty, clean, write, write protect etc at various
>>>> level along with populating intermediate entries with next page table page
>>>> and validating them.
>>>>
>>>> Test page table pages are allocated from system memory with required size
>>>> and alignments. The mapped pfns at page table levels are derived from a
>>>> real pfn representing a valid kernel text symbol. This test gets called
>>>> right after page_alloc_init_late().
>>>>
>>>> This gets build and run when CONFIG_DEBUG_VM_PGTABLE is selected along with
>>>> CONFIG_VM_DEBUG. Architectures willing to subscribe this test also need to
>>>> select CONFIG_ARCH_HAS_DEBUG_VM_PGTABLE which for now is limited to x86 and
>>>> arm64. Going forward, other architectures too can enable this after fixing
>>>> build or runtime problems (if any) with their page table helpers.
>>
>> Hello Qian,
>>
>>>
>>> What’s the value of this block of new code? It only supports x86 and arm64
>>> which are supposed to be good now.
>>
>> We have been over the usefulness of this code many times before as the patch is
>> already in it's V12. Currently it is enabled on arm64, x86 (except PAE), arc and
>> ppc32. There are build time or runtime problems with other archs which prevent
> 
> I am not sure if I care too much about arc and ppc32 which are pretty much legacy
> platforms.

Okay but FWIW the maintainers for all these enabled platforms cared for this test
at the least and really helped in shaping the test to it's current state. Besides
I am still failing to understand your point here about evaluating particular feature's
usefulness based on it's support on relative and perceived importance of some platforms
compared to others. Again the idea is to integrate all platforms eventually but we had
discovered build and runtime issues which needs to be resolved at platform level first.
Unless I am mistaken, debug feature like this which is putting down a framework while
also benefiting some initial platforms to start with, will be a potential candidate for
eventual inclusion in the mainline. Otherwise, please point to any other agreed upon
community criteria for debug feature's mainline inclusion which I will try to adhere.
I wonder if all other similar debug features from the past ever met 'the all inclusive
at the beginning' criteria which you are trying to propose here. This test also adds a
feature file, enlisting all supported archs as suggested by Ingo for the exact same
reason. This is not the first time, a feature is listing out archs which are supported
and archs which are not.

> 
>> enablement of this test (for the moment) but then the goal is to integrate all
>> of them going forward. The test not only validates platform's adherence to the
>> expected semantics from generic MM but also helps in keeping it that way during
>> code changes in future as well.
> 
> Another option maybe to get some decent arches on board first before merging this
> thing, so it have more changes to catch regressions for developers who might run this. 
> 
>>
>>> Did those tests ever find any regression or this is almost only useful for new
>>
>> The test has already found problems with s390 page table helpers.
> 
> Hmm, that is pretty weak where s390 is not even official supported with this version.

And there were valid reasons why s390 could not be enabled just yet as explained by s390
folks during our previous discussions. I just pointed out an example where this test was
useful as you had asked previously. Not being official supported in this version does
not take away the fact the it was indeed useful for that platform in discovering a bug.

> 
>>
>>> architectures which only happened once in a few years?
>>
>> Again, not only it validates what exist today but its also a tool to make
>> sure that all platforms continue adhere to a common agreed upon semantics
>> as reflected through the tests here.
>>
>>> The worry if not many people will use this config and code those that much in
>>
>> Debug features or tests in the kernel are used when required. These are never or
>> should not be enabled by default. AFAICT this is true even for entire DEBUG_VM
>> packaged tests. Do you have any particular data or precedence to substantiate
>> the fact that this test will be used any less often than the other similar ones
>> in the tree ? I can only speak for arm64 platform but the very idea for this
>> test came from Catalin when we were trying to understand the semantics for THP
>> helpers while enabling THP migration without split. Apart from going over the
>> commit messages from the past, there were no other way to figure out how any
>> particular page table helper is suppose to change given page table entry. This
>> test tries to formalize those semantics.
> 
> I am thinking about how we made so many mistakes before by merging too many of
> those debugging options that many of them have been broken for many releases
> proving that nobody actually used them regularly. We don’t need to repeat the same

Again will ask for some data to substantiate these claims. Though I am not really
sure but believe that there are integration test frameworks out there which regularly
validates each of these code path on multiple platforms. One such automation found
that V11 of the test was broken on X86 PAE platform which I fixed. Nonetheless, I can
speak only for arm64 platform and we intend to use this test to validate arm64 exported
page table helpers. Citing unsubstantiated past examples should not really block these
enabled platforms (arm64 at the very least) from getting this debug feature which has
already demonstrated it's usefulness during arm64 THP migration development and on s390
platforms as well.

> mistake again. I am actually thinking about to remove things like  page_poisoning often
> which is almost are never found any bug recently and only cause pains when interacting
> with other new features that almost nobody will test them together to begin with.
> We even have some SLUB debugging code sit there for almost 15 years that almost
> nobody used it and maintainers refused to remove it.

Unlike those, the proposed test here is isolated as a stand alone test and stays clear
off from any other code path. I have not been involved in or aware of the usefulness of
existing MM debug features and hence will just leave them upto the judgment of the
maintainers whether to keep or discard them.

> 
>>
>>> the future because it is inefficient to find bugs, it will simply be rotten
>> Could you be more specific here ? What parts of the test are inefficient ? I
>> am happy to improve upon the test. Do let me know you if you have suggestions.
>>
>>> like a few other debugging options out there we have in the mainline that
>> will be a pain to remove later on.
>>>
>>
>> Even though I am not agreeing to your assessment about the usefulness of the
>> test without any substantial data backing up the claims, the test case in
>> itself is very much compartmentalized, staying clear from generic MM and
>> debug_vm_pgtable() is only function executing the test which is getting
>> called from kernel_init_freeable() path.
> 
> I am thinking exactly the other way around. You are proposing to merge this tests
> without proving how useful it will be able to find regressions for future developers
> to make sure it will actually get used.

As I had mentioned before, the test attempts to formalize page table helper semantics
as expected from generic MM code paths and intend to catch deviations when enabled on
a given platform. How else should we test semantics errors otherwise ? There are past
examples of usefulness for this procedure on arm64 and on s390. I am wondering how
else to prove the usefulness of a debug feature if these references are not enough.

> 

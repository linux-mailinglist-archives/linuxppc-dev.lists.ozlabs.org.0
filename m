Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 24ACCB89E7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 06:08:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46ZKvD2h85zF3tt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Sep 2019 14:08:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46ZKs45nfJzF3XK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Sep 2019 14:06:13 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 08718337;
 Thu, 19 Sep 2019 21:06:10 -0700 (PDT)
Received: from [10.162.40.137] (p8cg001049571a15.blr.arm.com [10.162.40.137])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 85C4F3F67D; Thu, 19 Sep 2019 21:05:57 -0700 (PDT)
Subject: Re: [PATCH V2 2/2] mm/pgtable/debug: Add test validating architecture
 page table helpers
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
 <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
 <95ed9d92-dd43-4c45-2e52-738aed7f2fb5@c-s.fr>
 <f872e6f4-a5cb-069d-2034-78961930cb9f@arm.com>
 <64504101-d9dd-f273-02f9-e9a8b178eecc@c-s.fr>
 <20190918202243.37e709df@thinkpad>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <5a6045af-bcfb-12c2-0f4a-3b49a905ec4d@arm.com>
Date: Fri, 20 Sep 2019 09:36:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190918202243.37e709df@thinkpad>
Content-Type: text/plain; charset=utf-8
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Dave Hansen <dave.hansen@intel.com>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 x86@kernel.org, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-arm-kernel@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, Kees Cook <keescook@chromium.org>,
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



On 09/18/2019 11:52 PM, Gerald Schaefer wrote:
> On Wed, 18 Sep 2019 18:26:03 +0200
> Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> 
> [..] 
>> My suggestion was not to completely drop the #ifdef but to do like you 
>> did in pgd_clear_tests() for instance, ie to add the following test on 
>> top of the function:
>>
>> 	if (mm_pud_folded(mm) || is_defined(__ARCH_HAS_5LEVEL_HACK))
>> 		return;
>>
> 
> Ah, very nice, this would also fix the remaining issues for s390. Since
> we have dynamic page table folding, neither __PAGETABLE_PXX_FOLDED nor
> __ARCH_HAS_XLEVEL_HACK is defined, but mm_pxx_folded() will work.

Like Christophe mentioned earlier on the other thread, we will convert
all __PGTABLE_PXX_FOLDED checks as mm_pxx_folded() but looks like 
ARCH_HAS_[4 and 5]LEVEL_HACK macros will still be around. Will respin
the series with all agreed upon changes first and probably we can then
discuss pending issues from there.

> 
> mm_alloc() returns with a 3-level page table by default on s390, so we
> will run into issues in p4d_clear/populate_tests(), and also at the end
> with p4d/pud_free() (double free).
> 
> So, adding the mm_pud_folded() check to p4d_clear/populate_tests(),
> and also adding mm_p4d/pud_folded() checks at the end before calling> p4d/pud_free(), would make it all work on s390.

Atleast p4d_clear/populate_tests() tests will be taken care.

> 
> BTW, regarding p4d/pud_free(), I'm not sure if we should rather check
> the folding inside our s390 functions, similar to how we do it for
> p4d/pud_free_tlb(), instead of relying on not being called for folded
> p4d/pud. So far, I see no problem with this behavior, all callers of
> p4d/pud_free() should be fine because of our folding check within
> p4d/pud_present/none(). But that doesn't mean that it is correct not
> to check for the folding inside p4d/pud_free(). At least, with this
> test module we do now have a caller of p4d/pud_free() on potentially
> folded entries, so instead of adding pxx_folded() checks to this
> test module, we could add them to our p4d/pud_free() functions.
> Any thoughts on this?
Agreed, it seems better to do the check inside p4d/pud_free() functions.

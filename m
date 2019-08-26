Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D3EFC9C747
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 04:31:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GwxR4458zDqcn
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 12:31:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 46GwvG5WqwzDqZH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2019 12:29:44 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 77760344;
 Sun, 25 Aug 2019 19:29:42 -0700 (PDT)
Received: from [10.162.43.136] (p8cg001049571a15.blr.arm.com [10.162.43.136])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id
 8EB213F718; Sun, 25 Aug 2019 19:29:32 -0700 (PDT)
Subject: Re: [RFC V2 0/1] mm/debug: Add tests for architecture exported page
 table helpers
To: Mark Rutland <mark.rutland@arm.com>, Matthew Wilcox <willy@infradead.org>
References: <1565335998-22553-1-git-send-email-anshuman.khandual@arm.com>
 <20190809101632.GM5482@bombadil.infradead.org>
 <20190809114450.GF48423@lakrids.cambridge.arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <652ae041-2033-1cf8-e559-6dcf85dd2fdd@arm.com>
Date: Mon, 26 Aug 2019 07:59:36 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190809114450.GF48423@lakrids.cambridge.arm.com>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 James Hogan <jhogan@kernel.org>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Dave Hansen <dave.hansen@intel.com>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Steven Price <Steven.Price@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 linux-arm-kernel@lists.infradead.org, linux-snps-arc@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Paul Burton <paul.burton@mips.com>, Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/09/2019 05:14 PM, Mark Rutland wrote:
> On Fri, Aug 09, 2019 at 03:16:33AM -0700, Matthew Wilcox wrote:
>> On Fri, Aug 09, 2019 at 01:03:17PM +0530, Anshuman Khandual wrote:
>>> Should alloc_gigantic_page() be made available as an interface for general
>>> use in the kernel. The test module here uses very similar implementation from
>>> HugeTLB to allocate a PUD aligned memory block. Similar for mm_alloc() which
>>> needs to be exported through a header.
>>
>> Why are you allocating memory at all instead of just using some
>> known-to-exist PFNs like I suggested?
> 
> IIUC the issue is that there aren't necessarily known-to-exist PFNs that
> are sufficiently aligned -- they may not even exist.
> 
> For example, with 64K pages, a PMD covers 512M. The kernel image is
> (generally) smaller than 512M, and will be mapped at page granularity.
> In that case, any PMD entry for a kernel symbol address will point to
> the PTE level table, and that will only necessarily be page-aligned, as
> any P?D level table is only necessarily page-aligned.

Right.

> 
> In the same configuration, you could have less than 512M of total
> memory, and none of this memory is necessarily aligned to 512M. So
> beyond the PTE level, I don't think you can guarantee a known-to-exist
> valid PFN.
Right a PMD aligned valid PFN might not even exist. This proposed patch
which attempts to allocate memory chunk with required alignment will just
fail indicating that such a valid PFN does not exist and hence will skip
any relevant tests. At present this is done for PUD aligned allocation
failure but we can similarly skip PMD relevant tests as well if PMD
aligned memory chunk is not allocated.

> 
> I also believe that synthetic PFNs could fail pfn_valid(), so that might
> cause us pain too...

Agreed. So do we have an agreement that it is better to use allocated
memory with required alignment for the tests than known-to-exist PFNs ?

- Anshuman

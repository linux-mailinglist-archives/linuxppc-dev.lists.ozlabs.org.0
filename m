Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06343B1A30
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 10:53:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V8YY0Nr9zF5H0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 18:53:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::544; helo=mail-ed1-x544.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="M6Wl/quw"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46V8Wb6BRrzF5GS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 18:51:39 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id f2so20012430edw.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 01:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=ljRy//1oqpxbNqcuLvCNHWlNadtkzDq51hCzmFakYzM=;
 b=M6Wl/quwPsEOiMFNCv3xSOrdnDulq5fkBOVf8YSY3tiw77PxkkHJwmP5iEk0kohLlY
 pg4uPVtKpUEevoagc8enKn4uPrSlBiZORCgQoAOniX52xYmOZkzG1/HzuVuRwG1eo1oP
 UUMYm6uVKM/ZyICPXIY6dw0BD4t6sF6ZjlwPzQZa+ZeBzMMqOs4xYJXwzCpcBNDo8jhx
 jXjUL9kfKg583djOtcu64hthdRWYl9M2FSJHI0vB9ZCDV10OZHe+j1P2FdlMaHZTn/Du
 o7aK3kotbpwDLHIjGD7A7LXZ8OC4HcGT0NeYVB7fDkav49RWCtmQCPySSqquXilUNVHm
 pP3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=ljRy//1oqpxbNqcuLvCNHWlNadtkzDq51hCzmFakYzM=;
 b=C8lk1CojxZpaA1is7eA3dAWMPofXGVe0uygmvAJCzlCYrfvvuZRMowgr2TYReamiNX
 WbuaBLRBBiO+PtdfYFTP+YApPrG9VY+TBlkffYc7Q6HCCDsD1rnnmo2x9ry5V3okiSDp
 9o/oALaM+8czBqeRLI9PKpKFWFMrW/MG7fVRpGrEkJfz5+xCpjFAzn/YLX0sVbI9qL4I
 +GJGfpX0jF066dVUJR+9yia5o/9+U3iJ3bET6EBCL2pY8OWU5oe0AvJDC9Dq2awpgfzE
 hQ+lQMMOg1Qa3/L3MAGFxxQc/tNA1qOs4MPXBBpAr1ZjSG5buh6dHYKEqF46P5/8eibX
 B2dw==
X-Gm-Message-State: APjAAAXymRf2LbPSZyKuQY+kTxC4GSsJu9qEwCHC63BFfQEutME/qk+c
 GBNrVJE0BL15eniPaOzLshvBuA==
X-Google-Smtp-Source: APXvYqxZm96QADm/8SST6BnmvoIUqtDzA7VCb5AHjQ8XsG2pGy1aWbbiVHhIwmyiU7DjVjOntMuCeQ==
X-Received: by 2002:a50:ee92:: with SMTP id f18mr24791178edr.253.1568364694523; 
 Fri, 13 Sep 2019 01:51:34 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id j30sm5287480edb.8.2019.09.13.01.51.33
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Sep 2019 01:51:33 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id A972310160B; Fri, 13 Sep 2019 11:51:35 +0300 (+03)
Date: Fri, 13 Sep 2019 11:51:35 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm/pgtable/debug: Fix test validating architecture page
 table helpers
Message-ID: <20190913085135.rfr3zrabghi2qo2t@box>
References: <1892b37d1fd9a4ed39e76c4b999b6556077201c0.1568355752.git.christophe.leroy@c-s.fr>
 <527dd29d-45fa-4d83-1899-6cbf268dd749@arm.com>
 <e2b42446-7f91-83f1-ac12-08dff75c4d35@c-s.fr>
 <cb226b56-ff20-3136-7ffb-890657e56870@c-s.fr>
 <bdf7f152-d093-1691-4e96-77da7eb9e20a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bdf7f152-d093-1691-4e96-77da7eb9e20a@arm.com>
User-Agent: NeoMutt/20180716
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
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>, linux-s390@vger.kernel.org,
 Jason Gunthorpe <jgg@ziepe.ca>, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Sri Krishna chowdary <schowdary@nvidia.com>,
 Dave Hansen <dave.hansen@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 13, 2019 at 02:12:45PM +0530, Anshuman Khandual wrote:
> 
> 
> On 09/13/2019 12:41 PM, Christophe Leroy wrote:
> > 
> > 
> > Le 13/09/2019 à 09:03, Christophe Leroy a écrit :
> >>
> >>
> >> Le 13/09/2019 à 08:58, Anshuman Khandual a écrit :
> >>> On 09/13/2019 11:53 AM, Christophe Leroy wrote:
> >>>> Fix build failure on powerpc.
> >>>>
> >>>> Fix preemption imbalance.
> >>>>
> >>>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> >>>> ---
> >>>>   mm/arch_pgtable_test.c | 3 +++
> >>>>   1 file changed, 3 insertions(+)
> >>>>
> >>>> diff --git a/mm/arch_pgtable_test.c b/mm/arch_pgtable_test.c
> >>>> index 8b4a92756ad8..f2b3c9ec35fa 100644
> >>>> --- a/mm/arch_pgtable_test.c
> >>>> +++ b/mm/arch_pgtable_test.c
> >>>> @@ -24,6 +24,7 @@
> >>>>   #include <linux/swap.h>
> >>>>   #include <linux/swapops.h>
> >>>>   #include <linux/sched/mm.h>
> >>>> +#include <linux/highmem.h>
> >>>
> >>> This is okay.
> >>>
> >>>>   #include <asm/pgalloc.h>
> >>>>   #include <asm/pgtable.h>
> >>>> @@ -400,6 +401,8 @@ static int __init arch_pgtable_tests_init(void)
> >>>>       p4d_clear_tests(p4dp);
> >>>>       pgd_clear_tests(mm, pgdp);
> >>>> +    pte_unmap(ptep);
> >>>> +
> >>>
> >>> Now the preemption imbalance via pte_alloc_map() path i.e
> >>>
> >>> pte_alloc_map() -> pte_offset_map() -> kmap_atomic()
> >>>
> >>> Is not this very much powerpc 32 specific or this will be applicable
> >>> for all platform which uses kmap_XXX() to map high memory ?
> >>>
> >>
> >> See https://elixir.bootlin.com/linux/v5.3-rc8/source/include/linux/highmem.h#L91
> >>
> >> I think it applies at least to all arches using the generic implementation.
> >>
> >> Applies also to arm:
> >> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/mm/highmem.c#L52
> >>
> >> Applies also to mips:
> >> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/mips/mm/highmem.c#L47
> >>
> >> Same on sparc:
> >> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/sparc/mm/highmem.c#L52
> >>
> >> Same on x86:
> >> https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/x86/mm/highmem_32.c#L34
> >>
> >> I have not checked others, but I guess it is like that for all.
> >>
> > 
> > 
> > Seems like I answered too quickly. All kmap_atomic() do preempt_disable(), but not all pte_alloc_map() call kmap_atomic().
> > 
> > However, for instance ARM does:
> > 
> > https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/arm/include/asm/pgtable.h#L200
> > 
> > And X86 as well:
> > 
> > https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/x86/include/asm/pgtable_32.h#L51
> > 
> > Microblaze also:
> > 
> > https://elixir.bootlin.com/linux/v5.3-rc8/source/arch/microblaze/include/asm/pgtable.h#L495
> 
> All the above platforms checks out to be using k[un]map_atomic(). I am wondering whether
> any of the intermediate levels will have similar problems on any these 32 bit platforms
> or any other platforms which might be using generic k[un]map_atomic().

No. Kernel only allocates pte page table from highmem. All other page
tables are always visible in kernel address space.

-- 
 Kirill A. Shutemov

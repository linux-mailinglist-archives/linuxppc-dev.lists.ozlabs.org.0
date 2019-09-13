Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 80588B1A92
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 11:14:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46V92J0BsSzF3Lw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2019 19:14:48 +1000 (AEST)
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
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="cuhllGlp"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46V90L5mFlzF4qN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 19:13:06 +1000 (AEST)
Received: by mail-ed1-x544.google.com with SMTP id g12so733293eds.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2019 02:13:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to
 :user-agent; bh=GEliFawsGnvWaq/wjC8o7X+uw8pCAUzjjDt3si5wKpw=;
 b=cuhllGlp2MOrdGub8Xg9DSnbN4UNbu5MAj+tu2g8/hUaiRvqMMOHfTNwMUyS5pk0Wh
 Cr/5CrT44vV+Lu6MEqICuL5EsXflVt2aB1CYOvw49Ff95R0+EpyudeDA0c1SjKiSBgvJ
 j392DdO8k5wtN6+t0Mq4Pin3skB6EB7fqWabfD22XoO9Zau3MU3BJhMVCPaEwzZDcctL
 3Z1utSLzZkSKBXiuC7y0bwtRfMC6JHyQJ4KI6FWcJD3QstGxSDpCFQt7SWa9ffXb7iM8
 Ka/YoQxle3ll0z8qQj2WsoJL1cViPtFo+jeRDT45DkakRyYbR2vwrsjhDwiP9OSANs1/
 05gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=GEliFawsGnvWaq/wjC8o7X+uw8pCAUzjjDt3si5wKpw=;
 b=eGuf+8Zk0ZMJkw05QAkDEgsZNyWic7f47Q2/157nMa8HAQS74r1g6Dk4D+Ti6HKSnk
 JW2pK+VMnblHq6zqqC4wZnwNI4vCqS0+5lcYqV/lxeQg++ESUVSBCxFgImNYFt158KCs
 0sIKeK3vBb3T0Kys4gETi+NIf1NQWoCt1msRIe1FRcXufatX7wywDBzW3UXeWkLG7/VJ
 aBf8knEpcrXE3Ws8s6+CgEZ7mY4NIzv8yrZOWaRK7m9fyJclRqM3d0a23ZVpc/QYgJAS
 bn18nThv7ppoviLh6OWZrSyfPKbCp/b+3HPtvKRV93Z6PCTV1C2ID/FPymjg6Dmao1Kr
 BYbg==
X-Gm-Message-State: APjAAAV3BXeTQqKxxcMQKYF4NWnsGp74LLQMwhBgXWz3TDmmjdL0QUlx
 DsIqiFeoMEIJVGvj3sj5GC3PNA==
X-Google-Smtp-Source: APXvYqz9+Jjoiq6EpEOnNn2ue7LgRH298IcNtOZjCAdMkVz1fw1ulTQ0FfVWoOu1Q7FOQkoJoXJfvw==
X-Received: by 2002:aa7:da59:: with SMTP id w25mr44834467eds.143.1568365983857; 
 Fri, 13 Sep 2019 02:13:03 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id oo23sm3092469ejb.64.2019.09.13.02.13.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Sep 2019 02:13:03 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 3271B10160B; Fri, 13 Sep 2019 12:13:05 +0300 (+03)
Date: Fri, 13 Sep 2019 12:13:05 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V2 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
Message-ID: <20190913091305.rkds4f3fqv3yjhjy@box>
References: <1568268173-31302-1-git-send-email-anshuman.khandual@arm.com>
 <1568268173-31302-3-git-send-email-anshuman.khandual@arm.com>
 <ab0ca38b-1e4f-b636-f8b4-007a15903984@c-s.fr>
 <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <502c497a-9bf1-7d2e-95f2-cfebcd9cf1d9@arm.com>
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
 James Hogan <jhogan@kernel.org>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Mark Brown <broonie@kernel.org>, Dan Williams <dan.j.williams@intel.com>,
 Vlastimil Babka <vbabka@suse.cz>, Sri Krishna chowdary <schowdary@nvidia.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Dave Hansen <dave.hansen@intel.com>, linux-mips@vger.kernel.org,
 Ralf Baechle <ralf@linux-mips.org>, linux-kernel@vger.kernel.org,
 Paul Burton <paul.burton@mips.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 13, 2019 at 02:32:04PM +0530, Anshuman Khandual wrote:
> 
> On 09/12/2019 10:44 PM, Christophe Leroy wrote:
> > 
> > 
> > Le 12/09/2019 à 08:02, Anshuman Khandual a écrit :
> >> This adds a test module which will validate architecture page table helpers
> >> and accessors regarding compliance with generic MM semantics expectations.
> >> This will help various architectures in validating changes to the existing
> >> page table helpers or addition of new ones.
> >>
> >> Test page table and memory pages creating it's entries at various level are
> >> all allocated from system memory with required alignments. If memory pages
> >> with required size and alignment could not be allocated, then all depending
> >> individual tests are skipped.
> >>
> > 
> > [...]
> > 
> >>
> >> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> >> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> >> ---
> >>   arch/x86/include/asm/pgtable_64_types.h |   2 +
> >>   mm/Kconfig.debug                        |  14 +
> >>   mm/Makefile                             |   1 +
> >>   mm/arch_pgtable_test.c                  | 429 ++++++++++++++++++++++++
> >>   4 files changed, 446 insertions(+)
> >>   create mode 100644 mm/arch_pgtable_test.c
> >>
> >> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> >> index 52e5f5f2240d..b882792a3999 100644
> >> --- a/arch/x86/include/asm/pgtable_64_types.h
> >> +++ b/arch/x86/include/asm/pgtable_64_types.h
> >> @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
> >>   #define pgtable_l5_enabled() 0
> >>   #endif /* CONFIG_X86_5LEVEL */
> >>   +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
> >> +
> > 
> > This is specific to x86, should go in a separate patch.
> 
> Thought about it but its just a single line. Kirill suggested this in the
> previous version. There is a generic fallback definition but s390 has it's
> own. This change overrides the generic one for x86 probably as a fix or as
> an improvement. Kirill should be able to help classify it in which case it
> can be a separate patch.

I don't think it worth a separate patch.

-- 
 Kirill A. Shutemov

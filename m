Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D29DCE2DE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 15:15:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n1DV6qwHzDqLC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 00:15:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::344; helo=mail-wm1-x344.google.com;
 envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tJAewuqA"; 
 dkim-atps=neutral
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n12X0GwCzDqL8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2019 00:06:25 +1100 (AEDT)
Received: by mail-wm1-x344.google.com with SMTP id v17so12258193wml.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Oct 2019 06:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=RZE8Cj868kn5EJS/0QY29Orx1bZsg1Fle+VfrZSmgF8=;
 b=tJAewuqAmBMfjpkJA/1enuzflTjuI48UJZ0Z0fdDtpXMvjWt8JagrRMgnZLLai9UeY
 mkbErQhWM39j4Hm1s7MX9m/lzVTnkp+OMeG5ZXtiir6jn8BLfHkzXnUShAGoykAHXOnf
 zYcGSR++z2tbIUzuTH5tpf5m9vIc8eF3O3REAZ36+mr/kHp8w4U5Z+7uVFz79ksG8TIC
 eqab017gzKxysvQg39onykCPqr4VZgoidG0IKRK7bzgdYmIjLQ14xRLyhnknxrgOj8o1
 kkqFWIhWiVMX57N1WUPYfE6wABoyQFZVbrbpv3hVtkeFHgU3i9sImWF4xz9fwLCh2ch6
 oGzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=RZE8Cj868kn5EJS/0QY29Orx1bZsg1Fle+VfrZSmgF8=;
 b=GlJX1eoXB1Lnm565fn9I9p+8eu78hYPFHHKwuKZJOTr6EX5TXTlbfGal3CwmNaLr+H
 HxRY/QjEA04b+uqkQ/HRaPWU8CCOYx0y2PipNrUvHhZaVIrWKfHjKbWnecd0d4bsscUd
 FigH5e6Q+Jd26kBnKLsXz1fer0Etx19EBunFh2mnvMyF1dQysy2y6uH9nYgZZhs642vQ
 rOTHN+BVCuUgiS5U/6uV1bccY35Wct1j5mz3HgJI4p6tVpKqfMS4m4FjI0e75Jh5Qdb8
 CN8QBPdqCBTrkWvEbovwlZM2zrR2V1degRdalJCzYakJwHoLan/rAGFl3vR2GS5bR57j
 rgdg==
X-Gm-Message-State: APjAAAVIC7Nb3hj9eGjojLzwEvdALeOvbL/X7lUiIXTwMan0MH9VMaIA
 8QpCmjnJLqt96V9xgNKjaXM=
X-Google-Smtp-Source: APXvYqwnZjlpL4PUUAvfK5d4pYWeE31TwsXrlSV5mEiGcVQWwRB9VHCMKlpm1WOlkrkBBukHu/Su/w==
X-Received: by 2002:a1c:7fcc:: with SMTP id a195mr21060937wmd.27.1570453581529; 
 Mon, 07 Oct 2019 06:06:21 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id l4sm14525979wrw.6.2019.10.07.06.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 06:06:20 -0700 (PDT)
Date: Mon, 7 Oct 2019 15:06:17 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V4 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
Message-ID: <20191007130617.GB56546@gmail.com>
References: <1570427124-21887-1-git-send-email-anshuman.khandual@arm.com>
 <1570427124-21887-3-git-send-email-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1570427124-21887-3-git-send-email-anshuman.khandual@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
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


* Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> This adds a test module which will validate architecture page table helpers
> and accessors regarding compliance with generic MM semantics expectations.
> This will help various architectures in validating changes to the existing
> page table helpers or addition of new ones.
> 
> Test page table and memory pages creating it's entries at various level are
> all allocated from system memory with required alignments. If memory pages
> with required size and alignment could not be allocated, then all depending
> individual tests are skipped.

> diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> index 52e5f5f2240d..b882792a3999 100644
> --- a/arch/x86/include/asm/pgtable_64_types.h
> +++ b/arch/x86/include/asm/pgtable_64_types.h
> @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
>  #define pgtable_l5_enabled() 0
>  #endif /* CONFIG_X86_5LEVEL */
>  
> +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
> +
>  extern unsigned int pgdir_shift;
>  extern unsigned int ptrs_per_p4d;

Any deep reason this has to be a macro instead of proper C?

> diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
> index 327b3ebf23bf..683131b1ee7d 100644
> --- a/mm/Kconfig.debug
> +++ b/mm/Kconfig.debug
> @@ -117,3 +117,18 @@ config DEBUG_RODATA_TEST
>      depends on STRICT_KERNEL_RWX
>      ---help---
>        This option enables a testcase for the setting rodata read-only.
> +
> +config DEBUG_ARCH_PGTABLE_TEST
> +	bool "Test arch page table helpers for semantics compliance"
> +	depends on MMU
> +	depends on DEBUG_KERNEL
> +	depends on !(ARM || IA64)

Please add a proper enabling switch for architectures to opt in.

Please also add it to Documentation/features/list-arch.sh so that it's 
listed as a 'TODO' entry on architectures where the tests are not enabled 
yet.

> +	help
> +	  This options provides a kernel module which can be used to test
> +	  architecture page table helper functions on various platform in
> +	  verifying if they comply with expected generic MM semantics. This
> +	  will help architectures code in making sure that any changes or
> +	  new additions of these helpers will still conform to generic MM
> +	  expected semantics.

Typos and grammar fixed:

	help
	  This option provides a kernel module which can be used to test
	  architecture page table helper functions on various platforms in
	  verifying if they comply with expected generic MM semantics. This
	  will help architecture code in making sure that any changes or
	  new additions of these helpers still conform to expected 
	  semantics of the generic MM.

Also, more fundamentally: isn't a kernel module too late for such a debug 
check, should something break due to a core MM change? Have these debug 
checks caught any bugs or inconsistencies before?

Why not call this as some earlier MM debug check, after enabling paging 
but before executing user-space binaries or relying on complex MM ops 
within the kernel, called at a stage when those primitives are all 
expected to work fine?

It seems to me that arch_pgtable_tests_init) won't even context-switch 
normally, right?

Finally, instead of inventing yet another randomly named .config debug 
switch, please fit it into the regular MM debug options which go along 
the CONFIG_DEBUG_VM* naming scheme.

Might even make sense to enable these new debug checks by default if 
CONFIG_DEBUG_VM=y, that way we'll get a *lot* more debug coverage than 
some random module somewhere that few people will know about, let alone 
run.

Thanks,

	Ingo

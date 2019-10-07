Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 715D3CE44F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 15:53:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n2570sSPzDqNP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 00:53:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ic0JkvFI"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n23H2fFDzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2019 00:52:08 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id j18so14609283wrq.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Oct 2019 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=NqDKw2q0fE+vHWOgUAiru/n1NoCQkdZ2AUuiN/uBGU8=;
 b=ic0JkvFI48xbG9WtluZM0Hf2PaBXHEnROez7bzryeyJvDMyBL5e6TbbMM0jUfHQLcj
 N60dwtHrD83rN8DO0nAWlFYhXP8KC2u6M4pUl5c0nz2hn71y23NUwAnaxYFkxrH4ok93
 +qfxQR+o9B6oGOhK4vKltZbgeMC0rGmYE19yAJrAQ1/yj8WoUn37LJOzT1mjCMj3nWxf
 T+d+hYdoZYOlliAXcaBDcfhvlDagJJO/aYGfkcviRX3zUAubMvNmWNjd1pemdF4Sv8ip
 gy5V18KXkquelqXpy56UmV1xBTQrBaryDxBotNjsV4DVgQZQSEqRJYVQMZJf/ufLy8+j
 SRrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=NqDKw2q0fE+vHWOgUAiru/n1NoCQkdZ2AUuiN/uBGU8=;
 b=ZoObdcfG9Nd6EFfN2cEv0HNX41KP5Rnhx05Q/albHCLDMZSqMjYIb2OFPf/nhVpVdi
 X7kLNSRWFMd7j42ek8+V3cwgNs+3WFRV4YKXVCXuyqzVt0Og2HZ04jy8PGPg3lM1IDts
 PCrBEhlDUHwz6fS6Z3hIiJNhrnVGtnK3ZPZPwTnRku6iufWbqVOSwvVkQnI+JmldgOkE
 Rg0iMt9C6rKWNyIbBJ/edhYPJcK1M0CBRFZX43XKXhgu/fI61/hZadhhTZNBP2eJbfU3
 Rzl3zPgi4+Vfv3jfi6DmgFk1JdHHcc5/GcB4Y6gF7XrXdsdDhqCro7qU6M+l5Wq48Ull
 PJ7A==
X-Gm-Message-State: APjAAAWRQ88CFY1/1fzRocVHjn8PvKoo7F01Yi2AgprLuw1YQ4dQc+0Y
 4yJy6CeJ0XICv90vtxhbEcg=
X-Google-Smtp-Source: APXvYqwFD0AmO4hRi+9l8ADVfmGE8OkR9Fnj4QRZ24lM5fadabYkivM/y6etDxaG7ZOadEedrbv48w==
X-Received: by 2002:a5d:6441:: with SMTP id d1mr16719177wrw.254.1570456322346; 
 Mon, 07 Oct 2019 06:52:02 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id q19sm41499530wra.89.2019.10.07.06.52.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 06:52:01 -0700 (PDT)
Date: Mon, 7 Oct 2019 15:51:58 +0200
From: Ingo Molnar <mingo@kernel.org>
To: "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH V4 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
Message-ID: <20191007135158.GA36360@gmail.com>
References: <1570427124-21887-1-git-send-email-anshuman.khandual@arm.com>
 <1570427124-21887-3-git-send-email-anshuman.khandual@arm.com>
 <20191007130617.GB56546@gmail.com>
 <20191007132607.4q537nauwfn5thol@box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007132607.4q537nauwfn5thol@box>
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
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-s390@vger.kernel.org, x86@kernel.org,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Matthew Wilcox <willy@infradead.org>, Steven Price <Steven.Price@arm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Kees Cook <keescook@chromium.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
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


* Kirill A. Shutemov <kirill@shutemov.name> wrote:

> On Mon, Oct 07, 2019 at 03:06:17PM +0200, Ingo Molnar wrote:
> > 
> > * Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> > 
> > > This adds a test module which will validate architecture page table helpers
> > > and accessors regarding compliance with generic MM semantics expectations.
> > > This will help various architectures in validating changes to the existing
> > > page table helpers or addition of new ones.
> > > 
> > > Test page table and memory pages creating it's entries at various level are
> > > all allocated from system memory with required alignments. If memory pages
> > > with required size and alignment could not be allocated, then all depending
> > > individual tests are skipped.
> > 
> > > diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> > > index 52e5f5f2240d..b882792a3999 100644
> > > --- a/arch/x86/include/asm/pgtable_64_types.h
> > > +++ b/arch/x86/include/asm/pgtable_64_types.h
> > > @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
> > >  #define pgtable_l5_enabled() 0
> > >  #endif /* CONFIG_X86_5LEVEL */
> > >  
> > > +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
> > > +
> > >  extern unsigned int pgdir_shift;
> > >  extern unsigned int ptrs_per_p4d;
> > 
> > Any deep reason this has to be a macro instead of proper C?
> 
> It's a way to override the generic mm_p4d_folded(). It can be rewritten
> as inline function + define. Something like:
> 
> #define mm_p4d_folded mm_p4d_folded
> static inline bool mm_p4d_folded(struct mm_struct *mm)
> {
> 	return !pgtable_l5_enabled();
> }
> 
> But I don't see much reason to be more verbose here than needed.

C type checking? Documentation? Yeah, I know it's just a one-liner, but 
the principle of the death by a thousand cuts applies here.

BTW., any reason this must be in the low level pgtable_64_types.h type 
header, instead of one of the API level header files?

Thanks,

	Ingo

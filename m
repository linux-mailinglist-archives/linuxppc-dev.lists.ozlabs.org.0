Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D79CE392
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 15:28:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n1XH5RqPzDqC6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 00:28:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::542; helo=mail-ed1-x542.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20150623.gappssmtp.com
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="LuKZCLEk"; 
 dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n1TJ550szDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2019 00:26:12 +1100 (AEDT)
Received: by mail-ed1-x542.google.com with SMTP id y91so12390659ede.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Oct 2019 06:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gzC3+Ai/BcUPGOo2+frzMx33cRF/lu4IW7bk4buzvfY=;
 b=LuKZCLEks+pxri1fZImZ8aWZNoPyA0k53cdFVsuHb5MDqAN5knWAMDy0wPUsgUxBCF
 gQcbOYCIkTqaNbsMxo5RKNjpP0d8lQMy7pguGPtgJSh9DP3B9YIN2mS8bmQvpx9hwj+h
 f1Slcuf8Kzh1JBnKhidomUrXDTUHxpZKdm+qSnztmiyYersQcoVvJ/ohhpzjG+T7kfj/
 les5EAK/LmmoySH+aJWZ1XdWfqQwdMTB2W4ogQ6nBwrh8QCxg6VIpsZnYghJaIlVBMwA
 tZPwZXA0ICwRWfFHd+u/u3DYHya4aQ5yYd1iqfinaPiyxKvPuAJePigymhWXfsmqSyff
 W1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gzC3+Ai/BcUPGOo2+frzMx33cRF/lu4IW7bk4buzvfY=;
 b=HwC7hpOHaLMfWF+cU0r9gRNhX1BKRicXPEjlP5LLKglpcnm+Re+zgZv4j3LerxVk9e
 sO0N+qZwFX8pZ0cur6tGWRF3wO4cxutAj90uDUkEAaw1JPNbep0TzTQK+G1XKFHa07eT
 PYSNyFNk8a7fR7Hm1CakyXsbuZk51umGUm+OEDGtjYipUGbQb285l8Y1uKlSfSr5Izev
 yDd7+2NZa8GOdFuaMPhUN8EUuFdSgnUqgASg5wZoAc8hWhmf8tDSQ/2fkFzQgCWaWM2l
 oobM43V2+81ziX/fXU0W/QYAE1ZciNxrU1onsYnaJrHz2SCVFfMdbFPEJo/3vbp1XCUG
 biJA==
X-Gm-Message-State: APjAAAXTBk6MYyYAF/+H25kcbVkv0BTkKh3ZHUCofnoxg2ZBryBHXV0S
 gOv83XYuxI15bmOMhUf6S6wJfA==
X-Google-Smtp-Source: APXvYqzElnCPZjbODoQl3J/SFOw2KfpCAczFpMms9cACkFS6giHuVTdY1dFFe29OUP7N4OGq9tG9dw==
X-Received: by 2002:a05:6402:7c1:: with SMTP id
 u1mr29121094edy.198.1570454769090; 
 Mon, 07 Oct 2019 06:26:09 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id t30sm3414834edt.91.2019.10.07.06.26.08
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 06:26:08 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 4DF0F10027F; Mon,  7 Oct 2019 16:26:07 +0300 (+03)
Date: Mon, 7 Oct 2019 16:26:07 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH V4 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
Message-ID: <20191007132607.4q537nauwfn5thol@box>
References: <1570427124-21887-1-git-send-email-anshuman.khandual@arm.com>
 <1570427124-21887-3-git-send-email-anshuman.khandual@arm.com>
 <20191007130617.GB56546@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007130617.GB56546@gmail.com>
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

On Mon, Oct 07, 2019 at 03:06:17PM +0200, Ingo Molnar wrote:
> 
> * Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
> > This adds a test module which will validate architecture page table helpers
> > and accessors regarding compliance with generic MM semantics expectations.
> > This will help various architectures in validating changes to the existing
> > page table helpers or addition of new ones.
> > 
> > Test page table and memory pages creating it's entries at various level are
> > all allocated from system memory with required alignments. If memory pages
> > with required size and alignment could not be allocated, then all depending
> > individual tests are skipped.
> 
> > diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> > index 52e5f5f2240d..b882792a3999 100644
> > --- a/arch/x86/include/asm/pgtable_64_types.h
> > +++ b/arch/x86/include/asm/pgtable_64_types.h
> > @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
> >  #define pgtable_l5_enabled() 0
> >  #endif /* CONFIG_X86_5LEVEL */
> >  
> > +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
> > +
> >  extern unsigned int pgdir_shift;
> >  extern unsigned int ptrs_per_p4d;
> 
> Any deep reason this has to be a macro instead of proper C?

It's a way to override the generic mm_p4d_folded(). It can be rewritten
as inline function + define. Something like:

#define mm_p4d_folded mm_p4d_folded
static inline bool mm_p4d_folded(struct mm_struct *mm)
{
	return !pgtable_l5_enabled();
}

But I don't see much reason to be more verbose here than needed.

-- 
 Kirill A. Shutemov

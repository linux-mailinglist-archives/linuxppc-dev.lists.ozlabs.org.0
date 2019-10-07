Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B901ACE495
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 16:03:01 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46n2Hj6nD0zDqLc
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2019 01:02:57 +1100 (AEDT)
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
 header.i=@shutemov-name.20150623.gappssmtp.com header.b="1dC/oO7K"; 
 dkim-atps=neutral
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46n2FY34JkzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2019 01:01:04 +1100 (AEDT)
Received: by mail-ed1-x544.google.com with SMTP id a15so12548438edt.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Oct 2019 07:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rKL1w3iXknpln9Ux2lFi8nURmFThC0ACAB38j7xMJOw=;
 b=1dC/oO7KYUhQk3Cp+gPvQQFfNUhXo7xBP7fOg6lJXEJoNi4xqoFx/+Z/eteEJO7TfS
 beXRbX34FM5TGrxRC9UtlPyVu0dSHSWxoZtuR+BBMIz3ysIcWEMjUC0trYfvncn0/S1K
 bedaHLGes2jPFyGX3hZIeFJI6nEWOI1RFwcmLQ/j5X/1FPSdYeaocVmbj1FV4QMO0Ct3
 gzIXMAqry05u2l85X3+0Gg6QDGEktesNKTlT1AuPCVLEt0ZvIsj2v9MyWo4Idq82kDyc
 ct/NK1YDtzPjx53EMdfO2f0gZjT1d4J5zb0WVTYkaD/x8lXnVmFKIb86ehHVrjIfm46m
 og+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=rKL1w3iXknpln9Ux2lFi8nURmFThC0ACAB38j7xMJOw=;
 b=qz7Cd4r751UHpXnpUKH6P0kMZCN/RZV1XJ5x3DUfW97zElI3cDpHJTxJG07wOO9kDX
 HxbHVHzdkeIDOV1EVxjWMtHd402Hfp3tuyNJFKsMX2Ijig/b+ez43R3FXXMrDh+WzvNa
 IACBML47pI25NGAJWP3FsfdF8IVQtDjedaamSsnpoZvY3bTc4hsM+pCMNjwZWnnZbACX
 jRXSw9gxnoSFJEACMikBDkw/NPNwh3HZpGM/iCqBUrNCQU2R7P3G5PjoDcBzg8s+HYSU
 Vghd9hQc+/pbQUfB1Lc09jdj9Aj8mwcpyuAEHtfXHuO7DQua+j0+Uoj8knfLL9ztHW7Z
 xNRA==
X-Gm-Message-State: APjAAAXyM54EaBW2QTtm8hldlD6EYjvTeVuDBoBZeHjsKLkrCRQnTWVA
 Ylgle1Y/r4C5m2wHWihYvlpbTg==
X-Google-Smtp-Source: APXvYqxuYtPtzk9H5R4kXUotDVtZLwRxmHkom44kwHAzQPnIVU9Dw79/zIRyaunZCbGIUeO/BsAK1g==
X-Received: by 2002:a17:906:4d08:: with SMTP id
 r8mr10168700eju.283.1570456860258; 
 Mon, 07 Oct 2019 07:01:00 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id r18sm3382249edl.6.2019.10.07.07.00.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 07 Oct 2019 07:00:59 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id BDCFF100287; Mon,  7 Oct 2019 17:00:58 +0300 (+03)
Date: Mon, 7 Oct 2019 17:00:58 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Ingo Molnar <mingo@kernel.org>
Subject: Re: [PATCH V4 2/2] mm/pgtable/debug: Add test validating
 architecture page table helpers
Message-ID: <20191007140058.um5g44rvxyzyiref@box>
References: <1570427124-21887-1-git-send-email-anshuman.khandual@arm.com>
 <1570427124-21887-3-git-send-email-anshuman.khandual@arm.com>
 <20191007130617.GB56546@gmail.com>
 <20191007132607.4q537nauwfn5thol@box>
 <20191007135158.GA36360@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191007135158.GA36360@gmail.com>
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

On Mon, Oct 07, 2019 at 03:51:58PM +0200, Ingo Molnar wrote:
> 
> * Kirill A. Shutemov <kirill@shutemov.name> wrote:
> 
> > On Mon, Oct 07, 2019 at 03:06:17PM +0200, Ingo Molnar wrote:
> > > 
> > > * Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> > > 
> > > > This adds a test module which will validate architecture page table helpers
> > > > and accessors regarding compliance with generic MM semantics expectations.
> > > > This will help various architectures in validating changes to the existing
> > > > page table helpers or addition of new ones.
> > > > 
> > > > Test page table and memory pages creating it's entries at various level are
> > > > all allocated from system memory with required alignments. If memory pages
> > > > with required size and alignment could not be allocated, then all depending
> > > > individual tests are skipped.
> > > 
> > > > diff --git a/arch/x86/include/asm/pgtable_64_types.h b/arch/x86/include/asm/pgtable_64_types.h
> > > > index 52e5f5f2240d..b882792a3999 100644
> > > > --- a/arch/x86/include/asm/pgtable_64_types.h
> > > > +++ b/arch/x86/include/asm/pgtable_64_types.h
> > > > @@ -40,6 +40,8 @@ static inline bool pgtable_l5_enabled(void)
> > > >  #define pgtable_l5_enabled() 0
> > > >  #endif /* CONFIG_X86_5LEVEL */
> > > >  
> > > > +#define mm_p4d_folded(mm) (!pgtable_l5_enabled())
> > > > +
> > > >  extern unsigned int pgdir_shift;
> > > >  extern unsigned int ptrs_per_p4d;
> > > 
> > > Any deep reason this has to be a macro instead of proper C?
> > 
> > It's a way to override the generic mm_p4d_folded(). It can be rewritten
> > as inline function + define. Something like:
> > 
> > #define mm_p4d_folded mm_p4d_folded
> > static inline bool mm_p4d_folded(struct mm_struct *mm)
> > {
> > 	return !pgtable_l5_enabled();
> > }
> > 
> > But I don't see much reason to be more verbose here than needed.
> 
> C type checking? Documentation? Yeah, I know it's just a one-liner, but 
> the principle of the death by a thousand cuts applies here.

Okay, if you think it worth it. Anshuman, could you fix it up for the next
submission?


> BTW., any reason this must be in the low level pgtable_64_types.h type 
> header, instead of one of the API level header files?

I defined it next pgtable_l5_enabled(). What is more appropriate place to
you? pgtable_64.h? Yeah, it makes sense.

-- 
 Kirill A. Shutemov

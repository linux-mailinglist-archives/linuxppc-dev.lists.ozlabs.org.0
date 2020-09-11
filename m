Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFF4266910
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 21:41:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bp5jk528mzDqwW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 05:41:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ziepe.ca (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=jgg@ziepe.ca; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256
 header.s=google header.b=pR94XQpt; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bp5gq4vQmzDqly
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 05:40:05 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id n10so8834934qtv.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 12:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=BK+tuqq8QDNrIoMgEZ8skJmt+wwLfpOudGjevs6T6M8=;
 b=pR94XQptn8bYWaLD/i62y0BbH4X2j7wiJqZGlqseUoyJZSGJ0zI0HKYeJ35DMYKrYj
 WbhjcV6+xwWxfqIPSocDLvuU4le3AHcBTI0Kkw63m7PTGBSfCFh8H4C0gtlUJ6ddWvCd
 XcdsVVT9YWUzwHhTOFC4l3Lbeao4TtBRlS8AFvOhX/pLbALT6BgXMIp8At2yTcyVWT+X
 /Gi+2KyTFER9vciFK2XRsy2Nx/3JqByhLTyHCxqiGpqrTEcqOAYJOLnNIo+XUP+DsmVi
 X10VcO/OtSw+SdWqS+NdVAAiGzoxEsRPjZQhGjyOxN9ZUZUawxj+MaNI5ivGNv9YOJ5y
 bbyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=BK+tuqq8QDNrIoMgEZ8skJmt+wwLfpOudGjevs6T6M8=;
 b=Zi3iaXa7NzErIYY26OUsIUb53jraw9UwPzXV+wexLzHny9oRNvGmgutr5a7Y+1Ibzj
 JS+/w+IeDD4JsS2GQvRS2EN+xy4nTJe/kRHwymNf7Dq/M7RS/BZR77AE4rtsqrktfyXH
 yKp1MrOt5MM9B0ixSebiHWgUQR8k7uphi3DtiKwvFMlsxQIlJCWspw/hyE71wjfAkVz/
 iZ/P2R4vEg/YpaN2QwAyV/ZoaW6+D6wHEmCyXEsaURVIIVCIXXmcz0rqv12QFK9gjEY4
 a5eRd9MaRocnQtgbzFc6RC9b5wYy/Y7GHLCqPnV5Qi83SYW/BtF1Zkc2z0vNBcqCCK0E
 S8KQ==
X-Gm-Message-State: AOAM5322kAmXjqc3I7t0P5Wu/1d6TAPP7SQ2GP4mT0LAeuieR37FmG1P
 Yp/g1iW86h391cZUaicGvDldug==
X-Google-Smtp-Source: ABdhPJxer3roPhN5O41vGECqY/2AzhDkztmY22iufRFTo4PTGgzF7YR4n8VSHFjV/DPaACcXuMPDOw==
X-Received: by 2002:ac8:3a06:: with SMTP id w6mr3467667qte.255.1599853201602; 
 Fri, 11 Sep 2020 12:40:01 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-156-34-48-30.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [156.34.48.30])
 by smtp.gmail.com with ESMTPSA id o4sm3733647qkk.75.2020.09.11.12.40.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 12:40:00 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94) (envelope-from <jgg@ziepe.ca>)
 id 1kGots-0059mB-64; Fri, 11 Sep 2020 16:40:00 -0300
Date: Fri, 11 Sep 2020 16:40:00 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Vasily Gorbik <gor@linux.ibm.com>
Subject: Re: [PATCH] mm/gup: fix gup_fast with dynamic page table folding
Message-ID: <20200911194000.GB1221970@ziepe.ca>
References: <20200911070939.GB1362448@hirez.programming.kicks-ass.net>
 <patch.git-2c4880212370.your-ad-here.call-01599849957-ext-4686@work.hours>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <patch.git-2c4880212370.your-ad-here.call-01599849957-ext-4686@work.hours>
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, linux-sparc <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 linux-x86 <x86@kernel.org>, Russell King <linux@armlinux.org.uk>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 John Hubbard <jhubbard@nvidia.com>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm <linux-arm-kernel@lists.infradead.org>,
 Dave Hansen <dave.hansen@intel.com>,
 linux-power <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 11, 2020 at 09:03:06PM +0200, Vasily Gorbik wrote:
> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index e8cbc2e795d5..e899d3506671 100644
> +++ b/include/linux/pgtable.h
> @@ -1427,6 +1427,16 @@ typedef unsigned int pgtbl_mod_mask;
>  #define mm_pmd_folded(mm)	__is_defined(__PAGETABLE_PMD_FOLDED)
>  #endif
>  
> +#ifndef p4d_offset_lockless
> +#define p4d_offset_lockless(pgdp, pgd, address) p4d_offset(&pgd, address)
> +#endif
> +#ifndef pud_offset_lockless
> +#define pud_offset_lockless(p4dp, p4d, address) pud_offset(&p4d, address)
> +#endif
> +#ifndef pmd_offset_lockless
> +#define pmd_offset_lockless(pudp, pud, address) pmd_offset(&pud, address)

Needs brackets: &(pgd) 

These would probably be better as static inlines though, as only s390
compiles will type check pudp like this.

Jason

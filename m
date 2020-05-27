Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9EE1E3BB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 10:16:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49X3ZP4ss0zDqQY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 18:16:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=g+OBuTNL; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49X3WK0zmtzDqPw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 18:13:46 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id 23so11496982pfy.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 01:13:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=1Pvjwk/n6XpSKsFU1yL/UyqSsSwArACV6a9IFuCvWoI=;
 b=g+OBuTNL+ZECp7gRenSfzoC/L0SIFQs2wUNgQ5XneQ49ve7MCXLFqHyaI1J9HP8hFF
 xZFvHdBiADmGYGqBL80SR5GtgLTUbXo9d3UfqDFFj0SLN/B5WFfGMlNyWLAR+tVbvYCz
 C4EDVhl4IEpe78El/g9Nz+dJDWkO/ABrWAn818mbecK+TzsU4h/qWOTh9KLV22jXIyGm
 SrUEFGzeyILWXpcIFBAIOJnIMer+3w8CniZCi5TVTCW1nLLYmDQxBwulWUNK49ca4BOt
 f5OAT0gMgdznpvyOENVsocczF2HFLHy6Oq37nWMHgKTV2N1Nl/lqod7kwe1GiYzM7JwH
 lhVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=1Pvjwk/n6XpSKsFU1yL/UyqSsSwArACV6a9IFuCvWoI=;
 b=AfcYG8T6HLohWQbuvUGQkoA1DDws5IHHpLfIi/rylluNDOQfNEIRlLkJ5AL3cxhKQp
 29oeIE1PrV0zAsQiCq68tk2LUh6Y960m+ICAj6g/9dwGoERjD/oYIgc9sso0lbI2EVu+
 o5prVe/XWm6Dr/jJeTBriFD01VMFsA1lNl754oe72ZpreOXVOoHYm42CI8QKk3IR8kmm
 Yq2qlN/baExW2yDjE2AWzWnTxkAHvJbYp6p2fHjGJlCLoEem2BnRPCzItUNs5wfxkSle
 btoWkkeKIdlPeDbLtnvjTimfSP11viX1OIFDfEigae6Vc8RWvtxQ2w73o3Lmt0HV3pkn
 kBiQ==
X-Gm-Message-State: AOAM532FmBslUHjA/flJjiUmhhysGeiPsHmIaxbD9zyz+oHkQ/+q7Sb2
 O79IFbThWpvdks/ljUCsuoU=
X-Google-Smtp-Source: ABdhPJzbLRuMmxwJUPY5sv1El/ZdSk39d9IjzJRaDZ9+OJbVht9mTOUgNcWeTP5sLyuANVdm7nAJ8g==
X-Received: by 2002:a63:554e:: with SMTP id f14mr2850561pgm.191.1590567223153; 
 Wed, 27 May 2020 01:13:43 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id gz19sm1568851pjb.33.2020.05.27.01.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2020 01:13:42 -0700 (PDT)
Date: Wed, 27 May 2020 01:13:37 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] media: omap3isp: Shuffle cacheflush.h and include mm.h
Message-ID: <20200527081337.GA3506499@ubuntu-s3-xlarge-x86>
References: <20200515143646.3857579-7-hch@lst.de>
 <20200527043426.3242439-1-natechancellor@gmail.com>
 <CAMuHMdVSduTOi5bUgF9sLQdGADwyL1+qALWsKgin1TeOLGhAKQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVSduTOi5bUgF9sLQdGADwyL1+qALWsKgin1TeOLGhAKQ@mail.gmail.com>
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-riscv@lists.infradead.org,
 Christoph Hellwig <hch@lst.de>, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, alpha <linux-alpha@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Jessica Yu <jeyu@kernel.org>, Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Geert,

On Wed, May 27, 2020 at 09:02:51AM +0200, Geert Uytterhoeven wrote:
> Hi Nathan,
> 
> CC Laurent
> 
> On Wed, May 27, 2020 at 6:37 AM Nathan Chancellor
> <natechancellor@gmail.com> wrote:
> > After mm.h was removed from the asm-generic version of cacheflush.h,
> > s390 allyesconfig shows several warnings of the following nature:
> >
> > In file included from ./arch/s390/include/generated/asm/cacheflush.h:1,
> >                  from drivers/media/platform/omap3isp/isp.c:42:
> > ./include/asm-generic/cacheflush.h:16:42: warning: 'struct mm_struct'
> > declared inside parameter list will not be visible outside of this
> > definition or declaration
> >
> > cacheflush.h does not include mm.h nor does it include any forward
> > declaration of these structures hence the warning. To avoid this,
> > include mm.h explicitly in this file and shuffle cacheflush.h below it.
> >
> > Fixes: 19c0054597a0 ("asm-generic: don't include <linux/mm.h> in cacheflush.h")
> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> Thanks for your patch!
> 
> > I am aware the fixes tag is kind of irrelevant because that SHA will
> > change in the next linux-next revision and this will probably get folded
> > into the original patch anyways but still.
> >
> > The other solution would be to add forward declarations of these structs
> > to the top of cacheflush.h, I just chose to do what Christoph did in the
> > original patch. I am happy to do that instead if you all feel that is
> > better.
> 
> That actually looks like a better solution to me, as it would address the
> problem for all users.
> 
> >  drivers/media/platform/omap3isp/isp.c | 5 +++--
> >  1 file changed, 3 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> > index a4ee6b86663e..54106a768e54 100644
> > --- a/drivers/media/platform/omap3isp/isp.c
> > +++ b/drivers/media/platform/omap3isp/isp.c
> > @@ -39,8 +39,6 @@
> >   *     Troy Laramy <t-laramy@ti.com>
> >   */
> >
> > -#include <asm/cacheflush.h>
> > -
> >  #include <linux/clk.h>
> >  #include <linux/clkdev.h>
> >  #include <linux/delay.h>
> > @@ -49,6 +47,7 @@
> >  #include <linux/i2c.h>
> >  #include <linux/interrupt.h>
> >  #include <linux/mfd/syscon.h>
> > +#include <linux/mm.h>
> >  #include <linux/module.h>
> >  #include <linux/omap-iommu.h>
> >  #include <linux/platform_device.h>
> > @@ -58,6 +57,8 @@
> >  #include <linux/sched.h>
> >  #include <linux/vmalloc.h>
> >
> > +#include <asm/cacheflush.h>
> > +
> >  #ifdef CONFIG_ARM_DMA_USE_IOMMU
> >  #include <asm/dma-iommu.h>
> >  #endif
> 
> Why does this file need <asm/cacheflush.h> at all?
> It doesn't call any of the flush_*() functions, and seems to compile fine
> without (on arm32).
> 
> Perhaps it was included at the top intentionally, to override the definitions
> of copy_{to,from}_user_page()? Fortunately that doesn't seem to be the
> case, from a quick look at the assembler output.
> 
> So let's just remove the #include instead?

Sounds good to me. I can send a patch if needed or I suppose Andrew can
just make a small fixup patch for it. Let me know what I should do.

Cheers,
Nathan

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B36C11E4500
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 15:59:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49XCBN2QfkzDqGY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 May 2020 23:59:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ideasonboard.com (client-ip=2001:4b98:dc2:55:216:3eff:fef7:d647;
 helo=perceval.ideasonboard.com;
 envelope-from=laurent.pinchart@ideasonboard.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ideasonboard.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com
 header.a=rsa-sha256 header.s=mail header.b=K8tyyqP2; 
 dkim-atps=neutral
X-Greylist: delayed 378 seconds by postgrey-1.36 at bilbo;
 Wed, 27 May 2020 23:52:20 AEST
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49XC1x08wPzDqS9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 May 2020 23:52:20 +1000 (AEST)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 18CCF5B4;
 Wed, 27 May 2020 15:45:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1590587141;
 bh=FOT36A7X8Hk3Rh2sgJfgv1jk67oSyBWaXMLvby3ZVn0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K8tyyqP2+EBqMtHIXAixv68AVoyRavwX2+DntbLh2vrjNKUdhw1kPp5L8v8XcEQke
 5hoxdGk3u1oikaekAvVN79PzMi7aqfwFJI9F8IdAk1sxTLb8aiHOOnYPs49h177hrO
 RBBxk1jZGiThAgDTQMwbMwsU3yghDgrHe9UIOuIk=
Date: Wed, 27 May 2020 16:45:27 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] media: omap3isp: Shuffle cacheflush.h and include mm.h
Message-ID: <20200527134527.GD6171@pendragon.ideasonboard.com>
References: <20200515143646.3857579-7-hch@lst.de>
 <20200527043426.3242439-1-natechancellor@gmail.com>
 <CAMuHMdVSduTOi5bUgF9sLQdGADwyL1+qALWsKgin1TeOLGhAKQ@mail.gmail.com>
 <20200527081337.GA3506499@ubuntu-s3-xlarge-x86>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200527081337.GA3506499@ubuntu-s3-xlarge-x86>
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
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-c6x-dev@linux-c6x.org,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-media@vger.kernel.org,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>,
 linux-um <linux-um@lists.infradead.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Simek <monstr@monstr.eu>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Sakari Ailus <sakari.ailus@iki.fi>, alpha <linux-alpha@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

(CC'ing Sakari Ailus and the linux-media mailing list)

On Wed, May 27, 2020 at 01:13:37AM -0700, Nathan Chancellor wrote:
> On Wed, May 27, 2020 at 09:02:51AM +0200, Geert Uytterhoeven wrote:
> > On Wed, May 27, 2020 at 6:37 AM Nathan Chancellor wrote:
> > > After mm.h was removed from the asm-generic version of cacheflush.h,
> > > s390 allyesconfig shows several warnings of the following nature:
> > >
> > > In file included from ./arch/s390/include/generated/asm/cacheflush.h:1,
> > >                  from drivers/media/platform/omap3isp/isp.c:42:
> > > ./include/asm-generic/cacheflush.h:16:42: warning: 'struct mm_struct'
> > > declared inside parameter list will not be visible outside of this
> > > definition or declaration
> > >
> > > cacheflush.h does not include mm.h nor does it include any forward
> > > declaration of these structures hence the warning. To avoid this,
> > > include mm.h explicitly in this file and shuffle cacheflush.h below it.
> > >
> > > Fixes: 19c0054597a0 ("asm-generic: don't include <linux/mm.h> in cacheflush.h")
> > > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> > 
> > Thanks for your patch!
> > 
> > > I am aware the fixes tag is kind of irrelevant because that SHA will
> > > change in the next linux-next revision and this will probably get folded
> > > into the original patch anyways but still.
> > >
> > > The other solution would be to add forward declarations of these structs
> > > to the top of cacheflush.h, I just chose to do what Christoph did in the
> > > original patch. I am happy to do that instead if you all feel that is
> > > better.
> > 
> > That actually looks like a better solution to me, as it would address the
> > problem for all users.

Headers should be self-contained, so that would be the best fix in my
opinion.

This being said, as cacheflush.h isn't needed in isp.c, I think we
should also drop it. It seems to have been included there since the
first driver version, and was likely a left-over from the out-of-tree
development. Manual cache handling was part of
drivers/media/platform/omap3isp/ispqueue.c and has been removed in
commit fbac1400bd1a ("[media] omap3isp: Move to videobuf2").

cacheflush.h can also be dropped from ispvideo.c which suffers from the
same issue.

> > >  drivers/media/platform/omap3isp/isp.c | 5 +++--
> > >  1 file changed, 3 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/omap3isp/isp.c b/drivers/media/platform/omap3isp/isp.c
> > > index a4ee6b86663e..54106a768e54 100644
> > > --- a/drivers/media/platform/omap3isp/isp.c
> > > +++ b/drivers/media/platform/omap3isp/isp.c
> > > @@ -39,8 +39,6 @@
> > >   *     Troy Laramy <t-laramy@ti.com>
> > >   */
> > >
> > > -#include <asm/cacheflush.h>
> > > -
> > >  #include <linux/clk.h>
> > >  #include <linux/clkdev.h>
> > >  #include <linux/delay.h>
> > > @@ -49,6 +47,7 @@
> > >  #include <linux/i2c.h>
> > >  #include <linux/interrupt.h>
> > >  #include <linux/mfd/syscon.h>
> > > +#include <linux/mm.h>
> > >  #include <linux/module.h>
> > >  #include <linux/omap-iommu.h>
> > >  #include <linux/platform_device.h>
> > > @@ -58,6 +57,8 @@
> > >  #include <linux/sched.h>
> > >  #include <linux/vmalloc.h>
> > >
> > > +#include <asm/cacheflush.h>
> > > +
> > >  #ifdef CONFIG_ARM_DMA_USE_IOMMU
> > >  #include <asm/dma-iommu.h>
> > >  #endif
> > 
> > Why does this file need <asm/cacheflush.h> at all?
> > It doesn't call any of the flush_*() functions, and seems to compile fine
> > without (on arm32).
> > 
> > Perhaps it was included at the top intentionally, to override the definitions
> > of copy_{to,from}_user_page()? Fortunately that doesn't seem to be the
> > case, from a quick look at the assembler output.
> > 
> > So let's just remove the #include instead?
> 
> Sounds good to me. I can send a patch if needed or I suppose Andrew can
> just make a small fixup patch for it. Let me know what I should do.

-- 
Regards,

Laurent Pinchart

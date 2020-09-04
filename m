Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA0E25D19C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 08:40:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BjSj62P7rzDrNT
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Sep 2020 16:40:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BjSg209TszDqvj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Sep 2020 16:38:19 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A1FFD68AFE; Fri,  4 Sep 2020 08:38:13 +0200 (CEST)
Date: Fri, 4 Sep 2020 08:38:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Al Viro <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH 12/14] x86: remove address space overrides using set_fs()
Message-ID: <20200904063813.GA12204@lst.de>
References: <20200903142242.925828-1-hch@lst.de>
 <20200903142242.925828-13-hch@lst.de>
 <20200904025510.GO1236603@ZenIV.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200904025510.GO1236603@ZenIV.linux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Kees Cook <keescook@chromium.org>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Alexey Dobriyan <adobriyan@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, linux-fsdevel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 04, 2020 at 03:55:10AM +0100, Al Viro wrote:
> On Thu, Sep 03, 2020 at 04:22:40PM +0200, Christoph Hellwig wrote:
> 
> > diff --git a/arch/x86/lib/getuser.S b/arch/x86/lib/getuser.S
> > index c8a85b512796e1..94f7be4971ed04 100644
> > --- a/arch/x86/lib/getuser.S
> > +++ b/arch/x86/lib/getuser.S
> > @@ -35,10 +35,19 @@
> >  #include <asm/smap.h>
> >  #include <asm/export.h>
> >  
> > +#ifdef CONFIG_X86_5LEVEL
> > +#define LOAD_TASK_SIZE_MINUS_N(n) \
> > +	ALTERNATIVE "mov $((1 << 47) - 4096 - (n)),%rdx", \
> > +		    "mov $((1 << 56) - 4096 - (n)),%rdx", X86_FEATURE_LA57
> > +#else
> > +#define LOAD_TASK_SIZE_MINUS_N(n) \
> > +	mov $(TASK_SIZE_MAX - (n)),%_ASM_DX
> > +#endif
> 
> Wait a sec... how is that supposed to build with X86_5LEVEL?  Do you mean
> 
> #define LOAD_TASK_SIZE_MINUS_N(n) \
> 	ALTERNATIVE __stringify(mov $((1 << 47) - 4096 - (n)),%rdx), \
> 		    __stringify(mov $((1 << 56) - 4096 - (n)),%rdx), X86_FEATURE_LA57
> 
> there?

Don't ask me about the how, but it builds and works with X86_5LEVEL,
and the style is copied from elsewhere..

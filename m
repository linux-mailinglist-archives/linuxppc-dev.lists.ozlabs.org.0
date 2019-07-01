Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B695C1C9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 19:11:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cv6c3TZrzDqYj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 03:11:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=stackframe.org
 (client-ip=2001:470:70c5:1111::170; helo=smtp.duncanthrax.net;
 envelope-from=svens@stackframe.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=stackframe.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=duncanthrax.net header.i=@duncanthrax.net
 header.b="ZdE/vRjP"; dkim-atps=neutral
Received: from smtp.duncanthrax.net (smtp.duncanthrax.net
 [IPv6:2001:470:70c5:1111::170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cv3k49dzzDqVn
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 03:09:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date;
 bh=lMzex8jlUCJ2Gwea4xwdWvbCtAAUxSDLkgjI9TE9va0=; b=ZdE/vRjPVuJYU9QL+q2GQwaSjq
 qeaGU3B+ntdQjmLgoZc6V6wW40HUteu1CTDy6jkHHjWywYcj36MCoQbPCuT/ufIwd+gCZCsCwfUk9
 IqU54V7HHV4AFAjIk89VwcSCw2Lt4ly1qCt1JF10kSnBpRIko28/gILQyjAaYuWMiuZM=;
Received: from [134.3.44.134] (helo=t470p.stackframe.org)
 by smtp.eurescom.eu with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.86_2) (envelope-from <svens@stackframe.org>)
 id 1hhznT-0006GR-8o; Mon, 01 Jul 2019 19:08:55 +0200
Date: Mon, 1 Jul 2019 19:08:53 +0200
From: Sven Schnelle <svens@stackframe.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH RFC] generic ELF support for kexec
Message-ID: <20190701170853.GD19243@t470p.stackframe.org>
References: <20190625185433.GA10934@t470p.stackframe.org>
 <87o92isbxg.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o92isbxg.fsf@concordia.ellerman.id.au>
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
Cc: linux-s390@vger.kernel.org, deller@gmx.de, kexec@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Fri, Jun 28, 2019 at 12:04:11PM +1000, Michael Ellerman wrote:
> Sven Schnelle <svens@stackframe.org> writes:
>   https://github.com/linuxppc/wiki/wiki/Booting-with-Qemu
> 
> But I'm not sure where you get a version of kexec that uses kexec_file().

kexec-tools HEAD supports it, so that's not a problem.

> > If that change is acceptable i would finish the patch and submit it. I think
> > best would be to push this change through Helge's parisc tree, so we don't
> > have any dependencies to sort out.
> 
> That will work for you but could cause us problems if we have any
> changes that touch that code.
> 
> It's easy enough to create a topic branch with just that patch that both
> of us merge.

What should be the base branch for that patch? Christophe suggested the
powerpc/merge branch?

> >  #include <linux/elf.h>
> >  #include <linux/kexec.h>
> >  #include <linux/libfdt.h>
> > @@ -31,540 +29,6 @@
> >  #include <linux/slab.h>
> >  #include <linux/types.h>
> >  
> > -#define PURGATORY_STACK_SIZE	(16 * 1024)
> 
> This is unused AFAICS. We should probably remove it explicitly rather
> than as part of this patch.

I have one patch right now. If wanted i can split up all the changes
suggested during the review into smaller pieces, whatever you prefer.

> Or that.
> 
> > +#include <linux/slab.h>
> > +#include <linux/types.h>
> > +
> > +#define elf_addr_to_cpu	elf64_to_cpu
> 
> Why are we doing that rather than just using elf64_to_cpu directly?
> 
> > +#ifndef Elf_Rel
> > +#define Elf_Rel		Elf64_Rel
> > +#endif /* Elf_Rel */
> 
> And that?

Don't know - ask the PPC people :-)

Regards
Sven

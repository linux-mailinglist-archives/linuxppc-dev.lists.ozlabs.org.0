Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B14EF3A17ED
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Jun 2021 16:51:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G0VRm1h1jz3byc
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Jun 2021 00:51:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YkHX/JVf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=YkHX/JVf; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G0VRD53MSz303y
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Jun 2021 00:51:04 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2163C6128A;
 Wed,  9 Jun 2021 14:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623250261;
 bh=svcXYr1x4uog0gl91R41ozY2Q0KNDzZmG4YRGTMMy2A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YkHX/JVfHqUvpWvWXkgg3rdrkk7agHtEIKqaX0vfSpX504lTGaDjO7Qz7iARqzkGp
 DWsHVY+tAbRsBUSVBkbhVjgZvGY6y/wRIXGMo+CgzooB/zqPomfgnsHX9y3mgTbMXc
 xGiW+RangNEk+pKIT8UX8w6paGaFQZLDQ+McKqTpjqFKueMHIVGMXJpalfW0Fph76r
 Lcm2WPwzewVnde/Vu5ujWTdQssxwNbFghUliAxp8Ku3YbSQHaHnLbkGz+awfGrnWGJ
 yu4qANQoP9p9s4/vzkSPeJiYpDnHVlRdjW4xbBVW2tivL4go8M8laNS3QaNsdGKKc0
 R1JEjjJpSG45g==
Date: Wed, 9 Jun 2021 17:50:50 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH v2 0/9] Remove DISCINTIGMEM memory model
Message-ID: <YMDVSu00xXGmdCtC@kernel.org>
References: <20210604064916.26580-1-rppt@kernel.org>
 <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a2tZDJDqgr9-1vJrnbDhd_36eKq8LMEznDkU7rvuAnAag@mail.gmail.com>
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux-MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Richard Henderson <rth@twiddle.net>, Vineet Gupta <vgupta@synopsys.com>,
 kexec@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Wed, Jun 09, 2021 at 01:30:39PM +0200, Arnd Bergmann wrote:
> On Fri, Jun 4, 2021 at 8:49 AM Mike Rapoport <rppt@kernel.org> wrote:
> >
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > Hi,
> >
> > SPARSEMEM memory model was supposed to entirely replace DISCONTIGMEM a
> > (long) while ago. The last architectures that used DISCONTIGMEM were
> > updated to use other memory models in v5.11 and it is about the time to
> > entirely remove DISCONTIGMEM from the kernel.
> >
> > This set removes DISCONTIGMEM from alpha, arc and m68k, simplifies memory
> > model selection in mm/Kconfig and replaces usage of redundant
> > CONFIG_NEED_MULTIPLE_NODES and CONFIG_FLAT_NODE_MEM_MAP with CONFIG_NUMA
> > and CONFIG_FLATMEM respectively.
> >
> > I've also removed NUMA support on alpha that was BROKEN for more than 15
> > years.
> >
> > There were also minor updates all over arch/ to remove mentions of
> > DISCONTIGMEM in comments and #ifdefs.
> 
> Hi Mike and Andrew,
> 
> It looks like everyone is happy with this version so far. How should we merge it
> for linux-next? I'm happy to take it through the asm-generic tree, but linux-mm
> would fit at least as well. In case we go for linux-mm, feel free to add

Andrew already took to mmotm.
 
> Acked-by: Arnd Bergmann <arnd@arndb.de>

Thanks!

> for the whole series.

-- 
Sincerely yours,
Mike.

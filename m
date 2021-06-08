Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C96C539EE54
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 07:45:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FzfNT1Tttz3btr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Jun 2021 15:45:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=G0Rtshf8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=G0Rtshf8; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FzfN26lfSz2xy4
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Jun 2021 15:45:22 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5D8361029;
 Tue,  8 Jun 2021 05:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623131119;
 bh=49fVzdt4MSY+UspP64EgJQ791zimRP1gxTciSlJZXt4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G0Rtshf8pvTrv3vEhpsoWQuj5JjeNYokUzfYJ5STkCXI/OnFwZ+jzE319giZq9upk
 Ip6wZYmg/mXX1RsKoBHJISuKRrHfu3i7LKK8o6lrdj3F/wsMYKU4KSiTq0yf0Te/9Y
 EXkEDnDuymhI/7Es9g0unojNazWzSj6FWZpsSVsuRv7SkD+TKqrUPOkH42sn/s2o3k
 YyeAtmie679nER7vSNNhYu+t0T8vpaLE8THVLmZUT2dI3k363OIVX5xgUfeXV7EiTs
 ihyAaoDmjCZhWOCiJEmXQBaJ0yMnS1SK6yRX7SpN+JL1ZvqVGV5DXW68K81QTP/SNc
 ubRqN6fNQU7pg==
Date: Tue, 8 Jun 2021 08:45:07 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v2 8/9] mm: replace CONFIG_NEED_MULTIPLE_NODES with
 CONFIG_NUMA
Message-ID: <YL8D47Ty8iXZJsK3@kernel.org>
References: <20210604064916.26580-1-rppt@kernel.org>
 <20210604064916.26580-9-rppt@kernel.org>
 <CAMuHMdVa29gUQAdHjKh-qDNpOJaoGwXtUkBM2qnOTi1DWV70xA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVa29gUQAdHjKh-qDNpOJaoGwXtUkBM2qnOTi1DWV70xA@mail.gmail.com>
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
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux MM <linux-mm@kvack.org>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Matt Turner <mattst88@gmail.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-m68k <linux-m68k@lists.linux-m68k.org>,
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

Hi,

On Mon, Jun 07, 2021 at 10:53:08AM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Fri, Jun 4, 2021 at 8:50 AM Mike Rapoport <rppt@kernel.org> wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > After removal of DISCINTIGMEM the NEED_MULTIPLE_NODES and NUMA
> > configuration options are equivalent.
> >
> > Drop CONFIG_NEED_MULTIPLE_NODES and use CONFIG_NUMA instead.
> >
> > Done with
> >
> >         $ sed -i 's/CONFIG_NEED_MULTIPLE_NODES/CONFIG_NUMA/' \
> >                 $(git grep -wl CONFIG_NEED_MULTIPLE_NODES)
> >         $ sed -i 's/NEED_MULTIPLE_NODES/NUMA/' \
> >                 $(git grep -wl NEED_MULTIPLE_NODES)
> >
> > with manual tweaks afterwards.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Thanks for your patch!
> 
> As you dropped the following hunk from v2 of PATCH 5/9, there's now
> one reference left of CONFIG_NEED_MULTIPLE_NODES
> (plus the discontigmem comment):

Aargh, indeed. Thanks for catching this.

And I wondered why you suggested to fix spelling in cover letter for v3 :)
 
> -diff --git a/mm/memory.c b/mm/memory.c
> -index f3ffab9b9e39157b..fd0ebb63be3304f5 100644
> ---- a/mm/memory.c
> -+++ b/mm/memory.c
> -@@ -90,8 +90,7 @@
> - #warning Unfortunate NUMA and NUMA Balancing config, growing
> page-frame for last_cpupid.
> - #endif
> -
> --#ifndef CONFIG_NEED_MULTIPLE_NODES
> --/* use the per-pgdat data instead for discontigmem - mbligh */
> -+#ifdef CONFIG_FLATMEM
> - unsigned long max_mapnr;
> - EXPORT_SYMBOL(max_mapnr);
> -
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

-- 
Sincerely yours,
Mike.

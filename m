Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF13398B5F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 16:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw9jp0l7Kz303Q
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 00:03:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=j8vmJNJ0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=rppt@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=j8vmJNJ0; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw9jL5Tbhz2xdM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 00:03:18 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8CE12613B8;
 Wed,  2 Jun 2021 14:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1622642595;
 bh=rVTIekozkKZiHFO8KV73KQ3u8bmmogfis0wnY/V9zMk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j8vmJNJ02mTS2qujW9AuK34CyGewsKEQa3NJI4x54mI/kZ6TFkXgNShYSldLi9wwR
 iVZIZpo10XmlpdD1gKCLSxI2hAconHrCrMCgpriX/VTH8VoFXTo8owedKrPE/jIZ0c
 D0z4cOoqJMINruzqON7gaCTnozO9ZlPYtavKjKyFVVT2dZ+EtfNVi3gYHbuLNepcSX
 +gq/yzfSnUELMMLNTwhQ6DbA0qs/Rfv2LkuAbudO4aFFo53imu8k7hO2V3DMiMK48/
 BPzuDC2hRRaPw3diNLbn7YRlcBUV1pB+YMb1s77Dpt31JAkWDkRc6hv1mITOzdI2oz
 pUQhhp2WADSpA==
Date: Wed, 2 Jun 2021 17:03:01 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH 4/9] m68k: remove support for DISCONTIGMEM
Message-ID: <YLePlSaXR0XvtZki@kernel.org>
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-5-rppt@kernel.org>
 <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
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

On Wed, Jun 02, 2021 at 01:25:24PM +0200, Geert Uytterhoeven wrote:
> Hi Mike,
> 
> On Wed, Jun 2, 2021 at 12:54 PM Mike Rapoport <rppt@kernel.org> wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> >
> > DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> > in v5.11.
> >
> > Remove the support for DISCONTIGMEM entirely.
> >
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> 
> Thanks for your patch!
> 
> Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
> 
> > --- a/arch/m68k/include/asm/page_mm.h
> > +++ b/arch/m68k/include/asm/page_mm.h
> > @@ -126,25 +126,7 @@ static inline void *__va(unsigned long x)
> >
> >  extern int m68k_virt_to_node_shift;
> >
> > -#ifndef CONFIG_DISCONTIGMEM
> >  #define __virt_to_node(addr)   (&pg_data_map[0])
> 
> With pg_data_map[] removed, this definition can go as well.
> Seems to be a leftover from 1008a11590b966b4 ("m68k: switch to MEMBLOCK
>  + NO_BOOTMEM")
> 
> There are a few more:
> arch/m68k/include/asm/mmzone.h:extern pg_data_t pg_data_map[];
> arch/m68k/include/asm/mmzone.h:#define NODE_DATA(nid)
> (&pg_data_map[nid])

It seems that arch/m68k/include/asm/mmzone.h can be simply removed.
 
> > -#else
> > -extern struct pglist_data *pg_data_table[];
> > -
> > -static inline __attribute_const__ int __virt_to_node_shift(void)
> > -{
> > -       int shift;
> > -
> > -       asm (
> > -               "1:     moveq   #0,%0\n"
> > -               m68k_fixup(%c1, 1b)
> > -               : "=d" (shift)
> > -               : "i" (m68k_fixup_vnode_shift));
> > -       return shift;
> > -}
> > -
> > -#define __virt_to_node(addr)   (pg_data_table[(unsigned long)(addr) >> __virt_to_node_shift()])
> > -#endif
> 
> > --- a/arch/m68k/mm/init.c
> > +++ b/arch/m68k/mm/init.c
> > @@ -44,28 +44,8 @@ EXPORT_SYMBOL(empty_zero_page);
> >
> >  int m68k_virt_to_node_shift;
> >
> > -#ifdef CONFIG_DISCONTIGMEM
> > -pg_data_t pg_data_map[MAX_NUMNODES];
> > -EXPORT_SYMBOL(pg_data_map);
> > -
> > -pg_data_t *pg_data_table[65];
> > -EXPORT_SYMBOL(pg_data_table);
> > -#endif
> > -
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
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

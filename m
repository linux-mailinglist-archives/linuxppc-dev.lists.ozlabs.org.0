Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C253139883F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 13:26:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fw6Cs0D9dz309T
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 21:26:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.42; helo=mail-ua1-f42.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fw6CT2G6pz2yWQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Jun 2021 21:25:40 +1000 (AEST)
Received: by mail-ua1-f42.google.com with SMTP id p1so1063694uam.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 04:25:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AV6hHV9w+Q9HOaDxt1MduQbvvUP04JEJ1UZD5l/XTkY=;
 b=Xlu1D+AIot5W/vTN/0f9Lm9VkXtDJhx91aeVBIK1wlRLzg+Z7/BfKXbEjjlywB/xTL
 ES3bpjtfiA3Sy630dzHTuFY170wGJ6D3n6zbr0CEyeYqnsnjcSr8n5NZFgPocH34MQPm
 f1QpDyBBCKY6qs+Lt+CBNECkJ5mhdd04MCsPYl5geAurjxkCD7r14+t5mUPahUD+qnh/
 e7GASacUNdpsoc8zimSTlENOoxxZT6ylepm9N99Af3wGCHK/6RYJMtyLa/7HlUqJIv/O
 LwedCJrJGUm8Riea0O6bIiPnG+Ee/0JYpurZNskrQl+ELl145LyObCfD7khlbRCLHK9r
 dISA==
X-Gm-Message-State: AOAM531Xseo7aizFVldLPZuQi3UxL9ou6ETvS/AM/qmMJ0fOpTnhaiTL
 9hI8dYDFSF3NpvaHbdCfJUJDzti1jTsk6pYOUSc=
X-Google-Smtp-Source: ABdhPJyzzWa9paQxXHYFBMFScAZBlkmtyILKANDBBOx9rPPA/yxyu03vLu3qpQ9izu7tVqpx2AMkJo4APWbgLQB/p8I=
X-Received: by 2002:ab0:26d8:: with SMTP id b24mr14134972uap.58.1622633136111; 
 Wed, 02 Jun 2021 04:25:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-5-rppt@kernel.org>
In-Reply-To: <20210602105348.13387-5-rppt@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 2 Jun 2021 13:25:24 +0200
Message-ID: <CAMuHMdUUzMNcWNXCjwZmH-VBC+jH1ShBpeg6EBCdRXv3mwHxsQ@mail.gmail.com>
Subject: Re: [PATCH 4/9] m68k: remove support for DISCONTIGMEM
To: Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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

Hi Mike,

On Wed, Jun 2, 2021 at 12:54 PM Mike Rapoport <rppt@kernel.org> wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
>
> DISCONTIGMEM was replaced by FLATMEM with freeing of the unused memory map
> in v5.11.
>
> Remove the support for DISCONTIGMEM entirely.
>
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> --- a/arch/m68k/include/asm/page_mm.h
> +++ b/arch/m68k/include/asm/page_mm.h
> @@ -126,25 +126,7 @@ static inline void *__va(unsigned long x)
>
>  extern int m68k_virt_to_node_shift;
>
> -#ifndef CONFIG_DISCONTIGMEM
>  #define __virt_to_node(addr)   (&pg_data_map[0])

With pg_data_map[] removed, this definition can go as well.
Seems to be a leftover from 1008a11590b966b4 ("m68k: switch to MEMBLOCK
 + NO_BOOTMEM")

There are a few more:
arch/m68k/include/asm/mmzone.h:extern pg_data_t pg_data_map[];
arch/m68k/include/asm/mmzone.h:#define NODE_DATA(nid)
(&pg_data_map[nid])

> -#else
> -extern struct pglist_data *pg_data_table[];
> -
> -static inline __attribute_const__ int __virt_to_node_shift(void)
> -{
> -       int shift;
> -
> -       asm (
> -               "1:     moveq   #0,%0\n"
> -               m68k_fixup(%c1, 1b)
> -               : "=d" (shift)
> -               : "i" (m68k_fixup_vnode_shift));
> -       return shift;
> -}
> -
> -#define __virt_to_node(addr)   (pg_data_table[(unsigned long)(addr) >> __virt_to_node_shift()])
> -#endif

> --- a/arch/m68k/mm/init.c
> +++ b/arch/m68k/mm/init.c
> @@ -44,28 +44,8 @@ EXPORT_SYMBOL(empty_zero_page);
>
>  int m68k_virt_to_node_shift;
>
> -#ifdef CONFIG_DISCONTIGMEM
> -pg_data_t pg_data_map[MAX_NUMNODES];
> -EXPORT_SYMBOL(pg_data_map);
> -
> -pg_data_t *pg_data_table[65];
> -EXPORT_SYMBOL(pg_data_table);
> -#endif
> -

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

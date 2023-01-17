Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DCE66E456
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 18:02:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxFZ56rTWz3fFL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 04:02:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.172; helo=mail-oi1-f172.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxFYW4kRlz3bh6
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 04:02:06 +1100 (AEDT)
Received: by mail-oi1-f172.google.com with SMTP id s124so9619651oif.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 09:02:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AG07rkufzJudbSBlfxWXzYs9DtgP7S33LaaSRTlg/Ec=;
        b=uk+MitSs3iMWzgNyJnI+fTDbuQCts2UOXe44SMVLj5I0VWlHCY2NTvvPPxbQJahOUX
         mW3Syke5hKFTwHaw1KDUWGXPM45D3ygh87H3+LrE1GH3oVRhDo5mjeVmlglDuL2VY7Zl
         SS9C6KYvT5csCm9S5PIbJAZuc1pFpYmXZpea7dqwtjimczTg48d7FDXe2W4Pub0t+BpE
         /fHLd8mpcfpuWNCvlXi8xjhzbs7/4YX+fX+1JqBkTvhSeEt2Oxg5eQjf2OTIfbeyoL+2
         1BV50DI0GSiHsTVFs4IevL6t2Osl05MugEyfsbjOGjCfsyj5BDW7/p0bphiVd9PGRzds
         KAxg==
X-Gm-Message-State: AFqh2kotj0LdNufGqzMjpNwRn3CYkXgBrUK4Drv+Pb5u0111EUGVzxC4
	/sGLxc4n/ey+7gb5mzPjtC71aw8N4FmluA==
X-Google-Smtp-Source: AMrXdXvNDIEM4LDcCGI8O/LFahL2NConHeD0dq1HKeDkD8Hf4sVQgam8xBEx9XlJcqXCv8IxZNiRuQ==
X-Received: by 2002:a05:6808:1708:b0:363:ac4d:810a with SMTP id bc8-20020a056808170800b00363ac4d810amr2195928oib.15.1673974923513;
        Tue, 17 Jan 2023 09:02:03 -0800 (PST)
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com. [209.85.219.175])
        by smtp.gmail.com with ESMTPSA id q13-20020a37f70d000000b006f9ddaaf01esm4629683qkj.102.2023.01.17.09.02.02
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 09:02:03 -0800 (PST)
Received: by mail-yb1-f175.google.com with SMTP id a9so18148480ybb.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 09:02:02 -0800 (PST)
X-Received: by 2002:a25:d88c:0:b0:77a:b5f3:d0ac with SMTP id
 p134-20020a25d88c000000b0077ab5f3d0acmr418050ybg.202.1673974922451; Tue, 17
 Jan 2023 09:02:02 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org> <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com> <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
In-Reply-To: <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 18:01:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
Message-ID: <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com>
Subject: Re: Calculating array sizes in C - was: Re: Build regressions/improvements
 in v6.2-rc1
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
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
Cc: linux-xtensa@linux-xtensa.org, linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Adrian,

On Tue, Jan 17, 2023 at 5:42 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/6/23 16:17, Geert Uytterhoeven wrote:
> >> I'm not seeing this one, but I am getting this one instead:
> >>
> >> In file included from ./arch/sh/include/asm/hw_irq.h:6,
> >>                    from ./include/linux/irq.h:596,
> >>                    from ./include/asm-generic/hardirq.h:17,
> >>                    from ./arch/sh/include/asm/hardirq.h:9,
> >>                    from ./include/linux/hardirq.h:11,
> >>                    from ./include/linux/interrupt.h:11,
> >>                    from ./include/linux/serial_core.h:13,
> >>                    from ./include/linux/serial_sci.h:6,
> >>                    from arch/sh/kernel/cpu/sh2/setup-sh7619.c:11:
> >> ./include/linux/sh_intc.h:100:63: error: division 'sizeof (void *) / sizeof (void)' does not compute the number of array elements [-Werror=sizeof-pointer-div]
> >>     100 | #define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/sizeof(*a)
> >>         |                                                               ^
> >> ./include/linux/sh_intc.h:105:31: note: in expansion of macro '_INTC_ARRAY'
> >>     105 |         _INTC_ARRAY(vectors), _INTC_ARRAY(groups),      \
> >>         |                               ^~~~~~~~~~~
> >
> > The easiest fix for the latter is to disable CONFIG_WERROR.
> > Unfortunately I don't know a simple solution to get rid of the warning.
>
> I did some research and it seems that what the macro _INT_ARRAY() does with "sizeof(a)/sizeof(*a)"
> is a commonly used way to calculate array sizes and the kernel has even its own macro for that
> called ARRAY_SIZE() which Linus asks people to use here [1].
>
> So, I replaced _INTC_ARRAY() with ARRAY_SIZE() (see below), however the kernel's own ARRAY_SIZE()
> macro triggers the same compiler warning. I'm CC'ing Michael Karcher who has more knowledge on
> writing proper C code than me and maybe an idea how to fix this warning.
>
> Thanks,
> Adrian
>
> > [1] https://lkml.org/lkml/2015/9/3/428
>
> diff --git a/include/linux/sh_intc.h b/include/linux/sh_intc.h
> index c255273b0281..07a187686a84 100644
> --- a/include/linux/sh_intc.h
> +++ b/include/linux/sh_intc.h
> @@ -97,14 +97,12 @@ struct intc_hw_desc {
>          unsigned int nr_subgroups;
>   };
>
> -#define _INTC_ARRAY(a) a, __same_type(a, NULL) ? 0 : sizeof(a)/sizeof(*a)
> -
>   #define INTC_HW_DESC(vectors, groups, mask_regs,       \
>                       prio_regs, sense_regs, ack_regs)   \
>   {                                                      \
> -       _INTC_ARRAY(vectors), _INTC_ARRAY(groups),      \
> -       _INTC_ARRAY(mask_regs), _INTC_ARRAY(prio_regs), \
> -       _INTC_ARRAY(sense_regs), _INTC_ARRAY(ack_regs), \
> +       ARRAY_SIZE(vectors), ARRAY_SIZE(groups),        \
> +       ARRAY_SIZE(mask_regs), ARRAY_SIZE(prio_regs),   \
> +       ARRAY_SIZE(sense_regs), ARRAY_SIZE(ack_regs),   \
>   }

The issue is that some of the parameters are not arrays, but
NULL. E.g.:

arch/sh/kernel/cpu/sh2/setup-sh7619.c:static
DECLARE_INTC_DESC(intc_desc, "sh7619", vectors, NULL,
arch/sh/kernel/cpu/sh2/setup-sh7619.c-                   NULL,
prio_registers, NULL);
--

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

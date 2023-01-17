Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D0966E768
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 21:06:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NxKfd2Ycrz3fFD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jan 2023 07:06:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NxKf11XtWz30gk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Jan 2023 07:06:15 +1100 (AEDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-4d19b2686a9so310892197b3.6
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 12:06:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xoeiV+nYOsKZ3P5r1QIbmJ251MgYmk7NsIx6imHg00=;
        b=zCx9PTsCBLVNCzqSgbyqNUzOpmEaBr8GhhtLx3UnOTPiTVXBh2iSYPSf+JP9lVPsDX
         PyWYnyzcBa4deK6DaS0MtFrPYnwJarxjhY95avnqlMTfXIl+Nl7RyR1UbYcOt07w3ovD
         8wo8optfQEUrvOjd9uqJiRxGOsIGT6t3DDHUFXmdoSf1TytLAUY2ySg401Up3jsV1cND
         7Z8UN4Ac/l5UcJn4j84TODiC4UN5QaIqAWxreBUTD5GByKHlsdEfu0VoCWbt8bwcQm/A
         NQLNd2LMYhmjh8AsPnGRq1IMtYf3bTwXxI9s0Q9GS3H9tKycHSOzxfnZKZz5mWIS1C6m
         oH9g==
X-Gm-Message-State: AFqh2kpyk+06Y7SrUMLz3hcZZ5xIL7FEMDRHCrz/21CD8ujfqRA4jqLD
	2oCJ1OS1uS9ZaZuFfJyVVqy8lyxBV9H8Lg==
X-Google-Smtp-Source: AMrXdXuLMX3ABJs23lR3Gq8hXXay7H7X1vbzCeHbCCgo4osxOwqS+7z/UsCz20vdq7CFR8irM0jB2g==
X-Received: by 2002:a81:1111:0:b0:489:af5a:dc1a with SMTP id 17-20020a811111000000b00489af5adc1amr3955563ywr.40.1673985971761;
        Tue, 17 Jan 2023 12:06:11 -0800 (PST)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id bl24-20020a05620a1a9800b007059c5929b8sm5091985qkb.21.2023.01.17.12.06.10
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 12:06:11 -0800 (PST)
Received: by mail-yb1-f182.google.com with SMTP id 188so35472579ybi.9
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 12:06:10 -0800 (PST)
X-Received: by 2002:a25:9012:0:b0:7b8:a0b8:f7ec with SMTP id
 s18-20020a259012000000b007b8a0b8f7ecmr700718ybl.36.1673985970579; Tue, 17 Jan
 2023 12:06:10 -0800 (PST)
MIME-Version: 1.0
References: <CAHk-=wgf929uGOVpiWALPyC7pv_9KbwB2EAvQ3C4woshZZ5zqQ@mail.gmail.com>
 <20221227082932.798359-1-geert@linux-m68k.org> <alpine.DEB.2.22.394.2212270933530.311423@ramsan.of.borg>
 <c05bee5d-0d69-289b-fe4b-98f4cd31a4f5@physik.fu-berlin.de>
 <CAMuHMdXNJveXHeS=g-aHbnxtyACxq1wCeaTg8LbpYqJTCqk86g@mail.gmail.com>
 <3800eaa8-a4da-b2f0-da31-6627176cb92e@physik.fu-berlin.de>
 <CAMuHMdWbBRkhecrqcir92TgZnffMe8ku2t7PcVLqA6e6F-j=iw@mail.gmail.com> <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
In-Reply-To: <429140e0-72fe-c91c-53bc-124d33ab5ffa@physik.fu-berlin.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Jan 2023 21:05:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
Message-ID: <CAMuHMdWpHSsAB3WosyCVgS6+t4pU35Xfj3tjmdCDoyS2QkS7iw@mail.gmail.com>
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
Cc: linux-xtensa@linux-xtensa.org, Arnd Bergmann <arnd@arndb.de>, linux-sh@vger.kernel.org, linux-wireless@vger.kernel.org, linux-mips@vger.kernel.org, amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, Michael Karcher <kernel@mkarcher.dialup.fu-berlin.de>, linux-f2fs-devel@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Adrian,

On Tue, Jan 17, 2023 at 6:06 PM John Paul Adrian Glaubitz
<glaubitz@physik.fu-berlin.de> wrote:
> On 1/17/23 18:01, Geert Uytterhoeven wrote:
> > The issue is that some of the parameters are not arrays, but
> > NULL. E.g.:
> >
> > arch/sh/kernel/cpu/sh2/setup-sh7619.c:static
> > DECLARE_INTC_DESC(intc_desc, "sh7619", vectors, NULL,
> > arch/sh/kernel/cpu/sh2/setup-sh7619.c-                   NULL,
> > prio_registers, NULL);
>
> Isn't this supposed to be caught by this check:
>
>         a, __same_type(a, NULL)
>
> ?

Yeah, but gcc thinks it is smarter than us...
Probably it drops the test, assuming UB cannot happen.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E171844C87E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 20:08:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqDrs634xz3c6j
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 06:08:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.49; helo=mail-ua1-f49.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com
 [209.85.222.49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqDrR2gYbz2xDT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 06:07:49 +1100 (AEDT)
Received: by mail-ua1-f49.google.com with SMTP id ay21so6909440uab.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:07:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JVkOVIMojOtjUqioksXn7GnT56ja9tgOLgQ+4277MEE=;
 b=uDx8NkfBxkkmGO2o51X/55tu3JhsUQTDFivtUxA01PNKnp/8NdoHGSenWY74x0/SsE
 uI+wLMAKXb8xKCzwUSL6pD+MxvHDqjGnmguZqcQ0sZWaGEKAXg+eEUHzrEnUyRoh0A3p
 YavhGVGEsdDscHcHbwZUCDyFNpE4r0M9XMfNISeMGtQGaK5v1FUtEWvtJ18I6Bi4g2FN
 5ghnEVGyUkz5HbbI1fTFOXSlUkrbnuHpLb0rh8+ZKARfjGBUDEvWkJVaNZyuVTJ1pmhj
 ONOZJI3t1AkargILWSloDG0W2JxYiiaue29/9HU2i5tAs/4NU/2GUFe/H0Br8LgACZ1R
 I74A==
X-Gm-Message-State: AOAM530Hg/Y+s/bijUGqIUXkWHXVH4oXu/AstXO6X+5DI2aZPpbRWiIm
 SiwCMLhuoDTZLfamesqRDSXJOeFHeKrRHg==
X-Google-Smtp-Source: ABdhPJxwychUBp7BMLdYUL82kp+mptFdWE+UV53HDXI5gl16psotS/xWZEIp+dXXpHXMaja/Y804pg==
X-Received: by 2002:a67:782:: with SMTP id 124mr1711372vsh.24.1636571265923;
 Wed, 10 Nov 2021 11:07:45 -0800 (PST)
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com.
 [209.85.222.52])
 by smtp.gmail.com with ESMTPSA id g187sm539782vsc.10.2021.11.10.11.07.45
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Nov 2021 11:07:45 -0800 (PST)
Received: by mail-ua1-f52.google.com with SMTP id b17so7067002uas.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 11:07:45 -0800 (PST)
X-Received: by 2002:a05:6102:2910:: with SMTP id
 cz16mr2351290vsb.9.1636571265036; 
 Wed, 10 Nov 2021 11:07:45 -0800 (PST)
MIME-Version: 1.0
References: <ef59d6fd3b2201b912d5eaa7f7a037d8f9adb744.1636561068.git.geert+renesas@glider.be>
 <ddcfa4b9-f7f4-04f5-89f2-b04c284e1945@prevas.dk>
In-Reply-To: <ddcfa4b9-f7f4-04f5-89f2-b04c284e1945@prevas.dk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Nov 2021 20:07:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_h9Tz8C-2SYyrS_G5BBbBNctqRA1mgKbhmYJxWzF-hg@mail.gmail.com>
Message-ID: <CAMuHMdX_h9Tz8C-2SYyrS_G5BBbBNctqRA1mgKbhmYJxWzF-hg@mail.gmail.com>
Subject: Re: [PATCH/RFC] of: Shrink struct of_device_id
To: Rasmus Villemoes <rasmus.villemoes@prevas.dk>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rasmus,

On Wed, Nov 10, 2021 at 5:51 PM Rasmus Villemoes
<rasmus.villemoes@prevas.dk> wrote:
> On 10/11/2021 17.23, Geert Uytterhoeven wrote:
> > Currently struct of_device_id is 196 (32-bit) or 200 (64-bit) bytes
> > large.  It contains fixed-size strings for a name, a type, and a
> > compatible value, but the first two are barely used.
> > OF device ID tables contain multiple entries, plus an empty sentinel
> > entry.
> >
> > Statistics for my current kernel source tree:
> >   - 4487 tables with 16836 entries (3367200 bytes)
> >   - 176 names (average 6.7 max 23 chars)
> >   - 66 types (average 5.1 max 21 chars)
> >   - 12192 compatible values (average 18.0 max 45 chars)
> > Taking into account the minimum needed size to store the strings, only
> > 6.9% of the allocated space is used...
> >
> > Reduce kernel size by reducing the sizes of the fixed strings by one
> > half.
>
> Tried something like this 2.5 years ago:
> https://lore.kernel.org/lkml/20190425203101.9403-1-linux@rasmusvillemoes.dk/

I wasn't aware of that.  I reworked some code which used multiple
of_find_compatible_node() calls before, and noticed the end result
had grown a lot due to the sheer size of of_device_id
("[PATCH] soc: renesas: Consolidate product register handling",
 https://lore.kernel.org/all/057721f46c7499de4133135488f0f3da7fb39265.1636570669.git.geert+renesas@glider.be).

> I think that there might be some not-in-tree code that relies on the
> existing layout. I considered adding a CONFIG_ knob, either for these
> sizes in particular, or more generally a def_bool y "CONFIG_LEGACY"
> which embedded folks that build the entire distro from source and don't
> have any legacy things can turn off, and then get more sensible defaults
> all around.

Most of that should have been gone since the #ifdef KERNEL was removed
from include/linux/mod_devicetable.h in commit 6543becf26fff612
("mod/file2alias: make modalias generation safe for cross compiling").
Of course you can never know for sure...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

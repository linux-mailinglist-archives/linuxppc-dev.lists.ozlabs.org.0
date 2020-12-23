Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8984F2E1B03
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 11:39:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D18pb3ssszDqWp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 21:39:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.51; helo=mail-oo1-f51.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com
 [209.85.161.51])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D18n270RQzDqRc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 21:38:11 +1100 (AEDT)
Received: by mail-oo1-f51.google.com with SMTP id k9so3601088oop.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 02:38:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KihTF5JbxFD42cY1wA7aOsNP35ZO1n0Na3DWL4feoYk=;
 b=mKTNl9VXCfUQhn+kdUcCTTL9xWgfJTul0TB26slvnpshIA0tGPi9eQTaxb6kr1sFWV
 5VXNCx26X0vXFWQKkzcPWeNWknK9STrxlqroW9/gfvJsnQH0zI3hhII0mF+YBX/Bqmin
 fSSk2MHHnTK5CJWE8aZnEqs0jA9RFoCQVoDbk/SebV3Pln93RcAksJr6C8JMwPcmxkQ/
 mvty2e6nvaxSUcoGBPtowi36M1ns0j0LJWnge5y3yX8Vml+B6OqzBKnyNfo0Egek/P8t
 Qor/Gg+rytJt95MdWi1/b49TdfhHsIDfzOdCvEnL3MpS+oEMulR4B92ht9+lKcLr6Fn4
 aTWA==
X-Gm-Message-State: AOAM533MKE3YVqxiwZKDX3I/2+8zw+T0qUtNpQAFHoRntq/6bILYyAZl
 ETH146rMX9v1H91RA4p5qrPYAwKnZ7YArA/iJ+Q=
X-Google-Smtp-Source: ABdhPJy9U98CPLOM9qWfCFZui6dO/PQYCRjI00tgXXUEHSfVAWiteZLCs+U7EpAO2soA/tWzSTNFmBBqnM2RmfJo+z4=
X-Received: by 2002:a4a:c191:: with SMTP id w17mr18070553oop.1.1608719888011; 
 Wed, 23 Dec 2020 02:38:08 -0800 (PST)
MIME-Version: 1.0
References: <20201222184510.19415-1-info@metux.net>
 <CAMuHMdVze3oaWmzvzn8ROjpP6h6Tsv2SFLiV7T1Cnej36X445g@mail.gmail.com>
 <2f1d53e9-0dbb-78ef-22d5-ab230438ddf0@metux.net>
In-Reply-To: <2f1d53e9-0dbb-78ef-22d5-ab230438ddf0@metux.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Dec 2020 11:37:56 +0100
Message-ID: <CAMuHMdXoHVPwqC_v6DL2MTi2j_tgnCqy9eiuLHvmZ9cB5scbQA@mail.gmail.com>
Subject: Re: [PATCH] arch: consolidate pm_power_off callback
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
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
Cc: Rich Felker <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 James Bottomley <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linux-csky@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jonas Bonn <jonas@southpole.se>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Stefano Stabellini <sstabellini@kernel.org>, linux-c6x-dev@linux-c6x.org,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "open list:QUALCOMM HEXAGON..." <linux-hexagon@vger.kernel.org>,
 Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>,
 Ley Foon Tan <ley.foon.tan@intel.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 arcml <linux-snps-arc@lists.infradead.org>,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Linux PM list <linux-pm@vger.kernel.org>, Mark Salter <msalter@redhat.com>,
 Aurelien Jacquiot <jacquiot.aurelien@gmail.com>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Openrisc <openrisc@lists.librecores.org>, Borislav Petkov <bp@alien8.de>,
 Stafford Horne <shorne@gmail.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Christian Brauner <christian@brauner.io>, Chris Zankel <chris@zankel.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Parisc List <linux-parisc@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>, "Enrico Weigelt,
 metux IT consult" <info@metux.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Enrico,

On Tue, Dec 22, 2020 at 9:15 PM Enrico Weigelt, metux IT consult
<lkml@metux.net> wrote:
> On 22.12.20 19:54, Geert Uytterhoeven wrote:
> > On Tue, Dec 22, 2020 at 7:46 PM Enrico Weigelt, metux IT consult
> > <info@metux.net> wrote:
> >> Move the pm_power_off callback into one global place and also add an
> >> function for conditionally calling it (when not NULL), in order to remove
> >> code duplication in all individual archs.
> >>
> >> Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
> >
> > Thanks for your patch!
> >
> >> --- a/arch/alpha/kernel/process.c
> >> +++ b/arch/alpha/kernel/process.c
> >> @@ -43,12 +43,6 @@
> >>  #include "proto.h"
> >>  #include "pci_impl.h"
> >>
> >> -/*
> >> - * Power off function, if any
> >> - */
> >> -void (*pm_power_off)(void) = machine_power_off;
> >
> > Assignments like these are lost in the conversion.
>
> Yes, but this doesn't seem to be ever called anyways. (in arch/alpha)
> And, BTW, letting it point to machine_power_off() doesn't make much
> sense, since it's the arch's machine_power_off() function, who're
> calling pm_power_off().
>
> Actually, we could remove pm_power_off completely from here, assuming
> nobody would *build* any drivers that register themselves into
> pm_power_off.
>
> If you feel better with it, I could post a patch that just removes
> pm_power_off from arch/alpha.

This is not limited to alpha, there are similar initializations on
m68k, openrisc,
and s390.
If none of these are called, they can be removed, but you should mention
that in the patch description.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

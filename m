Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A40D957BCED
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 19:41:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lp3054XbLz3dpx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jul 2022 03:41:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.169; helo=mail-oi1-f169.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lp2zb4TY2z3035
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jul 2022 03:40:42 +1000 (AEST)
Received: by mail-oi1-f169.google.com with SMTP id p132so11737122oif.9
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 10:40:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PmcZJKXW5L1h76Y7jDvbkfD3n85Nfb/cTZUz3jaZfpo=;
        b=mjacJ+7+hmDXrCFnCXmqfv526Ph+FBS1GM9CMkKb8P+cP/0vMVq7oiIRkeskyDVPhi
         ClqTCRb4Wse7V95UuIDcRIUz205Js02n121AvTmkmVseDfhX5lpEChyrbfPegNzejoeb
         I6Z9H1fctVs7EIn4DvOaoUVGDgne0FfWfKpfIatF4j4NaLhfid7B7YkOJ6an3sqmENip
         +R1HonXysxUtBh4GcR7iVI+iVthS57weriXASfy1GPiLrAJkxeYHqAuN/EAvT6TN43hd
         6gvXZr5YiH9F9b2D7cUWYsSBDJbc9Y4WdLWfm8g83H7emz3J9c/RVmWcfFTZrWVdQahU
         bRVw==
X-Gm-Message-State: AJIora/sM0CKkIac+mSlObEPkDaOOCGDD3PLQnUhEIYJ/4OYWLoTa905
	GjWN31+vpfGvHYHC6iqIwqVyWO69zEhS5w==
X-Google-Smtp-Source: AGRyM1tdMN4RaINNIPj4EaZsvBSvVsvkd9E1IGC8CtvYmw5JCMHl5tlp9krQzurG4pdRLQWw1AtniQ==
X-Received: by 2002:a05:6808:23cb:b0:339:f8b4:ecae with SMTP id bq11-20020a05680823cb00b00339f8b4ecaemr2811033oib.188.1658338839387;
        Wed, 20 Jul 2022 10:40:39 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id fo33-20020a0568709a2100b000f5d8d031b6sm9437382oab.49.2022.07.20.10.40.38
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 20 Jul 2022 10:40:38 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id g20-20020a9d6a14000000b0061c84e679f5so12010075otn.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 10:40:38 -0700 (PDT)
X-Received: by 2002:a5b:6c1:0:b0:669:a7c3:4c33 with SMTP id
 r1-20020a5b06c1000000b00669a7c34c33mr36151263ybq.543.1658338827759; Wed, 20
 Jul 2022 10:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220720131934.373932-1-shorne@gmail.com> <20220720131934.373932-3-shorne@gmail.com>
In-Reply-To: <20220720131934.373932-3-shorne@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 20 Jul 2022 19:40:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdX7_CSQd14tGPfL7R7V0h6AwNi7bVDCWhcdNoZV_md4bw@mail.gmail.com>
Message-ID: <CAMuHMdX7_CSQd14tGPfL7R7V0h6AwNi7bVDCWhcdNoZV_md4bw@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] PCI: Move isa_dma_bridge_buggy out of dma.h
To: Stafford Horne <shorne@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, Linux-sh list <linux-sh@vger.kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, linux-pci <linux-pci@vger.kernel.org>, ALSA Development Mailing List <alsa-devel@alsa-project.org>, Jaroslav Kysela <perex@perex.cz>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Greg Ungerer <gerg@linux-m68k.org>, linux-s390 <linux-s390@vger.kernel.org>, arcml <linux-snps-arc@lists.infradead.org>, Arnd Bergmann <arnd@arndb.de>, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, the arch/x86 maintainers <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <v
 gupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>, Ian Abbott <abbotti@mev.co.uk>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Takashi Iwai <tiwai@suse.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Linux ARM <linux-arm-kernel@lists.infradead.org>, Richard Henderson <rth@twiddle.net>, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Parisc List <linux-parisc@vger.kernel.org>, linux-m68k <linux-m68k@lists.linux-m68k.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, LKML <linux-kernel@vger.kernel.org>, H Hartley Sweeten <hsweeten@visionengravers.com>, Sven Schnelle <svens@linux.ibm.com>, alpha <linux-alpha@vger.kernel.or
 g>, Borislav Petkov <bp@alien8.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 20, 2022 at 3:20 PM Stafford Horne <shorne@gmail.com> wrote:
> During recent PCI cleanups we noticed that the isa_dma_bridge_buggy
> symbol supported by all architectures is actually only used for x86_32.
>
> This patch moves the symbol out of all architectures limiting usage to
> only x86_32.  This is possible because only x86_32 platforms or quirks
> existing in PCI devices supported on x86_32 ever set this.  A new global
> header linux/isa-dma.h is added to provide a common place to maintain
> the definition.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Suggested-by: Christoph Hellwig <hch@infradead.org>
> Signed-off-by: Stafford Horne <shorne@gmail.com>
> ---
> Since v3:
>  - New patch.

>  arch/m68k/include/asm/dma.h            |  6 ------

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D8F449946
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Nov 2021 17:12:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hnx3W2tvHz3cBQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Nov 2021 03:12:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.222.44; helo=mail-ua1-f44.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com
 [209.85.222.44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hnx351xjvz2yfm
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Nov 2021 03:12:31 +1100 (AEDT)
Received: by mail-ua1-f44.google.com with SMTP id e2so32502294uax.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 08:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hEQQmRj7LTpJogPgt2xRVOX7N+txus6iMmGepIZghfU=;
 b=nWXjwebhooMB7GmRBm1+NE3IJ0TJZ/8fcggp5ZYM7Id+fVJcrQn1nnqPJXKRYbbz9i
 l19iFWGB23tjJxNonCyF4hDFYUm2s8hh11fU+vh8gvc/ns4rUwMTC7FUxDQAZCORklf8
 GBjOTB/LbXFfsoiauKwapKqQ9uHXpjuKVE71P0WjEx2T5oGCN+FLOlEvVapcHSQpltLo
 Ulv25s9p4VlfHl8PqyhoOkNuEPbrz8hAzyRTw4IkKHeIbP9xX+00H14sFV+l+aXrwSRu
 +BI/g7b75fGJ83MXpNW4MZ7m3ITEW0y3d9+SjumBp96+2PfHvv9/YK3E5wM6yaGpoF1Y
 gyvQ==
X-Gm-Message-State: AOAM531dFs1s2IKXY1wP3/5PGEzbqrl5eR29l+0vy47nsY8n24/c9zYY
 Sx1qt0oX2/eNg3VBZhIRc2ORjJ8+yDVJuNcn
X-Google-Smtp-Source: ABdhPJwbOJYi2lTY2l7/VbJ47Lp3VoWL0I6D6XUGQgcL0beiBuXiZLGIRCBnU7VkDvCY2Vp6XpVF+Q==
X-Received: by 2002:a05:6102:94e:: with SMTP id
 a14mr76009328vsi.29.1636387948380; 
 Mon, 08 Nov 2021 08:12:28 -0800 (PST)
Received: from mail-vk1-f179.google.com (mail-vk1-f179.google.com.
 [209.85.221.179])
 by smtp.gmail.com with ESMTPSA id j15sm803259vsp.8.2021.11.08.08.12.27
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Nov 2021 08:12:27 -0800 (PST)
Received: by mail-vk1-f179.google.com with SMTP id e64so8514233vke.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Nov 2021 08:12:27 -0800 (PST)
X-Received: by 2002:a1f:f24f:: with SMTP id q76mr347755vkh.11.1636387947335;
 Mon, 08 Nov 2021 08:12:27 -0800 (PST)
MIME-Version: 1.0
References: <20211108101157.15189-1-bp@alien8.de>
 <20211108101157.15189-43-bp@alien8.de>
 <CAMuHMdWH+txiSP_d7Jc4f_bU8Lf9iWpT4E3o5o7BJr-YdA6-VA@mail.gmail.com>
 <YYkyUEqcsOwQMb1S@zn.tnic>
 <CAMuHMdXiBEQyEXJagSfpH44hxVA2t0sDH7B7YubLGHrb2MJLLA@mail.gmail.com>
 <YYlJQYLiIrhjwOmT@zn.tnic>
In-Reply-To: <YYlJQYLiIrhjwOmT@zn.tnic>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Nov 2021 17:12:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>
Message-ID: <CAMuHMdXHikGrmUzuq0WG5JRHUUE=5zsaVCTF+e4TiHpM5tc5kA@mail.gmail.com>
Subject: Re: [PATCH v0 42/42] notifier: Return an error when callback is
 already registered
To: Borislav Petkov <bp@alien8.de>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 the arch/x86 maintainers <x86@kernel.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, linux-iio@vger.kernel.org,
 "open list:REMOTE PROCESSOR \(REMOTEPROC\) SUBSYSTEM"
 <linux-remoteproc@vger.kernel.org>, linux-hyperv@vger.kernel.org,
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, Ayush Sawal <ayush.sawal@chelsio.com>,
 sparclinux <sparclinux@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-leds <linux-leds@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, scsi <linux-scsi@vger.kernel.org>,
 Rohit Maheshwari <rohitm@chelsio.com>, linux-staging@lists.linux.dev,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 openipmi-developer@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 "open list:TENSILICA XTENSA PORT \(xtensa\)" <linux-xtensa@linux-xtensa.org>,
 Arnd Bergmann <arnd@arndb.de>, Linux PM list <linux-pm@vger.kernel.org>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Vinay Kumar Yadav <vinay.yadav@chelsio.com>,
 linux-um <linux-um@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
 rcu@vger.kernel.org,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 linux-tegra <linux-tegra@vger.kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, intel-gvt-dev@lists.freedesktop.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-edac@vger.kernel.org,
 Parisc List <linux-parisc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 USB list <linux-usb@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 alpha <linux-alpha@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Borislav,

On Mon, Nov 8, 2021 at 4:59 PM Borislav Petkov <bp@alien8.de> wrote:
> On Mon, Nov 08, 2021 at 04:25:47PM +0100, Geert Uytterhoeven wrote:
> > I'm not against returning proper errors codes.  I'm against forcing
> > callers to check things that cannot fail and to add individual error
> > printing to each and every caller.
>
> If you're against checking things at the callers, then the registration
> function should be void. IOW, those APIs are not optimally designed atm.

Returning void is the other extreme ;-)

There are 3 levels (ignoring BUG_ON()/panic () inside the callee):
  1. Return void: no one can check success or failure,
  2. Return an error code: up to the caller to decide,
  3. Return a __must_check error code: every caller must check.

I'm in favor of 2, as there are several places where it cannot fail.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

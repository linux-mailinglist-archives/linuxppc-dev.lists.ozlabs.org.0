Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B5C51C598
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 11:03:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453BZ02jfRzDqBt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 19:03:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.217.66; helo=mail-vs1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453BXV1ltjzDqC9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 19:02:33 +1000 (AEST)
Received: by mail-vs1-f66.google.com with SMTP id y6so9842773vsb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 02:02:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2QqOosWQeAwRJoNs9Z6x1enYh3cBYDajQeKrzZRmqkc=;
 b=Q/pbXaFkEUQrs/d8tOUDgZBC/hG3KPVYjhXLcO261vC+B1cbu0n4WGyWv504vvDMRk
 hQCy5ZrRsZBGcvjE6BCbTNswEZyCP+9XsA+vBnk0xoPp/F+QFUmjJht088RtXFJjJEJB
 qtotrUh1g17c2o969m5tAWLF1bgtL+2TssD6zpIbp4PvPUcbOERsfWGz2vD7cAQrm3gi
 INhVCEZ8O0/OtkQ/x2PU9J4zlOk953uCyytmu9Ju4W946s9uue3PTmZV0Ie4wb4eorvt
 mzRf6RTYIP7aWwArmaYXcf08+lQVihrCdJxFbTq3lbQP2+ho0CnHEyc3ouGVRNeXtcx6
 6gLA==
X-Gm-Message-State: APjAAAWiJsH4MUHbe/h5IrOXGUz6nA3PoxqxYOWERodo0ZLXvucidCKn
 0mhzglkoN8HbDYtgN2C4i7t9QeHgCfo6f84hUac=
X-Google-Smtp-Source: APXvYqwi3qbyq7zdQc/EvX2OvsAWMtr+MgLv2h/XMFQWPJGUCYbXVG6LRayJYD+Q+PmXioY96F5KIcICjqmtTGPRtEc=
X-Received: by 2002:a67:7c93:: with SMTP id x141mr8531743vsc.96.1557824550758; 
 Tue, 14 May 2019 02:02:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190510081635.GA4533@jagdpanzerIV>
 <20190510084213.22149-1-pmladek@suse.com>
 <20190510122401.21a598f6@gandalf.local.home>
 <daf4dfd1-7f4f-8b92-6866-437c3a2be28b@c-s.fr>
 <096d6c9c17b3484484d9d9d3f3aa3a7c@AcuMS.aculab.com>
 <20190513091320.GK9224@smile.fi.intel.com>
 <20190513124220.wty2qbnz4wo52h3x@pathway.suse.cz>
 <20190514020730.GA651@jagdpanzerIV>
 <45348cf615fe40d383c1a25688d4a88f@AcuMS.aculab.com>
In-Reply-To: <45348cf615fe40d383c1a25688d4a88f@AcuMS.aculab.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 14 May 2019 11:02:17 +0200
Message-ID: <CAMuHMdXaMObq9h2Sb49PW1-HUysPeaWXB7wJmKFz=xLmSoUDZg@mail.gmail.com>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
To: David Laight <David.Laight@aculab.com>
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
Cc: Petr Mladek <pmladek@suse.com>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>, Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 14, 2019 at 10:29 AM David Laight <David.Laight@aculab.com> wrote:
> > And I like Steven's "(fault)" idea.
> > How about this:
> >
> >       if ptr < PAGE_SIZE              -> "(null)"
> >       if IS_ERR_VALUE(ptr)            -> "(fault)"
> >
> >       -ss
>
> Or:
>         if (ptr < PAGE_SIZE)
>                 return ptr ? "(null+)" : "(null)";
>         if IS_ERR_VALUE(ptr)
>                 return "(errno)"

Do we care about the value? "(-E%u)"?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

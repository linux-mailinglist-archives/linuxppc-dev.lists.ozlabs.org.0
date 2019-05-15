Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 687431E8F1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 09:24:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453mJv4RwCzDqQg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 17:24:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.222.68; helo=mail-ua1-f68.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ua1-f68.google.com (mail-ua1-f68.google.com
 [209.85.222.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453mHX46lpzDqP9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 17:23:20 +1000 (AEST)
Received: by mail-ua1-f68.google.com with SMTP id 79so339989uav.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 00:23:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=D6y3Txro2Y80xJMXPF/WXXyGFbfglpcuRYylKAaykOs=;
 b=nkLANUWE4Kdbrgc6T0t3YR8u+jIbze0XAhDlBboO14adEp0HtEsZ+aujakhnqfKbkG
 /gX63u+m965rhHW2WI0XmoarCbm+wLxI8W6RvP8zwlchdC10BV9iwVsCp43SKWbhpuB3
 6YwnZsvPLsX0rJ0PynJS/cB8v0lAgVQT3hvyy7KtP8Ef726wRMB5ik3Kqto1291+/oI7
 ZehOgZzB033jzNxJOBwG0H0GBr9rU119B8B9u0MHMP3z2PhlcJBKoKJ630cEP8LQApxI
 OsMOOQo5lWoSpQFgSD00k3f5Hwd0D1PtNcx6MU/4WzAMZ94CLTEPO6cCjkOwITaSBpCZ
 Njaw==
X-Gm-Message-State: APjAAAXeDUcJD8ZIJly7R9Zrj64CaJbBqlJ2x42vmDdY8yR9hRbz+pRU
 URCFdX59yEerRBRM6KlqfmPNrLHLpnXJ4QDN1sY=
X-Google-Smtp-Source: APXvYqwXjd7ZJQ8Ru9EPguJi1io4zPagRBwnSJVZX+f303p0r2QyE6ajAOtJrnYR8sRf8L5ySdKBcnfwbQtAINpBUKc=
X-Received: by 2002:ab0:6419:: with SMTP id x25mr19591138uao.86.1557904997683; 
 Wed, 15 May 2019 00:23:17 -0700 (PDT)
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
 <CAMuHMdXaMObq9h2Sb49PW1-HUysPeaWXB7wJmKFz=xLmSoUDZg@mail.gmail.com>
 <20190514143751.48e81e05@oasis.local.home>
 <CAMuHMdUhy3uB+G23uXh__F2Y_Jsam5uS1Q5jJC95kWAOEM8WRA@mail.gmail.com>
 <20190514153503.6b7faaa7@oasis.local.home>
In-Reply-To: <20190514153503.6b7faaa7@oasis.local.home>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 15 May 2019 09:23:05 +0200
Message-ID: <CAMuHMdUFEwxwQUWg0HNUiz75hP6S7TVGSx7fWXnsQ_3qsVfotQ@mail.gmail.com>
Subject: Re: [PATCH] vsprintf: Do not break early boot with probing addresses
To: Steven Rostedt <rostedt@goodmis.org>
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
 Michal Hocko <mhocko@suse.cz>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
 David Laight <David.Laight@aculab.com>, Stephen Rothwell <sfr@ozlabs.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin Schwidefsky <schwidefsky@de.ibm.com>, "Tobin C . Harding" <me@tobin.cc>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Steve,

On Tue, May 14, 2019 at 9:35 PM Steven Rostedt <rostedt@goodmis.org> wrote:
> On Tue, 14 May 2019 21:13:06 +0200
> Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > > > Do we care about the value? "(-E%u)"?
> > >
> > > That too could be confusing. What would (-E22) be considered by a user
> > > doing an sprintf() on some string. I know that would confuse me, or I
> > > would think that it was what the %pX displayed, and wonder why it
> > > displayed it that way. Whereas "(fault)" is quite obvious for any %p
> > > use case.
> >
> > I would immediately understand there's a missing IS_ERR() check in a
> > function that can return  -EINVAL, without having to add a new printk()
> > to find out what kind of bogus value has been received, and without
> > having to reboot, and trying to reproduce...
>
> I have to ask. Has there actually been a case that you used a %pX and
> it faulted, and you had to go back to find what the value of the
> failure was?

If it faulted, the bad pointer value is obvious from the backtrace.
If the code avoids the fault by verifying the pointer and returning
"(efault)" instead, the bad pointer value is lost.

Or am I missing something?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

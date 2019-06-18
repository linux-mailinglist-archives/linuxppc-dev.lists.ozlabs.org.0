Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BBF4A0F4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 14:38:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Sngm3C2PzDqdt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2019 22:38:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.167.66; helo=mail-lf1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45SnYy4qLxzDqTh
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 22:33:41 +1000 (AEST)
Received: by mail-lf1-f66.google.com with SMTP id r15so9118340lfm.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2019 05:33:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Uu5fsfeSKBLjAO6CcaXJptLAJKKL+GmQf7S6qdJonrA=;
 b=j+vJdT5c9nSFkcmC22WaaHm8+udg6Gx8gXrUeZE3HoK8OExP8FDvXgwjZO2B8oIk6U
 T5hucoq8gM7wOpykWC3wbz15RU/o8ABDfuDrvyDpt9f/dYTkZfyyQQ6MyESFR339zeGv
 ImlIEKv1q7MrW6vezgO3OrKa+2dNK5nfXqA6trd90WMDRb7nGH4z0E5qGgEzhdKQk7yz
 uKBJ3Ec1TsLcZrk84X3spJyseiRJTwWOCrGkoi2uD2mnqGUgZ9G3eo2x3JTZxnofrgPA
 pneeyOai/zy1p8yrb9P+Cg6iX2+kJr8JQNtrAmfKzRyNqbw7s7evvUppszN0skwSkPZ2
 wLew==
X-Gm-Message-State: APjAAAXQkgYbpVotf8jM22rXRchTjDIGmy/5Z5JBRtyFTh1/PCKuC0ge
 xDNUoQMOopuQReUXDNWmW/nBLXJx36p65BiXsLI=
X-Google-Smtp-Source: APXvYqy3CG/KMiJNVvQajIRjle46rTcfCVT6YO7+mcJZq39Lg6zJSQkAHqPqU9bU+uF/n6qUszu159aqvOeo8pX1hpE=
X-Received: by 2002:a19:6e41:: with SMTP id q1mr51131788lfk.20.1560861216107; 
 Tue, 18 Jun 2019 05:33:36 -0700 (PDT)
MIME-Version: 1.0
References: <20190617145204.6810-1-geert+renesas@glider.be>
 <87muifozfd.fsf@concordia.ellerman.id.au>
In-Reply-To: <87muifozfd.fsf@concordia.ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Jun 2019 14:33:23 +0200
Message-ID: <CAMuHMdUXcT_pNmfwjt5-eWoNJY4vKeH245k2sFFJG=JavUzc-w@mail.gmail.com>
Subject: Re: [PATCH] selftests/powerpc: Add missing newline at end of file
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

On Tue, Jun 18, 2019 at 2:23 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> Geert Uytterhoeven <geert+renesas@glider.be> writes:
> > "git diff" says:
> >
> >     \ No newline at end of file
> >
> > after modifying the file.
>
> Is that a problem?
>
> Just curious because it was presumably me that broke it :)

It looks messy ;-)

> > diff --git a/tools/testing/selftests/powerpc/mm/.gitignore b/tools/testing/selftests/powerpc/mm/.gitignore
> > index ba919308fe3052f3..16861ab840f57e90 100644
> > --- a/tools/testing/selftests/powerpc/mm/.gitignore
> > +++ b/tools/testing/selftests/powerpc/mm/.gitignore
> > @@ -3,4 +3,4 @@ subpage_prot
> >  tempfile
> >  prot_sao
> >  segv_errors
> > -wild_bctr
> > \ No newline at end of file
> > +wild_bctr

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

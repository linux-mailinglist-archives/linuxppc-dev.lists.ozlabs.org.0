Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 757855795C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 11:06:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnCcZ2xxtz3cjG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jul 2022 19:06:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.174; helo=mail-qt1-f174.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnCc33wg2z2xkn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 19:05:53 +1000 (AEST)
Received: by mail-qt1-f174.google.com with SMTP id r2so10578444qta.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 02:05:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4BTG+GIfVp80pynNmMgDJXtQXBY7HIBCNVIJqyKZSZY=;
        b=jshOKr91SRe8fC0wED+GXsi323nIxQBaGgvhlux9D4aNcViZWzFSYf01KJO1c6WHYh
         3Ex4Werr0SktUy2NO87OY+QSsc88StdLRNuXqxZ2ecCtXVspFent7aMhZJOmmMyBD0Wv
         2JHbDMXj0P57XtDwGE8/aX0dEa/c0n4a/tT8elY/YbSE1qMIl2mH21pIA91mb13KOsqv
         y8bseqZWQ4AaI8l5od5xZBQV/Fajm8janqk9f2LgohrLa4uOJaVzCKZk4anMLa3UsBFv
         OfNP2o2+nkhK7E1BtaFQO+WWSfT2kYF7EpC/wBhI/rGuFdDLVCvNA1drPsP3a5SA6Y8w
         5r2w==
X-Gm-Message-State: AJIora99J0DI5q2eg+tHMcDXrh3HWlyWJY2Cm3nlieydKrM35EV4MLSv
	fxabUzz7LRJqBIvvUjdXTVfcnsoDirXAwA==
X-Google-Smtp-Source: AGRyM1v9Ms7abpHV9fjOUxMhbtFLWcE31faes9Q6Rk2xjUwqH9QOGjt/Rq6CFoij7KOhGt9rni76Qw==
X-Received: by 2002:a05:622a:1391:b0:31e:f6b2:d3aa with SMTP id o17-20020a05622a139100b0031ef6b2d3aamr3905927qtk.523.1658221549892;
        Tue, 19 Jul 2022 02:05:49 -0700 (PDT)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id u7-20020a05620a430700b006af50b6f10csm13669628qko.61.2022.07.19.02.05.49
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 Jul 2022 02:05:49 -0700 (PDT)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-31d7db3e6e5so133662327b3.11
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jul 2022 02:05:49 -0700 (PDT)
X-Received: by 2002:a81:168f:0:b0:31e:6128:247d with SMTP id
 137-20020a81168f000000b0031e6128247dmr494511yww.383.1658221549285; Tue, 19
 Jul 2022 02:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220715054224.6583-1-wangborong@cdjrlc.com>
In-Reply-To: <20220715054224.6583-1-wangborong@cdjrlc.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2022 11:05:37 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVOF4PTEteRZr4OHYt5ZubUhXCdV=E85pyVr1h=avPkSg@mail.gmail.com>
Message-ID: <CAMuHMdVOF4PTEteRZr4OHYt5ZubUhXCdV=E85pyVr1h=avPkSg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/ps3: Fix comment typo
To: Jason Wang <wangborong@cdjrlc.com>
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
Cc: Geoff Levand <geoff@infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 18, 2022 at 3:48 PM Jason Wang <wangborong@cdjrlc.com> wrote:
> The double `when' is duplicated in line 1069, remove one.
>
> Signed-off-by: Jason Wang <wangborong@cdjrlc.com>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C66577838
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 22:39:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmH5D268Tz3c4G
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 06:39:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y2tgy3kJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com; envelope-from=sudipm.mukherjee@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y2tgy3kJ;
	dkim-atps=neutral
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmH4c2THMz305d
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 06:38:55 +1000 (AEST)
Received: by mail-yb1-xb2d.google.com with SMTP id l11so17748199ybu.13
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 13:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iiYSup99uwU5NOviKuuMKo7BhkLIiiIQ+0H1fe5hX1k=;
        b=Y2tgy3kJv7l7mn79jdIYcMmXZNJpLRhygh+ca6MPCH1qymdCA8+NrjuArg6Of6/hxP
         F6kb8+EEhQLJj9qBBUo2oJSBuufPnzt20uMKJylBWGxePp7pl7I4MA5OUi3PAqksXJPP
         xmFhRsTKCnwWfZJ2j17dGlfiSkQTyuW5lf0xUNky0IkcurbqP/bt1CEUTKGOli+3X+KG
         l0yOn079Sh9TFVlrULEmkHpz8UEXg7692CGY6tytlgaN6PAmdFf+YX3LKON2bUuciUMZ
         JD3Y2H72PE74P0Rc/3mLAsv+ySjCDhkaq1kl9TTgWBmAwZOZS3gW9sgSp61bH6aEu+H1
         tXHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iiYSup99uwU5NOviKuuMKo7BhkLIiiIQ+0H1fe5hX1k=;
        b=jRxhZtpGWX45c3sUo0GKmyVq3rfxOaQ8w1c016yR7KKWOhrJw2t8d6aUQtE42z+Rxm
         RveKztJihZnRcTAduqNqoN35Dbxsgh5KkmWKBkWlVjXHvbn28zgqRPkuvTxpINutI975
         +kI/pW8I8LNvRhU0kxJV+tJTh3EfbDsWDG2w89Zpwf3MRnYHXjcD3M9t4xil29LIAuZY
         xd76leQg1IVX+e9E08qQSemyedhJAS6hygDhwXDSPYwdMD6tfMyYZK3nmPYvV/yIwUrl
         iyOyAx4sQV3RtGfxgwZNwEfCGxO1IeJAk/vJ5QMGYJiONs1oWwOetEpeinT/fVvVCPbG
         VHVQ==
X-Gm-Message-State: AJIora8g+dbjSk1Ae5tqSkehuXjASZYAPHDyS1uYb/hjuTBmx5eKogIU
	0/UO/qNcrc5L8UaKeeDfGUpEH6wqCZh75snblUU=
X-Google-Smtp-Source: AGRyM1soBR/gucIFEFNRakwNssNATZ5/O9lI3lT9DpslecEmedxGh+4cL15CKNkF/Mk658qlDEcYXio+htFRg7jSobY=
X-Received: by 2002:a25:6b0f:0:b0:66e:cba3:8f2d with SMTP id
 g15-20020a256b0f000000b0066ecba38f2dmr23046365ybc.183.1658090333076; Sun, 17
 Jul 2022 13:38:53 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
 <CADVatmO1V8DiAgWMW9EFHwt+ghwfHhueigXh214tUa_=tVxiug@mail.gmail.com> <CAHk-=whjWyoognKy4QUUwf95L6qvPg7MGdp0CxqD2fpvZo7DLw@mail.gmail.com>
In-Reply-To: <CAHk-=whjWyoognKy4QUUwf95L6qvPg7MGdp0CxqD2fpvZo7DLw@mail.gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Date: Sun, 17 Jul 2022 21:38:17 +0100
Message-ID: <CADVatmMRC-T3vUfgzya1hYmGOme79kBu2hK2CxBU3+C5h1TAYA@mail.gmail.com>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
To: Linus Torvalds <torvalds@linux-foundation.org>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 17, 2022 at 9:29 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Sun, Jul 17, 2022 at 1:25 PM Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> >
> > And the generated assembly still has the memset for "struct prom_args".
>
> Strange. That smells like a compiler bug to me.

Both gcc-12 and clang gives this error.

>
> But I can't read powerpc assembly code - it's been too many years, and
> even back when I did read it I hated how the register "names" worked.
>
> Maybe it was never the args array, and it was about the other fields.
> Not that that makes any sense either, but it makes more sense than the
> compiler turning a series of volatile accesses into a memset.

I have also tried adding volatile to all the members of that struct.  :(


-- 
Regards
Sudip

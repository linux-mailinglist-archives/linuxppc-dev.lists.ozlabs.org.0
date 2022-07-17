Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE8D5776C6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 16:45:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lm7Dj3XNwz3cFJ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 00:45:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DS8vDfy5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::534; helo=mail-ed1-x534.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=DS8vDfy5;
	dkim-atps=neutral
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lm7D40FT9z2xn3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 00:44:49 +1000 (AEST)
Received: by mail-ed1-x534.google.com with SMTP id m13so2021196edc.5
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 07:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=HlrziZZ76Peg4qV5xEsTcKPFlstjpM1SL9BDNiXfu2c=;
        b=DS8vDfy5PisUHpo8QkxoxfYYXqiO9hj+fmk/WC8pM7VlVfPf4QI7fKq+8iWyFlBosN
         xOaKReN1tr6gKUlm2poGf/qYOY0t1sShwW+dhRV//mwtfmSuMpaD81F4Kwf9rs0vMp7F
         xavWty7gfUG6G+PTd+tLOjuyv7MUqoAAUViF4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=HlrziZZ76Peg4qV5xEsTcKPFlstjpM1SL9BDNiXfu2c=;
        b=S3BNgpZ4w/FnCoBn8SimEgtSbLKU4cn5wyl3evaS0/QHq66Pz19jAWA0xvv9g52VEe
         2+d1+dxxSed0uLMm/cEJ2i48/uWj6+D4UxUhG9jcH+HOKvbAApKnqJHnslwOmF70KiTt
         XikMedw9GmuLjvzluOtGjdNB/k15DpU9ZC+CZ1dFf+2R1+efUsFq4uVWDPFRjX5slvAn
         X5Vn5NalA/sG4V6Q+HpzOMNO4QJiLjzlccMEi5UEiVVDLi7LeD/6iCCaMH2SHDxJGNLV
         DcjX/Rz5IhHMkVm4yIZC/PB/NVC3mIEPqWlcBqFqKWlCbqlA6Q8fF/lUzH+Wk99Pr6rC
         6/dA==
X-Gm-Message-State: AJIora//k8io5OFR23Yb+CyNAMaY1xLYIWwVn/4EhV3aRHBunQRzH0ob
	2ijXSTFMYj6NQPQel6g2FxOH1FAWUHQjOvde
X-Google-Smtp-Source: AGRyM1sG4pfV4NrHljShpDJbNCsb8e+7Lkgx2Be4P5A4OR59KaY/znBS0UNngAuMkXKJBCAnu+Q4rQ==
X-Received: by 2002:aa7:df12:0:b0:43a:4991:1725 with SMTP id c18-20020aa7df12000000b0043a49911725mr32036663edy.55.1658069082050;
        Sun, 17 Jul 2022 07:44:42 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id i22-20020aa7c716000000b0043a64eee322sm4693810edq.28.2022.07.17.07.44.39
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 07:44:40 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id h17so13595358wrx.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 07:44:39 -0700 (PDT)
X-Received: by 2002:a05:6000:1f8c:b0:21d:7e98:51ba with SMTP id
 bw12-20020a0560001f8c00b0021d7e9851bamr18844596wrb.442.1658069078907; Sun, 17
 Jul 2022 07:44:38 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
In-Reply-To: <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 17 Jul 2022 07:44:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
Message-ID: <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
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

On Sun, Jul 17, 2022 at 2:13 AM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> I was trying to check it. With gcc-11 the assembly code generated is
> not using memset, but using __memset.
> But with gcc-12, I can see the assembly code is using memset. One
> example from the assembly:

You could try making the 'args' array in 'struct prom_args' be marked
'volatile'.

Ie something like this:

  --- a/arch/powerpc/kernel/prom_init.c
  +++ b/arch/powerpc/kernel/prom_init.c
  @@ -115,6 +115,6 @@ struct prom_args {
           __be32 service;
           __be32 nargs;
           __be32 nret;
  -          __be32 args[10];
  +        volatile __be32 args[10];
   };

because I think it's just the compilers turning the small loop over
those fields into a "memset()".

              Linus

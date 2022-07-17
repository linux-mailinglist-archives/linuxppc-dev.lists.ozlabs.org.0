Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 966E357783A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 22:57:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmHVJ48bHz3cdK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 06:57:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dZZ0/J3H;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::62b; helo=mail-ej1-x62b.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=dZZ0/J3H;
	dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmHTr5rcVz305d
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 06:57:18 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id oy13so18095424ejb.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 13:57:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=1ZqPRM2qcyTueyhf1A6Ua5dmBCzOfbjpMoyDTZFWtJk=;
        b=dZZ0/J3Hz/3sOD/J3s9/31I0vY717Zhr1SM61AC5OANF6c/cfnYp6xRqg7y679cXn5
         BLxGuF6o+L2w7BzW6F/YG74lJOnkvammDYV/T49wCqFk9duszqWdnIAuQbC1zx/SkC4N
         KdH5J6w0VRithPFum3wWbH58hx2nhU2bkmYp8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1ZqPRM2qcyTueyhf1A6Ua5dmBCzOfbjpMoyDTZFWtJk=;
        b=dZqTtZLlIBaeH+sXWfS+OCli7x9tsPIjoMSV+hhE3+i4D172OAVMF7HzrMWxmFgvVO
         6+iTjw/D9mJLfXQDfQdwCZTwM/Izcqh2x/q9e3QMx8XO9CACx8HOTomBg/mhxvu9YoKd
         4IWzSuBbzpHMvn/8FARsxKYY31CtIsZRQJrsdeurLmAP5unWqCIpHE1XTCEd1+Qri2CK
         9EmfLh7GZDaab5u9moLtnxuwcQKsIfaqWNmqrD5RZA8Dkc16W8QIR53V5CJZVB9f2xc3
         Kx0IhfjzOeQp2rNeZ3YF490E1o41X8LHDvBl8R5sZo9EH3tJ7sEgeV5rzp6ed+kP+jT2
         fj3g==
X-Gm-Message-State: AJIora8j2xQxR50oaV9E4ihJNZrOXLbsAvoZgL3NGmOF/a/XwQ0b2iRK
	liOJGtwwZVxL+1AP1kATeRomMOIJ32zfkPbAWSE=
X-Google-Smtp-Source: AGRyM1vfXeZ0QmCg3vfV9OsOPpJiCgUg1jB7ddjgC8deGpN+61tgo+1YEDaxVedURNMqHRrsuf7TGg==
X-Received: by 2002:a17:907:2cf3:b0:72b:8ac1:a21f with SMTP id hz19-20020a1709072cf300b0072b8ac1a21fmr23309579ejc.291.1658091434269;
        Sun, 17 Jul 2022 13:57:14 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id u7-20020a056402110700b0043a6c9e50f4sm7236455edv.29.2022.07.17.13.57.12
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 13:57:13 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id j1so10065934wrs.4
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 13:57:12 -0700 (PDT)
X-Received: by 2002:a05:6000:1a88:b0:21d:aa97:cb16 with SMTP id
 f8-20020a0560001a8800b0021daa97cb16mr20888588wry.97.1658091432023; Sun, 17
 Jul 2022 13:57:12 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
 <CADVatmO1V8DiAgWMW9EFHwt+ghwfHhueigXh214tUa_=tVxiug@mail.gmail.com>
 <CAHk-=whjWyoognKy4QUUwf95L6qvPg7MGdp0CxqD2fpvZo7DLw@mail.gmail.com> <CADVatmMRC-T3vUfgzya1hYmGOme79kBu2hK2CxBU3+C5h1TAYA@mail.gmail.com>
In-Reply-To: <CADVatmMRC-T3vUfgzya1hYmGOme79kBu2hK2CxBU3+C5h1TAYA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 17 Jul 2022 13:56:55 -0700
X-Gmail-Original-Message-ID: <CAHk-=whw31_Q_5-UR6AD4xpG5Q3LieMtr+99jP2oqwPhh-a_SA@mail.gmail.com>
Message-ID: <CAHk-=whw31_Q_5-UR6AD4xpG5Q3LieMtr+99jP2oqwPhh-a_SA@mail.gmail.com>
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

On Sun, Jul 17, 2022 at 1:38 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> I have also tried adding volatile to all the members of that struct.  :(

Can you read the code to figure otu what the memcpy is all about?

Or maybe there is something that disables 'volatile' with pre-processor hackery.

Because a compiler that turns a loop over volatile members into
'memset()' isn't a C compiler, it's just a random noise generator.
'volatile' is fundamental enough that I really doubt both gcc and
clang can be that broken.

I just tested this

        struct hello {
                volatile int array[100];
        };

        void test(void)
        {
                int i;
                struct hello hello;
                for (i = 0; i < 100; i++)
                        hello.array[i] = 0;
        }

on x86-64, and sure enough, gcc-12 turns turns it into a memset
without the volatile (in fact, the above will just be optimized away
entirely since it has no user), but with the volatile it's a proper
regular loop that does 32-byte accesses one by one (and in the proper
ascending oder). Something that memset() most definitely does not
guarantee:

.L2:
        movslq  %eax, %rdx
        addl    $1, %eax
        movl    $0, -120(%rsp,%rdx,4)
        cmpl    $100, %eax
        jne     .L2

and honestly, anything else sounds completely unacceptable.

So I suspect there is something wrong with your testing, because gcc
simply isn't that incredibly broken. Clang is interesting in that it
seems to unroll the loop five times, but it still does the proper
"write individual 32-bit entities in ascending order".

The other alternative is that it's something else than that 'struct
prom_args'. Again, I don't read powerpc asm good.

                  Linus

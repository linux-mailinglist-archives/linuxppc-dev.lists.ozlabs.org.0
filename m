Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27AA4577834
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 22:30:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmGtP03gSz3cCD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 06:30:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=aJ0ySncR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=aJ0ySncR;
	dkim-atps=neutral
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmGsm1rVpz3050
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 06:29:31 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id z23so18043004eju.8
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 13:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=a5n4kSbt+tDnJOmMOFdBXx2xa6DkOaFuSU52FmmeggU=;
        b=aJ0ySncRL5xwy3/WJRusOdK8nCOceATdsP/LrESQ+9olCuwbS7L0orcpD4kg4D4J+f
         KbkqgAwS/00KYAzWOUWUp64AdQklzywMgBC25bxwJEUp2t8R4RI5hI6drZwEdRnOVoxi
         fCWhU2soygB4BoKsZzC3n71dPyEKBWfwoYlmg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=a5n4kSbt+tDnJOmMOFdBXx2xa6DkOaFuSU52FmmeggU=;
        b=eqrqPDvA1SyhvJUDB00LApJ1OgRgae1moDJHR3Up9GGQp4v1s5B8SRbJW97aWbjHkQ
         GL2Y7ge55NyD8vclhHl14Gv5Hm6VjRaBV/yEMDCf9Jspjy+ixv6dROoRBc2S+ihfuXos
         jBNyUxBq7i58luaW+uEpFKlwwKnKJDMPhM0f1W60sccKKc2BGct+dpzLj5C2TnFo3IFt
         Em3YgPzWdv+6fRdkfApmhCxxv5s8TeUl+VAEk1bA4hbkjeQoGRgwUiOKEtuIf0k946LE
         Y/mRBs06+vIC5fAmtAOOkwkchA8iPvuH0L5CHWeu8OaTpt2Qbgy1UfHf5D8AShJYN6qU
         pxLQ==
X-Gm-Message-State: AJIora/zx+fddL4cWOxY3+Z3pPO3YUzS+jw2DU3Zh6WRGZneQj3tK/6M
	Mz8eGibcoGUADECKEJoNdzK91Krmkkm8rd3VDpc=
X-Google-Smtp-Source: AGRyM1sS9ZfrbnwPUvLUrCw78Z/BCZUPhp4g94Wk8uzVZOLDC3MduU3F0oiNJ0koPFAfNovNrMAAlQ==
X-Received: by 2002:a17:906:844c:b0:72b:4d77:fd83 with SMTP id e12-20020a170906844c00b0072b4d77fd83mr23270008ejy.151.1658089765113;
        Sun, 17 Jul 2022 13:29:25 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a10-20020a170906190a00b0072aa1313f5csm4663370eje.201.2022.07.17.13.29.24
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 13:29:24 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id bu1so14457308wrb.9
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 13:29:24 -0700 (PDT)
X-Received: by 2002:a5d:69c2:0:b0:21d:807c:a892 with SMTP id
 s2-20020a5d69c2000000b0021d807ca892mr20430637wrw.274.1658089764088; Sun, 17
 Jul 2022 13:29:24 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com> <CADVatmO1V8DiAgWMW9EFHwt+ghwfHhueigXh214tUa_=tVxiug@mail.gmail.com>
In-Reply-To: <CADVatmO1V8DiAgWMW9EFHwt+ghwfHhueigXh214tUa_=tVxiug@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 17 Jul 2022 13:29:07 -0700
X-Gmail-Original-Message-ID: <CAHk-=whjWyoognKy4QUUwf95L6qvPg7MGdp0CxqD2fpvZo7DLw@mail.gmail.com>
Message-ID: <CAHk-=whjWyoognKy4QUUwf95L6qvPg7MGdp0CxqD2fpvZo7DLw@mail.gmail.com>
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

On Sun, Jul 17, 2022 at 1:25 PM Sudip Mukherjee
<sudipm.mukherjee@gmail.com> wrote:
>
> And the generated assembly still has the memset for "struct prom_args".

Strange. That smells like a compiler bug to me.

But I can't read powerpc assembly code - it's been too many years, and
even back when I did read it I hated how the register "names" worked.

Maybe it was never the args array, and it was about the other fields.
Not that that makes any sense either, but it makes more sense than the
compiler turning a series of volatile accesses into a memset.

              Linus

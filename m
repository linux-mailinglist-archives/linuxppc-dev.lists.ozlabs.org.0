Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91A52577848
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Jul 2022 23:12:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmHqg2msrz3c3k
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 07:12:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fGm8hQQ8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=fGm8hQQ8;
	dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmHq421Bsz2xrY
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 07:12:14 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id r6so12968302edd.7
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 14:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UW6ne7NX/MQH2keCY1T28GqN5Odh8+bR3Y4JfckUjzw=;
        b=fGm8hQQ8eUxP06yf85F7pPFkaBx3O3yo1wK9DD4XbIeo2GtzbzmYzDExIju1C1a60R
         Dzv0oONPL/fyrzdC81wDNIz/pDLCzxAPalxwEibU19Ogw3dmD4kDZ0qJ6xELiZw4kP9D
         8KUm870xtTCqoYrYUBQZlFDq0IBMxvsinLQd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UW6ne7NX/MQH2keCY1T28GqN5Odh8+bR3Y4JfckUjzw=;
        b=Ze/ZWnhpo883vAmfIIFKAxd3da9Sl70hnCLkX3FTNnqcbzNORQhAIzOgLAzMwlKsSM
         LAulC8cFi1k8XtTtlO3gNhSR+HkVQE2tpbNq0eUT/uqhlgEJFqbNjq43VQfLE66/GuTu
         mprs8Vc2nWqe0X8Ol+1d0OzI1g0MBK2ChLDLE127BPZ4oaHL73oLC6wyp/bn0XyI6fpr
         capdB3wlJl6mVJxuD867R4mZpIP0Kbt2laVN/ZDEtzZVihxOHYn0nfGu0ITuI25wRZmS
         GlpC5f7XS2UAg0YNCh/c/sybAm76ZrZbZhxrvC4Pt+e/KXQyOK2vhR+pngkb4U4cRt/o
         Fv9w==
X-Gm-Message-State: AJIora8T72fyvK+xzlZF9ero+ChB33+B1+TNWsRGJAvr6GwCu2NfdyLy
	JX2teIxk+HOoJNj9AigfdF1KJg8tVnlACx1GFqk=
X-Google-Smtp-Source: AGRyM1tWHYi06IYX4jaMmeuUUldbl/sAdQwOtX2NOQbxdMpmUTLE8zrod29kRAg7/rLuQCcDj3rdIg==
X-Received: by 2002:aa7:c0c7:0:b0:43a:79b9:5cd1 with SMTP id j7-20020aa7c0c7000000b0043a79b95cd1mr32406246edp.282.1658092329958;
        Sun, 17 Jul 2022 14:12:09 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id ky8-20020a170907778800b0072f1d8e7301sm1914300ejc.66.2022.07.17.14.12.09
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 14:12:09 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id f2so14534718wrr.6
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 14:12:09 -0700 (PDT)
X-Received: by 2002:a5d:544b:0:b0:21d:70cb:b4a2 with SMTP id
 w11-20020a5d544b000000b0021d70cbb4a2mr20297261wrv.281.1658092328759; Sun, 17
 Jul 2022 14:12:08 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
 <CADVatmO1V8DiAgWMW9EFHwt+ghwfHhueigXh214tUa_=tVxiug@mail.gmail.com>
 <CAHk-=whjWyoognKy4QUUwf95L6qvPg7MGdp0CxqD2fpvZo7DLw@mail.gmail.com> <20220717205615.GC25951@gate.crashing.org>
In-Reply-To: <20220717205615.GC25951@gate.crashing.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 17 Jul 2022 14:11:52 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg-6b_=XQbwKqEwuAbQCOcXx7_mw78-GopQ5==_TuTPLQ@mail.gmail.com>
Message-ID: <CAHk-=wg-6b_=XQbwKqEwuAbQCOcXx7_mw78-GopQ5==_TuTPLQ@mail.gmail.com>
Subject: Re: mainline build failure of powerpc allmodconfig for prom_init_check
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: Kees Cook <keescook@chromium.org>, linux-kernel <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, linux-hardening@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jul 17, 2022 at 2:00 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> Calling mem* on a volatile object (or a struct containing one) is not
> valid.  I opened gcc.gnu.org/PR106335.

Well, that very quickly got marked as a duplicate of a decade-old bug.

So I guess we shouldn't expect this to be fixed any time soon.

That said, your test-case of copying the whole structure is very
different from the one in the kernel that works on them one structure
member at a time.

I can *kind of* see the logic that when you do a whole struct
assignment, it turns into a "memcpy" without regard for volatile
members. You're not actually accessing the volatile members in some
particular order, so the struct assignment arguably does not really
have an access ordering that needs to be preserved.

But the kernel code in question very much does access the members
individually, and so I think that the compiler quite unequivocally did
something horribly horribly bad by turning them into a memset.

So I don't think your test-case is really particularly good, and maybe
that's why that old bug has languished for over a decade - people
didn't realize just *how* incredibly broken it was.

             Linus

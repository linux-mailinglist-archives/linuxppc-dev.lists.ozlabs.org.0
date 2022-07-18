Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176757794E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 03:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmPlz123Pz3cC4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 11:39:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=f5lTMFAF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=f5lTMFAF;
	dkim-atps=neutral
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmPlK1d4rz3bcv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 11:39:22 +1000 (AEST)
Received: by mail-ej1-x634.google.com with SMTP id va17so18812408ejb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 18:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=S/uRnOSKXyMWXM6+egeORsxqIKlGjg8aotruYwUMQgQ=;
        b=f5lTMFAF9RgIRQCSACSOIOb6q62I+EN6h5/4yHht7d4KaQAPe6bswqW9WMWrHQGVkU
         t+MSmD2LZgUzfWUj/wRsQ3Q5bOlPSG7+EuHqu9plMDF8YmyFNJsl9cp/5Hijy6a55Auk
         ZF1pR/Ej+pYtQjpkLKl8KKH/AvqFf69lZyZwE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=S/uRnOSKXyMWXM6+egeORsxqIKlGjg8aotruYwUMQgQ=;
        b=O/qcJtidcs3e/t8JC264OzEVECJNy8L2TYQwK3ewyQe4+wgymQdhATvRlSUwYtbOlW
         TXUPuMUuJgp6Zt5PeBzP3fiTkdQLawjOwGoBuCl6Qr44L2EjoloJUSNMPIG9uMqAMksZ
         GaDDEpTA6SFbWtqFkL8iXCc+O3OUNv0MXL7nqa+3bifChrtaH7IEeaNliBBKmcgaeSj/
         /P7SO7IxMNRTWqQmDYFFOqdZCCo8U5cX1IyOQsPfkskd1C7r6sv54iRLOP4NIKqtNyzW
         szPooy0TI1jQX65LuaiN/A8D6solcvbrvtyznvPNqUP+14At2gxg1VCY3423jHXSdyWq
         XooQ==
X-Gm-Message-State: AJIora8XzCVy8z8miZ1FOFjkd2uPCZ9TOSvGlOOLTAWFGY0fA1gV2KuR
	Z38SMSvKQtJFZ9V2p/RUc7Fz9S6hmlrHo9UeDR0=
X-Google-Smtp-Source: AGRyM1vSutp6QMoiAof/sDKdrtdwz6/fI84mh0n4WpP4Vy732X/mSlLS+Nsj3tuEyBXUh1LCKOffVQ==
X-Received: by 2002:a17:907:6295:b0:703:92b8:e113 with SMTP id nd21-20020a170907629500b0070392b8e113mr24027801ejc.594.1658108355997;
        Sun, 17 Jul 2022 18:39:15 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id 17-20020a170906311100b0072b7d76211dsm1947436ejx.107.2022.07.17.18.39.13
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 18:39:14 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id c18so1366294wmh.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Jul 2022 18:39:13 -0700 (PDT)
X-Received: by 2002:a05:600c:34c9:b0:3a0:5072:9abe with SMTP id
 d9-20020a05600c34c900b003a050729abemr23937555wmq.8.1658108352995; Sun, 17 Jul
 2022 18:39:12 -0700 (PDT)
MIME-Version: 1.0
References: <Ys/aDKZNhhsENH9S@debian> <CADVatmO9XzFnX+N0TuOtr0FYyxKr1oe5RAhCEJjmnvjteT5QNw@mail.gmail.com>
 <CAHk-=whc3Uvhrmrr27xp5=oOhSDjXc5s1ZxC3B7xMYV6oj4WRQ@mail.gmail.com>
 <CADVatmO1V8DiAgWMW9EFHwt+ghwfHhueigXh214tUa_=tVxiug@mail.gmail.com>
 <CAHk-=whjWyoognKy4QUUwf95L6qvPg7MGdp0CxqD2fpvZo7DLw@mail.gmail.com>
 <20220717205615.GC25951@gate.crashing.org> <CAHk-=wg-6b_=XQbwKqEwuAbQCOcXx7_mw78-GopQ5==_TuTPLQ@mail.gmail.com>
 <20220717214508.GD25951@gate.crashing.org>
In-Reply-To: <20220717214508.GD25951@gate.crashing.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 17 Jul 2022 18:38:56 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg1LeRWPmA-2pit+aH0LKZoBbhnGzmwWrPz6bbchMkCzw@mail.gmail.com>
Message-ID: <CAHk-=wg1LeRWPmA-2pit+aH0LKZoBbhnGzmwWrPz6bbchMkCzw@mail.gmail.com>
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

On Sun, Jul 17, 2022 at 2:49 PM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> > I can *kind of* see the logic that when you do a whole struct
> > assignment, it turns into a "memcpy" without regard for volatile
> > members. You're not actually accessing the volatile members in some
> > particular order, so the struct assignment arguably does not really
> > have an access ordering that needs to be preserved.
>
> The order is not defined, correct.  But a "volatile int" can only be
> accessed as an int, and an external memcpy will typically use different
> size accesses, and can even access some fields more than once (or
> partially); all not okay for a volatile object.

That is not actually a valid or realistic argument in the general case.

The thing is, an operation on an aggregate type in C is fundamentally
different from the "do the same operation on the individual parts of
the struct".

Just to make a very concrete example of that, it's not at all
unreasonable to have a struct like this:

    struct io_accessor {
        union {
            volatile unsigned char byte[8];
            volatile unsigned short word[4];
        ...

and while that wasn't the example here, it's not completely insane as
a concept to use as a helper type so that you can do volatile accesses
of different sizes.

And while you'd be right to say that "assigning that kind of struct is
probably insane", and I wouldn't argue against it, I also think that
basically *any* union member is basically an argument that a structure
assignment is *NOT* about "assign all the individual members", and
never really can be.

In the above union, make one union member be a non-volatile type, and
suddenly it actually *can* be ok to copy the struct. Even though it
also has volatile bytes.

So once you start doing structure assignments but argue about
individual fields being volatile, I think you're on very shaky ground.

And I think "memcpy" is a reasonable way to say "we don't care - and
in the general case we CANNOT know - what the individual members are,
so we'll just copy it as one thing".

So the compiler emitting a "memcpy()" to assign a structure sounds
fine. Even in theory. Because the "but individual fields.." argument
just cannot work in general.

In contrast, when you access the members individually (like the kernel
does in this powerpc case), there is no such ambiguity.

There is no way in hell that it is ever ok to do a "memcpy()" when the
user has done the assignments one volatile member at a time.

So that's why I don't think your test-case with the struct assignment
is very good. I think it's very reasonable for a compiler person to
say "you assigned the whole struct, you get what you asked for, you
get a memcpy".

But when you do a loop that assigns individual volatile fields? No
such problem. Completely unambiguous that you need to do them one at a
time as individual accesses.

                Linus

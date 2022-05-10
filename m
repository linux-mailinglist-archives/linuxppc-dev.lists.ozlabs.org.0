Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E685213F2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 13:37:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KyGGh27X1z3cDx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 21:37:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=VoJKpqMf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d30;
 helo=mail-io1-xd30.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=VoJKpqMf; dkim-atps=neutral
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KyGG26kqvz30Dp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 21:36:26 +1000 (AEST)
Received: by mail-io1-xd30.google.com with SMTP id z18so18196685iob.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=4EZpR3qbj2OiB8Rs7HNB/ykkYoIogT5opUzlrLNV8YI=;
 b=VoJKpqMfxxTPHvVta4VrHB92nXtrqsdoFMCKO72GGQiiTNlssKn+AXRFv2R0zA/qJl
 ctxf5yvCTzchX0hBX89nV/pbn8AMQXcZyobufzGfOBQSZx6nhMaYwA+R8ZttLsdM8Xl+
 rpydufKYD/6bVeUkxjjhLcjOQR0qGg0c2UaMnbMITS+RV4LBbE8poluGb/ji6ozV4ggX
 2ZOwstsWV1YYyBdttQncwLva3BWyKTcGbQP+6PrGtjhkepSKztq/WSV1uGa3OR1zPmHp
 fWEbAq+8c6Bu4dtUV2ivF9jPrKCiNZQT0HzmRt0DR1EBUHs6Rmtmvgahn+B8mMcFvjaB
 CbRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=4EZpR3qbj2OiB8Rs7HNB/ykkYoIogT5opUzlrLNV8YI=;
 b=4lDEc3LxTrq+YGG0lRXPucECT3iRpW7kP7TMyQn/xYDobWnsJhjj3ckvexbe7qV8mp
 YV43EBcchCfSWYWBtlZW28p0bQyYPV0HFbiBMauaGvYd4/HjqXy9bGuqcKZxsfVHZ+T4
 bnX8iWyPRzWH6YHOATm9l1jWqKy+DAStuwgBfNrlwK+BN+XkLQw/aP8+3mGGro6DoGUY
 EUgsKh/R8jcGRVFIJPa5WzVRJnJpDbcP7hn6QYkCSTLTXt+uAhxU0mVd0AKhaLS9JlvD
 V13+v3aVTBm6ua6lDbDzlKa3ifGLmYoBClZP83ArM7YpZ6yRqR7q8K+F82K96kb5lAuy
 PBCg==
X-Gm-Message-State: AOAM533BOVjdw2dXzMkJnbCRXxBtlnOmP/jSe28LdimR8MYN2MCnC5Ak
 oIJUwItsR6JX3sd+4vButfJJRRFECVGPRPaKj2E=
X-Google-Smtp-Source: ABdhPJxse48OZESZFthVDv8nUynrMkvM0JCiuRjG7/tN4zNaiseDCEGjt9o4QzkyV4Z20WHbORCpQublLG3V37jZ2Dg=
X-Received: by 2002:a02:8624:0:b0:32b:397d:eeb1 with SMTP id
 e33-20020a028624000000b0032b397deeb1mr9940559jai.264.1652182582955; Tue, 10
 May 2022 04:36:22 -0700 (PDT)
MIME-Version: 1.0
References: <20220507052451.12890-1-ojeda@kernel.org>
 <CABVgOSm5S2=QYnHJ+B0JbYtFYKBDRZiOhE5YMKKUKZU56d17HQ@mail.gmail.com>
 <CANiq72=0ft6+QLbdwWD6cLm4FhWfv53GSg6HKEwxQ-q2N-UkOw@mail.gmail.com>
 <CABVgOSkrvfvA7Ay4GC5wg64S1gibvm5_U5VGBog3sw4_UFo8Cg@mail.gmail.com>
In-Reply-To: <CABVgOSkrvfvA7Ay4GC5wg64S1gibvm5_U5VGBog3sw4_UFo8Cg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 May 2022 13:36:11 +0200
Message-ID: <CANiq72mcvKDW6qO=1PzYR_U0tAwVLyCWFZjFVLL81znWDSYq7A@mail.gmail.com>
Subject: Re: [PATCH v6 00/23] Rust support
To: David Gow <davidgow@google.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi David,

On Tue, May 10, 2022 at 6:45 AM David Gow <davidgow@google.com> wrote:
>
> I've just sent out a pull request to get this working under UML as
> well, which would simplify running these further:
> https://github.com/Rust-for-Linux/linux/pull/766

Thanks a lot!

> Yeah, these are all fair points: particularly for small doctests.
>
> Maybe having an optional name, which more significant tests could use
> to override the file:line names? That could be useful for a few of the
> larger, more often referenced tests.

Sounds reasonable. I can add support for that.

> Ugh: it's a bit ugly either way. I suspect that file:line is still
> probably better, if only because we need some way of looking up the
> test in the code if it fails. I'd hate for people to be randomly
> hashing bits of just to find out what test is failing.

One redeeming quality is that the assertion prints the line/file
number in the generated file, so it would still be possible to check
where it came from:

    [13:13:43] # rust_kernel_doctest_str_rs_somehash: ASSERTION FAILED
at rust/doctests_kernel_generated.rs:2209
    [13:13:43] Expected 2 > 3 to be true, but is false
    [13:13:43] not ok 43 - rust_kernel_doctest_str_rs_somehash
    [13:13:43] [FAILED] rust_kernel_doctest_str_rs_somehash

Another alternative is to keep the file:line information around
without embedding it into the test name, e.g. in a TAP comment or a
mapping file (which `kunit.py` could read).

But, yeah, before doing hashes or things like that, I would just go
for simplicity and keep things as they are unless some use case really
needs doctests to be stable.

> Oops: I missed that (one of the issues with testing this on a
> different machine which had a rust toolchain). Looks good to me.
>
> Ah: I didn't realise the plan was always to have crate-specific
> suites, and possibly to split things up.
>
> The KTAP output specification does actually support arbitrary nesting
> (though KUnit itself doesn't at the moment), which would potentially
> be an option if (e.g.) providing the complete module nesting made
> sense. I'm not convinced that'd make things easier to read, though.

That is useful to know in case we need it, thanks!

Cheers,
Miguel

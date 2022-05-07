Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 649AB51E7F9
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 17:04:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwW1Q1lSdz3cGj
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 01:04:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Goshd/Lu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d32;
 helo=mail-io1-xd32.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Goshd/Lu; dkim-atps=neutral
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwW0j66lfz3byS
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 May 2022 01:03:47 +1000 (AEST)
Received: by mail-io1-xd32.google.com with SMTP id c125so10948095iof.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 May 2022 08:03:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CnjdUOz3duiKD1Uau0ijtSb5UBL+OJmQOYvavWmoZQ0=;
 b=Goshd/Luda+YskWKjL4mFxR2CewMKg4Ngp0zTFvr681Uze/6UoYKLSsCuvwyykKdoV
 eJgShn/IfVaDwDxxqtuVaiypmwMCNkgs3U7eD/IHcA+NTKJnwNJDfV75hCAxJn6fhlbn
 65xdlhRV1o+T88gQd3VVfV6lPkB4h/kQdWVILeyrrRGThVgkiWqwoup9fFr2v39EUzxX
 2bCMEg8qAMivg4zNvG6un1RFKMTRIwY+K2H9Et54yjnONGwjlXCMIgrhaWsbrSHJ3CbF
 dLPxj2t56sOAmQTcpErCwm8om2QTvopW9vHpR2ZQYiHU3j7DhQkX5H4ADEhJCh74VYJo
 UmfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CnjdUOz3duiKD1Uau0ijtSb5UBL+OJmQOYvavWmoZQ0=;
 b=2YZSCNymhLvO/mO/S7PxlrW3LVzLZXt8Ki88DpWocbvqezai/sQFZtJajlKUZ68uzd
 Ir7Nw/9eTtnPwzGo9op+nbcfBbw7VNbbKW/1D9Ye8T8t4fihAmO02J5M43oKfH8+/iCA
 /wlB6G32iJgm2I14sFDCJzrHbRMjTSxC6/SkCoo18FyjZSVZ0zj/kKHFk0QyFDHZcOv7
 4A/7z/1ae3dLlvwD92mm+PyglWvSzk3pSEctHEc14zYIve5pXx2dXZah2W1O5kecfcDP
 yHQMKeRKMSn35KSAdnQ5StqbupQYvXJ+CN42HhYKng/UzkusgU2wtWgUSmUmMcjWDT2t
 z1iA==
X-Gm-Message-State: AOAM5315bxw+W6C4kG9+qkAX2r3MKr7cmD/ZI+EzKFVzunq8Cgiy6tnl
 neXzh54M2YjkEIKwMllt6mpzuWiV+R7ArQQ/Axk=
X-Google-Smtp-Source: ABdhPJyqVxv4uPynhji9t5jG0pJBv2D9XRWPEuRPww2y6vJC30NvmsubB9I6YkkamF8cCOWGkn9Xe0Ihs9a1gxmTp/4=
X-Received: by 2002:a05:6602:2d90:b0:63d:b41e:e4e4 with SMTP id
 k16-20020a0566022d9000b0063db41ee4e4mr3321613iow.172.1651935822769; Sat, 07
 May 2022 08:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220507052451.12890-1-ojeda@kernel.org>
 <CABVgOSm5S2=QYnHJ+B0JbYtFYKBDRZiOhE5YMKKUKZU56d17HQ@mail.gmail.com>
In-Reply-To: <CABVgOSm5S2=QYnHJ+B0JbYtFYKBDRZiOhE5YMKKUKZU56d17HQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 7 May 2022 17:03:31 +0200
Message-ID: <CANiq72=0ft6+QLbdwWD6cLm4FhWfv53GSg6HKEwxQ-q2N-UkOw@mail.gmail.com>
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

On Sat, May 7, 2022 at 11:29 AM David Gow <davidgow@google.com> wrote:
>
> It's great to see some KUnit support here!

Thanks!

> It's also possible to run these tests using the KUnit wrapper tool with:
> $ ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=y
> --make_options LLVM=1 --arch x86_64 'rust_kernel_doctests'
>
> That also nicely formats the results.

Indeed!

    [16:55:52] ============ rust_kernel_doctests (70 subtests) ============
    [16:55:52] [PASSED] rust_kernel_doctest_build_assert_rs_12_0
    [16:55:52] [PASSED] rust_kernel_doctest_build_assert_rs_55_0
    ...
    [16:55:52] [PASSED] rust_kernel_doctest_types_rs_445_0
    [16:55:52] [PASSED] rust_kernel_doctest_types_rs_509_0
    [16:55:52] ============== [PASSED] rust_kernel_doctests ===============
    [16:55:52] ============================================================
    [16:55:52] Testing complete. Passed: 70, Failed: 0, Crashed: 0,
    Skipped: 0, Errors: 0

> That all being said, I can't say I'm thrilled with the test names
> here: none of them are particularly descriptive, and they'll probably
> not be static (which would make it difficult to track results /
> regressions / etc between kernel versions). Neither of those are

Yeah, the names are not great and would change from time to time
across kernel versions.

We could ask example writers to give each example a name, but that
would make them fairly less convenient. For instance, sometimes they
may be very small snippets interleaved with docs' prose (where giving
a name may feel a bit of a burden, and people may end writing
`foo_example1`, `foo_example2` etc. for each small "step" of an
explanation). In other cases they may be very long, testing a wide API
surface (e.g. when describing a module or type), where it is also hard
to give non-generic names like `rbtree_doctest`. In those kind of
cases, I think we would end up with not much better names than
automatically generated ones.

The other aspect is that, given they are part of the documentation,
the prose or how things are explained/split may change, thus the
doctests as well. For instance, one may need to split a very long
`rbtree_doctest` in pieces, and then the name would need to change
anyway.

So I think we should avoid asking documentation writers to add a
manual name, even if that means a bit ugly test names. Also this way
they are consistently named. What do you think?

One idea could be giving them a name based on the hash of the content
and avoiding the line number, so that there is a higher chance for the
name to stay the same even when the file gets modified for other
reasons.

> necessarily deal breakers, though it might make sense to hide them
> behind a kernel option (like all other KUnit tests) so that they can
> easily be excluded where they would otherwise clutter up results. (And

Currently they are under `CONFIG_RUST_KERNEL_KUNIT_TEST` -- or do you
mean something else?

> if there's a way to properly name them, or maybe even split them into
> per-file or per-module suites, that would make them a bit easier to
> deal.) Additionally, there are some plans to taint the kernel[1] when

Yeah, splitting them further is definitely possible. We are also
likely splitting the `kernel` crate into several, which would also
make the suites smaller etc. so perhaps further splits may not be
needed.

> Regardless, this is very neat, and I'm looking forward to taking a
> closer look at it.

Thanks again for taking a look and playing with it, I am glad you
liked it! (even if it is just a first approximation, and only supports
the `kernel` crate, etc.).

Cheers,
Miguel

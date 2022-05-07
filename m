Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9069751E615
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 11:29:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwMbP3jZJz3cBj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 19:29:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pEJT+rz+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=davidgow@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=pEJT+rz+; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwMZl5BLlz3byl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 19:29:18 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id x18so13057253wrc.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 May 2022 02:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O46NG4I/Ehd11dycpk2RjsN/cJ86swAD+6NyN8Wu3oM=;
 b=pEJT+rz+VfSx+i3BXIXcXBka/5Yg7AcIDPJqzI64zSkN1WUpTztaU5kum35UgrsfF9
 DzOjJPlOXIfoUzWT5jSe26grmDrcE5y4YRZ4YR+l+KCgM4xNILwg4UsizkKWsczzl+De
 nX6pK3uT0jQrV4KFZSgHFgFeD2qqS/Q51S4GZiQOJ4lfG8T7AE63PEcYjY2oxMoY9aqJ
 KPWdvUwiryRluS9vjmaRgu1H83GjAAQS1C7TsJMRlMrMgQMCmzL3mmrDMbW3OJyOj5Y9
 EQP9LAp0ElcPFJCYbA8qRiTa5YvhVwVsbiztmAuOvi5ZjZGIAm5UQjWZ/T6CG7ioVXxa
 fe5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O46NG4I/Ehd11dycpk2RjsN/cJ86swAD+6NyN8Wu3oM=;
 b=UAgv6/4a8tpdvDcIqveQzuFpXSO1Fy/1y9rv+qZ73vMDuegoJl5SjhZGS56X+2zapg
 oTAt5sBbVwatuCAJjbOYBGuVX8hbAZ5EDMUkNBZQg2iKfLlGn6PjHc1FIpgJ13OI2/Hr
 eyR2C9b0mL7hHmaWDmbdQCSCFvjcE0yzePFXu2UKyxKM7rhJw3ururcvLuzXmEryyqV5
 hic1ZB3plI3Q24MGb74F1cBhE7L/ubQWo5FYf2d0k605xuzf3yCjgfgtGF6ZvNPV7hFd
 SrRMitvMyDKmD0YkgmAq+mJrvmwmxXJYbXhyCoFyOSJvwivvtZ/IoRJ4KPu8XhKp61KM
 GWOg==
X-Gm-Message-State: AOAM531qA+vlXMiqp/evZUfg6ky8fKz2rpupN21Mo7Oy3ysEIVY+gLOr
 AYZNzeN0D3DnqlLTN9nnLjKrx0SQhJ51kxSZ8DMwvw==
X-Google-Smtp-Source: ABdhPJwmX5iwSt0ucutb+u1FHWUawG0af5FN3nvZMbahKeV3F7Ce0O0VSgqTSlIoIeUQl+Jhb3u7MOWpzqebYk3FohA=
X-Received: by 2002:a5d:4307:0:b0:207:9f82:e238 with SMTP id
 h7-20020a5d4307000000b002079f82e238mr6283084wrq.430.1651915754752; Sat, 07
 May 2022 02:29:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220507052451.12890-1-ojeda@kernel.org>
In-Reply-To: <20220507052451.12890-1-ojeda@kernel.org>
From: David Gow <davidgow@google.com>
Date: Sat, 7 May 2022 17:29:03 +0800
Message-ID: <CABVgOSm5S2=QYnHJ+B0JbYtFYKBDRZiOhE5YMKKUKZU56d17HQ@mail.gmail.com>
Subject: Re: [PATCH v6 00/23] Rust support
To: Miguel Ojeda <ojeda@kernel.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, rust-for-linux@vger.kernel.org,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 live-patching@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 7, 2022 at 1:25 PM Miguel Ojeda <ojeda@kernel.org> wrote:
>
> Rust support
>

<...>

>   - Support running documentation tests in-kernel, based on KUnit.
>
>     Rust documentation tests are typically examples of usage of any
>     item (e.g. function, struct, module...). They are very convenient
>     because they are just written alongside the documentation, e.g.:
>
>         /// Sums two numbers.
>         ///
>         /// # Examples
>         ///
>         /// ```
>         /// assert_eq!(mymod::f(10, 20), 30);
>         /// ```
>         pub fn f(a: i32, b: i32) -> i32 {
>             a + b
>         }
>
>     So far, we were compiling and running them in the host as any
>     other Rust documentation test. However, that meant we could not
>     run tests that used kernel APIs (though we were compile-testing
>     them, which was already useful to keep the documentation in sync
>     with the code).
>
>     Now, the documentation tests for the `kernel` crate are
>     transformed into a KUnit test suite during compilation and run
>     within the kernel at boot time, if enabled. This means now we can
>     run the tests that use kernel APIs.
>
>     They look like this (their name is generated by `rustdoc`, based
>     on the file and line):
>
>         [    0.581961] TAP version 14
>         [    0.582092] 1..1
>         [    0.582267]     # Subtest: rust_kernel_doctests
>         [    0.582358]     1..70
>         [    0.583626]     ok 1 - rust_kernel_doctest_build_assert_rs_12_0
>         [    0.584579]     ok 2 - rust_kernel_doctest_build_assert_rs_55_0
>         [    0.587357]     ok 3 - rust_kernel_doctest_device_rs_361_0
>         [    0.588037]     ok 4 - rust_kernel_doctest_device_rs_386_0
>
>         ...
>
>         [    0.659249]     ok 69 - rust_kernel_doctest_types_rs_445_0
>         [    0.660451]     ok 70 - rust_kernel_doctest_types_rs_509_0
>         [    0.660680] # rust_kernel_doctests: pass:70 fail:0 skip:0 total:70
>         [    0.660894] # Totals: pass:70 fail:0 skip:0 total:70
>         [    0.661135] ok 1 - rust_kernel_doctests
>
>     There are other benefits from this, such as being able to remove
>     unneeded wrapper functions (that were used to avoid running
>     some tests) as well as ensuring test code would actually compile
>     within the kernel (e.g. `alloc` used different `cfg`s).

It's great to see some KUnit support here!

It's also possible to run these tests using the KUnit wrapper tool with:
$ ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=y
--make_options LLVM=1 --arch x86_64 'rust_kernel_doctests'

That also nicely formats the results.

(It obviously doesn't run under UML yet, though I did get it to work
after indiscriminately hacking out everything that wasn't supported.
Assuming we can hide the irq and iomem stuff behind the appropriate
config options, and rework some of the architecture detection to
either support SUBARCH or check for X86_64 instead of X86, it should
be pretty easy to get going.)

That all being said, I can't say I'm thrilled with the test names
here: none of them are particularly descriptive, and they'll probably
not be static (which would make it difficult to track results /
regressions / etc between kernel versions). Neither of those are
necessarily deal breakers, though it might make sense to hide them
behind a kernel option (like all other KUnit tests) so that they can
easily be excluded where they would otherwise clutter up results. (And
if there's a way to properly name them, or maybe even split them into
per-file or per-module suites, that would make them a bit easier to
deal.) Additionally, there are some plans to taint the kernel[1] when
KUnit tests run, so having a way to turn them off would be very
useful.

Regardless, this is very neat, and I'm looking forward to taking a
closer look at it.

Cheers,
-- David

[1]: https://lore.kernel.org/linux-kselftest/20220429043913.626647-1-davidgow@google.com/

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7051520D0F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 06:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ky58H4sz8z3c9y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 May 2022 14:45:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=OrctmfTV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=davidgow@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=OrctmfTV; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ky57d3BStz3bb0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 May 2022 14:45:16 +1000 (AEST)
Received: by mail-wr1-x434.google.com with SMTP id i5so22029981wrc.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 21:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9s1dagxJlyBeoN8vXdOpsPpdS8AD1RWVJWE0n8ehmas=;
 b=OrctmfTVDCxyYdwcxCtO+PuFgHBDMDC7Bjk3TGUWyuOKGBhKLCCiUkxtYUOPWSujka
 /OoqstAYhrGXcYieyOQKBFbwQ9tdHrrlfAgfjS6rNqvPEA5JdQz3D4E5NS7VzL5WOf+E
 ppcl6vbGTOThxdSbDLD0FF3VNmQjZYs0YaRKW2LrfcKbI7iiYsOvdodP6Nf3qoZXPgQF
 Um1ef/9fJDTkVoHV63EAahHnEkdwxgxf/Hc8y1wACrWcQPfhb2xVBIshPVinpye5CGSN
 DoHok7Lf+NgFTiQMqtYLLj/aSoKi0RaOM3+EWbBDgDeG8Kjhw/dRvI6d3AEZbIIqfLAr
 UHxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9s1dagxJlyBeoN8vXdOpsPpdS8AD1RWVJWE0n8ehmas=;
 b=r4DGxwwG19bAsG0IPTpYQGEj7ezg0RarDWpYP4SP/TAy05gVjUt1TKmwyLzaAmFxu0
 RipVuIzAsNpmokRGrInB5T1LgG4wr230RRZLbQ6DvPX/HUAamX8LmGBzOBn/VRhcxDdu
 kNLg4/QC/gIilCJ5JwbViGJlHd3bvZl2VO5wgUvZXy0r/k9obtpYhef6d8te34mPT3PP
 JYa2BjvKV5YpRpe/0AHYytuMkbCuRWbuyaNQm9MHsV6nJovI2BwcC6ZpTqas8nIciy4v
 v5SyCVWOa/j4gvGTQgIOojjJWDxZxQMz784Qm7JhdeAKO4BLQmD6SPSxhFqtbwl+nFTg
 euUw==
X-Gm-Message-State: AOAM531LU7QRjTQ8SDVQ1kWtftN4FmTdmoNG4fcagVRTJrqMSwU2vl5v
 tNIG0iA997K1JARmSQxKW/8WhoFTCHpkpH0hiaz+eA==
X-Google-Smtp-Source: ABdhPJzfNwaPy5xjCTvC86K51nEH3yemeJZ1erUUa4xvtvCZqXN7MOjD5hnH0ntxxTlSOXapkot4g5ZMqXe6px9AH2Q=
X-Received: by 2002:a5d:4806:0:b0:20a:da03:711b with SMTP id
 l6-20020a5d4806000000b0020ada03711bmr16582569wrq.395.1652157908998; Mon, 09
 May 2022 21:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220507052451.12890-1-ojeda@kernel.org>
 <CABVgOSm5S2=QYnHJ+B0JbYtFYKBDRZiOhE5YMKKUKZU56d17HQ@mail.gmail.com>
 <CANiq72=0ft6+QLbdwWD6cLm4FhWfv53GSg6HKEwxQ-q2N-UkOw@mail.gmail.com>
In-Reply-To: <CANiq72=0ft6+QLbdwWD6cLm4FhWfv53GSg6HKEwxQ-q2N-UkOw@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Tue, 10 May 2022 12:44:57 +0800
Message-ID: <CABVgOSkrvfvA7Ay4GC5wg64S1gibvm5_U5VGBog3sw4_UFo8Cg@mail.gmail.com>
Subject: Re: [PATCH v6 00/23] Rust support
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
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

On Sat, May 7, 2022 at 11:03 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Hi David,
>
> On Sat, May 7, 2022 at 11:29 AM David Gow <davidgow@google.com> wrote:
> >
> > It's great to see some KUnit support here!
>
> Thanks!
>
> > It's also possible to run these tests using the KUnit wrapper tool with:
> > $ ./tools/testing/kunit/kunit.py run --kconfig_add CONFIG_RUST=y
> > --make_options LLVM=1 --arch x86_64 'rust_kernel_doctests'
> >
> > That also nicely formats the results.
>
> Indeed!
>
>     [16:55:52] ============ rust_kernel_doctests (70 subtests) ============
>     [16:55:52] [PASSED] rust_kernel_doctest_build_assert_rs_12_0
>     [16:55:52] [PASSED] rust_kernel_doctest_build_assert_rs_55_0
>     ...
>     [16:55:52] [PASSED] rust_kernel_doctest_types_rs_445_0
>     [16:55:52] [PASSED] rust_kernel_doctest_types_rs_509_0
>     [16:55:52] ============== [PASSED] rust_kernel_doctests ===============
>     [16:55:52] ============================================================
>     [16:55:52] Testing complete. Passed: 70, Failed: 0, Crashed: 0,
>     Skipped: 0, Errors: 0
>

I've just sent out a pull request to get this working under UML as
well, which would simplify running these further:
https://github.com/Rust-for-Linux/linux/pull/766

> > That all being said, I can't say I'm thrilled with the test names
> > here: none of them are particularly descriptive, and they'll probably
> > not be static (which would make it difficult to track results /
> > regressions / etc between kernel versions). Neither of those are
>
> Yeah, the names are not great and would change from time to time
> across kernel versions.
>
> We could ask example writers to give each example a name, but that
> would make them fairly less convenient. For instance, sometimes they
> may be very small snippets interleaved with docs' prose (where giving
> a name may feel a bit of a burden, and people may end writing
> `foo_example1`, `foo_example2` etc. for each small "step" of an
> explanation). In other cases they may be very long, testing a wide API
> surface (e.g. when describing a module or type), where it is also hard
> to give non-generic names like `rbtree_doctest`. In those kind of
> cases, I think we would end up with not much better names than
> automatically generated ones.
>
> The other aspect is that, given they are part of the documentation,
> the prose or how things are explained/split may change, thus the
> doctests as well. For instance, one may need to split a very long
> `rbtree_doctest` in pieces, and then the name would need to change
> anyway.
>
> So I think we should avoid asking documentation writers to add a
> manual name, even if that means a bit ugly test names. Also this way
> they are consistently named. What do you think?

Yeah, these are all fair points: particularly for small doctests.

Maybe having an optional name, which more significant tests could use
to override the file:line names? That could be useful for a few of the
larger, more often referenced tests.

> One idea could be giving them a name based on the hash of the content
> and avoiding the line number, so that there is a higher chance for the
> name to stay the same even when the file gets modified for other
> reasons.

Ugh: it's a bit ugly either way. I suspect that file:line is still
probably better, if only because we need some way of looking up the
test in the code if it fails. I'd hate for people to be randomly
hashing bits of just to find out what test is failing.

> > necessarily deal breakers, though it might make sense to hide them
> > behind a kernel option (like all other KUnit tests) so that they can
> > easily be excluded where they would otherwise clutter up results. (And
>
> Currently they are under `CONFIG_RUST_KERNEL_KUNIT_TEST` -- or do you
> mean something else?
>

Oops: I missed that (one of the issues with testing this on a
different machine which had a rust toolchain). Looks good to me.

> > if there's a way to properly name them, or maybe even split them into
> > per-file or per-module suites, that would make them a bit easier to
> > deal.) Additionally, there are some plans to taint the kernel[1] when
>
> Yeah, splitting them further is definitely possible. We are also
> likely splitting the `kernel` crate into several, which would also
> make the suites smaller etc. so perhaps further splits may not be
> needed.

Ah: I didn't realise the plan was always to have crate-specific
suites, and possibly to split things up.

The KTAP output specification does actually support arbitrary nesting
(though KUnit itself doesn't at the moment), which would potentially
be an option if (e.g.) providing the complete module nesting made
sense. I'm not convinced that'd make things easier to read, though.

> > Regardless, this is very neat, and I'm looking forward to taking a
> > closer look at it.
>
> Thanks again for taking a look and playing with it, I am glad you
> liked it! (even if it is just a first approximation, and only supports
> the `kernel` crate, etc.).
>
> Cheers,
> Miguel

Thanks,
-- David

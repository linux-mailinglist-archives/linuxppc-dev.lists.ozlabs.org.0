Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7274B35E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Feb 2022 16:48:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jwvyw0qKvz3c9v
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Feb 2022 02:48:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Y88Bnv1N;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d36;
 helo=mail-io1-xd36.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Y88Bnv1N; dkim-atps=neutral
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JwvyF55Xmz3bTD
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 02:47:48 +1100 (AEDT)
Received: by mail-io1-xd36.google.com with SMTP id e79so14902976iof.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Feb 2022 07:47:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NgeFCi+7UEK+nuh5x7QmJDaX6DxRBY5bpSpry5mSd78=;
 b=Y88Bnv1NDKvFo/zSY71RycxR2B/ACxpaW4T8kK3tqHqqQbpUAV2I1OqHKgzbSdhrDb
 QawjU0J+cVvOy4E4YoIvfXhs2SIP+8Wjor7UFfj9vJs/WzufHZgiGsGzq6HHh/Ihr3im
 3Q1+qditD4ehYRA0/AO80uTEFs6air76y7OZR7ruaDev3sQ47gRVfyCjN6xPjWtWX9gj
 rlTdZE9Q1bvJnL7TULLZH5Q2e/XqaeGAUzpl5Ym7KRemoqCta6NysmF5neqHTJWlPRAS
 KE5tVCBrM5IjxzNOqNkAwn4DNyaUgL5Vx2/ERkqh5aHXiGOirP9g4jhrBxji8VuhuUbZ
 63BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NgeFCi+7UEK+nuh5x7QmJDaX6DxRBY5bpSpry5mSd78=;
 b=zFTyJrGKu//Fj15RYuYocwcE3Zw8ToFr4sDGYC75WXvRUt+uro8+I8zKbdgpdy1oS4
 oyIGLIVCZpQQxprah6tHUYfHdZtYD8UttbSJQ5L3WisY1S3/3kxBU17LHr/n7nt9eMqr
 0o8dXLx2UVzPINkyp47Ylf9Ab9iFF2U4eYeRoe+ZFzdhcSEW3FFitVHmrpMWTh5Y3YGZ
 7hOvT31Qxm+nvr6t3+MG3uu25aqat/Nn9sr9N5RmG2O7HOfVqKLvK6cBrZDUda5Frw80
 JKfECfv5WpaR3HWpU7KeHy9SkSPmJCJqKROqY5Kp5N9+A7jYhg6qYBl3+nlisRTsLvFD
 NO4w==
X-Gm-Message-State: AOAM5323diNHD6y0ITqtkYruUqzjqviI7lYK1h06eARc146o4eUf2Ith
 4rIrGAU/XGsCTArDjzPHLKjOloSBzGOa5RyQrNs=
X-Google-Smtp-Source: ABdhPJzH9YyzNLTg9POFjsMYEBvv50IYOenD6jjVc2LJHnBnXQzNscn5cyEPVT4EBKpUx2wAjYDcVqVZhEvJ8smZXfs=
X-Received: by 2002:a05:6638:4105:: with SMTP id
 ay5mr3853138jab.186.1644680864074; 
 Sat, 12 Feb 2022 07:47:44 -0800 (PST)
MIME-Version: 1.0
References: <20220212130410.6901-1-ojeda@kernel.org>
 <20220212130410.6901-17-ojeda@kernel.org>
 <YgfBUhYdLXA46kOX@shell.armlinux.org.uk>
In-Reply-To: <YgfBUhYdLXA46kOX@shell.armlinux.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 12 Feb 2022 16:47:33 +0100
Message-ID: <CANiq72nMhUH1s0HMeLb+hfp5=u3h20ryC4uqAgB1Znuq52e=Pw@mail.gmail.com>
Subject: Re: [PATCH v4 16/20] Kbuild: add Rust support
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>,
 Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>,
 Masahiro Yamada <masahiroy@kernel.org>,
 "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Antonio Terceiro <antonio.terceiro@linaro.org>,
 Miguel Ojeda <ojeda@kernel.org>, Adam Bratschi-Kaye <ark.email@gmail.com>,
 Albert Ou <aou@eecs.berkeley.edu>,
 rust-for-linux <rust-for-linux@vger.kernel.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Boqun Feng <boqun.feng@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Xu <dxu@dxuuu.xyz>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Dariusz Sosnowski <dsosnowski@dsosnowski.pl>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Michal Marek <michal.lkml@markovi.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Boris-Chengbiao Zhou <bobo1239@web.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Finn Behrens <me@kloenk.de>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Russell,

On Sat, Feb 12, 2022 at 3:17 PM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> Please don't use CPU_32v6* here.
>
> It probably makes more sense to add a symbol "HAVE_RUST" and have the
> appropriate architecture Kconfig files select HAVE_RUST.

We can do it whatever way arch maintainers prefer, of course. Why
would you prefer one over the other?

> Does Rust support Thumb on ARMv6 and ARMv7 architectures?

Yes, the main backend is LLVM. Some built-in targets and their support
level are listed here, if you want to take a look:

    https://doc.rust-lang.org/nightly/rustc/platform-support.html

There is also a GCC backend in `rustc` [1], which is making good
progress and may eventually give us access to architectures supported
by GCC. Furthermore, a from-scratch Rust frontend for GCC [2] is being
worked on, though this effort will likely take more time to reach a
point where it may be used for the kernel.

[1] https://github.com/rust-lang/rust/tree/master/compiler/rustc_codegen_gcc
[2] https://github.com/Rust-GCC/gccrs

> Please remove every utterance of "default n" from your patch; n is the
> default default which default defaults to, so you don't need to specify
> default n to make the option default to n. It will default to n purely
> because n is the default when no default is specified.

Certainly. I am curious, though: is there a reason for most of the
other 500+ instances in the kernel tree?

> As Rust doesn't support all the architectures that the kernel supports,
> Rust must not be used for core infrastructure.

Yeah, although I am not sure I understand what you are getting at here.

Cheers,
Miguel

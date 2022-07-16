Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E682576CAB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 10:58:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlMZh3YYJz3c99
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 18:58:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m7RolDKD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12c; helo=mail-il1-x12c.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m7RolDKD;
	dkim-atps=neutral
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlMZ36K5xz2x9v
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 18:57:46 +1000 (AEST)
Received: by mail-il1-x12c.google.com with SMTP id h16so3613035ila.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 01:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IYks55HxgsoLlm9FNEz/2R9Y4bixjWKaygGPwKIVjx0=;
        b=m7RolDKDIlPqQgPf5OTP/N6sK1eysv8GJE4Xfn8CjMg0SxwuCaAjEySP55tmXp5JVI
         UpIwNpbxTFBX8XrQHPTU10osewAMlkpehUSHMxLE/z5AscetNKSTakXBmT4sFuZxvdSj
         6pLhVxcEz3FFMTM6nM4GdyvOJqmUEFJQCr3AOL0xm1yUFCsUy47Z3rBXZtMZzmMP/h9s
         7WpW+a65qg8gkRMjnKQbAyPOY44lzJH7wId88CcIuxY+ie25eQBbKgS5dR4nb4qAp0au
         boOEvL+LfokeBh3nWrS03XXVnUDvFPo3DxazMu+hCulyNuyUUotHieO4rDvfdCn9+u/Z
         mv8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IYks55HxgsoLlm9FNEz/2R9Y4bixjWKaygGPwKIVjx0=;
        b=RnGdy5jnn0344Ev5HAmmYXq5ibXWa9rIGdzhY7j6bIC5Sd6RiZBuO2ReUB17tfQmbb
         D+LsQujJgU0vci1oE6QM2MppvqTdgFv8PWeUESfS8A8pCW87D3si72MYY/k6J+pxZhme
         idaf+y7w+TbybDznI+hOn3wzqQY5IuBSNO1bJaL5kIiaCD+e/eF/DD6NVWF45PHn5M/k
         p7w1riK1HAuuMyde6Ksi8v4lq4o3fjaUJpkDm1it26u0bBxL2XdybUHaS+lbiMLeyv9k
         O/HNTh5ZMHhUpZGyFDQEnC47+lNB5dsA1iydwJNBbNc8HDExE99oCB9WmXv34Q67cVS6
         Gl5g==
X-Gm-Message-State: AJIora+vySW/pYBXOnzNEXWiVbBJCYfmHVlwsaa+T4LJnljX4FoG3ubY
	Ck8YAFfsoPaoyeH2e1q49UxVbam+zo2LmN2eGF4=
X-Google-Smtp-Source: AGRyM1upiXNei9Ij258Ho2aijo3CxpUzFbH2CubB6AzfY4tMP/5ochBIlN/TgfrRN46dYIn9zQ7KIb7ZCJ9pwMhj3ew=
X-Received: by 2002:a05:6e02:1c8d:b0:2dc:8162:282e with SMTP id
 w13-20020a056e021c8d00b002dc8162282emr8874969ill.5.1657961861953; Sat, 16 Jul
 2022 01:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220523020209.11810-22-ojeda@kernel.org>
 <CAK7LNAQZOTjxJyS3WC1sM7LE-An7DL8xoW=-s1ONe7cq4YukNQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQZOTjxJyS3WC1sM7LE-An7DL8xoW=-s1ONe7cq4YukNQ@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Jul 2022 10:57:30 +0200
Message-ID: <CANiq72k1aPQuvAL=TqNQVBZBmxojKfPBKU3v_2_B=731fhuJbQ@mail.gmail.com>
Subject: Re: [PATCH v7 21/25] Kbuild: add Rust support
To: Masahiro Yamada <masahiroy@kernel.org>
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
Cc: Sven Van Asbroeck <thesven73@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Miguel Cano <macanroj@gmail.com>, Paul Mackerras <paulus@samba.org>, Gary Guo <gary@garyguo.net>, Douglas Su <d0u9.su@outlook.com>, Borislav Petkov <bp@alien8.de>, "open list:SIFIVE DRIVERS" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, "H. Peter Anvin" <hpa@zytor.com>, X86 ML <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Wedson Almeida Filho <wedsonaf@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Antonio Terceiro <antonio.terceiro@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, Adam Bratschi-Kaye <ark.email@gmail.com>, Albert Ou <aou@eecs.berkeley.edu>, rust-for-linux <rust-for-linux@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-um@lists
 .infradead.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Xu <dxu@dxuuu.xyz>, David Gow <davidgow@google.com>, Paul Walmsley <paul.walmsley@sifive.com>, Dariusz Sosnowski <dsosnowski@dsosnowski.pl>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Michal Marek <michal.lkml@markovi.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Boris-Chengbiao Zhou <bobo1239@web.de>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Richard Weinberger <richard@nod.at>, Finn Behrens <me@kloenk.de>, Johannes Berg <johannes@sipsolutions.net>, Linus Torvalds <torvalds@linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Masahiro,

On Sat, Jul 16, 2022 at 10:23 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Is it intentional to print the successful message to stderr?

I think it makes sense to change it to `stdout`, given the message is
the main point of running `rustavailable` for normal users, and those
that just want the status code may ignore it.

Thanks for taking a look again!

Cheers,
Miguel

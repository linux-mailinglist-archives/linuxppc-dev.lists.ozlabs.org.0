Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FB587EA0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 17:10:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lxz1c6Krbz3bqT
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 01:09:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pkkYVaCX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::136; helo=mail-il1-x136.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=pkkYVaCX;
	dkim-atps=neutral
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lxz0z3JVxz2xGf
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 01:09:21 +1000 (AEST)
Received: by mail-il1-x136.google.com with SMTP id h16so7121797ilc.10
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Aug 2022 08:09:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TnTubc6T2moNEJDYoN4cgfDzPxoHQtes0c+6H3Y5Dww=;
        b=pkkYVaCXoDjN3BxJA9fdnVundUXhEs1ZNjfqqqRGarF5AV++es8DHqocJO+FlDtBo2
         K9VLQBHIKirR+kBAZXEW9X3tax+LPb3OLjnPtBLoJhQvOpYVhyum0CDwjRQmi8N3QLG9
         qVZKGbs47r3RtFLMkEjxsxA5QRB0Pkop+q4m7mjlwSgMKR5zZqDQjBomHGV1Us1vun9a
         vz+DnLQ27XHfdmEC6MvRGoByNQNFIbb1wMouC5XlTA9YXSvZ12GajCS96japFxJgfg9b
         tHVgeXFpFd/wEAlJhB2ZChsOmOVxsmNul/LP5dMDpuISoJLCiJvTU58sqjiz4XsvWNCB
         Ou/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TnTubc6T2moNEJDYoN4cgfDzPxoHQtes0c+6H3Y5Dww=;
        b=sUVMN+yxuH+gExNyeC9hXqI3mMCymnEE8PWPEZUkKOGLlQ0SAO3yMhpPB5JVT2X3Zv
         NnMXgm6RwPD8SIfPf9AL0k1JGB5W25NnwDQjis2kb+GsHdWV5K3GOXGYh4uV2j+6DyPZ
         6qPboZg+MPotNODRisK6PlAMmKBkuRNngRU6msQCmet8/RYt+XXec8NJdHBPB3W7NZZR
         2UtMIChmVaQwpEJ3i2V0WLfxSbCiYYg+rbfW+Bu9wgqG3vGvEOgEuZXpTWKWx27hPjSe
         EhWXb0AjIxWoImhuRIL4OQPlvqlknLi67PcLjxlFj0JZ/nYRV4oqUto7soC+aM3QN/Cx
         LvsQ==
X-Gm-Message-State: AJIora8t55/HaYYa5xUYTkDIEavgZP5b964MWdRmGiExcNiZa9A5KZtl
	QXt7scUsZRd9qU3GK9CXAHLhPzS7WpICVLPQcxs=
X-Google-Smtp-Source: AGRyM1s/X7XdR0/a8lkQRbVcBP+dwZOZipEH93h8R/VlEWYf/KISRMdds5FIhduFNaDE0FsZQymaRLP6g1Da/s6WJVw=
X-Received: by 2002:a05:6e02:17c6:b0:2dd:d9dc:6387 with SMTP id
 z6-20020a056e0217c600b002ddd9dc6387mr8296085ilu.321.1659452957891; Tue, 02
 Aug 2022 08:09:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220802015052.10452-1-ojeda@kernel.org> <YukYByl76DKqa+iD@casper.infradead.org>
 <CANiq72k7JKqq5-8Nqf3Q2r2t_sAffC8g86A+v8yBc=W-1--_Tg@mail.gmail.com> <YukuUtuXm/xPUuoP@casper.infradead.org>
In-Reply-To: <YukuUtuXm/xPUuoP@casper.infradead.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 2 Aug 2022 17:09:05 +0200
Message-ID: <CANiq72kgwssTSE7F+4xkRrXBGVgHeWxCyjeZ-NHLUXWnFjMyTg@mail.gmail.com>
Subject: Re: [PATCH v8 00/31] Rust support
To: Matthew Wilcox <willy@infradead.org>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org, linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-gpio@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org, linux-riscv@lists.infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 2, 2022 at 4:01 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> No objections to any of this.  I love the idea of being able to write
> filesystems in Rust.  I just think it would go more smoothly if
> linux-fsdevel were involved more closely so people at least have the
> option of being able to follow design decisions, and hopefully influence
> them.  That goes both ways, of course; I hardly think our current
> operations structures are the optimum way to implement a filesystem,
> and having fresh eyes say things like "But that shouldn't be part of the
> address_space_operations" can impel better abstractions.

I will send the patches to fsdevel then!

As for following development closely and design decisions, we have
been doing it in GitHub so far pre-merge, so the easiest until the
merge (for us) would be to ping you there. We can also send you copies
of the `fs` related patches too if you would like that. I would highly
recommend joining the monthly informal calls too.

(I appreciate the kind answer, by the way!)

> The obvious answer is to split out the 'fs module' into its own patch
> ;-)  I presume it was part of the kernel crate which would have been
> either patch 17 or 11 in that series?

Yeah, patch 17, exactly (patch 11 is the `alloc` import). I have asked
Konstantin privately about them.

In any case, I will split the patches further for v9 which should help.

Meanwhile, you can also see the `fs` module here, if you are curious:

    https://github.com/Rust-for-Linux/linux/blob/rust-next/rust/kernel/fs.rs
    https://github.com/Rust-for-Linux/linux/blob/rust-next/rust/kernel/fs/param.rs

Cheers,
Miguel

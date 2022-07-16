Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CD6A8576E61
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 15:56:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlVC35VVgz3cdt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 23:56:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KdWH1Pfn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=KdWH1Pfn;
	dkim-atps=neutral
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LlVBS3K7yz2xn3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 23:56:15 +1000 (AEST)
Received: by mail-il1-x12f.google.com with SMTP id h16so3835107ila.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 06:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V4FhIyepvRr1gXawjyEQpzIVadAC7ZxwCjKEzgRh/bc=;
        b=KdWH1PfnFwqpPxd7W0PxapNamksI04N1J1pzzmASbjhZAa3HLxSSk5HwzaEAseuXpW
         nNsgKAEAxGvztay7gho66xNc2QCxWwEyGXbCv5lAz3EAhFpFJfuIeY7K76/0vq1k3vCQ
         2A4ZeWEkN4IZQH1TYyqAVV2R0ANWdmP2osXk1QbS92RBijpvBQo0R3fnlJ87Bav+p7xf
         FSAfrCYfgPPgpP/Eo2QbIXBrRk5zd4AvPDHrzOq47USph/a5huS67TiBDFyW8noTS6Uh
         Rr0qFvkmBG2Rj2WAofY8yIfRhbQByw8ah0SxA+yZ2h9GNamE5b2FqVNxaZBPSBZiccV0
         aKAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V4FhIyepvRr1gXawjyEQpzIVadAC7ZxwCjKEzgRh/bc=;
        b=ndfghQLNWhN8uWuhtLOCrojkPYkIpNnoaHZfCdXnmX5VSi95dyVFr9N0TeCWh4H5+L
         C3kjoCELw904LHN/Y7intrYKlkTD1U1okTVrB5oiEYrHzavCwzVw2FoN5K+xzp9udiBN
         V3jAiuF2rRqiXxG63tI89gkJ61qIFZRPB96hGvF7gejAM7V4pScnmlOcicsop+1E9thE
         gJo1dxp3yK/aaYwwq0ODmBjKsWpfW25sffvcaQKJzhLPPxVI8cKuqjSdYa091z8hSB4/
         V69FtC6qq7RECy0E1SRWC8Tfm8rhb88E4olj6unXTqQWSHTthihBpEQtapjJbYy8knQ2
         NyPg==
X-Gm-Message-State: AJIora8R06l9rDLkb4xVrYP8W4TJ1qfp9p67jqL+ZjTUBsMdU3xeb3sf
	/NNWbK2A8umqybYeUYzQ0R+SgGa8Lg0XNkQOsc4=
X-Google-Smtp-Source: AGRyM1tr+wIQ9WPj4ffi06adPAclHl6+H10vOy21nRYCi1+gt6eZYnfIg0TqG8PTuM+GqMyjQgVFJxK/0/WWZ5rGrRw=
X-Received: by 2002:a05:6e02:1c2a:b0:2dc:621e:df15 with SMTP id
 m10-20020a056e021c2a00b002dc621edf15mr9816280ilh.151.1657979771086; Sat, 16
 Jul 2022 06:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20220523020209.11810-1-ojeda@kernel.org> <20220716124214.329949-1-conor@kernel.org>
 <CANiq72nYRkHV6N2bGpTz3td=2Vto21apvZW0igTT-mV8TZtB2g@mail.gmail.com> <4a6240da-9003-cd74-cd47-f95ba2d9e7ae@microchip.com>
In-Reply-To: <4a6240da-9003-cd74-cd47-f95ba2d9e7ae@microchip.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 16 Jul 2022 15:56:00 +0200
Message-ID: <CANiq72nDcJLSB3pLhkdqGdLitfmqqCUVVfkY5EjP9AcwVv9B4A@mail.gmail.com>
Subject: Re: [PATCH v7 00/25] Rust support
To: Conor.Dooley@microchip.com
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
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, linux-um@lists.infradead.org, linux-kernel <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, linux-perf-users@vger.kernel.org, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Jarkko Sakkinen <jarkko@kernel.org>, "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, live-patching@vger.kernel.org, linux-riscv <linux-riscv@lists.infradead.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>, KUnit Development <kunit-dev@googlegroups.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jul 16, 2022 at 3:51 PM <Conor.Dooley@microchip.com> wrote:
>
> Ah right, sorry for the noise so. I checked the ml but didn't see a
> report there.

No apologies needed -- thanks to you for the report, instead! :)

> Thanks Miguel, good to know! I'll just wait around for a new version.
> Just been trying to get my CI etc in order for when rust support lands,
> but it sounds like I should be okay as it's a known problem & not some
> only-broken-on-riscv thing.

Yeah, it is a simple `bindgen` issue. Thanks a lot for making the
effort to prepare your CI in advance!

Cheers,
Miguel

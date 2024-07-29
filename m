Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8345193F234
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 12:08:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXYwD3gNTz3cZq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 20:08:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXYvr548vz3cG6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 20:08:07 +1000 (AEST)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6694b50a937so21589227b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 03:08:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722247679; x=1722852479;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwTfVYSGl0qov4UkTwnmIUGjC6ZGnXwHCwIWbd4QwcU=;
        b=JEQJX2eHlkjacQ7Fn//kL9kihcsKlilC01wmDy2Jh4KbuY4QIqyk6OSaPPXjaEyALf
         qk7N5SiXCcDdCupcBEQ2cQU0oECHbfPm1FypKggQvHatUPujuKvAb1PRXjlFtiSEFkBA
         VZ8Qy6cVWddBHTMM0jfJbzZD/eLG7QJskmRcVfQfx65ghjbvfJyM+t7Qk4qyPMaebNNx
         vOtcaV/urGV1CbFDSXV40D+k8erQGZXQ8xc7pQh+PKU5P01h3bD1TLr7AQw57Ngh3n0p
         HLeXx8C0eLRuBnIxpbByMQtaDqnO38BZx1+fKmwHxslFfGH6JxVqHlRGJDGf0mh4lngK
         F6/w==
X-Forwarded-Encrypted: i=1; AJvYcCWqZSd7JC6hGuspJck6NqBcaO3RlXjjkggT3jfR0KrKzbG4ZG3b5Y4GONaziYDJi/C1g/6amdE1PJ+7L7AmsGp2FARArckC8DsNgZc7mw==
X-Gm-Message-State: AOJu0YxM1DiCoGDSElMe9QOp/dZ73frNchbpG/ErXtSOQv8CzqubJ1+h
	jXt4OTrZe3xoRYWYT3hRNP7k4b0rtpoeCf0bHc2MwIamdasypUU10xlgp7oW
X-Google-Smtp-Source: AGHT+IEUbsiQFzxyriRjb0BUP0m0/OwFPhuDD1HU1VUzOikvHpKAN+/gmt/zEbqaLwik0QLNuq787A==
X-Received: by 2002:a81:6ec5:0:b0:650:9d94:799f with SMTP id 00721157ae682-67a07b77709mr81973987b3.26.1722247679283;
        Mon, 29 Jul 2024 03:07:59 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6756c44dcb2sm19620807b3.146.2024.07.29.03.07.58
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 03:07:58 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-66a1842b452so12816177b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2024 03:07:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUM+U+W0uo3WaqhJZzYjhYf7gcLgAYLLOCg+71O+5cfAD8OkhkVykhUqTR79hHaUAH0CC6LPryDlpBR18oyNhW87MdgoxhXyChvSYlBUA==
X-Received: by 2002:a05:690c:6203:b0:664:7b3d:a53f with SMTP id
 00721157ae682-67a0a7fba7cmr91084297b3.45.1722247678607; Mon, 29 Jul 2024
 03:07:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAHk-=wiyNokz0d3b=GRORij=mGvwoYHy=+bv6m2Hu_VqNdg66g@mail.gmail.com>
 <20240729092807.2235937-1-geert@linux-m68k.org> <bd4e9928-17b3-9257-8ba7-6b7f9bbb639a@linux-m68k.org>
 <502ee081-8e09-422a-a1f9-be40aeaa84fb@app.fastmail.com>
In-Reply-To: <502ee081-8e09-422a-a1f9-be40aeaa84fb@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 29 Jul 2024 12:07:46 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUUepTM9v7Oyakv6XQg9iw7t08ggGX=K90zRXxm4Ffpjg@mail.gmail.com>
Message-ID: <CAMuHMdUUepTM9v7Oyakv6XQg9iw7t08ggGX=K90zRXxm4Ffpjg@mail.gmail.com>
Subject: Re: Build regressions/improvements in v6.11-rc1
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: dm-devel@lists.linux.dev, linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-hexagon@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, intel-xe@lists.freedesktop.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Arnd,

On Mon, Jul 29, 2024 at 11:55=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
> On Mon, Jul 29, 2024, at 11:35, Geert Uytterhoeven wrote:
> >>  + /kisskb/src/kernel/fork.c: error: #warning clone3() entry point is =
missing, please fix [-Werror=3Dcpp]:  =3D> 3072:2
> >
> > sh4-gcc13/se{7619,7750}_defconfig
> > sh4-gcc13/sh-all{mod,no,yes}config
> > sh4-gcc13/sh-defconfig
> > sparc64-gcc5/sparc-allnoconfig
> > sparc64-gcc{5,13}/sparc32_defconfig
> > sparc64-gcc{5,13}/sparc64-{allno,def}config
> > sparc64-gcc13/sparc-all{mod,no}config
> > sparc64-gcc13/sparc64-allmodconfig
>
> Hexagon and NIOS2 as well, but this is expected. I really just
> moved the warning into the actual implementation, the warning
> is the same as before. hexagon and sh look like they should be
> trivial, it's just that nobody seems to care. I'm sure the
> patches were posted before and never applied.
>
> sparc and nios2 do need some real work to write and test
> the wrappers.
>
> It does look like CONFIG_WERROR did not fail the build before
> 505d66d1abfb ("clone3: drop __ARCH_WANT_SYS_CLONE3 macro")
> as it probably was intended.

Indeed. The actual regression is that this turned into a fatal error
with -Werror.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

Return-Path: <linuxppc-dev+bounces-3216-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5EB9C8CFC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 15:37:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq2ms1C02z305P;
	Fri, 15 Nov 2024 01:37:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.177
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731595053;
	cv=none; b=jUAgQDBOMzQDONnpFo60kBNc7u2mjmwKUdxUd2yUQFzuL5K5tIsrkgaZSNRYYlXid4VTWMzBgNPythNDUAA61RHadmToeA2E1AE+2dH+eIWnxEM8MaLv3iq5qAuOTw/xutG6Xmqui3KLpZJ3o7OXZa/zcXPk8NmULdHsd3I+UneW4S/NiMauhbncA/UmpvFJZanvCVCxAZJzQk4fj8mwaU3lvZJjuUUAV8j7hqmnZaiGDPZkGH24MEuyQbKzkOqKTUsa9oB4nmxlNU7Fh7nPJqaMX456YIflBQl6wnXA5p+ws8IeXnMNBq6wpLt/Kp/3qLHMeThdXceJtefZiguNuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731595053; c=relaxed/relaxed;
	bh=8XkQAk9rlU0ipIFuZq7Z3F+TVNbmBiyHocTwUGKdmYA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OiX8kUKAWndmaKAcO7tiSI5eevXLv9TfXFrqdY1HZL+7eMd0Fya/SGlQMuZSbqbbvrUBxAK+wVSJWGcPbXHSgg1HzfqtrWRrKj7YsiQt1VeVBu870NDmUSdu+v+rWFGtgYl0+Gr4BwxutuQOV/Xyp03D4MokvPQ2h+9WU0Asc5/CzUJmB7fgog1027DuR06kB02GZhEP7T9LzHL2JAbLxSFsGa2bg1f/fVkopkjtcr6Xsw88ZXnjxGXO4OAZctEGUcd2vsddelCvvUxpy9sYPRUdPFEmWtCkdxeL51DmGftoo2+Tvt14Dykj0RvLtE1FDoQVO+cao1VBUBZ/w0ipxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.128.177; helo=mail-yw1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.177; helo=mail-yw1-f177.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq2mr16KCz305G
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 01:37:30 +1100 (AEDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ee4460fd7bso5432527b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:37:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731595048; x=1732199848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8XkQAk9rlU0ipIFuZq7Z3F+TVNbmBiyHocTwUGKdmYA=;
        b=AnW7ODZ4OtoIlGqkxvspk3Go25Jk1UpdXjbJXgVsQ9hfrgR/WXwhXmquOSfghmr5qG
         Ys1D61v9w4yDdw3ZvyiLLfUpIC4Qgi7plMyFh9zsiweoLFnkXcY6+W2MomfevdROh1BM
         j5pXvZCMxWNOeATTOlx556caNbDjmOL2hPjDK1Ai789BTbBMVXAEMQuiei8xXg+I3EFy
         /waHQT8dEH2z6omMRJIKQmpfdc5JE8OwRRJv+jRJOMGP70u26NEm3mTozDpVgryn5EOI
         58qfYXIJ19zVXEbZs7I0L9R5G0FRGpzAVT4AGGGO5Q6znIJKW00Pdl77FVFhdO0ak+x0
         NbDQ==
X-Gm-Message-State: AOJu0YxGyizzMKzLSk0XgT8Pl/tTmAs1Cp4gKhSQas6INd5PLiXFb0iY
	QhncyMQj/YXVq/i661TDbyZJUCWIkxpN+WcDBk90E5nd9CHYX/+QD55FHVOP
X-Google-Smtp-Source: AGHT+IFrGnDFwR434SvQtOhWfXuBZEPs34NKvRM285LF6obWdjnxMw0HY81DlDPSZtayx8C7Yww8iQ==
X-Received: by 2002:a05:690c:7a1:b0:6dd:d0fa:159e with SMTP id 00721157ae682-6ee4362731dmr23720057b3.30.1731595048362;
        Thu, 14 Nov 2024 06:37:28 -0800 (PST)
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com. [209.85.128.176])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee4400c6e6sm2630227b3.9.2024.11.14.06.37.28
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 06:37:28 -0800 (PST)
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6ea1407e978so6713767b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 06:37:28 -0800 (PST)
X-Received: by 2002:a05:690c:6410:b0:6dd:ce14:a245 with SMTP id
 00721157ae682-6ee43375cb0mr27009127b3.6.1731595047941; Thu, 14 Nov 2024
 06:37:27 -0800 (PST)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20241114131114.602234-1-mpe@ellerman.id.au> <20241114131114.602234-9-mpe@ellerman.id.au>
In-Reply-To: <20241114131114.602234-9-mpe@ellerman.id.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 15:37:15 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXLM-eeAa9=YwkU6gcwmD60Wba5v=F6PU20QMqzxRbM4w@mail.gmail.com>
Message-ID: <CAMuHMdXLM-eeAa9=YwkU6gcwmD60Wba5v=F6PU20QMqzxRbM4w@mail.gmail.com>
Subject: Re: [RFC PATCH 09/10] i2c: Remove I2C_HYDRA
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de, 
	Linux I2C <linux-i2c@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

CC linux-i2c

On Thu, Nov 14, 2024 at 2:11=E2=80=AFPM Michael Ellerman <mpe@ellerman.id.a=
u> wrote:
> The i2c-hydra driver depends on PPC_CHRP which has now been removed,
> remove the driver also.
>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

> ---
>  drivers/i2c/busses/Kconfig     |  12 ---
>  drivers/i2c/busses/Makefile    |   1 -
>  drivers/i2c/busses/i2c-hydra.c | 150 ---------------------------------
>  3 files changed, 163 deletions(-)
>  delete mode 100644 drivers/i2c/busses/i2c-hydra.c
>
> diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
> index 6b3ba7e5723a..cbd072955e45 100644
> --- a/drivers/i2c/busses/Kconfig
> +++ b/drivers/i2c/busses/Kconfig
> @@ -373,18 +373,6 @@ endif # ACPI
>  comment "Mac SMBus host controller drivers"
>         depends on PPC_CHRP || PPC_PMAC
>
> -config I2C_HYDRA
> -       tristate "CHRP Apple Hydra Mac I/O I2C interface"
> -       depends on PCI && PPC_CHRP
> -       select I2C_ALGOBIT
> -       help
> -         This supports the use of the I2C interface in the Apple Hydra M=
ac
> -         I/O chip on some CHRP machines (e.g. the LongTrail).  Say Y if =
you
> -         have such a machine.
> -
> -         This support is also available as a module.  If so, the module
> -         will be called i2c-hydra.
> -
>  config I2C_POWERMAC
>         tristate "Powermac I2C interface"
>         depends on PPC_PMAC
> diff --git a/drivers/i2c/busses/Makefile b/drivers/i2c/busses/Makefile
> index ecc07c50f2a0..ab366ce6f15c 100644
> --- a/drivers/i2c/busses/Makefile
> +++ b/drivers/i2c/busses/Makefile
> @@ -32,7 +32,6 @@ obj-$(CONFIG_I2C_VIAPRO)      +=3D i2c-viapro.o
>  obj-$(CONFIG_I2C_ZHAOXIN)      +=3D i2c-viai2c-zhaoxin.o i2c-viai2c-comm=
on.o
>
>  # Mac SMBus host controller drivers
> -obj-$(CONFIG_I2C_HYDRA)                +=3D i2c-hydra.o
>  obj-$(CONFIG_I2C_POWERMAC)     +=3D i2c-powermac.o
>
>  # Embedded system I2C/SMBus host controller drivers
> diff --git a/drivers/i2c/busses/i2c-hydra.c b/drivers/i2c/busses/i2c-hydr=
a.c
> deleted file mode 100644

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


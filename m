Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 747EC2C610C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 09:41:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj7Qr3Q0YzDrh0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 19:41:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj7Ny0YbRzDrTM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 19:40:17 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id f12so4024241oto.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:40:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/D+lVsFpiig9p8Mfv+F/WnI4wKF69UpUHln9lDG06g4=;
 b=ACo988DjGxPfrrpqZ/JOA5es7MXvgV+nUDA0zqSJo5eaUnG7hLAvz5Ry9z87m0BVpI
 6Qqtmgmydw4nRO0Mfj8T+zzVR5xCOdh3f+LzXrLrYEvdXQah8T/LrnuzfaTtn8pHAr7H
 4dc1TgE9HJXm4Z5nwdYiDV8x7+JPRhiL7Z7MHzIsPElV5cH3Pw+SzqhZ2ZW1WPxI0ZEu
 T9oxhbdK4YgSlni4gm9c0t3O0m47xcfHByb87UUnqvj11ewOzIWprJrbsDzc37Owq+pa
 cPya8ldt0QidIhG7I3Nju2xP7aggkIeDit50DKlPuFD1/J8XhAHbXhDdk0mJPD22ADrW
 zytw==
X-Gm-Message-State: AOAM532GAbgkLzrWRPgxEDB4OrBqikl8N8rQoI8wxho5jA3/WbzKkOtJ
 KJF+eJ1Fi7p5pDzu+aUwjfqVtip0vXv1dzG6q8fvQnzzh1oQJA==
X-Google-Smtp-Source: ABdhPJy2I/IdfAm6V2ydZbwLB9NPNLYo9PucEpxX/NL/qzuCx8bfpYwJU7BhpITpgvBGwlFRBVNr8EmnqamS0CIYUsg=
X-Received: by 2002:a9d:686:: with SMTP id 6mr4709371otx.107.1606466415531;
 Fri, 27 Nov 2020 00:40:15 -0800 (PST)
MIME-Version: 1.0
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
 <20201126165950.2554997-2-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20201126165950.2554997-2-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Nov 2020 09:40:04 +0100
Message-ID: <CAMuHMdW4J0xA6T4AWqZdo1go1kxWqVSSo5JXQpUAM4yWEpDdOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] powerpc/ps3: make system bus's remove and shutdown
 callbacks return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
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
Cc: ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Jaroslav Kysela <perex@perex.cz>, Paul Mackerras <paulus@samba.org>,
 scsi <linux-scsi@vger.kernel.org>, Alan Stern <stern@rowland.harvard.edu>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Jens Axboe <axboe@kernel.dk>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Geoff Levand <geoff@infradead.org>, netdev <netdev@vger.kernel.org>,
 USB list <linux-usb@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jim Paris <jim@jtan.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Uwe,

On Thu, Nov 26, 2020 at 6:03 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
> The driver core ignores the return value of struct device_driver::remove
> because there is only little that can be done. For the shutdown callback
> it's ps3_system_bus_shutdown() which ignores the return value.
>
> To simplify the quest to make struct device_driver::remove return void,
> let struct ps3_system_bus_driver::remove return void, too. All users
> already unconditionally return 0, this commit makes it obvious that
> returning an error code is a bad idea and ensures future users behave
> accordingly.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Note that the same can be done for ps3_vuart_port_driver.remove().

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

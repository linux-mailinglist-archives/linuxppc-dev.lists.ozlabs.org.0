Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4862C60F1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 09:37:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cj7KQ4mCZzDrfh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 19:37:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=geert.uytterhoeven@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-m68k.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cj7Ht3J1gzDrfQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 19:35:53 +1100 (AEDT)
Received: by mail-ot1-f66.google.com with SMTP id f12so4015515oto.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:35:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xh1hHzZVurhLLa9A5bjYyJ5OP5iFGRKbQx8AzvX3xN4=;
 b=J3tbwtBzwfY9biRVd4q6xqNtIhaKw1ehl3O5Lo3sqgyWTCfrZObNlOge72SluyrsWY
 kCFOQKCzZIb7F2ZP52w3/JzE4A7rca8aHy/WHaRlEZYiAlEnRgBVoqM91PoTT2r1OcXv
 fR/hjQIHleTMJRbQyUyTi/CTl3AAzMEJgOm2u5DnIBMyCl+uFgeSQ+/va6+ulfUEkaS4
 3OfKP/q8z05hpW8xIE6ZCcKmpNq0Q0Jk3ezarV4vXsSHXUr8gZHy/3Cjvzb6INs2lpem
 B7xOXrCE/dqIgt7cSCv+q1xMlCzNg7sCuhEltJT3VABcxjUxyfoXvI2dr7lHLP2uzybc
 f76Q==
X-Gm-Message-State: AOAM531U0MGv8CQfUPE213vJaidllLYc7Tr9cRIHmyp+O54wrshNdvVa
 Sl1cAjBpp2JOxuNuuZoWbhXeqgyO+XoPOkR4zLY=
X-Google-Smtp-Source: ABdhPJxi+ycxEsm5KsGHfXpYVjf0qoqXVdSm5mG1czf/VSu3Ar1g/6kPH+lbgaSp8/Ea4xlpW0yThv8dOVha3z28GvM=
X-Received: by 2002:a05:6830:210a:: with SMTP id
 i10mr4949297otc.145.1606466150802; 
 Fri, 27 Nov 2020 00:35:50 -0800 (PST)
MIME-Version: 1.0
References: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20201126165950.2554997-1-u.kleine-koenig@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Nov 2020 09:35:39 +0100
Message-ID: <CAMuHMdUbfT7ax4BhjMT_DBweab8TDm5e=xMv5f61t9QpQJt1mw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ALSA: ppc: drop if block with always false condition
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
> The remove callback is only called for devices that were probed
> successfully before. As the matching probe function cannot complete
> without error if dev->match_id !=3D PS3_MATCH_ID_SOUND, we don't have to
> check this here.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

Thanks for your patch!

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

Note that there are similar checks in snd_ps3_driver_probe(), which
can be removed, too:

        if (WARN_ON(!firmware_has_feature(FW_FEATURE_PS3_LV1)))
                return -ENODEV;
        if (WARN_ON(dev->match_id !=3D PS3_MATCH_ID_SOUND))
                return -ENODEV;

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

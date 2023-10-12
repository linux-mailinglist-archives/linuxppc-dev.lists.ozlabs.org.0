Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F39B87C7113
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Oct 2023 17:12:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S5tRV6CPGz3vYd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Oct 2023 02:12:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.181; helo=mail-yw1-f181.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S5tR05dfjz3c9r
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Oct 2023 02:12:12 +1100 (AEDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-5a7af45084eso14232527b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 08:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697123529; x=1697728329;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=khfGRdh12F00jlibT3/fQRqCkfRRZuJbfBIrcarozTE=;
        b=i31xemziNEHx7nLF2wqYT7S724Ba2ocd091017mAinzqg7mbqLW8YS8pQX7FWFmuM0
         HbxTMyb/RDCoWWHBHJxuQQ6lJDVIrHGkptfe2IRCZA0TeN40vPvzTUv4/bfu/x010Zly
         3eHu9fwcVD3PXyhbtrA0RAkL4aMHvJpKJUUiMOjKMOfi/U46G+TYmSDIurF+klIHuVfg
         0q3wB39DN3+foGyY8v7eUHmrUDGNFKYjBMPbYqAaBMf2K6iMSzybDeT1GzGNkpcZFTaj
         jt/4aN4xYcnWvMl4kgReToPRW6mW1dfmWxeM4yQya4r1DNRu0YztvmfSwmeVvM20/4zm
         /gzQ==
X-Gm-Message-State: AOJu0YzsQddqQ/7ZnXzcr0VVJHl8iEX/TAHBGzv3wKUdngPVIYLarIFV
	+00bLkqRhS/Cq+LVIM73G22QP12G5eyAMA==
X-Google-Smtp-Source: AGHT+IHbnRfBdrOamu0Gvy+Eh9B2ADvYb66nzpehD1sxcgFndgWbGWqn+5P1ofQH+3C9mb/L8EsWqw==
X-Received: by 2002:a25:361e:0:b0:d9a:6b46:f49d with SMTP id d30-20020a25361e000000b00d9a6b46f49dmr7080583yba.59.1697123529017;
        Thu, 12 Oct 2023 08:12:09 -0700 (PDT)
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com. [209.85.128.182])
        by smtp.gmail.com with ESMTPSA id z9-20020a258689000000b00d89679f6d22sm11616ybk.64.2023.10.12.08.12.08
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 08:12:08 -0700 (PDT)
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5a7be61fe74so13859437b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Oct 2023 08:12:08 -0700 (PDT)
X-Received: by 2002:a81:8246:0:b0:58d:f1fe:5954 with SMTP id
 s67-20020a818246000000b0058df1fe5954mr25609250ywf.32.1697123526926; Thu, 12
 Oct 2023 08:12:06 -0700 (PDT)
MIME-Version: 1.0
References: <20231010155444.858483-1-arnd@kernel.org> <2023101051-unmasked-cleaver-79b3@gregkh>
 <87y1g94szz.fsf@kernel.org> <2023101139-pyromania-game-2237@gregkh>
 <87r0m1fwg9.fsf@kernel.org> <20231011080955.1beeb010@kernel.org>
 <87sf6g2hc8.fsf@kernel.org> <63e57ef8-c9f2-489a-8df8-51dcffd437c6@app.fastmail.com>
 <87fs2fgals.fsf@kernel.org>
In-Reply-To: <87fs2fgals.fsf@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 12 Oct 2023 17:11:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdU0P6H=pAGr_KtmecvNxwDLJXYPRbyyELXaCRhNHgzAzg@mail.gmail.com>
Message-ID: <CAMuHMdU0P6H=pAGr_KtmecvNxwDLJXYPRbyyELXaCRhNHgzAzg@mail.gmail.com>
Subject: Re: [PATCH] [RFC] wireless: move obsolete drivers to staging
To: Kalle Valo <kvalo@kernel.org>
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
Cc: Arnd Bergmann <arnd@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, Pavel Machek <pavel@ucw.cz>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CC geoff, ppc

On Thu, Oct 12, 2023 at 4:46=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
> "Arnd Bergmann" <arnd@arndb.de> writes:
>
> > On Thu, Oct 12, 2023, at 13:47, Kalle Valo wrote:
> >>
> >> Is anyone willing to submit patches? Use wireless-next as the baseline
> >> for patches and one driver per commit, please. That way it's easy to
> >> revert later, if needed (hopefully not).
> >
> > I can do it, I've already done most of the work for moving the
> > drivers, so I just need to split up my existing patch and leave out
> > the bits that get added to drivers/staging.
>
> Awesome, thank you!
>
> > I'll also send Greg a patch to remove rtl8192u now that we know
> > that this has been broken for 7 years. Similarly, I'd include
> > another patch to remove PCMCIA support for libertas, as that
> > would otherwise be the only remaining 16-bit PCMCIA wlan card,
> > and I could find no indication of this one ever being popular,
> > unlike the USB/SDIO/SPI variants of the same device or the
> > other PCMCIA drivers.
> >
> > This would leave only a handful of wext implementations in the
> > tree: ipw2x00, ps3-gelic-wireless, staging/rtl8712, staging/rtl8192e
> > and staging/ks7010. Since ipw2x00 is apparently still supported
> > in theory and was rather popular on Pentium-M based systems 20
> > years ago, this may still need to be converted to cfg80211
> > before you can remove support for wext style drivers altogether.
> > ps3-gelic-wireless and rtl8712 are also still maintained but have
> > a much smaller user base I assume.
>
> Actually I would prefer to remove ipw2x00 and ps3-gelic-wireless as
> well. I have not seen any evidence that there would be users for those
> drivers. If we find out that there really are users I can easily add the
> drivers back. The faster we get rid of wext the better, it really needs
> to go away.
>
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

Return-Path: <linuxppc-dev+bounces-4631-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1B41A00874
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 12:17:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPgyL4w9lz30Tt;
	Fri,  3 Jan 2025 22:16:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.48
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735903018;
	cv=none; b=ixjpPRnOS8b2fsv/UGGI66gj4zw2tJTjSJKzTxVaqP/Xw8dudWgIqXsyzWnWQnPKr5K4JyoQE3y9eGMMvMLoeZGHYH0HxKPtGTCJZTRAIn6Lef5rncOrzh2ZRncNR6IuYKiaLC+IGAEfyJpZq3b6MKFxrwxic3OOHmD0bcVIGMBhyp9+em2eXK7KErG3KhqgDfAq2rRn9MRr4AMU/qNkvM7NUpvbiGoiPh2Gy6/SP9NtGgnQnhr3n2t9SmcKZB4fFCVfaPLz0kmkN0Uz2C1dgKwihFK4DPVRrXxe9nwZICrggjxHZnlFiNeUZXfMqNFakiIQLyjr+CGF8SLWSQe6cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735903018; c=relaxed/relaxed;
	bh=ZmSRcWChTP1b8zCChxx/86+scbNEDzughwHQ+tv0ThM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gcfYzQKj1JL6xmFhpuiJIiexJJlWrzv+11uMq4HV+AS5ESRL2bIj42vJslyH27Sog87ex5EevUHFmSW8vLWp3Rg+vMFaFY8zGFhMUvnDic5WEQI+4BSoq/xbWpepuFKcmXQHeDwUJc8SFoCM1VNcmd7q01Imr+MAyEi/JjLNhv9SOi6aiO0NrAtpwe1DFjKcVOOgLJyWPl8vAlz2rZ7reHGwe/qaTRWgsqn0ofTAh4/qpLftJQ53IvlocHuD3kCNQYOy7jLpVrcIX9CTMnZNPJB9WX8MxZ7YkkZOuVsPIbvruS3JIJPvSoMnWhyc/eSqtjYcPTAJizbY83sVU5sIlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.222.48; helo=mail-ua1-f48.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.48; helo=mail-ua1-f48.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPgyK1fM5z30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 22:16:56 +1100 (AEDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-85c4e74e2baso2181256241.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 03:16:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735903012; x=1736507812;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZmSRcWChTP1b8zCChxx/86+scbNEDzughwHQ+tv0ThM=;
        b=PHlFSlwFM8w49ddDtE04wfO5o90wBT57SJCBRQh5Q1SRDUSzQhHpMR3dRTp/cVBmHW
         HYpqtZFNiB/fb2TO8SKms6B3bziTaTuP8G483dSlY8pYWXBxeHWhUUqkMuggsXlkD+mG
         kwBQ2AvDRSecnIbZRcmR4c7JSPYufYxzNjY0ogKBUejYzCSYpIbLqOuFeE/rFc7az+OP
         unz4ts9vjB5dyx9S1TK6Yy6KF5HCayIRZpldmwo7j7pG5GBiXXWxHQtmgEVGO22j1Hpe
         qvyOu5gxy5UVLK0j2zWNTbvUIwztWsCo+B6PmsdCUwt8D4inoEwRaORj7DUSsQOak+Nr
         kgng==
X-Forwarded-Encrypted: i=1; AJvYcCWzn3idyUEqwJOERvC7tJcwmNmJWGvCCNbweEYRdcSUVQF6FbgpyexJChfMTe4Q/jZCNpft8AoTRaiMXAs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxlkdZnQAO+/Pk7z++nMHObJOzassQ0w4z2JGhoiofnuZvkrzYR
	o5V5RChpwR8Qz4osGhL6QuMytXcn07Ry6hv+acpixfrLDnJa0x9zwWsamySeNuA=
X-Gm-Gg: ASbGncsLXX9yIgn/oytQr2mCoTUh+Oz5zMqJ37BzLEZyLzdu+GkLJaYnprsUe5RMgC+
	8YYPG4TnYwenAlZCOEeWtSz7KtfsQnuPPejI54zDnoYtztVmKmP4WDBHWerTNKaGGyU9IEmmvqb
	jkHYSEHSMcqtqmYJ51GsWDMSMsPIHsUsDGjuQmlxNWzgIE/Rx0f6CgfpTvgTUxgSJROKsumGari
	sALYPY2dMz/R9M7sLoAtvorNWq0a5Q6jkL0Oj152V0v/lddONf4/CygcfMKgPsEr4b/WdHg2LfZ
	HHYfNJdQgiJhimG25Iw=
X-Google-Smtp-Source: AGHT+IF4ZCnny4yunKY17brN/pZ9TLQ5fGV9nZF7FGBfZiJSNNFmDKRT+8jvCzD1Cl/YxXPMSYx/6A==
X-Received: by 2002:a05:6102:4188:b0:4b2:4950:16fc with SMTP id ada2fe7eead31-4b2cc399b22mr36287124137.14.1735903011631;
        Fri, 03 Jan 2025 03:16:51 -0800 (PST)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-4b2bf9a7155sm5522151137.11.2025.01.03.03.16.50
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jan 2025 03:16:50 -0800 (PST)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-4affab62589so3187096137.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jan 2025 03:16:50 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU6II8Tf5geDWAirI6ujxaZIePyeIJxT1aU3VtBY0j4mK+Wch/yRNKfQRntBklgy82ML+NtTKH6iaD5qQY=@lists.ozlabs.org
X-Received: by 2002:a05:6102:3e83:b0:4b2:af6e:5fef with SMTP id
 ada2fe7eead31-4b2cc35c2d5mr38018549137.9.1735903010498; Fri, 03 Jan 2025
 03:16:50 -0800 (PST)
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
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com> <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
 <8dfe122d-ce0e-4a1d-9a2f-f7585036b989@gmail.com>
In-Reply-To: <8dfe122d-ce0e-4a1d-9a2f-f7585036b989@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 3 Jan 2025 12:16:38 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX_P9WGBiShm6Dp64Y9GRvESH-Nn=b=rRrsGbwza81VeA@mail.gmail.com>
Message-ID: <CAMuHMdX_P9WGBiShm6Dp64Y9GRvESH-Nn=b=rRrsGbwza81VeA@mail.gmail.com>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver
 using deprecated API wext
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Geoff Levand <geoff@infradead.org>, 
	Simon Horman <horms@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
	Larry Finger <Larry.Finger@lwfinger.net>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Pavel Machek <pavel@ucw.cz>, Stanislaw Gruszka <stf_xl@wp.pl>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev, 
	linux-wireless@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Stefan Lippers-Hollmann <s.l-h@gmx.de>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Philipp,

On Fri, Jan 3, 2025 at 12:02=E2=80=AFPM Philipp Hortmann
<philipp.g.hortmann@gmail.com> wrote:
> On 03.01.25 09:53, Geert Uytterhoeven wrote:
> > Care to tell us where the fix is?
>
> please find all patches for T2 on this page:
> https://wiki.t2linux.org/guides/kernel/
> More exact here:
> git clone --depth=3D1 https://github.com/t2linux/linux-t2-patches patches

Thanks, but I cannot find a ps3disk fix there?

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


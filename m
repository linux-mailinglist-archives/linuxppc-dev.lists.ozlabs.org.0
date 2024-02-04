Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A043A849076
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Feb 2024 21:48:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TShS84kl5z3cnR
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 07:48:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.180; helo=mail-yw1-f180.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TShRf6v2Xz3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Feb 2024 07:48:13 +1100 (AEDT)
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-60406da718aso38135307b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Feb 2024 12:48:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707079688; x=1707684488;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WuZCS9y13xUQN18d8Gu/e8RowOQI4ytQlPYFh0yEfC8=;
        b=LTA042lpMxiWmaTD8QzKK/CVJuWqlNEfUv1Rff7mqVX3nQt0t1UmmauUU5UF8jbUYi
         WrrVIXGENS87nQ0KMCy7Tn+1Ivxi2d/S9ta/TG64iGS0DpDWEoTJEIN5H+LDlb3lDtfZ
         yvqf99WcqRJkTmY+bjvz0Ck9VnPfqCkcbGHBo/hQ+ZzmZ+c2mbtOlmtCfaBbtfwVY6m9
         3SDKmtYa7x6fwX9ZvPVzGCJkcW/qKnwaHxm0uZACM/7sFQbYZS584Cf0zg0pkEpPaXrI
         6BB1QKUSt0Blz7YG8SAEYyHrUvjqs7c4p3Q+1s6S4wWJFzo/tkbVrKeKm0REVkx9Bsmx
         cldQ==
X-Gm-Message-State: AOJu0Yx9cxei2O6yaVo0AukHoay7HdX74UDyYoI/6sb2fgfVvI6s+v9q
	xAzPRD3m0qqt/DQA42GuRxzDQu9shDT9Iw1zGZ1gwCK4zmO9npmqfdn1lDlKH/c=
X-Google-Smtp-Source: AGHT+IFI2oIxr2Ry52ZKSI2lnL9/+23IDtg7CuJ+TmNbg+wy3f0yXOBGBMSAsBb3sYaSg3mu/hP44w==
X-Received: by 2002:a05:690c:fc6:b0:604:4597:b904 with SMTP id dg6-20020a05690c0fc600b006044597b904mr1458904ywb.31.1707079688205;
        Sun, 04 Feb 2024 12:48:08 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUNQJn1yPX4wIo5hiwUUZtIDsLpdE3jDcTzpTTbhtyC7piWT7q+IVskfZnAHkbsvXYsjaAtyDx2L55wOPTvirZphY1V+BKpjnXET9VrPA==
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id fl1-20020a05690c338100b005ffc15cea80sm488619ywb.26.2024.02.04.12.48.07
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 04 Feb 2024 12:48:07 -0800 (PST)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-604123a7499so37224837b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Feb 2024 12:48:07 -0800 (PST)
X-Received: by 2002:a81:f205:0:b0:604:3ee2:f258 with SMTP id
 i5-20020a81f205000000b006043ee2f258mr4071749ywm.45.1707079687488; Sun, 04 Feb
 2024 12:48:07 -0800 (PST)
MIME-Version: 1.0
References: <20240204-bus_cleanup-powerpc-v1-0-c763f0e142e9@marliere.net> <20240204-bus_cleanup-powerpc-v1-2-c763f0e142e9@marliere.net>
In-Reply-To: <20240204-bus_cleanup-powerpc-v1-2-c763f0e142e9@marliere.net>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 4 Feb 2024 21:47:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWmFZjWK483JhAuq1GTk0GOH_urRdWdxSB9EwR+YNaqww@mail.gmail.com>
Message-ID: <CAMuHMdWmFZjWK483JhAuq1GTk0GOH_urRdWdxSB9EwR+YNaqww@mail.gmail.com>
Subject: Re: [PATCH 2/4] powerpc: ps3: make ps3_system_bus_type const
To: "Ricardo B. Marliere" <ricardo@marliere.net>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Geoff Levand <geoff@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Feb 4, 2024 at 3:23=E2=80=AFPM Ricardo B. Marliere <ricardo@marlier=
e.net> wrote:
> Now that the driver core can properly handle constant struct bus_type,
> move the ps3_system_bus_type variable to be a constant structure as
> well, placing it into read-only memory which can not be modified at
> runtime.
>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>

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

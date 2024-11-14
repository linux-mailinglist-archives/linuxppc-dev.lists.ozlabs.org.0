Return-Path: <linuxppc-dev+bounces-3237-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85DDF9C8FE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 17:36:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq5PN3wLYz306S;
	Fri, 15 Nov 2024 03:35:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.128.173
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731602152;
	cv=none; b=F9OnATtLVpDHSExDQXXvYOrRwZaQUREbtCY9LH4n7T0ASlkcDJA1HHWE/u4dUDnQ1v+406JSq0dnLnI5oKF9Q5vtQCPikbfj0pUDwZUg3wvKURAbKvfi093T/uR1dKiFTa4hl1MIZQ3vsaIbv5mcBR+Pjp6/WtzDhXlRHA5ponpZH94UEDJST50gmW6Lz4AB+Y+cwN8gB8Bmn7fZAfUvIxnaDseGBOIohqHdHJ60ked5kq7hZRAxbfBNQcMQ4zp1EphAA4WqfrIpn0Iq3wcZd+6zkMvWu38LWIZWsRNiXzcpdmjG7Ex1K5uy+Skqa0p1Hgd3M5dGMyekpv6CvWx0/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731602152; c=relaxed/relaxed;
	bh=IkTsD4p17KtYX2Naw41InyqJWAq7hOuOapsF7fXl/og=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a4k+YMhR+uJf7pAmZwNbWghIts/Xk7R5+TH42HIwSyBMkLY4kjXcygJBnit8D8vly/z8gI7uXrR4rpVb7Ck4dnE7T+JQutYDHooBIToCexhgIsrzh3VmWRBvP63qc8ln06XghjFlhC+PgMc36OsW+Iz+Yn5HHsHxO7gKz+NRiOa+VK+RdZFUm3zYx1kV+CvUbC29ggIQx5gpu9vOZuiALmAHLzuwve+P0+sF8FhwkSCm0QT8TJMXpYMJ0pjA9ghaKs3MHTRVm0Y6ljcAOw9vC/JD64/Wh8oAv9lJXSrypW9+LxsSt/jc/C9Hz5v8VRB4lVlOSgQMFgOBP4/iMcmX/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.128.173; helo=mail-yw1-f173.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq5PL6B8qz2yyR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 03:35:49 +1100 (AEDT)
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e9f69cc576so7216667b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 08:35:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731602146; x=1732206946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IkTsD4p17KtYX2Naw41InyqJWAq7hOuOapsF7fXl/og=;
        b=ZyP52Qjru+rwBjRgmdxAhyEOlddRmoa8sWKNle8wfXcCcTQZiNLiJ0wDTxaXYdUnv3
         PbfcAbWT0aCiQD2pfDAhDDNYzIWABe2ktH7Ya6rFcowQhwOjSaExs5V5sYkbrJH0ryxw
         pbTogFOSWYtVKWsFlxp40GDAtlZwIPyO3Oy/zujzqdHjLBS6r5+zbIr8jOihU1UGIvu2
         66deLtT/+gh5m74npHO1iy4OnH5tloyOjrPzreMjQ9of2P4C7jBp9OUrmBo3KvfC9EbG
         dVFV535iYiZ9znQBH96drkmB9YiUeQbCvkNAonXIFVGdNT1pIr6h2KJwfv0fXV8D5KlT
         C7sg==
X-Forwarded-Encrypted: i=1; AJvYcCWhHOognRZZSoenLU+RE7QlI8i2DHBk0vm7t0LSw68V/9GKa7zzW3zevIFo9K3PH8fd0ATPQ57idtZzP9s=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzg0cmMm4BI09Kan0DBijkFvatOECLfewwiMsNoSKBy0NjXMOuG
	9f0fBa4izAbCJHtlA7u9xxsMTqM6wjXErvhcX1sZPek81b1WJpttGB+r6oGN
X-Google-Smtp-Source: AGHT+IHXDsp7DNwRgaGkNbDCBC+MtYyorlkvZwwrjokMmPaxWaqZlqdNWTHkGpPmTYgjtTms3F1AJg==
X-Received: by 2002:a05:690c:6502:b0:6e7:e493:2da8 with SMTP id 00721157ae682-6eaddfd101fmr267907147b3.36.1731602146270;
        Thu, 14 Nov 2024 08:35:46 -0800 (PST)
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com. [209.85.128.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ee4441322csm3073057b3.91.2024.11.14.08.35.45
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2024 08:35:45 -0800 (PST)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6ea7c9227bfso9458457b3.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2024 08:35:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWApGHWEzd0W5CtZ7/qE5nUNrCbGYR527LppPisgTo6X2AbrV9Y74O/A4k1NZugwmOv9ymavEPZxp6DtQc=@lists.ozlabs.org
X-Received: by 2002:a05:690c:7487:b0:6ea:bfbd:5511 with SMTP id
 00721157ae682-6eaddf9703fmr271941207b3.33.1731602145354; Thu, 14 Nov 2024
 08:35:45 -0800 (PST)
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
References: <20241114131114.602234-1-mpe@ellerman.id.au> <20241114131114.602234-8-mpe@ellerman.id.au>
 <ecb9d449-85dd-4ca5-a58b-43244b7c0765@app.fastmail.com>
In-Reply-To: <ecb9d449-85dd-4ca5-a58b-43244b7c0765@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 14 Nov 2024 17:35:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUxY7YErDa8OzxemnwJ=j+tcoXGs-Gma+eD0i7bPWYB9w@mail.gmail.com>
Message-ID: <CAMuHMdUxY7YErDa8OzxemnwJ=j+tcoXGs-Gma+eD0i7bPWYB9w@mail.gmail.com>
Subject: Re: [RFC PATCH 08/10] macintosh: Remove ADB_MACIO
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=5.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Arnd,

On Thu, Nov 14, 2024 at 4:42=E2=80=AFPM Arnd Bergmann <arnd@arndb.de> wrote=
:
> I also found the promotional video from 1996 at
> https://www.youtube.com/watch?v=3DNrvrIEPeSNA .

Amazing to finally see this, 20y after mine died...

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


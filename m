Return-Path: <linuxppc-dev+bounces-6435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D16A42F97
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 22:56:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1vhC64xTz2ydW;
	Tue, 25 Feb 2025 08:56:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740433770;
	cv=none; b=BDVK11G6Lacaa3XHRMjMWCcGNyVJs+UREkI2T8NDtBX22CFuvKRNy+SSjbth8sSfUX2RMqhkIH+rKv7HGjaVvJ9XCiGnfFmve94bdObjFGc6tMcGnLAP+fVoLxs/uBi5j5dlXoEalZaLrRyXcAMg3v6n0uKVGQ9tj0nvZe0Ju8G6qeG+g4tKZUgY02gaQ/1Gw3kEqJYBr6V23Qma22V83npC/2kdA0KUJMhBV/fpY1VoHhR95dZcq84jdosWPYmk6Hy/NAvsljigFnPgb5YUYbpcmoXHtTarkm/mm1QnygcxJOrnNCilxdlmWjhI+/txN89XvL8Zwxin5FTaSPUnrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740433770; c=relaxed/relaxed;
	bh=P47b/dtjhtFriTT7t5XplkIRw7292i/HwH3cMz65lgM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LPxW6X54/N0qmD2DYgHu9ocL/T1caiPI33YkK5WLd2rzNwb5VvKPkezo5UO5O2OcZiGMsdjMxBgOwp8UXmR/cwPNF/HpDorUkaqYcMKKMx3JWiXkwwr7kkAyn8bEJR1TM518vd8ekG4MXXjpgvpJRqYyWHK7o9WGH42KjzfoXv8jzfV4dnD+AV52j1jRdWDBx9vD2k078kNvGbe8iijC3Aufc1/ot5mHyrluX+vrc6Yalm/FC/dqlNkCVyFZYMfeVlcgKPqt3tXbl54XvX3etcE3SGAUlKQCcTN/HxdQ7j8j+udoTdj+syv2ks2xT7Anlh88vlQdiULIIQz47wj3IA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gompa.dev; spf=pass (client-ip=209.85.208.41; helo=mail-ed1-f41.google.com; envelope-from=ngompa13@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gompa.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.208.41; helo=mail-ed1-f41.google.com; envelope-from=ngompa13@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1vX852dtz2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 08:49:27 +1100 (AEDT)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dec817f453so8149732a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 13:49:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740433764; x=1741038564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P47b/dtjhtFriTT7t5XplkIRw7292i/HwH3cMz65lgM=;
        b=p4j4tiJYL5Xd5vy2cScMJdQ6Dw8cRhSx78F1gnetz0b9GuL1rck7HDXRYEJpHlUQdn
         zlrvBWYVKYMgvO9JpL1ZqsO8z7d9RvG9y0++nRmZwn6ZwcQcvpMjdKQUL54V+CdnJhj9
         +HgKmgCGkjH3r8SaP+fjdKy88WVidb7OBmAd9YY1Btygt14FvVW+URf84uqQG9xgHts5
         vkSAfxDmymVCGEQoIh8uR542K6sC5slROeb+Z350js2ti7SdhP8psrD2aXIIQQK84qOD
         E4oKeGJaO6uJHyTQUvj/Tt1omnJCCd/4i4X3WVmQGXer/ttspcnSomalCs0OzqDAFDZV
         nhTg==
X-Forwarded-Encrypted: i=1; AJvYcCWMS3TLrSidgcJavjsT2Knih/aX5LTCAN/FpY3uWwYHeIlVg790L6uRjG6/xTvelXKduQZ0xKpJUxNC1eg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy4UYd2a4LPDaiw9ZmYPx/SwLPydKVHQHDX22Me3rQfX8fzLlFj
	g3mTdnOdeb+JBbkfAErqwy/oyeJ1ftBPXZg//7qES1njPJwqj44M8wcq9OaxaKU=
X-Gm-Gg: ASbGncsCIwZo1Kr/oGk1M5zjEfN7lh016qHdNth9+0p8BxSXyF7memG8XzmdlDQB1iv
	qBXYx0M/jfPXOCD+kX9GWLkh5NlsoglrQJYn8dQQVESm60cHwIlDyDGgaFB5kB7VOp+FNd1UCgp
	2c5W785/8EmcZkdCb6brEVjuGlrNsuTE6Ka/nlZXYY51WTV4odgjfsAq/NzYRyEBkHVXJ702nco
	BIN1yXUjfZV6A7Hs7yreW7ahV8LwVVOGtqxHBRRg9R13JZ/KrQMsvqQdwrz0P6EuKtCt+/rf0tN
	BUaGBTvFzCSVNyKnvxZopdp4z0/K/zDq16snXGNKziuFgiyJq5sy0QBo
X-Google-Smtp-Source: AGHT+IH/u6xXkMbURtI0Bi7gZipVZHfAl8hLXnT21pP5N2ecHqudtq1q6M/PhIxwjQHOxxy0qNA59w==
X-Received: by 2002:a05:6402:2682:b0:5de:dd31:1fad with SMTP id 4fb4d7f45d1cf-5e0b70cd051mr14906224a12.6.1740433763518;
        Mon, 24 Feb 2025 13:49:23 -0800 (PST)
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com. [209.85.218.42])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e460ff84cdsm191922a12.60.2025.02.24.13.49.21
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 13:49:22 -0800 (PST)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-abb8d63b447so633072766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Feb 2025 13:49:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXgsLeoEy5qUY1PZGQOV3bEtAWZaMM+mXZtCA+hHVnjY/SpbMgz8vrrs3EzUDoSBXS0ujQlkZ9bExMhzrU=@lists.ozlabs.org
X-Received: by 2002:a17:906:308c:b0:ab7:ec7c:89e4 with SMTP id
 a640c23a62f3a-abc09a0a2c1mr1144051266b.21.1740433761758; Mon, 24 Feb 2025
 13:49:21 -0800 (PST)
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
References: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
In-Reply-To: <20250222-pasemi-fixes-v1-0-d7ea33d50c5e@svenpeter.dev>
From: Neal Gompa <neal@gompa.dev>
Date: Mon, 24 Feb 2025 16:48:44 -0500
X-Gmail-Original-Message-ID: <CAEg-Je_qBWhfdzdgR=uxjR6kCM-p-N6OvhOyjG_YpWfc9C-kUQ@mail.gmail.com>
X-Gm-Features: AWEUYZnTgmy8Wh3cNs6Z5TiDd6mBDwseYtK_5ZJpLXo_D79Innf9WD-b_IfXjLU
Message-ID: <CAEg-Je_qBWhfdzdgR=uxjR6kCM-p-N6OvhOyjG_YpWfc9C-kUQ@mail.gmail.com>
Subject: Re: [PATCH 0/4] Apple/PASemi i2c error recovery fixes
To: sven@svenpeter.dev
Cc: Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, linuxppc-dev@lists.ozlabs.org, 
	asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Hector Martin <marcan@marcan.st>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.3 required=5.0 tests=FREEMAIL_ENVFROM_END_DIGIT,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, Feb 22, 2025 at 8:38=E2=80=AFAM Sven Peter via B4 Relay
<devnull+sven.svenpeter.dev@kernel.org> wrote:
>
> Hi,
>
> This series adds a few fixes/improvements to the error recovery for
> Apple/PASemi i2c controllers.
> The patches have been in our downstream tree and were originally used
> to debug a rare glitch caused by clock strechting but are useful in
> general. We haven't seen the controller misbehave since adding these.
>
> Best,
>
> Sven
>
> Signed-off-by: Sven Peter <sven@svenpeter.dev>
> ---
> Hector Martin (3):
>       i2c: pasemi: Improve error recovery
>       i2c: pasemi: Enable the unjam machine
>       i2c: pasemi: Log bus reset causes
>
> Sven Peter (1):
>       i2c: pasemi: Add registers bits and switch to BIT()
>
>  drivers/i2c/busses/i2c-pasemi-core.c | 121 ++++++++++++++++++++++++++---=
------
>  1 file changed, 92 insertions(+), 29 deletions(-)
> ---
> base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
> change-id: 20250220-pasemi-fixes-916cb77404ba
>
> Best regards,
> --
> Sven Peter <sven@svenpeter.dev>
>
>
>

LGTM.

Reviewed-by: Neal Gompa <neal@gompa.dev>



--=20
=E7=9C=9F=E5=AE=9F=E3=81=AF=E3=81=84=E3=81=A4=E3=82=82=E4=B8=80=E3=81=A4=EF=
=BC=81/ Always, there's only one truth!


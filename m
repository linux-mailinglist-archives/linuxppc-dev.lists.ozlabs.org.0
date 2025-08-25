Return-Path: <linuxppc-dev+bounces-11254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE5BB3403D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 15:01:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9WBr2sCRz3cjR;
	Mon, 25 Aug 2025 23:01:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::135"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756126884;
	cv=none; b=Ldw5XxpE6nZC20NxVdviQAbXkuQzaDhXJ5W+obe1okjWRPkpoyHqQMK8K18tzDttxzyyuZfEb4qtTUEwopO4B66yxg/nC6uEC7FEHJWMP7jwJIyXIlcW5AwldImVJ+Q5YZp6KbWtd3lopUL24y/zBpgEP+kYb2d7LNZudDnyMvQpd80wh4kz8Po3/Rrj5v8gTmSMHIDk7Dlf77t3HP5nXuDZfTVnERfWi9HiXeP0mzDep5denUemlnrYzCuyb5mWwHSGtXf77AllT6qFgq5NPmdZY2eexo2delbFCHrS1yij8QC0KXs20Ov/qdQOeHl5KrqIwO9n5+EeyvLkGWEupA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756126884; c=relaxed/relaxed;
	bh=dQlK3wXG7sop1i8Jgraua6l3U7jzqZIBJa/jEdUPy4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ANH8YM+b6RYcDp09sgB5jK3I1N3WDPw+BccwM7jSQgDgwRX9O3jitIXJLq1lQvR2riO1QadLBbGANBZEOkXoeC8OUtSWFfvkIS5N7PIzGKIg5M6rByxP1eR1Al72Z/LSpbnI+CES5QwAHzn6j/qqK44nXbtZH5TMR2Y/YZ3rYk1qTtBzdl8Ew1IA4ewv5pBXle/qOLAxK4Bci0CitYTOtD2aTb4XobuhWd7PuDsvP7KU7uijJwpk6O+EKhKYxqIf7ldFuAzj/+U177s2kQ19HogqJrCXs71DM2JWGiPHyaMx+XoZGfih1GBjzqvsZ+bKBjJF0Dl86Mu36SqaYMX50g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Qb/qqfG8; dkim-atps=neutral; spf=none (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org) smtp.mailfrom=bgdev.pl
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=Qb/qqfG8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bgdev.pl (client-ip=2a00:1450:4864:20::135; helo=mail-lf1-x135.google.com; envelope-from=brgl@bgdev.pl; receiver=lists.ozlabs.org)
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9WBq3pQmz3cjL
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 23:01:23 +1000 (AEST)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-55f3ec52a42so1846659e87.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 06:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756126880; x=1756731680; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dQlK3wXG7sop1i8Jgraua6l3U7jzqZIBJa/jEdUPy4M=;
        b=Qb/qqfG8H+AChOT/JyjlaGu/r8SXFzBeeByhwIbN1jQOeahvGE/tHdJFeWbNjoCVQX
         F7XNbxW/BckIDa4RFe6sFNvG4Z+TWLxo59ukw0VCPYxSARwIjO7aR519IxcoR7C/hHF8
         09chBsfcMMQX4TtJmxy65/FbYemo5MuLqmKjL5sSGCu9iXA78tLKNhQo1UtpuSi35Lvn
         mawtGlgIn9ZeLX+v0wkohnunOGCQT9lX0DVRkiQDJ3+BEp/BMrtJmOuPwnY0LhVYhK20
         Ym5RMYn0zPv1wiMmk1NpSC7XMNICj+Lw0ljyxkpVqpHeo0D2VwI9b5Tih80EMdFvl91H
         6iFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756126880; x=1756731680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dQlK3wXG7sop1i8Jgraua6l3U7jzqZIBJa/jEdUPy4M=;
        b=tsEEFUGpvHSGUrvMIrQFlq8HIJwFwgEOmUtlceThpn310n/ibOm9Rvi5RzGuiatwDj
         aYtkaIL5cbS/3NwHwGcTzC/Y3TMmsvqXdtNHPLSu21fBrFKmWrnf05m8oDT9HjMRNJw+
         eDaBwezKae/ERu9DcX1K7HXFfH61izIreOWDSBytpQ0CrvhFOjhgXEvPpKEp4ecgmPMN
         eGqzO0KgINR4thb9lrwM+rl4HvQysQ7ecq5SDm/Yo2/ajLgTwlV0WL2S60M6nI19atcI
         tyOB2qADgc31BR8Y69UR4LruBfUOTk0RT5bhYtdnyFPPSwrUgCU2wD0bRXnIHQOhduoW
         2NBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXelnFwgh6tktOfvAR7jFVgWAdM8fXfW19Bn1g7cku2eFIHV+Ooc5NlUXTWYVe9NTQm2MGtJIohPK1HIBs=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxocOjSqmL54w6f2b5ZDJx+LX2yJBqwWlrY/tEXpB8JskAGeZq8
	FuJS2DXeCUtZU0VmjYxWXLu6j1++kAYRpNsaJ53ASf7QCAGlr/jBB33arWhZgBsdcuCs5+jAs4O
	TYip7h/K1Wu+CXVgDmkKB20TxDRQFetsxdQhWLGbLgA==
X-Gm-Gg: ASbGnctjcc3Vpc8M8/ptHICbnZu11s8Mj2kP4OqtQhj91F0K+xiw5x/Fa2Wz2QUOr4x
	mlv8S9hh7ZFPLzqDas1mbr/+6artzProKrBzVpmBiaIgHDUQ7vk3SFJC7RlPZr0jviJogGWh1Q4
	uNT+vHINGf2Qpj0l/d570wIvB+LbAiHACb77b5SZiY8azBNO5LYYHrDpC792T4vFuZDVFnLmnyM
	5RvT0XW9fQWb6jkH0Dm3pcQgaMTnG4KZMpl6N4dc7C+C6/XXW69xYjM1MAw
X-Google-Smtp-Source: AGHT+IH5N5gh1e2Wid0aMR0FMRyM9pyDqp/u65+mskc935zM8TPlDDSTI+H4ckU5CTPXH5byLfWl83YU1oyPWy+p/Uw=
X-Received: by 2002:a05:6512:135a:b0:55e:11ca:1549 with SMTP id
 2adb3069b0e04-55f0c6b5589mr4032238e87.19.1756126880025; Mon, 25 Aug 2025
 06:01:20 -0700 (PDT)
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
Precedence: list
MIME-Version: 1.0
References: <cover.1756104334.git.christophe.leroy@csgroup.eu>
 <e05a0959d794016bde79e48e25ff71253cf51aae.1756104334.git.christophe.leroy@csgroup.eu>
 <CAMRc=MfPTtdFtE63UKfbuK3h1mLEk2aUGazBsbRS-OLZzm7e9g@mail.gmail.com>
In-Reply-To: <CAMRc=MfPTtdFtE63UKfbuK3h1mLEk2aUGazBsbRS-OLZzm7e9g@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 25 Aug 2025 15:01:09 +0200
X-Gm-Features: Ac12FXwiA1VNOuENMZgX8e0TVhBXubdvgS_jWd_PUQ_1hAXM92SKRJ_pWmQYzEg
Message-ID: <CAMRc=Mcsvkt1OJfVmB2peQJPpEKqFJ=6=86m=fd+VOEoMGf8Yw@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] soc: fsl: qe: Change GPIO driver to a proper
 platform driver
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Qiang Zhao <qiang.zhao@nxp.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 25, 2025 at 2:56=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl>=
 wrote:
>
> On Mon, Aug 25, 2025 at 8:53=E2=80=AFAM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
> >
> > In order to be able to add interrupts to the GPIOs, first change the
> > QE GPIO driver to the proper platform driver in order to allow
> > initialisation to be done in the right order, otherwise the GPIOs
> > get added before the interrupts are registered.
> >
> > Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Hi! I retracted my review tag under v1 because...
>

Ah, sorry for the noise, you did that in a separate patch, please keep my R=
-b.

Bartosz


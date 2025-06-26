Return-Path: <linuxppc-dev+bounces-9809-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04EE7AE9CFA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 13:58:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bScdm2KpXz2xRw;
	Thu, 26 Jun 2025 21:58:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::12d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750939100;
	cv=none; b=gSdG3wP/ExmrO4zcHTfhZgCzSiIKUqLCz39k8mXxfRx0S0p0fHZz7j0BnZGuh3VuMLJcOepPQtxYDixF8mzCKDZdSbSwoZHwvDqbWNLyHvyQe958UZ66efuCktVC+yao5+GnQHkiayu8c55HVcVjWwacNa758ZRhurjWoJMNOLDJY4F3azyElgNGrhrgFgb6CRP/FXbYxOm3IvKyuvWDZ7nmgSjccQvBlA087TKKWGRfTJTBwpTVcMWcOK0ajSpPccNmHgkJI5zqtVE0SYkvRiF6RGqcYTZBfySlJHbIKzwT8CF58PNBl0fAgw/04ifizIDWSjDfJ4PArlNWN2zItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750939100; c=relaxed/relaxed;
	bh=VlanypWYi6DkuZeH7DXWPijDtve33MpM2UftEXp/Xnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EUMqs6k7eLSlE83kajubtrq064/cpkhoI7++fu6JVPX3tiozrSRDZSjCvE6BC4VpyxKzyCLc4/bhWwbChTiu9h6LkjGwlyqaG3jfsxJs/T+yUujlRahiBQBFr/Zn0AjKp8zfaqOZ1iXADRpcM/E6kEVmoHs6yFuclNCDf32v/ToI8Sxezmge0EmZhAUVrLm8Cl3RG4AftNsG0cuD4KozGMCFOfbAfKmR4ET29Hr8P4mGgcb2jyrvWAzNtW0c6YAi0eByTDoqZypt1kpmKCCTsLs4f9WDQdQQHbvXwqE6KHCHb1mA70sXCuCtuuB0VqQi1RePDWScS80z5eovoVKodw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V+4natmc; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V+4natmc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bScdk4sxTz2xJ1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 21:58:18 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-55351af2fc6so938078e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 04:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750939093; x=1751543893; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlanypWYi6DkuZeH7DXWPijDtve33MpM2UftEXp/Xnk=;
        b=V+4natmcZIX/Y9+KxGotf/+sSMjaD00iTMh+BPu+i89mNgXhOoS5580wq/DemG4J8g
         Lp6gMJuHSbL4ef7siFsed6Q/fmi5ldG1Vj9dlHTkj0Ymqb49halmp2mtSgLoxiyv6fU0
         37DAd5OtL6x6neV8yG7YU6ecOKKkRFZjEYbFOiP1dj3up7eW7lGlB8vIUPZ1p81JKbqO
         v3kWaTBM1doSZj2KVRlqNuHZ/lXCCF6yrI0ctKHjAskAm+dbWlEY9SciGz4jFzqTNtzj
         9Xfv/NocxRLdA/GM7z8jt0UAV93EGoOLnX6BRpuSsjLT8wKt77JDjSt5Kc7X2NIs6OY2
         xyvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750939093; x=1751543893;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlanypWYi6DkuZeH7DXWPijDtve33MpM2UftEXp/Xnk=;
        b=XeNFwcI+MoiJuM8OL/piCs+iqzkmo1r9SHKmRWG0D7X91hB8m7CriVC8ACWnNiIDox
         3e6cmiad7qJwPhdPRmmsf8vAuFINClPBSR4w0vxeArvrMR/e9uWUxMmajNEr4hMj67xa
         qUdSFtsFNOnCvldCQGceDJcXeSiQtD8f6wQ+b882mGaow+2yj+Lk+KzBS+5lSDiA81Za
         iBUqSTeNu+CEAiR33FxLTuRrhgXwPQb+hnDSah+c136uN1068z1811QQXuQ8Thg0hBYg
         h4fxnrbUKVW77Yikqh+503ZCoXS4glLGOijgg9tjU9Hb+giltoCVykQqlK4BoNJ+0yk0
         G/Qg==
X-Forwarded-Encrypted: i=1; AJvYcCVROSt9kjVg9rrm0AJ12RkQuRfBvFLLs9IFlfcuipYOkbrHyDnQFCtID/QB37p8SY1QoLaVPXpEmYl4uaI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzCank8aiukWFAEvD1e4nhKZmGQb4Kpw9xS56OHo2VjuiX9UZkq
	gSvPG9c4ax6MCZAtWWg4xw7XSb9db5FZ2it7wQ0NhtLIUjc3qVO4EK+7XiHeLlK/NwPJjpvc3qe
	NSWh1MvNqA6HX1FVlNgmbImEuugWPhcU=
X-Gm-Gg: ASbGncvlmCrzGXdPoegusrHTBrXTrzOkquMgl0m+QDg85dfTLxCLeJiWhqkFZxptEX3
	zXucoVHJ+lpUEkWY43WUjNrsVjUk8BietXadw6/vi6YWz2oswm7m08H1epmWkzCy0z7PpbE9kmH
	4HhrgnWzTFVrM8rHgNe0xhQg1Y8ISL79P6c7kFuyc+UJGjhxWN9TKBia3KUoz+8EvKAViYzT/Kh
	Xw=
X-Google-Smtp-Source: AGHT+IGvTmFBk5nT2DVIEmz05QGopwwqxq0TAa5dvxo3BGqE6HCnql9lFMU54ewp377mYOo49nC8A4/0Gx1muG1AmSU=
X-Received: by 2002:a05:6512:3b22:b0:553:3486:1d9b with SMTP id
 2adb3069b0e04-554fdd2e9ccmr2177274e87.30.1750939092502; Thu, 26 Jun 2025
 04:58:12 -0700 (PDT)
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
References: <20250626115218.141874-1-arun@arunraghavan.net>
In-Reply-To: <20250626115218.141874-1-arun@arunraghavan.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Jun 2025 08:58:01 -0300
X-Gm-Features: Ac12FXwhZEuK0fXt-9AZx9DOhPYa85XcfkJGgo_W0bWwT9VIbQev5B9sZrKJyn4
Message-ID: <CAOMZO5BgsU0ijdoaZs5e=qwb2PYZsEnx_RxfgQ+dosL8hPRKyA@mail.gmail.com>
Subject: Re: [PATCH v3] ASoC: fsl_sai: Force a software reset when starting in
 consumer mode
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pieterjan Camerlynck <p.camerlynck@televic.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Arun Raghavan <arun@asymptotic.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Arun,

On Thu, Jun 26, 2025 at 8:52=E2=80=AFAM Arun Raghavan <arun@arunraghavan.ne=
t> wrote:
>
> From: Arun Raghavan <arun@asymptotic.io>
>
> On an imx8mm platform with an external clock provider, when running the
> receiver (arecord) and triggering an xrun with xrun_injection, we see a
> channel swap/offset. This happens sometimes when running only the
> receiver, but occurs reliably if a transmitter (aplay) is also
> concurrently running.
>
> It seems that the SAI loses track of frame sync during the trigger stop
> -> trigger start cycle that occurs during an xrun. Doing just a FIFO
> reset in this case does not suffice, and only a software reset seems to
> get it back on track.
>
> This looks like the same h/w bug that is already handled for the
> producer case, so we now do the reset unconditionally on config disable.
>
> Signed-off-by: Arun Raghavan <arun@asymptotic.io>
> Reported-by: Pieterjan Camerlynck <p.camerlynck@televic.com>

What about adding a Fixes tag and Cc stable so that it gets backported
to the stable trees?


Return-Path: <linuxppc-dev+bounces-9813-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B03AE9E4D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jun 2025 15:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bSfGr1hdMz30Ff;
	Thu, 26 Jun 2025 23:12:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::22c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750943524;
	cv=none; b=OtcBJxxa6fy2A2KYmr6XWq1h/JjQ9sWeiXtLM/igqtPxrCI4oo24lNZP2oRYU8+WhBpCyHggqishleNr7qDYO7gQfWjVfaXiag865eWHVcfdagFKGeUxyMruLDiIw+bWXnhBFn9K7OiHXiDR8hreW5tltCuESVe6osMsDtvGGjCWtfr1YdIhOLPg5eHwsP2MCGqgtis4i401XBH7dIfYSyKmrcN9U+jOHBtugC1IYO05v6Wv+RaMpbLYItIvPuDEUziTT87oUrnGDrC7e1QEdIXp3PQdgl7YV8UsaX/ikndCrtpY3RAcE0GwobsADqamlIZOaTE1OCVehA5MG4/2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750943524; c=relaxed/relaxed;
	bh=MCwjJ5Vu59NECXROlgdeWoW1Ipr9KsqQJuNVbzIMvIM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o17JelIFJEmxaS5oxCYfQ48+yB9UkHuUbe7EzrjU2c8N5+/CVlDImII6H+q2GZG7QQn2k1oNe0Yqz+b1UQ2Co1J6N/HKPLUbALU6iVIfDcfntTIGmZkP4scDjDuG8RdtNmesUII2iZUh8E4UVsLfaISNfXHXVNwKw3GeLBR7WSIQ2W0U8jB01I/xro4xk+rFh4kok46zm36Muo3vh56D5p6fLpCUHCuRZVYtEv6m+pqAvqIglcA71bU8Bxn2mWUmYiAwjA9XGzguKb2GKxMytbG+G8L44pY/rgRd9J/Cdb1mOIglQa6m0uxgbdpCaXayPuGhM3O5IoyszPoIqUZDGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HAlOMpSh; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=HAlOMpSh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22c; helo=mail-lj1-x22c.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bSfGp4FlWz2xRw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 23:12:01 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-32b910593edso8330651fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Jun 2025 06:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750943516; x=1751548316; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MCwjJ5Vu59NECXROlgdeWoW1Ipr9KsqQJuNVbzIMvIM=;
        b=HAlOMpShErTGMbJktGP677Eb3lJjMykvk5C6EziLwanRSQYuqoi7ZJaPlOHbDBNmNt
         ilNhjUsR34v2v2qiL6OhTk9HV/WXoPnpf0GXHu11bf14jGjDW23LNsNRsaiL6ExbUXId
         RIvRVgwPIy+vuZ7ukFNDLE4l0Ks94CA0c6VifG9FZBEWRnWE0r/NZXm0Z62k9/Mr+KGz
         9ookdehZi1QODGLGkoD9pyziPF+FVBP7YRE3aJKOrMXi2abgMidyhBJ31OX66GTi9b2Y
         jvzeXCpIO1twdA00fhG8msurpwZXrCC2oz819Jq0zwLsY7cPaKgM+GTZLAOAADzuaQjE
         csCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750943516; x=1751548316;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MCwjJ5Vu59NECXROlgdeWoW1Ipr9KsqQJuNVbzIMvIM=;
        b=Oz2qtIbd04t8r13hbB7rqtQ1e6dLKqh93/Z/gczwPMVkcI6sHZNCpi/Vmg6HTOfyNn
         3X2c7xNee9igb3cHOqAi8ZHcjQsFKBp/xl6yfs01jM0G7cMY0KqePhX8JL90bbSQW9Fz
         9EXLfm3hd1TUCTapxiDdN8w9OBf7k1K+oEwahGa9Xn1IIZF6Alab8vO45GC+lnSHwkZ6
         1gF5BAtmIyQbiGGLElH1p7rtXBwScJP2ahczzrtQVKER+CSYsuGwn/5VYg6JnsseKFNr
         k/u2OGSoBelBmEuf8DH94QgmRgkMEJQTulSVtDaQc9Qgu1deLUzH2mlfu/1VFJZzvn8E
         +ADQ==
X-Forwarded-Encrypted: i=1; AJvYcCUf9lLD1SPkTYos77colHmmZRuHYcueoNAaUy3Vqfj8NDTmsGdwVf3sVzUJxj+F793FuwCjrGdz5ym4tv4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzgyQepHnu4bD1ToV6zOfGXpJB/nMiNqNyP0WKNuEYA+Y08ag+n
	dcpCKhPiK87p2FV1+NJCcjwO+MtlAfH5MbdEoZtzAO+yjZPoOBFOky8wtxuyhwZEY+ks8pgWnYQ
	Y4w4kHY5009Lv3B5GYfQ+lYMt/Q0XD2Y=
X-Gm-Gg: ASbGncv1mVhfowD0rVT5amyxEDFY7PbKykpxj4iCPKAeG7cEs8CjAghfd8nYyp97Um9
	SdGX9YIvt9/ztBTQWMy/Du8ikAEcQQ7WFFRWxgrVob5UUUgF4sBcjOZSds5aYHT2iyS2SLdDtM8
	oQ9UXxy2oC2efG9CEnzFEgA09/aamhmm9bwLP7JJP4YoUwPcv8vtAmD+EMKZ8lGGwnnTpecA0nr
	UI=
X-Google-Smtp-Source: AGHT+IE2jBjORY52vwz1SaqfWBqWQRMlfyjcOqrk1aRtY75tKwDcBNf2YDuSUs0Sjh99nX7hNamlLbwguMTnnVZ18o0=
X-Received: by 2002:a05:6512:1189:b0:553:a273:66c5 with SMTP id
 2adb3069b0e04-554fdf82584mr2354324e87.52.1750943515819; Thu, 26 Jun 2025
 06:11:55 -0700 (PDT)
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
References: <20250626130858.163825-1-arun@arunraghavan.net>
In-Reply-To: <20250626130858.163825-1-arun@arunraghavan.net>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 26 Jun 2025 10:11:44 -0300
X-Gm-Features: Ac12FXw268pHp7EgiOTaBin1GwQomhw-dNFiDTxHVgc1k3q0De6jl0tgozoDaQ0
Message-ID: <CAOMZO5Dk2aiW3MQViXHRzweJXgjK20BkycT_A+dm8koxNH+MxQ@mail.gmail.com>
Subject: Re: [PATCH v4] ASoC: fsl_sai: Force a software reset when starting in
 consumer mode
To: Arun Raghavan <arun@arunraghavan.net>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Pieterjan Camerlynck <p.camerlynck@televic.com>, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	Arun Raghavan <arun@asymptotic.io>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 10:09=E2=80=AFAM Arun Raghavan <arun@arunraghavan.n=
et> wrote:
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
> Fixes: 3e3f8bd56955 ("ASoC: fsl_sai: fix no frame clk in master mode")
> Cc: stable@vger.kernel.org

Reviewed-by: Fabio Estevam <festevam@gmail.com>


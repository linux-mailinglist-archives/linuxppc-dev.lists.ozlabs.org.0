Return-Path: <linuxppc-dev+bounces-6081-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1121A30C71
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 14:05:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YshW25Hj0z2yjV;
	Wed, 12 Feb 2025 00:05:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739279102;
	cv=none; b=oGfvYvZq8pGaV9hkasRxsYhVLOWTzmZMBrrBE/ZdVGL1EhpU//4r2B406YxWt5bdlUwjfM+ogcAciFmgf6OFcZw2Bp1sZ8dKRLMqSBu8aPoB5T9VI73xxu1uVoa0aEhm5ELazI2t15SYQy+JLe5G9wJkUieOuImDB2gTlOw8EtgccPH78NOMUlskX5zeAnKr9d32wAbda3cpgClAgnpAXKjAc49MHAiR1USY65DSmiQC3XpKhd3ksRvZfRV6AVCHyrxQyZUzJABKrBqugJmo5dUQJt5hmi2v1QPR9GTRKAzlcYElGHE5Y687y0rAemVJ5gqkE50kr08n2vQkguvduA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739279102; c=relaxed/relaxed;
	bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LK4lD6F5gcM9QDeJ7Tx0xeRsjFLklac9JWAP4yvtOnIwbsm2Kp+UNA/DiGSZWbyD/IWecDCSLSZEDt8vzkSVrJV1R0JB/8EQuOqbouyY0kX61g54xXwk4f0xfP7XTDUqtyw0mWdA66X15lNi/o7cvVrGdE+8OUTc2uK3dCyGFyiQeQAJ70TO/wJyQ8z9rp8k4h5e7yV+NPmt2+jU5h2W19cipYxBWG3WHAgl7o+H60ylUKnSlHy5ltcMGhEje/bwH6e9Wf5d2PAFQYH/OYjnqm2UgVasnYSflBZu8ZvyCpb5LLzz4D3+cGMLdoY2fs+n0jBDqUdxZCySR3DjOyOoYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IoyDcPLx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IoyDcPLx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YshW10ltLz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 00:05:00 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2fa1fb3c445so6817639a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 05:05:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739279097; x=1739883897; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=;
        b=IoyDcPLxAwLiaAy69HiLRn7X4cXeIVVYfAJ4zFDz1ZQdjuskzp7yyxmnHWImyRh2be
         nXsaIrlKXe2RjxNOd+cL9UARkTL5YqyzHlRGGWe8RPus850ptyHjHQkPDFUD3u/EX65x
         Bbqq1bq+unoGFbrufcOQwqgRQDQAMjj2lQ5x1+XzUV2TXjgJtC1hgkJMMzwOfUy9J05+
         Xmygd/E4Yc3jrfhekhL1HhYMtlD5qcINM9OOIlpFOPRb6Gzl9T195KlRgiA+4To7fTz+
         oI1brawjLTfW7sVsKe/sZdbls2pL54EHTaeYGhsak78TplfY5bHRJuz1EncEpJQIi6Y9
         2w/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739279097; x=1739883897;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I5mGdMwF5cu1aorS2vZbnAj6wLlbFO7781j7ylyHZ94=;
        b=tG2PFDRFJv2HMEd9G7/4XcL0VjL0CHkOvVpdNKSvOb30g7AyIne/IwEy8o3JtfMq+D
         yqysqtggmsZn32AvG8xM4pq8CSiKeR/gO+jeHn/+NDzJPij6rfTRC+eHZ9GT12qe/Ghe
         tdGm3GXRlP4fTWNyU/bz55QoFqEI5HN1rLM7F/TT7Xq6mQgxl5mByy1Z2sam995MMMau
         I1r62lVRXkoGjEvWnfrmyZc/D81XVbPR1RcWyhkHZluJd0sXFHp977jTI7+scEU02CMh
         SQDenKexLeVEHsPyCt9OQeDLBH5gcS5fgoshljh+1FAJfPHzUT18GybnEY+LlJlgBaqF
         vuzA==
X-Forwarded-Encrypted: i=1; AJvYcCWuWWb6qPWc/tl5rIa4Xko+sFh+4znXL4kSreVtGdoTzFpwC8bP+xRbgWIQSpGhUwCkhLMRhufKPV36uJk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyg5NbBUk+M269uR9BahiiCl4IWCOrai864CuHGpwjk0e5pEWzc
	Nk0On4Wh2x7k2K1Ln0IXAKx9vcs6zETgW2cyGcrWi/SO/mc/TYIbfys1yejGd+Bd/2q09MrTeCY
	C3oiXEnUoSH9OTXHXFjBxqerIEs0=
X-Gm-Gg: ASbGnctctdxJAfG8HZoMcqDvU9ZhuVQAhSHZheDOkqqmHigihBxnaubYM/lhTofKJjL
	ZzoZ80Mmvaru8pLORHrACxVW7CXOCFqAun2QprOZOMHPvgSLjwdlSteuPbpWgWMnsX1kcYw==
X-Google-Smtp-Source: AGHT+IHxrSbz+UMf0ZSE5PZbnCLY0l+6wu1dbGZuTcxLw9cyD1B/2N0NzHUPXxohK81nTZucVVt76ckOaeCaUTE/ZDI=
X-Received: by 2002:a17:90b:2545:b0:2ee:f687:6ad5 with SMTP id
 98e67ed59e1d1-2fa9ed5d37bmr5548858a91.2.1739279097573; Tue, 11 Feb 2025
 05:04:57 -0800 (PST)
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
References: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
In-Reply-To: <20250211035737.3886974-1-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 11 Feb 2025 15:06:26 +0200
X-Gm-Features: AWEUYZkxR9jtS8NDetBx_vRl7m1cPQuJxMC1s9IXybxI-_qoyigAvbqfYgvFG70
Message-ID: <CAEnQRZDC+mQ=QzzpBsXzt0kSSDAo-LbfRkbDLfxrbxW9Nse-+w@mail.gmail.com>
Subject: Re: [PATCH 0/2] ASoC: imx-card: support playback or capture only
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, shawnguo@kernel.org, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 11, 2025 at 5:58=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.co=
m> wrote:
>
> Be similar to audio graph card, support playback or capture only
> for imx-audio-card.
>
> Shengjiu Wang (2):
>   ASoC: dt-bindings: imx-card: Add playback-only and capture-only
>     property
>   ASoC: imx-card: Add playback_only or capture_only support
>
>  .../devicetree/bindings/sound/imx-audio-card.yaml         | 8 ++++++++
>  sound/soc/fsl/imx-card.c                                  | 5 +++++
>  2 files changed, 13 insertions(+)

For entire patchseries,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


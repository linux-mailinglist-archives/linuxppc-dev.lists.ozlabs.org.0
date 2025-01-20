Return-Path: <linuxppc-dev+bounces-5388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E013A168E3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 10:07:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc4HX2mPNz301B;
	Mon, 20 Jan 2025 20:07:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737364072;
	cv=none; b=kuNcud7I9Oha+/PiQ0uNVrbd9Elk17R2ZzL7Uxa7gFEvROcp/NoFfyiiX5iADFPBxQJpGGR3Lbv2AE0au9oBxiuUctw/MsTXv17lmWTa+SpYTHkC2F7b4/mcmz9zztPfZH6A5phRvB/rlviWVfNkN3Ig3r8P7EKiFx/tOvIy3MYr/ByQjogGedEUvBJkabHQdSEMm1af2niuGC2rcm3mJP0mHjVeV7OyD+NoUod9+KieHjpMtA8uMWuU4ZNcKPOYU6vEt6+pCGpylSRKLwkh107Gdzn0pJL+pSSjB0jcGU2A0Xr1y3b4wRuY6fPZ85k5R4Z/+rZg4apkqzDp6/0vCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737364072; c=relaxed/relaxed;
	bh=52/2fVV5SWoMvrc6ChA9+J/uYtj05qqjRJYzCTtckhQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=e+hePdDpjnw5oTxhpkAuu92kW2cNfSEC7cXjUn97TQ8ltWqo2bLE6/xhgQCUT8rdaLlPYepSyEcmK2lz4QapOtTgWCo0r3CQP+f1u5uE0kFyWR0lH4xUzpyhbwv90DbcIHIA5/kIv7NEwcKY+jXtSBRE5vT/shFaDScPqV1fK/4+/Z1Ao2xjIPha/rJLUMfC9R/dnT/7AXzaXk7hfpKwX4k5x6twyPQz95uaAlkdJPcdBCVEVl0WFtBvFhw6/Ydkvotkf7CghNjiUNxjOllTDc19CD/3ohAc7sk1QMUekgEfha2/1ssPPLjNltcQ+k1DKcnXQh5AGY86ZzsJZ5WqYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PfwvOHHo; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PfwvOHHo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc4HW35Qmz300B
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 20:07:50 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-219f8263ae0so74419155ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 01:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737364069; x=1737968869; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=52/2fVV5SWoMvrc6ChA9+J/uYtj05qqjRJYzCTtckhQ=;
        b=PfwvOHHoIBqvJp7qlNB+lXt6SQ1rY2YCuQdy3bV9e5eIbqUEyl79kNNqJYVHBYG6aw
         TopRIIH9h47QRa4TCxeUaJD6TMJ+J3sjkp95zUgfleQIJgjqylvbdsjXbVg1FjvCHfWj
         m7pRqx+o7Cd0GOqXxuqWMrtH7FANGyVX3eZM4TfxVB+9OVvydLyrKKUtwZQZRW3BMztd
         /xlOi62yMDUyOlatag3ER5yAUPWNOXWTgoCLr8g6LfolMM+XweiTZMDHFhF0cXHIthC+
         ygwlfKpv4J63P9Tv9t0XnTtf/RTIXsBqzgvlOlsZYIN5AP403Nrzk4PtT/mqvqCv8xlg
         +wXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737364069; x=1737968869;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=52/2fVV5SWoMvrc6ChA9+J/uYtj05qqjRJYzCTtckhQ=;
        b=jfW0iBCVhftds7WQiUX8SKD8RJ0M1e3KV1aU/I6BsPCYBGeVJNdE1M844Od1MK34No
         D1xvwxuUqWrwndQYvGs48N8+yEVi9Pfg/Nqbcu4sx3SuDv7OD7RNan2PYupcg+uOqZCi
         0aHNnxz3iqFBlU6FJL4gKw8SkClLNtgaO1JOXsSaWBV0Nuu88PW6bG8+d8AcDnGIyLBN
         VoGiw7su9iVKXh7f4Rqas9LGPFg9tpR4nIfCpADCUYrIWbXkxJsanJGw+5C9hkK4ipJA
         iTlK4kSSOwL8YaHg6r+3FCdyuba7AoZD1PlGlbi2Ia3+0HFRlGMLRN7lxl1wt3E9kgDu
         2gRg==
X-Forwarded-Encrypted: i=1; AJvYcCU6RpN65iUrq167eG1dVHSh6R7enAzkeFdXci0k3FC4jbfbzjOSz8HH5ot5oZ5Ukf2lUUBthaY1vTe5D7c=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSueaRn2OpfHdsq/93hp60RmoyUTQDlxrDd26CSkI4tC6pmStG
	UekT3u5nHzdOCHK48a1aJ1w/p8KHLU7GP8nQZDu/Lv//0OO/pMOZBSP2LED8EBTZMTWsG9tK1Xi
	syAZB0q/m/XniGbnO7SiPhG04C5k=
X-Gm-Gg: ASbGncsmtao6i3wd8eJt/sRjUNkWoHJv60HyLSWRjZMc/ba+IAbMxuQ3EV3TV7CK/a4
	55dKNeFi3XIEwYPACifAi9xtY+rtxjR7AiVP/unH/F9Dth7g=
X-Google-Smtp-Source: AGHT+IHe5MIHadjWcYey/5+/xFnMBA4DeGGjtKbmZfnOT1Ve8uaz5/90NJmfB2awua7DXFiy9OPz4KEkZJ5o8UsnGwg=
X-Received: by 2002:a17:902:d582:b0:216:2426:767b with SMTP id
 d9443c01a7336-21c352dde25mr203745355ad.10.1737364068992; Mon, 20 Jan 2025
 01:07:48 -0800 (PST)
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
References: <20250120081938.2501554-1-shengjiu.wang@nxp.com> <20250120081938.2501554-2-shengjiu.wang@nxp.com>
In-Reply-To: <20250120081938.2501554-2-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 20 Jan 2025 11:09:14 +0200
X-Gm-Features: AbW1kvZCx3vGJxz_1PUUiV114VWPotPp0TBoiFnJwKBv6RQYYbVD_JtK02uPgWc
Message-ID: <CAEnQRZAc95=eTPyn-9=yUwnOUkQ5HHypbLPE6vYe=zjk-T6JNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: fsl_asrc_m2m: only handle pairs for m2m in the suspend
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com, 
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org, 
	perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Jan 20, 2025 at 10:20=E2=80=AFAM Shengjiu Wang <shengjiu.wang@nxp.c=
om> wrote:
>
> ASRC memory to memory cases and memory to peripheral cases are
> sharing the same pair pools, the pairs got for m2m suspend
> function may be used for memory to peripheral, which is handled
> memory to peripheral driver and can't be handled in
> memory to memory suspend function.
>
> Use the "pair->dma_buffer" as a flag for memory to memory case,
> when it is allocated, handle the suspend operation for the related
> pairs.
>
> Fixes: 24a01710f627 ("ASoC: fsl_asrc_m2m: Add memory to memory function")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>


Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>


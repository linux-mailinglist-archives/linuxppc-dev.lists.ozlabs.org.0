Return-Path: <linuxppc-dev+bounces-8963-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C697AC6349
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 May 2025 09:46:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6hQN66FFz2xHT;
	Wed, 28 May 2025 17:46:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748418380;
	cv=none; b=kvivSRDGUV6FxBhm0jHZBsFkqBP98x/+IJ+JjPCP14NcSYynVP2Efgl1SAhHJnfxNzHemNE8kZQsK9fpqAMRM2vpxFtDePeu4CEUnYOXExrEK+O0lopci5CEmZLkILpbr4aseKEy6wEIrbVmgeBZBXhx9gl9XQ9HiNnzQv1+hPSzSY6ubqQ7vNnU4+5cCWJ9t9knpXM3g8qt+S9o0L+XbFTU57yOwLQSFNPCIvsY4jQ/eVkx+z1cf1z9gO8Wz5H11XJzsaBiKoPZkTa8NwLSsDunRl4Zi2bEF3f5ucdck6FcPkX1Rb394rVfNZsp1lKCtB94GKAkUgNPzVTfXGu+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748418380; c=relaxed/relaxed;
	bh=q0FIvnATmtkNNdXQbt1Fz7I3kCcVI6Dqou2JsI1LDaQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIqj+z9L8XoS8cPwHau3eJ0xubVQvpNf+hpKBnkgxmLW0ztsa/BEgWyabtMAqT3xW52fIC5xD+CSBfbUeaqH3h9C8KbM9qlOx/yqN+mPfPYF+9yFN6AJbqFmkr5RRXefyJMxAl5g13n4AH/w+Kv11ka9YZOARWsKdam53dDBJ6RTunVzeYQ1UptAJ99dc/olwfWVXvC0rmaYNsutiOs06hNLErLSGnjlzXnEORB2IBUid/tJTt02XvL/EPqLguTTORPwRfRMHTGoOtRcAAbm8QhvM9JF59FRQ2E7twwNhp3r7/aD2qovXMA6YUd7NemAulgmYfgqi1gIOyIBmSmz9w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass (client-ip=209.85.222.178; helo=mail-qk1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.178; helo=mail-qk1-f178.google.com; envelope-from=geert.uytterhoeven@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6hQL27bPz2xGw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 17:46:17 +1000 (AEST)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7d094d1fd7cso18098285a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 00:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748418373; x=1749023173;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0FIvnATmtkNNdXQbt1Fz7I3kCcVI6Dqou2JsI1LDaQ=;
        b=sGkPNZees+RByHPZ7ynEYl26p7+jVnh92c5NU3NlI3/LZN3tzVjLjJquXv8SGjfXxH
         zN6NFG7frvjKsLKNGBt+NHOMARqpTK4fStcZ+I5YauBqPjxkqsSconDINmrv8uK1dmSa
         jq/OF4xcMoghU6Zg0L/59DqAaWUa2JWogjB86abKzL/aV5EN2SnY3CeTrRO5vtq17M4j
         z0bUbbHxULrcjHO5Dkdxfyz7EfHGAJRfsAnokpHfgxlhxcT/eYtAadNJInfTRNazf03R
         +t02q7iQweEb30HTfySuq37PKDievTyHBTjH4+ZCloC7IeS0wDCKNmxg7Qj9WJr++ctt
         81SA==
X-Forwarded-Encrypted: i=1; AJvYcCUiNCDojl+X6xeV1oA2H+HPDQhzrvccNzY4qkjzBP5DxB1xZKMpL4ZK1Xbc14K2dI9tbt5GjOVwfmJEiYc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywu1heZ2VwPBOeoYkQxRhoJwkX220fL9OqtLbWx747XvXr+Hxhm
	3X5puQqLT+1RoWKTArPWyTheMTxHa6/jSedyFOGDgYriFJCEOzOEu2N+Bdf23+1e
X-Gm-Gg: ASbGncvln+L/SXgyDCDAXg5Ihgtg47QIHnSz0VWex/5aBDPXkGA+zy8nSXrUraXkkdG
	0zoVQMWG3/AxbeRRcTGyQmPQonDQrCeYMgLcJWUg4l4Q75b9pLY9llsnIzmZIpbI1qoy/z4W/3V
	OVDjf1aDfgr7LGVung3612xbtqFMccdkTsqRJ/NAEcEGOGTiQQPrujzWLa93d1FRsyZ0THawQVE
	g1SXuJNPPihzVQpehMiTEzRhP/7eo0fW+auk88h1ykVw4uMCfhUYsj2VnH+NIU95rcUmdNHw7mp
	PEk7z2XOqLxNjnXUEG6oc6SVzAyTVOZ8ZfoP2fShBFqe1BDbxt1Sp6yucTldcNuZa+3J88R8xu5
	K1A2mU68dBbYERg==
X-Google-Smtp-Source: AGHT+IGH751fLAvk7D4IY7dNzluoVJi+kqlfsvJZh3AWSUoIOVNxTJIWneV+ZLinWmSU0yA+V/62nw==
X-Received: by 2002:a05:620a:4244:b0:7c5:46d0:a77f with SMTP id af79cd13be357-7ceecbd3af8mr2028823185a.16.1748418373065;
        Wed, 28 May 2025 00:46:13 -0700 (PDT)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com. [209.85.219.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfc5d6cb2fsm40516085a.117.2025.05.28.00.46.12
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 00:46:12 -0700 (PDT)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6faa4307e15so57607256d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 00:46:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUr7R14aJ84/INIUgjTAt8HHQ+Lc4q5oUnvxKdXQCGn35iIjSfPb6iuYaKPUikwtNHeiavGfnpB2mrGHCE=@lists.ozlabs.org
X-Received: by 2002:a05:6102:d87:b0:4e5:9731:6ded with SMTP id
 ada2fe7eead31-4e597316ebfmr3313200137.6.1748417879962; Wed, 28 May 2025
 00:37:59 -0700 (PDT)
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
References: <20250527082446.2265500-1-aichao@kylinos.cn> <20250527082446.2265500-3-aichao@kylinos.cn>
In-Reply-To: <20250527082446.2265500-3-aichao@kylinos.cn>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 28 May 2025 09:37:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV5ZhJrRiuEWLbU_gFcv40+izLpR0HN0EZU415s3QAkVg@mail.gmail.com>
X-Gm-Features: AX0GCFve4Aj5WArc9KkplJVctpVO9pqz2wSMOeJzSTUgarGo2ZgOa2T8YLQGOCU
Message-ID: <CAMuHMdV5ZhJrRiuEWLbU_gFcv40+izLpR0HN0EZU415s3QAkVg@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] ALSA: aoa: Use helper function for_each_child_of_node_scoped()
To: Ai Chao <aichao@kylinos.cn>
Cc: perex@perex.cz, tiwai@suse.com, johannes@sipsolutions.net, 
	kuninori.morimoto.gx@renesas.com, lgirdwood@gmail.com, broonie@kernel.org, 
	jbrunet@baylibre.com, neil.armstrong@linaro.org, khilman@baylibre.com, 
	martin.blumenstingl@googlemail.com, shengjiu.wang@gmail.com, 
	Xiubo.Lee@gmail.com, festevam@gmail.com, nicoleotsuka@gmail.com, 
	shawnguo@kernel.org, s.hauer@pengutronix.de, srinivas.kandagatla@linaro.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	imx@lists.linux.dev, kernel@pengutronix.de, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Ai,

On Tue, 27 May 2025 at 12:52, Ai Chao <aichao@kylinos.cn> wrote:
> The for_each_child_of_node_scoped() helper provides a scope-based
> clean-up functionality to put the device_node automatically.
>
> Signed-off-by: Ai Chao <aichao@kylinos.cn>

Thanks for your patch!

> --- a/sound/aoa/soundbus/i2sbus/core.c
> +++ b/sound/aoa/soundbus/i2sbus/core.c
> @@ -155,7 +155,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>                           struct device_node *np)
>  {
>         struct i2sbus_dev *dev;
> -       struct device_node *child, *sound = NULL;
> +       struct device_node *sound = NULL;
>         struct resource *r;
>         int i, layout = 0, rlen, ok = force;
>         char node_name[8];
> @@ -178,7 +178,7 @@ static int i2sbus_add_dev(struct macio_dev *macio,
>                 return 0;
>
>         i = 0;
> -       for_each_child_of_node(np, child) {
> +       for_each_child_of_node_scoped(np, child) {
>                 if (of_node_name_eq(child, "sound")) {
>                         i++;
>                         sound = child;

As people pointed out before, the original (and new) code is buggy,
as child is saved to sound, and the latter is used after this loop.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


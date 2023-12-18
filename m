Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCDD81712D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 14:55:09 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sl7aS3Bt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sv1Y71ptFz3cJW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Dec 2023 00:55:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Sl7aS3Bt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sv1XK1Rjsz2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Dec 2023 00:54:23 +1100 (AEDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a235eb41251so100495366b.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 05:54:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702907655; x=1703512455; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CbtU5Dem8n1ByRGdHfRIcdaXiqJKIZaXjO9MiKCPxSw=;
        b=Sl7aS3BtiKFf48cN5ztCMMzEa48Bl4Y8Ro9PL/FNlO1Tv4R/mC8Xx1UsImCpI9dzhc
         PoNrk/ZLtjT9cB86N2GSH1NZqX6rwMujPeJU1j8Pcx3O0qCqq0jmXjE81zrC9VigO1+y
         uh86ydb5OAD9G88e52GVdWJvPvWoqDwshz8Fi/mJ2V3jgbYq8ymA9eOMWQJ8xLfVklKb
         QG069ombeZAIZHLEml0DOLMkURNTfc8B7tYVtklwffNyEEdtBZDpLcSUU+Quo2WE/iHO
         T06MjcWzgYwiSE4nyIuPlWZorLp75sMVMYsTTtzQ88kfbT1h/86yescMKGMYJwyzucTf
         8gew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702907655; x=1703512455;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CbtU5Dem8n1ByRGdHfRIcdaXiqJKIZaXjO9MiKCPxSw=;
        b=Og4GVvhZpjtlnzAWyWN0C76ZJwJUlQSHMKHjHqJ93cjo5Z06kjv5EwMG8YY3epr7VG
         lzGHw+qX2YEasCfNFmcVXSuQIQuW8baoBhPzXxreanhuWOCWzU9cGCd1F0IFd+vYdd5P
         BKvj+jFrOZg1OX6EPXrqO5QekACfBFcK1wahZf2+qncTaL4UOXsBXrot2vIlWe8siR+L
         I/d/P3y2JNLpnP5aZUKEOmktmIS5CnB2k2rwXoNxdY9DePg1p00eTsfDW2YlW2qWyvOJ
         wvVkG1/0YHLgsjoGK/GxtcnnNVV46+QmpexBr/Qq6WrZI5BZY/+co/1JEvFa4NCm469r
         9goQ==
X-Gm-Message-State: AOJu0YwJNq0JQUZeq8StbgwGjm4pVFNAPq5wvBl1e+yjPJ8yc0MMZfhd
	EeQJCfsy4HB1CnvvvC3Sf3fmpwfh+EQRE0jRCZU=
X-Google-Smtp-Source: AGHT+IFccjuA7oI4N2vZVaD408zkZGajffjClRfWqmjz7HiPSzp9vIfLO0uacCVtWGKz7UbIXxVfUaYcwBaZqHng/s0=
X-Received: by 2002:a17:906:1083:b0:a19:a19b:426a with SMTP id
 u3-20020a170906108300b00a19a19b426amr4772325eju.213.1702907655325; Mon, 18
 Dec 2023 05:54:15 -0800 (PST)
MIME-Version: 1.0
References: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
In-Reply-To: <20231218124058.2047167-1-elinor.montmasson@savoirfairelinux.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 18 Dec 2023 15:54:03 +0200
Message-ID: <CAEnQRZAwk-USZqXwLOVuN3iTn7r-55BJH=Sqq5+2Od+DhrK0iw@mail.gmail.com>
Subject: Re: [PATCHv3 RESEND 00/10] ASoC: fsl-asoc-card: compatibility
 integration of a generic codec use case for use with S/PDIF controller
To: Elinor Montmasson <elinor.montmasson@savoirfairelinux.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, linux-kernel@vger.kernel.org, Philip-Dylan <philip-dylan.gleonec@savoirfairelinux.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

>
> * fsl-asoc-card.txt currently follows the old dt-bindings format.
> Should we update it to DT schema format in this patch series
> before adding my new properties?
>
>

I know this is extra-work but we would greatly appreciate if you first
convert fsl-asoc-card.txt
to yml format and then add your new properties.

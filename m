Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D16598287E6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Jan 2024 15:17:15 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KwFhLfRw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T8Y0S2XFnz3bT8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 01:17:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=KwFhLfRw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::532; helo=mail-ed1-x532.google.com; envelope-from=daniel.baluta@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T8XzZ4pthz2yts
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Jan 2024 01:16:25 +1100 (AEDT)
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-553ba2f0c8fso3433437a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Jan 2024 06:16:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704809779; x=1705414579; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XfKKmsgrBNevkxdWqBtR6SySOi1WLHhsxeOVYSFipik=;
        b=KwFhLfRwEBGaHJG62EIGwgj2iaTZcA9nuCp5RONr22cPQgSV9Q86izXQv9rWaAqFs3
         W7xFrWWdwEP8Pv5dyaFWK1Hn2sFMoDkWAN2kOAWU14bombqVFgnn+rs+aiC3wyhRFuOf
         Z9/pne8yASg1qvmG7XdS5BTGZykEv2tzLjEJeAEAir8z6nWN+5pt64QEglE80H7vJkmH
         IlzLmNL/MWfbo51Luu+3OezKxx769i+blihYSxdD2yr0umns4a70u9LMkyXViBg4xeLv
         0GsEpEWFGRTuObosqN9h44WbrRajn1MnABRp7x9WHLWwtDV1Va8NyPbK+VqWAzCdg+ZO
         gsOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704809779; x=1705414579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XfKKmsgrBNevkxdWqBtR6SySOi1WLHhsxeOVYSFipik=;
        b=cUf4AagXWM4Yi0GTZnk93Zw8x2QdqRblY4aHMW0ZGPZILiV5GeUUsZ0w04XgeZmce4
         XmX2hmegbujHDqtNuDXFMt77rXqLlU7QChYqpM8BGvkO9matfaTa83lQlydN+b70kTZ9
         KFsYiJqGaBXQBSqXlLGjZu+viiO5nUdMUKsK1dkMQiC01/IGyyJvQIAjRoOPsDoFgCOh
         zj/J5MOrODCN7jYaKB6k4MXKqg2l3+GSn6ZagMSlfNIo1zRjPoaD2S8+pbFQpyreXUwX
         ykG6X/2wYZbnXOKgAkQ5wXbtbF8yzYR9a3MIcGqY/R1EE0p/nTY1cjNmfFuWF47j78yV
         0ZEg==
X-Gm-Message-State: AOJu0YyiWfIN+XN7H89wh+Mxu3AXnE7cOZlzMKDFG6YLddM6tnxDz71B
	DHVJ12rxgjiKj9xqUiOMpBJ9M3NQOXL2P82QXE0=
X-Google-Smtp-Source: AGHT+IHrnXDoXiFmgZB8pnUib0FZSixSpHYIUBlJTfVPoTkImZsXEmElnr3lXwcWDIqgM9foKbqDkNseDvscZLyDkgE=
X-Received: by 2002:a17:907:2d09:b0:a29:1419:f522 with SMTP id
 gs9-20020a1709072d0900b00a291419f522mr330417ejc.72.1704809778626; Tue, 09 Jan
 2024 06:16:18 -0800 (PST)
MIME-Version: 1.0
References: <20240109075551.870001-1-chancel.liu@nxp.com> <20240109075551.870001-4-chancel.liu@nxp.com>
In-Reply-To: <20240109075551.870001-4-chancel.liu@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 9 Jan 2024 16:16:06 +0200
Message-ID: <CAEnQRZAgwmNZ8ruV6rPJ_OTzjLHL0jgPLFNbBeW1fXYG+QjAbw@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: dt-bindings: fsl,micfil: Add compatible string
 for i.MX95 platform
To: Chancel Liu <chancel.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, linux-sound@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 9, 2024 at 9:58=E2=80=AFAM Chancel Liu <chancel.liu@nxp.com> wr=
ote:
>
> Add compatible string "fsl,imx95-micfil" for i.MX95 platform.
>
> Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,micfil.yaml     | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml b/Do=
cumentation/devicetree/bindings/sound/fsl,micfil.yaml
> index b7e605835639..f0d3d11d07d2 100644
> --- a/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> +++ b/Documentation/devicetree/bindings/sound/fsl,micfil.yaml
> @@ -15,10 +15,17 @@ description: |
>
>  properties:
>    compatible:
> -    enum:
> -      - fsl,imx8mm-micfil
> -      - fsl,imx8mp-micfil
> -      - fsl,imx93-micfil
> +    oneOf:
> +      - items:
> +          - enum:
> +              - fsl,imx95-micfil
> +          - const: fsl,imx93-micfil
> +
> +      - items:
> +          - enum:
> +              - fsl,imx8mm-micfil
> +              - fsl,imx8mp-micfil
> +              - fsl,imx93-micfil

My yaml knowledge is very limited. Can you describe in natural
language in the commit what exactly we are doing here.

Why something like this:


>    compatible:
>     enum:
>       - fsl,imx8mm-micfil
>       - fsl,imx8mp-micfil
>       - fsl,imx93-micfil
+        - fsl,imx95-micfil

Isn't enough?

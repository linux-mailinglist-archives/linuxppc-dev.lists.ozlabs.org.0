Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E74B7F0ECA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 10:16:56 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fnx/4JM/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYhj22bCJz3cc0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 20:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fnx/4JM/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::b2e; helo=mail-yb1-xb2e.google.com; envelope-from=shengjiu.wang@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYhh955GSz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 20:16:07 +1100 (AEDT)
Received: by mail-yb1-xb2e.google.com with SMTP id 3f1490d57ef6-daef74513e1so3756884276.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Nov 2023 01:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700471764; x=1701076564; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vpwOvzzEhozZ00SFHXEpmejOMEaeMFuJw7NXLVeDvN0=;
        b=Fnx/4JM/c1FmN86BDOBB5NIDE9VqvkCLnaTgbrurdu4P6lk4tF8zc8hnbJFdMFZ9Yz
         aPYNL/KhxcDcU5Q82akEYeSPVni1o8DzP6OOIyqgFqdmaq3cLLP3tnHDcssHAufxhy1P
         BbVlXWqQIK/9Ipt4BzOIaQSQ5vTklOlFQRlXJploDB0+Km1n/Sdc7H36V8EpBHBWL1YI
         bDoR30GitBU1LEy91zHN72JPOfsfmkCZ3soJvB8ctHOd0JOhyQtUddM9XreiaHJ3BJ9C
         6qPyIKHOJrR/wo55LADEFa6DF9iqABlZsIgYV3eH5Bsv6dT0KdtE0BnVXXMH1e4ju0Ej
         Fc8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700471764; x=1701076564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vpwOvzzEhozZ00SFHXEpmejOMEaeMFuJw7NXLVeDvN0=;
        b=EOtgxZIEAna1g8MnpVpH8ZNpZY0Ym2nnhWu54tULlTdfwgNAQvHsunZnmKrZw/YWeG
         Ti2Pjk8WjJCROvHVnSYciyhc5FBHGm5dxPResLY3AytUZoZaAl/i42gNavhCoL2qz0q5
         YhYXdS7UfHExlQAQKTuNREBf3+d2Y43rzSwpp7IFZzy1KhZ/KA1UNZKnDZPakeHJvo4G
         MMuz8Sc3TY6XUVlUN1WFanoA6/GfZiH2xQOAwtxpx4JqRNFVS2nyiDLWKs9OtGoup0Ky
         griKG6/ygQl7XAdlfdg9C/YDBmw+5n9hW1afPS3VVadQn3XDTDOJR1zhc+nZQzSUCXhE
         mZVw==
X-Gm-Message-State: AOJu0YxOuyg63/qaIfnRvTjaplUAT6TrHnw6xfX5L3TxJ4b2BadZDyas
	DgvPyoU2Q1hiHAbBJ8wTArSZvAg51v4I2EUa4xw=
X-Google-Smtp-Source: AGHT+IHQZdFmExncdM9w92IhRdz9hY7vAbs09uTd8RTDMHe6yfQhLY+Jt6pDbPzwWpTI/d6kO1raiNKHVl+oY27Gx6U=
X-Received: by 2002:a05:6902:4e6:b0:da3:b87b:5b7c with SMTP id
 w6-20020a05690204e600b00da3b87b5b7cmr5863456ybs.38.1700471764148; Mon, 20 Nov
 2023 01:16:04 -0800 (PST)
MIME-Version: 1.0
References: <20231119104514.25536-1-tanure@linux.com>
In-Reply-To: <20231119104514.25536-1-tanure@linux.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 20 Nov 2023 17:15:52 +0800
Message-ID: <CAA+D8ANMZd1xT2nyNskaroz-X0pDTv2fCSPxKc+H4R2RS3FRCw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_mqs: Remove duplicate linux/of.h header
To: Lucas Tanure <tanure@linux.com>
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
Cc: alsa-devel@alsa-project.org, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 19, 2023 at 6:45=E2=80=AFPM Lucas Tanure <tanure@linux.com> wro=
te:
>
> Remove linux/of.h as is included more than once.
> Reported by make includecheck.
>
> Signed-off-by: Lucas Tanure <tanure@linux.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

best regards
Wang shengjiu
> ---
>  sound/soc/fsl/fsl_mqs.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
> index f2d74ec05cdf..86704ba5f6f0 100644
> --- a/sound/soc/fsl/fsl_mqs.c
> +++ b/sound/soc/fsl/fsl_mqs.c
> @@ -10,7 +10,6 @@
>  #include <linux/moduleparam.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
> -#include <linux/of.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/of.h>
>  #include <linux/pm.h>
> --
> 2.42.1
>

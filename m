Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C62F4D401D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 05:03:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDb5x6nphz3097
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 15:03:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ONrKwNau;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ONrKwNau; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDb5K5GjCz2xss
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 15:03:15 +1100 (AEDT)
Received: by mail-ed1-x530.google.com with SMTP id c25so3249706edj.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 09 Mar 2022 20:03:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GrKdFSYsZlVt8uhCN2U6sNHmV3u4KOt5mcwLajvsZOw=;
 b=ONrKwNauEyspuXAuyaYf+2s7frYnXQgKz3I3C/XTvDB8gnwd6/YlZl1iyEk5kZ2T9s
 CflKU1uQ3xl/8qFQRFY21+vq6dhEYhcFsbFQSMmoStDu0ZoDIcmz4pWksO1uCcP5vX2b
 UlrJuWB0okTvlUvCk92Sb8C9A4PlLlPLdBTVRDRdynYexSvalJOaM+uiDgfbbfn9mGph
 UkcupGs9lFCOqR+O5d7tp2IeOcyUUwZRS4C98tiYq3YE9X4Lgervcc4mnfH+/FM/xFnU
 IxfufytJXbxJI+AxXNgaE37NoMNafJs1zKfW9mF15vroPEb2zGDpC8giAcxDjTKstxsn
 HEeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GrKdFSYsZlVt8uhCN2U6sNHmV3u4KOt5mcwLajvsZOw=;
 b=PhVXU4JDLzNS/xwW7WI2GGuwy6yLTr+LmPQlnEW2Rct2D9wIVUEnHzrBPh8JxOotHX
 742KXI4SQ9FwIKXi6pVbsi/KE5FCevhfV1zX0ls96rDV2flwcSAAis1g1+8oDbvu8YMm
 BkpjiEmh1kRbyG7lSpNlbhYn/yB4Wt22aBEP5TaXFniJmAt6bsinLxL3B6ZonvcOCZVZ
 tH+UhwxaRlb5eWKY4viUj9BCyZmGL9CHPasonB5W6H3qQDoHTCtFz/W3qJBWQa/bbmKC
 ulHNnHnlhvm5cuGMSfk9GyFqJykrIgdecJsyo/iJ5vldzYcLSioyi07MI8ayD77aQ9j4
 uj3g==
X-Gm-Message-State: AOAM532TYqaUGbZbmQbkz+ucNdbUPv7I8kIeAC67FYQBSeWUZZwQoluC
 eown4qooyIQwLPWQpTDDBL0CUZ+4MqN58w38G5Q=
X-Google-Smtp-Source: ABdhPJwkgjgmWZTe/uzCw13LmTJ+AMMbnaHvJVc7YxhfBh+pWiN0kj2TdHmcSbojsH78j+QzOvhAaEGenMZA45d4jKA=
X-Received: by 2002:a50:9d0f:0:b0:416:95a3:1611 with SMTP id
 v15-20020a509d0f000000b0041695a31611mr2430187ede.77.1646884986448; Wed, 09
 Mar 2022 20:03:06 -0800 (PST)
MIME-Version: 1.0
References: <1646879863-27711-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1646879863-27711-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 10 Mar 2022 01:02:54 -0300
Message-ID: <CAOMZO5DCm8TzajeLCECxpdsoKBMOzr2MgmoYbUSN7SDYRhPL4A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Disable TX clock when stop
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 9, 2022 at 11:46 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> The TX clock source may be changed in next case, need to
> disable it when stop, otherwise the TX may not work after
> changing the clock source, error log is:
>
> aplay: pcm_write:2058: write error: Input/output error
>
> Fixes: a2388a498ad2 ("ASoC: fsl: Add S/PDIF CPU DAI driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

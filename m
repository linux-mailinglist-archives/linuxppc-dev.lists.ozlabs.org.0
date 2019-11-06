Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5ABF1546
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 12:39:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477Pgq3VL3zF3Cs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 22:39:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=daniel.baluta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="cp3zwyxx"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477PdF4hkNzF5sp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 22:36:43 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id w30so2633994wra.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 03:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OCw5fZ9l2RrOi3SE8aqoJuN0UEZysLXdrRoRB/SxvBQ=;
 b=cp3zwyxxGArn6yB7UddfdzaHFMsp10QWEUHJUO0vPDt8WXjEKvzzCwG8xusRCA+PJS
 XkIAfXXJcOPnfFo39YKbHA1s4qQcxejVHSqrhFIfmpSZQqvkLx90rBW+OCy0c68xJGWI
 4+FUYZgWb15MxOtMawwLF7fnoW69g0OtktE26iIljd7V9AeTipZcWWcswuWycY31CsOh
 8/bnNr7wHEcZwGZbIYr5rL8GBPBBn9QeI2eEy76QjH6XzZzcMHLM52q6j/VD7asOqnXJ
 G12h0bezxKBl2VGTO95uzQyU2QcDUxxe2YtPboFfK9DItm5As9C6GaTRrSJHC87Eilqs
 KdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OCw5fZ9l2RrOi3SE8aqoJuN0UEZysLXdrRoRB/SxvBQ=;
 b=M7x2NRx2QWhPhy6XGsJ4g42Jo76ntl5HtLD5DqR3O85pHdD8io2pAYBgHxFZw0eJQi
 aTVW4xu3ADf4C9F8a8/CyJLnbzLCZYz4O5yYZIe4lG9iPQWcmg6qLZElTjw3Lzpuzc40
 w2yChMNFzBtLMWLcIUVX2oDg09lstF28xDk2uTtEQ+quOptOS23PUgWDrdVeRsO/PXMz
 hUFZzrZSykuhKxPuWWCB0nANmJnpaXMrmNQFPQazIDCZKlfH2LDWBAlRiAIittBo2VE1
 afajltMzfduim3DZtk+r61LL9vNY3vwk96ribZSbiDyc5U9kyxDXVfHXrxOfjmOLbA1o
 eqEA==
X-Gm-Message-State: APjAAAXancSYekYj9cMHw2UNe1x894WtrIBi/gcmRJW3qwPpYI/AbrT9
 PLUiHnrmcO7gLnLkUn/Wjd5es7R54c7EGkX1vfs=
X-Google-Smtp-Source: APXvYqwq2zOaSIHLbR6lNDivoEFIR2AaMIjiv6C+GRRxG2Vqs1g+sI7nHw0I9kP2JTsFUuxglZfMQIhWMhS7fqWQcnc=
X-Received: by 2002:a5d:5306:: with SMTP id e6mr2160142wrv.187.1573040198673; 
 Wed, 06 Nov 2019 03:36:38 -0800 (PST)
MIME-Version: 1.0
References: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1573025265-31852-1-git-send-email-shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 6 Nov 2019 13:36:26 +0200
Message-ID: <CAEnQRZB0tXZvArgxL+u7x1RAWGyw8bDbGRF9u6tKiPjJbMpGkw@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
 tdms
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

Comments inline.

On Wed, Nov 6, 2019 at 9:30 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Audmix support two substream, When two substream start
> to run, the trigger function may be called by two substream
> in same time, that the priv->tdms may be updated wrongly.
>
> The expected priv->tdms is 0x3, but sometimes the
> result is 0x2, or 0x1.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/fsl_audmix.c | 6 ++++++
>  sound/soc/fsl/fsl_audmix.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index c7e4e9757dce..a1db1bce330f 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>                                   struct snd_soc_dai *dai)
>  {
>         struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
> +       unsigned long lock_flags;
>
>         /* Capture stream shall not be handled */
>         if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> @@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               spin_lock_irqsave(&priv->lock, lock_flags);

Why do we need to disable interrupts here? I assume that lock is only
used in process context.

thanks,
Daniel.

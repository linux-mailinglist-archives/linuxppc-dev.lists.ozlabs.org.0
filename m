Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F5853B08AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 17:21:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8VTp2DBmz3bvN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 01:21:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=WLtAFBCc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::133;
 helo=mail-lf1-x133.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WLtAFBCc; dkim-atps=neutral
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8VTL4LBkz303H
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 01:20:36 +1000 (AEST)
Received: by mail-lf1-x133.google.com with SMTP id x24so36551044lfr.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 08:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bpqGkk/JGVe/MnPyoETv0p8uKc3pSJj4YexxopDDd2U=;
 b=WLtAFBCczgLWoAx5u/xKxcRWJO0HNR6yVqDk+l8R3m+JsOWedfC6dxPJ0mhagcz+5K
 pzjeCg9kaBJUrpA2ySWvC5cu6MfVaxmxHmNjq2FNGbWzWw4/7Y2IKQXHnAR0CtM0spvG
 6ql5tmTlMHQNAGJ2lOmr7QKkejf+ZwcjpfhlvwZVgToxzbfSrYren053WLBLciXXr7AS
 bvggn8Kiz0A3YCR9fNo1hIfKyk/0ei3k7nRWo1Y0j944cFgoxzbUwTWlnLMtJre4oqZN
 znE/RpQ6dhr/I20sFxQDyiV2Txk8sOqA7IFz0r2LCkuZYgmWccid1xu5pOCRtWPLnUaO
 bWmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bpqGkk/JGVe/MnPyoETv0p8uKc3pSJj4YexxopDDd2U=;
 b=mO4r9FiufJP2oQIRq5MQHDEQWJjZ4PwSRWM1uXhXpSc6WG3xhAaf8b6zzVMJh718Gf
 0hnt1sVdBvL3saHMdRLCq7oXwI+BW6LZhgjmMFBrQpxdFO6NbFlD77+9eVOKo0kwCPRl
 aRBeIaU9uyKgKIM85MD8SQeraD1yGJe8I1gFH/jO8m1IN2UDvKlQLRvRevn5cNn4VOML
 z0EcRI0B0L+pUuxIQ8+IJQ+rQ/a9UDd6TWVxQRl/8pfNAvlQYNNsxuQXCdAdap55F8sR
 5dcdKPw9+cy4DwjIi2y54gU+6SL6pe4zBOjT3GzbuV2b9gyloLGRIZOzIun/m2cvy2ux
 DwMg==
X-Gm-Message-State: AOAM533wV9fdZgL0kjUnC0IzaZdwv1EBVZm9yXeS13+5mOeIRBh+x4Rs
 5WLAtLx4IuGyBom7Nq7sxftE1XxyIQDJhoG2zlU=
X-Google-Smtp-Source: ABdhPJzlzy1eLbw1J5ldiP+ql0q+z9KvG3TP9jztXX37rcURHYnYtIPG00PB5rkr0m28KIYSpdRMxVt50kjP3cde070=
X-Received: by 2002:ac2:4d25:: with SMTP id h5mr3257357lfk.583.1624375230527; 
 Tue, 22 Jun 2021 08:20:30 -0700 (PDT)
MIME-Version: 1.0
References: <1624365084-7934-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1624365084-7934-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 22 Jun 2021 12:20:19 -0300
Message-ID: <CAOMZO5A_0KncwCgfZ6LSAO-LA01U9LS4=Hopn-_9qj8cv1Qhmg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Fix unexpected interrupt after suspend
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
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 22, 2021 at 9:50 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> When system enter suspend, the machine driver suspend callback
> function will be called, then the cpu driver trigger callback
> (SNDRV_PCM_TRIGGER_SUSPEND) be called, it would disable the
> interrupt.
>
> But the machine driver suspend and cpu dai driver suspend order
> maybe changed, the cpu dai driver's suspend callback is called before
> machine driver's suppend callback, then the interrupt is not cleared
> successfully in trigger callback.
>
> So need to clear interrupts in cpu dai driver's suspend callback
> to avoid such issue.
>
> Fixes: 9cb2b3796e08 ("ASoC: fsl_spdif: Add pm runtime function")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

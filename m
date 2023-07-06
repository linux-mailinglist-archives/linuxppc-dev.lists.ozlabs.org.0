Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 070A374A67B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 00:01:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=htCzr6cI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxr8K6ffBz3c4T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 08:01:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=htCzr6cI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429; helo=mail-pf1-x429.google.com; envelope-from=festevam@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxr7N6Vc0z2ys4
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 08:00:30 +1000 (AEST)
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-682a5465e9eso199994b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 15:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688680828; x=1691272828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8F/Vz/JYKZUR7Pz5q1oBdNBG9fKmk/mb5bJHRVCY9Kw=;
        b=htCzr6cIPX9PDnqhu74yLiUYcdYliDEsN3nu1sZBVzcxA52VvBHGtrlzn3uM5hb5UG
         5FJcswVJm5ZYNNYJjq9yjJgREKDS33htkOsq3JI3QSs23+XL1N8OWd5o1BL7U9mHT5CT
         F3nPs4NO9SocDJviSKIETlxQdjxgMhTPdcn0IYLOzfQTPWmn17kildwyS3oZZhJ6h9AS
         v1K3bWCk7Fu1Se2LcqyPawcFmPyB0zuoAkRI535bUz43LYeo4GYIsAm9ocJNI+M0r0K4
         J4I8N7PoGhWSihFHkUcfs+/U7u2x3ROb468rxy4IOk9g4iors7yy1e/0ePUzofbcQXxd
         4K+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688680828; x=1691272828;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8F/Vz/JYKZUR7Pz5q1oBdNBG9fKmk/mb5bJHRVCY9Kw=;
        b=Mt4VaYESARCI95OcN6XGytNEegSdS+MpApneVg+xgxJtJq3Dv+bZFdd3MnQj9tcA6D
         zYqwSTe7eYsUhSxYqCQCjBmUaA//p/ITPefuRjRiWdnQ2aWRjkOG/bPol4KU+bdWutg9
         i3U2YwrdavfLFpmCzGnmlIgBfkAS+4qHjAK54TzPw7shCZnBLiAo9gdeWAUAW1+4fz73
         8+PFP+R9RC6QclG61XEDYVlnnASzGyUGveIz+BmsiBFtHDr399m1qJIOt9WeKilwPT6A
         UaiZl53daoO5Z0qxaQFuv76B13vZAIwVsiFb5dvkcOli264QyT5+V/iX7OuZsxIu9U50
         pwyg==
X-Gm-Message-State: ABy/qLa7hJVrblWvEqXcfvKiifnfowa+eWGmBi4q+0dYW4ZLHtMBrpPA
	jyVnATAOSATiKW8tUUS2weppiuh0Y2xtG1aDrB8=
X-Google-Smtp-Source: APBJJlEiE2PjbiYsEKl3M8g1bnilSPcnnFTyA3koOOaWRTk6CKBXAXx6b56t8c9U+73ojunwVjmr/nE0y5iBpAM8Sj8=
X-Received: by 2002:a05:6a00:39a1:b0:67d:308b:97ef with SMTP id
 fi33-20020a056a0039a100b0067d308b97efmr3169625pfb.2.1688680827849; Thu, 06
 Jul 2023 15:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <1652963808-14515-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5DtpoH0dLDX3=Sv4UUpX_=66VEZPsJUWQNnYviApfMLKQ@mail.gmail.com>
 <20230706084706.bzwsbi3zisx5m5rl@fatal.se> <CAOMZO5CCdaodWQrHUQgMizoES=jfEtw-sNJZG-DJMpRD8tZW9g@mail.gmail.com>
 <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
In-Reply-To: <CAA+D8ANAg7bs0A35c7Af3_-5sLaqvT1RoKfCbzYi=z=t_q9LUw@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Thu, 6 Jul 2023 19:00:14 -0300
Message-ID: <CAOMZO5D_1cjZVpMvRrtcEGupAUn3EVU_G-p0Ju9gC2TaJh8G9A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Enable MCTL_MCLK_EN bit for master mode
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>, =?UTF-8?Q?Hans_S=C3=B6derlund?= <hans.soderlund@realbit.se>, Andreas Henriksson <andreas@fatal.se>, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 6, 2023 at 8:19=E2=80=AFAM Shengjiu Wang <shengjiu.wang@gmail.c=
om> wrote:

> The clean way for fixing is to remove the code in fsl_sai_set_bclk()
> and add "fsl,sai-mclk-direction-output;" property in dts for some
> node.

Yes, after thinking more about it, I agree.

So what you are proposing is basically a revert of the patch in
Subject and I assume that the
reason you did the original patch was that you missed passing
fsl,sai-mclk-direction-output in DT.

I will send the revert.

Thanks

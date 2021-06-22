Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 806713AFABB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 03:53:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G88ZW1HPsz3bt2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 11:53:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=oJNrVUa2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2f;
 helo=mail-qv1-xf2f.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=oJNrVUa2; dkim-atps=neutral
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com
 [IPv6:2607:f8b0:4864:20::f2f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G88Z0279yz2yR2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 11:53:26 +1000 (AEST)
Received: by mail-qv1-xf2f.google.com with SMTP id r19so8510915qvw.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 18:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1QTuaNj1iCRevxIVn07f/kyH2pwUNv2dSDLfnl7sJyA=;
 b=oJNrVUa2XPX5TJqSmRrTkm0n3hiPddmWMVfa017B9LAUrPBpxAncFYkrkGZSDEXRBh
 AuBhSk3qcrWUlGNDCJjmssf0Vk2JApDxtoHkB8G5ja/M6VeMZY+8N/ION8pueo4oDD8o
 rmTqTefG1n90ow3ol+EgjrvPq7onL/saU9cSB/67IW4CvtGGZslQVe83NKXOUyVoAArx
 qvfF42EXyE1DH2ZONycGLVvneo844q60/iV+zKH6trXGym0Fj+myF39tCVrVHtk5aBCg
 O+F7XqYFobhmmUUI7+t1OQcOIgxsRytAJWE4aLtt42PXe8tEqlbq+o5xzwE0pQXi6Q6u
 g/tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1QTuaNj1iCRevxIVn07f/kyH2pwUNv2dSDLfnl7sJyA=;
 b=KJ3kJ3mSh8vpxQmEOAoiEzHiIkPzETHOv/C89+z6f0q4uJWJPuZgrhy8r4fe5+EdKp
 sdVindbTBVawEA8dXNzkOZTn0S2Ew6PbOpPksKPBV5MrMvvH6CA5umDV2tur83jcj2x1
 uwUUE4vlOJ/OtwcaXO1XGjsa2MuGDguSafeuKLRqcBpTjB9+NGqp9vMQHCrzKJeTc2WW
 sAAD/nip2/cxk1BvFC7LUsNP5SVL+ZNZUS8RN1q1yxZ+f9t67+RsOL30AFNZ5WTxKZbU
 7vVgIAYxwAetcSH7/pXGi9aBuUv3oawjaP/mCdCXAsuTph8B1lsBqAxRlI42uFGageLo
 BH1g==
X-Gm-Message-State: AOAM533ln2paCKhR/rPMa8aEZLXjuiH8l7Cz7nY46HmKKvP5ITJlfk6s
 MZbVQ1DocLIiA97RM2IIfez8kyR2nbhWX9YDvnA=
X-Google-Smtp-Source: ABdhPJyK+ME4U390q9Mvxhn4yyQjnyEwb5J4Pk64Y4liLe7WtySvGp22/bO45BpXK3lsvidSxjOvxgDpVOZE5wPUYJE=
X-Received: by 2002:ad4:4bc9:: with SMTP id l9mr9578935qvw.36.1624326801992;
 Mon, 21 Jun 2021 18:53:21 -0700 (PDT)
MIME-Version: 1.0
References: <1624324395-7260-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5Bh6J8=E=P1btDdgkYm9bvBN1ituRHLLOtW1cFsheQBdg@mail.gmail.com>
In-Reply-To: <CAOMZO5Bh6J8=E=P1btDdgkYm9bvBN1ituRHLLOtW1cFsheQBdg@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 22 Jun 2021 09:53:11 +0800
Message-ID: <CAA+D8AN4Nch5FMjCDN8vs2+Nqs88k8jvMEBZwQuUdG+9pt1yZA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ASoC: fsl-asoc-card: change dev_err to
 dev_err_probe for defer probe
To: Fabio Estevam <festevam@gmail.com>
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
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 22, 2021 at 9:45 AM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Shengjiu,
>
> On Mon, Jun 21, 2021 at 10:31 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > Don't need to print error message for defer probe
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2:
> > - use dev_err_probe instead of dev_dbg
> >
> >  sound/soc/fsl/fsl-asoc-card.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> > index 121e08c2af2a..24c890d76da0 100644
> > --- a/sound/soc/fsl/fsl-asoc-card.c
> > +++ b/sound/soc/fsl/fsl-asoc-card.c
> > @@ -708,8 +708,8 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >         of_node_put(framemaster);
> >
> >         if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
> > -               dev_err(&pdev->dev, "failed to find codec device\n");
> >                 ret = -EPROBE_DEFER;
> > +               dev_err_probe(&pdev->dev, ret, "failed to find codec device\n");
>
> I know I suggested dev_err_probe() before, but looking at this again, I realized
> that the error message will never be printed.
>
> Maybe the error message could just be deleted?

so I think we can use the v1 one,  use dev_dbg instead.

best regards
wang shengjiu

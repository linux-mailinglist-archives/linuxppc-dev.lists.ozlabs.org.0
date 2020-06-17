Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A92B11FC665
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 08:49:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mwfS31MkzDqXW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 16:49:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=odqwFLWO; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mwcb3rVXzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 16:47:57 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id l17so1038284qki.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 23:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DEOcBwuJujk3Z3FbvmUIja3o6yp5Y5I7OHP6v1ayOdc=;
 b=odqwFLWOfz6VFUZ/AEzD/ygRf/c/++SDJbNN/nwQZkGYj3C6pFFoLlEjFCrjxZnWnZ
 /AXyjECC4SETvu2arNrXc95u4TnzXHHqyDF/78eOtDBo6dibwL8+9lRcggEsnlwVQylQ
 Q6I9RWdTF9CTRakRQnCWZ15SP/vM1mxe7/0K8Ox0WcMFOZtvH87w9Kq6KK9S8dN6tZgz
 scyATY9N9Cqf2C8Yjyt4ZoRiMfOrA3xAq6nE7/EB69NaaPNXIztJjRQI5LyEp/Vgc1tS
 it112IuMOvThGIVcZT1bvRazXFl1FSC3dkTQaQZZAoFopsPy+ebRoNsXOxsCSPGsWH32
 17rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DEOcBwuJujk3Z3FbvmUIja3o6yp5Y5I7OHP6v1ayOdc=;
 b=fXNB0f4SiLscWNoPyl/UM4I1TNutGeFS6k/TAFpvv7ux4/mqpMnQ7iKR1nYp8enBWL
 k6RC826gfWZCRr4PLo3aE+XRt/rezjanpt3XbOCxUVYtDCYXPDZEVG8O5w5D8lZdWZ/V
 qkKFZ3scXCoZEPVCwQAwjqbK1Xf1ZjXZDDaIF65xOoIVIxlXl2QZpTdkbQNecVQ5aki1
 Zo8sGQz+5la9lhigRk13Mj9Elm9CRxeikkWoUaw4ROBD6ObtspfMVVXbBMF6DQOW00nI
 u8gelhJU0uaGdm7cJNHx1M/usNx06kbipssrviezMulH5zxYkkQQDPBWnRDjpkhaIh+F
 w3sA==
X-Gm-Message-State: AOAM53381yEtRqo0X3yQCtDkIj2a4KIytPT0QrqJteBc5mMjDDULy4zy
 hhJxYKjia9qUJsQ2CvuiUtdnffqXOFRNS62EXSE=
X-Google-Smtp-Source: ABdhPJyNV3aHDegvpKj24F79ISjdEF6CE/prSki/wKRdyu+fjUIjtIU5SobzxF++F/MAqTGJ6CjQl08XmDfeZGFvGf8=
X-Received: by 2002:a37:8a43:: with SMTP id m64mr23295848qkd.37.1592376473937; 
 Tue, 16 Jun 2020 23:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <feda3bb02296455d43aeebb7575918d9b28e1a3f.1592368322.git.shengjiu.wang@nxp.com>
 <53a969a83999de91f3ff2809d78335c3f0cc1ee3.1592368322.git.shengjiu.wang@nxp.com>
 <20200617062457.GA6411@Asurada-Nvidia>
In-Reply-To: <20200617062457.GA6411@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 17 Jun 2020 14:47:43 +0800
Message-ID: <CAA+D8AOBA2pM0CXpdEO7NS1fdK8Nv=4gRDQ384v6mV9ip6Ke2Q@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_spdif: Add support for imx6sx platform
To: Nicolin Chen <nicoleotsuka@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 17, 2020 at 2:27 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Wed, Jun 17, 2020 at 12:30:17PM +0800, Shengjiu Wang wrote:
> > The one difference on imx6sx platform is that the root clock
> > is shared with ASRC module, so we add a new flags
> > "shared_root_clock" which means the root clock is independent,
>
> "shared" means "not independent", against "independent" ;)
>
> > then we will not do the clk_set_rate and clk_round_rate to avoid
> > impact ASRC module usage.
> >
> > As add a new flags, we include the soc specific data struct.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> Can add this once fixing the remaining comments:
>
> Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
>
> > +static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif,
> > +                                           int clk)
>
> Can actually merge into single line as kernel has 100-character
> limit now, though 80-char is still preferable for a good coding
> style. But I think this one wouldn't be too bad at all.
>
> > @@ -421,7 +456,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
> >       sysclk_df = spdif_priv->sysclk_df[rate];
> >
> >       /* Don't mess up the clocks from other modules */
>
> We can drop this comments now as it's out-of-date and the name of
> the new helper function is straightforward enough.
>

ok, will send v3.

best regards
wang shengjiu

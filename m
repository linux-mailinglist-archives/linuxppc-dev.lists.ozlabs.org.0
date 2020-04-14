Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D91BE1A7112
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 04:39:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491V6g0pyqzDqDP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 12:38:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::941;
 helo=mail-ua1-x941.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GG1kscR7; dkim-atps=neutral
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491Twh5VZtzDqCk
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 12:30:10 +1000 (AEST)
Received: by mail-ua1-x941.google.com with SMTP id x18so3186748uap.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 19:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=awmGrwmcz5aeG6k8MhFEgBaKuoZUeZk5jIB18zmrVt8=;
 b=GG1kscR7x6EajZgB+6nk3ksaoiMBiXTRMW0RaFD4RVIzeNEG4w0De5NWOLiD4ZLDG1
 gh7sO3nE30kQm9RhUlQU2nmzKEFmx7yhpYtim9eaTvXRuoNDSKjvdZIPvkGEg5RU1yjy
 4xjPgyvrVc/mhQNNfQhayQTfJt46Qo5ykXU7RJfGw5LrK/i3oSo66RQfghLTbMgxMwzr
 TdLVAi8sOZMxaIg1oDg9vLTkiXtPed9UEulCMmWT503xsa430fas5vWruFU2s5+Mkk4n
 2QLA8SAJiaMSgRY5Yn66oRn2D6mpzmti3qOgFglKKGr5u62ckvtW6SopqvesdvS3oEPS
 bfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=awmGrwmcz5aeG6k8MhFEgBaKuoZUeZk5jIB18zmrVt8=;
 b=isw47xb5FRXW3umtQeqms309982uJpjHX9rhs6ZVLC+Efhrp24exefd8XGrM1+eAN8
 eoKAksJe9oO3aWFQt7829Bnekwn3E4/CX0O/H8slNYlFWzoGuiiF/Wqc+G/D4imKGPBg
 OKGNGMJXc6kzZ+1+jjD9Y9wVJVcTWvEAvUOp6t4Fv1Ff0F4gpxWJJGB/jUsjDsKxlRca
 GqLrxPTeLprvxEMBwDHmhG5PCa+ZnhocyGOReaHNmQnMFHsVnE4At91Tmu3rs6B0C8oS
 r+zCwkHrZc3t+7xeCh+pYvlakjTda+8kGJEBHIzX2H0zk5zn1vaBFw+B5q62LkG8xEf5
 k/Fg==
X-Gm-Message-State: AGi0PuYHfsd0NM99aU94OVq5cfROjRpFD8ZY7nW7yGesEoV7qwZnAMkI
 wl6yoh57oRP3K9HacfJJiKNfUS+ofcoljUXhAon7tlJb
X-Google-Smtp-Source: APiQypLMHH0a+6ypkNMRaTXre5eZdgyn24IXJp/BZeN67bbx+T1wgzVcBrLvf9iDyZK21J6aJ/AflIrlpoPaR0RLk+8=
X-Received: by 2002:a05:6902:4a2:: with SMTP id
 r2mr32195235ybs.60.1586830923366; 
 Mon, 13 Apr 2020 19:22:03 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1586747728.git.shengjiu.wang@nxp.com>
 <6d2bed91bcdbc3f75a9d12ac4ebf6c34c9bb9c3f.1586747728.git.shengjiu.wang@nxp.com>
 <20200414020748.GB10195@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200414020748.GB10195@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 14 Apr 2020 10:21:29 +0800
Message-ID: <CAA+D8AN8OUtTftc_So-Z0_sjWt4RXq6fr4GpSy3Xh+YbkryfpQ@mail.gmail.com>
Subject: Re: [PATCH v7 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 10:09 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Apr 14, 2020 at 08:43:07AM +0800, Shengjiu Wang wrote:
> > There is a new ASRC included in i.MX serial platform, there
> > are some common definition can be shared with each other.
> > So move the common definition to a separate header file.
> >
> > And add fsl_asrc_pair_priv and fsl_asrc_priv for
> > the variable specific for the module, which can be used
> > internally.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > +static size_t fsl_asrc_get_pair_priv_size(void)
> > +{
> > +     return sizeof(struct fsl_asrc_pair_priv);
> > +}
>
> Perhaps we haven't understood completely each other's point.
>
> Yet, would the following change work?

Should work, almost same, or do you want me to use variable to
replace function pointer?

best regards
wang shengjiu

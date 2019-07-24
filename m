Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0529972870
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 08:44:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tm6P00QtzDqLk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 16:44:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=daniel.baluta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="DWt/IW5i"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tm4Z4khxzDqJh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 16:42:49 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id a15so40644988wmj.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 23:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yhhTks9k7nEzj+aqUPzjcgfPfrYu7EH2vLu4ISBiDtk=;
 b=DWt/IW5iTiJuFdKySxXe/u8ZM2xivsOCZIeSJPaLQseWNAb2LGlkoIeWzw4rDAztHh
 lGWzWEf5e3Xetp9zUbH80REkydjclSSLXwv5fn9dKednX+X44gs0TBvY0T4bWC2R22hZ
 rc0GxARNjAv5hZB/Xw898dmY091/0pot9hn9hMaGHeeAZNELSzvJLTuhNdblrjv25ZZ1
 /nRgFF2G7a5lm3FuKTwDZjFnFHi/6GAK2lqF0hhXJ0dUl9vCY/t3GMgYCH7PigSbAJ4h
 QxW9esCoWqGFKlASOpemnAmG90MTPBdhAIGa6VYbAlL0OuUTC87dmwXOUcbYFdmmmrw6
 DxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yhhTks9k7nEzj+aqUPzjcgfPfrYu7EH2vLu4ISBiDtk=;
 b=FLrlTys3sn6oK1s+aNmb3jraYbZrM+Ssmh/uHcjIjiTuNfR0RUXpnCJEXiiqpS9hde
 IrGuPd3Alk3auaYaU4Wdqv76mMVqodMljr7qYkWNCv2snCorRcVLQNlVcwPNHbTaS2eJ
 c2F4G0TQifjzCqVwS5D6muQsKIPhijnL0wsK5ZW1sZjk9dINM0qEhkn6yEOQT3YbD+3R
 BXWK8SScYkciZYhK38uSPZ+KZ8x0/BySW99tBTQtygw/FfV2TxX+NWwpJQHlwWv5/4Uh
 sm2luz8zh9cx20mcWuHPQIbEQVUNr1Uio9tR1uxUoaM6dBKZZGrMZTid2+tZFIUe99M0
 4SYQ==
X-Gm-Message-State: APjAAAWk6hb2xvfBgWQZ851e1asLGT98ExNVCaSx0rtjxdMdO2CiYzLS
 n1IVhcpQDLPSjlnzcJlXaOx7skHy24/r8+ABWIE=
X-Google-Smtp-Source: APXvYqwdVUJE/2oWoyFAfBzcKEi4mRXrXogdySO7cGxwUbUTLuzL6gabc5kqGwLm/BmR7O6IXFq3v2LF0AqX/kj3+dg=
X-Received: by 2002:a7b:c051:: with SMTP id u17mr71032749wmc.25.1563950564848; 
 Tue, 23 Jul 2019 23:42:44 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-2-daniel.baluta@nxp.com>
 <20190723170035.GO5365@sirena.org.uk>
In-Reply-To: <20190723170035.GO5365@sirena.org.uk>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 24 Jul 2019 09:42:33 +0300
Message-ID: <CAEnQRZC_mNnwYkpdiX2d_ccT_L-hivWdxQTMEUojjDWv+NCiQg@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH 01/10] ASoC: fsl_sai: add of_match data
To: Mark Brown <broonie@kernel.org>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 23, 2019 at 8:01 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Mon, Jul 22, 2019 at 03:48:24PM +0300, Daniel Baluta wrote:
> > From: Lucas Stach <l.stach@pengutronix.de>
> >
> > New revisions of the SAI IP block have even more differences that need
> > be taken into account by the driver. To avoid sprinking compatible
> > checks all over the driver move the current differences into of_match_data.
> >
> > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > ---
> >  sound/soc/fsl/fsl_sai.c | 22 ++++++++++++++--------
>
> You need to supply your own signoff if you're sending someone else's
> patch - see submitting-patches.rst for details on what signoffs mean and
> why they're required.

Ack. Sorry for missing this.

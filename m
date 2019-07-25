Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D1363746CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 08:08:33 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vMGR1CJHzDqKV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 16:08:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=daniel.baluta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="l1cZEu7o"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vMDP6MWYzDqHH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 16:06:43 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id x15so43776416wmj.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 23:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KCKWfzF66+ujdKKdWZwTIX1edTZnqRGNlAf5n/ijexc=;
 b=l1cZEu7oBoEUbaODHvPDj4hs5QwlbKDNhhHJ+bLSfsucvkhINm8tK2olBGb590JxN6
 8cC0kOI38URs6KzfUm2ptxQ8aU7Qu+yVy9ewhyPBm0JQ3ZhDyplUfBWXXYzfyXpb1+xs
 s9ZF+EvZ2TmDL9mKPay0zyi9g0VWCNnWrRdzOtKjCgJib6v4vcIkHGzQcBua4hTdy4tH
 o0tvMqqwkS+Z21/CbxeDSwmMbtH9E9jkSVAJ5giy1VeIyr0blOIlXK9SvP+dUDlMXVYz
 +NdvK8byqXj/kGmO/ThzaxA4SKOCjI3HM5j9aYFe4YnjXaQqcIzixxG0vf/KUbs07fu7
 O0kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KCKWfzF66+ujdKKdWZwTIX1edTZnqRGNlAf5n/ijexc=;
 b=lkkdZ36IeU32xdDkHf2dcFvRYTOcI65i1jOKtCQKFxFNWoGIMDfRtC15Y2PR3lGq4F
 l0KdYk0UOq4z7YZg/PHjBlm7MmY40+ikGb3Aw4AoYBhjP53OfF538FAYE53T1Izo5NnB
 VlSPbaSsDzDDH1mShGTWu9MQsjFucHTSgxmCVKXYm2LnNjEmZd6k30nywg/a2G3xSnDo
 E4g+iDqlrZMe8MKCkaJ2OGFBE7Gmuz+unRgbZVQUvf08OBhQs3u5FBnLb6DXF2sqa6uD
 E+LVQ0noe5ZNmYGWJLyluNtsb3gqYINCB9nsTS5GFjELkwuPJFeCeR3JNq0wj1aNG4VJ
 fFOw==
X-Gm-Message-State: APjAAAXo9yX2FM4ztBr1VfQQNt/ZfKV9HjCG2sh4yJHi7RqApNrTezxa
 TCTmxKWGUf7GxAqOjOwHEW4M8NdQKtdCZQ9hBYA=
X-Google-Smtp-Source: APXvYqxIPslz5P15OAhT39MHqqaUtf1TLMeZSR/qP2Piw/0OfQIpnkCOtBjfyWYriXs7PAGzu/zSsxP85pq8AEZPaM0=
X-Received: by 2002:a1c:96c7:: with SMTP id y190mr71636835wmd.87.1564034799292; 
 Wed, 24 Jul 2019 23:06:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-10-daniel.baluta@nxp.com>
 <20190724233212.GD6859@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190724233212.GD6859@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 25 Jul 2019 09:06:28 +0300
Message-ID: <CAEnQRZC+5OWwBJfifjeD_8zD3z9efdNMb4Ey0P1Ka+y63v-XNA@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH 09/10] ASoC: fsl_sai: Add support for SAI new
 version
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2019 at 2:32 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jul 22, 2019 at 03:48:32PM +0300, Daniel Baluta wrote:
> > New IP version introduces Version ID and Parameter registers
> > and optionally added Timestamp feature.
> >
> > VERID and PARAM registers are placed at the top of registers
> > address space and some registers are shifted according to
> > the following table:
> >
> > Tx/Rx data registers and Tx/Rx FIFO registers keep their
> > addresses, all other registers are shifted by 8.
>
> Feels like Lucas's approach is neater. I saw that Register TMR
> at 0x60 is exceptional during your previous discussion. So can
> we apply an offset-cancellation for it exceptionally? I haven't
> checked all the registers so this would look okay to me as well
> if there are more than just Register TMR.

It is not just TMR exceptional. There are like half of the registers.
Thus: half of the registers need to be shifted and half of them
need to stay the same as in previous version of SAI.

I'm not seeing yet a neater approach. Lucas idea would somehow
work if regmap will allow some sort of translation function applied
over registers before being accessed.

Maybe Mark has some clues here?

thanks,
daniel.

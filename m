Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B7E823B33D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 05:25:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLKrL2WhFzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 13:25:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=sBAiU3Zc; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLKpV0GXTzDqST
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 13:23:29 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id o22so29687798qtt.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 20:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OJVhQMYihY+NvN1RkvZ0SjRkXEzhAUPHpJk8gf7XSoA=;
 b=sBAiU3ZcXSjalUW9WrVeJ2OfbjDdEBGSBgTOtZUWwMJCUVV26vPbx2WTiLEtTnrOUT
 shPiIFjVpACXcoivs0KjZmrWiOLNzwML1Ua7WyV2bXsLGbXyFGwl3qz4RuP12Wdb9DOE
 dKiGggDR9kXJm7iUS+MP1QMO9VJDHGsJS41dEwTvyJISNEH4xxIWI9H+HdgyKWV4vIBE
 fHvzhBIS4YyFjhsqig4PoC5pjKEQH55GpIp4IsM95gp4jes59+bnfD9CrHpZyvEMFY54
 sY588EVvT9VAkEUKYZfaVCZhcLNToWXlS1U0fxuFHjQXNiy3eVcIOeTQaARbbo2q6oFJ
 ITxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OJVhQMYihY+NvN1RkvZ0SjRkXEzhAUPHpJk8gf7XSoA=;
 b=AN1LKfb7MQ7ighVzhJY9SUAq4eN2+Uks3OXS/Kr62uzpTkFxqm21a/a+dBMa3uyyut
 oYpadCkcI9l81fKLikAo15jVO9usFsccwk6sWd7KsYHgLqBuh5oZ9G4l7kxVv69vuuCZ
 sBXrbCqpJha27GBk5/dCGiiusMzSa2rDc5iPFPJ2CPsx173JZirAfw04TISQ6AUjldpA
 wp5ZOeJvCBEe/D2Ju9H/BMhikPNNL0Gxowd/l7sdwkHOtbzOLIkiogeGSJD8kik1/thK
 CbJYZ5yB9u1Mnw8N/Yzt3D95einAhFbm5kkbgr7hVn/qlZ6QAJFQgWU+XoqiPBrWt7+G
 3B3w==
X-Gm-Message-State: AOAM530qR29edk3e7I/yu7HASrojat1Uj6eFKslnJXqonFWdP+SMKCuH
 LHgq3gnyUdUOJdj9RfB6SdxKMZ768GQC7xNO4IA=
X-Google-Smtp-Source: ABdhPJzlDtQ693Xz7R9IlMrE4fi0XcKTYMO+46NJJ0pRzPdLUk0ADOBBGZM2zpDBY1o9xKlUGQ3OoQgvUqPJju9vHJo=
X-Received: by 2002:aed:2946:: with SMTP id s64mr19963873qtd.204.1596511405886; 
 Mon, 03 Aug 2020 20:23:25 -0700 (PDT)
MIME-Version: 1.0
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
 <20200804030004.GA27028@Asurada-Nvidia>
In-Reply-To: <20200804030004.GA27028@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 11:23:14 +0800
Message-ID: <CAA+D8ANuLQuUO+VsABjt2t1ccK+LGayq13d6EEcV18=4KNaC+w@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 4, 2020 at 11:00 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Aug 04, 2020 at 10:35:12AM +0800, Shengjiu Wang wrote:
> > On Tue, Aug 4, 2020 at 10:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Tue, Aug 04, 2020 at 09:39:44AM +0800, Shengjiu Wang wrote:
> > > > On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > > >
> > > > > On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
> > > > >
> > > > > > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > > > > > is enabled.
> > > > > > >
> > > > > > > You are correct if there's only RX running without TX joining.
> > > > > > > However, that's something we can't guarantee. Then we'd enable
> > > > > > > TE after RE is enabled, which is against what RM recommends:
> > > > > > >
> > > > > > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > > > > > # If the receiver bit clock and frame sync are to be used by
> > > > > > > # both the transmitter and receiver, it is recommended that
> > > > > > > # the receiver is the last enabled and the first disabled.
> > > > > > >
> > > > > > > I remember I did this "ugly" design by strictly following what
> > > > > > > RM says. If hardware team has updated the RM or removed this
> > > > > > > limitation, please quote in the commit logs.
> > > > > >
> > > > > > There is no change in RM and same recommandation.
> > > > > >
> > > > > > My change does not violate the RM. The direction which generates
> > > > > > the clock is still last enabled.
> > > > >
> > > > > Using Tx syncing with Rx clock for example,
> > > > > T1: arecord (non-stop) => set RE
> > > > > T2: aplay => set TE then RE (but RE is already set at T1)
> > > > >
> > > > > Anything that I am missing?
> > > >
> > > > This is a good example.
> > > > We have used this change locally for a long time, so I think it is
> > > > safe to do this change, a little different with the recommandation.
> > >
> > > Any reason for we have to go against the recommendation?
> >
> > Previous code will enable TE and RE  together even for asynchronous
> > mode.
> > And for recommendation, previous code just consider the RX sync with
> > TX, but still violates the recommendation for TX sync with RX case.
> > So at least this new change is some kind of improvement.
>
> Okay. Let's change it then. Please make sure to update/remove
> those old comments in the trigger(). And it's probably better
> to mention that what we do now is a bit different from RM:
>         /*
>          * Enable the opposite direction for synchronous mode
>          * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
>          * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
>          *
>          * RM recommends to enable RE after TE for case 1 and to enable
>          * TE after RE for case 2, but we here may not always guarantee
>          * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
>          * TE after RE, which is against what RM recommends but should
>          * be safe to do, judging by years of testing results.
>          */

Thank you for the agreement.

>
> Btw, do we need similar change for TRIGGER_STOP?

This is a good question. It is better to do change for STOP,
but I am afraid that there is no much test to guarantee the result.

best regards
wang shengjiu

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F4223B2C4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 04:37:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLJn31gBkzDqT7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 12:37:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LONJ8+kD; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLJl40gR2zDqQq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 12:35:27 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id m7so5013418qki.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 19:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WmrOBPbvqH0tUwujk7SVsTyO/ZlaXtcKlCwky7dKn9o=;
 b=LONJ8+kDG0Db9G9T5+29RjtHqahyZ2pcP1Y5qqhDhaLBoNDQPe9wciDe9twj3K35Z7
 mb10Ul7loDbQiIEXxvDd8zgtS4yqZcyovXHGp3m9Ln95AJD0m0UfEJqTKYsB5xQDoli/
 azoAYhW1JbOFIn33KbNEYR9lA9nK6X4lThzpomRRocTm3kar1J5PxiQAoqJHcN+WF80E
 0+09+einulhyH1hBSFH31MHi3ftXyE4A0qbdyMbOmkIpKZiRcuRr6V+72E6LZ+JNMcMq
 0TEPIWd/6zEwOFZA9UTgpXmXCFAT4RskpALMGbIa+BOoGGdiokhzgMgfOxT2/F5gYowk
 ntGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WmrOBPbvqH0tUwujk7SVsTyO/ZlaXtcKlCwky7dKn9o=;
 b=ZZfECnzkfWlegbDGwkMNfjxPhEW44kOCWMTWKDY8UAggXAVE0p7kKzSphMFI/TEUQw
 S7MbMXNEALiDpMNH2ljD7a7KPWunt3dMG7EFjoZUSRtSIooNQYO8MRdmM3Af0R//kZmM
 u6zHI4DstNAiZdc8G622kHGFQDp/Lr/QxG6PNhQgCO0/D/6gSXF4VS0kf5dptheVE3MT
 1+INy4o9xwYqPP197c5G6g557bvC42EwpTptAzj1Ub05MppX6UT16K12C8ZfTm5nDett
 zhrxMDlOE8djq/0fkspE2y0KYSk4KBz0EGyGLgl7pv/+jaiT2PCulmp6/xv4vB2vJm1c
 73eg==
X-Gm-Message-State: AOAM533bqGizkSsjQ1fv9fdCUe5GSYutlZaZpvZoDB1pNZ9nJ/L3iS3E
 yV8ltD26BW6Msw6He/UGC3xb8DgJhcnhMSoHVoQ=
X-Google-Smtp-Source: ABdhPJx1F4Rp5o4LA8Gjn0KDh/r5IB4SF374BJSkFakd8/t+goX1ZwnWeeLNi2DN07CDXxi4Cu81LFxCplyDjnUtX4s=
X-Received: by 2002:a05:620a:628:: with SMTP id
 8mr20046814qkv.103.1596508523476; 
 Mon, 03 Aug 2020 19:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
In-Reply-To: <20200804021114.GA15390@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 4 Aug 2020 10:35:12 +0800
Message-ID: <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
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

On Tue, Aug 4, 2020 at 10:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Aug 04, 2020 at 09:39:44AM +0800, Shengjiu Wang wrote:
> > On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
> > >
> > > > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > > > is enabled.
> > > > >
> > > > > You are correct if there's only RX running without TX joining.
> > > > > However, that's something we can't guarantee. Then we'd enable
> > > > > TE after RE is enabled, which is against what RM recommends:
> > > > >
> > > > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > > > # If the receiver bit clock and frame sync are to be used by
> > > > > # both the transmitter and receiver, it is recommended that
> > > > > # the receiver is the last enabled and the first disabled.
> > > > >
> > > > > I remember I did this "ugly" design by strictly following what
> > > > > RM says. If hardware team has updated the RM or removed this
> > > > > limitation, please quote in the commit logs.
> > > >
> > > > There is no change in RM and same recommandation.
> > > >
> > > > My change does not violate the RM. The direction which generates
> > > > the clock is still last enabled.
> > >
> > > Using Tx syncing with Rx clock for example,
> > > T1: arecord (non-stop) => set RE
> > > T2: aplay => set TE then RE (but RE is already set at T1)
> > >
> > > Anything that I am missing?
> >
> > This is a good example.
> > We have used this change locally for a long time, so I think it is
> > safe to do this change, a little different with the recommandation.
>
> Any reason for we have to go against the recommendation?

Previous code will enable TE and RE  together even for asynchronous
mode.
And for recommendation, previous code just consider the RX sync with
TX, but still violates the recommendation for TX sync with RX case.
So at least this new change is some kind of improvement.

best regards
wang shengjiu

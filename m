Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3276F23B327
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 05:02:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLKKq5v51zDqWS
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 13:02:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=E6lz/F0l; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLKHp2wPdzDqKT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 13:00:20 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id l60so1209220pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 20:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=I/S5vrlNulwp45H+XxtQvmflrkKxTEGHdqIBJtU71UM=;
 b=E6lz/F0loOMWpzwzL9EL5uI8uRE19tRQP8x66a03pEQA0uuyi7toqSi6AoaweZG9K5
 kdGBp5YQODii2KyuK6QSITM5ArS23MuRPv9wtCeM+iFwogJdPooAtuBAD3kl7rBkul3Z
 R574Ut7X2gu4Fp4ggfuY4Tp19hbBgM/cyON+33LrsuHrhR+DMqGp+4VaFCINEnqz63ZH
 SU+QivAajBxArpmeh+oDTzNtjVD6xiliQbWJhcg1lb1tGoBPXM4m1lMUKH4lk3a7Um20
 bqFef/sVT2SphtvqJRmrZQ/S1K9XhN5acH4havK7QeGCXf7JFUlZS1upKs7BOrgz7HLI
 yqYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=I/S5vrlNulwp45H+XxtQvmflrkKxTEGHdqIBJtU71UM=;
 b=l9K34boPg6bvprn5kd2px4TizeaxudkVmbHe3xTvT2pe2TSR4jXHDJZlIFS6eUq6US
 yDxwJK5mOXHyPtys4NeLo8UyItpWyXso9fO9YdjLuKu9GWU5DQK0/NV3TU1VpDISRIEV
 1mFt6MHn5OTdPslxdCdGLq8zWQSzKYJIIacjqjmFN/S9y4z0OF/CC78701h1ltAlPmcn
 veV1nhzHpGdDsXH6oscdQWyzCQKqMYetCQQzwYb4RQQO5R8mGxvG6jTkxlHs2hyDZEfR
 +lKAG4VYMTRSy3r9KjnQynUF+6ovbINeSBiTr0A45QpqLX9uCqGyaVgWohiXCRXmOA8S
 GrXA==
X-Gm-Message-State: AOAM530SzbXfgyYEq2DODylBB3KlqpgQ+r6kayRnFdWZ5mNJxOZOP6Jy
 SXTx22UlXSqL5Uw4CWSBxW8=
X-Google-Smtp-Source: ABdhPJx1+9OQ1P10b47ZvUn/LDad5t2VFaOqWhE2dXRFv7b+mWMz8VgTzGFprojAaDIAxuyGHT5M3Q==
X-Received: by 2002:a17:90b:3652:: with SMTP id
 nh18mr2298790pjb.30.1596510017980; 
 Mon, 03 Aug 2020 20:00:17 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id j142sm21055148pfd.100.2020.08.03.20.00.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Aug 2020 20:00:17 -0700 (PDT)
Date: Mon, 3 Aug 2020 20:00:05 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200804030004.GA27028@Asurada-Nvidia>
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
 <20200804021114.GA15390@Asurada-Nvidia>
 <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANagfMXPAkK4-vBDY9rZMukVUXs8FfBCHS0avXt57pekA@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Tue, Aug 04, 2020 at 10:35:12AM +0800, Shengjiu Wang wrote:
> On Tue, Aug 4, 2020 at 10:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Tue, Aug 04, 2020 at 09:39:44AM +0800, Shengjiu Wang wrote:
> > > On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > >
> > > > On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
> > > >
> > > > > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > > > > is enabled.
> > > > > >
> > > > > > You are correct if there's only RX running without TX joining.
> > > > > > However, that's something we can't guarantee. Then we'd enable
> > > > > > TE after RE is enabled, which is against what RM recommends:
> > > > > >
> > > > > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > > > > # If the receiver bit clock and frame sync are to be used by
> > > > > > # both the transmitter and receiver, it is recommended that
> > > > > > # the receiver is the last enabled and the first disabled.
> > > > > >
> > > > > > I remember I did this "ugly" design by strictly following what
> > > > > > RM says. If hardware team has updated the RM or removed this
> > > > > > limitation, please quote in the commit logs.
> > > > >
> > > > > There is no change in RM and same recommandation.
> > > > >
> > > > > My change does not violate the RM. The direction which generates
> > > > > the clock is still last enabled.
> > > >
> > > > Using Tx syncing with Rx clock for example,
> > > > T1: arecord (non-stop) => set RE
> > > > T2: aplay => set TE then RE (but RE is already set at T1)
> > > >
> > > > Anything that I am missing?
> > >
> > > This is a good example.
> > > We have used this change locally for a long time, so I think it is
> > > safe to do this change, a little different with the recommandation.
> >
> > Any reason for we have to go against the recommendation?
> 
> Previous code will enable TE and RE  together even for asynchronous
> mode.
> And for recommendation, previous code just consider the RX sync with
> TX, but still violates the recommendation for TX sync with RX case.
> So at least this new change is some kind of improvement.

Okay. Let's change it then. Please make sure to update/remove
those old comments in the trigger(). And it's probably better
to mention that what we do now is a bit different from RM:
	/*
	 * Enable the opposite direction for synchronous mode
	 * 1. Tx sync with Rx: only set RE for Rx; set TE & RE for Tx
	 * 2. Rx sync with Tx: only set TE for Tx; set RE & TE for Rx
	 *
	 * RM recommends to enable RE after TE for case 1 and to enable
	 * TE after RE for case 2, but we here may not always guarantee
	 * that happens: "arecord 1.wav; aplay 2.wav" in case 1 enables
	 * TE after RE, which is against what RM recommends but should
	 * be safe to do, judging by years of testing results.
	 */

Btw, do we need similar change for TRIGGER_STOP?

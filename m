Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B1F23B2A2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 04:13:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLJFD72W0zDqT4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 12:13:04 +1000 (AEST)
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
 header.s=20161025 header.b=nsaApM3N; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLJCR3jYmzDqFp
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Aug 2020 12:11:31 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id lx9so1168908pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 03 Aug 2020 19:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lbNLUcgcp61dwL2pAmmG5QRL/i/NBysb7/NHuyoqPLA=;
 b=nsaApM3NTHR6R2T7nNwk1CPtmRQNw6viH5XfJjq+O/bdtm2Q65KlN7iX7rf0eDE2qg
 5OLREwXWLFEHVv+VPMreRV8/KN++G49x7xksnDd35LSOkcVgys8ZxB77H0fAJj/3vZ/V
 yIiGurTTSdPHHAeQKYX4VU0LXG0Uka8AQiqD4fW5iPAxg06Oh8EH1XBGIPIhjZtHXcmb
 xdH6v3suapQPOEpFVl1imcrWg4X0iyxtm3wU9LHtRDST7W6+uMcVWuCBJbivdT34z0kd
 OAMK6zph824b2NMgpfzKgT1pRY/9HfGNHMgt4WrjYrfbsLt8Adr7dHzIcmOypE8599y+
 WfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lbNLUcgcp61dwL2pAmmG5QRL/i/NBysb7/NHuyoqPLA=;
 b=VI5/TrAVZOTCLwZPMIXyMViOzsm4kr4KjphlvntvHZ4041QcrQkhvR61flXoIfM5dY
 /x4gwo06devzU7heRjfCPM4oFd6NWhDaVZfPkCtqMWJ02b2XNwa9Vd6fjyDbhw9nvJf0
 saY9rFan7B6cYlySJJ5NUFdwEd9M14I6Mv7GFGP7TVE43dgZZ/z4brGH/N3f7qxPKYIp
 97f7i7q/OqGLvmlG52/TI+XEVLKfx4AH1o4an7RzYykprH3f9yguHKo1G8mAb46NmbrX
 Mz9XjbiUB/xouA+JhCpcp7lopMyGca0/DmcNacpwT2UXvqLXi/ooM2Z9Izk4vuxG4HBx
 ddbA==
X-Gm-Message-State: AOAM533vBSvawKC1LP3WLZDwcMJhytvx+KwNmheimi3Xfha8xVzzpwj2
 RuTkOly7sGv0KOAFps8ayyc=
X-Google-Smtp-Source: ABdhPJxXJgybVnO38/6iDmh+Vn8Q3oldCX79b37Cqy+zqFF47vMHsrWFuGMjDfgGwC4Ihu/GP11gEQ==
X-Received: by 2002:a17:90a:bc41:: with SMTP id
 t1mr2042798pjv.181.1596507088135; 
 Mon, 03 Aug 2020 19:11:28 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id j142sm20970462pfd.100.2020.08.03.19.11.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 03 Aug 2020 19:11:27 -0700 (PDT)
Date: Mon, 3 Aug 2020 19:11:15 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Clean code for synchronize mode
Message-ID: <20200804021114.GA15390@Asurada-Nvidia>
References: <1596424674-32127-1-git-send-email-shengjiu.wang@nxp.com>
 <20200803054037.GA1056@Asurada-Nvidia>
 <CAA+D8AOGF44UUq=P1S-M5TUwDUaOnqVmHJKPDBM9DAzt1nVzmQ@mail.gmail.com>
 <20200803215735.GA5461@Asurada-Nvidia>
 <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANQxnvR2bOyHVRs5h2NJhMeVh4gjLPknaz7aQ86MtL0sQ@mail.gmail.com>
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

On Tue, Aug 04, 2020 at 09:39:44AM +0800, Shengjiu Wang wrote:
> On Tue, Aug 4, 2020 at 5:57 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Mon, Aug 03, 2020 at 04:04:23PM +0800, Shengjiu Wang wrote:
> >
> > > > > clock generation. The TCSR.TE is no need to enabled when only RX
> > > > > is enabled.
> > > >
> > > > You are correct if there's only RX running without TX joining.
> > > > However, that's something we can't guarantee. Then we'd enable
> > > > TE after RE is enabled, which is against what RM recommends:
> > > >
> > > > # From 54.3.3.1 Synchronous mode in IMX6SXRM
> > > > # If the receiver bit clock and frame sync are to be used by
> > > > # both the transmitter and receiver, it is recommended that
> > > > # the receiver is the last enabled and the first disabled.
> > > >
> > > > I remember I did this "ugly" design by strictly following what
> > > > RM says. If hardware team has updated the RM or removed this
> > > > limitation, please quote in the commit logs.
> > >
> > > There is no change in RM and same recommandation.
> > >
> > > My change does not violate the RM. The direction which generates
> > > the clock is still last enabled.
> >
> > Using Tx syncing with Rx clock for example,
> > T1: arecord (non-stop) => set RE
> > T2: aplay => set TE then RE (but RE is already set at T1)
> >
> > Anything that I am missing?
> 
> This is a good example.
> We have used this change locally for a long time, so I think it is
> safe to do this change, a little different with the recommandation.

Any reason for we have to go against the recommendation?

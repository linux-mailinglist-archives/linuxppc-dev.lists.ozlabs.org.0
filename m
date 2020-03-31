Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A431992C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 11:57:41 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s4WR0P25zDqR0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 20:57:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=veoTVgVR; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s4TT2sSSzDqR0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 20:55:56 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id h72so10111547pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 02:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OhHn08M8/D8HCM9gjXRbI/j0PhmAwA3tYAp3gRgxrKk=;
 b=veoTVgVRtYQTK+5zN3HYDh+HdtUTeX2nPPRVzQPABdleK9zHQb4Qfl3r/T33195phu
 DUMvCdDjmJ78SwW3P5o7zoX0gQW9ZZDwSrxEVbpixY5yShzky96M6m66YJKWwWc/MH7V
 DTMF5UWOC4YbOb73eYMwZR65xCARdm0J/queSu86YPQrB0FH77ohZOcmu/5KUeQVQ6I4
 nQFqCHefw2XGkVEG/L6uSEWsxvl3sjAAL6Ir2zECJfvkWLoJdbK4tzNXLmcUYsGJ/sBq
 CPnwAaW2kHAUq3VyOfa33eKhAyvQVC0DX4/21UX9tD/bRIhnr7KrIZxDHyWY1o/jw5ul
 +t5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=OhHn08M8/D8HCM9gjXRbI/j0PhmAwA3tYAp3gRgxrKk=;
 b=sidjzNX+SiGhLyrkc+kqzu1AhN/tVuNjGB/XnKns+KGPwSv+aBlD5zDKQofZ2zXDfM
 4U4fgG2dsYSCv+ffstDgueFmA4cTttbOpWlX0TKMjpm8AkjJ1RjMPRoO8xKG5TNneLGc
 qwZFWvIauWEkTrf15iHREwDBk/384JnL1bRsYJ8WgPBnFpHVvUQxq2BHYNRXKyRQSA2X
 16ncXNWPNppKaTj3Pf34jtkN9ATl6AQte3kcrZnnAUEoQAK4viNgVA28X9c/fPg0Mb8z
 mcgQAyI/uQqJD1E8+EdM62qvyEbvWQIWkS+RNAj3OSCJYMXkSNtYDHC3yl/i66rfSOB7
 L02A==
X-Gm-Message-State: AGi0PubXBEdhH6t76cCdLzX7wREr8MB9iykAoIoPXLJAlBEQyTy57zVH
 XDE3rYYhZJ107dErYxpL+TU=
X-Google-Smtp-Source: APiQypKviN8/GNUryvnwnsY+oU28GHx/wV6pyb4CAI4uheoqqx5DsQb2OaoNtRTW26FnN4BK6da7gA==
X-Received: by 2002:a63:8ac3:: with SMTP id y186mr4395435pgd.277.1585648552952; 
 Tue, 31 Mar 2020 02:55:52 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 mq6sm1626110pjb.38.2020.03.31.02.55.52
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 31 Mar 2020 02:55:52 -0700 (PDT)
Date: Tue, 31 Mar 2020 02:55:34 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property
 fsl,asrc-format
Message-ID: <20200331095534.GA2976@Asurada>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
 <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
 <20200320173213.GA9093@bogus>
 <20200323212038.GA7527@Asurada-Nvidia.nvidia.com>
 <CAA+D8APu0JYqnUvY+fCYTcZ9U1BCv-zU8J4Zt-5doZcNkgaXFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8APu0JYqnUvY+fCYTcZ9U1BCv-zU8J4Zt-5doZcNkgaXFQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 10:28:25AM +0800, Shengjiu Wang wrote:
> Hi
> 
> On Tue, Mar 24, 2020 at 5:22 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Fri, Mar 20, 2020 at 11:32:13AM -0600, Rob Herring wrote:
> > > On Mon, Mar 09, 2020 at 02:19:44PM -0700, Nicolin Chen wrote:
> > > > On Mon, Mar 09, 2020 at 11:58:28AM +0800, Shengjiu Wang wrote:
> > > > > In order to support new EASRC and simplify the code structure,
> > > > > We decide to share the common structure between them. This bring
> > > > > a problem that EASRC accept format directly from devicetree, but
> > > > > ASRC accept width from devicetree.
> > > > >
> > > > > In order to align with new ESARC, we add new property fsl,asrc-format.
> > > > > The fsl,asrc-format can replace the fsl,asrc-width, then driver
> > > > > can accept format from devicetree, don't need to convert it to
> > > > > format through width.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
> > > > >  1 file changed, 5 insertions(+)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > > > index cb9a25165503..780455cf7f71 100644
> > > > > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > > > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > > > @@ -51,6 +51,11 @@ Optional properties:
> > > > >                     will be in use as default. Otherwise, the big endian
> > > > >                     mode will be in use for all the device registers.
> > > > >
> > > > > +   - fsl,asrc-format     : Defines a mutual sample format used by DPCM Back
> > > > > +                   Ends, which can replace the fsl,asrc-width.
> > > > > +                   The value is SNDRV_PCM_FORMAT_S16_LE, or
> > > > > +                   SNDRV_PCM_FORMAT_S24_LE
> > > >
> > > > I am still holding the concern at the DT binding of this format,
> > > > as it uses values from ASoC header file instead of a dt-binding
> > > > header file -- not sure if we can do this. Let's wait for Rob's
> > > > comments.
> > >
> > > I assume those are an ABI as well, so it's okay to copy them unless we
> >
> > They are defined under include/uapi. So I think we can use them?
> >
> > > already have some format definitions for DT. But it does need to be copy
> > > in a header under include/dt-bindings/.
> >
> > Shengjiu is actually quoting those integral values, rather than
> > those macros, so actually no need copy to include/dt-bindings,
> > yet whoever adds this format property to a new DT would need to
> > look up the value in a header file under include/uapi. I's just
> > wondering if that's okay.
> >
> > Thanks
> Shall I keep this change or drop this change?

This version of patch defines the format using those two marcos.
So what Rob suggested is to copy those defines from uapi header
file to dt-bindings folder. But you don't intend to do that?

My follow-up mail is to find if using integral values is doable.
Yet, not seeing any reply further. I think you can make a choice
to send it -- We will see how Rob acks eventually, or not.

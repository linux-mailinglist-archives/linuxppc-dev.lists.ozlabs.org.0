Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DB18D5E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Mar 2020 18:33:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kW8x5FmHzF08G
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 04:33:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.193;
 helo=mail-il1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
 [209.85.166.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kW780vCbzDvgD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 04:32:19 +1100 (AEDT)
Received: by mail-il1-f193.google.com with SMTP id d14so6324377ilq.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Mar 2020 10:32:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FXIfsAVUFp8IJFPm+/hNheLawxwEVeZKgbspez8Hy3A=;
 b=dkT66fhUD4EW2m3ZMh2GRlGj4FSFmY5TC1QgD7OYqDy07mTaua1z8DARI4prWbIuEO
 +lEzPRay8V/fDHHgVodoLSiLB3J2yIywZBGL9Rg0hy9ayCcwxpRyjo611rLNLedbVtDd
 PKPWBYwx+BZrjmLRZ6fyhxcS6dTOJXSP3QVB7E1mftU8GooKLgnYCY3YcC1XznKeBx5J
 DcdAvaieBwiR9N5XX8GLruGEdIF0G1F5a6zkjV9pd99TPl7fudwzE2nBWbuzqfWwUq07
 fUikFbq/3rzAsnP6Yc7ffKpkd2NgQiaEh9CMbkHZEjsXgyppFykO3e1ogtTDyAiNTMTf
 MOHg==
X-Gm-Message-State: ANhLgQ0WPpvbgvzqRLDSz+z3mdG5A3WNrUF5EPLaaNd/MX5lsIi+kRuy
 hRce1CZjZrx3ZNS5GMS98g==
X-Google-Smtp-Source: ADFU+vvyOEHh52ksLg64oqQQtskIyPgC3Gb9PgcVjz3NdBpqcYEYi8YkzZvcjgp/TY2ZkGE4F1dg5g==
X-Received: by 2002:a92:d641:: with SMTP id x1mr9850010ilp.223.1584725536379; 
 Fri, 20 Mar 2020 10:32:16 -0700 (PDT)
Received: from rob-hp-laptop ([64.188.179.250])
 by smtp.gmail.com with ESMTPSA id j23sm1874792ioa.10.2020.03.20.10.32.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Mar 2020 10:32:15 -0700 (PDT)
Received: (nullmailer pid 16573 invoked by uid 1000);
 Fri, 20 Mar 2020 17:32:13 -0000
Date: Fri, 20 Mar 2020 11:32:13 -0600
From: Rob Herring <robh@kernel.org>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property
 fsl,asrc-format
Message-ID: <20200320173213.GA9093@bogus>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
 <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 09, 2020 at 02:19:44PM -0700, Nicolin Chen wrote:
> On Mon, Mar 09, 2020 at 11:58:28AM +0800, Shengjiu Wang wrote:
> > In order to support new EASRC and simplify the code structure,
> > We decide to share the common structure between them. This bring
> > a problem that EASRC accept format directly from devicetree, but
> > ASRC accept width from devicetree.
> > 
> > In order to align with new ESARC, we add new property fsl,asrc-format.
> > The fsl,asrc-format can replace the fsl,asrc-width, then driver
> > can accept format from devicetree, don't need to convert it to
> > format through width.
> > 
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > index cb9a25165503..780455cf7f71 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > @@ -51,6 +51,11 @@ Optional properties:
> >  			  will be in use as default. Otherwise, the big endian
> >  			  mode will be in use for all the device registers.
> >  
> > +   - fsl,asrc-format	: Defines a mutual sample format used by DPCM Back
> > +			  Ends, which can replace the fsl,asrc-width.
> > +			  The value is SNDRV_PCM_FORMAT_S16_LE, or
> > +			  SNDRV_PCM_FORMAT_S24_LE
> 
> I am still holding the concern at the DT binding of this format,
> as it uses values from ASoC header file instead of a dt-binding
> header file -- not sure if we can do this. Let's wait for Rob's
> comments.

I assume those are an ABI as well, so it's okay to copy them unless we 
already have some format definitions for DT. But it does need to be copy 
in a header under include/dt-bindings/.

Rob

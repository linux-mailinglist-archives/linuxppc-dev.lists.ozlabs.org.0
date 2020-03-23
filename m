Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E8681190032
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 22:22:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mS5D6zY4zDr5Z
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 08:22:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=A8YmmXZ0; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mS3M10c9zDqtv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 08:20:44 +1100 (AEDT)
Received: by mail-pl1-x641.google.com with SMTP id v23so2419617ply.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 14:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Gwk+oA56w7chZgB5rwcFzqm1eElVocnK0t0AHCBP8yQ=;
 b=A8YmmXZ0cGVBB3dUxG1y25+NUkRk38YFfGLeUWWJ++mJoZ1YBc1+Rk/EhQTctZAKeI
 dLaY219krh3CUOauviJMyB7ko8zTiEsdp7JsjxNonedzp2vpQNqsy0Z0iOOUmVv9Djap
 wzLMDPQeZMuXwUVCWNIngfyA9DEOvDpbfoSk/vAEmL0GlkiWov2zYfOjxxaP7iTG1cNK
 GzpQkSBw4fsb1Yz9EZusHfyAZdrPaJ1GA7MA6rifEZnSmIdCN7vslqhnhXx6A/pwkp/Z
 /1uII2u0+t7Kcdw2R4fXbCNmayagQ2Cs2jIdKt30hMa2qVqgFpRkYsbWroLqNfd9emcd
 tStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Gwk+oA56w7chZgB5rwcFzqm1eElVocnK0t0AHCBP8yQ=;
 b=WSmd7sFwHL/fiJJwiDNIdgg7mnEL1Y82L2g68SgHVcv+ue8BKUdfiZt+dl+Th6Md1P
 sXKIx/Jxqt73taEXpWeb705NoTxNZTqy4Jq1UV0BAQL3DP48uuATGT7m5vGPYJu0LuBs
 1T9OG5AYUZi8dLNdX+wcgkctVj17GcS9PFkUfZfYepKhbPJ1TIm81p9AU4Ak3Ik5jCje
 u3SkvdPB9d7rnfQlfIHYoWAjlvNmn1Jz8En00g8Ok4fG6kcdUTIqrfJQikJwZo991c4q
 luDBVCJK6yVCNd/UaRSBp0z7nsSj9+x0qu11kX02/l7DTt+BVPAN9r0octaeQKQ749SB
 eoNg==
X-Gm-Message-State: ANhLgQ3wvUT3KueuCZMW1HS4aHwYNqopkoLW44ioiCZH4cjss7TxkDRL
 Gff22OJG+eyaPG9bxFzja3k=
X-Google-Smtp-Source: ADFU+vv7tlepPAmm35itIz/eXxTaP0rUCj7Y76PBef7aDXcjLbwyTDKZpymRXFDJNAm9wfFzB26DWQ==
X-Received: by 2002:a17:90a:208:: with SMTP id
 c8mr1410640pjc.153.1584998442547; 
 Mon, 23 Mar 2020 14:20:42 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id s19sm14469184pfh.218.2020.03.23.14.20.41
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 23 Mar 2020 14:20:42 -0700 (PDT)
Date: Mon, 23 Mar 2020 14:20:39 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 1/7] ASoC: dt-bindings: fsl_asrc: Add new property
 fsl,asrc-format
Message-ID: <20200323212038.GA7527@Asurada-Nvidia.nvidia.com>
References: <cover.1583725533.git.shengjiu.wang@nxp.com>
 <24f69c50925b93afd7a706bd888ee25d27247c78.1583725533.git.shengjiu.wang@nxp.com>
 <20200309211943.GB11333@Asurada-Nvidia.nvidia.com>
 <20200320173213.GA9093@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200320173213.GA9093@bogus>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 20, 2020 at 11:32:13AM -0600, Rob Herring wrote:
> On Mon, Mar 09, 2020 at 02:19:44PM -0700, Nicolin Chen wrote:
> > On Mon, Mar 09, 2020 at 11:58:28AM +0800, Shengjiu Wang wrote:
> > > In order to support new EASRC and simplify the code structure,
> > > We decide to share the common structure between them. This bring
> > > a problem that EASRC accept format directly from devicetree, but
> > > ASRC accept width from devicetree.
> > > 
> > > In order to align with new ESARC, we add new property fsl,asrc-format.
> > > The fsl,asrc-format can replace the fsl,asrc-width, then driver
> > > can accept format from devicetree, don't need to convert it to
> > > format through width.
> > > 
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 5 +++++
> > >  1 file changed, 5 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > index cb9a25165503..780455cf7f71 100644
> > > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > @@ -51,6 +51,11 @@ Optional properties:
> > >  			  will be in use as default. Otherwise, the big endian
> > >  			  mode will be in use for all the device registers.
> > >  
> > > +   - fsl,asrc-format	: Defines a mutual sample format used by DPCM Back
> > > +			  Ends, which can replace the fsl,asrc-width.
> > > +			  The value is SNDRV_PCM_FORMAT_S16_LE, or
> > > +			  SNDRV_PCM_FORMAT_S24_LE
> > 
> > I am still holding the concern at the DT binding of this format,
> > as it uses values from ASoC header file instead of a dt-binding
> > header file -- not sure if we can do this. Let's wait for Rob's
> > comments.
> 
> I assume those are an ABI as well, so it's okay to copy them unless we 

They are defined under include/uapi. So I think we can use them?

> already have some format definitions for DT. But it does need to be copy 
> in a header under include/dt-bindings/.

Shengjiu is actually quoting those integral values, rather than
those macros, so actually no need copy to include/dt-bindings,
yet whoever adds this format property to a new DT would need to
look up the value in a header file under include/uapi. I's just
wondering if that's okay.

Thanks

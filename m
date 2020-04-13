Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6B91A6235
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 06:35:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490wm544Q8zDqTP
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 14:35:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eBiubb27; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490wgc4mL8zDqSh
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 14:31:53 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id b7so3384962pju.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Apr 2020 21:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=cncGDqt7fHMkXaI3l27jxuKAAcyo4TLpPS8jKmBxrB8=;
 b=eBiubb27eRyfe+lqxro+fYFl17BREZ/tw3ox6LXKc1U/ONkBvPz2I8GVeROXQJ7wDj
 73JzWAIKxOS6cEpL+iXc7cNlFy4hOHVYSpV2w2OIpeUVoVobgJyP9i2q44KFCf+GPyTA
 GEmZWDuoMpA/fBn/CbKSP/HizQZT8hPsyzwWOuSvUMHbN5NJrtiAmVQlR5zSrtAMfkI8
 mJS7YB+LNizev96VgVNzWAlIAP3/zo/zBcFnaNiAITdOTfpSuS931MEfKZxM4IJAtaM1
 Ia/LZKRL2Y0qjmSeQ4mOprXlig5OGHKdATdfieX4b1exDKqvz7H5VVd0obql2UrtLT+m
 Ppsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cncGDqt7fHMkXaI3l27jxuKAAcyo4TLpPS8jKmBxrB8=;
 b=TUB9K0O31qaRvVmoADv01NsvgMv9GVE5/dv1d85kYy5RFuNoCl0b+hwg1Oyk1qMRIg
 UuGf68g8/LoPOVAVLM0Gf3wINpHreGKBRV1TS48dsYTG6Mw3+sK/Z/PAWkxkmXC4ZRKS
 NT8eN75XywKxNi1EaopcYuhp3NqSESL8pakdmeIDsM9HgkAr0g8+I3TDrI3g5zLy3/Jg
 +PGwYjUkCUqpc8bpsy3IhksKhj8Q1jzu8+pzAtDkp5f+KwxrEZXY8mECclt2jfDH93N7
 aE/+4yFlR9CL3FxjZTkWoXxEPCWVERFyZKtHSFoGQ6HDWRosKdDaWBIxnIHKS3fC1GUW
 pBMA==
X-Gm-Message-State: AGi0PubY0GfR6b1fbD5Ije9X3JmQZj+UPe/BmcBAgMDYXwaaK/DfIqPj
 bnXjxbTtphO3LZkr8+vBdd8=
X-Google-Smtp-Source: APiQypIRcMeZlHWm/EdnTHFU5olUz6v2AbqayudJLIZ+rDTXU5dozNE4arV7AQtDkr6IOFCAM0uXRg==
X-Received: by 2002:a17:902:784c:: with SMTP id
 e12mr15604537pln.191.1586752309748; 
 Sun, 12 Apr 2020 21:31:49 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 m9sm7546835pff.93.2020.04.12.21.31.48
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 12 Apr 2020 21:31:49 -0700 (PDT)
Date: Sun, 12 Apr 2020 21:31:43 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
Message-ID: <20200413043143.GA9116@Asurada>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
 <20200412020814.GA5984@Asurada>
 <CAA+D8AOapHbw_AREcJmef2tnM4aNiU11FLacW3HS7CXQThs80Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AOapHbw_AREcJmef2tnM4aNiU11FLacW3HS7CXQThs80Q@mail.gmail.com>
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

On Mon, Apr 13, 2020 at 11:16:31AM +0800, Shengjiu Wang wrote:
> On Sun, Apr 12, 2020 at 10:08 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Sat, Apr 11, 2020 at 01:49:43PM +0800, Shengjiu Wang wrote:
> >
> > > > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > > > > index b15946e03380..5cf0468ce6e3 100644
> > > > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > > >
> > > > > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
> > > > >               return ret;
> > > > >       }
> > > > >
> > > > > -     pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> > > > > +     pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
> > > >
> > > > If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> > > > define in this file too, rather than in the header file.
> > > >
> > > > And could fit 80 characters:
> > > >
> > > > +       pair = kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
> >
> > > I will use a function pointer
> > >     int (*get_pair_priv_size)(void)
> >
> > Since it's the size of pair or cts structure, could be just a
> > size_t variable?
> 
> Yes, should be "size_t (*get_pair_priv_size)(void)"

Does it have to be a function? -- how about this:

struct pair {
	...
	size_t private_size;
	void *private;
};

probe/or-somewhere() {
	...
	pair->private = pair_priv;
	pair->private_size = sizeof(*pair_priv);
	...
}

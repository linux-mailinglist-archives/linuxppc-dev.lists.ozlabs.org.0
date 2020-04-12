Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11BC41A5BF9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 04:10:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490FZT56B4zDqcH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Apr 2020 12:10:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lDpwEbYH; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490FXk3vhNzDqZk
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Apr 2020 12:08:35 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u65so2943774pfb.4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Apr 2020 19:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=2XTiPR3NjTU2y5mQ5J0Pv6fdfmC7aqoQXGxB8xurXAY=;
 b=lDpwEbYHC9at0O1/B5PbecUoT+1zLNbJJBOjARMz1vPiPAZBxvUrVH5hV342v8CaFt
 a+I5t0MMp3yKWm1/XhdBCF5fMcDcvldG3YzNzo+98u9VjmM3qkmwU2LEH1R5FVaSneic
 7+y6w8ZmazEseq6ypQ+mk1+A5Yc9E34zL7pYLna9QbmUpef2c50w7XcQPXQXgPs9c84L
 YuZFpYEZ1xgZfskMHnj0FcLrXcK3dxQEc9RdlUv+5pH0JvRJHiFGrlGfuJwKfUeRJVPG
 xtDq/X8ZmLWtOjlWR5J0H7sDNy2S02+b8TZnC5h3QRrLCz80U5KzDaIU5uriOG0mmL0J
 KDVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=2XTiPR3NjTU2y5mQ5J0Pv6fdfmC7aqoQXGxB8xurXAY=;
 b=MwbUGzq0eypyAK6e9cc3gsScFH5pDYR1/NR/XcPUU67WAEnCgB+tYqGwqLzM4WjnSp
 4Ql9nSmj62Rwbkjhg4e4MnQmP3CmcuieG+MEJ8TkLw7HhXU4sEdQoIK4ce2ejcAt+St3
 Z9iIz9oK6GKomWOCyscD0qNkcxLETaXMSzZwsX+bnpkESQw/edAZuXEzSFH6VmTQf+wQ
 trEtG7WJTTl3m8F5I3g6TAROFSzDlt2LzQ7WL7c2DyrIlH4WGWg3pBy3+DTjBtXV4Lus
 jLjHW4qtbVsOt5uwbBpLrTzwF7KLqifRpwpVhbN4vpYxFb8EPc5mdC78rexy7iRzhw4i
 ss9g==
X-Gm-Message-State: AGi0PuZMaNtga0fP7L/gnm5KScpzF/k0cuA22vcK/TvgB57f8dceWU+C
 6gLeesWT8pVCew7WQf/7zko=
X-Google-Smtp-Source: APiQypJ60bO+ukorWl/8JR2FaX5qNy91w61uKW994f9Dy9yVPv9w6abyS3PWd2+Up8uTp/PFc4Ngxw==
X-Received: by 2002:a62:cf82:: with SMTP id b124mr7362893pfg.124.1586657312126; 
 Sat, 11 Apr 2020 19:08:32 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 b16sm5148188pfb.71.2020.04.11.19.08.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 11 Apr 2020 19:08:31 -0700 (PDT)
Date: Sat, 11 Apr 2020 19:08:14 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
Message-ID: <20200412020814.GA5984@Asurada>
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
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

On Sat, Apr 11, 2020 at 01:49:43PM +0800, Shengjiu Wang wrote:

> > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > > index b15946e03380..5cf0468ce6e3 100644
> > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> >
> > > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
> > >               return ret;
> > >       }
> > >
> > > -     pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> > > +     pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
> >
> > If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> > define in this file too, rather than in the header file.
> >
> > And could fit 80 characters:
> >
> > +       pair = kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);

> I will use a function pointer
>     int (*get_pair_priv_size)(void)

Since it's the size of pair or cts structure, could be just a
size_t variable?

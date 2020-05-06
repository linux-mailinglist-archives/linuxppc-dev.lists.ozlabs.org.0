Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 01CC51C65E6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 04:35:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H10Z11sdzDqTx
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 12:35:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=R1384l/6; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H0yV1DSzzDqSq
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 12:33:37 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id s9so513914qkm.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 May 2020 19:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gcP618iUXG0oqvLPr7DNo5hRWczpuu2twtPmXxdhVpw=;
 b=R1384l/6yWHB4ooeXERU+zst6yVVl4qdVKUOLKPDL0IFR5k6aI6g7gRjbAuwT4BzKA
 Z6KH+95F2q4yXt//grj2uZFTWLNoNm8Lu5dIBlqAf5q0PVULxKpDhwpgZFvf7hcM1z7o
 JWEEw5dFLm4KLFcz3u7lzAjqWTBHjwaPx8OKXuovGeWFo+iTfTDqNgZ8cVEmx2m0Vs6k
 EANIs7E1P/Hmi/gKrN2ZVtZbqWaVt+JTnGqrK3+DtfWnoQ9itU1GBE/rj7qiUUNBnx8m
 YJeMGceUIQe7nPht9WV59pnmBnFXycdSyUqerr4PwnHuvfUnVMkw7uFBR3BIpqH5dNjA
 mXwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gcP618iUXG0oqvLPr7DNo5hRWczpuu2twtPmXxdhVpw=;
 b=UKMqD5oTXUUr7TZrBPrmQRY3nwYyfVyppq29+ldKHTcEbcrIwveGb0530k0+mqzMjc
 PmpBxYyHeRiNk8RXqHR9aW7hs6FTEYZvGnEpBT2NWUNBo+iQ3TR5WG+oeZOBILFlqvn+
 yg9iu0CPx8rNfw8p5A0ja108f0kRCHWNFtpKoAcw2pFeZ9ZIz9ulS0nnkUE18mJyXnp1
 K7B984UxjzfpnX9YFqzwUB+5VRvvDjPIz7hBS0DzxhgznF8FFRc9MmJc5nFLttDdf4Pu
 q2ztZygylSQPm0KSZG2s7nxReZNAVGTmLmoMuBHigfyCrRsJvEjd9rn9KvVjKsSsBQut
 +p5Q==
X-Gm-Message-State: AGi0PuZA8/JGToY4O+vtYVejzclMRXP6+wrNtGl3C6uaMqEAFTrEcngb
 0fulArbEudud82VvvsQi3sm+sMVnE22l+/VLpbU=
X-Google-Smtp-Source: APiQypKPqLRAV/6/dDdwBHpa1YXOYCMpbodQ4y1LcTQnjLMmx87XtQKGZI8fOwO9Tnx5Ay5TOzZj8htcdEBmp+Z16mI=
X-Received: by 2002:a05:620a:89d:: with SMTP id
 b29mr6804070qka.103.1588732414259; 
 Tue, 05 May 2020 19:33:34 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
 <a933bafd2d6a60a69f840d9d4b613337efcf2816.1588320656.git.shengjiu.wang@nxp.com>
 <20200501102158.GA5276@sirena.org.uk>
In-Reply-To: <20200501102158.GA5276@sirena.org.uk>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 6 May 2020 10:33:23 +0800
Message-ID: <CAA+D8ANDHHejFD1rYmFOG24yivpEJa+xO-WpVr=Vzfz9yW9H7g@mail.gmail.com>
Subject: Re: [PATCH 2/3] ASoC: fsl_esai: Add support for imx8qm
To: Mark Brown <broonie@kernel.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Fri, May 1, 2020 at 6:23 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Fri, May 01, 2020 at 04:12:05PM +0800, Shengjiu Wang wrote:
> > The difference for esai on imx8qm is that DMA device is EDMA.
> >
> > EDMA requires the period size to be multiple of maxburst. Otherwise
> > the remaining bytes are not transferred and thus noise is produced.
>
> If this constraint comes from the DMA controller then normally you'd
> expect the DMA controller integration to be enforcing this - is there no
> information in the DMA API that lets us know that this constraint is
> there?

No, I can't find one API for this.
Do you have a recommendation?

best regards
wang shengjiu

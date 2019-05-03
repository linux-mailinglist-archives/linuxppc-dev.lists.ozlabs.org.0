Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C2D913443
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 21:59:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wjdp5kl9zDqZq
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2019 05:59:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="AHZqjeYB"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wjcM2kJmzDqY3
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2019 05:58:26 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id e24so3374074pfi.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 May 2019 12:58:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=WB6WukALIt5LPSFOLetrqCfdn6458xhXun4VAeBfku8=;
 b=AHZqjeYBooF34dvlJEEYqeS5a/OwB/N3wk8oRUX3xMNSZkJpPj2xUUUhnfeja/ANyO
 tLcv8IyusQA50EJQjTWkpWqIyRR/dEIwxDFO38PsT9Yr/CGqyAmXM0zi/CYIKU/Tpdzs
 R4tXGXyS977mH72o1FZgcd3NrHQ4BhL4DfLfyNDG3TvWlrO7QMvI2+13BEABMzrV9zd3
 Wu4t6R2/qCSX4OIx24AO7VADifBn7OP2NwFxU7vTCga6cc0iM6EblGTAsERoUhKpvbSm
 0soVKjoHaKXoMJZbuEM6ie18l9NrzilF1wzJWAIFdQoBCxxpogrzCe6g3QHS4vuShJz1
 UlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=WB6WukALIt5LPSFOLetrqCfdn6458xhXun4VAeBfku8=;
 b=DKK+zhji2bOkuvXJIcqNFV93OmiJECv078E/6lNlcPf45DsWwvdgxcQNjznM2Je4nb
 d2+FyjMaU7ZWy0MidbsP92nXlwDV0Z4xGOwuoRLxJzuMd0bQdhCggjp+OBcdAI/03N1c
 N8BZa3cS1taNMDYWsb2jy/WNqFY+hb3TEA8jjgSznG9ovxJHlksXqlvt6oTr0WE54mh+
 fux4WR95H8Aa948lOCzjztCvlTYASRUAuXkkGsT4hzn4mERhYxoTI0KotxyM/MGdnDuX
 zddStx5mzuhccYBygb5gnWLcdjdPyzrr4IpTFaAfJHTGAmREQji+OPUvaIypan9X3J29
 iCrg==
X-Gm-Message-State: APjAAAWCKsXJhlw0TpDFI15vLKvq1BBxuBuYSzbd1FpFdXNo2JNMlCVV
 LBkU5p83Km7neHNqUyNEggc=
X-Google-Smtp-Source: APXvYqy7TK+EVMdOx5DGkjrJ0eA7+vRZ/pb3vRx0DHFz2qS0ZuFK5ZP5l67SdIG88fBWSJiRE/CyAg==
X-Received: by 2002:a63:d347:: with SMTP id u7mr13073160pgi.254.1556913503804; 
 Fri, 03 May 2019 12:58:23 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id i15sm4868020pfr.8.2019.05.03.12.58.22
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 May 2019 12:58:22 -0700 (PDT)
Date: Fri, 3 May 2019 12:56:49 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [EXT] Re: [PATCH V4] ASoC: fsl_esai: Add pm runtime function
Message-ID: <20190503195648.GA30289@Asurada-Nvidia.nvidia.com>
References: <c4cf809a66b8c98de11e43f7e9fa2823cf3c5ba6.1556417687.git.shengjiu.wang@nxp.com>
 <20190502023945.GA19532@sirena.org.uk>
 <VE1PR04MB6479F3EED50613DF8F041713E3340@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <20190503042731.GX14916@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190503042731.GX14916@sirena.org.uk>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark, 
On Fri, May 03, 2019 at 01:27:31PM +0900, Mark Brown wrote:
> On Thu, May 02, 2019 at 09:13:58AM +0000, S.j. Wang wrote:
> 
> > I am checking, but I don't know why this patch failed in your side. I 
> > Tried to apply this patch on for-5.1, for 5.2,  for-linus  and for-next, all are
> > Successful.  The git is git://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git.
> 
> > I can't reproduce your problem. Is there any my operation wrong?
> 
> The error message I got was:
> 
> Applying: ASoC: fsl_esai: Add pm runtime function
> error: patch failed: sound/soc/fsl/fsl_esai.c:9
> error: sound/soc/fsl/fsl_esai.c: patch does not apply
> Patch failed at 0001 ASoC: fsl_esai: Add pm runtime function
> 
> which is the header addition.  I can't spot any obvious issues visually
> looking at the patch, only thing I can think is some kind of whitespace
> damage somewhere.

I downloaded this v4 from patchwork and resubmitted a v5 for a
test. Would you please try to apply that one?

If my v5 works vs. having merge conflict at v4, maybe something
wrong with Git version of Shengjiu's? I compared my v5 and his
v4 using vimdiff, there is no much difference of whitespace.

Thanks
Nicolin

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8896D1B96E8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 08:03:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Z2Y6d95zDqd9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 16:03:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UyRo4nU5; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499Z0k5g8JzDqXl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 16:01:42 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id o10so13376807qtr.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 23:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QGFl2uS3f+5RhP1jpZPcJAcfmonJZTFWwEebr4DUxFY=;
 b=UyRo4nU5c3POIrn+bZNVgt6vTDruBvL+THYSpR5jUEZZLvf83LrK3lhS32ufRmvIuZ
 j+p0QDq8tiRsO/i7/BbTZt+KQnXxVxGMIcXKxLkgYnTHILV/QflQyc3LOUCSX/j8RH9B
 HqjbXO3I7wsSKeQBXxBxS6w/Lqlwgw3tUuFnaj/+EkR7nnxhgiS0rjU1y/MyrHrnYdAa
 z3m9Gu1qnyQ9j2RHohDO9UfdkJlg62SgSkrBc5g7LfpEcLqpwxvb29YXpNsnBUHi3XYQ
 nK4zBoGZFxPKFm3/6Rw8+ToQ98up3xbuv0qg1BFYyuT4g04WSLG+ELflaQcjzRES2Uv7
 ZjQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QGFl2uS3f+5RhP1jpZPcJAcfmonJZTFWwEebr4DUxFY=;
 b=k8GzKrMk8M6ACNfswhcalO13vBHlXxDoyDlR+xk84nvx3DmMEPdy4Bnb8NmQOPZmrZ
 wN3pLB15hjTXZQhePI9oOlWS55mwcgA5p7w7FZNvHniMuaakHK8WcXI1che5clPqzdQz
 B3BUkY6BDmui5MEMtrdU3VIULkFMGNBW5wzcDZNFShHYsLJwyI5+eOBymDXDl2mkHJIw
 r2GB7pff4l5l0605mI0N0O12gqT+o70YZvAnITgl3hFGXyLFSIbY0iy5pZY54WXqGoJk
 gA7kW5kfMgshhIfZ1TeUqSLWDFahR34Y+aqcsAIERibV9L2iTtGDKHKeEc+eaRbHcxH4
 KnOA==
X-Gm-Message-State: AGi0PuZ/NIvgjRPTBjkixeRfsoW5GAHqDR0Xd1uxVPO1YGUyPmF/JGai
 RbjYuQdMT9cRPpmPsBMf1vnxfnYKBEdEkQVTjnY=
X-Google-Smtp-Source: APiQypLsDEJUKDwWhUb0HcitD6LTYrZxucNft/F+aO2VwcOAWSNRFoEXi3bGQvQKjWbUhypkIAgG5fdIBm8Q2V74QlI=
X-Received: by 2002:ac8:22ad:: with SMTP id f42mr20964483qta.292.1587967298448; 
 Sun, 26 Apr 2020 23:01:38 -0700 (PDT)
MIME-Version: 1.0
References: <1587711246-27226-1-git-send-email-shengjiu.wang@nxp.com>
 <20200424091533.GA8856@Asurada>
In-Reply-To: <20200424091533.GA8856@Asurada>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 27 Apr 2020 14:01:27 +0800
Message-ID: <CAA+D8AMgenpGapp3fbZVvswPOKDLZXZE0KaPK7Js41xSDhG9wQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_esai: Remove the tasklet
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

On Fri, Apr 24, 2020 at 5:17 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Fri, Apr 24, 2020 at 02:54:06PM +0800, Shengjiu Wang wrote:
> > Remove tasklet for it may cause the reset operation
> > can't be handled immediately, then there will be
> > endless xrun interrupt.
>
> The reset routine is really long and expensive, so not sure
> if it'd be good to do it completely inside HW ISR. Have you
> tried to clear xEIE bits to disable xrun interrupts, before
> scheduling the tasklet? If that does not solve the problem,
> we may go for this change.

Good idea, will send v2

best regards
wang shengjiu

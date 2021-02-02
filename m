Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCDA30B548
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 03:32:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DV83K6B6vzDqvr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Feb 2021 13:32:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f36;
 helo=mail-qv1-xf36.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Imeh8hlG; dkim-atps=neutral
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com
 [IPv6:2607:f8b0:4864:20::f36])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DV81Z3bxwzDq96
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 13:30:37 +1100 (AEDT)
Received: by mail-qv1-xf36.google.com with SMTP id ew18so9249082qvb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Feb 2021 18:30:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIpTOgzPdQ6YtC0rNK21Lw1lOKo/Ak0fXmEeIn6ftt0=;
 b=Imeh8hlGg2V38tVkhlaTGnS5NFabsC2q2pzv0il1Mwc1WnPzOyMh0/EbCCkdgSbAQX
 NemrZfPsXmukyK4M2YmP8R40paGEkRT2dctZMpVokXGFbGqgJj4+D31s7p7BgUbXGAMO
 3vjx9wNN1VoAleGONmrnuw7+Z/zR5YUvdNdNXHDJMvJhbpsSuTsMscSx67PrihFIL1e/
 ECxg89NsRYzgFmMxwc78wS6xAYtCUl8rhaxGJRgrzixds8p9fWDm23cTYcBnmZ4Sv0Xf
 Qi/eCCtkzyNzc5cVs2Nh6gdHmLtrYST7Rb/ZI1TblCA/NMbNFZwHrwc34bqTKN/xSLoW
 k2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIpTOgzPdQ6YtC0rNK21Lw1lOKo/Ak0fXmEeIn6ftt0=;
 b=qgvSIv//nrsOO0600iKoFc9JWwsdcJYVzYY+y68aOBEhqBmSwG4NHPcFR/jlA1lPyO
 I4lgt68j5ksCWu5DiXwQqtQzuqJSdjSNKx6gjD+wPOk42izhP+QHYcmDhBrcEILfmchN
 iaY74qwPPpwkKb6aXSVccNZMp+hTuTu6kAYE8wgL6wFr+F5jO4Uuf04a/GFVbh5ZsbIQ
 4Z7DFOfd5sbzFZGtucGcGovmEulrYnqjTud1rv+S8f27znO/mL2rRJjX8/Q0R+QBkHGO
 S/82ackC2+l5vXYP/8FxOZ6xOP+5+0Ms6xc7odeqG51YHMcAqtdKk4TcJJv+9CdmF/BC
 HGcA==
X-Gm-Message-State: AOAM530k4Y6rLd4nUJMNeIbE1dpCn3D0rUXq1hknpmYl8MW3ZRlIio4p
 WSBnpL6xuXfiKJCBA298saF2p53pz4w1DiEfJMo=
X-Google-Smtp-Source: ABdhPJxQYEVdgWApvJT9/ojTY/23tJijAEEqeJsLb013eOFzysMrFFbbydhH5M1amthAVT4PRbP7uWaVSdWA9kFcRLE=
X-Received: by 2002:a0c:be15:: with SMTP id k21mr18615044qvg.8.1612233033576; 
 Mon, 01 Feb 2021 18:30:33 -0800 (PST)
MIME-Version: 1.0
References: <1612166909-129900-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1612166909-129900-1-git-send-email-yang.lee@linux.alibaba.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 2 Feb 2021 10:30:22 +0800
Message-ID: <CAA+D8ANQb4btyJo2DeVpr3W7vHz+gQTCQQJB-geV=wT5Sa0+yQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_xcvr: remove unneeded semicolon
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 perex@perex.cz, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, p.zabel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 1, 2021 at 4:08 PM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the following coccicheck warning:
> ./sound/soc/fsl/fsl_xcvr.c:739:2-3: Unneeded semicolon
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Acked-by: Shengjiu Wang <shengjiu.wang@gmail.com>

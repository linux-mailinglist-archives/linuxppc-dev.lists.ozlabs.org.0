Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 883DB3AFAFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 04:17:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G895B1nBPz3096
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 12:17:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=JTALaRfb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::22b;
 helo=mail-lj1-x22b.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=JTALaRfb; dkim-atps=neutral
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G894l0VC7z2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 12:16:38 +1000 (AEST)
Received: by mail-lj1-x22b.google.com with SMTP id u20so8181678ljl.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 19:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uH43oKWAZxpslYVAdfEnkXLzWtnCAv3z3ny62+2EWkM=;
 b=JTALaRfb9HY9P+En5sSGe5RUQambcJhT8v2O/nCquiTozLmbSfB0cF/4OFZzr7DWLQ
 xjrb9mmE4+4tDlOAYjkR35nMFmL1ES4FtH3VhfSluC2VJZOniLhfzRpiRK3dDhJ2XhKn
 4YfYmBnL+/DIHxb0R1E2F4ReoABbaqZ9ay6PjaBVFw4EBvt1zQUFJt5LG/wELvbjIJpF
 SFYrPwIs3/1uMT9UpIQPex9Cz0VhiwtMXOSsMWCFVRCha8odC6JKgEwTOFAx4Yf2lhLb
 5QSYbjfK3DUTOUS+cHZQLwKtieKSOX94YqFCp2dTDgAd73G7gFc0fN4lT4+RfmvJS2Xj
 GMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uH43oKWAZxpslYVAdfEnkXLzWtnCAv3z3ny62+2EWkM=;
 b=lae1BsqPz3PiFzK8NH+V17dGOipmM8yeFuNAdplVWlFwlXtFdGRQEgd3Y5G9w5fQrN
 YAe4nIpczFqu7yaU8SMsDFltIH0wZaYFPVtfTDJhfeUqPaWpTssLfzDfBJucHDTPpVK7
 4hbyrkUqae/sh3Kn/Gq0R0geGSljQUjA20FDwEknvPXJYT9a2gp+tgz1lhhRjmUJqJTI
 p2vpyNb7CDVrWdpbV6/OMwWV/NfLqGpdo5iZtP/EulmieTNltppL7IcBxFcA2YCkmjyu
 6m9pc11ix29h09mfzw+a+2vZMDv/oRUIaH8lWkARAAOB+CDDzdVfEMXaXmU+jzeMZmEm
 DgfQ==
X-Gm-Message-State: AOAM532FSYO69/BR7J4285N5ReX+OhuSQPK69iuyaK/jrIJu6uIWD2LX
 YeKUUYepcJBA34nmPnRKr5/oDnkF3RaQqzPEURs=
X-Google-Smtp-Source: ABdhPJxeG9iccGHA6DRH7csV1eHv/FBVdq7lad+GoU0gi82ueW4xDhFF6+9W1CvvNYTqkL/1UuZEnSBlxuaZh/IJhDc=
X-Received: by 2002:a05:651c:54f:: with SMTP id
 q15mr996055ljp.347.1624328194500; 
 Mon, 21 Jun 2021 19:16:34 -0700 (PDT)
MIME-Version: 1.0
References: <1624324395-7260-1-git-send-email-shengjiu.wang@nxp.com>
 <CAOMZO5Bh6J8=E=P1btDdgkYm9bvBN1ituRHLLOtW1cFsheQBdg@mail.gmail.com>
 <CAA+D8AN4Nch5FMjCDN8vs2+Nqs88k8jvMEBZwQuUdG+9pt1yZA@mail.gmail.com>
In-Reply-To: <CAA+D8AN4Nch5FMjCDN8vs2+Nqs88k8jvMEBZwQuUdG+9pt1yZA@mail.gmail.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 21 Jun 2021 23:16:23 -0300
Message-ID: <CAOMZO5A=OrHNz0Bye+p3H6UbF2_wq2m9KquWurXez1E0-WBYuA@mail.gmail.com>
Subject: Re: [RESEND PATCH v2] ASoC: fsl-asoc-card: change dev_err to
 dev_err_probe for defer probe
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 21, 2021 at 10:53 PM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:

> so I think we can use the v1 one,  use dev_dbg instead.

Agreed. I have just reviewed v1.

Thanks

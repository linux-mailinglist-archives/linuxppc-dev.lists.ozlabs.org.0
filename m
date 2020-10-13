Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E45F528CBE3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 12:42:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9XDt5q2HzDqgD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 21:42:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=daniel.baluta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=gyi1yunu; dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9XCJ02HzzDqcY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 21:41:12 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id s9so11305785wro.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 03:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KGnQd8MQizROEGVqO6LoZ2ESTC7FDdoCCXNt1igE99k=;
 b=gyi1yunutoZhUD0/UEF8Y2W7tQM6TS5jmKeONpakXd2rTbWB+a2FoTlYShvboHRUjb
 o+OiIauitVyuRzkw2wlp8deQWzBGISweHB6VZlAgDRaF0NoeuVxg847l/A2/LVMRQJqe
 042rOdRRsmODzQaUz5KmsV7PXCm2iIfq/P9NJvooXN0tU08fjejHSQ+S9ueQ+aE27whw
 px2Vdl4kOBetB0bVfcXL//2xS1Y1bR9G5Y4/SYldp92Mjw39RR00M5wScVXdpvR7CZUV
 HboDSnXSXkCB4XgTJW74jjaWEffi5v3Pi6A7v7NtoKMWoS6bakwtXPTJFSMiRY2Akdqr
 3LJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KGnQd8MQizROEGVqO6LoZ2ESTC7FDdoCCXNt1igE99k=;
 b=UD8qlcImhgvOQrEPFwvTBFEDeZ7LvT4uVlXFNunp4et6tzk3wRvCHCfg4UB7CQDjgO
 OC0C0EuDpouZDLczKVlughytEWDDIDAvgZzOyb5rdV+f0QXnfdCYYVS+NlOVb/nL4prH
 xn3Nr8+LTh+i7oFvb2CUwi7UvOI2Q3MVsM6AUASGA5Yetc5CJgc1Zdayphg4WI2zDMNZ
 /U3a4k+yB67KBg9orLYYJVJPqzr0rqJZrFa6oooE/yc6m1nAIxDE2/1zcsM30Up1LK22
 6jHAtVComGFrvQiJC+OK96/6MJKjRwWknXTEunfBzY9T/Gby3SDyqE3kfiXTFrXK3Fs+
 ilEw==
X-Gm-Message-State: AOAM533auJGPjZH6LUD6gM890pU7HTbE6oSkdkpD9/udc+6Yabgvzm7a
 Uw1Jipauu2o7vR41erotIPK2Pp6imrgqgDKyq+g=
X-Google-Smtp-Source: ABdhPJwhYcYmIneqQARWgsNSZNyQDfcQXjguTWYNKrh+uvUlyMNyvJ07AParV+DeJy+VXRrdkVj2tk2+qAGXHb/6jhw=
X-Received: by 2002:adf:ec0e:: with SMTP id x14mr37900205wrn.204.1602585668012; 
 Tue, 13 Oct 2020 03:41:08 -0700 (PDT)
MIME-Version: 1.0
References: <1602492582-3558-1-git-send-email-shengjiu.wang@nxp.com>
 <20201012190037.GB17643@Asurada-Nvidia>
In-Reply-To: <20201012190037.GB17643@Asurada-Nvidia>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Tue, 13 Oct 2020 13:40:56 +0300
Message-ID: <CAEnQRZBrXNgMDNgQ=dMJfZQpZvdq6sUx2y21_fuk9teRd5UM0Q@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_spdif: Add support for higher sample rates
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
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 13, 2020 at 12:29 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Hi Shengjiu,
>
> On Mon, Oct 12, 2020 at 04:49:42PM +0800, Shengjiu Wang wrote:
> > Add 88200Hz and 176400Hz sample rates support for TX.
> > Add 88200Hz, 176400Hz, 192000Hz sample rates support for RX.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
>
> Probably should put your own Signed-off at the bottom?

Hi Shengjiu,

Also please keep the original author of the patch. You can change that
using git commit --amend --author="Viorel Suman <viorel.suman@nxp.com>".

With that,

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

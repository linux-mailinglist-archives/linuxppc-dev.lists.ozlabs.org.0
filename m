Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C30A0703
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 18:12:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JW3b1ZpszDrJ1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2019 02:12:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::244; helo=mail-lj1-x244.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="t82bo+7n"; 
 dkim-atps=neutral
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com
 [IPv6:2a00:1450:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JVq92zyzzDr9W
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Aug 2019 02:01:37 +1000 (AEST)
Received: by mail-lj1-x244.google.com with SMTP id t14so57458lji.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 09:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yR3tqYiTxpppS/HN0rTYfpt0BO2DjSod+qzn1YFlyUY=;
 b=t82bo+7nReRN8qUwONp3FOyUNOQe+SJmGjj43nMjkurkeSF72Pd1VV3hRf1OgE66RR
 KDWoG2kZQnBVJzkM8KDZCFy7mqz9bcKdJSmmEx2dYdkoTRZLvN6pnCl8E0pBhjwKdkJ4
 sf49qG2yOviuQ4Fu1Tm1UKeNFc43o8A1iRxF9LdpIDyvUrr/EXGEZPFdILgnN8BLCa2n
 KW3jLLC38MeV3yMp6xS8/rl6fTmU4XS6EpBjg41uqXmYE0AhDM2igs87zJIiHIANDVPC
 XsI6R22UTUjfppFtkbsj92qJogfUbp92F2UjpP47UJCKAq9rZ+NXm3mNfnDYXCPxjkdA
 RFnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yR3tqYiTxpppS/HN0rTYfpt0BO2DjSod+qzn1YFlyUY=;
 b=o/Xjf3uZAlhq+St9JYrk/VyWYhbwR6RKIA1GDJ0ptR5zYpYfjUFpaixinoFJ4Mdj/v
 sPMsfLxltDVZIsfV1otZ1pRlVa0mz/IVZXK7lTwtbpslo8fqpbH2dydD5WCHQOCNuQqK
 K0CWDdi98PMV1WOT+NT6GsWW0488ri8uywX6bO/bUL1ln6axUPmFX86y2vmc2oGYRwOt
 pZuuZwZljeB5Ah2LSbIFwaQBOtmc1yv8V1/YNZJH/laDVvX+WG36+HTmmFNpd96C8cg+
 METNmZ0kAvg6A7fprC8OIf962uxguCk2Gw2Tnpm5KNHaavVhDPuEObixjFCMTMos6hgu
 tsDQ==
X-Gm-Message-State: APjAAAVtXdQQL93bTtOysIj67bbyymjTRHHKl0S21Yrt41EvvOn6ttON
 Ki5qCk+3Dm0mu6ocrh/0lavX4KQuNeH6d8IN0ak=
X-Google-Smtp-Source: APXvYqyOP2EB8a83ZtqOJPUj3xY7/goLSp49RDBCXTtxODlPCxl+xIBbp0pHHEXIFG32IeOGVr0WeRsO6J9J5w8UT1g=
X-Received: by 2002:a2e:978e:: with SMTP id y14mr2524405lji.10.1567008091865; 
 Wed, 28 Aug 2019 09:01:31 -0700 (PDT)
MIME-Version: 1.0
References: <1567012817-12625-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1567012817-12625-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 28 Aug 2019 13:02:32 -0300
Message-ID: <CAOMZO5BF6M4McwGTuNU8jM41+N3jeaJp+U2ST5JY7e+yv8GO_A@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_ssi: Fix clock control issue in master mode
To: Shengjiu Wang <shengjiu.wang@nxp.com>
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
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On Wed, Aug 28, 2019 at 2:21 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> The test case is
> arecord -Dhw:0 -d 10 -f S16_LE -r 48000 -c 2 temp.wav &
> aplay -Dhw:0 -d 30 -f S16_LE -r 48000 -c 2 test.wav
>
> There will be error after end of arecord:
> aplay: pcm_write:2051: write error: Input/output error
>
> Capture and Playback work in parallel in master mode, one
> substream stops, the other substream is impacted, the
> reason is that clock is disabled wrongly.
>
> The clock's reference count is not increased when second
> substream starts, the hw_param() function returns in the
> beginning because first substream is enabled, then in end
> of first substream, the hw_free() disables the clock.
>
> This patch is to move the clock enablement to the place
> before checking of the device enablement in hw_param().
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

It would be nice if you could add a Fixes tag as well.

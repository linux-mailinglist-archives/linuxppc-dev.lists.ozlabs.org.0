Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50ACC33A0FD
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Mar 2021 21:25:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DyZ212vyRz3clL
	for <lists+linuxppc-dev@lfdr.de>; Sun, 14 Mar 2021 07:25:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VrdHK7Tf;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::134;
 helo=mail-lf1-x134.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VrdHK7Tf; dkim-atps=neutral
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DyZ1Y6NnQz3cPT
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 14 Mar 2021 07:25:20 +1100 (AEDT)
Received: by mail-lf1-x134.google.com with SMTP id e7so50932577lft.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Mar 2021 12:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=272CAvfdNnBRAEObGGz44xaMW40FGoutsX7xZRwN5z0=;
 b=VrdHK7TfbhnIMxJD7Rl/IHggv2rVfZGT0NhZkD0zhn/OTghueRl87jaj1ucW3av5Kv
 b4i7QheIJvExWec8x6+vWF1Z4tV8TkfNDP4Xpm/ccKQ8RsNbDEIDBEyOruakmBL2uRwG
 KLLO0FNTW1B5hfoSfGWmTfRPsWi8j9ti4pNANjPAZe1d9gJvVFbUubfaZ2e73gawoAZZ
 SIxSEyqUCrL9hbGKiwMh1A1i2qWc0c14oNf20TsT2qUzQa6mRZcWqVRNxCsBz0+/cNBr
 yIFDyMoReIqe7bOokkm6U0NAr+2Oh2HP30ci7TgkAB6VeT/kU1/55+Jqn1TtiBCFU1ST
 OSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=272CAvfdNnBRAEObGGz44xaMW40FGoutsX7xZRwN5z0=;
 b=I5I+T9VkhOtQNsdKiC57N5KlLuAv6v4Zy2jidvAi/nqhrHiwuQsYvXWr7lvY0MW11W
 l/eeme9l+43hxCu7TU0YkII+p/y90nCa25YZY1PAFX7DvqSIhDiwcQkBmRGGRUtWiC7H
 gryeAfFUOKtGL4a1Dw7l3L/O8Mx9IkhfSRiNQxjbbz3/sF2CMTrWsuIgYG5m2+4YtDYO
 G5zEQHU7MPJ37VonwJVIGubn2dfFzilof1JGQeMBRf+RbyRUqUwzWwkWHmm0VD2bltD/
 8iXV/wJ4yWG7Av2rIkoZcx7Ta7RzJHRhyyucO9ny6TtOFfx7DOEv6VHlW40PSYGA+r/c
 EA4A==
X-Gm-Message-State: AOAM530IP9GMVjDVb9EoH+O0fL0c4HZf5CLESBbbeO7O/B5YpmiDWo6Q
 F9VZCsFA3tA9Uf+duCfGCAoDFdJbvSrR0Q2AR/A=
X-Google-Smtp-Source: ABdhPJydPIuew2E6A7FdCmpjZE/G3zO5v9jZ2tssDsxNcx5h9YFAkiNEfr6iRPZSikHMVAzbHlScQ4kRcXNFVVP4VEY=
X-Received: by 2002:ac2:520f:: with SMTP id a15mr3202535lfl.223.1615667113664; 
 Sat, 13 Mar 2021 12:25:13 -0800 (PST)
MIME-Version: 1.0
References: <1614848881-29637-1-git-send-email-yang.lee@linux.alibaba.com>
In-Reply-To: <1614848881-29637-1-git-send-email-yang.lee@linux.alibaba.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Sat, 13 Mar 2021 17:25:01 -0300
Message-ID: <CAOMZO5B1syxnqfwkpRBOC3gsUUZFWfG5=fo5KW7QxJWRyKyLXA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: imx-hdmi: fix platform_no_drv_owner.cocci
 warnings
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, Sascha Hauer <kernel@pengutronix.de>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yang,

On Thu, Mar 4, 2021 at 6:08 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> ./sound/soc/fsl/imx-hdmi.c:226:3-8: No need to set .owner here. The core
> will do it.
>
> Remove .owner field if calls are used which set it automatically
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>

Reviewed-by: Fabio Estevam <festevam@gmail.com>

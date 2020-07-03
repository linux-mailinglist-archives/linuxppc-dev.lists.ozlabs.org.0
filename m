Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 155DB2141CD
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 00:49:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49z9BB1bbrzDrK0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jul 2020 08:49:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=mJlRtmq6; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49z9800tXlzDrJP
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jul 2020 08:47:12 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id e18so15671296pgn.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jul 2020 15:47:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=KRBtbtG1j7Xe51Bh35XbQdV4rjnwLDY23WxNX/FI3wQ=;
 b=mJlRtmq6CpTsfGG8dI6jlPat89G7ZcO9ohU/lVmVrVAf4wiRNMRUbw03oycBMXcYJt
 dRf7KgkxWAa4M7I03cFI2YPOM7PVAyUnaPLFY8zT/mg2iI9nHhheihiwpulSefM3lVOy
 HpKkNmtdhDewZUmMsQ3UrKixCjY3+/o/T2Fd2w8oknSmXd4hqEpMaEAyHUp+rysnKI4l
 D/AibesffdHEZnm7prdjvBFlBT/8DaBTBcqWvNjuFCmphc44G5k73dcUWpxHIrKyjbuI
 6R3WLlxLulKtuzGcGRLVvTUiH+/r/QaJOhICYh3WdF9Dtc4eSwH8HyK6dY/gr0O86s6c
 NC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=KRBtbtG1j7Xe51Bh35XbQdV4rjnwLDY23WxNX/FI3wQ=;
 b=dP5d7H8Aiuy/dv1l2QusvTtIFTZFi78nPpG8kzECLpSlXydFiMxj+SIMvD/EjK5vkk
 UVH12SBVbqEzlj/zGstsJQD06U5gtQXFmTpijNkyC1cKlzwEh46HtCCYwtrljqFO1LFz
 9TKpIWtLfQXCym1vZCivLMq6wVwggOYyzz3xtOFS75o0LSwQYMslqvgwxmOfUQii2gV4
 qDR2t6uQQXR/pZnM57+/B9IDrTEHjb2W9AwNC85QaXl5iAZfsoW9Me+8ZMP8i96uBJbg
 6UY8gSxxQ6hdCutBHl2In/sWn8nFeLvlUqFijg558GUBQnkzFsUTJCFlqunwypV16BY+
 WQ9g==
X-Gm-Message-State: AOAM531UtT1Cwtvpl0Pd80HKzB693STwWB67DQk3II4n89jpW3zpsC0k
 3ERAUPGo/N18UZvDEzNOGt4=
X-Google-Smtp-Source: ABdhPJzcL3ocgTh9rFr1T1bDjb89oAsQukPkRkoy7Vq4NHGe0lAA0gG7Ha4pAjS96ri2k5zN7cGOwA==
X-Received: by 2002:aa7:868f:: with SMTP id d15mr36997999pfo.166.1593816427129; 
 Fri, 03 Jul 2020 15:47:07 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id s23sm13281151pfs.157.2020.07.03.15.47.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 03 Jul 2020 15:47:06 -0700 (PDT)
Date: Fri, 3 Jul 2020 15:46:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Mark Brown <broonie@kernel.org>
Subject: Re: [PATCH v2] ASoC: fsl_asrc: Add an option to select internal
 ratio mode
Message-ID: <20200703224656.GA16467@Asurada-Nvidia>
References: <1593506876-14599-1-git-send-email-shengjiu.wang@nxp.com>
 <159379581381.55795.16716505708033817338.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <159379581381.55795.16716505708033817338.b4-ty@kernel.org>
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark,

On Fri, Jul 03, 2020 at 06:03:43PM +0100, Mark Brown wrote:
> On Tue, 30 Jun 2020 16:47:56 +0800, Shengjiu Wang wrote:
> > The ASRC not only supports ideal ratio mode, but also supports
> > internal ratio mode.
> > 
> > For internal rato mode, the rate of clock source should be divided
> > with no remainder by sample rate, otherwise there is sound
> > distortion.
> > 
> > [...]
> 
> Applied to
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [1/1] ASoC: fsl_asrc: Add an option to select internal ratio mode
>       commit: d0250cf4f2abfbea64ed247230f08f5ae23979f0

You already applied v3 of this change:
https://mailman.alsa-project.org/pipermail/alsa-devel/2020-July/169976.html

And it's already in linux-next also. Not sure what's happening...

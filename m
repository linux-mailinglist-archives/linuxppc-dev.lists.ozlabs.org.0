Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DA363239DCE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 05:14:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKjfH636RzDqST
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 13:14:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=acxpzdL1; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKjc746jkzDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 13:12:23 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id o13so19147601pgf.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 20:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=pqH4xv/zgdnQFeooWFmsVR6/ZHVzntVgyMsibxvmXWY=;
 b=acxpzdL1bbItPmnT/RyUVyi9BBGxsth39Fs/4E3YDPQLwgcw/EFVW69/ykgtFURgvL
 DnsHAfxza5CEv6nL3V5jw8mdQ0A2mpr1UoR1Z54iESGC/hiVmKlE5HAkiEvscqzffLGZ
 27+8T18hbT24cgN4QOMJ959mztebaiWQt6hq8/WHLOJK6MmNj41gE6P5etE/P9ZUcXEt
 T213U6Euj/24EZgdq3R5cPxXcbimpweAwFMO5oqg4v6KEAXFLOxC/P5uBbA2hyAc9LsJ
 nCxDxcuT2PUDRLvChqWb2sO61s1R2+kL7VVIWmZom5eJBC8FBcKo8Z2jNqOdx09mQPLh
 fm8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=pqH4xv/zgdnQFeooWFmsVR6/ZHVzntVgyMsibxvmXWY=;
 b=qecNDf+kXOeN1ud/d0Q2wO2AZxj2pkb/Bw9INg0MPYVfqXoHkF9wWjfKUOk3ICxdnC
 D3CrdASG3vsWHE00PBtdtVJDGwr8Lu62LCVUnY/4fd2sg9jMhnYyiaICMbpvAa7KJOgl
 nNKQMRZKIgVOo5yl2f1mQggbbfg75zrUE07ut0QHdMWVuXuYytg+DFvpaha0VoLTzqbq
 /6fCTI7TOUIB67aw8p8SMajur9R2cFYwJ4cLBIAqlpIOHodXPGlRvQI9PbwRvWScooGZ
 4uqD0EtwlOXxCiW5hy4xKLFzsVj7pZHFGabUB8VZxBvvkwYkXBSvTwzHLHHHHqA38XQL
 O26A==
X-Gm-Message-State: AOAM5322s5c68xyhqpr4i/fGgz4TeZ4kePnBOmkFujLqF++sUKbg4gfH
 1tNMOpnWzBLQKZYmKnTfwRI=
X-Google-Smtp-Source: ABdhPJxkW69u4758fMnybzasE3bFymgtHmmra2XXahudLeTVKS5ejJspO5JAQaQ123pvUuYtFeDZjA==
X-Received: by 2002:a62:206:: with SMTP id 6mr10419191pfc.228.1596424339410;
 Sun, 02 Aug 2020 20:12:19 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id v22sm17795945pfe.48.2020.08.02.20.12.18
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 02 Aug 2020 20:12:19 -0700 (PDT)
Date: Sun, 2 Aug 2020 20:12:07 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3] ASoC: fsl-asoc-card: Remove
 fsl_asoc_card_set_bias_level function
Message-ID: <20200803031206.GA28838@Asurada-Nvidia>
References: <1596420811-16690-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1596420811-16690-1-git-send-email-shengjiu.wang@nxp.com>
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
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 03, 2020 at 10:13:31AM +0800, Shengjiu Wang wrote:
> With this case:
> aplay -Dhw:x 16khz.wav 24khz.wav
> There is sound distortion for 24khz.wav. The reason is that setting
> PLL of WM8962 with set_bias_level function, the bias level is not
> changed when 24khz.wav is played, then the PLL won't be reset, the
> clock is not correct, so distortion happens.
> 
> The resolution of this issue is to remove fsl_asoc_card_set_bias_level.
> Move PLL configuration to hw_params and hw_free.
> 
> After removing fsl_asoc_card_set_bias_level, also test WM8960 case,
> it can work.
> 
> Fixes: 708b4351f08c ("ASoC: fsl: Add Freescale Generic ASoC Sound Card with ASRC support")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

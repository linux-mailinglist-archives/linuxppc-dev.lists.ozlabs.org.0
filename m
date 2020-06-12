Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 952C41F750E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 10:11:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jthw4ZqzzDqwy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 18:11:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ESWNW/5E; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jtdq2fRtzDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 18:08:30 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id t7so3781324pgt.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 01:08:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=deHfCGYK7sImHkT4VukXUAJWu2KR/QGBA+6TyAj97pI=;
 b=ESWNW/5E+/g3NHeWm+fOP0obMgnb450CQdjU9D6UtJeGj3oPKXbGFuVQMzmWkRgmg9
 COtq4vJ2noq7dW4on1wypjVYXjgWHyB0fRMnV6QZ9j1FiTm00VYKKwgR7MASZKZMRyeA
 dR9T/ajdR5gD7/4IFojbFiUs4rdI1lUswID/e1U5pm2aKElj8noMcoOe4/keDRVrB6ef
 KyjJ6r7qxss1ilwRip7YdYpZw7twEqIm1eAZyvF1m+86gx9AtNA/C3e9NQOzdUmhgAcW
 qAnKk1GUYgxglmNMpsPNlxuYqzdMpn8JRXN/hty9YdAgM4jkMhKH9jTDoRFk0+GOfrG0
 xaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=deHfCGYK7sImHkT4VukXUAJWu2KR/QGBA+6TyAj97pI=;
 b=gRamOMv3WffcrCkKWD6xx0Cox/Y/5afK8oRU0988XTjnXDZ5aMLHYW7Qgt5OlF/HiQ
 FhaPLU4wwDROf+lnfJrQ89pgBgigNCUahZLUmj8SzrduRjLCpPpfFlr0keHOIeZQ8WS6
 1EL+ereFHPbcMMlkF03Icwvnh3efU2TTotAY7wKtPXgjagS8ZQFK+tz+qJQkPivGW+fF
 RRs4Z74cJGSk53asxwgm8jgznitd5L3l4MeMly0efYHEXL0WrEAo1U+Vxdd/JHXga6gA
 s3DqgqZl1AvsNhLRnngvDlC3VvxkBtkbB4bJhJGMH9zVcHZwlg6lJcu/Z4P2KmVM9Pml
 Yg7A==
X-Gm-Message-State: AOAM532G7KnkZgzzxez9fN+Tf6W5y3INxJJFEurNEA63SC9k4H5IGId4
 cjS7NBIk5HnRGCswsg5l+OE=
X-Google-Smtp-Source: ABdhPJztp5H64H8nc4ALDD29MNCP1/wMgS7+B5pkRhRu2tCOBn/u6z+JZFa6hKutRRkWyc4Y2CsnqA==
X-Received: by 2002:a62:ed02:: with SMTP id u2mr10494227pfh.283.1591949306759; 
 Fri, 12 Jun 2020 01:08:26 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id m9sm5306088pfo.200.2020.06.12.01.08.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Jun 2020 01:08:26 -0700 (PDT)
Date: Fri, 12 Jun 2020 01:08:17 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v3 3/4] ASoC: fsl_asrc_dma: Reuse the dma channel if
 available in Back-End
Message-ID: <20200612080817.GC22422@Asurada-Nvidia>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
 <3a79f0442cb4930c633cf72145cfe95a45b9c78e.1591947428.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a79f0442cb4930c633cf72145cfe95a45b9c78e.1591947428.git.shengjiu.wang@nxp.com>
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
Cc: alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, lgirdwood@gmail.com, tiwai@suse.com,
 broonie@kernel.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 12, 2020 at 03:37:50PM +0800, Shengjiu Wang wrote:
> The dma channel has been requested by Back-End cpu dai driver already.
> If fsl_asrc_dma requests dma chan with same dma:tx symlink, then
> there will be below warning with SDMA.
> 
> [   48.174236] fsl-esai-dai 2024000.esai: Cannot create DMA dma:tx symlink
> 
> So if we can reuse the dma channel of Back-End, then the issue can be
> fixed.
> 
> In order to get the dma channel which is already requested in Back-End.
> we use the exported two functions (snd_soc_lookup_component_nolocked
> and soc_component_to_pcm). If we can get the dma channel, then reuse it,
> if can't, then request a new one.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>

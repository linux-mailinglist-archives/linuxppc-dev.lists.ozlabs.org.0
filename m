Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 634E38ADEE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 06:41:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4670Qm2jLFzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 14:41:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=vkoul@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="hPwpGrIv"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4670P12d8jzDqQB
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 14:39:33 +1000 (AEST)
Received: from localhost (unknown [106.201.103.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 366ED2054F;
 Tue, 13 Aug 2019 04:39:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565671171;
 bh=Yq3xjgq9j2Zb+0ptLtoV2Vl9gStxTv3sh2uj5jTv/4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hPwpGrIvgTxtkfOL3WGglWuwIKmyDZsJHU/qtEEfGMyLgQ3WgMSwHwiVV9zpZPW2C
 C5h0JSbW+KMT4MGShNUQEaKgx+JzQpLtl2dirI6PVbmkc0MOOfb3pxTYvIbWTcfsSY
 5MjQtn1/bN2ZjUB/g7VENKRWhRvD1d3z+8gku1kc=
Date: Tue, 13 Aug 2019 10:08:18 +0530
From: Vinod Koul <vkoul@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH] dmaengine: fsldma: Mark expected switch fall-through
Message-ID: <20190813043818.GQ12733@vkoul-mobl.Dlink>
References: <20190812002159.GA26899@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190812002159.GA26899@embeddedor>
User-Agent: Mutt/1.11.3 (2019-02-01)
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
Cc: linux-kernel@vger.kernel.org, Li Yang <leoyang.li@nxp.com>,
 Zhang Wei <zw@zh-kernel.org>, dmaengine@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11-08-19, 19:22, Gustavo A. R. Silva wrote:
> Mark switch cases where we are expecting to fall through.
> 
> Fix the following warning (Building: powerpc-ppa8548_defconfig powerpc):
> 
> drivers/dma/fsldma.c: In function ‘fsl_dma_chan_probe’:
> drivers/dma/fsldma.c:1165:26: warning: this statement may fall through [-Wimplicit-fallthrough=]
>    chan->toggle_ext_pause = fsl_chan_toggle_ext_pause;
>    ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/dma/fsldma.c:1166:2: note: here
>   case FSL_DMA_IP_83XX:
>   ^~~~

Applied, thanks

-- 
~Vinod

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 808C415A065
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 06:13:16 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48HSTP2qbCzDqNt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2020 16:13:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=bombadil.20170209 header.b=i7D2bxT6; 
 dkim-atps=neutral
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48HSRS47B3zDqGl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 16:11:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=OTFD/SNJffQD3DOz5VRTovqxb+aXKeZm5TMlIiwyLbY=; b=i7D2bxT62GMcsQBA/OG+IFzNG6
 lmiouuAQCXjnQ5VxYf05qkah31TKIuACoAxAW/5IFUiktzYFxUYyxLUwOa5cDZQaEZLyZ4anQLGOA
 6J2hKd+ITQCBXqX3V7JmOEaILq2ppan2KDM3uBu1yRtWB1n6Vyl9lWTuUPaoW8IoHfPYotYNcOszQ
 oF4zMTRyLmKiVzrlXh4SPmFZuxY0nzcKrrsJr2cQ5aEBf9ag8H74ZyJwekTQn1J2syYa5aWHk5Lmq
 9UmNgg0EF5Hv3xwppCVqhUZjBcXSW/WcBBUEnbKhPaqYR0rx537FQfxsrDeO/gD8sFJFKg15P6ZlS
 bVAWmY6A==;
Received: from [2601:1c0:6280:3f0::19c2]
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j1kJ5-0007Y5-TA; Wed, 12 Feb 2020 05:11:27 +0000
Subject: Re: [PATCH 0/3] Add new module driver for new ASRC
To: Shengjiu Wang <shengjiu.wang@nxp.com>, timur@kernel.org,
 nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 broonie@kernel.org, alsa-devel@alsa-project.org, lgirdwood@gmail.com,
 perex@perex.cz, tiwai@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
 devicetree@vger.kernel.org
References: <cover.1581475981.git.shengjiu.wang@nxp.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2ab5cc65-026a-10fd-1216-b0d83baf37a6@infradead.org>
Date: Tue, 11 Feb 2020 21:11:26 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <cover.1581475981.git.shengjiu.wang@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/11/20 8:30 PM, Shengjiu Wang wrote:
> Add new module driver for new ASRC in i.MX815/865
> 
> Shengjiu Wang (3):
>   ASoC: fsl_asrc: Move common definition to fsl_asrc_common
>   ASoC: dt-bindings: fsl_easrc: Add document for EASRC
>   ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and platform drivers
> 
>  .../devicetree/bindings/sound/fsl,easrc.txt   |   57 +
>  sound/soc/fsl/fsl_asrc.h                      |   11 +-
>  sound/soc/fsl/fsl_asrc_common.h               |   22 +
>  sound/soc/fsl/fsl_easrc.c                     | 2265 +++++++++++++++++
>  sound/soc/fsl/fsl_easrc.h                     |  668 +++++
>  sound/soc/fsl/fsl_easrc_dma.c                 |  440 ++++
>  6 files changed, 3453 insertions(+), 10 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt
>  create mode 100644 sound/soc/fsl/fsl_asrc_common.h
>  create mode 100644 sound/soc/fsl/fsl_easrc.c
>  create mode 100644 sound/soc/fsl/fsl_easrc.h
>  create mode 100644 sound/soc/fsl/fsl_easrc_dma.c
> 

Hi,

Is this patch series missing Kconfig, Makefile, and possibly
MAINTAINERS patches?

thanks.
-- 
~Randy


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E768C290A80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Oct 2020 19:19:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CCXvf3zPrzDqMT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Oct 2020 04:19:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.193;
 helo=mail-oi1-f193.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CCXsb1fWBzDqlc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Oct 2020 04:17:54 +1100 (AEDT)
Received: by mail-oi1-f193.google.com with SMTP id w141so3233577oia.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Oct 2020 10:17:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ERbnFskVROyz/pusq0tPmpG01bF6U8YGRnegt7uD+BQ=;
 b=kIVUxuXvaUqlzVafMSCU1y54BiuGJipAmBSysHh3UdTVqvORzHWhBVfhlR0uPoXeYm
 7HWRPVsjGoFafBrkug7+fO2doLHZVE1aMpr6ujZgeVhQjd0UMXqZOEggChzbQVBhJ1uA
 Kv3F/Lq4HB2XCB3SHKMNNbo4dJGVk3C1YyZV6L0Jwi/buWF6sb7veZbXILLRkg2myCkU
 SllYIkd/MZkKQVmaqkW/BTB+bp4yWYLLPXLbxT6vEfXTYK7QNVnFEfIKr+dGgQ1hvZxA
 G9HqC5XOlCBT5pyJmnSJd2gsfUsNgSNR94RPzJxQySpo3arYaX5jMEJJ8CGJulPhGvs/
 PBTQ==
X-Gm-Message-State: AOAM530nbjBcUNveLTCSOlO/TGpclm3OGrQgao5iCdPbzZGNPZuZtle7
 EuIjvxYV58xoqWJYa29uPA==
X-Google-Smtp-Source: ABdhPJzkHaNyeKJvhTFdbLO/y2u79BYQP6B4K5spT7qIr+MdGwla4Ht7FPubs9pHpSp9hmW7GPF0kQ==
X-Received: by 2002:aca:52c4:: with SMTP id g187mr2972481oib.101.1602868671744; 
 Fri, 16 Oct 2020 10:17:51 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t29sm1138160otd.51.2020.10.16.10.17.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 10:17:51 -0700 (PDT)
Received: (nullmailer pid 1597850 invoked by uid 1000);
 Fri, 16 Oct 2020 17:17:50 -0000
Date: Fri, 16 Oct 2020 12:17:50 -0500
From: Rob Herring <robh@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH v4 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Message-ID: <20201016171750.GA1597815@bogus>
References: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
 <20201013121733.83684-3-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201013121733.83684-3-viorel.suman@oss.nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Fabio Estevam <festevam@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Viorel Suman <viorel.suman@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Oct 2020 15:17:33 +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,xcvr.yaml   | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>

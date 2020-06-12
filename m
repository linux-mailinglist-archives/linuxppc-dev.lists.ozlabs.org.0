Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8819C1F7505
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 10:06:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jtbB5lf8zDqwv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 18:06:14 +1000 (AEST)
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
 header.s=20161025 header.b=R11IQyFQ; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jtTs2YmdzDqyX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 18:01:37 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id l63so1524308pge.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 01:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=XY0Kd0MAkqDRfCM5CZwaoAipfMsQ34/pTBpRI/Gy2M0=;
 b=R11IQyFQgzW+BqKYe1vGc5m/TGV1nUF3yS0d9X2YdzzLgQvGmpqWtSlt2WHNkFGldE
 y9qypcAtZXJqHYlXT8ehuXtsZioZogq4k75/uIGWfO01i0Oq7V5cq1ngdX2WJaHYdxTZ
 TT0whjl1FkxzVmAmL7M7MI21/j0lkQPyYkKURTZqWN13e2+o8L1H5V0XsVmXX3DcaPeY
 YcfodIYDi6KsHmdoVNXTfdWs26XMXY0oq51KF/yYl8wb+ofQVq7NEberAedkBIhxF0p6
 6PHM1G44pm/zeWT3a+0fobhfRR/+nO81qLcqGf2DfYegDmBSdldi3eFJqX9G4SX31fu7
 WfgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=XY0Kd0MAkqDRfCM5CZwaoAipfMsQ34/pTBpRI/Gy2M0=;
 b=LacwDC93rHr7A5+v1UYx3XSsBR7E0p1aX55Z5F14mheaKmdobr3S/VC0KbmeeT4m7l
 6vAnxUDOWMJb6CoeAkNQc4HcCPwHqSdduL/8nlgs6nz3MlMsF/gesaEJhIs3cFMUsaIl
 bJnOOJ3QOgS1wmhN4MIIvghV3CnaTO1Vt+ZW+3G/CMoDb1yvd4r4hW3fGj5AxwBFMLYQ
 nivUHa4VpdoDOub+VW24Ip+lVcX0cCSnTTfvfAMQWDm3Etn8zEAW0XPYlZuuCVsCf0RA
 Midk5/EgUsXHWCilxmRJDwwaLomPn9EYLD+YvE5JP6qjSzD+JRpYl3+lwGGXv1iL22+7
 pGVQ==
X-Gm-Message-State: AOAM530qvIFsZ426Y20bxJB7fjD/k5hIh/O0kYiMWyN/dk4Vkd7eD8A7
 Hx/ZRwYaVAM3PXbywby0RM0=
X-Google-Smtp-Source: ABdhPJyfSjW4igzMKRqt4hjfUewgh1f4ezU4kuzE2PczkbgWn387+h2coH1BunsDoAXhJ9nnMiqrIA==
X-Received: by 2002:a05:6a00:1592:: with SMTP id
 u18mr6469145pfk.26.1591948894330; 
 Fri, 12 Jun 2020 01:01:34 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id gp4sm4590235pjb.26.2020.06.12.01.01.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Jun 2020 01:01:34 -0700 (PDT)
Date: Fri, 12 Jun 2020 01:01:25 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v3 2/4] ASoC: dmaengine_pcm: export
 soc_component_to_pcm
Message-ID: <20200612080125.GB22422@Asurada-Nvidia>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
 <429c6ae1f3c5b47eb893f475d531d71cdcfe34c0.1591947428.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <429c6ae1f3c5b47eb893f475d531d71cdcfe34c0.1591947428.git.shengjiu.wang@nxp.com>
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

On Fri, Jun 12, 2020 at 03:37:49PM +0800, Shengjiu Wang wrote:
> In DPCM case, Front-End needs to get the dma chan which has
> been requested by Back-End and reuse it.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0EE1F7515
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 10:13:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jtlc1lfwzDqyw
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 18:13:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZK69Co/l; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jtgp1Y5qzDqv1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 18:10:14 +1000 (AEST)
Received: by mail-pj1-x1041.google.com with SMTP id ne5so3343613pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 01:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=FrBOISxwKyWg3yFgNawz44Si/Jo/mcOoYEJcWJFfVoU=;
 b=ZK69Co/lXBcRsFD7SUsxis7MvrrcFiGb9wXzfn7QAfqobBYK9JDAVVUXXpRpFHMLg0
 bvEppJLtKU+QvKbxuYgo0rxwsXP9WiA9uF0rGQy43dpzucJAnjc2IyzVcZ1ElnYntB7l
 ATrDNsHmMMemgc2y/R9TU7A9JQ3Ve8RNKb8SnaShfdenzGbXzILlFzjWK9lvsREaci4G
 VYteP+8a1FKn/dMhPPSzX5EuZSXt2zkupMCmExVRxk+qmMa3SQ8qmPp74Y8Ln/IZJW5M
 g+BVoCzM2yWQoUraZtQxS5HGxkw+Jgl24vvTzDytIgPnaEyNS+OHC2lqEYxJlor1u0zK
 Q1Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=FrBOISxwKyWg3yFgNawz44Si/Jo/mcOoYEJcWJFfVoU=;
 b=oQfjWREvlbrn6Nzn3c733C98MvRRngW5VU04yLtE8yizr35YHPiENJqNxGx8G0yQeq
 xb3AW1l0p1BDl0esKxW0TcjoqOrtWahjL4iVwa5y3nKvBVZBkaS6wMAdGpTQzBhP7z8X
 UpkOSzD8HbnKOUvOTBNzriRg4atNzT7PYDYjQwm+YT1FArNnEwNTvMll7Skrn/MEhiql
 oSo2otqOWuqvvn5me1QqSJdVCRjwpabdukV7BMdZehUXmd5DfIbeaE+MyYUxBJvz4hu1
 2rCjbSisPtjvtkjHpc9VWKGrwvog9jhOJmHWvkYvWzq8kYz+6Ia31kBlDxQcOZQO1/hQ
 FNHw==
X-Gm-Message-State: AOAM5330Zf6vjtV4SrSV2Nk1pO3ZkqcBrfXS5RvBa4VVPjj70dUZGDGo
 FB0fMtWZzw26aLe/FqYukTA=
X-Google-Smtp-Source: ABdhPJyS8XQ1B9/rurFHEaifuL86DzzigqQvEbE5slis0FR6ePbWM33oVYWhL/dvgVit13H7C4fJKw==
X-Received: by 2002:a17:902:bd09:: with SMTP id
 p9mr10817945pls.214.1591949409605; 
 Fri, 12 Jun 2020 01:10:09 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id 191sm4484589pfz.30.2020.06.12.01.10.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 12 Jun 2020 01:10:09 -0700 (PDT)
Date: Fri, 12 Jun 2020 01:10:00 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [RFC PATCH v3 4/4] ASoC: fsl_asrc_dma: Fix data copying speed
 issue with EDMA
Message-ID: <20200612081000.GD22422@Asurada-Nvidia>
References: <cover.1591947428.git.shengjiu.wang@nxp.com>
 <424ed6c249bafcbe30791c9de0352821c5ea67e2.1591947428.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <424ed6c249bafcbe30791c9de0352821c5ea67e2.1591947428.git.shengjiu.wang@nxp.com>
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

On Fri, Jun 12, 2020 at 03:37:51PM +0800, Shengjiu Wang wrote:
> With EDMA, there is two dma channels can be used for dev_to_dev,
> one is from ASRC, one is from another peripheral (ESAI or SAI).
> 
> If we select the dma channel of ASRC, there is an issue for ideal
> ratio case, the speed of copy data is faster than sample
> frequency, because ASRC output data is very fast in ideal ratio
> mode.
> 
> So it is reasonable to use the dma channel of Back-End peripheral.
> then copying speed of DMA is controlled by data consumption
> speed in the peripheral FIFO,
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>

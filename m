Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FBC3361A22
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 08:58:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM6VH0FvXz3btV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 16:57:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=H8ZiBgWd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=H8ZiBgWd; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM6Tr6qdnz2yyj
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 16:57:34 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id 20so9507653pll.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 23:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=N3Oc03Y3DYt6uoUli6Ypl8t/ni03h69oGIKcq/LQC7c=;
 b=H8ZiBgWdAp4139XWvEw0IB3zAbsM+AkX7HEx2Y8BlDcM/z839QeZili9xXfOoksvPA
 po0divY66J+faBefaUAljkQGDlpj955giXYEcfzUZ54nRpBaSQq2C37ztIQ/FV6F1gQI
 LWf+7mmxDLLZb4p0oPauEDNJAYpme4fpL1bQM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=N3Oc03Y3DYt6uoUli6Ypl8t/ni03h69oGIKcq/LQC7c=;
 b=AUCC6AK4yZhBC6gSoAoY3QZHTVjbBDjTBN3f5uiqlulEyoQW2PN8Omgl2cThekeZwv
 TD5y65aolFBCkRVmTd4qnmr3I+nxDyze4jYHngnIw9e+entsdSfAcdocQE/5+Xkj6KIa
 KnvxQgOEM65PPU0W7T0wDPE9QhC0sD7PQGA1TvetOOoebWy/pjRV/JLrpiTOjowMjVQo
 84V4fA8nmn5e4w0cosnGOUL+21cAN90KSB0omaG4N23zgHbe8zHcEVFcLdDUDfwEEo3o
 0EhWaQLQ/ZU1bh4PV2EJLzP1I9WVqy7uIMH74BHs3/sYkPQgwzu4heEoB8QMPmxZW+Fo
 BrAA==
X-Gm-Message-State: AOAM531Z2D9hHG6BwpfbkNAMk0nWlqWmkvdKcx/MbekGTvyxU5xxMUdc
 XUmgAiFjCILVLYlObZZbQl6d/Q==
X-Google-Smtp-Source: ABdhPJyTBWp8Om5xCwqE0gPoM75LEgX1nYrbr4Q+sDn0X0maaa1CY03ksnEhhjR3hHPgcpnCCswaZw==
X-Received: by 2002:a17:903:2285:b029:eb:d7b:7687 with SMTP id
 b5-20020a1709032285b02900eb0d7b7687mr7895245plh.82.1618556250519; 
 Thu, 15 Apr 2021 23:57:30 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-09c3-a49e-2955-78c6.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:9c3:a49e:2955:78c6])
 by smtp.gmail.com with ESMTPSA id i9sm4518671pji.41.2021.04.15.23.57.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 23:57:30 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, qiang.zhao@nxp.com
Subject: Re: [PATCH] soc: fsl: qe: remove unused function
In-Reply-To: <1618475663-100748-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1618475663-100748-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Date: Fri, 16 Apr 2021 16:57:27 +1000
Message-ID: <87blaeg1ig.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, leoyang.li@nxp.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jiapeng,

> Fix the following clang warning:
>
> drivers/soc/fsl/qe/qe_ic.c:234:29: warning: unused function
> 'qe_ic_from_irq' [-Wunused-function].
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
> ---
>  drivers/soc/fsl/qe/qe_ic.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/drivers/soc/fsl/qe/qe_ic.c b/drivers/soc/fsl/qe/qe_ic.c
> index 0390af9..b573712 100644
> --- a/drivers/soc/fsl/qe/qe_ic.c
> +++ b/drivers/soc/fsl/qe/qe_ic.c
> @@ -231,11 +231,6 @@ static inline void qe_ic_write(__be32  __iomem *base, unsigned int reg,
>  	qe_iowrite32be(value, base + (reg >> 2));
>  }
>  
> -static inline struct qe_ic *qe_ic_from_irq(unsigned int virq)
> -{
> -	return irq_get_chip_data(virq);
> -}

This seems good to me.

 * We know that this function can't be called directly from outside the
  file, because it is static.

 * The function address isn't used as a function pointer anywhere, so
   that means it can't be called from outside the file that way (also
   it's inline, which would make using a function pointer unwise!)

 * There's no obvious macros in that file that might construct the name
   of the function in a way that is hidden from grep.

All in all, I am fairly confident that the function is indeed not used.

Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel

> -
>  static inline struct qe_ic *qe_ic_from_irq_data(struct irq_data *d)
>  {
>  	return irq_data_get_irq_chip_data(d);
> -- 
> 1.8.3.1

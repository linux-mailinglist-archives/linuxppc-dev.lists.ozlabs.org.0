Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BA01B9472
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 00:23:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 499Mqd412kzDqTZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Apr 2020 08:23:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BG2tQbWa; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 499Mnt33jCzDqTZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Apr 2020 08:21:37 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id t7so296069plr.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Apr 2020 15:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=87krT2AY3IIXSFmpZQdTxrUuwCEzZrT19IZOtMtjJGw=;
 b=BG2tQbWaMlVPecrCiNejX4J+DAsEwq/APzsWFxkCTwVKg1SnkZczk7YACoyXLZ10o4
 nqOR7c4BV9OI8ZO1n6K345K2LnClacAbTcsILMCgREgjEhsLMf6JoKpY+9RrRl5NquzT
 tObNYS/0C3jFnH0bJWzQnAILzhbwOp3ZP8f58+5ubUOOc7hvbNuTXhdpKN1UbpfMRRHC
 wbW/DIgwu6WV73ypUANjq8/tIfu6H9csMyASqls+/OMZb5FKY/YNBrgYaRsr7y5hksfg
 /oQOklkarLaAbJqQwFhTKCV6BlmQWYupLhYxHIx3sZ7/Qe4TcptJECFiZBN2EW8icX2Y
 0CUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=87krT2AY3IIXSFmpZQdTxrUuwCEzZrT19IZOtMtjJGw=;
 b=M+fLD3MwORwbVk7qEHYHo7Ahc+xdt/OErtennn9OcMauWib2ITpCxEgFo9916xbkCc
 PKysn5+mS77+eTTxkKYuJVW18dOJAwL3xHlSyRBpapGMaVk1CeF3dfcTFufC3pzaRwjT
 Shy6kgRIpCdI0GhBxbcIEtnva5qETn6WmVOXwTypvS7OUusxOpQqtebqGCl2FjTGZyQb
 g8iz0KjJjKVfJ90sXDilTAuFThPoRpRyWKXWPUTjidmibQwbRWtyWiZjGrrdVVj9nG/K
 emlUNZjjgB3eagedqpw2Jgs1FMI5/FotQLCPrwARTY+Ap2KbmgEKxmwEbMNo9nayIr2T
 cdxw==
X-Gm-Message-State: AGi0PuZcpldCRFu9ilokA9OrjDVDjR+guMvACOEIjeYAgzMb7PyAkBrZ
 FjRcq95+uIQI5U51L/1QJyE=
X-Google-Smtp-Source: APiQypLF/2t+K1/Ik2f9YAXqpwjsS1ALdwWoEoZ88bxnxZu874DYOblLKqaoFUIlehzyHcSlhLWwhA==
X-Received: by 2002:a17:90a:e28f:: with SMTP id
 d15mr19829287pjz.79.1587939693670; 
 Sun, 26 Apr 2020 15:21:33 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id f21sm10781067pfn.71.2020.04.26.15.21.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 26 Apr 2020 15:21:33 -0700 (PDT)
Date: Sun, 26 Apr 2020 15:20:51 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_easrc: Check for null pointer before
 dereferencing "ctx" in fsl_easrc_hw_free()
Message-ID: <20200426222050.GA28661@Asurada-Nvidia>
References: <d23c939f1c9eeb3fce34b6c34d44e2d6156f663a.1587799355.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d23c939f1c9eeb3fce34b6c34d44e2d6156f663a.1587799355.git.shengjiu.wang@nxp.com>
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

On Sat, Apr 25, 2020 at 03:19:29PM +0800, Shengjiu Wang wrote:
> The patch 955ac624058f: "ASoC: fsl_easrc: Add EASRC ASoC CPU DAI
> drivers" from Apr 16, 2020, leads to the following Smatch complaint:
> 
> sound/soc/fsl/fsl_easrc.c:1529 fsl_easrc_hw_free()
> warn: variable dereferenced before check 'ctx' (see line 1527)
> 
> sound/soc/fsl/fsl_easrc.c
>   1526          struct fsl_asrc_pair *ctx = runtime->private_data;
>   1527          struct fsl_easrc_ctx_priv *ctx_priv = ctx->private;
>                                                       ^^^^^
> Dereference
> 
>   1528
>   1529          if (ctx && (ctx_priv->ctx_streams & BIT(substream->stream))) {
>                     ^^^
> This check is too late, to prevent a NULL dereference.
> 
>   1530                  ctx_priv->ctx_streams &= ~BIT(substream->stream);
>   1531                  fsl_easrc_release_context(ctx);
> 
> Fixes: 955ac624058f ("ASoC: fsl_easrc: Add EASRC ASoC CPU DAI drivers")
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

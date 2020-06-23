Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 491212049BC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 08:19:25 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rbhp3F5dzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 16:19:22 +1000 (AEST)
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
 header.s=20161025 header.b=ntaRcLow; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rbfB02thzDqPR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 16:17:05 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id s10so9414118pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 23:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aRgKar6UhjVPbbeMviZl5LaaMbKjszzBO+Eoi1rtDeI=;
 b=ntaRcLow8nO0pWaGgySgikdwt4YMvOtBKNxrRwxoC1oZq6NHbWlPoPhyg5Wc0nNQQq
 liNy5Z/BjBVk5/jawKVHkCa52CTdka/HYUgKICPTjKMb0CRq0fy1SF2TDV+qlmhVROT9
 qO8Hgmu4BQnT3hctqsX1UnGty+OmjNUskMYhGHDorFPZCGZrZmPSPm+MxIcte9oYnAt0
 HMP6iauHOp9STPPXrvunv0Ztq1vot7Y5hHy4QNyHN63Q5GLy/9/UL5XBO2CxgdX/w8Hr
 ZWhSSyVLC6/zLAiV4Ob9ll4w01BuVKJSwBakDpD9BX1/oE2TPZDKOCi2ZlSquCfiCMMX
 fgTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aRgKar6UhjVPbbeMviZl5LaaMbKjszzBO+Eoi1rtDeI=;
 b=qqj3ZGhsqnE1vRl9iCr4G3v0u+noV72hTiBNE7xzeQKMipLI55WGLwD08MblNjRMA6
 dwapfqUgp/P7K6vBhwWxgR+IhdrJ7LOOHM+EN3N19gFqoLzo5qaOGTYQ90OFKy3AC5IS
 MkkaKLJUA80Pb3eC41ucvMCIMjO9u/ztvYU/sXX1nyFysGikn+dkhgYVZWc/c6JD6u6B
 5r9VeYKoMSz8W85LZzqWZACB8gRjVO0mHdEckWHDBTNevvrkMeWjySNiq4lFkD+jqoQw
 34Mqmb7yEE1a4DtXdsy+U+CnmKw1RqgxFSGzRgioBgQaHMXEKuTwdatuVTBW8Vw/YLLM
 zwKg==
X-Gm-Message-State: AOAM5338YSStAeEjIevuX3cLt1gjvmCDdU0Aml1zmzZceU28nLG2PkSh
 TTHO35cxRQbQmakhL0loso4=
X-Google-Smtp-Source: ABdhPJwm3iPXSzpwN/FxG3dnBLyTWtXeYz4zMOZSGTqWgN9hRZz6rmb2HkE4A5XcbWeutGtmxHc2wg==
X-Received: by 2002:aa7:9738:: with SMTP id k24mr22282623pfg.44.1592893021976; 
 Mon, 22 Jun 2020 23:17:01 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id l61sm1255318pjb.10.2020.06.22.23.17.01
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Jun 2020 23:17:01 -0700 (PDT)
Date: Mon, 22 Jun 2020 23:16:36 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_mqs: Don't check clock is NULL before
 calling clk API
Message-ID: <20200623061635.GA17085@Asurada-Nvidia>
References: <cover.1592888591.git.shengjiu.wang@nxp.com>
 <743be216bd504c26e8d45d5ce4a84561b67a122b.1592888591.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <743be216bd504c26e8d45d5ce4a84561b67a122b.1592888591.git.shengjiu.wang@nxp.com>
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
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, perex@perex.cz,
 broonie@kernel.org, festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 02:01:11PM +0800, Shengjiu Wang wrote:
> Because clk_prepare_enable and clk_disable_unprepare should
> check input clock parameter is NULL or not internally, then
> we don't need to check them before calling the function.
> 
> Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F772049C9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 08:21:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49rbl66HZPzDqLW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jun 2020 16:21:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fn3y7skK; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49rbj75Mb1zDqHv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 16:19:39 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id s10so9416675pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 23:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Bwz1vrpVxlGgwtFKw237fp9M9eojls5v4/DP0A07JQ4=;
 b=fn3y7skKUEDp9iQkWtqczpoT5FaVQt4MtuOdi6Dsxzp58ItB1PqdXW44Cetlzw9217
 VD9r1GiTXD+bRBgr2+JXYX+1mKsJdMc3yw7u61oeMo39QT+FVS49ZsNzKse7Eh7oUiXv
 7F2obX235r6Akbk97F4qUQmhEo42odWWe+81tIuKp2gz4wXAM1bNfTQWam5P5oHIF2ON
 I0edcl8g20c+V5pTlzKkoezS2UL5ZT3GC5rmpFGrbzRVJFKLFXwWZI4E+Yq9w7jqUuqz
 SbuhT1LoYV5Anl/JBtDQFU7FTYTOkBPrW+4ARUOMMpjlPYpCvF34JvnCWxUmQSWB0nXv
 HE3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Bwz1vrpVxlGgwtFKw237fp9M9eojls5v4/DP0A07JQ4=;
 b=SaiT0Iz5dWqCil95ZhnVZIgKxXC8nffL9Qfy7PKkXKhp43lRGpDPnVAplRjLIs06tc
 eOflfQeo9lm6h4Qk5t5RjvQuK9ufCN6jeJJvuw2SvpIJ0lFOfcb3Ph+MAOcMdnsajKst
 UYsBC/9i6/OzRbvqyk1ThQEPbb0RnsPjCTADvI5oseRYsejIIt1SzoOHjApEXobMftyU
 4ZNG7MLZoUPDh3lTjRKOaQVxQc33CJ2gTZccAuBWXGVg7b5lC7PVgo7CD/trqbb+28pM
 Gk9qVyqOWe1xL9XSFOMuE/+6Xmm94i5srsR2OSPN6biG4zsMBipMR87UePQD8Y9hi47a
 nWFA==
X-Gm-Message-State: AOAM533nCi2deSTTEF3/S2AwgK10+GupAOmpZM7JUz6YY7GppKxkSxQS
 jqqMgPme5Cwb5pZt9WHtX01NFnSUZlg=
X-Google-Smtp-Source: ABdhPJwUtGgLL8c5jtRRJm6AFuwIQf/CtCYTn5xkqG5AoImo/YewMgT5It9ubJgub3rXylkVIimJlA==
X-Received: by 2002:a62:19c4:: with SMTP id 187mr458732pfz.312.1592893177171; 
 Mon, 22 Jun 2020 23:19:37 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id jz23sm1270689pjb.2.2020.06.22.23.19.36
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 22 Jun 2020 23:19:37 -0700 (PDT)
Date: Mon, 22 Jun 2020 23:19:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/2] ASoC: fsl_mqs: Fix unchecked return value for
 clk_prepare_enable
Message-ID: <20200623061913.GB17085@Asurada-Nvidia>
References: <cover.1592888591.git.shengjiu.wang@nxp.com>
 <5edd68d03def367d96268f1a9a00bd528ea5aaf2.1592888591.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5edd68d03def367d96268f1a9a00bd528ea5aaf2.1592888591.git.shengjiu.wang@nxp.com>
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

On Tue, Jun 23, 2020 at 02:01:12PM +0800, Shengjiu Wang wrote:
> Fix unchecked return value for clk_prepare_enable, add error
> handler in fsl_mqs_runtime_resume.
> 
> Fixes: 9e28f6532c61 ("ASoC: fsl_mqs: Add MQS component driver")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

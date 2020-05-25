Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8D21E06CF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 08:18:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Vn2s3lgkzDqDc
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 16:18:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ri27KJ57; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Vn1P0GY1zDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 16:16:56 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id t16so7126922plo.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 May 2020 23:16:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=1y4ds9zBC1SyppOslu2mLkxYcNHMS7bdeKWM7VoLVJM=;
 b=Ri27KJ57iDhs85zxL0RpQLEdYtlE2a3/aJma/2msgokrz+N411A+WrgmoubU77/pCl
 Yd8CtuzMQQZ9st9XfemTdl/UDK+Lg2y2aV0zsjqMoJbjiy2dgh2mSgMc1BI/S/ykes3y
 bnjRyoMAbybFPqi2XL/PoLK3RGacV1GBBnvZHLEElv8DAIpwmdKS2xMwU+uXmaZxKxrp
 azXyJBvjfpmt1G9WrzH6mgCWYVkGn6owSOkeU5ce18CWs9iujmuSPAWRB+XiD1xovLrk
 R+eCt1fDZtETLygzNUbhw8jyvId4OqGNVsZlEzfcx4PmA/PrHURT1ZljgOWcDxpndrWw
 FjqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=1y4ds9zBC1SyppOslu2mLkxYcNHMS7bdeKWM7VoLVJM=;
 b=NbM9xQ8WWryy98yAnUQ/5XVLxjswZAJQnh2zTMQhsCgJweyoZnCQJUsq0SeGZSODWG
 dM1HdydFwv0hPHlSVQTKRLJICFh0qLJZY7hgZMG67wl/xlGPhe58VhKmx3ssNKc3ur8c
 PGrV17kRgrdqqb99YoGE2Euk73tZBdOfG3dYLO9jjRg62zBULRWrxuoj9JO0vpDcoECz
 TPaE4FkeGZdpk3HCQmzMEs7PPZgubf2S8uNmM8bnZ//jY6zkwlRqqf9Rf6uQR/1Ulp1u
 Rh8rJJq4Pt2Xm8oMa79KMeTGd1uIFwAzyoxJLFaodLPsz9WZmH8vgY/CtogR1TdmEw17
 mF4A==
X-Gm-Message-State: AOAM531SExmYFSO24ob0xjqRb/saZS6XPZoi4gspZpJnlkplkKJNXI9q
 SHKtod7uhtnifAzwXvIBnMA=
X-Google-Smtp-Source: ABdhPJyLnql6NYz3i6BDhhM9Z530+1CTHhFC5iBW0B2EeJA9dSWqab0WegzIfvg2UY2Fb/PuDkNTfg==
X-Received: by 2002:a17:902:7787:: with SMTP id
 o7mr20963332pll.52.1590387412768; 
 Sun, 24 May 2020 23:16:52 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 o16sm3623730pgg.57.2020.05.24.23.16.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 24 May 2020 23:16:52 -0700 (PDT)
Date: Sun, 24 May 2020 23:16:46 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Merge suspend/resume function to
 runtime_suspend/resume
Message-ID: <20200525061645.GA12112@Asurada>
References: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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

On Fri, May 22, 2020 at 05:57:24PM +0800, Shengjiu Wang wrote:
> With dedicated power domain for asrc, power can be disabled after
> probe and pm runtime suspend, then the value of all registers need to
> be restored in pm runtime resume. So we can merge suspend/resume function
> to runtime_suspend/resume function and enable regcache only in end of
> probe.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

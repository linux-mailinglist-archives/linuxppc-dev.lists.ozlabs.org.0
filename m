Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3192B8BD6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 07:53:52 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cc9Pn06XxzDqgL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 17:53:49 +1100 (AEDT)
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
 header.s=20161025 header.b=jbuo9kaE; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cc9Mc2GyXzDqC0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Nov 2020 17:51:54 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id l11so2441120plt.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 22:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=YdZEJFrKMqOKwqEHM2SMsgDlq62AjmhaiDfpu3ifyuI=;
 b=jbuo9kaEqlrzfBtB8xdHG/ABifiR/DNQ/ty/tTE8v/3XGOFwJGEj60vaW7+EToRIS9
 j/RewspM2uK8jaGUgXUgItDPW/u3Ij5QNuzGqpfr8txs/pidD5qZttqcEngOy0Ra8j4z
 dhE7WiKNgaC7fmWqaZQtkcJWFqUoXcaJncuO1Caa9CoMttRmkN8aj0PRPEZnkKRNjp/j
 I11/RthsHxm68vtFm1Yypu7bfCsbTB++dBEDnqCu07cFwzJUCFCgPKuDyqZlmO46DAs4
 LIgM/1C9/xVIzBYYqYO8GsgaCW77wrx9aYrZxa8VKTLNSNpukiLYg36Oy9zVP5uSrMGt
 gbPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=YdZEJFrKMqOKwqEHM2SMsgDlq62AjmhaiDfpu3ifyuI=;
 b=VyHGclJ1JlcqrOeMQD4w2I1c18FBfeDAOZeiZUyGURjy9fSPXwcTdS2Olbi85TLXw7
 WzvO6puI1oVrTu0Z6Ms9NAoZ2tXNWrXdzDTFgdCI0ECrMyn+xgFgRdpOw3a3FCx1KfQp
 JuBOaYH8WPYdCH1gCT7dONBoa8H+jtRWd+yLACicsZlf2sb5RN6JGIihTy3g+ZO/J+Uj
 qTL5dWh8Yr92rTgdEPFnfSRL0vZ1DIiQyeRNpQBJj2dCw6m0AL+Ty4mGvNrvirlvRrxo
 iWei0+FFd/JAqns3r7a60O53WhATCK6C7rqHVNnzulmGtc8MrBRs+Snl1AXhNbynZmRe
 qHsQ==
X-Gm-Message-State: AOAM530bBJ4lHJSL4kLsIERFDq71g4wGf8yFFIWj973SBiuajDOR0Mo9
 5RQEQ5fUKlciFFfazDYZ554=
X-Google-Smtp-Source: ABdhPJwNjcaPO4z56nqOXPwx8RuDahj5FRpIkqxLnLyLvLIbuMAUb/EcTDMnhRUfdl2utjiWINvCbA==
X-Received: by 2002:a17:902:401:b029:d7:d0af:f897 with SMTP id
 1-20020a1709020401b02900d7d0aff897mr7828053ple.18.1605768710494; 
 Wed, 18 Nov 2020 22:51:50 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id j11sm23890863pgp.82.2020.11.18.22.51.49
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 22:51:50 -0800 (PST)
Date: Wed, 18 Nov 2020 22:51:23 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2] ASoC: fsl_sai: Correct the clock source for mclk0
Message-ID: <20201119065122.GA9858@Asurada-Nvidia>
References: <1605768038-4582-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1605768038-4582-1-git-send-email-shengjiu.wang@nxp.com>
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

On Thu, Nov 19, 2020 at 02:40:38PM +0800, Shengjiu Wang wrote:
> On VF610, mclk0 = bus_clk;
> On i.MX6SX/6UL/6ULL/7D, mclk0 = mclk1;
> On i.MX7ULP, mclk0 = bus_clk;
> On i.MX8QM/8QXP, mclk0 = bus_clk;
> On i.MX8MQ/8MN/8MM/8MP, mclk0 = bus_clk;
> 
> So add variable mclk0_is_mclk1 in fsl_sai_soc_data to
> distinguish these platforms.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

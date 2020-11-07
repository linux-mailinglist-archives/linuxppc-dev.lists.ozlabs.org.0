Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F02AA23B
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 03:42:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CShP729LBzDrR5
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Nov 2020 13:42:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UwI9OV4X; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CShMF6GdlzDrFd
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Nov 2020 13:40:39 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id e7so3292183pfn.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Nov 2020 18:40:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=uIZQwyu3heVWOuZiTU19D+Rn7MoOiKM8zu84y+cy574=;
 b=UwI9OV4XjHg/GOytA2RlHLo2M6JLlW7M5230uqzFpBC2M9Mtkw30LzLDYQ69j0W7Iz
 KJvGsPiCipMbg8JMEm9fW8u1REnbRLHe+lh4W8Ssz++RgLG2DKQnJQJhMqMeE9hFwOEb
 fG+8RdA6cyA8TWfJ8nPCA+d6OL81wPnp0j3mENUpIzfW4GoLgQ9sM5D3bkuzQI+y4alf
 bTay6lXpq+gBveRpOK94h8DQF+ZDYHBJmCfvdbJ09U3Lp/MNQ67qO6P4Pov8neD6GJ6M
 hJX5AQ90xKKCRRFM641cHKHqagg+mKQ5HyM3XIHcmryL782zL1wcEBGQEEFKKVYr7vj2
 My9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uIZQwyu3heVWOuZiTU19D+Rn7MoOiKM8zu84y+cy574=;
 b=lq9oqx/wOmGepQn+oWIiArCQz0RHLQ6O0N9iJN7tiNlR9AAWXYJp4iAA5OSLZJDjv9
 Twssqf0CrmBL97+HTZVOMM97+/Sqf+cUxW/KgUXzpHqiojCA/O00GAZc+t+IATj3FCPQ
 pwYah8a4MtvKPJ6Apc84vpoHCOw3iK6ropx6/KZ0yZE2BKoONCitRDeMyemCywpg+aqP
 2BhLtu6jrBeSw8mJ2Rx3xeX/yWBsdFulKdn58IjkqttyVZnHUvsjcjl97sZKD78KnA23
 6msQ0QcjYObSB0695CX3ANoejEyanVZPxy2jCRPpS5XLP1IL/skleDQEC1narHh/da2y
 Ldfg==
X-Gm-Message-State: AOAM533cy9BOk25GNkR9tkiurvtplIs9zNO/KEAV3efnxRFI3BzKiqF3
 Fvq1pBcScbO5ePvPxo7puAA=
X-Google-Smtp-Source: ABdhPJwppyyTWHSp5pmK5h5/8Fa9jyRxfiLX2TJyLtAO4il12N3D8xn3qiRuq1mH+2JebQBByBlSqw==
X-Received: by 2002:aa7:815a:0:b029:164:cc2e:2c56 with SMTP id
 d26-20020aa7815a0000b0290164cc2e2c56mr4532319pfn.21.1604716836081; 
 Fri, 06 Nov 2020 18:40:36 -0800 (PST)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id d68sm3670126pfc.135.2020.11.06.18.40.35
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 06 Nov 2020 18:40:35 -0800 (PST)
Date: Fri, 6 Nov 2020 18:28:22 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_aud2htx: Remove dev_err() usage after
 platform_get_irq()
Message-ID: <20201107022822.GA5163@Asurada-Nvidia>
References: <1604715643-29507-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604715643-29507-1-git-send-email-shengjiu.wang@nxp.com>
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

On Sat, Nov 07, 2020 at 10:20:43AM +0800, Shengjiu Wang wrote:
> platform_get_irq() would print error message internally, so dev_err()
> after platform_get_irq() is not needed
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6108126D0D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 03:50:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsKgL6XNYzDrP8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 11:50:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.66; helo=mail-pj1-f66.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=BRj0knLs; dkim-atps=neutral
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BsKcq5NfDzDqHV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 11:48:42 +1000 (AEST)
Received: by mail-pj1-f66.google.com with SMTP id o16so418556pjr.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 18:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=IAe9YrO2c2nTBXJ+6AECIPfq5RqNfakgD6ec87G1lRc=;
 b=BRj0knLsGJxxYLXBhVmfZKGmxujjz+/Hmqi/qEwMX//OJvKf9yyDeEixQBGPd4wts4
 6a1NAlBUMJK+9HsT0tHExIiIBY51fBoIN1yU3XQ8O9EkJj//97LGtCL11Pe5o+QJ+bcS
 et0sT0lWTzye+QnNs4WZa5DghwevjSdMMaI9tIfXsfOrCJHnbGucKLqyBveNCMYoqf3A
 9t6u+brl3mB9g4hGos+8dgLT0f8ElY0zna3yl8gzeOh5Pr+C5judrj0NmF4GGrl6ENI7
 ParWAThpX6/xse3rOFEo2Qr7eC6Z7XHGuVFMsX8cwQuJ1jtwBxjW95ySSrHiGJABu2XO
 wuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=IAe9YrO2c2nTBXJ+6AECIPfq5RqNfakgD6ec87G1lRc=;
 b=K6RyBPyhedeqR/sDX9WZ07eW7+iEJKhCUNKp3VfAu/YPCjWhDVKSMa9jOYTM+92rwp
 YOHJhRUr0jO9rIZ5n1VpE5hFC3Qpf7jAWb3SBY/aFxRpvDgmwsR8fuHhJ24ba/6CRfzU
 RWbmjZnCpF+NXTGYC0Kajuq8S857Wxi8FUJq/wgnRmyWVqBYWqv+sqARvbS41k924sLI
 GFMZ+ZjxWO59b01rWtUkFfmQc0nFxHjhLIelWGkH4OjBG/Vla1BRCG11D4AN7hUUedzf
 IuWhR3VpeoSqvOo55tlZkckaOiHDsdVU3kQgO9JgCKx4AyMQfvLqddFcEwPbNsNm5EO3
 NZSg==
X-Gm-Message-State: AOAM533oyT4d/MVxxdhcCZ0SQPSGAivjEl9N7M1dYHSHzFBfUNs8BOTL
 E/KsxlkIgxmlRkUdoymjsys=
X-Google-Smtp-Source: ABdhPJxQrmqIyoEdGAwBvg6EW9yUh/vXTcfWc6Q0cRa/d1a/exrU70dlGhePTvzfeLRNM6mxTIWJgA==
X-Received: by 2002:a17:902:8605:b029:d0:cbe1:e773 with SMTP id
 f5-20020a1709028605b02900d0cbe1e773mr27020490plo.26.1600307259038; 
 Wed, 16 Sep 2020 18:47:39 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id u2sm3883917pji.50.2020.09.16.18.47.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 16 Sep 2020 18:47:38 -0700 (PDT)
Date: Wed, 16 Sep 2020 18:44:27 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_sai: Add new added registers and new bit
 definition
Message-ID: <20200917014426.GB22566@Asurada-Nvidia>
References: <1600251387-1863-1-git-send-email-shengjiu.wang@nxp.com>
 <1600251387-1863-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600251387-1863-2-git-send-email-shengjiu.wang@nxp.com>
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
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 06:16:25PM +0800, Shengjiu Wang wrote:
> On i.MX850/i.MX815/i.MX845 platform, the sai IP is upgraded.
> There are some new registers and new bit definition. This
> patch is to complete the register list.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Change itself looks good.

Can add once fixing the commit message:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

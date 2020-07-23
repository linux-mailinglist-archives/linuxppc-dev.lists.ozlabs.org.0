Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD22522A6F8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 07:38:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC1MP61PqzDr9y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 15:38:09 +1000 (AEST)
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
 header.s=20161025 header.b=o5ZB3El9; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC1KC6GS7zDr82
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 15:36:15 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id m22so2487990pgv.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 22:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=tFcZGTVxEOvpoeXkUsiN4vBy9B3kLzwfdLU6/Bk7M20=;
 b=o5ZB3El9NmbYAUMnVLSF4MIKU/vBZ/hxFH6zt/eg3JEdcrIYxBDT5DdYf4FaDNM7tc
 HYHjiAVqeSntdb6shGkwKcnEkageOOeoE6zxzESicOczUGrZEhoT9DaQHtjx5/yB4OYY
 1OfErF+AkU8/UiZFKOriS/yecoTRi9lBcCUC/2ZIbRJXr9gJb3RmlQPOYZ41m93EV/vV
 5IpLOGY1BcxzSVSF8CQu+FUYZ9Top4dkOSr5fM3ywCobxPGrAjWg/PmOn0Kf5mKXlZJM
 +KDrpfzLSI7/vaIf0f5ZMCVlZlPjz80SNScDW+gU0Jy0JQX9zaLqvfvb7wJLkqaSg4DE
 Jotw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tFcZGTVxEOvpoeXkUsiN4vBy9B3kLzwfdLU6/Bk7M20=;
 b=KrlkXk3z3CMvdQATbD1GPVvoY6hKThsgag21PF9akEoflnmbexI1H01bZgL03R9Fbb
 DeMNm2GEAkeAOYQuczAKuuJNVmycqg0BViHJDSdpzvuY9rvLOgI1PbidIx5Nh9p3JaAv
 1NqpMO+16N2CLWBUADRpQR1n+A6VXaSBnjracyUSjPS8/X5d5tv2y1mquFfrT8u6Dvv0
 WBFHWRrhv3hB6QTKFhGkgOdnle7oOlPQmKeMoRRdEUakmIqoN77ojL4MQSHnZpm/FAxM
 e+4uhBLAbCwC9iyOwuooNX9IAzEdFXQ+3X+UpUZ63z8mI1XFPCDXNujpHR846z6uxChz
 PJ3g==
X-Gm-Message-State: AOAM531GpJBKPA/arl7ytEB+7mG7ILroKwqA6kq6uN9KmC6cI7bhY5Hq
 FvrXRuKKcLqS7WYGX4yRDSQ=
X-Google-Smtp-Source: ABdhPJwFIlyfJWb07kcj58BziwubzU5I4KohZd4uiMgJMQI1YstOLbnS44kIKgEb1P7Wi4W5qBcaaw==
X-Received: by 2002:a65:6554:: with SMTP id a20mr2447316pgw.301.1595482572334; 
 Wed, 22 Jul 2020 22:36:12 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id o128sm1414392pfg.127.2020.07.22.22.36.11
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 22 Jul 2020 22:36:11 -0700 (PDT)
Date: Wed, 22 Jul 2020 22:35:39 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: fsl-asoc-card: Support configuring dai fmt
 from DT
Message-ID: <20200723053538.GB5476@Asurada-Nvidia>
References: <1595302910-19688-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1595302910-19688-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 21, 2020 at 11:41:49AM +0800, Shengjiu Wang wrote:
> Support same propeties as simple card for configuring fmt
> from DT.
> In order to make this change compatible with old DT, these
> properties are optional.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

For both changes:
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

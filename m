Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60FB41C492F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 23:41:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GGXG0hQ3zDqMC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 07:41:50 +1000 (AEST)
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
 header.s=20161025 header.b=AynCMGGq; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GGTr3YhfzDqXs
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 07:39:44 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id z6so309077plk.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 14:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dnKlsTHwnnFXazn7zzxGnzLza7yEGHj+jI4fWn0tS74=;
 b=AynCMGGq0W5VEIeiqAdRi99uVamrPcFWpeWEkJSSFpofFC9z+cTdg2BqY7IQs4bIPZ
 GSqk0NDj1De6v3E6B8hD69oAQTlbDvt1Lx9cjx93XUcfEwcebbSsgHRMtF4qhLb0jzZX
 itI0Q8Kr1odj5D/nJN/BpvPDndUDGVSMkPUzjR5fkCIsZ0cHYIyF0GBIi0buzkkIVTYX
 vyMUc8KMOGVroi9h+Rt1Zocd5gnzZOxcPjMnShu3prz33cm7yAKqGlvhXPLfJHUQyMp3
 L/RalKi4lfErm0MP9laMKgQi1WBfOL73oLxLBoIMe2Umoj52vUyX7Fb2Vn9QenyLud+5
 JzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dnKlsTHwnnFXazn7zzxGnzLza7yEGHj+jI4fWn0tS74=;
 b=aIDLUu4chf9jZHQcc3i6L98Ao8Ez6HzuYuj8/8xxkmjSEvV+a3KoSmsGk17MAQ+vrL
 7KWM031BePSeQhRjo69D2NGt7NfapcB5DwmV+uNtRmc8MRqu5JSc8LWxxGqf0a006rNO
 pQD5koxnZjeWaeZrCRGcPI7g1HvdjCJkfxWNgsJma6tZKNz3Dlgugk3LzXySY9ErjlbM
 xrjlq5LVzmxN6yp1WIT0ttsG/IsGONFdribV0r7SSGN6tGNSmt4hRxIgqxn5IKEdfhQi
 QcHf1bMoK5raVP9gC7GicDJ5D/toamoyEZCTO8LO8w501FCivDlUoSGT/iZHvvv0DvTP
 U3Lg==
X-Gm-Message-State: AGi0PubwgA1z2HoCIATDP2ZuhelT04o/mo81YkZuqKbZd4UOMU5kJfHw
 YVE2nv5YIjYs/Y3ZD7zBoRQ=
X-Google-Smtp-Source: APiQypJ0HAeQTPu2DzaLtYV63srcvAmn2r4FeBJuSk32vuYutJBixLjLmYsfLjkggFKUUIZHiN62KQ==
X-Received: by 2002:a17:90b:3017:: with SMTP id
 hg23mr171014pjb.150.1588628381874; 
 Mon, 04 May 2020 14:39:41 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id a12sm44947pfr.28.2020.05.04.14.39.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 04 May 2020 14:39:41 -0700 (PDT)
Date: Mon, 4 May 2020 14:39:05 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/3] ASoC: fsl_esai: introduce SoC specific data
Message-ID: <20200504213905.GA21292@Asurada-Nvidia>
References: <cover.1588320655.git.shengjiu.wang@nxp.com>
 <27af074e47bf2b81e2dce67ea66a9f7301dfcb07.1588320656.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <27af074e47bf2b81e2dce67ea66a9f7301dfcb07.1588320656.git.shengjiu.wang@nxp.com>
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
 Xiubo.Lee@gmail.com, lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org,
 tiwai@suse.com, robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org,
 festevam@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 01, 2020 at 04:12:04PM +0800, Shengjiu Wang wrote:
> Introduce a SoC specific data structure which contains the
> differences between the different SoCs.
> This makes it easier to support more differences without having
> to introduce a new if/else each time.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Though the 2nd patch is having comments to address, this one
looks fine to me and should be able to merge as long as Mark
is okay with this too:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

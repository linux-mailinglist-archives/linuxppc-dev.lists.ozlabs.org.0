Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2DC212C8F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:53:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yS165pMZzDq97
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 04:53:46 +1000 (AEST)
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
 header.s=20161025 header.b=FTHnMqQ0; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yRts2H3nzDr3P
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 04:48:21 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id j12so12897330pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 11:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=4BlDCKXOS7pXvqwXxqNjKYulCrchCC2Y4PnA+71ZGS0=;
 b=FTHnMqQ0vFzPe5NX8PYMPQ/vnegWez+WHEPhh2nmxzXbfXlQP0DiIyTz4f2zcZ2BDE
 r1txHNFmzGKrYoRDQdMUEXLSdu2b82OK2owZWBiVkAf+nvXI0T2PskI7scOpG/RYtiGc
 TYn256t9fboOAJig+jJ83xksT4wXLqwRvexijyg6iw/lsPaGE+DBiXPbHHv2vgF4vX3j
 pZGLto3bgLJTcqdsG5f2k3ZvfRdWyWkVhvzii59vmIBb6cgfIehN/WERNUpReAn6sP+a
 tGc2HURUZ3SWnkXzNWO4+fXbM8SI5Z9JrozkLFZfHB8wtFSApn1bGnkIMSBxCfzACMMZ
 SqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=4BlDCKXOS7pXvqwXxqNjKYulCrchCC2Y4PnA+71ZGS0=;
 b=saEXOn7WcKyVIldyjkhqLZx/TF4a22ZJceFO4XkBTyMppDjU7LFuq5Fur72vdJCuQy
 0uqJm9JVS8TK10WVLbfsZ9jS1K7TB6vD/7i9pFE7LNTjWa/2vnrDE6P/t2LK9SmIoVzO
 upVilvlpVnzz/vDrZXQrqVwJr2NMIj1pgyuJ7CCBfzmeyw5KOOoqUvwfR6wXuHkS/6wQ
 GbGql5YloUCfIM1i50m1M7Q6UPnnki0lOzB+E545fiW86vE7FPacH4+yI2+q6ZOBRLfU
 uuHQBZyYtKdY5RHN6T4fBAmb7VS708xzuc+uAWRc5vMPcAJRbvHcVQVekolj2U7vTcwI
 2JWg==
X-Gm-Message-State: AOAM533TDgSvLhmQSOSVytix4j6xYvjKhbbqd3xALOjZ57GvizNoCIqI
 mZxwlenmlwcEHXeft2y6VQs=
X-Google-Smtp-Source: ABdhPJw0IEP+truimaQl+gRg0nVTV93ibnpqE0yESRZ/GoJYfFWTUvB0mD72OigVZjVlmaeVpGhpbQ==
X-Received: by 2002:a62:7650:: with SMTP id r77mr19282735pfc.235.1593715697849; 
 Thu, 02 Jul 2020 11:48:17 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id x7sm9884013pfp.96.2020.07.02.11.48.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:48:17 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:48:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 4/6] ASoC: fsl: fsl_spdif: fix kernel-doc
Message-ID: <20200702184812.GE23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-5-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-5-pierre-louis.bossart@linux.intel.com>
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
Cc: alsa-devel@alsa-project.org, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, tiwai@suse.de,
 "open list:FREESCALE SOC SOUND DRIVERS" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, broonie@kernel.org,
 Fabio Estevam <festevam@gmail.com>, open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 02, 2020 at 12:22:25PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. kernel-doc syntax was not followed and missing parameter
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
 
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

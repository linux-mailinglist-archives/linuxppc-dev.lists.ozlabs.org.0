Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0D9212C8B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 20:52:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yRz33dZszDqjd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 04:51:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=nEWt3ATI; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yRsz1Ws7zDqTp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 04:47:35 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id o22so7837361pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 11:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=zL1njao5U3QawtZRIy9WHRW3s8av22W5Zvsb2TW9baU=;
 b=nEWt3ATIQVLQyXkuQdvn1aiYxeRtcTjZA48sxFRfIWaLltWScvk8SuHv2VmRvSpuVT
 FSHcUHlaudUvwG06wYP6l35iSlpxk3fp/GUwCX8D1hgFuszx4mGzbibW/ggdVu5oj2rH
 LiqDGS5rNTYKOgdGa/r1Z+p3uYiYkUdQ+Y4QfiGpr9NMW5Kt09S9HID+2JZTlAkFSycb
 ZpXh6DyCVPkz36RuK0FW8QbJoQlBz3ZY1fsTlfs1OejByxVdOlW5eF4F4MBNLIYV6FdA
 Vr8NWzwEytfBRihxLiBrDQYSW/TNC31MVGV53CWTdGbLxLUE5mdw2EQREOpFwTe72m/n
 9Hog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zL1njao5U3QawtZRIy9WHRW3s8av22W5Zvsb2TW9baU=;
 b=VSrhHq4uOoMH+OJjES7NL/TsTNp1sREi4snbSWGh4ceiMi9nibsi60WUp5LvLJRAOt
 7LuJVDgKK+KminjolTWB1MfddqcSk449JgarzmrBlf0BiooDpVqk1B3sIQZdBxSmA43Q
 kodV5tkb7oC4kZR8ses8Bd/clQvRenCR0NFkzhfw/r6mQRUpkvgET2CY/kUP3yYanlIk
 PXu8YkDlNhvuN9JUlyDuu8nfPn6YslLXC6BrTw1afLxNq+qK0XbENOQ0yo0N2Pej1HeC
 3gijuOmV1+O7ORLQbTns1PiphgpPaxY+aZmUkUNDHEBY1gvDgw7vkGyZ7rpbJPyr3LmV
 vIxQ==
X-Gm-Message-State: AOAM533+Nm1G2O6EgU8bOeFqurPze/DoFZiIGdsn9w+yxT44rk8BaB79
 iZQw+SFmsis9t8RRaPVIpGs=
X-Google-Smtp-Source: ABdhPJzqWFlPtZQNtr1q8muNtABj2+NjawquW0DDONjn5yLdHttAns0cWnp1iJmb2C1ByT8ZNU3J5w==
X-Received: by 2002:a17:90a:2a09:: with SMTP id
 i9mr19383865pjd.50.1593715652929; 
 Thu, 02 Jul 2020 11:47:32 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id d65sm1575040pfc.97.2020.07.02.11.47.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 02 Jul 2020 11:47:32 -0700 (PDT)
Date: Thu, 2 Jul 2020 11:47:28 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: Re: [PATCH 3/6] ASoC: fsl: fsl-asoc-card: fix kernel-doc
Message-ID: <20200702184727.GD23935@Asurada-Nvidia>
References: <20200702172227.164474-1-pierre-louis.bossart@linux.intel.com>
 <20200702172227.164474-4-pierre-louis.bossart@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200702172227.164474-4-pierre-louis.bossart@linux.intel.com>
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

On Thu, Jul 02, 2020 at 12:22:24PM -0500, Pierre-Louis Bossart wrote:
> Fix W=1 warnings. Kernel-doc syntax was not properly used.
> 
> Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
> ---
>  sound/soc/fsl/fsl-asoc-card.c | 21 +++++++++------------
>  1 file changed, 9 insertions(+), 12 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c

>  /**
> - * Freescale Generic ASOC card private data
> + * struct fsl_asoc_card_priv - struct Freescale Generic ASOC card private data

Just a nit, can you drop the "struct" before "Freescale"?
Other parts of your changes don't really add this word.

Otherwise,
Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

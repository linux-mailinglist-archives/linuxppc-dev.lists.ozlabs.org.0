Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B2451B97D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 09:51:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kv5VB74t6z3c8T
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 17:50:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=sha@pengutronix.de;
 receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kv5Tl2VsCz2xnM
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 May 2022 17:50:33 +1000 (AEST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nmWFe-0005Nb-AM; Thu, 05 May 2022 09:50:18 +0200
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <sha@pengutronix.de>)
 id 1nmWFd-0000oa-KA; Thu, 05 May 2022 09:50:17 +0200
Date: Thu, 5 May 2022 09:50:17 +0200
From: Sascha Hauer <s.hauer@pengutronix.de>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_micfil: fix the naming style for mask definition
Message-ID: <20220505075017.GJ4012@pengutronix.de>
References: <1651736047-28809-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1651736047-28809-1-git-send-email-shengjiu.wang@nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 09:49:44 up 35 days, 20:19, 82 users,  load average: 0.27, 0.17, 0.11
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org,
 shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 05, 2022 at 03:34:07PM +0800, Shengjiu Wang wrote:
> Remove the _SHIFT for the mask definition.
> 
> Fixes: 17f2142bae4b ("ASoC: fsl_micfil: use GENMASK to define register bit fields")
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---

Acked-by: Sascha Hauer <s.hauer@pengutronix.de>

Sascha

>  sound/soc/fsl/fsl_micfil.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/fsl/fsl_micfil.h b/sound/soc/fsl/fsl_micfil.h
> index 08901827047d..053caba3caf3 100644
> --- a/sound/soc/fsl/fsl_micfil.h
> +++ b/sound/soc/fsl/fsl_micfil.h
> @@ -74,9 +74,9 @@
>  #define MICFIL_FIFO_STAT_FIFOX_UNDER(ch)	BIT((ch) + 8)
>  
>  /* MICFIL HWVAD0 Control 1 Register -- REG_MICFIL_VAD0_CTRL1*/
> -#define MICFIL_VAD0_CTRL1_CHSEL_SHIFT	GENMASK(26, 24)
> -#define MICFIL_VAD0_CTRL1_CICOSR_SHIFT	GENMASK(19, 16)
> -#define MICFIL_VAD0_CTRL1_INITT_SHIFT	GENMASK(12, 8)
> +#define MICFIL_VAD0_CTRL1_CHSEL		GENMASK(26, 24)
> +#define MICFIL_VAD0_CTRL1_CICOSR	GENMASK(19, 16)
> +#define MICFIL_VAD0_CTRL1_INITT		GENMASK(12, 8)
>  #define MICFIL_VAD0_CTRL1_ST10		BIT(4)
>  #define MICFIL_VAD0_CTRL1_ERIE		BIT(3)
>  #define MICFIL_VAD0_CTRL1_IE		BIT(2)
> @@ -106,7 +106,7 @@
>  
>  /* MICFIL HWVAD0 Zero-Crossing Detector - REG_MICFIL_VAD0_ZCD */
>  #define MICFIL_VAD0_ZCD_ZCDTH		GENMASK(25, 16)
> -#define MICFIL_VAD0_ZCD_ZCDADJ_SHIFT	GENMASK(11, 8)
> +#define MICFIL_VAD0_ZCD_ZCDADJ		GENMASK(11, 8)
>  #define MICFIL_VAD0_ZCD_ZCDAND		BIT(4)
>  #define MICFIL_VAD0_ZCD_ZCDAUT		BIT(2)
>  #define MICFIL_VAD0_ZCD_ZCDEN		BIT(0)
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

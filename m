Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 151716ADE44
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 13:03:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWDc01SPHz3cMN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 23:03:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RLWayBHY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=8430349259=ckeepax@opensource.cirrus.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=RLWayBHY;
	dkim-atps=neutral
X-Greylist: delayed 1896 seconds by postgrey-1.36 at boromir; Tue, 07 Mar 2023 23:02:24 AEDT
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWDb40VX8z3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 23:02:22 +1100 (AEDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3277tv94022730;
	Tue, 7 Mar 2023 05:30:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=PODMain02222019;
 bh=8Gw+hMjGj1I9H2fg3ljNbnH8D9RaMuxw0VHL6fBZJv4=;
 b=RLWayBHYAC3WRv9HPpNTERg+r3oTqRoc1PhTaiH7YBIi+g27pmBKE71aOiAvS27S3N07
 +QHcy5hOfjEbFGHVcXXvt9qIN3WGOS3Bqlri7NiCAQhOhMOgUcVD/jtynzPS4OAO8V4x
 y0soTVGFyQ8h0rjtQN8pahOoaJaEwQF+b1XRYG7PlC2fH/BI33BVKPohDXEuq+sfwinQ
 st9ocuKEdqcae/7gnnLT1gkEC3NHxNf2+QnaoIAl+yku5tDVskg+wvMD2woy7I197Y8b
 atlA+qMh5usVUKVHiqBqRp3egA8oAV2JdrRPRQRVEwGGY4zU2uz2Qv/12AeFgHJufFHL 1A== 
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3p4497427y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Mar 2023 05:30:19 -0600
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.25; Tue, 7 Mar
 2023 05:30:16 -0600
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 05:30:16 -0600
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id C72ED11D3;
	Tue,  7 Mar 2023 11:30:16 +0000 (UTC)
Date: Tue, 7 Mar 2023 11:30:16 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
Message-ID: <20230307113016.GS68926@ediswmail.ad.cirrus.com>
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: 8AhJH_Etb0kWl8-U4QDOKiyr044l28y7
X-Proofpoint-ORIG-GUID: 8AhJH_Etb0kWl8-U4QDOKiyr044l28y7
X-Proofpoint-Spam-Reason: safe
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
Cc: daniel.baluta@nxp.com, cezary.rojewski@intel.com, tanureal@opensource.cirrus.com, Xiubo.Lee@gmail.com, alsa-devel@alsa-project.org, lgirdwood@gmail.com, linux-tegra@vger.kernel.org, thierry.reding@gmail.com, srinivas.kandagatla@linaro.org, festevam@gmail.com, sound-open-firmware@alsa-project.org, shengjiu.wang@gmail.com, linux-omap@vger.kernel.org, yung-chuan.liao@linux.intel.com, ranjani.sridharan@linux.intel.com, pierre-louis.bossart@linux.intel.com, jonathanh@nvidia.com, linux-imx@nxp.com, bgoswami@quicinc.com, s.hauer@pengutronix.de, linuxppc-dev@lists.ozlabs.org, james.schulman@cirrus.com, nicoleotsuka@gmail.com, rf@opensource.cirrus.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, perex@perex.cz, peter.ujfalusi@linux.intel.com, linux-arm-kernel@lists.infradead.org, oder_chiou@realtek.com, kai.vehmanen@linux.intel.com, patches@opensource.cirrus.com, david.rhodes@cirrus.com, tiwai@suse.com, linux-kernel@vger.kernel.org, vkoul@kernel.org, ke
 rnel@pengutronix.de, shawnguo@kernel.org, jarkko.nikula@bitmer.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 07, 2023 at 12:30:22PM +0200, Claudiu Beznea wrote:
> Do not include pm_runtime.h header in files where runtime PM support is
> not implemented.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
>  sound/soc/codecs/cs35l45.h                                | 1 -
> diff --git a/sound/soc/codecs/cs35l45.h b/sound/soc/codecs/cs35l45.h
> index 53fe9d2b7b15..0555702eac03 100644
> --- a/sound/soc/codecs/cs35l45.h
> +++ b/sound/soc/codecs/cs35l45.h
> @@ -11,7 +11,6 @@
>  #ifndef CS35L45_H
>  #define CS35L45_H
>  
> -#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/regulator/consumer.h>
>  

cs35l45 does already make use of some functions from that header,
and more support is in the process of being upstreamed. So this
part should be dropped.

Thanks,
Charles

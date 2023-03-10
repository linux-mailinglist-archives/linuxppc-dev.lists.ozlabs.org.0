Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 22FDD6B3745
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 08:26:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PXyK808Vhz3f3h
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Mar 2023 18:26:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bitmer.com (client-ip=185.179.237.49; helo=bitmer.com; envelope-from=jarkko.nikula@bitmer.com; receiver=<UNKNOWN>)
X-Greylist: delayed 1097 seconds by postgrey-1.36 at boromir; Fri, 10 Mar 2023 18:25:49 AEDT
Received: from bitmer.com (server-237-49.tentacle.cloud [185.179.237.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PXyJY61tNz3cMT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Mar 2023 18:25:49 +1100 (AEDT)
Received: from jarkko by bitmer.com with local (Exim 4.92)
	(envelope-from <jarkko.nikula@bitmer.com>)
	id 1paWpw-0003gh-Gf; Fri, 10 Mar 2023 09:06:44 +0200
Date: Fri, 10 Mar 2023 09:06:44 +0200
From: Jarkko Nikula <jarkko.nikula@bitmer.com>
To: Claudiu Beznea <claudiu.beznea@microchip.com>
Subject: Re: [PATCH] ASoC: do not include pm_runtime.h if not used
Message-ID: <20230310070644.GA13582@bitmer.com>
References: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230307103022.1007420-1-claudiu.beznea@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 rnel@pengutronix.de, shawnguo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 07, 2023 at 12:30:22PM +0200, Claudiu Beznea wrote:
> Do not include pm_runtime.h header in files where runtime PM support is
> not implemented.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
> ---
...
>  sound/soc/ti/omap-mcbsp-st.c                              | 1 -
>  36 files changed, 37 deletions(-)

Looks like header was copied by accident from omap-mcbsp.c when sidetone
functionality was split into this new file.

Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com>

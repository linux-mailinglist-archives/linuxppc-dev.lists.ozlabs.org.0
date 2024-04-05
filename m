Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D17899C05
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 13:41:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=ZcrcoLqs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9xQC0JMfz3vbF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 22:41:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.a=rsa-sha256 header.s=1 header.b=ZcrcoLqs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rere.qmqm.pl (client-ip=91.227.64.183; helo=rere.qmqm.pl; envelope-from=mirq-linux@rere.qmqm.pl; receiver=lists.ozlabs.org)
X-Greylist: delayed 555 seconds by postgrey-1.37 at boromir; Fri, 05 Apr 2024 20:38:50 AEDT
Received: from rere.qmqm.pl (rere.qmqm.pl [91.227.64.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9tj60Sskz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 20:38:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
	t=1712309337; bh=gui0f6MViE5zSAEEOcDKHdPoDszSctiaYWprNP7GSNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZcrcoLqsz/zzlMruWf44PYk75DueBejOUyr1Eh31EyaZcoY7ODel3t0vFK51sQutC
	 YY7dBqw6x5FiEghmAZFtz/zTJMGq5GtkEocuVfbQcN9BDPuRIei5HZ4DdjLpHxZ7+6
	 E7lgHaOaQ5/+P2XOh5i4UPTyYivuDu5pF+wIovDfOhmC0jyS7Po0jdQpgN6Tw+kWcU
	 BR21bYeWeQT2EX7dHW/mtmIf4RbdkqX5exTxh2367mA4o2zBmZSc7BFV4XrNkiEptZ
	 Q5SBD2Ru9xBFkYUfXpcQGRwkKRKwaEBGta6Gar0WuqKpV+3lBKaNoDOSXQIouXFRPP
	 Bq/roRR1X1cQQ==
Received: from remote.user (localhost [127.0.0.1])
	by rere.qmqm.pl (Postfix) with ESMTPSA id 4V9tTX48kvz8B;
	Fri,  5 Apr 2024 11:28:48 +0200 (CEST)
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 1.0.3 at mail
Date: Fri, 5 Apr 2024 11:28:47 +0200
From: =?iso-8859-2?Q?Micha=B3_Miros=B3aw?= <mirq-linux@rere.qmqm.pl>
To: Allen Pais <apais@linux.microsoft.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
Message-ID: <Zg_ET2XmZM_Id_Ad@qmqm.qmqm.pl>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-2
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240327160314.9982-10-apais@linux.microsoft.com>
X-Mailman-Approved-At: Fri, 05 Apr 2024 22:40:31 +1100
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.ke
 rnel.org, Eugeniy.Paltsev@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, brucechang@via.com.tw, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.kernel.o
 rg, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 04:03:14PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
[...]
>  drivers/mmc/host/cb710-mmc.c                  | 15 ++--
>  drivers/mmc/host/cb710-mmc.h                  |  3 +-
[...]

Acked-by: Micha³ Miros³aw <mirq-linux@rere.qmqm.pl>

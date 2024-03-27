Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 211F288F0BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:18:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=vSMCQaVH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4ffY6Flhz3w6w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:18:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256 header.s=smtp-20201208 header.b=vSMCQaVH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=free.fr (client-ip=212.27.42.5; helo=smtp5-g21.free.fr; envelope-from=duncan.sands@free.fr; receiver=lists.ozlabs.org)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4X4l45Tgz3vYn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 03:22:13 +1100 (AEDT)
Received: from [IPV6:2a01:e0a:255:1000:f49a:79c4:c3c6:eaf3] (unknown [IPv6:2a01:e0a:255:1000:f49a:79c4:c3c6:eaf3])
	(Authenticated sender: duncan.sands@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id A3A9F60142;
	Wed, 27 Mar 2024 17:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1711556526;
	bh=g9NIYWY7Zqq4Jpe3GVuphoABvUpR98WMNlTO/PqC+cM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vSMCQaVHDvOS+MJTVx5PjO8YOXxmIEoXqqAuvBYuRC535uirpZWCAg3Zcduu9rDtt
	 KXKCxUyreW9ES5/mQaKWuQmfTpoSpYf8IwCcPc988GMFZvS+1wbAKCcOjbSk3mXiD9
	 ZK8Hamum4SVmsMBE1c9pxQwBG+dsyo12O4SxF8j/IiVpKDUrPYQJdtKDuV/HWRo3xL
	 PYIWjDHKv6Iwt5jWnepwy1J7Y+fjiF4JTHXVaKfZ4ukUUftUNKj+3Aem3Jcxh8PUFu
	 tZQKCHeE4q+71+QXSA4TwBR2eiNJVHnD/WyXCPKNPqsgcwl7VuDNvLoWg/63fz6oE5
	 pvkLMrw2O9NMA==
Message-ID: <7297be25-a3c8-4e8b-9a80-ff720ccddc90@free.fr>
Date: Wed, 27 Mar 2024 17:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
To: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com>
Content-Language: en-GB
From: Duncan Sands <duncan.sands@free.fr>
In-Reply-To: <20240327160314.9982-5-apais@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 28 Mar 2024 08:10:21 +1100
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev@synopsys.com, patrice.ch
 otard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-mips@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.kernel.org, shawnguo@kernel.org, af
 aerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Allen, the usbatm bits look very reasonable to me.  Unfortunately I don't 
have the hardware to test any more.  Still, for what it's worth:

Signed-off-by: Duncan Sands <duncan.sands@free.fr>

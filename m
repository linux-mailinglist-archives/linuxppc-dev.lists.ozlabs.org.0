Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C580188F0C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:19:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=O9UtOMh9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4fgL45Crz3w9C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:19:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=O9UtOMh9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4XqN3M9yz3fQH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 03:55:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 72A43CE2707;
	Wed, 27 Mar 2024 16:55:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ABDBC433C7;
	Wed, 27 Mar 2024 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711558535;
	bh=vpDkfUBtWL+UxBwjuUm5gYeL/cEacWfXEPKG81vcE0M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9UtOMh9NhK8uq0mZiMXt2LKgdT1qaV4eqkqQ4OpNjzEIBfNH8AxnSa5LKMbuNnuj
	 139SwlhRdsUzFtHFa7nm692D1Q6Maoi8Dc8aCzxaDG36oyEKDDYttLwvcqzFnSbA0P
	 DJD28wQMsDmrT4Kh7AowzV2l5JSL5uf6ZAH6m6jc=
Date: Wed, 27 Mar 2024 17:55:31 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Allen Pais <apais@linux.microsoft.com>
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
Message-ID: <2024032753-probable-blatancy-80bf@gregkh>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327160314.9982-5-apais@linux.microsoft.com>
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.ke
 rnel.org, Eugeniy.Paltsev@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.lauss@gmail.com, 
 linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024 at 04:03:09PM +0000, Allen Pais wrote:
> The only generic interface to execute asynchronously in the BH context is
> tasklet; however, it's marked deprecated and has some design flaws. To
> replace tasklets, BH workqueue support was recently added. A BH workqueue
> behaves similarly to regular workqueues except that the queued work items
> are executed in the BH context.
> 
> This patch converts drivers/infiniband/* from tasklet to BH workqueue.

No it does not, I think your changelog is wrong :(

> 
> Based on the work done by Tejun Heo <tj@kernel.org>
> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10
> 
> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> ---
>  drivers/usb/atm/usbatm.c            | 55 +++++++++++++++--------------
>  drivers/usb/atm/usbatm.h            |  3 +-
>  drivers/usb/core/hcd.c              | 22 ++++++------
>  drivers/usb/gadget/udc/fsl_qe_udc.c | 21 +++++------
>  drivers/usb/gadget/udc/fsl_qe_udc.h |  4 +--
>  drivers/usb/host/ehci-sched.c       |  2 +-
>  drivers/usb/host/fhci-hcd.c         |  3 +-
>  drivers/usb/host/fhci-sched.c       | 10 +++---
>  drivers/usb/host/fhci.h             |  5 +--
>  drivers/usb/host/xhci-dbgcap.h      |  3 +-
>  drivers/usb/host/xhci-dbgtty.c      | 15 ++++----
>  include/linux/usb/cdc_ncm.h         |  2 +-
>  include/linux/usb/usbnet.h          |  2 +-
>  13 files changed, 76 insertions(+), 71 deletions(-)
> 
> diff --git a/drivers/usb/atm/usbatm.c b/drivers/usb/atm/usbatm.c
> index 2da6615fbb6f..74849f24e52e 100644
> --- a/drivers/usb/atm/usbatm.c
> +++ b/drivers/usb/atm/usbatm.c
> @@ -17,7 +17,7 @@
>   *  		- Removed the limit on the number of devices
>   *  		- Module now autoloads on device plugin
>   *  		- Merged relevant parts of sarlib
> - *  		- Replaced the kernel thread with a tasklet
> + *  		- Replaced the kernel thread with a work

a "work"?

>   *  		- New packet transmission code
>   *  		- Changed proc file contents
>   *  		- Fixed all known SMP races
> @@ -68,6 +68,7 @@
>  #include <linux/wait.h>
>  #include <linux/kthread.h>
>  #include <linux/ratelimit.h>
> +#include <linux/workqueue.h>
>  
>  #ifdef VERBOSE_DEBUG
>  static int usbatm_print_packet(struct usbatm_data *instance, const unsigned char *data, int len);
> @@ -249,7 +250,7 @@ static void usbatm_complete(struct urb *urb)
>  	/* vdbg("%s: urb 0x%p, status %d, actual_length %d",
>  	     __func__, urb, status, urb->actual_length); */
>  
> -	/* Can be invoked from task context, protect against interrupts */
> +	/* Can be invoked from work context, protect against interrupts */

"workqueue"?  This too seems wrong.

Same for other comment changes in this patch.

thanks,

greg k-h

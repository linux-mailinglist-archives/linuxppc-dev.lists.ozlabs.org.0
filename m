Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 049138B1763
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 01:47:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=ciSw7ETa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPwdG61J6z3dRj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Apr 2024 09:47:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=ciSw7ETa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VPlM76pdDz3cFw
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Apr 2024 02:49:23 +1000 (AEST)
Received: from smtpclient.apple (d66-183-91-182.bchsia.telus.net [66.183.91.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 995C3210DEAF;
	Wed, 24 Apr 2024 09:48:50 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 995C3210DEAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1713977332;
	bh=ksvEFN4skua8jbUiYLns9bHtKk/4wlRJ+9aDRVo11t0=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=ciSw7ETabS09FzB+vGI71vmglWivC+oa0cVPt+dd7Ss0SZ0HwcyxZuoiQNcNF5q63
	 OU2Zc9ReY3eu79e9oV3MgK0cJNYFO81GC/JgqkwsQSP1lBPHUmLKsrrY/5zP4NZf0t
	 VIf6IyFitxO7pk98vq37Kg2gLGbiD7QpB6ZXnzWA=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: [PATCH 8/9] drivers/media/*: Convert from tasklet to BH workqueue
From: Allen Pais <apais@linux.microsoft.com>
In-Reply-To: <ac2ce98f-8433-4871-a3eb-46e84545682c@xs4all.nl>
Date: Wed, 24 Apr 2024 09:48:38 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <17140C44-9803-4556-B216-12D1ECF30432@linux.microsoft.com>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-9-apais@linux.microsoft.com>
 <ac2ce98f-8433-4871-a3eb-46e84545682c@xs4all.nl>
To: Hans Verkuil <hverkuil@xs4all.nl>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Mailman-Approved-At: Thu, 25 Apr 2024 09:45:48 +1000
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, Linus Walleij <linus.walleij@linaro.org>, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, Robert Jarzmik <robert.jarzmik@free.fr>, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, jassisinghbrar@gmail.com, decui@microsoft.com, Zhou Wang <wangzhou1@hisilicon.com>, =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, jh80.chung@samsung.com, zw@zh-kernel.org, Chen-Yu Tsai <wens@c
 sie.org>, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, pierre@ossman.eu, linux-mips@vger.kernel.org, Eugeniy.Paltsev@synopsys.com, Patrice CHOTARD <patrice.chotard@foss.st.com>, asahi@lists.linux.dev, brucechang@via.com.tw, Kees Cook <keescook@chromium.org>, oakad@yahoo.com, sven@svenpeter.dev, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@gmail.com>, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, Matthias Brugger <matthias.bgg@gmail.com>, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, Scott Branden <sbranden@broadcom.com>, Logan Gunthorpe <logang@deltatee.com>, andersson@kernel.org, 
 marcan@marcan.st, haiyangz@microsoft.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, Vinod Koul <vkoul@kernel.org>, linux-s390@vger.kernel.org, mhiramat@kernel.org, Lyra Zhang <zhang.lyra@gmail.com>, Tejun Heo <tj@kernel.org>, manuel.lauss@gmail.com, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Apr 24, 2024, at 2:12=E2=80=AFAM, Hans Verkuil <hverkuil@xs4all.nl> =
wrote:
>=20
> On 27/03/2024 17:03, Allen Pais wrote:
>> The only generic interface to execute asynchronously in the BH =
context is
>> tasklet; however, it's marked deprecated and has some design flaws. =
To
>> replace tasklets, BH workqueue support was recently added. A BH =
workqueue
>> behaves similarly to regular workqueues except that the queued work =
items
>> are executed in the BH context.
>>=20
>> This patch converts drivers/media/* from tasklet to BH workqueue.
>>=20
>> Based on the work done by Tejun Heo <tj@kernel.org>
>> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git =
for-6.10
>>=20
>> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
>> ---
>> drivers/media/pci/bt8xx/bt878.c               |  8 ++--
>> drivers/media/pci/bt8xx/bt878.h               |  3 +-
>> drivers/media/pci/bt8xx/dvb-bt8xx.c           |  9 ++--
>> drivers/media/pci/ddbridge/ddbridge.h         |  3 +-
>> drivers/media/pci/mantis/hopper_cards.c       |  2 +-
>> drivers/media/pci/mantis/mantis_cards.c       |  2 +-
>> drivers/media/pci/mantis/mantis_common.h      |  3 +-
>> drivers/media/pci/mantis/mantis_dma.c         |  5 ++-
>> drivers/media/pci/mantis/mantis_dma.h         |  2 +-
>> drivers/media/pci/mantis/mantis_dvb.c         | 12 +++---
>> drivers/media/pci/ngene/ngene-core.c          | 23 ++++++-----
>> drivers/media/pci/ngene/ngene.h               |  5 ++-
>> drivers/media/pci/smipcie/smipcie-main.c      | 18 ++++----
>> drivers/media/pci/smipcie/smipcie.h           |  3 +-
>> drivers/media/pci/ttpci/budget-av.c           |  3 +-
>> drivers/media/pci/ttpci/budget-ci.c           | 27 ++++++------
>> drivers/media/pci/ttpci/budget-core.c         | 10 ++---
>> drivers/media/pci/ttpci/budget.h              |  5 ++-
>> drivers/media/pci/tw5864/tw5864-core.c        |  2 +-
>> drivers/media/pci/tw5864/tw5864-video.c       | 13 +++---
>> drivers/media/pci/tw5864/tw5864.h             |  7 ++--
>> drivers/media/platform/intel/pxa_camera.c     | 15 +++----
>> drivers/media/platform/marvell/mcam-core.c    | 11 ++---
>> drivers/media/platform/marvell/mcam-core.h    |  3 +-
>> .../st/sti/c8sectpfe/c8sectpfe-core.c         | 15 +++----
>> .../st/sti/c8sectpfe/c8sectpfe-core.h         |  2 +-
>> drivers/media/radio/wl128x/fmdrv.h            |  7 ++--
>> drivers/media/radio/wl128x/fmdrv_common.c     | 41 =
++++++++++---------
>> drivers/media/rc/mceusb.c                     |  2 +-
>> drivers/media/usb/ttusb-dec/ttusb_dec.c       | 21 +++++-----
>> 30 files changed, 151 insertions(+), 131 deletions(-)
>>=20
>> diff --git a/drivers/media/pci/bt8xx/bt878.c =
b/drivers/media/pci/bt8xx/bt878.c
>> index 90972d6952f1..983ec29108f0 100644
>> --- a/drivers/media/pci/bt8xx/bt878.c
>> +++ b/drivers/media/pci/bt8xx/bt878.c
>> @@ -300,8 +300,8 @@ static irqreturn_t bt878_irq(int irq, void =
*dev_id)
>> 		}
>> 		if (astat & BT878_ARISCI) {
>> 			bt->finished_block =3D (stat & BT878_ARISCS) >> =
28;
>> -			if (bt->tasklet.callback)
>> -				tasklet_schedule(&bt->tasklet);
>> +			if (bt->work.func)
>> +				queue_work(system_bh_wq,
>=20
> I stopped reviewing here: this clearly has not been compile tested.
>=20
> Also please check the patch with 'checkpatch.pl --strict' and fix the =
reported issues.
>=20
> Regards,
>=20
> 	Hans

 Hans,

   Thanks for taking the time out to review. This was a mistake, I sent =
out a v2 which had
This fixed. I am working on v3 based on some of the comments I received  =
recently. Will
Appreciate your review when it is sent out.

Allen

>=20
>> 			break;
>> 		}
>> 		count++;
>> @@ -478,8 +478,8 @@ static int bt878_probe(struct pci_dev *dev, const =
struct pci_device_id *pci_id)
>> 	btwrite(0, BT878_AINT_MASK);
>> 	bt878_num++;
>>=20
>> -	if (!bt->tasklet.func)
>> -		tasklet_disable(&bt->tasklet);
>> +	if (!bt->work.func)
>> +		disable_work_sync(&bt->work);
>>=20
>> 	return 0;
>>=20
>> diff --git a/drivers/media/pci/bt8xx/bt878.h =
b/drivers/media/pci/bt8xx/bt878.h
>> index fde8db293c54..b9ce78e5116b 100644
>> --- a/drivers/media/pci/bt8xx/bt878.h
>> +++ b/drivers/media/pci/bt8xx/bt878.h
>> @@ -14,6 +14,7 @@
>> #include <linux/sched.h>
>> #include <linux/spinlock.h>
>> #include <linux/mutex.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include "bt848.h"
>> #include "bttv.h"
>> @@ -120,7 +121,7 @@ struct bt878 {
>> 	dma_addr_t risc_dma;
>> 	u32 risc_pos;
>>=20
>> -	struct tasklet_struct tasklet;
>> +	struct work_struct work;
>> 	int shutdown;
>> };
>>=20
>> diff --git a/drivers/media/pci/bt8xx/dvb-bt8xx.c =
b/drivers/media/pci/bt8xx/dvb-bt8xx.c
>> index 390cbba6c065..8c0e1fa764a4 100644
>> --- a/drivers/media/pci/bt8xx/dvb-bt8xx.c
>> +++ b/drivers/media/pci/bt8xx/dvb-bt8xx.c
>> @@ -15,6 +15,7 @@
>> #include <linux/delay.h>
>> #include <linux/slab.h>
>> #include <linux/i2c.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include <media/dmxdev.h>
>> #include <media/dvbdev.h>
>> @@ -39,9 +40,9 @@ DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>>=20
>> #define IF_FREQUENCYx6 217    /* 6 * 36.16666666667MHz */
>>=20
>> -static void dvb_bt8xx_task(struct tasklet_struct *t)
>> +static void dvb_bt8xx_task(struct work_struct *t)
>> {
>> -	struct bt878 *bt =3D from_tasklet(bt, t, tasklet);
>> +	struct bt878 *bt =3D from_work(bt, t, work);
>> 	struct dvb_bt8xx_card *card =3D =
dev_get_drvdata(&bt->adapter->dev);
>>=20
>> 	dprintk("%d\n", card->bt->finished_block);
>> @@ -782,7 +783,7 @@ static int dvb_bt8xx_load_card(struct =
dvb_bt8xx_card *card, u32 type)
>> 		goto err_disconnect_frontend;
>> 	}
>>=20
>> -	tasklet_setup(&card->bt->tasklet, dvb_bt8xx_task);
>> +	INIT_WORK(&card->bt->work, dvb_bt8xx_task);
>>=20
>> 	frontend_init(card, type);
>>=20
>> @@ -922,7 +923,7 @@ static void dvb_bt8xx_remove(struct =
bttv_sub_device *sub)
>> 	dprintk("dvb_bt8xx: unloading card%d\n", card->bttv_nr);
>>=20
>> 	bt878_stop(card->bt);
>> -	tasklet_kill(&card->bt->tasklet);
>> +	cancel_work_sync(&card->bt->work);
>> 	dvb_net_release(&card->dvbnet);
>> 	card->demux.dmx.remove_frontend(&card->demux.dmx, =
&card->fe_mem);
>> 	card->demux.dmx.remove_frontend(&card->demux.dmx, &card->fe_hw);
>> diff --git a/drivers/media/pci/ddbridge/ddbridge.h =
b/drivers/media/pci/ddbridge/ddbridge.h
>> index f3699dbd193f..037d1d13ef0f 100644
>> --- a/drivers/media/pci/ddbridge/ddbridge.h
>> +++ b/drivers/media/pci/ddbridge/ddbridge.h
>> @@ -35,6 +35,7 @@
>> #include <linux/uaccess.h>
>> #include <linux/vmalloc.h>
>> #include <linux/workqueue.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include <asm/dma.h>
>> #include <asm/irq.h>
>> @@ -298,7 +299,7 @@ struct ddb_link {
>> 	spinlock_t             lock; /* lock link access */
>> 	struct mutex           flash_mutex; /* lock flash access */
>> 	struct ddb_lnb         lnb;
>> -	struct tasklet_struct  tasklet;
>> +	struct work_struct work;
>> 	struct ddb_ids         ids;
>>=20
>> 	spinlock_t             temp_lock; /* lock temp chip access */
>> diff --git a/drivers/media/pci/mantis/hopper_cards.c =
b/drivers/media/pci/mantis/hopper_cards.c
>> index c0bd5d7e148b..869ea88c4893 100644
>> --- a/drivers/media/pci/mantis/hopper_cards.c
>> +++ b/drivers/media/pci/mantis/hopper_cards.c
>> @@ -116,7 +116,7 @@ static irqreturn_t hopper_irq_handler(int irq, =
void *dev_id)
>> 	if (stat & MANTIS_INT_RISCI) {
>> 		dprintk(MANTIS_DEBUG, 0, "<%s>", label[8]);
>> 		mantis->busy_block =3D (stat & MANTIS_INT_RISCSTAT) >> =
28;
>> -		tasklet_schedule(&mantis->tasklet);
>> +		queue_work(system_bh_wq, &mantis->work);
>> 	}
>> 	if (stat & MANTIS_INT_I2CDONE) {
>> 		dprintk(MANTIS_DEBUG, 0, "<%s>", label[9]);
>> diff --git a/drivers/media/pci/mantis/mantis_cards.c =
b/drivers/media/pci/mantis/mantis_cards.c
>> index 906e4500d87d..cb124b19e36e 100644
>> --- a/drivers/media/pci/mantis/mantis_cards.c
>> +++ b/drivers/media/pci/mantis/mantis_cards.c
>> @@ -125,7 +125,7 @@ static irqreturn_t mantis_irq_handler(int irq, =
void *dev_id)
>> 	if (stat & MANTIS_INT_RISCI) {
>> 		dprintk(MANTIS_DEBUG, 0, "<%s>", label[8]);
>> 		mantis->busy_block =3D (stat & MANTIS_INT_RISCSTAT) >> =
28;
>> -		tasklet_schedule(&mantis->tasklet);
>> +		queue_work(system_bh_wq, &mantis->work);
>> 	}
>> 	if (stat & MANTIS_INT_I2CDONE) {
>> 		dprintk(MANTIS_DEBUG, 0, "<%s>", label[9]);
>> diff --git a/drivers/media/pci/mantis/mantis_common.h =
b/drivers/media/pci/mantis/mantis_common.h
>> index d88ac280226c..f2247148f268 100644
>> --- a/drivers/media/pci/mantis/mantis_common.h
>> +++ b/drivers/media/pci/mantis/mantis_common.h
>> @@ -12,6 +12,7 @@
>> #include <linux/interrupt.h>
>> #include <linux/mutex.h>
>> #include <linux/workqueue.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include "mantis_reg.h"
>> #include "mantis_uart.h"
>> @@ -125,7 +126,7 @@ struct mantis_pci {
>> 	__le32			*risc_cpu;
>> 	dma_addr_t		risc_dma;
>>=20
>> -	struct tasklet_struct	tasklet;
>> +	struct work_struct 	work;
>> 	spinlock_t		intmask_lock;
>>=20
>> 	struct i2c_adapter	adapter;
>> diff --git a/drivers/media/pci/mantis/mantis_dma.c =
b/drivers/media/pci/mantis/mantis_dma.c
>> index 80c843936493..c85f9b84a2c6 100644
>> --- a/drivers/media/pci/mantis/mantis_dma.c
>> +++ b/drivers/media/pci/mantis/mantis_dma.c
>> @@ -15,6 +15,7 @@
>> #include <linux/signal.h>
>> #include <linux/sched.h>
>> #include <linux/interrupt.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include <media/dmxdev.h>
>> #include <media/dvbdev.h>
>> @@ -200,9 +201,9 @@ void mantis_dma_stop(struct mantis_pci *mantis)
>> }
>>=20
>>=20
>> -void mantis_dma_xfer(struct tasklet_struct *t)
>> +void mantis_dma_xfer(struct work_struct *t)
>> {
>> -	struct mantis_pci *mantis =3D from_tasklet(mantis, t, tasklet);
>> +	struct mantis_pci *mantis =3D from_work(mantis, t, work);
>> 	struct mantis_hwconfig *config =3D mantis->hwconfig;
>>=20
>> 	while (mantis->last_block !=3D mantis->busy_block) {
>> diff --git a/drivers/media/pci/mantis/mantis_dma.h =
b/drivers/media/pci/mantis/mantis_dma.h
>> index 37da982c9c29..5db0d3728f15 100644
>> --- a/drivers/media/pci/mantis/mantis_dma.h
>> +++ b/drivers/media/pci/mantis/mantis_dma.h
>> @@ -13,6 +13,6 @@ extern int mantis_dma_init(struct mantis_pci =
*mantis);
>> extern int mantis_dma_exit(struct mantis_pci *mantis);
>> extern void mantis_dma_start(struct mantis_pci *mantis);
>> extern void mantis_dma_stop(struct mantis_pci *mantis);
>> -extern void mantis_dma_xfer(struct tasklet_struct *t);
>> +extern void mantis_dma_xfer(struct work_struct *t);
>>=20
>> #endif /* __MANTIS_DMA_H */
>> diff --git a/drivers/media/pci/mantis/mantis_dvb.c =
b/drivers/media/pci/mantis/mantis_dvb.c
>> index c7ba4a76e608..f640635de170 100644
>> --- a/drivers/media/pci/mantis/mantis_dvb.c
>> +++ b/drivers/media/pci/mantis/mantis_dvb.c
>> @@ -105,7 +105,7 @@ static int mantis_dvb_start_feed(struct =
dvb_demux_feed *dvbdmxfeed)
>> 	if (mantis->feeds =3D=3D 1)	 {
>> 		dprintk(MANTIS_DEBUG, 1, "mantis start feed & dma");
>> 		mantis_dma_start(mantis);
>> -		tasklet_enable(&mantis->tasklet);
>> +		enable_and_queue_work(system_bh_wq, &mantis->work);
>> 	}
>>=20
>> 	return mantis->feeds;
>> @@ -125,7 +125,7 @@ static int mantis_dvb_stop_feed(struct =
dvb_demux_feed *dvbdmxfeed)
>> 	mantis->feeds--;
>> 	if (mantis->feeds =3D=3D 0) {
>> 		dprintk(MANTIS_DEBUG, 1, "mantis stop feed and dma");
>> -		tasklet_disable(&mantis->tasklet);
>> +		disable_work_sync(&mantis->work);
>> 		mantis_dma_stop(mantis);
>> 	}
>>=20
>> @@ -205,8 +205,8 @@ int mantis_dvb_init(struct mantis_pci *mantis)
>> 	}
>>=20
>> 	dvb_net_init(&mantis->dvb_adapter, &mantis->dvbnet, =
&mantis->demux.dmx);
>> -	tasklet_setup(&mantis->tasklet, mantis_dma_xfer);
>> -	tasklet_disable(&mantis->tasklet);
>> +	INIT_WORK(&mantis->bh, mantis_dma_xfer);
>> +	disable_work_sync(&mantis->work);
>> 	if (mantis->hwconfig) {
>> 		result =3D config->frontend_init(mantis, mantis->fe);
>> 		if (result < 0) {
>> @@ -235,7 +235,7 @@ int mantis_dvb_init(struct mantis_pci *mantis)
>>=20
>> 	/* Error conditions ..	*/
>> err5:
>> -	tasklet_kill(&mantis->tasklet);
>> +	cancel_work_sync(&mantis->work);
>> 	dvb_net_release(&mantis->dvbnet);
>> 	if (mantis->fe) {
>> 		dvb_unregister_frontend(mantis->fe);
>> @@ -273,7 +273,7 @@ int mantis_dvb_exit(struct mantis_pci *mantis)
>> 		dvb_frontend_detach(mantis->fe);
>> 	}
>>=20
>> -	tasklet_kill(&mantis->tasklet);
>> +	cancel_work_sync(&mantis->work);
>> 	dvb_net_release(&mantis->dvbnet);
>>=20
>> 	mantis->demux.dmx.remove_frontend(&mantis->demux.dmx, =
&mantis->fe_mem);
>> diff --git a/drivers/media/pci/ngene/ngene-core.c =
b/drivers/media/pci/ngene/ngene-core.c
>> index 7481f553f959..5211d6796748 100644
>> --- a/drivers/media/pci/ngene/ngene-core.c
>> +++ b/drivers/media/pci/ngene/ngene-core.c
>> @@ -21,6 +21,7 @@
>> #include <linux/byteorder/generic.h>
>> #include <linux/firmware.h>
>> #include <linux/vmalloc.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include "ngene.h"
>>=20
>> @@ -50,9 +51,9 @@ DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>> /* nGene interrupt handler =
**************************************************/
>> =
/*************************************************************************=
***/
>>=20
>> -static void event_tasklet(struct tasklet_struct *t)
>> +static void event_work(struct work_struct *t)
>> {
>> -	struct ngene *dev =3D from_tasklet(dev, t, event_tasklet);
>> +	struct ngene *dev =3D from_work(dev, t, event_work);
>>=20
>> 	while (dev->EventQueueReadIndex !=3D dev->EventQueueWriteIndex) =
{
>> 		struct EVENT_BUFFER Event =3D
>> @@ -68,9 +69,9 @@ static void event_tasklet(struct tasklet_struct *t)
>> 	}
>> }
>>=20
>> -static void demux_tasklet(struct tasklet_struct *t)
>> +static void demux_work(struct work_struct *t)
>> {
>> -	struct ngene_channel *chan =3D from_tasklet(chan, t, =
demux_tasklet);
>> +	struct ngene_channel *chan =3D from_work(chan, t, demux_work);
>> 	struct device *pdev =3D &chan->dev->pci_dev->dev;
>> 	struct SBufferHeader *Cur =3D chan->nextBuffer;
>>=20
>> @@ -204,7 +205,7 @@ static irqreturn_t irq_handler(int irq, void =
*dev_id)
>> 			dev->EventQueueOverflowFlag =3D 1;
>> 		}
>> 		dev->EventBuffer->EventStatus &=3D ~0x80;
>> -		tasklet_schedule(&dev->event_tasklet);
>> +		queue_work(system_bh_wq, &dev->event_work);
>> 		rc =3D IRQ_HANDLED;
>> 	}
>>=20
>> @@ -217,8 +218,8 @@ static irqreturn_t irq_handler(int irq, void =
*dev_id)
>> 			     ngeneBuffer.SR.Flags & 0xC0) =3D=3D 0x80) {
>> 				dev->channel[i].nextBuffer->
>> 					ngeneBuffer.SR.Flags |=3D 0x40;
>> -				tasklet_schedule(
>> -					&dev->channel[i].demux_tasklet);
>> +				queue_work(system_bh_wq,
>> +					&dev->channel[i].demux_work);
>> 				rc =3D IRQ_HANDLED;
>> 			}
>> 		}
>> @@ -1181,7 +1182,7 @@ static void ngene_init(struct ngene *dev)
>> 	struct device *pdev =3D &dev->pci_dev->dev;
>> 	int i;
>>=20
>> -	tasklet_setup(&dev->event_tasklet, event_tasklet);
>> +	INIT_WORK(&dev->event_work, event_work);
>>=20
>> 	memset_io(dev->iomem + 0xc000, 0x00, 0x220);
>> 	memset_io(dev->iomem + 0xc400, 0x00, 0x100);
>> @@ -1395,7 +1396,7 @@ static void release_channel(struct =
ngene_channel *chan)
>> 	if (chan->running)
>> 		set_transfer(chan, 0);
>>=20
>> -	tasklet_kill(&chan->demux_tasklet);
>> +	cancel_work_sync(&chan->demux_work);
>>=20
>> 	if (chan->ci_dev) {
>> 		dvb_unregister_device(chan->ci_dev);
>> @@ -1445,7 +1446,7 @@ static int init_channel(struct ngene_channel =
*chan)
>> 	struct ngene_info *ni =3D dev->card_info;
>> 	int io =3D ni->io_type[nr];
>>=20
>> -	tasklet_setup(&chan->demux_tasklet, demux_tasklet);
>> +	INIT_WORK(&chan->demux_work, demux_work);
>> 	chan->users =3D 0;
>> 	chan->type =3D io;
>> 	chan->mode =3D chan->type;	/* for now only one mode */
>> @@ -1647,7 +1648,7 @@ void ngene_remove(struct pci_dev *pdev)
>> 	struct ngene *dev =3D pci_get_drvdata(pdev);
>> 	int i;
>>=20
>> -	tasklet_kill(&dev->event_tasklet);
>> +	cancel_work_sync(&dev->event_work);
>> 	for (i =3D MAX_STREAM - 1; i >=3D 0; i--)
>> 		release_channel(&dev->channel[i]);
>> 	if (dev->ci.en)
>> diff --git a/drivers/media/pci/ngene/ngene.h =
b/drivers/media/pci/ngene/ngene.h
>> index d1d7da84cd9d..c2a23f6dbe09 100644
>> --- a/drivers/media/pci/ngene/ngene.h
>> +++ b/drivers/media/pci/ngene/ngene.h
>> @@ -16,6 +16,7 @@
>> #include <linux/scatterlist.h>
>>=20
>> #include <linux/dvb/frontend.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include <media/dmxdev.h>
>> #include <media/dvbdev.h>
>> @@ -621,7 +622,7 @@ struct ngene_channel {
>> 	int                   users;
>> 	struct video_device  *v4l_dev;
>> 	struct dvb_device    *ci_dev;
>> -	struct tasklet_struct demux_tasklet;
>> +	struct work_struct demux_work;
>>=20
>> 	struct SBufferHeader *nextBuffer;
>> 	enum KSSTATE          State;
>> @@ -717,7 +718,7 @@ struct ngene {
>> 	struct EVENT_BUFFER   EventQueue[EVENT_QUEUE_SIZE];
>> 	int                   EventQueueOverflowCount;
>> 	int                   EventQueueOverflowFlag;
>> -	struct tasklet_struct event_tasklet;
>> +	struct work_struct event_work;
>> 	struct EVENT_BUFFER  *EventBuffer;
>> 	int                   EventQueueWriteIndex;
>> 	int                   EventQueueReadIndex;
>> diff --git a/drivers/media/pci/smipcie/smipcie-main.c =
b/drivers/media/pci/smipcie/smipcie-main.c
>> index 0c300d019d9c..7da6bb55660b 100644
>> --- a/drivers/media/pci/smipcie/smipcie-main.c
>> +++ b/drivers/media/pci/smipcie/smipcie-main.c
>> @@ -279,10 +279,10 @@ static void smi_port_clearInterrupt(struct =
smi_port *port)
>> 		(port->_dmaInterruptCH0 | port->_dmaInterruptCH1));
>> }
>>=20
>> -/* tasklet handler: DMA data to dmx.*/
>> -static void smi_dma_xfer(struct tasklet_struct *t)
>> +/* work handler: DMA data to dmx.*/
>> +static void smi_dma_xfer(struct work_struct *t)
>> {
>> -	struct smi_port *port =3D from_tasklet(port, t, tasklet);
>> +	struct smi_port *port =3D from_work(port, t, work);
>> 	struct smi_dev *dev =3D port->dev;
>> 	u32 intr_status, finishedData, dmaManagement;
>> 	u8 dmaChan0State, dmaChan1State;
>> @@ -426,8 +426,8 @@ static int smi_port_init(struct smi_port *port, =
int dmaChanUsed)
>> 	}
>>=20
>> 	smi_port_disableInterrupt(port);
>> -	tasklet_setup(&port->tasklet, smi_dma_xfer);
>> -	tasklet_disable(&port->tasklet);
>> +	INIT_WORK(&port->work, smi_dma_xfer);
>> +	disable_work_sync(&port->work);
>> 	port->enable =3D 1;
>> 	return 0;
>> err:
>> @@ -438,7 +438,7 @@ static int smi_port_init(struct smi_port *port, =
int dmaChanUsed)
>> static void smi_port_exit(struct smi_port *port)
>> {
>> 	smi_port_disableInterrupt(port);
>> -	tasklet_kill(&port->tasklet);
>> +	cancel_work_sync(&port->work);
>> 	smi_port_dma_free(port);
>> 	port->enable =3D 0;
>> }
>> @@ -452,7 +452,7 @@ static int smi_port_irq(struct smi_port *port, =
u32 int_status)
>> 		smi_port_disableInterrupt(port);
>> 		port->_int_status =3D int_status;
>> 		smi_port_clearInterrupt(port);
>> -		tasklet_schedule(&port->tasklet);
>> +		queue_work(system_bh_wq, &port->work);
>> 		handled =3D 1;
>> 	}
>> 	return handled;
>> @@ -823,7 +823,7 @@ static int smi_start_feed(struct dvb_demux_feed =
*dvbdmxfeed)
>> 		smi_port_clearInterrupt(port);
>> 		smi_port_enableInterrupt(port);
>> 		smi_write(port->DMA_MANAGEMENT, dmaManagement);
>> -		tasklet_enable(&port->tasklet);
>> +		enable_and_queue_work(system_bh_wq, &port->work);
>> 	}
>> 	return port->users;
>> }
>> @@ -837,7 +837,7 @@ static int smi_stop_feed(struct dvb_demux_feed =
*dvbdmxfeed)
>> 	if (--port->users)
>> 		return port->users;
>>=20
>> -	tasklet_disable(&port->tasklet);
>> +	disable_work_sync(&port->work);
>> 	smi_port_disableInterrupt(port);
>> 	smi_clear(port->DMA_MANAGEMENT, 0x30003);
>> 	return 0;
>> diff --git a/drivers/media/pci/smipcie/smipcie.h =
b/drivers/media/pci/smipcie/smipcie.h
>> index 2b5e0154814c..f124d2cdead6 100644
>> --- a/drivers/media/pci/smipcie/smipcie.h
>> +++ b/drivers/media/pci/smipcie/smipcie.h
>> @@ -17,6 +17,7 @@
>> #include <linux/pci.h>
>> #include <linux/dma-mapping.h>
>> #include <linux/slab.h>
>> +#include <linux/workqueue.h>
>> #include <media/rc-core.h>
>>=20
>> #include <media/demux.h>
>> @@ -257,7 +258,7 @@ struct smi_port {
>> 	u32 _dmaInterruptCH0;
>> 	u32 _dmaInterruptCH1;
>> 	u32 _int_status;
>> -	struct tasklet_struct tasklet;
>> +	struct work_struct work;
>> 	/* dvb */
>> 	struct dmx_frontend hw_frontend;
>> 	struct dmx_frontend mem_frontend;
>> diff --git a/drivers/media/pci/ttpci/budget-av.c =
b/drivers/media/pci/ttpci/budget-av.c
>> index a47c5850ef87..6e43b1a01191 100644
>> --- a/drivers/media/pci/ttpci/budget-av.c
>> +++ b/drivers/media/pci/ttpci/budget-av.c
>> @@ -37,6 +37,7 @@
>> #include <linux/interrupt.h>
>> #include <linux/input.h>
>> #include <linux/spinlock.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include <media/dvb_ca_en50221.h>
>>=20
>> @@ -55,7 +56,7 @@ struct budget_av {
>> 	struct video_device vd;
>> 	int cur_input;
>> 	int has_saa7113;
>> -	struct tasklet_struct ciintf_irq_tasklet;
>> +	struct work_struct ciintf_irq_work;
>> 	int slot_status;
>> 	struct dvb_ca_en50221 ca;
>> 	u8 reinitialise_demod:1;
>> diff --git a/drivers/media/pci/ttpci/budget-ci.c =
b/drivers/media/pci/ttpci/budget-ci.c
>> index 66e1a004ee43..11e0ed62707e 100644
>> --- a/drivers/media/pci/ttpci/budget-ci.c
>> +++ b/drivers/media/pci/ttpci/budget-ci.c
>> @@ -17,6 +17,7 @@
>> #include <linux/slab.h>
>> #include <linux/interrupt.h>
>> #include <linux/spinlock.h>
>> +#include <linux/workqueue.h>
>> #include <media/rc-core.h>
>>=20
>> #include "budget.h"
>> @@ -80,7 +81,7 @@ DVB_DEFINE_MOD_OPT_ADAPTER_NR(adapter_nr);
>>=20
>> struct budget_ci_ir {
>> 	struct rc_dev *dev;
>> -	struct tasklet_struct msp430_irq_tasklet;
>> +	struct work_struct msp430_irq_work;
>> 	char name[72]; /* 40 + 32 for (struct saa7146_dev).name */
>> 	char phys[32];
>> 	int rc5_device;
>> @@ -91,7 +92,7 @@ struct budget_ci_ir {
>>=20
>> struct budget_ci {
>> 	struct budget budget;
>> -	struct tasklet_struct ciintf_irq_tasklet;
>> +	struct work_struct ciintf_irq_work;
>> 	int slot_status;
>> 	int ci_irq;
>> 	struct dvb_ca_en50221 ca;
>> @@ -99,9 +100,9 @@ struct budget_ci {
>> 	u8 tuner_pll_address; /* used for philips_tdm1316l configs */
>> };
>>=20
>> -static void msp430_ir_interrupt(struct tasklet_struct *t)
>> +static void msp430_ir_interrupt(struct work_struct *t)
>> {
>> -	struct budget_ci_ir *ir =3D from_tasklet(ir, t, =
msp430_irq_tasklet);
>> +	struct budget_ci_ir *ir =3D from_work(ir, t, msp430_irq_work);
>> 	struct budget_ci *budget_ci =3D container_of(ir, =
typeof(*budget_ci), ir);
>> 	struct rc_dev *dev =3D budget_ci->ir.dev;
>> 	u32 command =3D ttpci_budget_debiread(&budget_ci->budget, =
DEBINOSWAP, DEBIADDR_IR, 2, 1, 0) >> 8;
>> @@ -230,7 +231,7 @@ static int msp430_ir_init(struct budget_ci =
*budget_ci)
>>=20
>> 	budget_ci->ir.dev =3D dev;
>>=20
>> -	tasklet_setup(&budget_ci->ir.msp430_irq_tasklet, =
msp430_ir_interrupt);
>> +	INIT_WORK(&budget_ci->ir.msp430_irq_work, msp430_ir_interrupt);
>>=20
>> 	SAA7146_IER_ENABLE(saa, MASK_06);
>> 	saa7146_setgpio(saa, 3, SAA7146_GPIO_IRQHI);
>> @@ -244,7 +245,7 @@ static void msp430_ir_deinit(struct budget_ci =
*budget_ci)
>>=20
>> 	SAA7146_IER_DISABLE(saa, MASK_06);
>> 	saa7146_setgpio(saa, 3, SAA7146_GPIO_INPUT);
>> -	tasklet_kill(&budget_ci->ir.msp430_irq_tasklet);
>> +	cancel_work_sync(&budget_ci->ir.msp430_irq_work);
>>=20
>> 	rc_unregister_device(budget_ci->ir.dev);
>> }
>> @@ -348,10 +349,10 @@ static int ciintf_slot_ts_enable(struct =
dvb_ca_en50221 *ca, int slot)
>> 	return 0;
>> }
>>=20
>> -static void ciintf_interrupt(struct tasklet_struct *t)
>> +static void ciintf_interrupt(struct work_struct *t)
>> {
>> -	struct budget_ci *budget_ci =3D from_tasklet(budget_ci, t,
>> -						   ciintf_irq_tasklet);
>> +	struct budget_ci *budget_ci =3D from_work(budget_ci, t,
>> +						   ciintf_irq_work);
>> 	struct saa7146_dev *saa =3D budget_ci->budget.dev;
>> 	unsigned int flags;
>>=20
>> @@ -492,7 +493,7 @@ static int ciintf_init(struct budget_ci =
*budget_ci)
>>=20
>> 	// Setup CI slot IRQ
>> 	if (budget_ci->ci_irq) {
>> -		tasklet_setup(&budget_ci->ciintf_irq_tasklet, =
ciintf_interrupt);
>> +		INIT_WORK(&budget_ci->ciintf_irq_work, =
ciintf_interrupt);
>> 		if (budget_ci->slot_status !=3D SLOTSTATUS_NONE) {
>> 			saa7146_setgpio(saa, 0, SAA7146_GPIO_IRQLO);
>> 		} else {
>> @@ -532,7 +533,7 @@ static void ciintf_deinit(struct budget_ci =
*budget_ci)
>> 	if (budget_ci->ci_irq) {
>> 		SAA7146_IER_DISABLE(saa, MASK_03);
>> 		saa7146_setgpio(saa, 0, SAA7146_GPIO_INPUT);
>> -		tasklet_kill(&budget_ci->ciintf_irq_tasklet);
>> +		cancel_work_sync(&budget_ci->ciintf_irq_work);
>> 	}
>>=20
>> 	// reset interface
>> @@ -558,13 +559,13 @@ static void budget_ci_irq(struct saa7146_dev =
*dev, u32 * isr)
>> 	dprintk(8, "dev: %p, budget_ci: %p\n", dev, budget_ci);
>>=20
>> 	if (*isr & MASK_06)
>> -		tasklet_schedule(&budget_ci->ir.msp430_irq_tasklet);
>> +		queue_work(system_bh_wq, =
&budget_ci->ir.msp430_irq_work);
>>=20
>> 	if (*isr & MASK_10)
>> 		ttpci_budget_irq10_handler(dev, isr);
>>=20
>> 	if ((*isr & MASK_03) && (budget_ci->budget.ci_present) && =
(budget_ci->ci_irq))
>> -		tasklet_schedule(&budget_ci->ciintf_irq_tasklet);
>> +		queue_work(system_bh_wq, &budget_ci->ciintf_irq_work);
>> }
>>=20
>> static u8 philips_su1278_tt_inittab[] =3D {
>> diff --git a/drivers/media/pci/ttpci/budget-core.c =
b/drivers/media/pci/ttpci/budget-core.c
>> index 25f44c3eebf3..3443c12dc9f2 100644
>> --- a/drivers/media/pci/ttpci/budget-core.c
>> +++ b/drivers/media/pci/ttpci/budget-core.c
>> @@ -171,9 +171,9 @@ static int budget_read_fe_status(struct =
dvb_frontend *fe,
>> 	return ret;
>> }
>>=20
>> -static void vpeirq(struct tasklet_struct *t)
>> +static void vpeirq(struct work_struct *t)
>> {
>> -	struct budget *budget =3D from_tasklet(budget, t, vpe_tasklet);
>> +	struct budget *budget =3D from_work(budget, t, vpe_work);
>> 	u8 *mem =3D (u8 *) (budget->grabbing);
>> 	u32 olddma =3D budget->ttbp;
>> 	u32 newdma =3D saa7146_read(budget->dev, PCI_VDP3);
>> @@ -520,7 +520,7 @@ int ttpci_budget_init(struct budget *budget, =
struct saa7146_dev *dev,
>> 	/* upload all */
>> 	saa7146_write(dev, GPIO_CTRL, 0x000000);
>>=20
>> -	tasklet_setup(&budget->vpe_tasklet, vpeirq);
>> +	INIT_WORK(&budget->vpe_work, vpeirq);
>>=20
>> 	/* frontend power on */
>> 	if (bi->type !=3D BUDGET_FS_ACTIVY)
>> @@ -557,7 +557,7 @@ int ttpci_budget_deinit(struct budget *budget)
>>=20
>> 	budget_unregister(budget);
>>=20
>> -	tasklet_kill(&budget->vpe_tasklet);
>> +	cancel_work_sync(&budget->vpe_work);
>>=20
>> 	saa7146_vfree_destroy_pgtable(dev->pci, budget->grabbing, =
&budget->pt);
>>=20
>> @@ -575,7 +575,7 @@ void ttpci_budget_irq10_handler(struct =
saa7146_dev *dev, u32 * isr)
>> 	dprintk(8, "dev: %p, budget: %p\n", dev, budget);
>>=20
>> 	if (*isr & MASK_10)
>> -		tasklet_schedule(&budget->vpe_tasklet);
>> +		queue_work(system_bh_wq, &budget->vpe_work);
>> }
>>=20
>> void ttpci_budget_set_video_port(struct saa7146_dev *dev, int =
video_port)
>> diff --git a/drivers/media/pci/ttpci/budget.h =
b/drivers/media/pci/ttpci/budget.h
>> index bd87432e6cde..a3ee75e326b4 100644
>> --- a/drivers/media/pci/ttpci/budget.h
>> +++ b/drivers/media/pci/ttpci/budget.h
>> @@ -12,6 +12,7 @@
>>=20
>> #include <linux/module.h>
>> #include <linux/mutex.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include <media/drv-intf/saa7146.h>
>>=20
>> @@ -49,8 +50,8 @@ struct budget {
>> 	unsigned char *grabbing;
>> 	struct saa7146_pgtable pt;
>>=20
>> -	struct tasklet_struct fidb_tasklet;
>> -	struct tasklet_struct vpe_tasklet;
>> +	struct work_struct fidb_work;
>> +	struct work_struct vpe_work;
>>=20
>> 	struct dmxdev dmxdev;
>> 	struct dvb_demux demux;
>> diff --git a/drivers/media/pci/tw5864/tw5864-core.c =
b/drivers/media/pci/tw5864/tw5864-core.c
>> index 560ff1ddcc83..a58c268e94a8 100644
>> --- a/drivers/media/pci/tw5864/tw5864-core.c
>> +++ b/drivers/media/pci/tw5864/tw5864-core.c
>> @@ -144,7 +144,7 @@ static void tw5864_h264_isr(struct tw5864_dev =
*dev)
>> 		cur_frame->gop_seqno =3D input->frame_gop_seqno;
>>=20
>> 		dev->h264_buf_w_index =3D next_frame_index;
>> -		tasklet_schedule(&dev->tasklet);
>> +		queue_work(system_bh_wq, &dev->work);
>>=20
>> 		cur_frame =3D next_frame;
>>=20
>> diff --git a/drivers/media/pci/tw5864/tw5864-video.c =
b/drivers/media/pci/tw5864/tw5864-video.c
>> index 8b1aae4b6319..ac2249626506 100644
>> --- a/drivers/media/pci/tw5864/tw5864-video.c
>> +++ b/drivers/media/pci/tw5864/tw5864-video.c
>> @@ -6,6 +6,7 @@
>>  */
>>=20
>> #include <linux/module.h>
>> +#include <linux/workqueue.h>
>> #include <media/v4l2-common.h>
>> #include <media/v4l2-event.h>
>> #include <media/videobuf2-dma-contig.h>
>> @@ -175,7 +176,7 @@ static const unsigned int intra4x4_lambda3[] =3D =
{
>> static v4l2_std_id tw5864_get_v4l2_std(enum tw5864_vid_std std);
>> static enum tw5864_vid_std tw5864_from_v4l2_std(v4l2_std_id =
v4l2_std);
>>=20
>> -static void tw5864_handle_frame_task(struct tasklet_struct *t);
>> +static void tw5864_handle_frame_task(struct work_struct *t);
>> static void tw5864_handle_frame(struct tw5864_h264_frame *frame);
>> static void tw5864_frame_interval_set(struct tw5864_input *input);
>>=20
>> @@ -1062,7 +1063,7 @@ int tw5864_video_init(struct tw5864_dev *dev, =
int *video_nr)
>> 	dev->irqmask |=3D TW5864_INTR_VLC_DONE | TW5864_INTR_TIMER;
>> 	tw5864_irqmask_apply(dev);
>>=20
>> -	tasklet_setup(&dev->tasklet, tw5864_handle_frame_task);
>> +	INIT_WORK(&dev->work, tw5864_handle_frame_task);
>>=20
>> 	for (i =3D 0; i < TW5864_INPUTS; i++) {
>> 		dev->inputs[i].root =3D dev;
>> @@ -1079,7 +1080,7 @@ int tw5864_video_init(struct tw5864_dev *dev, =
int *video_nr)
>> 	for (i =3D last_input_nr_registered; i >=3D 0; i--)
>> 		tw5864_video_input_fini(&dev->inputs[i]);
>>=20
>> -	tasklet_kill(&dev->tasklet);
>> +	cancel_work_sync(&dev->work);
>>=20
>> free_dma:
>> 	for (i =3D last_dma_allocated; i >=3D 0; i--) {
>> @@ -1198,7 +1199,7 @@ void tw5864_video_fini(struct tw5864_dev *dev)
>> {
>> 	int i;
>>=20
>> -	tasklet_kill(&dev->tasklet);
>> +	cancel_work_sync(&dev->work);
>>=20
>> 	for (i =3D 0; i < TW5864_INPUTS; i++)
>> 		tw5864_video_input_fini(&dev->inputs[i]);
>> @@ -1315,9 +1316,9 @@ static int tw5864_is_motion_triggered(struct =
tw5864_h264_frame *frame)
>> 	return detected;
>> }
>>=20
>> -static void tw5864_handle_frame_task(struct tasklet_struct *t)
>> +static void tw5864_handle_frame_task(struct work_struct *t)
>> {
>> -	struct tw5864_dev *dev =3D from_tasklet(dev, t, tasklet);
>> +	struct tw5864_dev *dev =3D from_work(dev, t, work);
>> 	unsigned long flags;
>> 	int batch_size =3D H264_BUF_CNT;
>>=20
>> diff --git a/drivers/media/pci/tw5864/tw5864.h =
b/drivers/media/pci/tw5864/tw5864.h
>> index a8b6fbd5b710..278373859098 100644
>> --- a/drivers/media/pci/tw5864/tw5864.h
>> +++ b/drivers/media/pci/tw5864/tw5864.h
>> @@ -12,6 +12,7 @@
>> #include <linux/mutex.h>
>> #include <linux/io.h>
>> #include <linux/interrupt.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include <media/v4l2-common.h>
>> #include <media/v4l2-ioctl.h>
>> @@ -85,7 +86,7 @@ struct tw5864_input {
>> 	int nr; /* input number */
>> 	struct tw5864_dev *root;
>> 	struct mutex lock; /* used for vidq and vdev */
>> -	spinlock_t slock; /* used for sync between ISR, tasklet & V4L2 =
API */
>> +	spinlock_t slock; /* used for sync between ISR, work & V4L2 API =
*/
>> 	struct video_device vdev;
>> 	struct v4l2_ctrl_handler hdl;
>> 	struct vb2_queue vidq;
>> @@ -142,7 +143,7 @@ struct tw5864_h264_frame {
>>=20
>> /* global device status */
>> struct tw5864_dev {
>> -	spinlock_t slock; /* used for sync between ISR, tasklet & V4L2 =
API */
>> +	spinlock_t slock; /* used for sync between ISR, work & V4L2 API =
*/
>> 	struct v4l2_device v4l2_dev;
>> 	struct tw5864_input inputs[TW5864_INPUTS];
>> #define H264_BUF_CNT 4
>> @@ -150,7 +151,7 @@ struct tw5864_dev {
>> 	int h264_buf_r_index;
>> 	int h264_buf_w_index;
>>=20
>> -	struct tasklet_struct tasklet;
>> +	struct work_struct work;
>>=20
>> 	int encoder_busy;
>> 	/* Input number to check next for ready raw picture (in RR =
fashion) */
>> diff --git a/drivers/media/platform/intel/pxa_camera.c =
b/drivers/media/platform/intel/pxa_camera.c
>> index d904952bf00e..df0a3c559287 100644
>> --- a/drivers/media/platform/intel/pxa_camera.c
>> +++ b/drivers/media/platform/intel/pxa_camera.c
>> @@ -43,6 +43,7 @@
>> #include <linux/videodev2.h>
>>=20
>> #include <linux/platform_data/media/camera-pxa.h>
>> +#include <linux/workqueue.h>
>>=20
>> #define PXA_CAM_VERSION "0.0.6"
>> #define PXA_CAM_DRV_NAME "pxa27x-camera"
>> @@ -683,7 +684,7 @@ struct pxa_camera_dev {
>> 	unsigned int		buf_sequence;
>>=20
>> 	struct pxa_buffer	*active;
>> -	struct tasklet_struct	task_eof;
>> +	struct work_struct 	task_eof;
>>=20
>> 	u32			save_cicr[5];
>> };
>> @@ -1146,9 +1147,9 @@ static void pxa_camera_deactivate(struct =
pxa_camera_dev *pcdev)
>> 	clk_disable_unprepare(pcdev->clk);
>> }
>>=20
>> -static void pxa_camera_eof(struct tasklet_struct *t)
>> +static void pxa_camera_eof(struct work_struct *t)
>> {
>> -	struct pxa_camera_dev *pcdev =3D from_tasklet(pcdev, t, =
task_eof);
>> +	struct pxa_camera_dev *pcdev =3D from_work(pcdev, t, task_eof);
>> 	unsigned long cifr;
>> 	struct pxa_buffer *buf;
>>=20
>> @@ -1185,7 +1186,7 @@ static irqreturn_t pxa_camera_irq(int irq, void =
*data)
>> 	if (status & CISR_EOF) {
>> 		cicr0 =3D __raw_readl(pcdev->base + CICR0) | CICR0_EOFM;
>> 		__raw_writel(cicr0, pcdev->base + CICR0);
>> -		tasklet_schedule(&pcdev->task_eof);
>> +		queue_work(system_bh_wq, &pcdev->task_eof);
>> 	}
>>=20
>> 	return IRQ_HANDLED;
>> @@ -2383,7 +2384,7 @@ static int pxa_camera_probe(struct =
platform_device *pdev)
>> 		}
>> 	}
>>=20
>> -	tasklet_setup(&pcdev->task_eof, pxa_camera_eof);
>> +	INIT_WORK(&pcdev->task_eof, pxa_camera_eof);
>>=20
>> 	pxa_camera_activate(pcdev);
>>=20
>> @@ -2409,7 +2410,7 @@ static int pxa_camera_probe(struct =
platform_device *pdev)
>> 	return 0;
>> exit_deactivate:
>> 	pxa_camera_deactivate(pcdev);
>> -	tasklet_kill(&pcdev->task_eof);
>> +	cancel_work_sync(&pcdev->task_eof);
>> exit_free_dma:
>> 	dma_release_channel(pcdev->dma_chans[2]);
>> exit_free_dma_u:
>> @@ -2428,7 +2429,7 @@ static void pxa_camera_remove(struct =
platform_device *pdev)
>> 	struct pxa_camera_dev *pcdev =3D platform_get_drvdata(pdev);
>>=20
>> 	pxa_camera_deactivate(pcdev);
>> -	tasklet_kill(&pcdev->task_eof);
>> +	cancel_work_sync(&pcdev->task_eof);
>> 	dma_release_channel(pcdev->dma_chans[0]);
>> 	dma_release_channel(pcdev->dma_chans[1]);
>> 	dma_release_channel(pcdev->dma_chans[2]);
>> diff --git a/drivers/media/platform/marvell/mcam-core.c =
b/drivers/media/platform/marvell/mcam-core.c
>> index 66688b4aece5..d6b96a7039be 100644
>> --- a/drivers/media/platform/marvell/mcam-core.c
>> +++ b/drivers/media/platform/marvell/mcam-core.c
>> @@ -25,6 +25,7 @@
>> #include <linux/clk-provider.h>
>> #include <linux/videodev2.h>
>> #include <linux/pm_runtime.h>
>> +#include <linux/workqueue.h>
>> #include <media/v4l2-device.h>
>> #include <media/v4l2-ioctl.h>
>> #include <media/v4l2-ctrls.h>
>> @@ -439,9 +440,9 @@ static void mcam_ctlr_dma_vmalloc(struct =
mcam_camera *cam)
>> /*
>>  * Copy data out to user space in the vmalloc case
>>  */
>> -static void mcam_frame_tasklet(struct tasklet_struct *t)
>> +static void mcam_frame_work(struct work_struct *t)
>> {
>> -	struct mcam_camera *cam =3D from_tasklet(cam, t, s_tasklet);
>> +	struct mcam_camera *cam =3D from_work(cam, t, s_work);
>> 	int i;
>> 	unsigned long flags;
>> 	struct mcam_vb_buffer *buf;
>> @@ -480,7 +481,7 @@ static void mcam_frame_tasklet(struct =
tasklet_struct *t)
>>=20
>>=20
>> /*
>> - * Make sure our allocated buffers are up to the task.
>> + * Make sure our allocated buffers are up to the work.
>>  */
>> static int mcam_check_dma_buffers(struct mcam_camera *cam)
>> {
>> @@ -493,7 +494,7 @@ static int mcam_check_dma_buffers(struct =
mcam_camera *cam)
>>=20
>> static void mcam_vmalloc_done(struct mcam_camera *cam, int frame)
>> {
>> -	tasklet_schedule(&cam->s_tasklet);
>> +	queue_work(system_bh_wq, &cam->s_work);
>> }
>>=20
>> #else /* MCAM_MODE_VMALLOC */
>> @@ -1305,7 +1306,7 @@ static int mcam_setup_vb2(struct mcam_camera =
*cam)
>> 		break;
>> 	case B_vmalloc:
>> #ifdef MCAM_MODE_VMALLOC
>> -		tasklet_setup(&cam->s_tasklet, mcam_frame_tasklet);
>> +		INIT_WORK(&cam->s_work, mcam_frame_work);
>> 		vq->ops =3D &mcam_vb2_ops;
>> 		vq->mem_ops =3D &vb2_vmalloc_memops;
>> 		cam->dma_setup =3D mcam_ctlr_dma_vmalloc;
>> diff --git a/drivers/media/platform/marvell/mcam-core.h =
b/drivers/media/platform/marvell/mcam-core.h
>> index 51e66db45af6..0d4b953dbb23 100644
>> --- a/drivers/media/platform/marvell/mcam-core.h
>> +++ b/drivers/media/platform/marvell/mcam-core.h
>> @@ -9,6 +9,7 @@
>>=20
>> #include <linux/list.h>
>> #include <linux/clk-provider.h>
>> +#include <linux/workqueue.h>
>> #include <media/v4l2-common.h>
>> #include <media/v4l2-ctrls.h>
>> #include <media/v4l2-dev.h>
>> @@ -167,7 +168,7 @@ struct mcam_camera {
>> 	unsigned int dma_buf_size;	/* allocated size */
>> 	void *dma_bufs[MAX_DMA_BUFS];	/* Internal buffer addresses */
>> 	dma_addr_t dma_handles[MAX_DMA_BUFS]; /* Buffer bus addresses */
>> -	struct tasklet_struct s_tasklet;
>> +	struct work_struct s_work;
>> #endif
>> 	unsigned int sequence;		/* Frame sequence number */
>> 	unsigned int buf_seq[MAX_DMA_BUFS]; /* Sequence for individual =
bufs */
>> diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c =
b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
>> index e4cf27b5a072..22b359569a10 100644
>> --- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
>> +++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.c
>> @@ -33,6 +33,7 @@
>> #include <linux/time.h>
>> #include <linux/usb.h>
>> #include <linux/wait.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include "c8sectpfe-common.h"
>> #include "c8sectpfe-core.h"
>> @@ -73,16 +74,16 @@ static void c8sectpfe_timer_interrupt(struct =
timer_list *t)
>>=20
>> 		/* is this descriptor initialised and TP enabled */
>> 		if (channel->irec && readl(channel->irec + =
DMA_PRDS_TPENABLE))
>> -			tasklet_schedule(&channel->tsklet);
>> +			queue_work(system_bh_wq, &channel->tsklet);
>> 	}
>>=20
>> 	fei->timer.expires =3D jiffies +	=
msecs_to_jiffies(POLL_MSECS);
>> 	add_timer(&fei->timer);
>> }
>>=20
>> -static void channel_swdemux_tsklet(struct tasklet_struct *t)
>> +static void channel_swdemux_tsklet(struct work_struct *t)
>> {
>> -	struct channel_info *channel =3D from_tasklet(channel, t, =
tsklet);
>> +	struct channel_info *channel =3D from_work(channel, t, tsklet);
>> 	struct c8sectpfei *fei;
>> 	unsigned long wp, rp;
>> 	int pos, num_packets, n, size;
>> @@ -211,7 +212,7 @@ static int c8sectpfe_start_feed(struct =
dvb_demux_feed *dvbdmxfeed)
>>=20
>> 		dev_dbg(fei->dev, "Starting channel=3D%p\n", channel);
>>=20
>> -		tasklet_setup(&channel->tsklet, channel_swdemux_tsklet);
>> +		INIT_WORK(&channel->tsklet, channel_swdemux_tsklet);
>>=20
>> 		/* Reset the internal inputblock sram pointers */
>> 		writel(channel->fifo,
>> @@ -304,7 +305,7 @@ static int c8sectpfe_stop_feed(struct =
dvb_demux_feed *dvbdmxfeed)
>> 		/* disable this channels descriptor */
>> 		writel(0,  channel->irec + DMA_PRDS_TPENABLE);
>>=20
>> -		tasklet_disable(&channel->tsklet);
>> +		disable_work_sync(&channel->tsklet);
>>=20
>> 		/* now request memdma channel goes idle */
>> 		idlereq =3D (1 << channel->tsin_id) | IDLEREQ;
>> @@ -631,8 +632,8 @@ static int configure_memdma_and_inputblock(struct =
c8sectpfei *fei,
>> 	writel(tsin->back_buffer_busaddr, tsin->irec + =
DMA_PRDS_BUSWP_TP(0));
>> 	writel(tsin->back_buffer_busaddr, tsin->irec + =
DMA_PRDS_BUSRP_TP(0));
>>=20
>> -	/* initialize tasklet */
>> -	tasklet_setup(&tsin->tsklet, channel_swdemux_tsklet);
>> +	/* initialize work */
>> +	INIT_WORK(&tsin->tsklet, channel_swdemux_tsklet);
>>=20
>> 	return 0;
>>=20
>> diff --git a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h =
b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h
>> index bf377cc82225..d63f0ee83615 100644
>> --- a/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h
>> +++ b/drivers/media/platform/st/sti/c8sectpfe/c8sectpfe-core.h
>> @@ -51,7 +51,7 @@ struct channel_info {
>> 	unsigned long  fifo;
>>=20
>> 	struct completion idle_completion;
>> -	struct tasklet_struct tsklet;
>> +	struct work_struct tsklet;
>>=20
>> 	struct c8sectpfei *fei;
>> 	void __iomem *irec;
>> diff --git a/drivers/media/radio/wl128x/fmdrv.h =
b/drivers/media/radio/wl128x/fmdrv.h
>> index da8920169df8..85282f638c4a 100644
>> --- a/drivers/media/radio/wl128x/fmdrv.h
>> +++ b/drivers/media/radio/wl128x/fmdrv.h
>> @@ -15,6 +15,7 @@
>> #include <sound/core.h>
>> #include <sound/initval.h>
>> #include <linux/timer.h>
>> +#include <linux/workqueue.h>
>> #include <media/v4l2-ioctl.h>
>> #include <media/v4l2-common.h>
>> #include <media/v4l2-device.h>
>> @@ -200,15 +201,15 @@ struct fmdev {
>> 	int streg_cbdata; /* status of ST registration */
>>=20
>> 	struct sk_buff_head rx_q;	/* RX queue */
>> -	struct tasklet_struct rx_task;	/* RX Tasklet */
>> +	struct work_struct rx_task;	/* RX Work */
>>=20
>> 	struct sk_buff_head tx_q;	/* TX queue */
>> -	struct tasklet_struct tx_task;	/* TX Tasklet */
>> +	struct work_struct tx_task;	/* TX Work */
>> 	unsigned long last_tx_jiffies;	/* Timestamp of last pkt sent */
>> 	atomic_t tx_cnt;	/* Number of packets can send at a time =
*/
>>=20
>> 	struct sk_buff *resp_skb;	/* Response from the chip */
>> -	/* Main task completion handler */
>> +	/* Main work completion handler */
>> 	struct completion maintask_comp;
>> 	/* Opcode of last command sent to the chip */
>> 	u8 pre_op;
>> diff --git a/drivers/media/radio/wl128x/fmdrv_common.c =
b/drivers/media/radio/wl128x/fmdrv_common.c
>> index 3da8e5102bec..52290bb4a4ad 100644
>> --- a/drivers/media/radio/wl128x/fmdrv_common.c
>> +++ b/drivers/media/radio/wl128x/fmdrv_common.c
>> @@ -9,7 +9,7 @@
>>  *     one Channel-8 command to be sent to the chip).
>>  *  2) Sending each Channel-8 command to the chip and reading
>>  *     response back over Shared Transport.
>> - *  3) Managing TX and RX Queues and Tasklets.
>> + *  3) Managing TX and RX Queues and Works.
>>  *  4) Handling FM Interrupt packet and taking appropriate action.
>>  *  5) Loading FM firmware to the chip (common, FM TX, and FM RX
>>  *     firmware files based on mode selection)
>> @@ -29,6 +29,7 @@
>> #include "fmdrv_v4l2.h"
>> #include "fmdrv_common.h"
>> #include <linux/ti_wilink_st.h>
>> +#include <linux/workqueue.h>
>> #include "fmdrv_rx.h"
>> #include "fmdrv_tx.h"
>>=20
>> @@ -244,10 +245,10 @@ void fmc_update_region_info(struct fmdev =
*fmdev, u8 region_to_set)
>> }
>>=20
>> /*
>> - * FM common sub-module will schedule this tasklet whenever it =
receives
>> + * FM common sub-module will schedule this work whenever it receives
>>  * FM packet from ST driver.
>>  */
>> -static void recv_tasklet(struct tasklet_struct *t)
>> +static void recv_work(struct work_struct *t)
>> {
>> 	struct fmdev *fmdev;
>> 	struct fm_irq *irq_info;
>> @@ -256,7 +257,7 @@ static void recv_tasklet(struct tasklet_struct =
*t)
>> 	u8 num_fm_hci_cmds;
>> 	unsigned long flags;
>>=20
>> -	fmdev =3D from_tasklet(fmdev, t, tx_task);
>> +	fmdev =3D from_work(fmdev, t, tx_task);
>> 	irq_info =3D &fmdev->irq_info;
>> 	/* Process all packets in the RX queue */
>> 	while ((skb =3D skb_dequeue(&fmdev->rx_q))) {
>> @@ -322,22 +323,22 @@ static void recv_tasklet(struct tasklet_struct =
*t)
>>=20
>> 		/*
>> 		 * Check flow control field. If Num_FM_HCI_Commands =
field is
>> -		 * not zero, schedule FM TX tasklet.
>> +		 * not zero, schedule FM TX work.
>> 		 */
>> 		if (num_fm_hci_cmds && atomic_read(&fmdev->tx_cnt))
>> 			if (!skb_queue_empty(&fmdev->tx_q))
>> -				tasklet_schedule(&fmdev->tx_task);
>> +				queue_work(system_bh_wq, =
&fmdev->tx_task);
>> 	}
>> }
>>=20
>> -/* FM send tasklet: is scheduled when FM packet has to be sent to =
chip */
>> -static void send_tasklet(struct tasklet_struct *t)
>> +/* FM send work: is scheduled when FM packet has to be sent to chip =
*/
>> +static void send_work(struct work_struct *t)
>> {
>> 	struct fmdev *fmdev;
>> 	struct sk_buff *skb;
>> 	int len;
>>=20
>> -	fmdev =3D from_tasklet(fmdev, t, tx_task);
>> +	fmdev =3D from_work(fmdev, t, tx_task);
>>=20
>> 	if (!atomic_read(&fmdev->tx_cnt))
>> 		return;
>> @@ -366,7 +367,7 @@ static void send_tasklet(struct tasklet_struct =
*t)
>> 	if (len < 0) {
>> 		kfree_skb(skb);
>> 		fmdev->resp_comp =3D NULL;
>> -		fmerr("TX tasklet failed to send skb(%p)\n", skb);
>> +		fmerr("TX work failed to send skb(%p)\n", skb);
>> 		atomic_set(&fmdev->tx_cnt, 1);
>> 	} else {
>> 		fmdev->last_tx_jiffies =3D jiffies;
>> @@ -374,7 +375,7 @@ static void send_tasklet(struct tasklet_struct =
*t)
>> }
>>=20
>> /*
>> - * Queues FM Channel-8 packet to FM TX queue and schedules FM TX =
tasklet for
>> + * Queues FM Channel-8 packet to FM TX queue and schedules FM TX =
work for
>>  * transmission
>>  */
>> static int fm_send_cmd(struct fmdev *fmdev, u8 fm_op, u16 type,	=
void *payload,
>> @@ -440,7 +441,7 @@ static int fm_send_cmd(struct fmdev *fmdev, u8 =
fm_op, u16 type,	void *payload,
>>=20
>> 	fm_cb(skb)->completion =3D wait_completion;
>> 	skb_queue_tail(&fmdev->tx_q, skb);
>> -	tasklet_schedule(&fmdev->tx_task);
>> +	queue_work(system_bh_wq, &fmdev->tx_task);
>>=20
>> 	return 0;
>> }
>> @@ -462,7 +463,7 @@ int fmc_send_cmd(struct fmdev *fmdev, u8 fm_op, =
u16 type, void *payload,
>>=20
>> 	if (!wait_for_completion_timeout(&fmdev->maintask_comp,
>> 					 FM_DRV_TX_TIMEOUT)) {
>> -		fmerr("Timeout(%d sec),didn't get regcompletion signal =
from RX tasklet\n",
>> +		fmerr("Timeout(%d sec),didn't get regcompletion signal =
from RX work\n",
>> 			   jiffies_to_msecs(FM_DRV_TX_TIMEOUT) / 1000);
>> 		return -ETIMEDOUT;
>> 	}
>> @@ -1455,7 +1456,7 @@ static long fm_st_receive(void *arg, struct =
sk_buff *skb)
>>=20
>> 	memcpy(skb_push(skb, 1), &skb->cb[0], 1);
>> 	skb_queue_tail(&fmdev->rx_q, skb);
>> -	tasklet_schedule(&fmdev->rx_task);
>> +	queue_work(system_bh_wq, &fmdev->rx_task);
>>=20
>> 	return 0;
>> }
>> @@ -1537,13 +1538,13 @@ int fmc_prepare(struct fmdev *fmdev)
>> 	spin_lock_init(&fmdev->rds_buff_lock);
>> 	spin_lock_init(&fmdev->resp_skb_lock);
>>=20
>> -	/* Initialize TX queue and TX tasklet */
>> +	/* Initialize TX queue and TX work */
>> 	skb_queue_head_init(&fmdev->tx_q);
>> -	tasklet_setup(&fmdev->tx_task, send_tasklet);
>> +	INIT_WORK(&fmdev->tx_task, send_work);
>>=20
>> -	/* Initialize RX Queue and RX tasklet */
>> +	/* Initialize RX Queue and RX work */
>> 	skb_queue_head_init(&fmdev->rx_q);
>> -	tasklet_setup(&fmdev->rx_task, recv_tasklet);
>> +	INIT_WORK(&fmdev->rx_task, recv_work);
>>=20
>> 	fmdev->irq_info.stage =3D 0;
>> 	atomic_set(&fmdev->tx_cnt, 1);
>> @@ -1589,8 +1590,8 @@ int fmc_release(struct fmdev *fmdev)
>> 	/* Service pending read */
>> 	wake_up_interruptible(&fmdev->rx.rds.read_queue);
>>=20
>> -	tasklet_kill(&fmdev->tx_task);
>> -	tasklet_kill(&fmdev->rx_task);
>> +	cancel_work_sync(&fmdev->tx_task);
>> +	cancel_work_sync(&fmdev->rx_task);
>>=20
>> 	skb_queue_purge(&fmdev->tx_q);
>> 	skb_queue_purge(&fmdev->rx_q);
>> diff --git a/drivers/media/rc/mceusb.c b/drivers/media/rc/mceusb.c
>> index c76ba24c1f55..a2e2e58b7506 100644
>> --- a/drivers/media/rc/mceusb.c
>> +++ b/drivers/media/rc/mceusb.c
>> @@ -774,7 +774,7 @@ static void mceusb_dev_printdata(struct =
mceusb_dev *ir, u8 *buf, int buf_len,
>>=20
>> /*
>>  * Schedule work that can't be done in interrupt handlers
>> - * (mceusb_dev_recv() and mce_write_callback()) nor tasklets.
>> + * (mceusb_dev_recv() and mce_write_callback()) nor works.
>>  * Invokes mceusb_deferred_kevent() for recovering from
>>  * error events specified by the kevent bit field.
>>  */
>> diff --git a/drivers/media/usb/ttusb-dec/ttusb_dec.c =
b/drivers/media/usb/ttusb-dec/ttusb_dec.c
>> index 79faa2560613..55eeb00f1126 100644
>> --- a/drivers/media/usb/ttusb-dec/ttusb_dec.c
>> +++ b/drivers/media/usb/ttusb-dec/ttusb_dec.c
>> @@ -19,6 +19,7 @@
>> #include <linux/input.h>
>>=20
>> #include <linux/mutex.h>
>> +#include <linux/workqueue.h>
>>=20
>> #include <media/dmxdev.h>
>> #include <media/dvb_demux.h>
>> @@ -139,7 +140,7 @@ struct ttusb_dec {
>> 	int			v_pes_postbytes;
>>=20
>> 	struct list_head	urb_frame_list;
>> -	struct tasklet_struct	urb_tasklet;
>> +	struct work_struct 	urb_work;
>> 	spinlock_t		urb_frame_list_lock;
>>=20
>> 	struct dvb_demux_filter	*audio_filter;
>> @@ -766,9 +767,9 @@ static void ttusb_dec_process_urb_frame(struct =
ttusb_dec *dec, u8 *b,
>> 	}
>> }
>>=20
>> -static void ttusb_dec_process_urb_frame_list(struct tasklet_struct =
*t)
>> +static void ttusb_dec_process_urb_frame_list(struct work_struct *t)
>> {
>> -	struct ttusb_dec *dec =3D from_tasklet(dec, t, urb_tasklet);
>> +	struct ttusb_dec *dec =3D from_work(dec, t, urb_work);
>> 	struct list_head *item;
>> 	struct urb_frame *frame;
>> 	unsigned long flags;
>> @@ -822,7 +823,7 @@ static void ttusb_dec_process_urb(struct urb =
*urb)
>> 				=
spin_unlock_irqrestore(&dec->urb_frame_list_lock,
>> 						       flags);
>>=20
>> -				tasklet_schedule(&dec->urb_tasklet);
>> +				queue_work(system_bh_wq, =
&dec->urb_work);
>> 			}
>> 		}
>> 	} else {
>> @@ -1198,11 +1199,11 @@ static int ttusb_dec_alloc_iso_urbs(struct =
ttusb_dec *dec)
>> 	return 0;
>> }
>>=20
>> -static void ttusb_dec_init_tasklet(struct ttusb_dec *dec)
>> +static void ttusb_dec_init_work(struct ttusb_dec *dec)
>> {
>> 	spin_lock_init(&dec->urb_frame_list_lock);
>> 	INIT_LIST_HEAD(&dec->urb_frame_list);
>> -	tasklet_setup(&dec->urb_tasklet, =
ttusb_dec_process_urb_frame_list);
>> +	INIT_WORK(&dec->urb_work, ttusb_dec_process_urb_frame_list);
>> }
>>=20
>> static int ttusb_init_rc( struct ttusb_dec *dec)
>> @@ -1588,12 +1589,12 @@ static void ttusb_dec_exit_usb(struct =
ttusb_dec *dec)
>> 	ttusb_dec_free_iso_urbs(dec);
>> }
>>=20
>> -static void ttusb_dec_exit_tasklet(struct ttusb_dec *dec)
>> +static void ttusb_dec_exit_work(struct ttusb_dec *dec)
>> {
>> 	struct list_head *item;
>> 	struct urb_frame *frame;
>>=20
>> -	tasklet_kill(&dec->urb_tasklet);
>> +	cancel_work_sync(&dec->urb_work);
>>=20
>> 	while ((item =3D dec->urb_frame_list.next) !=3D =
&dec->urb_frame_list) {
>> 		frame =3D list_entry(item, struct urb_frame, =
urb_frame_list);
>> @@ -1703,7 +1704,7 @@ static int ttusb_dec_probe(struct usb_interface =
*intf,
>>=20
>> 	ttusb_dec_init_v_pes(dec);
>> 	ttusb_dec_init_filters(dec);
>> -	ttusb_dec_init_tasklet(dec);
>> +	ttusb_dec_init_work(dec);
>>=20
>> 	dec->active =3D 1;
>>=20
>> @@ -1729,7 +1730,7 @@ static void ttusb_dec_disconnect(struct =
usb_interface *intf)
>> 	dprintk("%s\n", __func__);
>>=20
>> 	if (dec->active) {
>> -		ttusb_dec_exit_tasklet(dec);
>> +		ttusb_dec_exit_work(dec);
>> 		ttusb_dec_exit_filters(dec);
>> 		if(enable_rc)
>> 			ttusb_dec_exit_rc(dec);


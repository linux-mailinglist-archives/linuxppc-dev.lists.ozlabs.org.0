Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FA48FA582
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 00:25:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=arwB9k2c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtSwF1Yq1z3d2W
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 08:25:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=arwB9k2c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VtLGf3dVJz3cc0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 03:25:46 +1000 (AEST)
Received: from smtpclient.apple (d66-183-91-182.bchsia.telus.net [66.183.91.182])
	by linux.microsoft.com (Postfix) with ESMTPSA id 4684920681D5;
	Mon,  3 Jun 2024 10:25:13 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 4684920681D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1717435514;
	bh=4DfOU8aQl0aDoujS+l1W8I9cPbB9Sd5aNNyJFDGp/QQ=;
	h=Subject:From:In-Reply-To:Date:Cc:References:To:From;
	b=arwB9k2cp5qmOpH04JZQJkpaQ68dKr6NHq6/nWjIeKTEglSLJZbHneTkxRo0iYye3
	 dopPLk66Mp6Cqqtct/3LWOtVyWSXCVY5VMtnmDbdTLbXrzM1H6t1A8KCeQ5Sp+gzGS
	 Acr7rY4qAUIDkO+vSD/92kHIH7AgZovgYBJ1BnFc=
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.600.62\))
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
From: Allen Pais <apais@linux.microsoft.com>
In-Reply-To: <7e618af0-51a7-4941-a386-0ac68c66d358@microchip.com>
Date: Mon, 3 Jun 2024 10:25:02 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <61F36002-C765-410C-8EF9-203593C269FF@linux.microsoft.com>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com>
 <7e618af0-51a7-4941-a386-0ac68c66d358@microchip.com>
To: Aubin Constans <aubin.constans@microchip.com>
X-Mailer: Apple Mail (2.3774.600.62)
X-Mailman-Approved-At: Tue, 04 Jun 2024 08:23:56 +1000
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, Paul Cercueil <paul@crapouillou.net>, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, Robert Jarzmik <robert.jarzmik@free.fr>, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, Viresh Kumar <vireshk@kernel.org>, jassisinghbrar@gmail.com, decui@microsoft.com, Zhou Wang <wangzhou1@hisilicon.com>, =?utf-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>, jh80.chung@samsung.com, zw@zh-kernel.org, Chen-Yu Tsai <wens@csie.org>, stern@rowland.harvar
 d.edu, linux-arm-msm@vger.kernel.org, Orson Zhai <orsonzhai@gmail.com>, pierre@ossman.eu, linux-mips@vger.kernel.org, Eugeniy.Paltsev@synopsys.com, Patrice CHOTARD <patrice.chotard@foss.st.com>, asahi@lists.linux.dev, brucechang@via.com.tw, Kees Cook <keescook@chromium.org>, oakad@yahoo.com, sven@svenpeter.dev, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, Haojian Zhuang <haojian.zhuang@gmail.com>, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, Matthias Brugger <matthias.bgg@gmail.com>, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, Scott Branden <sbranden@broadcom.com>, Logan Gunthorpe <logang@deltatee.com>, andersson@kernel.org, marcan@marcan.st, haiyangz@mic
 rosoft.com, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Leo Li <leoyang.li@nxp.com>, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, Vinod Koul <vkoul@kernel.org>, linux-s390@vger.kernel.org, mhiramat@kernel.org, Lyra Zhang <zhang.lyra@gmail.com>, Tejun Heo <tj@kernel.org>, manuel.lauss@gmail.com, linux-media@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>, =?utf-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, Daniel Mack <daniel@zonque.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jun 3, 2024, at 5:38=E2=80=AFAM, Aubin Constans =
<aubin.constans@microchip.com> wrote:
>=20
> On 27/03/2024 17:03, Allen Pais wrote:
>> EXTERNAL EMAIL: Do not click links or open attachments unless you =
know the content is safe
>> The only generic interface to execute asynchronously in the BH =
context is
>> tasklet; however, it's marked deprecated and has some design flaws. =
To
>> replace tasklets, BH workqueue support was recently added. A BH =
workqueue
>> behaves similarly to regular workqueues except that the queued work =
items
>> are executed in the BH context.
>> This patch converts drivers/infiniband/* from tasklet to BH =
workqueue.
>> Based on the work done by Tejun Heo <tj@kernel.org>
>> Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git =
for-6.10
>> Signed-off-by: Allen Pais <allen.lkml@gmail.com>
>> ---
>>  drivers/mmc/host/atmel-mci.c                  | 35 ++++-----
> [...]
>=20
> For atmel-mci, judging from a few simple tests, performance is =
preserved.
> E.g. writing to a SD Card on the SAMA5D3-Xplained board:
> time dd if=3D/dev/zero of=3D/opt/_del_me bs=3D4k count=3D64k
>=20
>     Base 6.9.0 : 0.07user 5.05system 0:18.92elapsed 27%CPU
>  Patched 6.9.0+: 0.12user 4.92system 0:18.76elapsed 26%CPU
>=20
> However, please resolve what checkpatch is complaining about:
> scripts/checkpatch.pl --strict =
PATCH-9-9-mmc-Convert-from-tasklet-to-BH-workqueue.mbox
>=20
>  WARNING: please, no space before tabs
>  #72: FILE: drivers/mmc/host/atmel-mci.c:367:
>  +^Istruct work_struct ^Iwork;$
>=20
> Same as discussions on the USB patch[1] and others in this series, I =
am also in favour of "workqueue" or similar in the comments, rather than =
just "work".

 Will send out a new version.

Thank you very much for testing and providing your review.

- Allen

>=20
> Apart from that:
> Tested-by: Aubin Constans <aubin.constans@microchip.com>
> Acked-by: Aubin Constans <aubin.constans@microchip.com>
>=20
> Thanks.
>=20
> [1]: =
https://lore.kernel.org/linux-mmc/CAOMdWSLipPfm3OZTpjZz4uF4M+E_8QAoTeMcKBX=
awLnkTQx6Jg@mail.gmail.com/


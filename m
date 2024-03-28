Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37086890CC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 22:58:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JHsl3GfQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5HV81913z3vjD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JHsl3GfQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::932; helo=mail-ua1-x932.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x932.google.com (mail-ua1-x932.google.com [IPv6:2607:f8b0:4864:20::932])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V59wV4w83z3vd5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 04:47:21 +1100 (AEDT)
Received: by mail-ua1-x932.google.com with SMTP id a1e0cc1a2514c-7e31fd5553dso215034241.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 10:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648038; x=1712252838; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WOul4usuPisehHXyQcZLwgce2H6JwRccYEaJQWtP1Jo=;
        b=JHsl3GfQncpm6gpTdk8jEzHmOyES+gJPddNu9a/6GvVwHjBM+l4fICITCbICw96dZu
         quzIMXidLtbceIZbl2HVsv+VQynftT1EuAvSOrf+Qqvz3p5odnSZ7fsM668wH7ht3Wtp
         UD4WYLPFBxB7O/eMOkF7eeSCZBkvYSl9xVUKbenFvAapMoz/o3oHGlJkcSdyg63+n3IT
         W2ks7PT5Ys5U9IuKj0PJzQNkgwSaWKMrT/+XaYE/QaD8xHS9mCXdzMS6QEwaU8ByrMtX
         rgbcaKyD3SXMbygR8urCs2AFYz+07mmA6pAEmvPG2+zh8IQHQm9pqpg5CqlohS4qbAp/
         0PbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648038; x=1712252838;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WOul4usuPisehHXyQcZLwgce2H6JwRccYEaJQWtP1Jo=;
        b=j28ORgtUI4kZhctyrHtXv20BKAN3kFFEkWw2xAZ2rjod4etr9k9+o53jcdM1XWKnQq
         h38mO3fGc1rjKkW/7vSC/fHotnTzPPh3H8bkqMp9O1YD4BnbISKR0KOntisf0y7wGFmr
         RCASz6NPlX2+7K9YO1Mj0/h6IMbsTc9QSHRrxOYPHdG7OxvmnsfMFqXtDgvV40cqAjQv
         cG8hmdXrL1DwgaBo+qzwOoxbx+nIqbtmbrIJ9CpG61pTp5/JLrwbn6UGqJytMSSnAS5D
         eaQhmloKhb0qzfuSWOck/cvx2+0o4OkY3J4WlUwbkG53xvWPb61gwBVqPQ33RWti35Jk
         nfZA==
X-Forwarded-Encrypted: i=1; AJvYcCW0Qa+Hx8rD7nPeALGLYwdxlblGFsFSdag9CpjF3qladekKNKgW0NHXgqBmaHFRRGzuOGzH+xMCveIsBB+nzqFL8fvpylfKx/v3NX2AAg==
X-Gm-Message-State: AOJu0YwZM1AFvKV5ttVpOU+b/d5SfMOP7tSeWYlMWTxfv//WngWMn4Ax
	V6+o9rr7zK8EoZt8jurR0BO6/Yl9Iz8AD72kFsjoyGXjcuMYL4bf/bva4BdY1msLOlJbOA3lizT
	3Edu0y5OLzShPolL480ZtchOgNdA=
X-Google-Smtp-Source: AGHT+IHhsrATdsPlGDNfn/hR7BQXc3o4d86Rd7NcYHBOy9LUQjNRQoJ0rDqs8OMJuSA4Qyiba22Ugt9rz6m/+ouyIBc=
X-Received: by 2002:a67:f7c6:0:b0:476:fbbb:14bc with SMTP id
 a6-20020a67f7c6000000b00476fbbb14bcmr3836850vsp.30.1711648038557; Thu, 28 Mar
 2024 10:47:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-10-apais@linux.microsoft.com> <9c31b697-3d80-407a-82b3-cfbb19fafb31@arm.com>
In-Reply-To: <9c31b697-3d80-407a-82b3-cfbb19fafb31@arm.com>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:47:06 -0700
Message-ID: <CAOMdWSL9GUkoOOX4LNwMOV24-8xnmFKep15xj8NnmnBss-RYAQ@mail.gmail.com>
Subject: Re: [PATCH 9/9] mmc: Convert from tasklet to BH workqueue
To: Christian Loehle <christian.loehle@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Fri, 29 Mar 2024 08:57:06 +1100
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
 rnel.org, Eugeniy.Paltsev@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com,
  tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 28, 2024 at 3:16=E2=80=AFAM Christian Loehle
<christian.loehle@arm.com> wrote:
>
> On 27/03/2024 16:03, Allen Pais wrote:
> > The only generic interface to execute asynchronously in the BH context =
is
> > tasklet; however, it's marked deprecated and has some design flaws. To
> > replace tasklets, BH workqueue support was recently added. A BH workque=
ue
> > behaves similarly to regular workqueues except that the queued work ite=
ms
> > are executed in the BH context.
> >
> > This patch converts drivers/infiniband/* from tasklet to BH workqueue.
> s/infiniband/mmc

Will fix it in v2.
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6=
.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/mmc/host/atmel-mci.c                  | 35 ++++-----
> >  drivers/mmc/host/au1xmmc.c                    | 37 ++++-----
> >  drivers/mmc/host/cb710-mmc.c                  | 15 ++--
> >  drivers/mmc/host/cb710-mmc.h                  |  3 +-
> >  drivers/mmc/host/dw_mmc.c                     | 25 ++++---
> >  drivers/mmc/host/dw_mmc.h                     |  9 ++-
> For dw_mmc:
> Performance numbers look good FWIW.
> for i in $(seq 0 5); do echo performance > /sys/devices/system/cpu/cpu$i/=
cpufreq/scaling_governor; done
> for i in $(seq 0 4); do fio --name=3Dtest --rw=3Drandread --bs=3D4k --run=
time=3D30 --time_based --filename=3D/dev/mmcblk1 --minimal --numjobs=3D6 --=
iodepth=3D32 --group_reporting | awk -F ";" '{print $8}'; sleep 30; done
> Baseline:
> 1758
> 1773
> 1619
> 1835
> 1639
> to:
> 1743
> 1643
> 1860
> 1638
> 1872
> (I'd call that equivalent).
> This is on a RK3399.
> I would prefer most of the naming to change from "work" to "workqueue" in=
 the driver
> code.
> Apart from that:
> Reviewed-by: Christian Loehle <christian.loehle@arm.com>
> Tested-by: Christian Loehle <christian.loehle@arm.com>

 Thank you very much for testing and the review. Will have your
concerns addressed in v2.

- Allen

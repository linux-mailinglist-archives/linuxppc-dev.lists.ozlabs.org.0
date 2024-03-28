Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF488890CE8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 23:05:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ka93sj2J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5HfS4hDJz3w7K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 09:05:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ka93sj2J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92d; helo=mail-ua1-x92d.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92d.google.com (mail-ua1-x92d.google.com [IPv6:2607:f8b0:4864:20::92d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5DrT1v4Nz3cnv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 06:59:03 +1100 (AEDT)
Received: by mail-ua1-x92d.google.com with SMTP id a1e0cc1a2514c-7e101b8fed9so336111241.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 12:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711655940; x=1712260740; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vnKBKhBKsmsJMY/bC4lZDp0UO96Fq//Yoyy126bkPGI=;
        b=ka93sj2JlIZTb/3lZ44JUI0mw0HWIRAIQ6USM0YlkkZ+9/p2wU0vMCrzhj2/tAqTqD
         P47+fGv1FGkQeMJkiSG2uLgnDFrwOxRahN8OF5MucNSbkBE6ohfJiAB+9D+POXkT5BAJ
         cLm9BLzHyIRuAzgS39AxSFsgS/TpoTaJDGhENBlKntvYmhxYEaqz9A0NFLl5hz5ozbz1
         rKEJyjfq26gJtvT238W4MHAjTlERZBBuJ0aPbcfgvmki9Gsv4T+Dchl+6CsnS/JnyMi4
         EcMKQahIXrgTsKpZxk7qDD1XmS7Fmp70MrCZgdrERIryW6vd34O/DewIbvZ6jWUrXy3R
         CtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655940; x=1712260740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vnKBKhBKsmsJMY/bC4lZDp0UO96Fq//Yoyy126bkPGI=;
        b=JEKvbwKsk/XCYR6oyreHWhxwS7/3+G80904O+eQqIIBbCOLY5Ai4MZabfNtfBWtraa
         S5FYtLVeGMyAhJi+jU48CkFA2lvT+CI1lPlpTO0K+UHLIeAf2iFicLoPnHJt4jOrMaIX
         LJiTaiVrHPjj6CVzLttJwL/IXeESwCZFCOqdCo/H9w0DLj/jMtjCXcTlN0c0innid18w
         i5dEOWlaQQezWcAVOOA+KpYC9Ts10I57VTxrGkJm4YKXQc8rZ3PpeR3XAkfRGmkESGsk
         Or7U6WPM9usU5mC1vNurp9+8qYI5qFI4Ff9sbzgFtxw9K5jePMFqIOPh17FcAtCUEMwG
         BKsA==
X-Forwarded-Encrypted: i=1; AJvYcCXcUI9D7RajghpmHV+7Hj4qUeaSLntZk0DqQWO/49lGVa0oep1S0La2VoScbBZtVqi6KzZF2kXMr2U8FWo0pKPikc3Ih9lZh/+uzV8e5g==
X-Gm-Message-State: AOJu0Ywr/IKy9d7rKud/LYWpYkbJxY91q7LN/snobM2uYiCsexloE4Kx
	6dTja6+EKiyIKs7BpqoAHL9KekO+WC6DLb+RTc0knxcd/T0fyxTx9Bbg3Vgy6x7/ajUq1p3G97w
	oPK//R9luN6CWx+LXLAijcB3YZ4c=
X-Google-Smtp-Source: AGHT+IEsqiTQ+RuhLXyb/Y+jV0DgOZDtp/0zVM9owKFV3xn7f9aoxOYdP+JeSKGOIKqBlapOYOkCUtaaLw32MikZSqo=
X-Received: by 2002:a05:6102:2a65:b0:476:cf52:e1b7 with SMTP id
 hp5-20020a0561022a6500b00476cf52e1b7mr141814vsb.28.1711655940207; Thu, 28 Mar
 2024 12:59:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com> <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
 <ZgXDmx1HvujsMYAR@mail.minyard.net> <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
 <ZgXKeL36ckOyNpI/@mail.minyard.net>
In-Reply-To: <ZgXKeL36ckOyNpI/@mail.minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 12:58:49 -0700
Message-ID: <CAOMdWS+KrT2dK0XiEkZJT0aHnre1sr6gMMSkdxuXZaUh5e2e8Q@mail.gmail.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
To: minyard@acm.org
Content-Type: text/plain; charset="UTF-8"
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

> > > >
> > > >   Fair point. Could you please let me know once you have had a chance to test
> > > > these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> > > > workqueue.
> > > >
> > > >  Thanks for taking time out to review.
> > >
> > > After looking and thinking about it a bit, a BH context is still
> > > probably the best for this.
> > >
> > > I have tested this patch under load and various scenarios and it seems
> > > to work ok.  So:
> > >
> > > Tested-by: Corey Minyard <cminyard@mvista.com>
> > > Acked-by: Corey Minyard <cminyard@mvista.com>
> > >
> > > Or I can take this into my tree.
> > >
> > > -corey
> >
> >  Thank you very much. I think it should be okay for you to carry it into
> > your tree.
>
> Ok, it's in my for-next tree.  I fixed the directory reference, and I
> changed all the comments where you changed "tasklet" to "work" to
> instead say "workqueue".
>

 Thank you very much for fixing it.

- Allen

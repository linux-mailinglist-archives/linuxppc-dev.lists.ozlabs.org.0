Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D427890CDA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 23:03:26 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RJnym7h9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5Hbw1QJVz3vj6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 09:03:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RJnym7h9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::a29; helo=mail-vk1-xa29.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-vk1-xa29.google.com (mail-vk1-xa29.google.com [IPv6:2607:f8b0:4864:20::a29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5DSK1XNrz3vb3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 06:41:36 +1100 (AEDT)
Received: by mail-vk1-xa29.google.com with SMTP id 71dfb90a1353d-4d47000f875so504708e0c.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 12:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711654894; x=1712259694; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WIYRUJlYf8k4Ww5l6bxXyNzs1Z7gSD0K+4rAhlyLzPk=;
        b=RJnym7h9cq5DKBH2ru3mFlJJHRx/XH9ZmwWZ/o2Xc72qCkLhAsxycxHam7HpxsJhKu
         RVFfeshgDnzoRv7epMy7nY6G7tE/Z9N+YBW/iWMZ3PaOfqV4srXA9AVXlbblcrybIlsg
         nEu3em85FTylQBuPADGaP38hs4tTeoH0zbtSVbQnRGd/4dv1/P+FS10FGh7tuF74N3uH
         D65x9qN9e5zHcMZzN6JRbQ01ZidzZFHPcRpvSLbDxHQs6733bmi4KSEYkqyuQPdQnZ6Q
         YuT6frYzndlHvIv/WScxm84HQwF8W0kDItYu36E2vPgvyCo2uPAH136zZV7OYB205uhI
         ++mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711654894; x=1712259694;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WIYRUJlYf8k4Ww5l6bxXyNzs1Z7gSD0K+4rAhlyLzPk=;
        b=IQxTslFvvE5ei2/SD+YBtTspacQM10pwdSkEjG58rA5MRjn03prv1TN+CQJTrWiXJX
         HvR2Gu/oqevrmSRMpEpHjlkNlRCmDtCzNZg8nLuePBU4HV8peVpSk0uKXnzF96rtdOUq
         N+P7DxAzVApq5ScjYlZ+B8c3UE1BPqBEIlZQoH+1O8C1TqOs65aduP6H66df7BsZR5i9
         Nik9jRjuGSqdNMRmr5bYIh3WiXD43LEz2EqlI/PBsr+yuFaoXf78cvwDiw4kSpB+ur7p
         yEsrwhXbJUZGBNExZm33kfXHqTBOECoVeuhXpAOsNVyHVlBHFDaFIG16yw79aAljlyHo
         /guw==
X-Forwarded-Encrypted: i=1; AJvYcCWj9ae20V0R/C3s8a+OTW9TmjQcbbbJ6qxJjQgRvZuva+u0rf9yVKumFQGHPIBOCuz6JNMCvROraXufngiJSOnGJDfY6UFjKSuQD+zXvw==
X-Gm-Message-State: AOJu0YzpvZR6/zF9IHctBHxrKyG4Q9GFdPpJ6GCo/9yG1er2BNUsLFMZ
	tI9YnqX6GCjLwbmhZAW8LKDrPoZ6ThPXu9gjre37ShqovLJb6E/NLQR1aKGtprEZ8t6WLO5ay/G
	K8/39xAoc44MKwMKeRdP71GjU7Cg=
X-Google-Smtp-Source: AGHT+IF7RrkP6jmtYq8PnUCxuTgzt2Qt4CTC9MlCAHIq165hbFM88DzkJJ/z4aTnoTdb1soUmIZQWdyI4gYKg4Ogr2U=
X-Received: by 2002:a1f:ebc2:0:b0:4d3:43f8:8541 with SMTP id
 j185-20020a1febc2000000b004d343f88541mr348710vkh.1.1711654893631; Thu, 28 Mar
 2024 12:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com> <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com> <ZgXDmx1HvujsMYAR@mail.minyard.net>
In-Reply-To: <ZgXDmx1HvujsMYAR@mail.minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 12:41:22 -0700
Message-ID: <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
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

> > > I believe that work queues items are execute single-threaded for a work
> > > queue, so this should be good.  I need to test this, though.  It may be
> > > that an IPMI device can have its own work queue; it may not be important
> > > to run it in bh context.
> >
> >   Fair point. Could you please let me know once you have had a chance to test
> > these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> > workqueue.
> >
> >  Thanks for taking time out to review.
>
> After looking and thinking about it a bit, a BH context is still
> probably the best for this.
>
> I have tested this patch under load and various scenarios and it seems
> to work ok.  So:
>
> Tested-by: Corey Minyard <cminyard@mvista.com>
> Acked-by: Corey Minyard <cminyard@mvista.com>
>
> Or I can take this into my tree.
>
> -corey

 Thank you very much. I think it should be okay for you to carry it into
your tree.

- Allen

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4E9890CE4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 23:04:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TAU65O3r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5Hdd1QQTz3vnD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 09:04:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=TAU65O3r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::334; helo=mail-ot1-x334.google.com; envelope-from=tcminyard@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5Dhv2lRKz3cDw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 06:52:29 +1100 (AEDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6e6e3eadec8so681306a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 12:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711655547; x=1712260347; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YT6C4kyGaXJTnO4s5bmEmPWYlNQPKErlDo5CuGDxbV8=;
        b=TAU65O3re3lGZpzFyZfAmXTDd0kEWchDR0bsVpy4/GsK3Eu+W1s5tyAmqdWFj9vl3V
         QvGbByV9dNM1mcX8JA98aZpkjEj2qcLvFAbK6w0jw9odJ3vdnjEzCiYtlrC8nXZ3fLnM
         EJq51vu1BYIT64axz6HI3Fvi9kwZ7q6YlaDXKA1hR+oToyT5yqHwYuWt/Kby+Vdmq/Hj
         zvrhMpD8K0ektQYgUg6GW8aY5xUYrZYzGE393fblPx4Yg1eKDHCEnKjsua19rDyqBrnw
         U/6a65LB4e7dPWib14TVxKdDmDSc/FIoCOgLtiUfztK/1JjdXxcJwHveysVWzo0qJZJz
         BPJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711655547; x=1712260347;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YT6C4kyGaXJTnO4s5bmEmPWYlNQPKErlDo5CuGDxbV8=;
        b=Z0GWZJovGwZ+g082zBQqZTJNOV51RPJV5KnboCZcq2qhlXuaOk27ABiMwYrEmIsCfi
         wmMalP5xy1gGbq77MbiVMNlG0dWC7w/i2BN+JlUEObP903h6r8fcJiIf9ElmgYEjO62+
         Rj0xT1ImWFwPElpTBa2AV0DykYVVIkulKtUBD+QGWM1oJtrwHX5rvZcNfcyKc4JILJsq
         CqPMlAmGDoXQU0TWJrfy5Y9vTnzjpygn85jZogersjKMHBsZ244SEuN+A3OE9/GX1XL4
         ZhYaRufcrZtC/5xbbKweTeJr68yVbzvnr8LQaw2u51tofPqbs2u50fk60r5hFii8htkw
         YGkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWyaj/i+T/6z3opNDzqx0yRvULYg8AA21WjNpMx+Xh1PryIZ9efNxPf8Snsb5Dib9ib84gWfgj4fdpk4moz1c9njQFa+uChQDzFIWonpQ==
X-Gm-Message-State: AOJu0Yx9NF80hgRLRzxt5Ef7c43f06EaRUmzZperrOedW72eXUPQ3lpG
	k+tYtdLzL9LHAIxBQ2ceS9PbXmYkHI1izKgqdnVXt0FQ40fJ2z8=
X-Google-Smtp-Source: AGHT+IHzO114l0NerWSB89S0FuZIWvU872Dx5hTOnZas2urBgE80eNZxB2BV9A8JCj8+LYtYL67EKw==
X-Received: by 2002:a05:6870:3513:b0:22a:8e5:941 with SMTP id k19-20020a056870351300b0022a08e50941mr177999oah.52.1711655546921;
        Thu, 28 Mar 2024 12:52:26 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id pd12-20020a0568717a8c00b00229f94bf403sm536320oac.19.2024.03.28.12.52.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 12:52:26 -0700 (PDT)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:b987:69e:202a:697a])
	by serve.minyard.net (Postfix) with ESMTPSA id 4B51A180059;
	Thu, 28 Mar 2024 19:52:25 +0000 (UTC)
Date: Thu, 28 Mar 2024 14:52:24 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen <allen.lkml@gmail.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
Message-ID: <ZgXKeL36ckOyNpI/@mail.minyard.net>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
 <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
 <ZgXDmx1HvujsMYAR@mail.minyard.net>
 <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMdWS+nB5EENp_Vb=k1j77nrch5JgbZP2XYPJ2ieTja14zB0w@mail.gmail.com>
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
Reply-To: minyard@acm.org
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, linux-usb@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-mips@vger.ke
 rnel.org, Eugeniy.Paltsev@synopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, Allen Pais <apais@linux.microsoft.com>, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-kernel@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com,
  tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.kernel.org, shawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 28, 2024 at 12:41:22PM -0700, Allen wrote:
> > > > I believe that work queues items are execute single-threaded for a work
> > > > queue, so this should be good.  I need to test this, though.  It may be
> > > > that an IPMI device can have its own work queue; it may not be important
> > > > to run it in bh context.
> > >
> > >   Fair point. Could you please let me know once you have had a chance to test
> > > these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> > > workqueue.
> > >
> > >  Thanks for taking time out to review.
> >
> > After looking and thinking about it a bit, a BH context is still
> > probably the best for this.
> >
> > I have tested this patch under load and various scenarios and it seems
> > to work ok.  So:
> >
> > Tested-by: Corey Minyard <cminyard@mvista.com>
> > Acked-by: Corey Minyard <cminyard@mvista.com>
> >
> > Or I can take this into my tree.
> >
> > -corey
> 
>  Thank you very much. I think it should be okay for you to carry it into
> your tree.

Ok, it's in my for-next tree.  I fixed the directory reference, and I
changed all the comments where you changed "tasklet" to "work" to
instead say "workqueue".

-corey

> 
> - Allen
> 

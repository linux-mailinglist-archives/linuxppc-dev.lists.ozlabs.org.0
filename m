Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC4F890CD7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 23:01:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j4FXLQ5r;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5HZC6bmVz3vnm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 09:01:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j4FXLQ5r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=tcminyard@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5D38552nz3vYc
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 06:23:15 +1100 (AEDT)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6e6a9e2e2b6so731385a34.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 12:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711653790; x=1712258590; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=GyFGSwdDS+8X5fWOjo2s+K1AMkRQoOt7S254R+rI76g=;
        b=j4FXLQ5rIXctk7e2afNpLSyqc9E59ThTzz1QYD7ZN1ypHbx+ZRSOPQbtlT2EMn+WhY
         wITYe20XpTcA4cyd2Byd9kh6wkfeAwuP+swxhBGXgLUMxjNwqk2jfpi65JW5Cbp3RlLr
         4MuQz5B+nAlMc/q8V7Ice/FNWPkT0Nq9Zsc6oEMl8pFHEh7mfzihDHuf65gFYx80M4ec
         3jtk4TcfdaE86o3NBgdsGMn7JevLj4kVkTohnPjhZGb+CrJznUdeoxOmpFcaRHmIJ7lW
         ZM79IKdDBjxoX4/ADEEmCPXcONYyC7SxYRKOT45W4onKDDmJsVeN14fBrXm3I6dNuLXI
         ncPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711653790; x=1712258590;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:reply-to:message-id:subject:cc:to:from:date
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GyFGSwdDS+8X5fWOjo2s+K1AMkRQoOt7S254R+rI76g=;
        b=Qur3g5dNSmB9ZfB/u6loUtGbHoVSUcSL6VT7M70GoklWSztqft9nDfQeNOS+mLDOHo
         yWsnBERi6xVOb7kvk5M0RGl8L8L+pC5FMjc3xJzkXY4AygMWHmbrx+yvc2hdjXLAUbMI
         AB1oYXJH0WsFabIsBt3sSsVz3o5nzcrZQFZD2UWrhld6iUERzcnokoMLs+Aa5yprFQ3S
         cdXY5HDsrkAXSm55qcmaMJQBLpDMpbC0pf4NguqcAphERKjC6VVj471PK+15M5p6jCzc
         Z3I51E9BsKzP42LDRWzVTJkwY/ZhQLK0n6SF8IO+49t03gnfcbu29SFf1iXN5uK5WrSV
         HpZA==
X-Forwarded-Encrypted: i=1; AJvYcCX/resleDeivu18JDiQlth5acD/Ta1hd67ZZ9z96qPAL2ZesiPdvbeFDXV40nvpbOvSiHlfBbR4/fy1H2OPInyotvztxIjyNtiXCcAojA==
X-Gm-Message-State: AOJu0Yx3fMHA25tIawgptlFUfozATJmmEfXm7+kfYeUDtikLksNYQ1Fq
	m97Su+NWENNC+VCX/YraFt+vzpqm66bpPZzIKX3v0s9kZR8e8/A=
X-Google-Smtp-Source: AGHT+IEOtLqqAjjYrlHQS8qBEVcSrjCNrCoEQoC8julgRSnyZQ6WZe0wbYQEX2ZQYcLWJzzUoCRR0w==
X-Received: by 2002:a9d:7754:0:b0:6e6:6ea1:9820 with SMTP id t20-20020a9d7754000000b006e66ea19820mr191312otl.14.1711653790323;
        Thu, 28 Mar 2024 12:23:10 -0700 (PDT)
Received: from serve.minyard.net (serve.minyard.net. [2001:470:b8f6:1b::1])
        by smtp.gmail.com with ESMTPSA id n9-20020a9d64c9000000b006e6c9a56591sm344956otl.19.2024.03.28.12.23.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 12:23:09 -0700 (PDT)
Received: from mail.minyard.net (unknown [IPv6:2001:470:b8f6:1b:b987:69e:202a:697a])
	by serve.minyard.net (Postfix) with ESMTPSA id A60B1180011;
	Thu, 28 Mar 2024 19:23:08 +0000 (UTC)
Date: Thu, 28 Mar 2024 14:23:07 -0500
From: Corey Minyard <minyard@acm.org>
To: Allen <allen.lkml@gmail.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
Message-ID: <ZgXDmx1HvujsMYAR@mail.minyard.net>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com>
 <ZgRePyo2zC4A1Fp4@mail.minyard.net>
 <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
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

On Thu, Mar 28, 2024 at 10:52:16AM -0700, Allen wrote:
> On Wed, Mar 27, 2024 at 11:05 AM Corey Minyard <minyard@acm.org> wrote:
> >
> > I believe that work queues items are execute single-threaded for a work
> > queue, so this should be good.  I need to test this, though.  It may be
> > that an IPMI device can have its own work queue; it may not be important
> > to run it in bh context.
> 
>   Fair point. Could you please let me know once you have had a chance to test
> these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
> workqueue.
> 
>  Thanks for taking time out to review.

After looking and thinking about it a bit, a BH context is still
probably the best for this.

I have tested this patch under load and various scenarios and it seems
to work ok.  So:

Tested-by: Corey Minyard <cminyard@mvista.com>
Acked-by: Corey Minyard <cminyard@mvista.com>

Or I can take this into my tree.

-corey

> 
> - Allen
> 
> >
> > -corey
> >
> > >
> > > Based on the work done by Tejun Heo <tj@kernel.org>
> > > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-610
> > >
> > > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > > ---
> > >  drivers/char/ipmi/ipmi_msghandler.c | 30 ++++++++++++++---------------
> > >  1 file changed, 15 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
> > > index b0eedc4595b3..fce2a2dbdc82 100644
> > > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > > @@ -36,12 +36,13 @@
> > >  #include <linux/nospec.h>
> > >  #include <linux/vmalloc.h>
> > >  #include <linux/delay.h>
> > > +#include <linux/workqueue.h>
> > >
> > >  #define IPMI_DRIVER_VERSION "39.2"
> > >
> > >  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
> > >  static int ipmi_init_msghandler(void);
> > > -static void smi_recv_tasklet(struct tasklet_struct *t);
> > > +static void smi_recv_work(struct work_struct *t);
> > >  static void handle_new_recv_msgs(struct ipmi_smi *intf);
> > >  static void need_waiter(struct ipmi_smi *intf);
> > >  static int handle_one_recv_msg(struct ipmi_smi *intf,
> > > @@ -498,13 +499,13 @@ struct ipmi_smi {
> > >       /*
> > >        * Messages queued for delivery.  If delivery fails (out of memory
> > >        * for instance), They will stay in here to be processed later in a
> > > -      * periodic timer interrupt.  The tasklet is for handling received
> > > +      * periodic timer interrupt.  The work is for handling received
> > >        * messages directly from the handler.
> > >        */
> > >       spinlock_t       waiting_rcv_msgs_lock;
> > >       struct list_head waiting_rcv_msgs;
> > >       atomic_t         watchdog_pretimeouts_to_deliver;
> > > -     struct tasklet_struct recv_tasklet;
> > > +     struct work_struct recv_work;
> > >
> > >       spinlock_t             xmit_msgs_lock;
> > >       struct list_head       xmit_msgs;
> > > @@ -704,7 +705,7 @@ static void clean_up_interface_data(struct ipmi_smi *intf)
> > >       struct cmd_rcvr  *rcvr, *rcvr2;
> > >       struct list_head list;
> > >
> > > -     tasklet_kill(&intf->recv_tasklet);
> > > +     cancel_work_sync(&intf->recv_work);
> > >
> > >       free_smi_msg_list(&intf->waiting_rcv_msgs);
> > >       free_recv_msg_list(&intf->waiting_events);
> > > @@ -1319,7 +1320,7 @@ static void free_user(struct kref *ref)
> > >  {
> > >       struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
> > >
> > > -     /* SRCU cleanup must happen in task context. */
> > > +     /* SRCU cleanup must happen in work context. */
> > >       queue_work(remove_work_wq, &user->remove_work);
> > >  }
> > >
> > > @@ -3605,8 +3606,7 @@ int ipmi_add_smi(struct module         *owner,
> > >       intf->curr_seq = 0;
> > >       spin_lock_init(&intf->waiting_rcv_msgs_lock);
> > >       INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> > > -     tasklet_setup(&intf->recv_tasklet,
> > > -                  smi_recv_tasklet);
> > > +     INIT_WORK(&intf->recv_work, smi_recv_work);
> > >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
> > >       spin_lock_init(&intf->xmit_msgs_lock);
> > >       INIT_LIST_HEAD(&intf->xmit_msgs);
> > > @@ -4779,7 +4779,7 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
> > >                        * To preserve message order, quit if we
> > >                        * can't handle a message.  Add the message
> > >                        * back at the head, this is safe because this
> > > -                      * tasklet is the only thing that pulls the
> > > +                      * work is the only thing that pulls the
> > >                        * messages.
> > >                        */
> > >                       list_add(&smi_msg->link, &intf->waiting_rcv_msgs);
> > > @@ -4812,10 +4812,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
> > >       }
> > >  }
> > >
> > > -static void smi_recv_tasklet(struct tasklet_struct *t)
> > > +static void smi_recv_work(struct work_struct *t)
> > >  {
> > >       unsigned long flags = 0; /* keep us warning-free. */
> > > -     struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
> > > +     struct ipmi_smi *intf = from_work(intf, t, recv_work);
> > >       int run_to_completion = intf->run_to_completion;
> > >       struct ipmi_smi_msg *newmsg = NULL;
> > >
> > > @@ -4866,7 +4866,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> > >
> > >       /*
> > >        * To preserve message order, we keep a queue and deliver from
> > > -      * a tasklet.
> > > +      * a work.
> > >        */
> > >       if (!run_to_completion)
> > >               spin_lock_irqsave(&intf->waiting_rcv_msgs_lock, flags);
> > > @@ -4887,9 +4887,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> > >               spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
> > >
> > >       if (run_to_completion)
> > > -             smi_recv_tasklet(&intf->recv_tasklet);
> > > +             smi_recv_work(&intf->recv_work);
> > >       else
> > > -             tasklet_schedule(&intf->recv_tasklet);
> > > +             queue_work(system_bh_wq, &intf->recv_work);
> > >  }
> > >  EXPORT_SYMBOL(ipmi_smi_msg_received);
> > >
> > > @@ -4899,7 +4899,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi *intf)
> > >               return;
> > >
> > >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
> > > -     tasklet_schedule(&intf->recv_tasklet);
> > > +     queue_work(system_bh_wq, &intf->recv_work);
> > >  }
> > >  EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
> > >
> > > @@ -5068,7 +5068,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi *intf,
> > >                                      flags);
> > >       }
> > >
> > > -     tasklet_schedule(&intf->recv_tasklet);
> > > +     queue_work(system_bh_wq, &intf->recv_work);
> > >
> > >       return need_timer;
> > >  }
> > > --
> > > 2.17.1
> > >
> > >
> >
> 
> 
> -- 
>        - Allen
> 

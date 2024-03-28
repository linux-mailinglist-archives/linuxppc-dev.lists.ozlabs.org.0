Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49409890CCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 22:59:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V4fmFq5Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V5HWl03wrz3vnd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Mar 2024 08:59:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V4fmFq5Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::92e; helo=mail-ua1-x92e.google.com; envelope-from=allen.lkml@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ua1-x92e.google.com (mail-ua1-x92e.google.com [IPv6:2607:f8b0:4864:20::92e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V5B2R5k10z3dSJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Mar 2024 04:52:30 +1100 (AEDT)
Received: by mail-ua1-x92e.google.com with SMTP id a1e0cc1a2514c-7e096ab9287so343682241.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 10:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711648348; x=1712253148; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K7LBZgef3OmAKuVME1pwiv1MCdqK5azmNzQAONOqk24=;
        b=V4fmFq5QkhJVLDttUFmK8fgP4LFCOsBik4LM6zBM66pVCj8HS2ypZXs3lu6xnSPGRV
         3aoN4lAm4HjnDdNthIEgkqoI0bWw7TlUle/MIbGiZgO3m5GMzBGWvgseeBy93zMNjvl1
         pTJzw3jX+FWHb47qk6+CWiFSFdhLpqTyc+bBbVTpkRtsUMyV8UmCxjlPxd6438jIDbSw
         uC3imgaggQ/R0E25PWP/8b1M/mPHnkkRAMeijpwg0UCbBqp+iTlAVKZR8hFyEAK/9dMa
         VZhjrCp8NRb6hGQq97lh9wGoGJVl4xR20Vp91ZWdSR6DHZnvcw6XI3wun9SUDan1lkdJ
         UwrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711648348; x=1712253148;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K7LBZgef3OmAKuVME1pwiv1MCdqK5azmNzQAONOqk24=;
        b=HcoclVeJdLZMdqu+ca7CnBwJaIttV7iQlDgJQ7iLBiq10Z5WO6RxzS4Ldhw/FNC77e
         jPxiT1qvIffhM9znLQIDkd8Bz0C7eGOj1zKqVxVpk+JXptbmdC35jo404vmo7ID4LRFE
         7xZ8PU717rOjetMSRL3tMDPflWvhVvEnxPAxfNm3phEjU/A4LQgZaJD/pJF4u9qYQCNE
         vqNg4sNP3cttYd9Pvj39MX0gK+KYdFzbB+qomM2xUtQWQykQBPR/oCfN3U3q4HJYKcTS
         pgssPEKbDz7GUnH0Jy96q+/ploVNqyKm3BRDmOLK9HYq9kdZKXAb0/AxmG24iZmWgezj
         GCCg==
X-Forwarded-Encrypted: i=1; AJvYcCWr3SlsxkZOm9tW7A+cWGXgRroBSopvI5to1Z+bMKC9i2UhaAgend10qvrKl6NAFflIUlREZD9w/tysnLPnMatyjNgGEUzfghkSEpy9Yg==
X-Gm-Message-State: AOJu0YxXciYmBN62hrefw3UqnhUIHmaK4HF9qoDEMUyJhBNcEUHf9Zt3
	bnfimOxSEhcy02F2ua1JK8XYJrHiHYU1ZTYXjo11EPqgLoPc39XAWZmgPhKrNwsZ99pzSIsFTOu
	hW1v0koGZGhm3EKpWHlFjqjxS+r8=
X-Google-Smtp-Source: AGHT+IE95pKnkyYhJyn8YRFxcJ3UpRrXG0+tqWRBp7m1EgSmM0bJzOr09iKkrzG5ElLe1R0ae4jladZnXe+pzUi/Iq8=
X-Received: by 2002:a05:6102:6d1:b0:478:4c1a:efbd with SMTP id
 m17-20020a05610206d100b004784c1aefbdmr2262487vsg.13.1711648347936; Thu, 28
 Mar 2024 10:52:27 -0700 (PDT)
MIME-Version: 1.0
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-7-apais@linux.microsoft.com> <ZgRePyo2zC4A1Fp4@mail.minyard.net>
In-Reply-To: <ZgRePyo2zC4A1Fp4@mail.minyard.net>
From: Allen <allen.lkml@gmail.com>
Date: Thu, 28 Mar 2024 10:52:16 -0700
Message-ID: <CAOMdWS+1AFxEqmACiBYzPHc+q0Ut6hp15tdV50JHvfVeUNCGQw@mail.gmail.com>
Subject: Re: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
To: minyard@acm.org
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

On Wed, Mar 27, 2024 at 11:05=E2=80=AFAM Corey Minyard <minyard@acm.org> wr=
ote:
>
> On Wed, Mar 27, 2024 at 04:03:11PM +0000, Allen Pais wrote:
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
>
> I think you mean drivers/char/ipmi/* here.

 My apologies, my scripts messed up the commit messages for this series.
Will have it fixed in v2.

>
> I believe that work queues items are execute single-threaded for a work
> queue, so this should be good.  I need to test this, though.  It may be
> that an IPMI device can have its own work queue; it may not be important
> to run it in bh context.

  Fair point. Could you please let me know once you have had a chance to te=
st
these changes. Meanwhile, I will work on RFC wherein IPMI will have its own
workqueue.

 Thanks for taking time out to review.

- Allen

>
> -corey
>
> >
> > Based on the work done by Tejun Heo <tj@kernel.org>
> > Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6=
.10
> >
> > Signed-off-by: Allen Pais <allen.lkml@gmail.com>
> > ---
> >  drivers/char/ipmi/ipmi_msghandler.c | 30 ++++++++++++++---------------
> >  1 file changed, 15 insertions(+), 15 deletions(-)
> >
> > diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ip=
mi_msghandler.c
> > index b0eedc4595b3..fce2a2dbdc82 100644
> > --- a/drivers/char/ipmi/ipmi_msghandler.c
> > +++ b/drivers/char/ipmi/ipmi_msghandler.c
> > @@ -36,12 +36,13 @@
> >  #include <linux/nospec.h>
> >  #include <linux/vmalloc.h>
> >  #include <linux/delay.h>
> > +#include <linux/workqueue.h>
> >
> >  #define IPMI_DRIVER_VERSION "39.2"
> >
> >  static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
> >  static int ipmi_init_msghandler(void);
> > -static void smi_recv_tasklet(struct tasklet_struct *t);
> > +static void smi_recv_work(struct work_struct *t);
> >  static void handle_new_recv_msgs(struct ipmi_smi *intf);
> >  static void need_waiter(struct ipmi_smi *intf);
> >  static int handle_one_recv_msg(struct ipmi_smi *intf,
> > @@ -498,13 +499,13 @@ struct ipmi_smi {
> >       /*
> >        * Messages queued for delivery.  If delivery fails (out of memor=
y
> >        * for instance), They will stay in here to be processed later in=
 a
> > -      * periodic timer interrupt.  The tasklet is for handling receive=
d
> > +      * periodic timer interrupt.  The work is for handling received
> >        * messages directly from the handler.
> >        */
> >       spinlock_t       waiting_rcv_msgs_lock;
> >       struct list_head waiting_rcv_msgs;
> >       atomic_t         watchdog_pretimeouts_to_deliver;
> > -     struct tasklet_struct recv_tasklet;
> > +     struct work_struct recv_work;
> >
> >       spinlock_t             xmit_msgs_lock;
> >       struct list_head       xmit_msgs;
> > @@ -704,7 +705,7 @@ static void clean_up_interface_data(struct ipmi_smi=
 *intf)
> >       struct cmd_rcvr  *rcvr, *rcvr2;
> >       struct list_head list;
> >
> > -     tasklet_kill(&intf->recv_tasklet);
> > +     cancel_work_sync(&intf->recv_work);
> >
> >       free_smi_msg_list(&intf->waiting_rcv_msgs);
> >       free_recv_msg_list(&intf->waiting_events);
> > @@ -1319,7 +1320,7 @@ static void free_user(struct kref *ref)
> >  {
> >       struct ipmi_user *user =3D container_of(ref, struct ipmi_user, re=
fcount);
> >
> > -     /* SRCU cleanup must happen in task context. */
> > +     /* SRCU cleanup must happen in work context. */
> >       queue_work(remove_work_wq, &user->remove_work);
> >  }
> >
> > @@ -3605,8 +3606,7 @@ int ipmi_add_smi(struct module         *owner,
> >       intf->curr_seq =3D 0;
> >       spin_lock_init(&intf->waiting_rcv_msgs_lock);
> >       INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
> > -     tasklet_setup(&intf->recv_tasklet,
> > -                  smi_recv_tasklet);
> > +     INIT_WORK(&intf->recv_work, smi_recv_work);
> >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
> >       spin_lock_init(&intf->xmit_msgs_lock);
> >       INIT_LIST_HEAD(&intf->xmit_msgs);
> > @@ -4779,7 +4779,7 @@ static void handle_new_recv_msgs(struct ipmi_smi =
*intf)
> >                        * To preserve message order, quit if we
> >                        * can't handle a message.  Add the message
> >                        * back at the head, this is safe because this
> > -                      * tasklet is the only thing that pulls the
> > +                      * work is the only thing that pulls the
> >                        * messages.
> >                        */
> >                       list_add(&smi_msg->link, &intf->waiting_rcv_msgs)=
;
> > @@ -4812,10 +4812,10 @@ static void handle_new_recv_msgs(struct ipmi_sm=
i *intf)
> >       }
> >  }
> >
> > -static void smi_recv_tasklet(struct tasklet_struct *t)
> > +static void smi_recv_work(struct work_struct *t)
> >  {
> >       unsigned long flags =3D 0; /* keep us warning-free. */
> > -     struct ipmi_smi *intf =3D from_tasklet(intf, t, recv_tasklet);
> > +     struct ipmi_smi *intf =3D from_work(intf, t, recv_work);
> >       int run_to_completion =3D intf->run_to_completion;
> >       struct ipmi_smi_msg *newmsg =3D NULL;
> >
> > @@ -4866,7 +4866,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> >
> >       /*
> >        * To preserve message order, we keep a queue and deliver from
> > -      * a tasklet.
> > +      * a work.
> >        */
> >       if (!run_to_completion)
> >               spin_lock_irqsave(&intf->waiting_rcv_msgs_lock, flags);
> > @@ -4887,9 +4887,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
> >               spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
> >
> >       if (run_to_completion)
> > -             smi_recv_tasklet(&intf->recv_tasklet);
> > +             smi_recv_work(&intf->recv_work);
> >       else
> > -             tasklet_schedule(&intf->recv_tasklet);
> > +             queue_work(system_bh_wq, &intf->recv_work);
> >  }
> >  EXPORT_SYMBOL(ipmi_smi_msg_received);
> >
> > @@ -4899,7 +4899,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi=
 *intf)
> >               return;
> >
> >       atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
> > -     tasklet_schedule(&intf->recv_tasklet);
> > +     queue_work(system_bh_wq, &intf->recv_work);
> >  }
> >  EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
> >
> > @@ -5068,7 +5068,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi =
*intf,
> >                                      flags);
> >       }
> >
> > -     tasklet_schedule(&intf->recv_tasklet);
> > +     queue_work(system_bh_wq, &intf->recv_work);
> >
> >       return need_timer;
> >  }
> > --
> > 2.17.1
> >
> >
>


--=20
       - Allen

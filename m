Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65F762FC09F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Jan 2021 21:10:08 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DL0BN3Qv8zDqgn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 07:10:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=f8s9eiBw; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DL08q1v6VzDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 07:08:40 +1100 (AEDT)
Received: by mail-wm1-x335.google.com with SMTP id e15so882929wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Jan 2021 12:08:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gUbElotSDC5VjMwIga4WOXAKVvCXV926k6hzZgmzzKo=;
 b=f8s9eiBwX0BAYgTTiS9iO+QNwEqYZwj8DStyNa1yjK4wsqYVXC3Zsj15HDc1DrObws
 o8aUi0EE1VUj9Xk055rdTv0Y9QauywK2PuRFbCbXhIbAE0q8HKTqdaaCcurbtdlv9h26
 q4VBSOuR6lRnXTU93lB/eoI3Gx9d4AfEKE4UaXkIONv3E57E6GnLvRtMRcvsHttFhw78
 uFju6QTUN43rbbW28mO9U3C6XgnUmqzmdb1LqlPeCDlw9hQCLij2S2YJZFgX4wx7nqut
 DaF1TvxlRZ/9kon465I+dAt80nqvMZtm/t/UZbRQkgaXdYCiiJgw0ftRBp9iH5fE5duY
 VoEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gUbElotSDC5VjMwIga4WOXAKVvCXV926k6hzZgmzzKo=;
 b=oR09FB6j0pSVFz6AYZCuOLUQP9fjnZUxuD4QoJOl2WrIEn9Vzz5D6DE1sQTJzBiO0L
 /3g+881qD8gmy5cbOA7vrfvogEtd4OrmFlnHN8RWZmNp5SKocWL1hv5OB1HZuN/BXkNj
 BXdkaGxZam3fdOep4o1QSwESRrBOAssi5tRMLdov8oplPRksTkFM9LPRMfzJHcckyqCu
 Un8dF/QsLYSe9zwg+w0SYBAyiLz/jsIAy3QJlDUNPYi58fnD1Qz2iiNk5aiQ14cCRyzm
 EhOWcRiMXtApWDYFjZhKyTVyrJ2Gvb3lTKmV/Gf0ER1TaY6FTEUYt86gCc4oPUkPXyf+
 5iVQ==
X-Gm-Message-State: AOAM532iqOC82V+0IHFy7i641mhYJpa4k3Rod1vyVjbtpv/n0nKTFM+6
 +k3xZh0+pyxI+TLE844T8VzSAmxHbktBb2K5HEc=
X-Google-Smtp-Source: ABdhPJzrByNHbxqQDoB5h5ZZFMFxCtyIYWGU1zYgenco9ZaYf+wvAgUsCDWmr+8dnoCWDmWDLWUkCsPQ3dcf5zQZwqU=
X-Received: by 2002:a1c:9c01:: with SMTP id f1mr1085750wme.159.1611086916064; 
 Tue, 19 Jan 2021 12:08:36 -0800 (PST)
MIME-Version: 1.0
References: <20210119193313.43791-1-ljp@linux.ibm.com>
 <20210119194959.a67nlfbngx4drvyz@pengutronix.de>
In-Reply-To: <20210119194959.a67nlfbngx4drvyz@pengutronix.de>
From: Lijun Pan <lijunp213@gmail.com>
Date: Tue, 19 Jan 2021 14:08:25 -0600
Message-ID: <CAOhMmr5pmLLCdm7Jjkkfvuyof9PZ+R4zgidEFgC_ms-r6rv4ow@mail.gmail.com>
Subject: Re: [PATCH net RFC] ibmvnic: device remove has higher precedence over
 reset
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: gregkh@linuxfoundation.org, julietk@linux.vnet.ibm.com,
 netdev@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Lijun Pan <ljp@linux.ibm.com>, kernel@pengutronix.de, drt@linux.ibm.com,
 paulus@samba.org, sukadev@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 19, 2021 at 1:56 PM Uwe Kleine-K=C3=B6nig
<u.kleine-koenig@pengutronix.de> wrote:
>
> On Tue, Jan 19, 2021 at 01:33:13PM -0600, Lijun Pan wrote:
> > Returning -EBUSY in ibmvnic_remove() does not actually hold the
> > removal procedure since driver core doesn't care for the return
> > value (see __device_release_driver() in drivers/base/dd.c
> > calling dev->bus->remove()) though vio_bus_remove
> > (in arch/powerpc/platforms/pseries/vio.c) records the
> > return value and passes it on. [1]
> >
> > During the device removal precedure, we should not schedule
> > any new reset, and rely on the flush_work and flush_delayed_work
> > to complete the pending resets, and specifically we need to
> > let __ibmvnic_reset() keep running while in REMOVING state since
> > flush_work and flush_delayed_work shall call __ibmvnic_reset finally.
> >
> > [1] https://lore.kernel.org/linuxppc-dev/20210117101242.dpwayq6wdgfdzir=
l@pengutronix.de/T/#m48f5befd96bc9842ece2a3ad14f4c27747206a53
> > Reported-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > Fixes: 7d7195a026ba ("ibmvnic: Do not process device remove during devi=
ce reset")
> > Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
> > ---
> >  drivers/net/ethernet/ibm/ibmvnic.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/=
ibm/ibmvnic.c
> > index aed985e08e8a..11f28fd03057 100644
> > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > @@ -2235,8 +2235,7 @@ static void __ibmvnic_reset(struct work_struct *w=
ork)
> >       while (rwi) {
> >               spin_lock_irqsave(&adapter->state_lock, flags);
> >
> > -             if (adapter->state =3D=3D VNIC_REMOVING ||
> > -                 adapter->state =3D=3D VNIC_REMOVED) {
> > +             if (adapter->state =3D=3D VNIC_REMOVED) {
>
> I think you need to keep the check for VNIC_REMOVING. Otherwise you
> don't prevent that a new reset being queued after ibmvnic_remove() set
> the state to VNIC_REMOVING. Am I missing something?

I leave the checking for REMOVING there in ibmvnic_reset, which is the
function to schedule/queue up the resets.
Here I delete the REMOVING in __ibmvnic_reset to let it run and finish.
Otherwise flush_work will not do anything if __ibmvnic_reset() just return
doing nothing.

I can explain it in the commit message.

>
> >                       spin_unlock_irqrestore(&adapter->state_lock, flag=
s);
> >                       kfree(rwi);
> >                       rc =3D EBUSY;
> > @@ -5372,11 +5371,6 @@ static int ibmvnic_remove(struct vio_dev *dev)
> >       unsigned long flags;
> >
> >       spin_lock_irqsave(&adapter->state_lock, flags);
> > -     if (test_bit(0, &adapter->resetting)) {
> > -             spin_unlock_irqrestore(&adapter->state_lock, flags);
> > -             return -EBUSY;
> > -     }
> > -
> >       adapter->state =3D VNIC_REMOVING;
> >       spin_unlock_irqrestore(&adapter->state_lock, flags);
>
> Best regards
> Uwe
>
> --
> Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig       =
     |
> Industrial Linux Solutions                 | https://www.pengutronix.de/ =
|

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E07362FF380
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 19:48:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMBH80GKkzDrRd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 05:48:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42b;
 helo=mail-wr1-x42b.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NaLSF6mn; dkim-atps=neutral
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMBFC2zY6zDqhn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 05:46:39 +1100 (AEDT)
Received: by mail-wr1-x42b.google.com with SMTP id l12so2778184wry.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 10:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=eLTRmgCPr+HYEN4cQ2gWxgBb6XXHtvoKZev3zSDlplo=;
 b=NaLSF6mnOsSALBNUwoEWqpOszUcKRSjhhfwqZ0GLuhUE3tE+owsFUGFQDGiVNk85FB
 cfWX+W2cwseXNzPuKQGS1lyUQ2SNqWjuFQO1G+mV8S0FdyxEpel7XZC7RJ1fwAX4vzO9
 YERQAINr3dSMYhdy7FatFADHHERaJVLMfydBTNp4ozPSKriY6ABhroeFhyoczJ0ke98b
 M0uLbIB8Wr39FDdgqvBixY+JkFYsqzzNxAmIAWs3d8k/6hX7ex+esQCzY6b77uUD75Db
 Koio5k8vQXUnGf8rafgxU3is0H9j5bK3+21cu/gGh7RfAqDk6yHhX40fkSAswC2aYanD
 cVRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=eLTRmgCPr+HYEN4cQ2gWxgBb6XXHtvoKZev3zSDlplo=;
 b=ZxQixvsXQLkZnJPLcMEFfDZj05hrgYo395PT5RfDh8Lson4EL4Cfs6Bz8wwVnoqtKP
 6rm7aQU5vs6eSxyrX3dBpHmyJkqy8tP51wpj4/OpWxBly2VtzT8ooNDWxQzdmPFDPh0/
 E7Pv8PG/BKj13+G/MNAteK1tGHhPTHrWLN0OC70od4/Dd0QrjJ9zCJJPAJy0d3t/caVh
 3tZ9lG0TeYqQ5SQmC9xhpuMzzz7V299cdRz7sz7ysl6zIXsfwtj/i3ri3GVNqwG4nBTj
 Hwy3rHXBi2tsvaa5x6IBr78uqb8E2wwODz9wKIwsjQlB9BNkkPJFgmXEgaxWw8p9u2zY
 GFPQ==
X-Gm-Message-State: AOAM533qLCxBwoGlrF/q41uaqm6/ort2olHufQhii0TXEbw87m6OCRh7
 38ehK0A3D/HPGWL5LlDhwUwIUlwp5uPHC4ALCzA=
X-Google-Smtp-Source: ABdhPJxFJI5jBFOrwJgGW7fDzLgZnW9nyzCxEwUsPE+DW1/63MX/JCCf8P+lfc0O2FAiheO9+xeTNBBy8Ziy0Mn0Wy0=
X-Received: by 2002:a5d:4ecb:: with SMTP id s11mr857330wrv.334.1611254794427; 
 Thu, 21 Jan 2021 10:46:34 -0800 (PST)
MIME-Version: 1.0
References: <20210121062005.53271-1-ljp@linux.ibm.com>
 <c34816a13d857b7f5d1a25991b58ec63@imap.linux.ibm.com>
In-Reply-To: <c34816a13d857b7f5d1a25991b58ec63@imap.linux.ibm.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Thu, 21 Jan 2021 12:46:23 -0600
Message-ID: <CAOhMmr6LdZQpE7Ah1XVn0ApOO8Ch1XfAuoo1tPNgT0rG0zrc=A@mail.gmail.com>
Subject: Re: [PATCH net] ibmvnic: device remove has higher precedence over
 reset
To: Dany Madden <drt@linux.ibm.com>
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
 netdev@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Lijun Pan <ljp@linux.ibm.com>,
 kernel@pengutronix.de, paulus@samba.org, sukadev@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jan 21, 2021 at 12:42 PM Dany Madden <drt@linux.ibm.com> wrote:
>
> On 2021-01-20 22:20, Lijun Pan wrote:
> > Returning -EBUSY in ibmvnic_remove() does not actually hold the
> > removal procedure since driver core doesn't care for the return
> > value (see __device_release_driver() in drivers/base/dd.c
> > calling dev->bus->remove()) though vio_bus_remove
> > (in arch/powerpc/platforms/pseries/vio.c) records the
> > return value and passes it on. [1]
> >
> > During the device removal precedure, we should not schedule
> > any new reset (ibmvnic_reset check for REMOVING and exit),
> > and should rely on the flush_work and flush_delayed_work
> > to complete the pending resets, specifically we need to
> > let __ibmvnic_reset() keep running while in REMOVING state since
> > flush_work and flush_delayed_work shall call __ibmvnic_reset finally.
> > So we skip the checking for REMOVING in __ibmvnic_reset.
> >
> > [1]
> > https://lore.kernel.org/linuxppc-dev/20210117101242.dpwayq6wdgfdzirl@pe=
ngutronix.de/T/#m48f5befd96bc9842ece2a3ad14f4c27747206a53
> > Reported-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > Fixes: 7d7195a026ba ("ibmvnic: Do not process device remove during
> > device reset")
> > Signed-off-by: Lijun Pan <ljp@linux.ibm.com>
> > ---
> > v1 versus RFC:
> >   1/ articulate why remove the REMOVING checking in __ibmvnic_reset
> >   and why keep the current checking for REMOVING in ibmvnic_reset.
> >   2/ The locking issue mentioned by Uwe are being addressed separately
> >      by       https://lists.openwall.net/netdev/2021/01/08/89
> >   3/ This patch does not have merge conflict with 2/
> >
> >  drivers/net/ethernet/ibm/ibmvnic.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c
> > b/drivers/net/ethernet/ibm/ibmvnic.c
> > index aed985e08e8a..11f28fd03057 100644
> > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > @@ -2235,8 +2235,7 @@ static void __ibmvnic_reset(struct work_struct
> > *work)
> >       while (rwi) {
> >               spin_lock_irqsave(&adapter->state_lock, flags);
> >
> > -             if (adapter->state =3D=3D VNIC_REMOVING ||
> > -                 adapter->state =3D=3D VNIC_REMOVED) {
> > +             if (adapter->state =3D=3D VNIC_REMOVED) {
>
> If we do get here, we would crash because ibmvnic_remove() happened. It
> frees the adapter struct already.

Not exactly. viodev is gone; netdev is done; ibmvnic_adapter is still there=
.

Lijun
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

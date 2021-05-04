Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5253730D2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 21:31:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZVMw2pgcz30Cb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 05:31:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=j/WXxxfQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d;
 helo=mail-wr1-x42d.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j/WXxxfQ; dkim-atps=neutral
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZVMR1Xn5z2yRX
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 05:31:30 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id l14so10632874wrx.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 12:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YpfdYp+JammDZESyHmE088kxmPUUqxIHCGvlq8nXxpY=;
 b=j/WXxxfQsZvVmuZVliChNFVU7aT9nwZKZxJlgw8j6vwyBMJQIDgTvMhhvvsb/aUZ+s
 Ht66WoLanlTS7w9OzbVIO4pBrL1SDrzveyJqBQcgydbq5AHDz52J7G4IwZ5QD4E5wS3o
 RZBHxKj0+d9H9Jt6a+PClKmf1/PShoGnd51aJrIrfBG6q2CM7k7dbFG/3hkl9wI5MF2q
 HH3Jgh5Sz2T0KC/V+R8TjzmNZB1QZyVL4U95jMbd4yZ1LEGWiB1/8kVE68PcW9BMYs2p
 mGeQasLLosgauSyWkceQWjraHgRS1J+EDrwqea7x6EtXyltMADF4sH6tC+wwXlIJsSvV
 0aAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YpfdYp+JammDZESyHmE088kxmPUUqxIHCGvlq8nXxpY=;
 b=AVaYxlIT/9Xwaj4SKiC9b/KYYkpjuRBhw+9CDKqwxBcgMo1aQVlsGXBHJZPkB9pjZA
 HQN9mTYem/7wCs9+Pt4eJoeK6CbheOh8hk/vd/rPG80AuX6FbHKob+dhpbBf9JDxMQy5
 ZglscQqvSt/MKufyaXyHkcvOofZgaRZcHPDdNMt/nQkZabQssRO8fHd85+Y3gkXED/qc
 Ym3Iz+KllXhdnzfJm1/58ZOKgAb6ziw6TDRNgssYuiLwXIyOWwmu9rqfzimerHGLKJ1z
 Bv4TJV7yZUFX0TxNGJcmkavVQ9DuK5AUZ18n1x56CIYi2letky7BEZ2NW2uSczgu6RKn
 bLjg==
X-Gm-Message-State: AOAM531m0oOsH95yCvcfBomTJI0MVN9gUn7HPaLZfgY1qDjucrHbL/i8
 4MMJqmFOrvKeOrW0MP9i2nLokuIJDFZ7UCwmw+Q=
X-Google-Smtp-Source: ABdhPJzlr3EBkUDz4QZQc+t8xlVBDRUzjeEjuYXu+QICXxPO21RTvGT5X0wWy19CMAWDQyOS6niN1HtdNW7El1YSueQ=
X-Received: by 2002:a5d:64e4:: with SMTP id g4mr33808275wri.366.1620156686702; 
 Tue, 04 May 2021 12:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210504191142.2872696-1-drt@linux.ibm.com>
 <CAOhMmr5T_BLkqGspnzck=xtiX0rPABv8oX4=LCRbH00T8-B6qw@mail.gmail.com>
In-Reply-To: <CAOhMmr5T_BLkqGspnzck=xtiX0rPABv8oX4=LCRbH00T8-B6qw@mail.gmail.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Tue, 4 May 2021 14:31:15 -0500
Message-ID: <CAOhMmr5ucF3pa4jp9RLEzJNs29oVT0qAXmywNnd+Xe2seoRJfg@mail.gmail.com>
Subject: Re: [PATCH net v3] ibmvnic: Continue with reset if set link down
 failed
To: Dany Madden <drt@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Falcon <tlfalcon@linux.ibm.com>, netdev@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Jakub Kicinski <kuba@kernel.org>,
 Sukadev Bhattiprolu <sukadev@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 4, 2021 at 2:27 PM Lijun Pan <lijunp213@gmail.com> wrote:
>
> On Tue, May 4, 2021 at 2:14 PM Dany Madden <drt@linux.ibm.com> wrote:
> >
> > When ibmvnic gets a FATAL error message from the vnicserver, it marks
> > the Command Respond Queue (CRQ) inactive and resets the adapter. If this
> > FATAL reset fails and a transmission timeout reset follows, the CRQ is
> > still inactive, ibmvnic's attempt to set link down will also fail. If
> > ibmvnic abandons the reset because of this failed set link down and this
> > is the last reset in the workqueue, then this adapter will be left in an
> > inoperable state.
> >
> > Instead, make the driver ignore this link down failure and continue to
> > free and re-register CRQ so that the adapter has an opportunity to
> > recover.
> >
> > Fixes: ed651a10875f ("ibmvnic: Updated reset handling")
> > Signed-off-by: Dany Madden <drt@linux.ibm.com>
> > Reviewed-by: Rick Lindsley <ricklind@linux.ibm.com>
> > Reviewed-by: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
> > ---
> > Changes in V2:
> > - Update description to clarify background for the patch
> > - Include Reviewed-by tags
> > Changes in V3:
> > - Add comment above the code change
> > ---
> >  drivers/net/ethernet/ibm/ibmvnic.c | 11 +++++++++--
> >  1 file changed, 9 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> > index 5788bb956d73..9e005a08d43b 100644
> > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > @@ -2017,8 +2017,15 @@ static int do_reset(struct ibmvnic_adapter *adapter,
> >                         rtnl_unlock();
> >                         rc = set_link_state(adapter, IBMVNIC_LOGICAL_LNK_DN);
> >                         rtnl_lock();
> > -                       if (rc)
> > -                               goto out;
> > +
> > +                       /* Attempted to set the link down. It could fail if the
> > +                        * vnicserver has already torn down the CRQ. We will
> > +                        * note it and continue with reset to reinit the CRQ.
> > +                        */
> > +                       if (rc) {
> > +                               netdev_dbg(netdev,
> > +                                          "Setting link down failed rc=%d. Continue anyway\n", rc);
> > +                       }
>
> There are other places which check and rely on the return value of
> this function. Your change makes that inconsistent. Can you stop

To be more specific, __ibmvnic_close, __ibmvnic_open both call this
set_link_state.

> posting new versions and soliciting the maintainer to accept it before
> there is material change? There are many ways to make reset
> successful. I think this is the worst approach of all.
>
>
> >
> >                         if (adapter->state == VNIC_OPEN) {
> >                                 /* When we dropped rtnl, ibmvnic_open() got
> > --
> > 2.18.2
> >

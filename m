Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E218F2FF51C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Jan 2021 20:51:07 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMCgW2yhlzDrTY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 06:51:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b;
 helo=mail-wm1-x32b.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QIElR3Bi; dkim-atps=neutral
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMCcm3y5qzDrP5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 06:48:40 +1100 (AEDT)
Received: by mail-wm1-x32b.google.com with SMTP id o10so5522775wmc.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Jan 2021 11:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6d/aDVOFLX7raDkP7Gxi9miozA9uxs1+XCWygDlWrkY=;
 b=QIElR3BisQdC5WSJ1TT45S+jd3A6SD3Ni17JqCCYSVxcMoEAnzYUf3TQeUlrBhUbkU
 COZXX6Sni0gHt5WRzV3MkNBwJPx/QHtQr+gu4DcXGlHpiUboZ3TNPoZnF1gXasyvk3jg
 mGV7WFMyjZ/8umM+4P7UKc72nBV6Mi6abhJR+7TdU3pB2znnT6UhcdEpyw9jFc0tDSO/
 WcZuvrx69mjyzAEKdqPkl8BEsa4hqsR3PV/L4Xk/rx1uAVZT1E/cWksa30t4cA0v1NG6
 SkjXpk8WfDnIq6ilmYZWa+/qqcHWaULx+H46ODIZHgjbe97087cd3+E2sI/TUv1MURhC
 qaoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6d/aDVOFLX7raDkP7Gxi9miozA9uxs1+XCWygDlWrkY=;
 b=i+0/LYN59fe9SYj7zBe2hbEUXUSorrc0wiuKqHAyI9/MOVDICAy5qpsGYLeaCGDT81
 m/GcLIGC4ooYFgYljdR5UuWkTW12TrJBYgk6881c7/nVV8ySQvpL33ACENkLcZutVylR
 Z0pape0tIjBgZkAFhIAxERghAgIQOavfWWXQzTm/CuTFFYAhvCNc20dLJ56CwTpzM+yL
 ZEmFvtqqonts2ZiEMEiBNgoBy3pH5nSu0bwQYtXwQqvlBT49MbTe7JM07hPvoTFOr3td
 VGpNIOcKyex5EqU7sUlP3Q8RTAgZujn54cIRdSFTKQ1aix/0MhVqeOat3zhAVkUKMZ58
 +Flw==
X-Gm-Message-State: AOAM5309VCynKlhdKE4joSZlDtCuc+o7Tc1OEi+i5P5DxIMsc8po7i/7
 gH7baIwyQ61VdG+1YVwkjY87XjYVRBlGxk8v13k=
X-Google-Smtp-Source: ABdhPJz7GXTgChcUTZatL94Uoivs3xg0oY3saLXHN7wlMaBGesprFDERru7aUEGwD20593xhjbAqHHYrAqeqHI47avY=
X-Received: by 2002:a1c:1b83:: with SMTP id b125mr892997wmb.8.1611258516286;
 Thu, 21 Jan 2021 11:48:36 -0800 (PST)
MIME-Version: 1.0
References: <20210121062005.53271-1-ljp@linux.ibm.com>
 <c34816a13d857b7f5d1a25991b58ec63@imap.linux.ibm.com>
In-Reply-To: <c34816a13d857b7f5d1a25991b58ec63@imap.linux.ibm.com>
From: Lijun Pan <lijunp213@gmail.com>
Date: Thu, 21 Jan 2021 13:48:25 -0600
Message-ID: <CAOhMmr78mzJpfPBSwp9JWmE+KwLxd6JtqpwaA9tmqxU5fCjcgg@mail.gmail.com>
Subject: Re: [PATCH net] ibmvnic: device remove has higher precedence over
 reset
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
Cc: gregkh@linuxfoundation.org, julietk@linux.vnet.ibm.com,
 netdev@vger.kernel.org,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Jakub Kicinski <kuba@kernel.org>, Lijun Pan <ljp@linux.ibm.com>,
 kernel@pengutronix.de, paulus@samba.org, sukadev@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

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
> > -             if (adapter->state == VNIC_REMOVING ||
> > -                 adapter->state == VNIC_REMOVED) {
> > +             if (adapter->state == VNIC_REMOVED) {
>
> If we do get here, we would crash because ibmvnic_remove() happened. It
> frees the adapter struct already.

Not exactly. viodev is gone; netdev is gone; ibmvnic_adapter is still there.

Lijun

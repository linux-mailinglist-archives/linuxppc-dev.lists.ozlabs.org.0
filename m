Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8209C3AF16E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Jun 2021 19:08:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G7ww21ggtz3082
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 03:08:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=uviUHAF4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::22e;
 helo=mail-lj1-x22e.google.com; envelope-from=vincent.guittot@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=uviUHAF4; dkim-atps=neutral
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G7wvW3w8bz2ykM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 03:07:48 +1000 (AEST)
Received: by mail-lj1-x22e.google.com with SMTP id d13so26176759ljg.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 10:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cfyI+PE4yMFE2NiBIg4WN+XRsbmpmtuoazfEDa31UNE=;
 b=uviUHAF4Kl81bYxL74OOvKsVzg6wvX6YPg1izMWApQE0qUH3f+zE0RIhhlc/d4slv2
 DxlrglB/H/M5hMZYFbo/bRFqPRLjL2iZMtq4IX+PiZYlEfSWxM4rxU0daIJInis6+Nxp
 2/sE8bEjGI2fvfVwC18hPuvzFSzce6AWKyXxkJqLPOcLj3plzpF/oIS2v93XOGKNv+J8
 j/peMUTgudseO6Mm0n7nSi9ccMwuHo7vVtg1JS13M6/XUBS0zqeYygb5R01onXHwx708
 Df+jyaZcsyfvywoEE7kfhDyb6XMZVnKrW4KpQkfMyMfI7bvA01KRTrOHrOnyxZJ1UA39
 vcsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cfyI+PE4yMFE2NiBIg4WN+XRsbmpmtuoazfEDa31UNE=;
 b=L5pRXnX6ytpsUsXJ5/H/bJ+GCAc7+fTla1kNSWw4vPk115Ldj53gqUd27sZR+lEDyS
 tBMoX0k09Eu1HgvhHoHW5wYOAEIBFwsg2MjMPsh3Z4CPoTZrULp2olTHOZO3EUwLYBqZ
 D+mJklK6dQQorykcengqzNUeCC2GniMOrHgQ0ynDYoylXyR56qVeE/Y/LG7RMdHyhh6Y
 U6OHcOA3+AT8rW9KaK+0UqVKP68PB/H8XT/MzsCAIkw07OTjMC6Fsgfv92c8qzN/TYV8
 c9jtEotPtBX68J8lMX/C5V6rOwZWJbXw6K6Y79pWDT7s1KzXjrJFt1PioPiFXLEu4B5/
 2Qbg==
X-Gm-Message-State: AOAM5305K21ut6MuYxDm/rlMS+Lf421zOC/g+ACE2p+Fr00xp7GBXPYW
 Z7VzZXBHFgKIHN1w7m/M0xoipr5eT7MiQ7oKatY/VA==
X-Google-Smtp-Source: ABdhPJyEtNkIjBI5N44m4GQ843pXOdK+86sbhof7yjNOwXzFx3GIIYNndERBm4quNQ9brfXdSV8QEJeUVFqOAWVLg30=
X-Received: by 2002:a2e:b80f:: with SMTP id u15mr23152412ljo.284.1624295261005; 
 Mon, 21 Jun 2021 10:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <9D4A658A-5F77-4C33-904A-126E6052B205@linux.vnet.ibm.com>
 <CAFpoUr3g5t3Z0BtW4-jnYomc3cdY=V5=Zt94-C+fHOjGWa107w@mail.gmail.com>
 <CAKfTPtC=aXasuSNvn+A3152-4xoOTWROhJpZAVq6RLh1Hacpng@mail.gmail.com>
 <CAFpoUr2o2PVPOx+AvatjjUvqPTyNKE3C6oXejyU3HVMmtCnzvQ@mail.gmail.com>
 <6D1F875D-58E9-4A55-B0C3-21D5F31EDB76@linux.vnet.ibm.com>
 <CAFpoUr0iWFTq2grtnX_EH6KnZLZQCg1o6_yv1gfDK8WdbHmUCA@mail.gmail.com>
 <CAFpoUr3Wy9raHx+Dc0S8TB_Xi=E+Epsh_pA3DEFZP4eKf7s07A@mail.gmail.com>
 <20210621162243.GA29874@vingu-book>
 <CAFpoUr1hyAeFSCvyJU4SKjtEKn6Hq1RLuu1eZPhRt1SaAq7=TQ@mail.gmail.com>
In-Reply-To: <CAFpoUr1hyAeFSCvyJU4SKjtEKn6Hq1RLuu1eZPhRt1SaAq7=TQ@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Mon, 21 Jun 2021 19:07:29 +0200
Message-ID: <CAKfTPtA21ZG3wwdFG-11Nq6NBFu_eOAdvYFMFJePoSMiS_+jcw@mail.gmail.com>
Subject: Re: [powerpc][5.13.0-rc7] Kernel warning (kernel/sched/fair.c:401)
 while running LTP tests
To: Odin Ugedal <odin@uged.al>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linuxppc-dev@lists.ozlabs.org,
 open list <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 21 Jun 2021 at 18:45, Odin Ugedal <odin@uged.al> wrote:
>
> man. 21. jun. 2021 kl. 18:22 skrev Vincent Guittot <vincent.guittot@linaro.org>:
> > I would prefer that we use the reason of adding the cfs in the list instead.
> >
> > Something like the below should also fixed the problem. It is based on a
> > proposal I made to Rik sometimes ago when he tried to flatten the rq:
> > https://lore.kernel.org/lkml/20190906191237.27006-6-riel@surriel.com/
> >
> > This will ensure that a cfs is added in the list whenever one of its  child
> > is still in the list.
>
> Oh, yeah, that is a much more elegant solution! It fixes the issue as well!
>
> Feel free to add this when/if you submit it as a patch:
> Acked-by: Odin Ugedal <odin@uged.al>

Thanks

>
> Odin

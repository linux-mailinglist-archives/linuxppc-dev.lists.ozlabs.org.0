Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E60164F30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 20:47:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N7Y85ptXzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 06:47:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::231;
 helo=mail-oi1-x231.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=spzms7ZF; dkim-atps=neutral
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com
 [IPv6:2607:f8b0:4864:20::231])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N7Wk0cj0zDqN0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 06:46:23 +1100 (AEDT)
Received: by mail-oi1-x231.google.com with SMTP id z2so25026142oih.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 11:46:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=5knSbSQijxZC5HFUsAquOUxZL1rUcVluvYQXYeJgsb0=;
 b=spzms7ZFStDdGcg6RwS0nCJhffhkFMtqAl8wsXV/0mV13bYU9JK1K0Yca2VhCt9DOD
 iQTujbxr4YcvoqHi8iFGEc7RAWFicLpY6IK+oGJImv6jMkwNpQfzT3awGtwSwzASSWpP
 7V43aIY64tCEF1feFR06V7TJEOrOiF6ZBfm252mdnXCnUxvACTPPFJFM/JFm6gUUgRhT
 Sb9FiVtYLOPws7Y6t2nOSPMPm8LWopj2mcCV7htPibvCQTek9H5FOoM/Tapj/YmwgYZW
 rCG8rC2mLmis63zTrgO1h37szE89L8CDCvUUB021H4ZVUp1mbzwk74IKSUBFc1nZkRfx
 B+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=5knSbSQijxZC5HFUsAquOUxZL1rUcVluvYQXYeJgsb0=;
 b=kwRI5/1mHr8ArC/RoKzW27veeCLWyxpcZgy+Y+oX3bi0dWWwCRCbjy4xSRsu+V9mU0
 15rZcNKKIzKKGNG177PFNWUWB9LQwy7s5ofQWoqx7jIqiUg8uJZsHnjQW3ezrQeVRfCG
 tSOf4tpfnyM0U80Dl7a3PeRzppEZ/RxoRW3CqSW0EH4jhqn6ZXM4cDYbp6+cfWB58nAd
 FnGJxGTnjLfai/LQBOMjUtq+7S7VHCfW2qtpbHjkQsH5kf16FOdxlIrIZ+yE5gAxEURY
 E9Uoej/jJU7/prfkKd2noE+brlvHQqs/qCk8sGu+dv/UO2kPJdTw8h8T64s2pGM6E/0M
 ndiw==
X-Gm-Message-State: APjAAAU6qYqYGYNVCRxzD2DoeHtckyqe5yL6K1RRn0PQwHTSVbbl4TiT
 CtMZGSVnnNgZuFxHPxB1C5TxfObbTUjbI/hhQjA=
X-Google-Smtp-Source: APXvYqzzzF26bBHdJ5gv28LLT3orSkoRJdbEhpTlZLpHzK0Tzgt25s9vmePRmy8uFj6us+9WLfltODWH2Abq+g5S4m0=
X-Received: by 2002:a54:4f14:: with SMTP id e20mr5515135oiy.84.1582141581512; 
 Wed, 19 Feb 2020 11:46:21 -0800 (PST)
MIME-Version: 1.0
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
 <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
 <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
In-Reply-To: <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
From: Radu Rendec <radu.rendec@gmail.com>
Date: Wed, 19 Feb 2020 14:46:10 -0500
Message-ID: <CAD5jUk9sd6tRZHySwxD5XxEJR-Cf2NNRgN-Y1HJRnSRqQBJWgA@mail.gmail.com>
Subject: Re: MCE handler gets NIP wrong on MPC8378
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/19/2020 at 10:11 AM Radu Rendec <radu.rendec@gmail.com> wrote:
> On 02/18/2020 at 1:08 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote=
:
> > Le 18/02/2020 =C3=A0 18:07, Radu Rendec a =C3=A9crit :
> > > The saved NIP seems to be broken inside machine_check_exception() on
> > > MPC8378, running Linux 4.9.191. The value is 0x900 most of the times,
> > > but I have seen other weird values.
> > >
> > > I've been able to track down the entry code to head_32.S (vector 0x20=
0),
> > > but I'm not sure where/how the NIP value (where the exception occurre=
d)
> > > is captured.
> >
> > NIP value is supposed to come from SRR0, loaded in r12 in PROLOG_2 and
> > saved into _NIP(r11) in transfer_to_handler in entry_32.S
> >
> > Can something clobber r12 at some point ?
> >
>
> I did something even simpler: I added the following
>
>       lis r12,0x1234
>
> ... right after
>
>       mfspr r12,SPRN_SRR0
>
> ... and now the NIP value I see in the crash dump is 0x12340000. This
> means r12 is not clobbered and most likely the NIP value I normally see
> is the actual SRR0 value.

I apologize for the noise. I just found out accidentally that the saved
NIP value is correct if interrupts are disabled at the time when the
faulty access that triggers the MCE occurs. This seems to happen
consistently.

By "interrupts are disabled" I mean local_irq_save/local_irq_restore, so
it's basically enough to wrap ioread32 to get the NIP value right.

Does this make any sense? Maybe it's not a silicon bug after all, or
maybe it is and I just found a workaround. Could this happen on other
PowerPC CPUs as well?

Best regards,
Radu

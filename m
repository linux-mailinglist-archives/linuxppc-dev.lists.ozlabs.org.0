Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC9B16529E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 23:41:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NCPp43cDzDqHj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 09:41:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::329;
 helo=mail-ot1-x329.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ihWYmlFD; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NCN15sKhzDq8v
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 09:40:01 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id p8so1779343oth.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 14:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Nxlvmy/sdCT0b427vBsfx0sJcmdS4BqsPFYAaLitdFs=;
 b=ihWYmlFDh68DUecXRq+bVERXrWjAA8erfEE0FUvGYt2gCdNlVxhZZCKyWnIwl4150v
 5+FMkd4P2D6oj3qgdNJTL8S4k+0k5EeSdnq44i98qos45xupAzhPOPIJ9qXfmhlpZdsU
 G9yi/Ha1Q86cQTINb0IsYslfRNWv3AvnfkLo6KTlfkC1JSlWoXHt9iMTMjnVrTI0WoA+
 BYp/veDGSlGONenoTruIXpF5x5SImBC3VpEquodfgO6RknI0GJAAjLGSqWw/t72cGyDB
 Xj41jPlneoiOGCa+tK96PYpq9roUq0D0oDLmn3wwb0Tuyp/CCaLDLqlGf1/Rb3XeUrE8
 3Rog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Nxlvmy/sdCT0b427vBsfx0sJcmdS4BqsPFYAaLitdFs=;
 b=t5PfRxUtW/efd4U0BqriAxpgrpioPdbqftrH08xy1zSoDAruNzKgKY0z4hKW837SIK
 aXdyNAXbsMQqop8HWbDCEJZH91WpANYM/6lrj+OVv9V5ddw95JQuw/if1boOXba3DmWk
 vkcLSWGFxY6hq4AKfrffGjo4HPn5r7lgXFGawk2Q5qDVLuuBIp6vI2hwDRae64aOMik/
 4olizWEZ5LVp52hDtJFw8dRcuIj/JT2yFMep5DlppOizZWPMQZBAiDmsE/IQ/hZdwL2C
 E/4mwStGd1m4yCkB8mlW/5/0Dhr+TcHBswrJ42SfkMr3qSL1tpv16sH/uKRmyD5tRsC+
 xghg==
X-Gm-Message-State: APjAAAVyvhawlFqxex3Y1MNDOKdm5tlHRL7DkvTqqYRYh9ALKO4DDf/+
 qwxN2f03W1lBAgycGUAQHvgvrsU7CetcXC2qUoM=
X-Google-Smtp-Source: APXvYqwiDxbj4JJy4b3fzGVf0YTsqdkCw3wBAyeWLP7Fqdf0q9PnJakDS3lUcGdpTCVYpagK8HnX/Bjadn8vr0XTDXU=
X-Received: by 2002:a9d:6ad6:: with SMTP id m22mr22380817otq.7.1582151998757; 
 Wed, 19 Feb 2020 14:39:58 -0800 (PST)
MIME-Version: 1.0
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
 <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
 <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
 <CAD5jUk9sd6tRZHySwxD5XxEJR-Cf2NNRgN-Y1HJRnSRqQBJWgA@mail.gmail.com>
 <20200219220829.Horde.I5UfTmHgQd92hm3jMgSMMA1@messagerie.si.c-s.fr>
 <20200219222110.Horde.MNo_rRZ0LaYxBYa_bppgCw1@messagerie.si.c-s.fr>
In-Reply-To: <20200219222110.Horde.MNo_rRZ0LaYxBYa_bppgCw1@messagerie.si.c-s.fr>
From: Radu Rendec <radu.rendec@gmail.com>
Date: Wed, 19 Feb 2020 17:39:47 -0500
Message-ID: <CAD5jUk-Wta-W26D7PUwi2__2GoDp9pOrKMiNCdu9TnWgMvy4GQ@mail.gmail.com>
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

On 02/19/2020 at 4:21 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> > Radu Rendec <radu.rendec@gmail.com> a =C3=A9crit :
> >> On 02/19/2020 at 10:11 AM Radu Rendec <radu.rendec@gmail.com> wrote:
> >>> On 02/18/2020 at 1:08 PM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
> >>>> Le 18/02/2020 =C3=A0 18:07, Radu Rendec a =C3=A9crit :
> >>>> > The saved NIP seems to be broken inside machine_check_exception() =
on
> >>>> > MPC8378, running Linux 4.9.191. The value is 0x900 most of the tim=
es,
> >>>> > but I have seen other weird values.
> >>>> >
> >>>> > I've been able to track down the entry code to head_32.S (vector 0=
x200),
> >>>> > but I'm not sure where/how the NIP value (where the exception occu=
rred)
> >>>> > is captured.
> >>>>
> >>>> NIP value is supposed to come from SRR0, loaded in r12 in PROLOG_2 a=
nd
> >>>> saved into _NIP(r11) in transfer_to_handler in entry_32.S
> >>>>
> >>>> Can something clobber r12 at some point ?
> >>>>
> >>>
> >>> I did something even simpler: I added the following
> >>>
> >>>      lis r12,0x1234
> >>>
> >>> ... right after
> >>>
> >>>      mfspr r12,SPRN_SRR0
> >>>
> >>> ... and now the NIP value I see in the crash dump is 0x12340000. This
> >>> means r12 is not clobbered and most likely the NIP value I normally s=
ee
> >>> is the actual SRR0 value.
> >>
> >> I apologize for the noise. I just found out accidentally that the save=
d
> >> NIP value is correct if interrupts are disabled at the time when the
> >> faulty access that triggers the MCE occurs. This seems to happen
> >> consistently.
> >>
> >> By "interrupts are disabled" I mean local_irq_save/local_irq_restore, =
so
> >> it's basically enough to wrap ioread32 to get the NIP value right.
> >>
> >> Does this make any sense? Maybe it's not a silicon bug after all, or
> >> maybe it is and I just found a workaround. Could this happen on other
> >> PowerPC CPUs as well?
> >
> > Interesting.
> >
> > 0x900 is the adress of the timer interrupt.
> >
> > Would the MCE occur just after the timer interrupt ?

I doubt that. I'm using a small test module to artificially trigger the
MCE. Basically it's just this (the full code is in my original post):

        bad_addr_base =3D ioremap(0xf0000000, 0x100);
        x =3D ioread32(bad_addr_base);

I find it hard to believe that every time I load the module the lwbrx
instruction that triggers the MCE is executed exactly after the timer
interrupt (or that the timer interrupt always occurs close to the lwbrx
instruction).

> >
> > Can you tell how are configured your IO busses, etc ... ?

Nothing special. The device tree is mostly similar to mpc8379_rdb.dts,
but I can provide the actual dts if you think it's relevant.

> And what's the value of SERSR after the machine check ?

I'm assuming you're talking about the IPIC SERSR register. I modified
machine_check_exception and added a call to ipic_get_mcp_status, which
seems to read IPIC_SERSR. The value is 0, both with interrupts enabled
and disabled (which makes sense, since disabling/enabling interrupts is
local to the CPU core).

> Do you use the local bus monitoring driver ?

I don't. In fact, I'm not even aware of it. What driver is that?

Best regards,
Radu

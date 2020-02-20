Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 39561166504
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 18:36:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NhbZ3fh2zDqf6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 04:36:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c;
 helo=mail-ot1-x32c.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hfbfqv05; dkim-atps=neutral
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NhYv1rFzzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 04:35:12 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id g64so4401065otb.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 09:35:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=w2NIcIEgutSHL639OyTo0UCAt5S40drjSv/U6y8UxLM=;
 b=hfbfqv05fiVXEVgn4WEwQNoADBwB+JsFlWWSytdym5g1sFL6RPkO53chFCMGiayW0M
 5sanazJSrPky5K6baPBhP6up9T2cEdR2+7SEp9J0gLZ8bPbwqsc2En2fmcQbaqrs5Voj
 At1iC2oNX3GW+vr2pfUI2Q8Yt25UZUJMe22xGbgfau27/MK5jhfCqlfOzPDSXf6KgtNN
 TL4J4ytmXSqcvaTE1winrE+i4z8QrZ/rltYthASSQ+sKGlQ9ueWV9iowjb1+DQEOz4xi
 X+5y1tc3pxT+J3xzm436K8WveLgIyvcBFWUhPY/La8CiWY5SM+27dC7wRx+rLuUyid/C
 w8qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=w2NIcIEgutSHL639OyTo0UCAt5S40drjSv/U6y8UxLM=;
 b=GcUz9q4R3ttkzgVpNImj1trL3FKx35nG3XLqAFH97lfULwvjxrCHWgcLwZP6UQT9sA
 jpn5QUAi7kZxbzldQgKKy5NThKH29pxgFgijtOwDY1RAMV4Rzc84g7QuY8VMfNgPZVDr
 Is9i3foH/EKedaTKi3/UNFVthe2hAhYZFcAFx//uZSHUPAY7f1QxYSxJicc5kZLCRYTY
 hKES8T33Yu3hgAwX/7uoU6UQKVdqU1iBUF0o20OdrD0sSR976hBvIpSgAZo2DawLX8mX
 qkUkJD0N9jxgbm3eOEmdsSyKpTvcyICuSTHbojbNGJpJ6WLpdd5gZM/5LPxEGOELEbnP
 Ibeg==
X-Gm-Message-State: APjAAAWJkPUfjTrY1H/22LPRiAAoGpazy0BISE8Inkz1IaU1HQEEx9CP
 Kths/mnoSaUNBw8zOpmUBAGVl0/0Ce+B1gXe3AQ=
X-Google-Smtp-Source: APXvYqyfQAdVv53vbEboEUZd8CebWNa0jsEY+wIU05G3aNHVE+nPzHi0anqbNRgoCD7XOuKn1IXKheknAf4DFa49OHs=
X-Received: by 2002:a9d:6e02:: with SMTP id e2mr25758640otr.194.1582220108811; 
 Thu, 20 Feb 2020 09:35:08 -0800 (PST)
MIME-Version: 1.0
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
 <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
 <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
 <CAD5jUk9sd6tRZHySwxD5XxEJR-Cf2NNRgN-Y1HJRnSRqQBJWgA@mail.gmail.com>
 <20200219220829.Horde.I5UfTmHgQd92hm3jMgSMMA1@messagerie.si.c-s.fr>
 <20200219222110.Horde.MNo_rRZ0LaYxBYa_bppgCw1@messagerie.si.c-s.fr>
 <CAD5jUk-Wta-W26D7PUwi2__2GoDp9pOrKMiNCdu9TnWgMvy4GQ@mail.gmail.com>
 <09e9a042-766c-d2e6-2300-cebc372cabde@c-s.fr>
 <CAD5jUk_L0tmy-2YwC9pZA=PXTeVLhq64emF3J5Vz=mVP_VHZ_w@mail.gmail.com>
 <8008403c-49cd-29bc-712d-2e13b601041c@c-s.fr>
In-Reply-To: <8008403c-49cd-29bc-712d-2e13b601041c@c-s.fr>
From: Radu Rendec <radu.rendec@gmail.com>
Date: Thu, 20 Feb 2020 12:34:57 -0500
Message-ID: <CAD5jUk9kEsWJDkgOD4rSsL6D2U92FLcunOSu6dVQjR1qdbMQWg@mail.gmail.com>
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

On 02/20/2020 at 11:25 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> Le 20/02/2020 =C3=A0 17:02, Radu Rendec a =C3=A9crit :
> > On 02/20/2020 at 3:38 AM Christophe Leroy <christophe.leroy@c-s.fr> wro=
te:
> >> On 02/19/2020 10:39 PM, Radu Rendec wrote:
> >>> On 02/19/2020 at 4:21 PM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
> >>>>> Interesting.
> >>>>>
> >>>>> 0x900 is the adress of the timer interrupt.
> >>>>>
> >>>>> Would the MCE occur just after the timer interrupt ?
> >>>
> >>> I doubt that. I'm using a small test module to artificially trigger t=
he
> >>> MCE. Basically it's just this (the full code is in my original post):
> >>>
> >>>           bad_addr_base =3D ioremap(0xf0000000, 0x100);
> >>>           x =3D ioread32(bad_addr_base);
> >>>
> >>> I find it hard to believe that every time I load the module the lwbrx
> >>> instruction that triggers the MCE is executed exactly after the timer
> >>> interrupt (or that the timer interrupt always occurs close to the lwb=
rx
> >>> instruction).
> >>
> >> Can you try to see how much time there is between your read and the MC=
E ?
> >> The below should allow it, you'll see first value in r13 and the other
> >> in r14 (mce.c is your test code)
> >>
> >> Also provide the timebase frequency as reported in /proc/cpuinfo
> >
> > I just ran a test: r13 is 0xda8e0f91 and r14 is 0xdaae0f9c.
> >
> > # cat /proc/cpuinfo
> > processor       : 0
> > cpu             : e300c4
> > clock           : 800.000004MHz
> > revision        : 1.1 (pvr 8086 1011)
> > bogomips        : 200.00
> > timebase        : 100000000
> >
> > The difference between r14 and r13 is 0x20000b. Assuming TB is
> > incremented with 'timebase' frequency, that means 20.97 milliseconds
> > (although the e300 manual says TB is "incremented once every four core
> > input clock cycles").
>
> I wouldn't be surprised that the internal CPU clock be twice the input
> clock.
>
> So that's long enough to surely get a timer interrupt during every bad
> access.
>
> Now we have to understand why SRR1 contains the address of the timer
> exception entry and not the address of the bad access.
>
> The value of SRR1 confirms that it comes from 0x900 as MSR[IR] and [DR]
> are cleared when interrupts are enabled.
>
> Maybe you should file a support case at NXP. They are usually quite
> professionnal at responding.

I already did (quite some time ago), but it started off as "why does the
MCE occur in the first place". That part has already been figured out,
but unfortunately I don't have a viable solution to it. Like you said,
now the focus has shifted to understanding why the SRR0 value is not
what we expect.

I asked them the question about SRR0 as soon as you helped me get back
on track and figured out there's nothing wrong with the Linux MCE
handler and the NIP value comes from SRR0. What they came up with is
basically this paragraph in the e300 core manual (section 5.5.2):

| Note that the e300 core makes no attempt to force recoverability on a
| machine check; however, it does guarantee that the machine check
| interrupt is always taken immediately upon request, with a nonpredicted
| address saved in SRR0, regardless of the current machine state.

... and with an emphasis on "nonpredicted". To be honest, I am a bit
disappointed with their response and I believe in this context what
"unpredicted" means is that the address that is saved to SRR0 is a
"real" address rather than the result of branch prediction. The support
folks were probably thinking "unpredictable". But that's another word
and the difference is quite subtle :)

I updated the case and added information about the interrupts and the
timing. Let's see what they come up with this time.

Best regards,
Radu

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FDE16F409
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 01:03:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RwxM1bp3zDqJg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 11:03:19 +1100 (AEDT)
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
 header.s=20161025 header.b=NNlbyOlu; dkim-atps=neutral
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RwvY5BHfzDqWv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 11:01:45 +1100 (AEDT)
Received: by mail-ot1-x329.google.com with SMTP id 66so1264714otd.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 16:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K4AyfEEmBTE83I7/E2HSjl2p4uZT43zq/BmqmN5/Xks=;
 b=NNlbyOlu9AZerZAhDMIOLCwnduuTj04yVJKq+YwDDTG0gvWDB7yXXvP37BJpvQn0MJ
 lToDMg/qpxwSsyzp7tbozYuVqr8NhzKbnb5R9D8zh7VfXyi2uySJ/WbOgZhy86bh/8fW
 xsGqAkFhj3+BjyTiD6HshOHxmy9mS1ec/OXYyB/5sKg6tK+Z+0K+2M0O+PiW71E8E59j
 oAnhrbta4sR6Kagj4Wf5Koo9r0ZHkHw5CqzN1JScl1ZKF5/+aV3Dst1/vbA171pb25vh
 PpRL7fgIypZeJ3TyvzdO5hZ+yGaHjlBA0X3xOBi/arO+9TTUZ09QOWiN+n6kjA7F8lvk
 QSmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K4AyfEEmBTE83I7/E2HSjl2p4uZT43zq/BmqmN5/Xks=;
 b=IBy+BaUyqYVT/gc6zhOqj+bO6MXKEIfTnW/L1XCrkNjZFG3vqwQVi3SfBdFISlNwCt
 JJ0QXJt1N5vdUKO61UpzF9hvfZU6thrkG1KGHJGuIoOXKWmUOQzEAzWCqNPSLKX2GVH9
 nBbA4jxk4ohFcLJDriSxTUlS9DCz8QU9net7iFhhZykl+vsH7G8KFxzICuUKaRwd1FiA
 hr2pnyTtQjiXySPot6FVbh/vUD5Lyvu94km9/CjmxKAvjmDCBZDjGSdpuNrH0idFbYLt
 WF95tWaXKkZ5HLQgIPVfpBo0Z7JGaaUXkkVv8tLBGErVdG8inIlfCG/lyxHBihffAJ6w
 t1Lg==
X-Gm-Message-State: APjAAAWNsvScDHTIykrw7CDWxSLg54TTqubMqzJK02P/PI20NM7f6jX6
 FCOusvt3xFoKWhvOtE3Y5SwOva+b4FJHg8uGzd0=
X-Google-Smtp-Source: APXvYqxxREsg+fuh6JYTHhpdh2JxS6tJ8X+5Xnx9SSx8nY/MWrNDtfKIbrbg2jAsV0/ImjBkNVx7vPyv+d1/bZed55E=
X-Received: by 2002:a05:6830:1049:: with SMTP id
 b9mr946996otp.100.1582675301710; 
 Tue, 25 Feb 2020 16:01:41 -0800 (PST)
MIME-Version: 1.0
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
 <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
 <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
In-Reply-To: <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
From: Radu Rendec <radu.rendec@gmail.com>
Date: Tue, 25 Feb 2020 19:01:30 -0500
Message-ID: <CAD5jUk-UMhkK20vMSxO5PcizJLsNc-=Go8_JuKu_VgEOSdGOYg@mail.gmail.com>
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

On 02/20/2020 at 12:48 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> Le 20/02/2020 =C3=A0 18:34, Radu Rendec a =C3=A9crit :
> > On 02/20/2020 at 11:25 AM Christophe Leroy <christophe.leroy@c-s.fr> wr=
ote:
> >> Le 20/02/2020 =C3=A0 17:02, Radu Rendec a =C3=A9crit :
> >>> On 02/20/2020 at 3:38 AM Christophe Leroy <christophe.leroy@c-s.fr> w=
rote:
> >>>> On 02/19/2020 10:39 PM, Radu Rendec wrote:
> >>>>> On 02/19/2020 at 4:21 PM Christophe Leroy <christophe.leroy@c-s.fr>=
 wrote:
> >>>>>>> Interesting.
> >>>>>>>
> >>>>>>> 0x900 is the adress of the timer interrupt.
> >>>>>>>
> >>>>>>> Would the MCE occur just after the timer interrupt ?
> >>>>>
> >>>>> I doubt that. I'm using a small test module to artificially trigger=
 the
> >>>>> MCE. Basically it's just this (the full code is in my original post=
):
> >>>>>
> >>>>>            bad_addr_base =3D ioremap(0xf0000000, 0x100);
> >>>>>            x =3D ioread32(bad_addr_base);
> >>>>>
> >>>>> I find it hard to believe that every time I load the module the lwb=
rx
> >>>>> instruction that triggers the MCE is executed exactly after the tim=
er
> >>>>> interrupt (or that the timer interrupt always occurs close to the l=
wbrx
> >>>>> instruction).
> >>>>
> >>>> Can you try to see how much time there is between your read and the =
MCE ?
> >>>> The below should allow it, you'll see first value in r13 and the oth=
er
> >>>> in r14 (mce.c is your test code)
> >>>>
> >>>> Also provide the timebase frequency as reported in /proc/cpuinfo
> >>>
> >>> I just ran a test: r13 is 0xda8e0f91 and r14 is 0xdaae0f9c.
> >>>
> >>> # cat /proc/cpuinfo
> >>> processor       : 0
> >>> cpu             : e300c4
> >>> clock           : 800.000004MHz
> >>> revision        : 1.1 (pvr 8086 1011)
> >>> bogomips        : 200.00
> >>> timebase        : 100000000
> >>>
> >>> The difference between r14 and r13 is 0x20000b. Assuming TB is
> >>> incremented with 'timebase' frequency, that means 20.97 milliseconds
> >>> (although the e300 manual says TB is "incremented once every four cor=
e
> >>> input clock cycles").
> >>
> >> I wouldn't be surprised that the internal CPU clock be twice the input
> >> clock.
> >>
> >> So that's long enough to surely get a timer interrupt during every bad
> >> access.
> >>
> >> Now we have to understand why SRR1 contains the address of the timer
> >> exception entry and not the address of the bad access.
> >>
> >> The value of SRR1 confirms that it comes from 0x900 as MSR[IR] and [DR=
]
> >> are cleared when interrupts are enabled.
> >>
> >> Maybe you should file a support case at NXP. They are usually quite
> >> professionnal at responding.
> >
> > I already did (quite some time ago), but it started off as "why does th=
e
> > MCE occur in the first place". That part has already been figured out,
> > but unfortunately I don't have a viable solution to it. Like you said,
> > now the focus has shifted to understanding why the SRR0 value is not
> > what we expect.
>
> Yes now the point is to understand why it starts processing the timer
> interrupt at 0x900 (with IR and DR cleared as observed in SRR1) just
> before taking the Machine Check.
>
> Allthough the execution of the decrementer interrupt is queue for after
> the completion of the failing memory access, I'd expect the Machine
> Check to take priority.
>
> Note that I have never observed such a behaviour on MPC8321 which has an
> e300c2 core.

I apologize for the silence during the past few days, I've been diverted
with something else. This is the feedback that I got from NXP:

| The e300 core uses SRR0/1 for both non-critical interrupts and machine
| check interrupts and if they happen simultaneously a problem can occur
| where the return address from the first exception is lost when handling
| the second exception concurrently. This only occurs in the rare case
| when the software ISR hasn't had the time to save SRR0/1 to the sw stack.
|
| If the ability to nest interrupts is desired, software then saves off
| enough state (i.e. the contents of SRR0, SRR1, etc) that will allow it
| to recover (i.e. resume handling the current interrupt) if another
| interrupt occurs.

So basically what they describe is a race condition between the MCE and
a regular interrupt, where the regular interrupt (the timer interrupt,
in our case) kicks in after the MCE handler is entered into but before
it saves SRR0. This not only requires very precise timing, but would
also end up with a saved SRR0 value that points back somewhere inside
the MCE handler.

But I've thought about something else. We already timed it and we know
it consistently takes around 20 ms between the faulty read and the MCE
handler execution. I'm thinking that the faulty read is essentially a
failed transaction on the internal bus, because no peripheral replies
to the access on the bad address. The 20 ms is probably the bus timeout.
How does this scenario look to you?

- The faulty read starts to execute. A new internal bus transaction is
  started, the bad address is put on the bus and the CPU waits for a
  peripheral to reply.
- The timer interrupt kicks in. The CPU saves NIP to SRR0 and NIP
  becomes 0x900. But the CPU cannot start executing immediately from
  address 0x900 because the bus is blocked.
- Nobody replies and eventually the bus transaction fails. An MCE is
  triggered to handle the failed bus transaction.
- The MCE has higher priority than the timer interrupt, so it's handled
  immediately. The CPU saves NIP to SRR0 and NIP becomes 0x200.
- The CPU starts executing the MCE handler with 0x900 in SRR0.

This is pure speculation and I have absolutely no idea about the e300
core internal architecture. But it's my best guess. I've sent something
similar to NXP support. Let's see what they come up with.

By the way, I have successfully tested a fix that uses __do_inl instead
of ioread32 and disables interrupts around the __do_inl call. If I was
even close with my speculation above, then I guess the only thing we
could fix in the kernel would be to modify __do_inl and co. to disable
interrupts around the potentially dangerous access. The benefit would be
that the MCE could be recovered from. For ioread32, there is no real
benefit in doing that (other than printing the correct NIP address in
the crash dump) because it doesn't instrument the exception tables
anyway so it's non-recoverable.

Best regards,
Radu

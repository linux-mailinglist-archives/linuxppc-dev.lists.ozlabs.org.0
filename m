Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A83801661CA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 17:04:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48NfYX3RTMzDqYb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 03:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32a;
 helo=mail-ot1-x32a.google.com; envelope-from=radu.rendec@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AMRJbC/T; dkim-atps=neutral
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48NfWQ3BPczDqVb
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 03:02:56 +1100 (AEDT)
Received: by mail-ot1-x32a.google.com with SMTP id p8so4087367oth.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 08:02:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=k2cMxLsxICUBu85ROJYq+vy4aRufOWzp5RVY1tWx+Gg=;
 b=AMRJbC/T1/Leer1KrHPcN5V90Kk498KpW25PuP4vu4vlWjnCVOS9Gdcy5JRUg1GC+V
 o+pwQ7suDnTHPch4cCXI+nUcQZbzoUjfdBMUCoNEQi68q3nS0G3RETd0U9HfIzdJckp/
 WHUT6XIYFMsFA+GvGZK456Xn5tAyAQsBRyhqe4CAeOHZYU2dXStEdCtd220dG72xYIpR
 /omYqYS4liFexGiNOt5RW+uMv4VbIFY4ZxH1e+5HhZmJBpAIVVOC+84DymUVCmPARIYy
 FYBP7XaTnU/ENK/oMm8tlGwBQBDntxWQCxAe44Ir0t9uUsgn/O8pNpvoVie6CbarrieN
 DJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=k2cMxLsxICUBu85ROJYq+vy4aRufOWzp5RVY1tWx+Gg=;
 b=HBqsWtGDCwi02z8j61lpRbl+l+ybSEdAr/bQz9ffxqLcwjyjVXQ+kUAnMwL0lYvks2
 9V+hU+1vaKeLhfvCFCkLSCJuCtkZZPCe4zC2pH/f7RjcEyG/IFU3JuScgFsal4fUquZK
 F007RIadCLJ/1QHMjwaFtZnkdPcPoVFrrM6GNdCQH7+Rqvf5dzISEkOVw+rYVpbYHI06
 bpCYf+8sXs2IAkPW7M8FLYDCaQz1dLcH2Ajzx1I0zWMj/wdEhzWOjyE29Xt+v2ZSAGdT
 7f7/HtmDDa6HNs/ervtNJFbtOLkC10Ltq+4yfPCVEz7B6+W00DJxhRIfKBAm/EdIiXa4
 u3RA==
X-Gm-Message-State: APjAAAXgkXuKBDkcUHyHjvkgKWeHiFpwtVj6yLaCDi/gsxCER+iVHHVW
 Ocl5J0bQhk+AYj5GwhXECeHJsClM+wfN5oLQgcJvSwhh
X-Google-Smtp-Source: APXvYqz7rwjKzg+a00F+iHKWNObeDwc3IwZjZIKDs5sD6qsyiYj7ntimQcYKpDy3OKY9P6E4NBB1KEirLVww4r6oBYA=
X-Received: by 2002:a05:6830:22ca:: with SMTP id
 q10mr25858752otc.280.1582214572929; 
 Thu, 20 Feb 2020 08:02:52 -0800 (PST)
MIME-Version: 1.0
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
 <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
 <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
 <CAD5jUk9sd6tRZHySwxD5XxEJR-Cf2NNRgN-Y1HJRnSRqQBJWgA@mail.gmail.com>
 <20200219220829.Horde.I5UfTmHgQd92hm3jMgSMMA1@messagerie.si.c-s.fr>
 <20200219222110.Horde.MNo_rRZ0LaYxBYa_bppgCw1@messagerie.si.c-s.fr>
 <CAD5jUk-Wta-W26D7PUwi2__2GoDp9pOrKMiNCdu9TnWgMvy4GQ@mail.gmail.com>
 <09e9a042-766c-d2e6-2300-cebc372cabde@c-s.fr>
In-Reply-To: <09e9a042-766c-d2e6-2300-cebc372cabde@c-s.fr>
From: Radu Rendec <radu.rendec@gmail.com>
Date: Thu, 20 Feb 2020 11:02:41 -0500
Message-ID: <CAD5jUk_L0tmy-2YwC9pZA=PXTeVLhq64emF3J5Vz=mVP_VHZ_w@mail.gmail.com>
Subject: Re: MCE handler gets NIP wrong on MPC8378
To: Christophe Leroy <christophe.leroy@c-s.fr>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02/20/2020 at 3:38 AM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> On 02/19/2020 10:39 PM, Radu Rendec wrote:
> > On 02/19/2020 at 4:21 PM Christophe Leroy <christophe.leroy@c-s.fr> wrote:
> >>> Interesting.
> >>>
> >>> 0x900 is the adress of the timer interrupt.
> >>>
> >>> Would the MCE occur just after the timer interrupt ?
> >
> > I doubt that. I'm using a small test module to artificially trigger the
> > MCE. Basically it's just this (the full code is in my original post):
> >
> >          bad_addr_base = ioremap(0xf0000000, 0x100);
> >          x = ioread32(bad_addr_base);
> >
> > I find it hard to believe that every time I load the module the lwbrx
> > instruction that triggers the MCE is executed exactly after the timer
> > interrupt (or that the timer interrupt always occurs close to the lwbrx
> > instruction).
>
> Can you try to see how much time there is between your read and the MCE ?
> The below should allow it, you'll see first value in r13 and the other
> in r14 (mce.c is your test code)
>
> Also provide the timebase frequency as reported in /proc/cpuinfo

I just ran a test: r13 is 0xda8e0f91 and r14 is 0xdaae0f9c.

# cat /proc/cpuinfo
processor       : 0
cpu             : e300c4
clock           : 800.000004MHz
revision        : 1.1 (pvr 8086 1011)
bogomips        : 200.00
timebase        : 100000000

The difference between r14 and r13 is 0x20000b. Assuming TB is
incremented with 'timebase' frequency, that means 20.97 milliseconds
(although the e300 manual says TB is "incremented once every four core
input clock cycles").

I repeated the test twice and the absolute values were of course very
different, but r14-r13 was 0x20000c and 0x200011, so it seems to be
quite consistent (within just a few clock cycles).

Just for the fun of it, I repeated the test once more, but with
interrupts disabled. The difference was 0x200014. FWIW, I disabled
interrupts before sampling TB in r13.

> And what's the reason given in the Oops message for the machine check ?
> Is that "Caused by (from SRR1=49030): Transfer error ack signal" or
> something else ?

When interrupts are enabled:
Caused by (from SRR1=41000): Transfer error ack signal

When interrupts are disabled:
Caused by (from SRR1=41030): Transfer error ack signal

> >
> >> Do you use the local bus monitoring driver ?
> >
> > I don't. In fact, I'm not even aware of it. What driver is that?
>
> CONFIG_FSL_LBC

OK, it seems I'm actually using it. I haven't enabled it explicitly, but
it's automatically pulled by CONFIG_MTD_NAND_FSL_ELBC as a prerequisite.

I looked at the code in arch/powerpc/sysdev/fsl_lbc.c and it's quite
small. Most of the code is in fsl_lbc_ctrl_irq, which I guess is
supposed to print a message if/when the LBC catches an error. I've never
seen any of those messages being printed.

Best regards,
Radu

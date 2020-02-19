Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D56D165166
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 22:09:52 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N9Mx2P1yzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 08:09:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N9LM6d1XzDqCR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 08:08:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48N9LF0Hvdz9vBBV;
 Wed, 19 Feb 2020 22:08:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id BwpFfVxwavKW; Wed, 19 Feb 2020 22:08:20 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48N9LD6RSVz9vBBT;
 Wed, 19 Feb 2020 22:08:20 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 1A5D9BD0; Wed, 19 Feb 2020 22:08:29 +0100 (CET)
Received: from rop17-1_migr-88-124-70-171.fbx.proxad.net
 (rop17-1_migr-88-124-70-171.fbx.proxad.net [88.124.70.171]) by
 messagerie.si.c-s.fr (Horde Framework) with HTTP; Wed, 19 Feb 2020 22:08:29
 +0100
Date: Wed, 19 Feb 2020 22:08:29 +0100
Message-ID: <20200219220829.Horde.I5UfTmHgQd92hm3jMgSMMA1@messagerie.si.c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
To: Radu Rendec <radu.rendec@gmail.com>
Subject: Re: MCE handler gets NIP wrong on MPC8378
References: <CAD5jUk_8DAvneGjkQ7JOOuNeXaKU1g9E09+H8M5Eo=ttgthdgg@mail.gmail.com>
 <a0856192-804b-fe2a-ccb8-48b43b130696@c-s.fr>
 <CAD5jUk-WzPLYSAxDuWFa3fWcZpT97suySVDEBvUn7V+N01bzTw@mail.gmail.com>
 <CAD5jUk9sd6tRZHySwxD5XxEJR-Cf2NNRgN-Y1HJRnSRqQBJWgA@mail.gmail.com>
In-Reply-To: <CAD5jUk9sd6tRZHySwxD5XxEJR-Cf2NNRgN-Y1HJRnSRqQBJWgA@mail.gmail.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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

Radu Rendec <radu.rendec@gmail.com> a =C3=A9crit=C2=A0:

> On 02/19/2020 at 10:11 AM Radu Rendec <radu.rendec@gmail.com> wrote:
>> On 02/18/2020 at 1:08 PM Christophe Leroy <christophe.leroy@c-s.fr> wrot=
e:
>> > Le 18/02/2020 =C3=A0 18:07, Radu Rendec a =C3=A9crit :
>> > > The saved NIP seems to be broken inside machine_check_exception() on
>> > > MPC8378, running Linux 4.9.191. The value is 0x900 most of the times=
,
>> > > but I have seen other weird values.
>> > >
>> > > I've been able to track down the entry code to head_32.S (vector 0x2=
00),
>> > > but I'm not sure where/how the NIP value (where the exception occurr=
ed)
>> > > is captured.
>> >
>> > NIP value is supposed to come from SRR0, loaded in r12 in PROLOG_2 and
>> > saved into _NIP(r11) in transfer_to_handler in entry_32.S
>> >
>> > Can something clobber r12 at some point ?
>> >
>>
>> I did something even simpler: I added the following
>>
>>       lis r12,0x1234
>>
>> ... right after
>>
>>       mfspr r12,SPRN_SRR0
>>
>> ... and now the NIP value I see in the crash dump is 0x12340000. This
>> means r12 is not clobbered and most likely the NIP value I normally see
>> is the actual SRR0 value.
>
> I apologize for the noise. I just found out accidentally that the saved
> NIP value is correct if interrupts are disabled at the time when the
> faulty access that triggers the MCE occurs. This seems to happen
> consistently.
>
> By "interrupts are disabled" I mean local_irq_save/local_irq_restore, so
> it's basically enough to wrap ioread32 to get the NIP value right.
>
> Does this make any sense? Maybe it's not a silicon bug after all, or
> maybe it is and I just found a workaround. Could this happen on other
> PowerPC CPUs as well?

Interesting.

0x900 is the adress of the timer interrupt.

Would the MCE occur just after the timer interrupt ?

Can you tell how are configured your IO busses, etc ... ?

Christophe



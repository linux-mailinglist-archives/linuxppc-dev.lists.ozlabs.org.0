Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3736750C691
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 04:30:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KlZxk0s27z3bqd
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Apr 2022 12:30:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gPj64rNy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gPj64rNy; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KlZx16Wk5z2yMP
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Apr 2022 12:29:39 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id b15so9633828pfm.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Apr 2022 19:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=viXXWgWXVo95+o/9NZZA7H7Wid1vy02UHZgXcnwGRG0=;
 b=gPj64rNyAU5X7R2GnB5ivbb2GkOtZwpkeSL7PXb1I4pG9+VwTbZebtgmrNmy2h9xyZ
 Do+gaWYFMCm7y1fKMksrcse9C+iAW/8dF7Y3W9cUP0T6MkW4hRZELHDvqfCVk2MiWyYs
 x7UVyWVSC2kVmWuLTsd22vCDGi+rT0cKczrLmptm3Uf6P1i4i3a9NUoDuF0Qh4xAWkVC
 hNHnlAwDVqqzW9IdKnpRxa59naX3DoWYZXvOcb3S4WnvS2joavGB4772Y7uwKNyYygtv
 kyVrUNQ/jG3FdBhNYsgaDmoxcQXYIjeluqBuZsoqaOKR9B29Cmd13gp0t7lpRYPblAqA
 ROyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=viXXWgWXVo95+o/9NZZA7H7Wid1vy02UHZgXcnwGRG0=;
 b=XlUhgAPdDJMFs2FVlGwnECVGADp4Vl5O0ovuZSlzH5J0rwl3uNwrRtjCuckQnZk0aI
 zXeSczzZH4Ai59yC+cOv3eliNsaF0gHTejKcYUGMfvKW2jv5n3b6IrTSPhaf2SQoxeCX
 S2e9T3rwrlm32H3YRTlwFovfX1Hc1QBB3Bc0UYRjvtizixFlHjHHoYQ/xjkx0x8hRrmA
 C8g/fHHAfLQg1vpTMjZNJnqkWW/zzybyJO+8pspU1XzyjRbFSkCwRDZrAMAafi18VjC5
 JiGCT5VEHtJgHksdomzlPbGmIKaninabwEw+SvwjsbeOBxP2AZ3wsU5fvNSLtjxQcq8b
 zHLQ==
X-Gm-Message-State: AOAM530BSqp8s05t2RHc/3SGeyiwLfbKJJ6vvz/YShqCZFLtOWAQlivi
 pvcqGnWulKJ054of9wylO7Q=
X-Google-Smtp-Source: ABdhPJztIe86JJ+KtDnEBTYYIG/4bg02fLjWPTWYqhxTWgo34Soe/HW+co69m4YhCUGpvIxt+6fyEQ==
X-Received: by 2002:a05:6a00:2444:b0:4fd:db81:cbdd with SMTP id
 d4-20020a056a00244400b004fddb81cbddmr7857701pfj.32.1650680976716; 
 Fri, 22 Apr 2022 19:29:36 -0700 (PDT)
Received: from localhost (193-116-116-20.tpgi.com.au. [193.116.116.20])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a056a00078900b0050a4bae652fsm3701750pfu.131.2022.04.22.19.29.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 19:29:36 -0700 (PDT)
Date: Sat, 23 Apr 2022 12:29:30 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re:
To: Michael Ellerman <mpe@ellerman.id.au>, paulmck@kernel.org, Thomas Gleixner
 <tglx@linutronix.de>, Zhouyi Zhou <zhouzhouyi@gmail.com>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au> <87k0bz7i1s.fsf@mpe.ellerman.id.au>
 <1649818529.j46672mh2p.astroid@bobo.none> <87fsm55d3f.ffs@tglx>
In-Reply-To: <87fsm55d3f.ffs@tglx>
MIME-Version: 1.0
Message-Id: <1650680264.0sj0tnkzx7.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: =?iso-8859-1?q?Viresh=0A?= Kumar <viresh.kumar@linaro.org>,
 =?iso-8859-1?q?Daniel=0A?= Lezcano <daniel.lezcano@linaro.org>,
 linux-kernel@vger.kernel.org, rcu <rcu@vger.kernel.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Thomas Gleixner's message of April 23, 2022 1:53 am:
> On Wed, Apr 13 2022 at 15:11, Nicholas Piggin wrote:
>> So we traced the problem down to possibly a misunderstanding between=20
>> decrementer clock event device and core code.
>>
>> The decrementer is only oneshot*ish*. It actually needs to either be=20
>> reprogrammed or shut down otherwise it just continues to cause=20
>> interrupts.
>=20
> I always thought that PPC had sane timers. That's really disillusioning.

My comment was probably a bit misleading explanation of the whole
situation. This weirdness is actually in software in the powerpc
clock event driver due to a recent change I made assuming the clock=20
event goes to oneshot-stopped.

The hardware is relatively sane I think, global synchronized constant
rate high frequency clock distributed to the CPUs so reads don't
go off-core. And per-CPU "decrementer" event interrupt at the same
frequency as the clock -- program it to a +ve value and it decrements
until zero then creates basically a level triggered interrupt.

Before my change, the decrementer interrupt would always clear the
interrupt at entry. The event_handler usually programs another
timer in so I tried to avoid that first clear counting on the
oneshot_stopped callback to clear the interrupt if there was no
other timer.

>> Before commit 35de589cb879, it was sort of two-shot. The initial=20
>> interrupt at the programmed time would set its internal next_tb variable=
=20
>> to ~0 and call the ->event_handler(). If that did not set_next_event or=20
>> stop the timer, the interrupt will fire again immediately, notice=20
>> next_tb is ~0, and only then stop the decrementer interrupt.
>>
>> So that was already kind of ugly, this patch just turned it into a hang.
>>
>> The problem happens when the tick is stopped with an event still=20
>> pending, then tick_nohz_handler() is called, but it bails out because=20
>> tick_stopped =3D=3D 1 so the device never gets programmed again, and so =
it=20
>> keeps firing.
>>
>> How to fix it? Before commit a7cba02deced, powerpc's decrementer was=20
>> really oneshot, but we would like to avoid doing that because it require=
s=20
>> additional programming of the hardware on each timer interrupt. We have=20
>> the ONESHOT_STOPPED state which seems to be just about what we want.
>>
>> Did the ONESHOT_STOPPED patch just miss this case, or is there a reason=20
>> we don't stop it here? This patch seems to fix the hang (not heavily
>> tested though).
>=20
> This was definitely overlooked, but it's arguable it is is not required
> for real oneshot clockevent devices. This should only handle the case
> where the interrupt was already pending.
>=20
> The ONESHOT_STOPPED state was introduced to handle the case where the
> last timer gets canceled, so the already programmed event does not fire.
>=20
> It was not necessarily meant to "fix" clockevent devices which are
> pretending to be ONESHOT, but keep firing over and over.
>=20
> That, said. I'm fine with the change along with a big fat comment why
> this is required.

Thanks for taking a look and confirming. I just sent a patch with a
comment and what looks like another missed case. Hopefully it's okay.

Thanks,
Nick

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C7064FEF66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 08:10:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdXJh1dc5z3bbB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 16:10:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=I2VW7T5l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=I2VW7T5l; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KdXJ26Jgmz2xf9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 16:10:10 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id ll10so987143pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Apr 2022 23:10:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=0g9UcE2zL5w+G01NTjUcugLriSQ8wpxoQjCrz2R0018=;
 b=I2VW7T5lmrxE21qiKPO9lndJB6OgiCBkcMN5noH755MjocM5a4fiUTmOIIm2TkCFK+
 0dPWv4t4FK9A+A2QucvMbMDu4RgXm9Wqj53zCnwCtHb+LXNhrRdhMqexatsIJc2BYQEK
 n/vhUydLYp8dwRFLlT++nQpMFc2+AuV0L6TusfGFeckcFvnb3KIt4gs1ZaDovrtx9y20
 qaiB6n9fI9Ypixj6f8nRwHMFW8WaNK4Yr9y/IBbyEnUF57x2iLURIHkp6vLJX4tVKU92
 S5pbE89v3RQIc8669YQwHiuEpWdhHh0hlUVzfp8f4KfKvwCY0IiAtunVRb59uUJR1Os+
 k9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=0g9UcE2zL5w+G01NTjUcugLriSQ8wpxoQjCrz2R0018=;
 b=4Pwurbdl7D6BRq3NUtV3LEHRni4QYxtDD0P7LoJx2kMBYT3awgXasxiPpFQstrtsQX
 UT1hJQrovhx6b/ckpCwXfGJfh4u8g5r+Z5bpLI2JmcnxMAWrdYxKusvwsKob33KSD333
 Wj35lgP82jMa6xOyCbrPj5HCLhUaFrtdfA9HcD3FH4WNZZYATg118Pb0gvlNJtQa+K5V
 9Q8JefgveGW5HwFW2lhpgakHnIIe6TEN/Ly3RuSo+6u66U5G7Bpvf6j4Ns2Z8i1ywt+5
 eAqEjU16iw+JIPTLS3Vg40Pu+i4CCCO4nMVZBmMlWo59GYc00qnNzQk/Ck/4jrQcb+2Z
 ldxg==
X-Gm-Message-State: AOAM5335zasqavqGXuch6nUEEN6kX28cnZC5RiXsyIVb18Fb6NWO2be6
 AxICsfa6rwA9dlIOYCPnHxU=
X-Google-Smtp-Source: ABdhPJwZGUY1wE3FwLT56wfTkox589sv0KFwbe72PnNBrsjgcyxpDTyj5tceVyPohBuu8hSyRW7Qag==
X-Received: by 2002:a17:90b:1bc4:b0:1cb:c3db:5f4c with SMTP id
 oa4-20020a17090b1bc400b001cbc3db5f4cmr7738423pjb.125.1649830207617; 
 Tue, 12 Apr 2022 23:10:07 -0700 (PDT)
Received: from localhost (220-235-208-104.tpgi.com.au. [220.235.208.104])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a056a00240500b004e15d39f15fsm41452636pfh.83.2022.04.12.23.10.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 23:10:07 -0700 (PDT)
Date: Wed, 13 Apr 2022 16:10:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Low-res tick handler device not going to ONESHOT_STOPPED when tick is
 stopped (was: rcu_sched self-detected stall on CPU)
To: Michael Ellerman <mpe@ellerman.id.au>, paulmck@kernel.org, Zhouyi Zhou
 <zhouzhouyi@gmail.com>
References: <CANiq72k+5Rdj7i3Df2dcE6_OPYPXK3z5EWLKnY56sSMz4G3OvA@mail.gmail.com>
 <CAABZP2z64aYWfVSdXHaQopWc+BAbJJUGqtrju2iWER3DDTDFWg@mail.gmail.com>
 <20220406170012.GO4285@paulmck-ThinkPad-P17-Gen-1>
 <87pmls6nt7.fsf@mpe.ellerman.id.au> <87k0bz7i1s.fsf@mpe.ellerman.id.au>
 <1649818529.j46672mh2p.astroid@bobo.none>
In-Reply-To: <1649818529.j46672mh2p.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1649829917.xni78o33uo.astroid@bobo.none>
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
Cc: Viresh Kumar <viresh.kumar@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-kernel@vger.kernel.org,
 rcu <rcu@vger.kernel.org>, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Oops, fixed subject...

Excerpts from Nicholas Piggin's message of April 13, 2022 3:11 pm:
> +Daniel, Thomas, Viresh
>=20
> Subject: Re: rcu_sched self-detected stall on CPU
>=20
> Excerpts from Michael Ellerman's message of April 9, 2022 12:42 am:
>> Michael Ellerman <mpe@ellerman.id.au> writes:
>>> "Paul E. McKenney" <paulmck@kernel.org> writes:
>>>> On Wed, Apr 06, 2022 at 05:31:10PM +0800, Zhouyi Zhou wrote:
>>>>> Hi
>>>>>=20
>>>>> I can reproduce it in a ppc virtual cloud server provided by Oregon
>>>>> State University.  Following is what I do:
>>>>> 1) curl -l https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/l=
inux.git/snapshot/linux-5.18-rc1.tar.gz
>>>>> -o linux-5.18-rc1.tar.gz
>>>>> 2) tar zxf linux-5.18-rc1.tar.gz
>>>>> 3) cp config linux-5.18-rc1/.config
>>>>> 4) cd linux-5.18-rc1
>>>>> 5) make vmlinux -j 8
>>>>> 6) qemu-system-ppc64 -kernel vmlinux -nographic -vga none -no-reboot
>>>>> -smp 2 (QEMU 4.2.1)
>>>>> 7) after 12 rounds, the bug got reproduced:
>>>>> (http://154.223.142.244/logs/20220406/qemu.log.txt)
>>>>
>>>> Just to make sure, are you both seeing the same thing?  Last I knew,
>>>> Zhouyi was chasing an RCU-tasks issue that appears only in kernels
>>>> built with CONFIG_PROVE_RCU=3Dy, which Miguel does not have set.  Or d=
id
>>>> I miss something?
>>>>
>>>> Miguel is instead seeing an RCU CPU stall warning where RCU's grace-pe=
riod
>>>> kthread slept for three milliseconds, but did not wake up for more tha=
n
>>>> 20 seconds.  This kthread would normally have awakened on CPU 1, but
>>>> CPU 1 looks to me to be very unhealthy, as can be seen in your console
>>>> output below (but maybe my idea of what is healthy for powerpc systems
>>>> is outdated).  Please see also the inline annotations.
>>>>
>>>> Thoughts from the PPC guys?
>>>
>>> I haven't seen it in my testing. But using Miguel's config I can
>>> reproduce it seemingly on every boot.
>>>
>>> For me it bisects to:
>>>
>>>   35de589cb879 ("powerpc/time: improve decrementer clockevent processin=
g")
>>>
>>> Which seems plausible.
>>>
>>> Reverting that on mainline makes the bug go away.
>>>
>>> I don't see an obvious bug in the diff, but I could be wrong, or the ol=
d
>>> code was papering over an existing bug?
>>>
>>> I'll try and work out what it is about Miguel's config that exposes
>>> this vs our defconfig, that might give us a clue.
>>=20
>> It's CONFIG_HIGH_RES_TIMERS=3Dn which triggers the stall.
>>=20
>> I can reproduce just with:
>>=20
>>   $ make ppc64le_guest_defconfig
>>   $ ./scripts/config -d HIGH_RES_TIMERS
>>=20
>> We have no defconfigs that disable HIGH_RES_TIMERS, I didn't even
>> realise you could disable it TBH :)
>>=20
>> The Rust CI has it disabled because I copied that from the x86 defconfig
>> they were using back when I added the Rust support. I think that was
>> meant to be a stripped down fast config for CI, but the result is it's
>> just using a badly tested combination which is not helpful.
>>=20
>> So I'll send a patch to turn HIGH_RES_TIMERS on for the Rust CI, and we
>> can debug this further without blocking them.
>=20
> So we traced the problem down to possibly a misunderstanding between=20
> decrementer clock event device and core code.
>=20
> The decrementer is only oneshot*ish*. It actually needs to either be=20
> reprogrammed or shut down otherwise it just continues to cause=20
> interrupts.
>=20
> Before commit 35de589cb879, it was sort of two-shot. The initial=20
> interrupt at the programmed time would set its internal next_tb variable=20
> to ~0 and call the ->event_handler(). If that did not set_next_event or=20
> stop the timer, the interrupt will fire again immediately, notice=20
> next_tb is ~0, and only then stop the decrementer interrupt.
>=20
> So that was already kind of ugly, this patch just turned it into a hang.
>=20
> The problem happens when the tick is stopped with an event still=20
> pending, then tick_nohz_handler() is called, but it bails out because=20
> tick_stopped =3D=3D 1 so the device never gets programmed again, and so i=
t=20
> keeps firing.
>=20
> How to fix it? Before commit a7cba02deced, powerpc's decrementer was=20
> really oneshot, but we would like to avoid doing that because it requires=
=20
> additional programming of the hardware on each timer interrupt. We have=20
> the ONESHOT_STOPPED state which seems to be just about what we want.
>=20
> Did the ONESHOT_STOPPED patch just miss this case, or is there a reason=20
> we don't stop it here? This patch seems to fix the hang (not heavily
> tested though).
> =20
> Thanks,
> Nick
>=20
> ---
> diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
> index 2d76c91b85de..7e13a55b6b71 100644
> --- a/kernel/time/tick-sched.c
> +++ b/kernel/time/tick-sched.c
> @@ -1364,9 +1364,11 @@ static void tick_nohz_handler(struct clock_event_d=
evice *dev)
>  	tick_sched_do_timer(ts, now);
>  	tick_sched_handle(ts, regs);
> =20
> -	/* No need to reprogram if we are running tickless  */
> -	if (unlikely(ts->tick_stopped))
> +	if (unlikely(ts->tick_stopped)) {
> +		/* If we are tickless, change the clock event to stopped */
> +		tick_program_event(KTIME_MAX, 1);
>  		return;
> +	}
> =20
>  	hrtimer_forward(&ts->sched_timer, now, TICK_NSEC);
>  	tick_program_event(hrtimer_get_expires(&ts->sched_timer), 1);
>=20

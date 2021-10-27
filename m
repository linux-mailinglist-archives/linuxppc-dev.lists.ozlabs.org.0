Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7557843C23D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 07:30:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfHMB2Pd8z2yHq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 16:29:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=d6Pvp9N3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::429;
 helo=mail-pf1-x429.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=d6Pvp9N3; dkim-atps=neutral
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfHLY2YtZz2xBK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 16:29:25 +1100 (AEDT)
Received: by mail-pf1-x429.google.com with SMTP id f11so1623936pfc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 22:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=a8WSOzj1MWLZ9ryB+mKVNmqwR1w0Z1GneNSMv2kxLvQ=;
 b=d6Pvp9N3bU3KAw+w8sFFKSGOF7jxzENTW9h0PzsWY8ocwNUW5WSTq9IBSYhHlt3LC5
 PYEE/lT6//9B8suGcKWff966A4rOvIrSKamSwxElNYpzZMEup7IEutWtcqNKQ+fejB85
 cz6E7eav4iKDgsz3acjiuT63G+vIPacIC0uL4i4W/0iatJuxV+coczNx2q1ZvJZH+VpX
 ocGwwr1COq+4zhcecVO6OVwZxteGF+S02qxIZmaYy+As2lTWcev/eOo6LPM4OLLnuHnp
 DchInHBsEqXITPcDR9HevCZIfAUAZm9mELoHD6shgHQI9l8aRjVDG9UXWT8aY4xsFiAv
 f+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=a8WSOzj1MWLZ9ryB+mKVNmqwR1w0Z1GneNSMv2kxLvQ=;
 b=zu/0c1KpcpXLhR6PWha+V7aYJiGaRJ/CdFez5XKqfTp8dL3ohsPXaVBxMw1yPjtWU/
 h0+A1V63FTm0puZXubDBLIMdewPo4gFBz7y/OCyO6nWtGR5r7ViRDs1Ti+1s0dEFYm5W
 qnK8VQ5+3adcmLGvp6mr/cS7WFUTO+pxwadbhVX49tXUGcdlIJhnOFh98lrW5q7FVtkC
 2cjVq0lcDzwqI3fwQYTcUgQf95p/uELbzPfUo+wUwsztZMyaGN3x9D2jJx+kAXoT6f2M
 /Fin9Xh1cEjb9Lj4YQOha1vG0fUUulvKF5d41nCMT6p0nywbO2yGAr7bY+4c+Qynckoz
 MCNQ==
X-Gm-Message-State: AOAM531p9hkLDW/vi2sHK7i6NR9WhxXcvd4UHCbUOJJsIdU4Lv87AdUM
 Oigq+NxXzq2WuRcP7+S2Mxq5SQrslZg=
X-Google-Smtp-Source: ABdhPJyK3RNGOyYxDpCY+K3M4pGu+jcVvzgFEEVCBx7V+UNhwJOAX/pwEBfyTTZwTCEAnVnSxHQ/aw==
X-Received: by 2002:a63:618d:: with SMTP id v135mr15087878pgb.79.1635312561906; 
 Tue, 26 Oct 2021 22:29:21 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id g25sm8227545pfh.216.2021.10.26.22.29.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 22:29:21 -0700 (PDT)
Date: Wed, 27 Oct 2021 15:29:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux kernel: powerpc: KVM guest can trigger host crash on Power8
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 mpe@ellerman.id.au
References: <87pmrtbbdt.fsf@mpe.ellerman.id.au>
 <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
In-Reply-To: <05b88724-90b6-a38a-bb3b-7392f85c1934@physik.fu-berlin.de>
MIME-Version: 1.0
Message-Id: <1635312497.knx718t0h2.astroid@bobo.none>
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
Cc: oss-security@lists.openwall.com,
 "debian-powerpc@lists.debian.org" <debian-powerpc@lists.debian.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from John Paul Adrian Glaubitz's message of October 26, 2021 6:48 =
pm:
> Hi Michael!
>=20
>> The Linux kernel for powerpc since v5.2 has a bug which allows a
>> malicious KVM guest to crash the host, when the host is running on
>> Power8.
>>=20
>> Only machines using Linux as the hypervisor, aka. KVM, powernv or bare
>> metal, are affected by the bug. Machines running PowerVM are not
>> affected.
>>=20
>> The bug was introduced in:
>>=20
>>     10d91611f426 ("powerpc/64s: Reimplement book3s idle code in C")
>>=20
>> Which was first released in v5.2.
>>=20
>> The upstream fix is:
>>=20
>>   cdeb5d7d890e ("KVM: PPC: Book3S HV: Make idle_kvm_start_guest() return=
 0 if it went to guest")
>>   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/com=
mit/?id=3Dcdeb5d7d890e14f3b70e8087e745c4a6a7d9f337
>>=20
>> Which will be included in the v5.16 release.
>=20
> I have tested these patches against 5.14 but it seems the problem [1] sti=
ll remains for me
> for big-endian guests. I built a patched kernel yesterday, rebooted the K=
VM server and let
> the build daemons do their work over night.
>=20
> When I got up this morning, I noticed the machine was down, so I checked =
the serial console
> via IPMI and saw the same messages again as reported in [1]:
>=20
> [41483.963562] watchdog: BUG: soft lockup - CPU#104 stuck for 25521s! [mi=
gration/104:175]
> [41507.963307] watchdog: BUG: soft lockup - CPU#104 stuck for 25544s! [mi=
gration/104:175]
> [41518.311200] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41518.311216] rcu:     136-...0: (135 ticks this GP) idle=3D242/1/0x4000=
000000000000 softirq=3D32031/32033 fqs=3D2729959=20
> [41547.962882] watchdog: BUG: soft lockup - CPU#104 stuck for 25581s! [mi=
gration/104:175]
> [41571.962627] watchdog: BUG: soft lockup - CPU#104 stuck for 25603s! [mi=
gration/104:175]
> [41581.330530] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41581.330546] rcu:     136-...0: (135 ticks this GP) idle=3D242/1/0x4000=
000000000000 softirq=3D32031/32033 fqs=3D2736378=20
> [41611.962202] watchdog: BUG: soft lockup - CPU#104 stuck for 25641s! [mi=
gration/104:175]
> [41635.961947] watchdog: BUG: soft lockup - CPU#104 stuck for 25663s! [mi=
gration/104:175]
> [41644.349859] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41644.349876] rcu:     136-...0: (135 ticks this GP) idle=3D242/1/0x4000=
000000000000 softirq=3D32031/32033 fqs=3D2742753=20
> [41671.961564] watchdog: BUG: soft lockup - CPU#104 stuck for 25697s! [mi=
gration/104:175]
> [41695.961309] watchdog: BUG: soft lockup - CPU#104 stuck for 25719s! [mi=
gration/104:175]
> [41707.369190] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41707.369206] rcu:     136-...0: (135 ticks this GP) idle=3D242/1/0x4000=
000000000000 softirq=3D32031/32033 fqs=3D2749151=20
> [41735.960884] watchdog: BUG: soft lockup - CPU#104 stuck for 25756s! [mi=
gration/104:175]
> [41759.960629] watchdog: BUG: soft lockup - CPU#104 stuck for 25778s! [mi=
gration/104:175]
> [41770.388520] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41770.388548] rcu:     136-...0: (135 ticks this GP) idle=3D242/1/0x4000=
000000000000 softirq=3D32031/32033 fqs=3D2755540=20
> [41776.076307] rcu: rcu_sched kthread timer wakeup didn't happen for 1423=
 jiffies! g49897 f0x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402
> [41776.076327] rcu:     Possible timer handling issue on cpu=3D32 timer-s=
oftirq=3D1056014
> [41776.076336] rcu: rcu_sched kthread starved for 1424 jiffies! g49897 f0=
x0 RCU_GP_WAIT_FQS(5) ->state=3D0x402 ->cpu=3D32
> [41776.076350] rcu:     Unless rcu_sched kthread gets sufficient CPU time=
, OOM is now expected behavior.
> [41776.076360] rcu: RCU grace-period kthread stack dump:
> [41776.076434] rcu: Stack dump where RCU GP kthread last ran:
> [41783.960374] watchdog: BUG: soft lockup - CPU#104 stuck for 25801s! [mi=
gration/104:175]
> [41807.960119] watchdog: BUG: soft lockup - CPU#104 stuck for 25823s! [mi=
gration/104:175]
> [41831.959864] watchdog: BUG: soft lockup - CPU#104 stuck for 25846s! [mi=
gration/104:175]
> [41833.407851] rcu: INFO: rcu_sched detected stalls on CPUs/tasks:
> [41833.407868] rcu:     136-...0: (135 ticks this GP) idle=3D242/1/0x4000=
000000000000 softirq=3D32031/32033 fqs=3D2760381=20
> [41863.959524] watchdog: BUG: soft lockup - CPU#104 stuck for 25875s! [mi=
gration/104:175]

I don't suppose you were able to get any more of the log saved? (The=20
first error messages that happened might be interesting)

Thanks,
Nick

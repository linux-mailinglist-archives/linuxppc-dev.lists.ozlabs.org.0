Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B36822ACD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 12:44:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BC88d47z3zDqsh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 20:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HCIWYeHA; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BC7qg71F7zDrFL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 20:29:35 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id cv18so4154468pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Jul 2020 03:29:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=dSS2hCGEiwlH26/HSnyN9SAIKMm4yn3zwiK0XxrydVs=;
 b=HCIWYeHAb3ZcWoTUCO67U8N1foyQkyV4c6CTYRxoFKDSWYPipBpyiQhTwwOMoR78FT
 c1uV8/IrFJ58T1pVR5sGgpmLJAcQJ5eV51Ph9P95WC0oPy7Binx/soyhmKdn0sdRm7Bo
 dBv9y1Zu6KZKiDJ4g1hN3r5rVZsf3IZLQqrneSJc01xG/VOVcZ2spIB6+v3bR1mwABBG
 osE4ekOsDwRvcGQvhoj9n1DpHwuMZ4yE36Nl/JP9XW9Qg+32BEXopqZ+q/ftJLvnZRJg
 KA8g/vlbA04lgvW1pS8P3Eu12I/0D4rVwSO6y4Mv1y7R6h46Bbp6v7cj1s33oo2qgtQw
 iUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dSS2hCGEiwlH26/HSnyN9SAIKMm4yn3zwiK0XxrydVs=;
 b=pP05KpkZ6nTBwDgxS7tGH1Vv9J3L80Sii4P2wGdke1LtDcsKF/piwXyDyAYH68mVgD
 ME1LBA8VZ1/VSrTvn/FCvCkFlxSZAKjfrjjJtiLwJvr4qEIoABDqxOT3su9Hkpym27jh
 cfO6OayxuoBtLLll+PO7wu+BWutZG3RC62lB08p1nXRdhW+QhvMTrB1D+YMVGWc7pz6M
 6YsLT2BMDvayN4xumWyUNsMdozC5MYJ5RzhWx6R519R7xZNR6lbE+4WsvaIqY19vDDqn
 K77cSdCVB12y7HfS0ZnBMInWGRrQUpjr8Fw3KeyRoDrPM6QJ0SmXytN8s3IDuftFphvU
 BV+w==
X-Gm-Message-State: AOAM532uHy4p57rwsBDCizEUxpjBbXoLJiQHd/lAvh1LgVDrQWUJbCYy
 lJdyPDxYViXupCoS+W74KuArKFPT
X-Google-Smtp-Source: ABdhPJzEIWJSdi1OMuBt4E2MPoqGPOtkVI7YqyTPCJMvKb3TkfVrOyJfehRmLgbggfU0LbprI5AfYQ==
X-Received: by 2002:a17:902:788b:: with SMTP id
 q11mr3407120pll.216.1595500171716; 
 Thu, 23 Jul 2020 03:29:31 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id 17sm2456103pjl.30.2020.07.23.03.29.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 03:29:31 -0700 (PDT)
Date: Thu, 23 Jul 2020 20:29:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Fix irq tracing corruption in
 interrupt/syscall return caused by perf interrupts
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20200722073437.930521-1-npiggin@gmail.com>
 <dcf4ee37-202b-794a-189b-895e59293c68@ozlabs.ru>
In-Reply-To: <dcf4ee37-202b-794a-189b-895e59293c68@ozlabs.ru>
MIME-Version: 1.0
Message-Id: <1595499918.mg25810wnp.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Alexey Kardashevskiy's message of July 22, 2020 8:50 pm:
>=20
>=20
> On 22/07/2020 17:34, Nicholas Piggin wrote:
>> Alexey reports lockdep_assert_irqs_enabled() warnings when stress testin=
g perf, e.g.,
>>=20
>> WARNING: CPU: 0 PID: 1556 at kernel/softirq.c:169 __local_bh_enable_ip+0=
x258/0x270
>> CPU: 0 PID: 1556 Comm: syz-executor
>> NIP:  c0000000001ec888 LR: c0000000001ec884 CTR: c000000000ef0610
>> REGS: c000000022d4f8a0 TRAP: 0700   Not tainted  (5.8.0-rc3-x)
>> MSR:  8000000000029033 <SF,EE,ME,IR,DR,RI,LE>  CR: 28008844  XER: 200400=
00
>> CFAR: c0000000001dc1d0 IRQMASK: 0
>>=20
>> The interesting thing is MSR[EE] and IRQMASK shows interrupts are enable=
d,
>> suggesting the current->hardirqs_enabled irq tracing state is going out =
of sync
>> with the actual interrupt enable state.
>>=20
>> The cause is a window in interrupt/syscall return where irq tracing stat=
e is being
>> adjusted for an irqs-enabled return while MSR[EE] is still enabled. A pe=
rf
>> interrupt hits and ends up calling trace_hardirqs_off() when restoring
>> interrupt flags to a disable state.
>>=20
>> Fix this by disabling perf interrupts as well while adjusting irq tracin=
g state.
>>=20
>> Add a debug check that catches the condition sooner.
>>=20
>> Fixes: 68b34588e202 ("powerpc/64/sycall: Implement syscall entry/exit lo=
gic in C")
>> Reported-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>=20
>> I can reproduce similar symptoms and this patch fixes my test case,
>> still trying to confirm Alexey's test case or whether there's another
>> similar bug causing it.
>=20
>=20
> This does not fix my testcase. I applied this on top of 4fa640dc5230
> ("Merge tag 'vfio-v5.8-rc7' of git://github.com/awilliam/linux-vfio into
> master")  without any of my testing code, just to be clear. Sorry...

Okay it seems to be a bigger problem and not actually caused by that
patch but was possible for lockdep hardirqs_enabled state to get out=20
of synch with the local_irq_disable() state before that too. Root
cause is similar -- perf interrupts hitting between updating the two
different bits of state.

Not quite sure why Alexey's test wasn't hitting it before the patch,
but possibly the way masked interrupts get replayed. But I was able
to hit the problem with a different assertion.

I think I have a fix, but it seems to be a generic irq tracing code
issue. So this patch can be dropped, and it's not an urgent issue for
the next release (it only triggers warns on rare occasions and only
when lockdep is enabled).

Thanks,
Nick


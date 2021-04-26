Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A07436B254
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 13:28:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTN194GB0z30Ff
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 21:27:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=J0qyEGaT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=J0qyEGaT; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTN0k1Nlnz2ysm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 21:27:31 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id v13so15170384ple.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 04:27:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=WojHIOCE9IiTbGPzqxYFTTTCnqu0elAJH1s4+uNOyEQ=;
 b=J0qyEGaT/rxkDjFcDO08MAVfnAPIxzrvr3SopwvSmi8Kg5iAdQfEtv74oiHHIQS1iS
 CGLqfsIBlnJrP/15yYko6TCtMHOz/ntk1azufroxAT5BsYlXp+RtQsaUbD73K+FQ1vZV
 zzsLUUNiT2vCss/eeZyE1ZUEL+trqdkNsenJcyDOQU44ca1oN7Rmvf5RUPhUPgWdhPJJ
 eqiWkRep4QEiwst/6jC0mQwsISQbu7EK5mJzTLyAmyJhEGlGuMBSU1sJvw6BJ5tfgRww
 XKx3RV+jNz+GN4YfzuCgcg0+VGRvXHeoWlC1N2IuwJYL4ggS7AYew65Xi8VPNUYfphvi
 RzZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:mime-version:message-id
 :content-transfer-encoding;
 bh=WojHIOCE9IiTbGPzqxYFTTTCnqu0elAJH1s4+uNOyEQ=;
 b=VCqGrBYDBKO08tm+w6kmmRWf79SDNZw4WPiExZIbj91JRvpJyq/Riibl2epMGG9ezK
 MPz7KpB7Aug99911pzaiTHEslapRwKkWB8xjO2IuDMfN+FJ7FW15PuqSGHz2uG8gRrG3
 h/TVwAivUvFyFg0aK5c94j9h+qSzMY36tzhDUXdCWqNOMDMoPJXpuZFF2actdiw8apAn
 RL8wZ8QUUb+Fcuf0PKn7He49xBjy83UUJe6n1kIi8k54MAIzomyy1G0PQkW1dmcQApYB
 HGwMnxHWkCWkgg2v4qufnFiPGfGKxmyW91X9NGziTs5FMPsfkF1PHIe1DGuGDj31gOkT
 cvHA==
X-Gm-Message-State: AOAM532ENd0luGU8TrPrxXmASC0HntXsb8v9iiJQjtWvfn8+kKCU0qlV
 C0Aqpy3jTvy5xcoy8ISPsvY=
X-Google-Smtp-Source: ABdhPJxhCUd6Iz5KibdnBFl8Aeh3Pkjodv3kU3GM9TTu89lVrTHu03yLezPM6rMYrMwwWgtdYFJtGQ==
X-Received: by 2002:a17:90a:d707:: with SMTP id
 y7mr22928289pju.50.1619436444496; 
 Mon, 26 Apr 2021 04:27:24 -0700 (PDT)
Received: from localhost ([59.102.87.99])
 by smtp.gmail.com with ESMTPSA id a7sm11167389pfg.65.2021.04.26.04.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 04:27:24 -0700 (PDT)
Date: Mon, 26 Apr 2021 21:27:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Guest entry/exit performance work and observations
To: kvm-ppc@vger.kernel.org
MIME-Version: 1.0
Message-Id: <1619432976.tfqsjlu7r9.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I'm looking at KVM HV P9 path guest exit/entry performance with the Cify
patches, plus some further work to see what we can do.

Measurement is done in the guest making a "NULL hcall" and return back=20
to a non-nested guest. Two cases considered: First, returning to guest=20
at the "try_real_mode" hcall handler. Second, returning back to guest=20
after going around a loop in kvmppc_vcpu_run_hv (i.e., exit into full=20
host kernel context, but not to host usermode).

The real-mode test is a proxy for real mode hcall and other interrupt
handlers, and the full exit is a proxy for virtual mode hcalls and=20
interrupt handlers.

The test was done with powernv_defconfig, radix guest and radix host on
a POWER9 with meltdown mitigations disabled. A minor hack was made
just to get the immediate return / NULL hcall behaviour to measure
performance.

* Upstream try_real_mode return	-  509 cycles
* Upstream virt NULL hcall	- 9587 cycles
* KVM Cify virt NULL hcall	- 9333 cycles
* KVM Cify+opt virt NULL hcall	- 5754 cycles (167% faster than upstream,
				               or 60% the cycles required)

The KVM Cify series (which you have already seen) plus the further
optimisations patch series is here:

https://github.com/npiggin/linux/tree/kvm-in-c-new

Some of the important / major further optimisation patches have
individual cycle time improvement contribution annotated. In many cases
things are inter-dependent, e.g., patch A might improve 100 cycles and
B 50 cycles but A+B might be 250 due to together avoiding an SPR stall.
So take the individual numbers with a grain of salt, and the cumulative
result above is most important.

In summary the Cify series does not hurt performance of entry/exit,=20
which is good. It actually helps a bit, I'm not sure exactly where.
And we can make quite a lot more improvement with this series.

HOWEVER! The Cify series removes the very fast real mode hcall and=20
interrupt handlers (except some things like machine check). So any real=20
mode handler will be handled as a virt mode handler on P9 after Cify.

Now I have some further patches in progress that should shave about 1000=20
more cycles more from the full exit, but beyond that it gets pretty=20
tough to improve. That still leaves it an order of magnitude slower. =20

Now I did say this doesn't matter so much with a P9/radix/xive guest
which is true, except possibly for TCE hcalls that Alexey brought to my
attention (any other important cases?). So we will have to think about=20
that.

Alexey did say that the real mode TCE hcalls were added for P8, and
were less important for P9, but it is something to keep an eye on. We=20
might end up adding a faster handler back, but I would much prefer if
wasn't entirely run in guest context as they do today (maybe switch
MMU context, TB, and a few other important SPRs, and enable translation
so it can run practically as host kernel context). But I think we should
wait and see, and add the complexity only if it comes up as a problem.

The other thing is the P9 path now implements the P9 hash guest support=20
after the Cify series. Hash does a lot more exits due to translation=20
hcalls and interrupts. I did do some basic measurements (e.g., kernel=20
compile) and couldn't see a significant slowdown. But in any case I=20
think the P9 hash code is not important to micro optimise, it was only
done to simplify code and remove asm, so I would rather not add=20
complexity for that.

Thanks,
Nick

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B66F7614A6
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2019 12:16:37 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hPcx5lB3zDqSD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2019 20:16:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::443; helo=mail-pf1-x443.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="UUVurbNo"; 
 dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hPb922bnzDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2019 20:14:59 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id i189so6155752pfg.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 07 Jul 2019 03:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=9b1EGXOx4NeF4JTA7eM5HskbqythmMpkxkl1a4JGzA0=;
 b=UUVurbNoPqHqrmeUuvp4JhwWnf7tIMiogR4wNFWQy2Yg9s0VDKYMOBYp0alcm7xqmy
 prWWl/SDvlnKeuMa3qIGX7xJhsnZD5ZGIl+UlAOi160yk/UEHKohpIEmKZ3npBPCrX+O
 ChPr9CSJ3Wbe89Qg2S2hpHTW7IF1PzJiilIeJaqgAQDCB2LJulNX7jAVvnMa6t/1LiAI
 iM1IFlpvK+lxOvAKnW1POkq5CLL5gNZGa3UPh59xMtXfATagAZIu0Nlw5nTGCUAoSV4B
 9hrJ2bI5CAbD7NOn8VQJEvw6TgykLcOf8/OryLjdATYGQCEEPLduB8OwesvLFxmnoFOV
 3Jjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=9b1EGXOx4NeF4JTA7eM5HskbqythmMpkxkl1a4JGzA0=;
 b=DHpfmnH706qi/gffT/UIYbUw7r0O5l34eu8r+euylpX7WfJO+3TH82W5BkB2DVGAlV
 Q+qklxScHcHpZy455xyEDEMImV4cTDtQEwyAM/asBaIFpyB48doLSa0wngfJgFTXzDZZ
 Uom1eoPCtUZhuzJmqgQh0j+S6GHJbeYmef6LNbGksFuXmY1TCzFWPdKBm2AE6+bbAmoo
 XXkaj/6IxvXNi7LmsfPx8V39EH0uVDviAQsws35qqZ0OHBVovLi6o/bLt5fDpRfda4ZF
 z+6MbMd1fpTVBB9x/LMGiGXEgrmOGepPXbldD2j413yUDIY5iKF6gdCc41efjKvDG7eN
 ohgw==
X-Gm-Message-State: APjAAAVyuqQODhRdGtQySpjd2yPK+V7sDVrxzyIQoz1rA04fCGt0HmHO
 jxNUDBHOxx+gtYRlOoQKNyw=
X-Google-Smtp-Source: APXvYqw7+g7XXTJSX6Asjijq/vU5Vo5FyhGnvQSw6y6Wxkp4QA/7+N00beHz2HuLJBcfPMN/BdiKhw==
X-Received: by 2002:a17:90a:290b:: with SMTP id
 g11mr16776527pjd.122.1562494495653; 
 Sun, 07 Jul 2019 03:14:55 -0700 (PDT)
Received: from localhost ([203.111.179.197])
 by smtp.gmail.com with ESMTPSA id u137sm14324745pgc.91.2019.07.07.03.14.53
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 07 Jul 2019 03:14:54 -0700 (PDT)
Date: Sun, 07 Jul 2019 20:13:16 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/3] cpuidle-powernv : forced wakeup for stop states
To: Abhishek Goel <huntbag@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20190704091827.19555-1-huntbag@linux.vnet.ibm.com>
 <20190704091827.19555-2-huntbag@linux.vnet.ibm.com>
In-Reply-To: <20190704091827.19555-2-huntbag@linux.vnet.ibm.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1562493994.wseoth6w1s.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: ego@linux.vnet.ibm.com, daniel.lezcano@linaro.org, rjw@rjwysocki.net,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Abhishek Goel's on July 4, 2019 7:18 pm:
> Currently, the cpuidle governors determine what idle state a idling CPU
> should enter into based on heuristics that depend on the idle history on
> that CPU. Given that no predictive heuristic is perfect, there are cases
> where the governor predicts a shallow idle state, hoping that the CPU wil=
l
> be busy soon. However, if no new workload is scheduled on that CPU in the
> near future, the CPU may end up in the shallow state.
>=20
> This is problematic, when the predicted state in the aforementioned
> scenario is a shallow stop state on a tickless system. As we might get
> stuck into shallow states for hours, in absence of ticks or interrupts.
>=20
> To address this, We forcefully wakeup the cpu by setting the
> decrementer. The decrementer is set to a value that corresponds with the
> residency of the next available state. Thus firing up a timer that will
> forcefully wakeup the cpu. Few such iterations will essentially train the
> governor to select a deeper state for that cpu, as the timer here
> corresponds to the next available cpuidle state residency. Thus, cpu will
> eventually end up in the deepest possible state.
>=20
> Signed-off-by: Abhishek Goel <huntbag@linux.vnet.ibm.com>
> ---
>=20
> Auto-promotion
>  v1 : started as auto promotion logic for cpuidle states in generic
> driver
>  v2 : Removed timeout_needed and rebased the code to upstream kernel
> Forced-wakeup
>  v1 : New patch with name of forced wakeup started
>  v2 : Extending the forced wakeup logic for all states. Setting the
> decrementer instead of queuing up a hrtimer to implement the logic.
>  v3 : Cleanly handle setting/resetting of decrementer so as to not break
> irq work=20
>=20
>  arch/powerpc/include/asm/time.h   |  2 ++
>  arch/powerpc/kernel/time.c        | 40 +++++++++++++++++++++++++++++++
>  drivers/cpuidle/cpuidle-powernv.c | 32 +++++++++++++++++++++++++
>  3 files changed, 74 insertions(+)
>=20
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/t=
ime.h
> index 54f4ec1f9..a3bd4f3c0 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -188,6 +188,8 @@ static inline unsigned long tb_ticks_since(unsigned l=
ong tstamp)
>  extern u64 mulhdu(u64, u64);
>  #endif
> =20
> +extern int set_dec_before_idle(u64 timeout);
> +extern void reset_dec_after_idle(void);
>  extern void div128_by_32(u64 dividend_high, u64 dividend_low,
>  			 unsigned divisor, struct div_result *dr);
> =20
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 694522308..814de3469 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -576,6 +576,46 @@ void arch_irq_work_raise(void)
> =20
>  #endif /* CONFIG_IRQ_WORK */
> =20
> +/*
> + * Returns 1 if we have reprogrammed the decrementer for idle.
> + * Returns 0 if the decrementer is unchanged.
> + */
> +int set_dec_before_idle(u64 timeout)
> +{
> +	u64 *next_tb =3D this_cpu_ptr(&decrementers_next_tb);
> +	u64 now =3D get_tb_or_rtc();
> +
> +	/*
> +	 * Ensure that the timeout is at least one microsecond
> +	 * before the current decrement value. Else, we will
> +	 * unnecesarily wakeup again within a microsecond.
> +	 */
> +	if (now + timeout + 512 > *next_tb)

I would pass this 512 in as a parameter and put the comment in the
idle code. Timer code does not know/care.

Maybe return bool and call it try_set_dec_before_idle.

> +		return 0;
> +
> +	set_dec(timeout);

This needs to have

  if (test_irq_work_pending())
      set_dec(1);

here AFAIKS

> +
> +	return 1;
> +}
> +
> +void reset_dec_after_idle(void)
> +{
> +	u64 now;
> +	u64 *next_tb;
> +
> +	if (test_irq_work_pending())
> +		return;
> +
> +	now =3D get_tb_or_rtc();
> +	next_tb =3D this_cpu_ptr(&decrementers_next_tb);
> +	if (now >=3D *next_tb)
> +		return;

Are you sure it's okay to escape early in this case?

Thanks,
Nick
=

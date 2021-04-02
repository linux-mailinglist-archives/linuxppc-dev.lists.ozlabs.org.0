Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F53D352A0D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 13:04:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBcdG4HmSz3bwC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 22:04:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SYkEOADB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SYkEOADB; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBccq6Q3Mz3bnr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 22:04:10 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id x126so3376977pfc.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Apr 2021 04:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=l+pBbsZFC2SHjuGWVG0sbsUApIv+xlAUGq0SRGB29is=;
 b=SYkEOADBfBbtbxDuwzTPIhEkisTALOFsbWjFUcqUeRSgRa3bitNdwqeEJVOhna8oEe
 3JkifqlzHHGnVujb8HRA/GqKzvfDBGvfmpcCr0iIrgwASnXyHW+7/PD9FQmfzu/8ru/6
 M7OxvS0pMcA0wbhek+cVQlAlc/vlCj5feuPc3P8sgsPl0LE3QUxciILPYK2IlXvCM/Lu
 Fs82mjkGAJvrH3vjf2mMxfNnpWJ4YRUGEptD8fpBFhdBmARBS6486iYoYiYNhfutEeq/
 gUXC6LdAKB0CuE5/2867NLBFnVrJlNnwd3QJUeiFoA6Ahj/8w9HDY96jiUFFHLhL9zkl
 JkCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=l+pBbsZFC2SHjuGWVG0sbsUApIv+xlAUGq0SRGB29is=;
 b=e6BGbEcWEeTIAOYB9OYtAoS9Z6MIy4N0Y9j+Xi/SKepnMg/pnz6p7x91igIql+9Btx
 a9RJkFlEN92CR3nPOLrbu5wOpPUCv4I8mg8RipGQCp99tN6BMTc6RnOCGK/QqIG+mdn4
 AHuWwtmBQg6Ftfb4OVXkK5fxHBs67ljaawRuJdPPzI85669XsMk5ruccmYgKiS10ZJfE
 3czWFHldDgEbu+J3B3fS0PvgonkjSFrIcZvmtt4K0OFWuq0jqPSqGvDbksfkLEdlkM80
 tl2Bw+NbRD9hffuo1b0lmB9xFAwg1AkN52u9ZSFIToP5D9dFbB5kNS56p/k/8qcZsYE7
 9Kww==
X-Gm-Message-State: AOAM531ICHH/wVb/dWAm80nwt7jKqIsTuRT+oOxL/qjKKXwY/Kzw7xfG
 7naKL7urgb1u8qJ4rTiu7xs=
X-Google-Smtp-Source: ABdhPJyYboW4B/fuT0xzRIX6oTfpJTjyzW868FmGg3/7fB2OSArF18CEb900fCMfL/K2IarZxQd2vg==
X-Received: by 2002:a05:6a00:16c2:b029:228:964e:8b36 with SMTP id
 l2-20020a056a0016c2b0290228964e8b36mr11916051pfc.11.1617361448600; 
 Fri, 02 Apr 2021 04:04:08 -0700 (PDT)
Received: from localhost ([1.128.189.0])
 by smtp.gmail.com with ESMTPSA id gm10sm7880866pjb.4.2021.04.02.04.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Apr 2021 04:04:08 -0700 (PDT)
Date: Fri, 02 Apr 2021 21:04:02 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 29/48] powerpc: add set_dec_or_work API for safely
 updating decrementer
To: kvm-ppc@vger.kernel.org
References: <20210401150325.442125-1-npiggin@gmail.com>
 <20210401150325.442125-30-npiggin@gmail.com>
In-Reply-To: <20210401150325.442125-30-npiggin@gmail.com>
MIME-Version: 1.0
Message-Id: <1617361096.5h9n7tf1is.astroid@bobo.none>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of April 2, 2021 1:03 am:
> Decrementer updates must always check for new irq work to avoid an
> irq work decrementer interrupt being lost.
>=20
> Add an API for this in the timer code so callers don't have to care
> about details.

Oh I forgot to update the changelog for this, it's significantly
changed, so I better withdraw the Reviewed-by as well. I think this
re-arm API is the better one, there's no reason it can't all be in
the host time.c code.

This implementation also avoids what used to be inevitable double
interrupt to take a host timer from guest (first hdec to get into
the host and set dec to some -ve value, then taking that dec as
soon as we enable interrupts) by just marking the dec pending in
that case, so it gets replayed when we enable irqs.

Thanks,
Nick

>=20
> Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/time.h |  4 ++++
>  arch/powerpc/kernel/time.c      | 41 +++++++++++++++++++++++++--------
>  arch/powerpc/kvm/book3s_hv.c    |  6 +----
>  3 files changed, 37 insertions(+), 14 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/t=
ime.h
> index 0128cd9769bc..924b2157882f 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -106,6 +106,10 @@ static inline u64 timer_get_next_tb(void)
>  	return __this_cpu_read(decrementers_next_tb);
>  }
> =20
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +void timer_rearm_host_dec(u64 now);
> +#endif
> +
>  /* Convert timebase ticks to nanoseconds */
>  unsigned long long tb_to_ns(unsigned long long tb_ticks);
> =20
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 8b9b38a8ce57..8bbcc6be40c0 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -563,13 +563,43 @@ void arch_irq_work_raise(void)
>  	preempt_enable();
>  }
> =20
> +static void set_dec_or_work(u64 val)
> +{
> +	set_dec(val);
> +	/* We may have raced with new irq work */
> +	if (unlikely(test_irq_work_pending()))
> +		set_dec(1);
> +}
> +
>  #else  /* CONFIG_IRQ_WORK */
> =20
>  #define test_irq_work_pending()	0
>  #define clear_irq_work_pending()
> =20
> +static void set_dec_or_work(u64 val)
> +{
> +	set_dec(val);
> +}
>  #endif /* CONFIG_IRQ_WORK */
> =20
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +void timer_rearm_host_dec(u64 now)
> +{
> +	u64 *next_tb =3D this_cpu_ptr(&decrementers_next_tb);
> +
> +	WARN_ON_ONCE(!arch_irqs_disabled());
> +	WARN_ON_ONCE(mfmsr() & MSR_EE);
> +
> +	if (now >=3D *next_tb) {
> +		now =3D *next_tb - now;
> +		set_dec_or_work(now);
> +	} else {
> +		local_paca->irq_happened |=3D PACA_IRQ_DEC;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(timer_rearm_host_dec);
> +#endif
> +
>  /*
>   * timer_interrupt - gets called when the decrementer overflows,
>   * with interrupts disabled.
> @@ -630,10 +660,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>  	} else {
>  		now =3D *next_tb - now;
>  		if (now <=3D decrementer_max)
> -			set_dec(now);
> -		/* We may have raced with new irq work */
> -		if (test_irq_work_pending())
> -			set_dec(1);
> +			set_dec_or_work(now);
>  		__this_cpu_inc(irq_stat.timer_irqs_others);
>  	}
> =20
> @@ -875,11 +902,7 @@ static int decrementer_set_next_event(unsigned long =
evt,
>  				      struct clock_event_device *dev)
>  {
>  	__this_cpu_write(decrementers_next_tb, get_tb() + evt);
> -	set_dec(evt);
> -
> -	/* We may have raced with new irq work */
> -	if (test_irq_work_pending())
> -		set_dec(1);
> +	set_dec_or_work(evt);
> =20
>  	return 0;
>  }
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 8c8df88eec8c..287042b4afb5 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -3901,11 +3901,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *v=
cpu, u64 time_limit,
>  	vc->entry_exit_map =3D 0x101;
>  	vc->in_guest =3D 0;
> =20
> -	next_timer =3D timer_get_next_tb();
> -	set_dec(next_timer - tb);
> -	/* We may have raced with new irq work */
> -	if (test_irq_work_pending())
> -		set_dec(1);
> +	timer_rearm_host_dec(tb);
>  	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
> =20
>  	kvmhv_load_host_pmu();
> --=20
> 2.23.0
>=20
>=20

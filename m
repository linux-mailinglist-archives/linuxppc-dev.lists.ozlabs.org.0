Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4719085C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 09:56:15 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mlTm3kk8zDqmb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 19:56:12 +1100 (AEDT)
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
 header.s=20161025 header.b=jjtxgFPj; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mlRn2FBCzDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 19:54:28 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id g9so1149691pjp.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 01:54:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=AX6pvyW36VYxdhbcJ7NY2GZcvFUSsP1GTN2RViF8G7Y=;
 b=jjtxgFPjP0XI7X603OuXDyscIH0QbP4zjp0du6D/cgb/jHVPILKH3KGOL7nhVYDAdr
 BeDDacT5TQtN0HqK815WDe/FB9o5vbE340CtKRKkMT8jpjQ5ZSSlValk6hiQPTU20Inw
 cuxk9zVZbC+jila0X5uWNhaF3ar/mZ2/mfvu5YIdMIaYD1+fkpZcwfDyetbLMmqxddT4
 WWa5uyYzCGDmU095ttk4ni+mvDiPvSDRnpGVdhckh+gLRFq7S8Hjj89OJGOBx7Kzqjom
 Sth9EoTAAyEjW1LLz9OQdPHUPde5yQmiqA+e2u5JVd/89s4YnnkK5dhWYYrLj9viO+wM
 HBNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=AX6pvyW36VYxdhbcJ7NY2GZcvFUSsP1GTN2RViF8G7Y=;
 b=l0/ttn74fM47XssNsKqCiSjz7q+oi10NaZuYr20Dp8+F+8SnJG8A7W15YBJoBXKizo
 i8BXnQOhBklTMrsTf4VXEHHetXb4mwbovGW3rlVRPNUa0Ys4Z33xelBheX5XOXdlxTrE
 KMdcwAO5cEsZO8iCa3+CcvBGYWoBr3PCgw/LRi09Y78/9lYu+iGzqUujJGEVU/N5n9Ge
 ZijAyXXny9BhQR+/OIBPm2rR7iD0tgtU9AhcB0Hi/fBQlbdC+p4/rc42dRWHJSmOKHUz
 0hvKEFDb8Q6jL0G9Urd2OVnbDfHvVJPhMbjT/TgjgVeNRqdkWRpeHM6860i2UuyHgjGw
 NGkw==
X-Gm-Message-State: ANhLgQ2TaF1xlh3ZFbtP56z0NO6R5X3ppjX1l+l8L4PH8Qa1HvtRG3ZC
 2c/HcahSBUV61vnPlIh12cJR24Al
X-Google-Smtp-Source: ADFU+vvIuVTTxHyKgEzCyA/Lbfk93DlamjfOFopC5+FhsCBW5H4GMO1fhbhjH3uo8/3wJ9hE2sQS2Q==
X-Received: by 2002:a17:902:8f8e:: with SMTP id
 z14mr26000685plo.195.1585040066562; 
 Tue, 24 Mar 2020 01:54:26 -0700 (PDT)
Received: from localhost (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id bx1sm1758873pjb.5.2020.03.24.01.54.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Mar 2020 01:54:26 -0700 (PDT)
Date: Tue, 24 Mar 2020 18:54:20 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v11 5/8] powerpc/64: make buildable without CONFIG_COMPAT
To: linuxppc-dev@lists.ozlabs.org, Michal Suchanek <msuchanek@suse.de>
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <cover.1584620202.git.msuchanek@suse.de>
 <4b7058eb0f5558fb7e2cee1b8f7cf99ebd03084e.1584620202.git.msuchanek@suse.de>
In-Reply-To: <4b7058eb0f5558fb7e2cee1b8f7cf99ebd03084e.1584620202.git.msuchanek@suse.de>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585039733.dm1rivvych.astroid@bobo.none>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Jiri Olsa <jolsa@redhat.com>, Rob Herring <robh@kernel.org>,
 Michael Neuling <mikey@neuling.org>, Eric Richter <erichte@linux.ibm.com>,
 Masahiro Yamada <masahiroy@kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Jordan Niethe <jniethe5@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>, Arnd Bergmann <arnd@arndb.de>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Allison Randal <allison@lohutok.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>, linux-fsdevel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michal Suchanek's on March 19, 2020 10:19 pm:
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index 4b0152108f61..a264989626fd 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -247,7 +247,6 @@ static void do_signal(struct task_struct *tsk)
>  	sigset_t *oldset =3D sigmask_to_save();
>  	struct ksignal ksig =3D { .sig =3D 0 };
>  	int ret;
> -	int is32 =3D is_32bit_task();
> =20
>  	BUG_ON(tsk !=3D current);
> =20
> @@ -277,7 +276,7 @@ static void do_signal(struct task_struct *tsk)
> =20
>  	rseq_signal_deliver(&ksig, tsk->thread.regs);
> =20
> -	if (is32) {
> +	if (is_32bit_task()) {
>          	if (ksig.ka.sa.sa_flags & SA_SIGINFO)
>  			ret =3D handle_rt_signal32(&ksig, oldset, tsk);
>  		else

Unnecessary?

> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/sysca=
ll_64.c
> index 87d95b455b83..2dcbfe38f5ac 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -24,7 +24,6 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  				   long r6, long r7, long r8,
>  				   unsigned long r0, struct pt_regs *regs)
>  {
> -	unsigned long ti_flags;
>  	syscall_fn f;
> =20
>  	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> @@ -68,8 +67,7 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
> =20
>  	local_irq_enable();
> =20
> -	ti_flags =3D current_thread_info()->flags;
> -	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> +	if (unlikely(current_thread_info()->flags & _TIF_SYSCALL_DOTRACE)) {
>  		/*
>  		 * We use the return value of do_syscall_trace_enter() as the
>  		 * syscall number. If the syscall was rejected for any reason
> @@ -94,7 +92,7 @@ notrace long system_call_exception(long r3, long r4, lo=
ng r5,
>  	/* May be faster to do array_index_nospec? */
>  	barrier_nospec();
> =20
> -	if (unlikely(ti_flags & _TIF_32BIT)) {
> +	if (unlikely(is_32bit_task())) {

Problem is, does this allow the load of ti_flags to be used for both
tests, or does test_bit make it re-load?

This could maybe be fixed by testing if(IS_ENABLED(CONFIG_COMPAT) &&

Other than these, the patches all look pretty good to me.

Thanks,
Nick
=

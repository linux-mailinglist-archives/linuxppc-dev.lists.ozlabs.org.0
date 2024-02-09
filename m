Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E99C284EF6E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 04:37:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b9DSMiR+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWKKS650rz3cTF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 14:37:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=b9DSMiR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWKJj6bC6z309c
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 14:36:20 +1100 (AEDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1d71cb97937so4937155ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 19:36:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707449776; x=1708054576; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOvMICqHbaoju4gGMv5HJEQ663Ejredoe1u7kvvhOv8=;
        b=b9DSMiR+qaMwIDhoAX9ba/rsGbNFN2k1X9r49Oi9Wr6mMrZPelz9HyfDjLg43nJ2lT
         RrWiR5VcMXavEVQl+1D5dUN6KEwfRHbUkmDHMZGPEfXK6eL1UGxTlW/XDrVBUpxwzmEl
         q5UgFpRG8XLCaTTcWjgSZf1xpfsL0O1kCT81SCIVRAXVUKEc8/hD4O6my8hYq5evEGc2
         EBhjZ7AMGBppn9kCvZAlRu1yQtSj/zK9807F3gYv1CNqtOuQWPHjI8XrsKap4jpbs/9f
         7v1CP+BWhud4msrkg+2ref4uAT9ef4OLdCY7I34/NqlrWtOcPgHMvevN96hDUANGlpZx
         6k7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707449776; x=1708054576;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jOvMICqHbaoju4gGMv5HJEQ663Ejredoe1u7kvvhOv8=;
        b=AQmhFDkiGXjDWOVd2xaGo3MLaCCfXvkJMflb9o2c8tKbCwPAXkPey4QCpm8/1NaTo4
         M8ZA9IEC20lrLkZOaKbwc0vCdH2Mv4UrYpFuwG2rzy0xiJnGUvGb67Ckp00BmL7AHzHK
         bWJQuUgshgSfMiazlgH9hgy1s2V+JloFSVWuekSSLNFLY64XaGFzz7ktSQyZANdQB+pe
         /SB+rKi+SGSGDX2VscM5y+AR7ZFE1T3u9vosXG9qIY9HA1DCkqH3s054OpvkBDjcYP6K
         jDS4Vwp1LGJo/XxQ/XUE2G2f0eyGnVZf2JL5JBwC71nmTjinRlM0BbJS6UoY0wfqXe1B
         St/Q==
X-Gm-Message-State: AOJu0YzHCmNtmwCfTvcQkw7PQ5GbREC+qSlsmiR+73f3AobFmLwOb/Ip
	FDCTgLMbVRigbbQuFXNglGcGC0OXagkoUKIw78gnk9nrfMZJ7qnN
X-Google-Smtp-Source: AGHT+IHdFrXH0nFeT4r0VIM8Ek03n+of3+ergenrguqPpHfVaRkUsdkMotfoKwjHuG7PmWZPn+JCcw==
X-Received: by 2002:a17:902:6503:b0:1d8:f071:5067 with SMTP id b3-20020a170902650300b001d8f0715067mr341574plk.35.1707449775931;
        Thu, 08 Feb 2024 19:36:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWWVSVfDEQS9ReM36LvSuofXi4xTJxAg2CkEwnRVAsPg/JSKZ4bUTZGysq63ScL77uYHKfUlVrAeuNd8Rpz2kwcZ3lRcpI47DQ5uPORBCqz3rTemp/ZJM1xbFk8/f4TSc9maOYHW7qC1gkl9Dn+bG6isSvPSkbnDNdvRuMrUp18sbvU4qMpvmwiGny/8tMbAOpkE2cU6rlbQxJVUzcVMEWThSFGG5Z6C4feX6eQXbOLxBLYklnzHsUCJSb7+EXtzzHpwGKUGIMDho4G
Received: from localhost ([1.146.65.44])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902654d00b001d8cde39e8bsm533560pln.194.2024.02.08.19.36.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Feb 2024 19:36:15 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 09 Feb 2024 13:36:08 +1000
Message-Id: <CZ08FF0GBT76.1FZS9YFEMKSOM@wheely>
Subject: Re: [PATCH v2 2/5] sched/vtime: get rid of generic
 vtime_task_switch() implementation
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Alexander Gordeev" <agordeev@linux.ibm.com>, "Frederic Weisbecker"
 <frederic@kernel.org>, "Ingo Molnar" <mingo@kernel.org>, "Michael Ellerman"
 <mpe@ellerman.id.au>, "Heiko Carstens" <hca@linux.ibm.com>, "Vasily Gorbik"
 <gor@linux.ibm.com>
X-Mailer: aerc 0.15.2
References: <cover.1707422448.git.agordeev@linux.ibm.com>
 <2baebb95af9772959a0d85d0bd789afdfd2baf94.1707422448.git.agordeev@linux.ibm.com>
In-Reply-To: <2baebb95af9772959a0d85d0bd789afdfd2baf94.1707422448.git.agordeev@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 9, 2024 at 6:15 AM AEST, Alexander Gordeev wrote:
> The generic vtime_task_switch() implementation gets built only
> if __ARCH_HAS_VTIME_TASK_SWITCH is not defined, but requires an
> architecture to implement arch_vtime_task_switch() callback at
> the same time, which is confusing.
>
> Further, arch_vtime_task_switch() is implemented for 32-bit PowerPC
> architecture only and vtime_task_switch() generic variant is rather
> superfluous.
>
> Simplify the whole vtime_task_switch() wiring by moving the existing
> generic implementation to PowerPC.

I think this could be squashed with patch 3.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/cputime.h | 13 -------------
>  arch/powerpc/kernel/time.c         | 22 ++++++++++++++++++++++
>  kernel/sched/cputime.c             | 13 -------------
>  3 files changed, 22 insertions(+), 26 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/as=
m/cputime.h
> index 4961fb38e438..aff858ca99c0 100644
> --- a/arch/powerpc/include/asm/cputime.h
> +++ b/arch/powerpc/include/asm/cputime.h
> @@ -32,23 +32,10 @@
>  #ifdef CONFIG_PPC64
>  #define get_accounting(tsk)	(&get_paca()->accounting)
>  #define raw_get_accounting(tsk)	(&local_paca->accounting)
> -static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
> =20
>  #else
>  #define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
>  #define raw_get_accounting(tsk)	get_accounting(tsk)
> -/*
> - * Called from the context switch with interrupts disabled, to charge al=
l
> - * accumulated times to the current process, and to prepare accounting o=
n
> - * the next process.
> - */
> -static inline void arch_vtime_task_switch(struct task_struct *prev)
> -{
> -	struct cpu_accounting_data *acct =3D get_accounting(current);
> -	struct cpu_accounting_data *acct0 =3D get_accounting(prev);
> -
> -	acct->starttime =3D acct0->starttime;
> -}
>  #endif
> =20
>  /*
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index df20cf201f74..c0fdc6d94fee 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -354,6 +354,28 @@ void vtime_flush(struct task_struct *tsk)
>  	acct->hardirq_time =3D 0;
>  	acct->softirq_time =3D 0;
>  }
> +
> +/*
> + * Called from the context switch with interrupts disabled, to charge al=
l
> + * accumulated times to the current process, and to prepare accounting o=
n
> + * the next process.
> + */
> +void vtime_task_switch(struct task_struct *prev)
> +{
> +	if (is_idle_task(prev))
> +		vtime_account_idle(prev);
> +	else
> +		vtime_account_kernel(prev);
> +
> +	vtime_flush(prev);
> +
> +	if (!IS_ENABLED(CONFIG_PPC64)) {
> +		struct cpu_accounting_data *acct =3D get_accounting(current);
> +		struct cpu_accounting_data *acct0 =3D get_accounting(prev);
> +
> +		acct->starttime =3D acct0->starttime;
> +	}
> +}
>  #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
> =20
>  void __no_kcsan __delay(unsigned long loops)
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index af7952f12e6c..aa48b2ec879d 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -424,19 +424,6 @@ static inline void irqtime_account_process_tick(stru=
ct task_struct *p, int user_
>   */
>  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> =20
> -# ifndef __ARCH_HAS_VTIME_TASK_SWITCH
> -void vtime_task_switch(struct task_struct *prev)
> -{
> -	if (is_idle_task(prev))
> -		vtime_account_idle(prev);
> -	else
> -		vtime_account_kernel(prev);
> -
> -	vtime_flush(prev);
> -	arch_vtime_task_switch(prev);
> -}
> -# endif
> -
>  void vtime_account_irq(struct task_struct *tsk, unsigned int offset)
>  {
>  	unsigned int pc =3D irq_count() - offset;


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C02BB43C0FD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 05:49:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfF6j4h9yz2ynQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 14:49:01 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LpTkQdtn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029;
 helo=mail-pj1-x1029.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LpTkQdtn; dkim-atps=neutral
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfF635sBhz2xCN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 14:48:25 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id oa4so1051016pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Oct 2021 20:48:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=8gO91DsTavhJqg+CYd5KFooA/zGuCaWHtAcWOf032kA=;
 b=LpTkQdtnAJLNnc9BHs0YPYQXVvzbDou6KylaGUhLebpR/vfuO+aHeeuUdHrYRZ1Lak
 TfBuXYIAMKCiNFVdvhNSEwuT3fklOmKIYdsLutr4GVeVwP1W3wK/A+0L8ma/tRZORnX7
 hBRuDuuc1aBbEEgdTKX5IB1wx96Q+cU5goJWBwjQEZDnoht2k+rMWneY3Yo0E0U1sctQ
 fY+JcO6dw4PQoZ2/p/MMjzAzGBRqTSEbp/aKH6Iyhq1jzFPJQgfupUjUFdgeGKaCYxUM
 wLYJHfr7weuUTJTs4sYrJwH7a3P4OEwXsuN5BL7tBygrnVhAoDsZvrPm0MnO7rltXLK1
 dqsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=8gO91DsTavhJqg+CYd5KFooA/zGuCaWHtAcWOf032kA=;
 b=dsPmHvy2sOsOd0nlX9S8JSFtXHagJEFprNpMP/IuXU/+Vb01LykDYO6KgyTo0lBwhr
 92neVzScK3DLsEPg7zL/kBBpzqOX0XNP0x7WzmK45+Z0iL4A9X419DlgiyM6imLStCvw
 urSe1N6yM/3lHHphfHmn/sso1+3at2wdZsT6dTtLTy1YDfzCYRsFDiowiKzj0BDHLd4n
 aI0syvY9zqBZ4/SiBmLWrCcikWljCM8O6DuH2H/9xmOW7C14eTnU0WB2qcvjJYj6fNev
 6DYj6ipDWT+sYXqriqpXvKIcYtOr7kXW4tYPYV1CdE5oHLJoLyjUqCrxF2ehRyE9fJda
 WKDQ==
X-Gm-Message-State: AOAM530EvJZtLT2R2UeIuqyCsUyzPumQvtghFjCQRwaGZ1jnnhEnuIRL
 fE8xbwPoxlO608u3N/sb0jdoZXMvfHE=
X-Google-Smtp-Source: ABdhPJx1T6hoLtsV11wC5cTC6hThzao44pBRWK+cjXq03BZPhVaqTlHydelAa64BLDUToZQqxlYXvQ==
X-Received: by 2002:a17:90b:4d0f:: with SMTP id
 mw15mr3113051pjb.207.1635306502443; 
 Tue, 26 Oct 2021 20:48:22 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id bx1sm2267900pjb.41.2021.10.26.20.48.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 20:48:22 -0700 (PDT)
Date: Wed, 27 Oct 2021 13:48:15 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 2/2] powerpc/watchdog: ensure watchdog data accesses are
 protected
To: benh@kernel.crashing.org, Laurent Dufour <ldufour@linux.ibm.com>,
 mpe@ellerman.id.au, paulus@samba.org
References: <20211026162740.16283-1-ldufour@linux.ibm.com>
 <20211026162740.16283-3-ldufour@linux.ibm.com>
In-Reply-To: <20211026162740.16283-3-ldufour@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1635305462.hbdpgat0vx.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Laurent Dufour's message of October 27, 2021 2:27 am:
> The wd_smp_cpus_pending CPU mask should be accessed under the protection =
of
> the __wd_smp_lock.
>=20
> This prevents false alarm to be raised when the system is under an heavy
> stress. This has been seen while doing LPM on large system with a big
> workload.
>=20
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/kernel/watchdog.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdo=
g.c
> index bc7411327066..8d7a1a86187e 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -203,12 +203,13 @@ static void watchdog_smp_panic(int cpu, u64 tb)
> =20
>  static void wd_smp_clear_cpu_pending(int cpu, u64 tb)
>  {
> +	unsigned long flags;
> +
> +	wd_smp_lock(&flags);
>  	if (!cpumask_test_cpu(cpu, &wd_smp_cpus_pending)) {
>  		if (unlikely(cpumask_test_cpu(cpu, &wd_smp_cpus_stuck))) {
>  			struct pt_regs *regs =3D get_irq_regs();
> -			unsigned long flags;
> =20
> -			wd_smp_lock(&flags);
>  			cpumask_clear_cpu(cpu, &wd_smp_cpus_stuck);
>  			wd_smp_unlock(&flags);
> =20
> @@ -219,22 +220,23 @@ static void wd_smp_clear_cpu_pending(int cpu, u64 t=
b)
>  				show_regs(regs);
>  			else
>  				dump_stack();
> +			return;
>  		}
> +
> +		wd_smp_unlock(&flags);
>  		return;
>  	}
> +
>  	cpumask_clear_cpu(cpu, &wd_smp_cpus_pending);
>  	if (cpumask_empty(&wd_smp_cpus_pending)) {
> -		unsigned long flags;
> -
> -		wd_smp_lock(&flags);
>  		if (cpumask_empty(&wd_smp_cpus_pending)) {
>  			wd_smp_last_reset_tb =3D tb;
>  			cpumask_andnot(&wd_smp_cpus_pending,
>  					&wd_cpus_enabled,
>  					&wd_smp_cpus_stuck);
>  		}
> -		wd_smp_unlock(&flags);
>  	}
> +	wd_smp_unlock(&flags);

Hmm. I wanted to avoid the lock here because all CPUs will do it on=20
every heartbeat timer.

Although maybe when you look at the cacheline transfers required it=20
doesn't matter much (and the timer is only once every few seconds).

I guess it's always better to aovid lock free craziness unless it's
required... so where is the race coming from? I guess 2 CPUs can
clear wd_smp_cpus_pending but not see one another's update so they
both miss cpumask_empty =3D=3D true! Good catch.

We shouldn't strictly need the wd_smp_lock for the first test, but
that should be an uncommon case, so okay.

Can we clear wd_smp_cpus_pending with a non-atomic operation now?

Thanks,
Nick

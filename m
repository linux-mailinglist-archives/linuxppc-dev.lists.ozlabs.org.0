Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C7033CCCD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 06:00:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F01M40Xn3z30GM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 16:00:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rjTv1ZH/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rjTv1ZH/; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F01LN1wsYz2ysw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 15:59:53 +1100 (AEDT)
Received: by mail-pl1-x633.google.com with SMTP id e2so11116616pld.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 21:59:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=S7c/3szWp6eUpws2aKgod3NbNoPHACzffGw6EM2ViuI=;
 b=rjTv1ZH/DOzglkeHTWPS3nUBtdfBgN4O+qdjqbGcFPbZDCYK+WWaV0a5aJIiRkezuo
 OOm+cQ+oZ9Yun8b5LxlP/PLlEMzEeibqTrVX66lcA/UfigFaemvbcGnH6Di2FP3JAZBj
 14DPLx35bKcg0oDmTvbujunKEPbtxepX24t2wYx/DINJ1JMhnt1rpLPAD7J1bjv5gJGZ
 QfMtrz51Fna6obdq/CwcgRSSEQrg2dZREUbSm/9YMAwSRk8vxsCtizsHfD/cRtYWyHGW
 p0ag/6LOsx1kAKhqp2KIfXpbSOsFvgMPel/qZ1Y3HDqVVEMmPtwSc0bss3XV/JQ0KTmA
 TR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=S7c/3szWp6eUpws2aKgod3NbNoPHACzffGw6EM2ViuI=;
 b=gTExA/v7GLPh+fgpR0JUf9IVakMW0iYkHQU2hhS5xGBOlyoF3LvmXwKWWQZDf7bceP
 jg66SGElgRQSw5ZXsU2u1EkNmWgjpxewgDgjBZG55YcfEQrwSOkKyjasgSENZU9Pjn/d
 lL5piiH3sM+ewaJZ6IPv+JcxR1pBhQuB92bMqVDYyWbA0Sjb47zfF31wnRClq9taq2Dk
 sFt/JZ72ZGPc3RoH3+oKAIevUROUVnYz51nIcCpgzt7xuSuN9lkJ6tBoGtohVrsq3c0Z
 J/1BNwySQSA7Tm2DbO2NZ5P6WD2O9y450b88f9Ek+Bg4FS+B6csz0xocBTieiL0fnNKz
 /SXw==
X-Gm-Message-State: AOAM533uusBqS8kpUOsGmPTpUJKIh7LP9ieZ/OJAVWe0E1vJQ3HuMvDi
 s9LHOFqd0GBlUsp628V9b/c=
X-Google-Smtp-Source: ABdhPJy7OsfIcos0+xeRhdVPgOSAgVjiDYKioAtQ6z4XidHpuFNtrMCgK/ITvQHDdhnhl9eP+goUxA==
X-Received: by 2002:a17:902:934c:b029:e6:a8b1:a4a5 with SMTP id
 g12-20020a170902934cb02900e6a8b1a4a5mr11245544plp.49.1615870790108; 
 Mon, 15 Mar 2021 21:59:50 -0700 (PDT)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id g10sm14800282pfh.212.2021.03.15.21.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 21:59:49 -0700 (PDT)
Date: Tue, 16 Mar 2021 14:59:43 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/qspinlock: Use generic smp_cond_load_relaxed
To: Davidlohr Bueso <dave@stgolabs.net>
References: <20210309015950.27688-1-dave@stgolabs.net>
 <20210309015950.27688-4-dave@stgolabs.net>
In-Reply-To: <20210309015950.27688-4-dave@stgolabs.net>
MIME-Version: 1.0
Message-Id: <1615870473.h7h4jetmjb.astroid@bobo.none>
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
Cc: will@kernel.org, Davidlohr Bueso <dbueso@suse.de>, peterz@infradead.org,
 linux-kernel@vger.kernel.org, mingo@redhat.com, paulus@samba.org,
 longman@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Davidlohr Bueso's message of March 9, 2021 11:59 am:
> 49a7d46a06c3 (powerpc: Implement smp_cond_load_relaxed()) added
> busy-waiting pausing with a preferred SMT priority pattern, lowering
> the priority (reducing decode cycles) during the whole loop slowpath.
>=20
> However, data shows that while this pattern works well with simple
> spinlocks, queued spinlocks benefit more being kept in medium priority,
> with a cpu_relax() instead, being a low+medium combo on powerpc.

Thanks for tracking this down and the comprehensive results, great
work.

It's only a relatively recent patch, so I think the revert is a
good idea (i.e., don't keep it around for possibly other code to
hit problems with).

One request, could you add a comment in place that references
smp_cond_load_relaxed() so this commit can be found again if
someone looks at it? Something like this

/*
 * smp_cond_load_relaxed was found to have performance problems if
 * implemented with spin_begin()/spin_end().
 */

I wonder if it should have a Fixes: tag to the original commit as
well.

Otherwise,

Acked-by: Nicholas Piggin <npiggin@gmail.com>

Thanks,
Nick

>=20
> Data is from three benchmarks on a Power9: 9008-22L 64 CPUs with
> 2 sockets and 8 threads per core.
>=20
> 1. locktorture.
>=20
> This is data for the lowest and most artificial/pathological level,
> with increasing thread counts pounding on the lock. Metrics are total
> ops/minute. Despite some small hits in the 4-8 range, scenarios are
> either neutral or favorable to this patch.
>=20
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+
> | # tasks | vanilla  | dirty    | %diff |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+
> | 2       | 46718565 | 48751350 | 4.35  |
> +---------+----------+----------+-------+
> | 4       | 51740198 | 50369082 | -2.65 |
> +---------+----------+----------+-------+
> | 8       | 63756510 | 62568821 | -1.86 |
> +---------+----------+----------+-------+
> | 16      | 67824531 | 70966546 | 4.63  |
> +---------+----------+----------+-------+
> | 32      | 53843519 | 61155508 | 13.58 |
> +---------+----------+----------+-------+
> | 64      | 53005778 | 53104412 | 0.18  |
> +---------+----------+----------+-------+
> | 128     | 53331980 | 54606910 | 2.39  |
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+
>=20
> 2. sockperf (tcp throughput)
>=20
> Here a client will do one-way throughput tests to a localhost server, wit=
h
> increasing message sizes, dealing with the sk_lock. This patch shows to p=
ut
> the performance of the qspinlock back to par with that of the simple lock=
:
>=20
> 		     simple-spinlock           vanilla			dirty
> Hmean     14        73.50 (   0.00%)       54.44 * -25.93%*       73.45 *=
 -0.07%*
> Hmean     100      654.47 (   0.00%)      385.61 * -41.08%*      771.43 *=
 17.87%*
> Hmean     300     2719.39 (   0.00%)     2181.67 * -19.77%*     2666.50 *=
 -1.94%*
> Hmean     500     4400.59 (   0.00%)     3390.77 * -22.95%*     4322.14 *=
 -1.78%*
> Hmean     850     6726.21 (   0.00%)     5264.03 * -21.74%*     6863.12 *=
 2.04%*
>=20
> 3. dbench (tmpfs)
>=20
> Configured to run with up to ncpusx8 clients, it shows both latency and
> throughput metrics. For the latency, with the exception of the 64 case,
> there is really nothing to go by:
> 				     vanilla                dirty
> Amean     latency-1          1.67 (   0.00%)        1.67 *   0.09%*
> Amean     latency-2          2.15 (   0.00%)        2.08 *   3.36%*
> Amean     latency-4          2.50 (   0.00%)        2.56 *  -2.27%*
> Amean     latency-8          2.49 (   0.00%)        2.48 *   0.31%*
> Amean     latency-16         2.69 (   0.00%)        2.72 *  -1.37%*
> Amean     latency-32         2.96 (   0.00%)        3.04 *  -2.60%*
> Amean     latency-64         7.78 (   0.00%)        8.17 *  -5.07%*
> Amean     latency-512      186.91 (   0.00%)      186.41 *   0.27%*
>=20
> For the dbench4 Throughput (misleading but traditional) there's a small
> but rather constant improvement:
>=20
> 			     vanilla                dirty
> Hmean     1        849.13 (   0.00%)      851.51 *   0.28%*
> Hmean     2       1664.03 (   0.00%)     1663.94 *  -0.01%*
> Hmean     4       3073.70 (   0.00%)     3104.29 *   1.00%*
> Hmean     8       5624.02 (   0.00%)     5694.16 *   1.25%*
> Hmean     16      9169.49 (   0.00%)     9324.43 *   1.69%*
> Hmean     32     11969.37 (   0.00%)    12127.09 *   1.32%*
> Hmean     64     15021.12 (   0.00%)    15243.14 *   1.48%*
> Hmean     512    14891.27 (   0.00%)    15162.11 *   1.82%*
>=20
> Measuring the dbench4 Per-VFS Operation latency, shows some very minor
> differences within the noise level, around the 0-1% ranges.
>=20
> Signed-off-by: Davidlohr Bueso <dbueso@suse.de>
> ---
>  arch/powerpc/include/asm/barrier.h | 16 ----------------
>  1 file changed, 16 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/as=
m/barrier.h
> index aecfde829d5d..7ae29cfb06c0 100644
> --- a/arch/powerpc/include/asm/barrier.h
> +++ b/arch/powerpc/include/asm/barrier.h
> @@ -80,22 +80,6 @@ do {									\
>  	___p1;								\
>  })
> =20
> -#ifdef CONFIG_PPC64
> -#define smp_cond_load_relaxed(ptr, cond_expr) ({		\
> -	typeof(ptr) __PTR =3D (ptr);				\
> -	__unqual_scalar_typeof(*ptr) VAL;			\
> -	VAL =3D READ_ONCE(*__PTR);				\
> -	if (unlikely(!(cond_expr))) {				\
> -		spin_begin();					\
> -		do {						\
> -			VAL =3D READ_ONCE(*__PTR);		\
> -		} while (!(cond_expr));				\
> -		spin_end();					\
> -	}							\
> -	(typeof(*ptr))VAL;					\
> -})
> -#endif
> -
>  #ifdef CONFIG_PPC_BOOK3S_64
>  #define NOSPEC_BARRIER_SLOT   nop
>  #elif defined(CONFIG_PPC_FSL_BOOK3E)
> --=20
> 2.26.2
>=20
>=20

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3396FBD06
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:18:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhdp3zxrz3fNJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:18:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QfCpAPmE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=QfCpAPmE;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhcv4ptqz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:17:19 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1aad55244b7so40116895ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683598637; x=1686190637;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1c5QHsHtK3YVNvmaOvJ1tcNQN6mveqda16NUcJsGVOQ=;
        b=QfCpAPmEFv3dyiNoqe/LgWfN+xAbPKDI2p1RO1nIn3VwASK3pMLYMZZAZT31dzry2C
         tjVbjLCvudbVHqjpbGUzBl+Wmyv5i9P4lYmMlK8oC8MPNk2LxJmBCUkNr6RAR6oe2x3I
         dff6ADFhSgjA1vXr6AkYIoP0Lngb5VkUDnlrITA/kRAzrfWXxrUiDnk+wQFf/+egHJH2
         crnl4mxQ+zzSWPI8t+0Rs8znQJlplOJENOAr2r+UD4RBLX6SGOun9oE+6BQgKsYqHr0Z
         qRQwwYcmEXYG34JifRtpXB8Trh2C21Ve1kiqIh7j4QihQHjxUagkgP0aLIajgXyeR5NY
         deiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683598637; x=1686190637;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1c5QHsHtK3YVNvmaOvJ1tcNQN6mveqda16NUcJsGVOQ=;
        b=DW6BUs+tjQStUBNQux9nlBKqpKyGa6DhwBLO0V466Ahb8YJnFScMfu9y85UfpxsBKK
         q0UrR+oK0/ddOfrCRnF98C8mjVBuloGmUk6wyUasNDkT5A4JFByBFKdlqBfJkbshuIiv
         a336A9KPHcNJ+FRwQrkC1Lx/ZmMuAVaRIh3hqCy4vVxkYd9N2ss3+NYRR5PQaXVFfPaF
         XOvrdMIosXWberyx56/mM9Bh0Ny8B8aodTH62XSm21UcA2dbhNxql/FPNExZ6/Dtv5WN
         h/MnwSREYNXHtFYe/06k6X0ggnBad6lmO2Jpf9i/BPTyLeHPSDirWyw7IybaPiGCeqes
         px+w==
X-Gm-Message-State: AC+VfDxVX7MmlrDNMnGcecJBsCupWcd/DdQIi7hZOC0yFA3mNPjS8z6C
	TU7eIdYv7cBc4H/j7d3yA1I=
X-Google-Smtp-Source: ACHHUZ7Dcq+CfPbgrwSjjLlGGX2j5I6vN5hLVyo2R6eIA6MA/eP2mmVdtfXlfH3j/Zie6oJuR9aPvQ==
X-Received: by 2002:a17:903:50d:b0:1a2:8c7e:f315 with SMTP id jn13-20020a170903050d00b001a28c7ef315mr11819250plb.21.1683598636774;
        Mon, 08 May 2023 19:17:16 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id l4-20020a170902f68400b001a19f3a661esm172412plg.138.2023.05.08.19.17.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:17:16 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:17:10 +1000
Message-Id: <CSHDWLEP2SLB.1Y2YHOLFT2H41@wheely>
Subject: Re: [PATCH 05/12] powerpc: Mark [h]ssr_valid accesses in
 check_return_regs_valid
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-6-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-6-rmclure@linux.ibm.com>
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
Cc: arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
> Checks to see if the [H]SRR registers have been clobbered by (soft)
> NMI interrupts imply the possibility for a data race on the
> [h]srr_valid entries in the PACA. Annotate accesses to these fields with
> READ_ONCE, removing the need for the barrier.
>
> The diagnostic can use plain-access reads and writes, but annotate with
> data_race.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/ptrace.h |  4 ++--
>  arch/powerpc/kernel/interrupt.c   | 14 ++++++--------
>  2 files changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm=
/ptrace.h
> index 0eb90a013346..9db8b16567e2 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -180,8 +180,8 @@ void do_syscall_trace_leave(struct pt_regs *regs);
>  static inline void set_return_regs_changed(void)
>  {
>  #ifdef CONFIG_PPC_BOOK3S_64
> -	local_paca->hsrr_valid =3D 0;
> -	local_paca->srr_valid =3D 0;
> +	WRITE_ONCE(local_paca->hsrr_valid, 0);
> +	WRITE_ONCE(local_paca->srr_valid, 0);
>  #endif
>  }
> =20
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index e34c72285b4e..1f033f11b871 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -125,7 +125,7 @@ static notrace void check_return_regs_valid(struct pt=
_regs *regs)
>  	case 0x1600:
>  	case 0x1800:
>  		validp =3D &local_paca->hsrr_valid;
> -		if (!*validp)
> +		if (!READ_ONCE(*validp))
>  			return;
> =20
>  		srr0 =3D mfspr(SPRN_HSRR0);
> @@ -135,7 +135,7 @@ static notrace void check_return_regs_valid(struct pt=
_regs *regs)
>  		break;
>  	default:
>  		validp =3D &local_paca->srr_valid;
> -		if (!*validp)
> +		if (!READ_ONCE(*validp))
>  			return;
> =20
>  		srr0 =3D mfspr(SPRN_SRR0);
> @@ -161,19 +161,17 @@ static notrace void check_return_regs_valid(struct =
pt_regs *regs)
>  	 * such things will get caught most of the time, statistically
>  	 * enough to be able to get a warning out.
>  	 */
> -	barrier();
> -
> -	if (!*validp)
> +	if (!READ_ONCE(*validp))
>  		return;
> =20
> -	if (!warned) {
> -		warned =3D true;
> +	if (!data_race(warned)) {
> +		data_race(warned =3D true);
>  		printk("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
>  		printk("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
>  		show_regs(regs);
>  	}
> =20
> -	*validp =3D 0; /* fixup */
> +	WRITE_ONCE(*validp, 0); /* fixup */
>  #endif
>  }
> =20
> --=20
> 2.37.2


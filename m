Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21CAD4C7E5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 09:12:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TtLF4Z3lzDr8R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 17:12:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Dlr7Ai8o"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TrKB5FM0zDqyg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 15:41:18 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id l19so947563pgh.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 22:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=DPHk7T9xLwgtW00XEv6KFc9AwQDOzT77UDcWo6QpTOc=;
 b=Dlr7Ai8oZzQE9X+jYX4RL/6Seo3P9kO2oLC1ObyenAyu1giA4myij3Zg7QJ0jDd+R3
 r3VUv8CmM0YNraz+E3jyeVme4pzw+rlLM1L7eVlU/ddJy16XhK+f6BYWB3Qs6qkpYA8s
 DboUqY9bhU/VshO9Xj/8xfxe9sYirCs+ElO8WJ3MAd621WfvGjDAZadbF5kqHZLi+aZH
 L1SjPf0tLwjpMwoM5NMiDyTv0+EosebfIRCL05QownCCDJCz8KBk20eFQY23H6CauWpq
 Nx3bLetPr2hF2pBYdTte94TwtL7DMSQXyXJQ/2N5vmCdMTyBXMR3O/+wusQlUPE9a3oG
 xgYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=DPHk7T9xLwgtW00XEv6KFc9AwQDOzT77UDcWo6QpTOc=;
 b=N8J+5N6FEAwasVPXRcMsYzYBvPv0Mlgx5kM71CT/G2bdISxLXX7j9C+3fiDkbVK6fR
 h7kE0wsMmHE/ebhIkQKRNbB5fG8wThQlZdGdCSg8FmrrF+uv+yKl1Kf1+VLn2D3unLyn
 IhgMi23jwtNN6+cCnVusz+bLFbICoflppO7ct5ehM2R3sJjuvRieStmCRwL59SHxDKSP
 v/ywZO20Qr+Vx2h61xKHZQZ4q8z5Bwtol4tegPrrWo5mPz/yjvoguVgPN7Hd3I+C/8JK
 Ts/q+kFoWuHb+VdsRs2XEf0GeHSyw2ts7YBPJlQBgrrn9lZsxU1lt0xqkFbRxpx1aw0e
 XR1g==
X-Gm-Message-State: APjAAAWhAs9oyxNtKwZvlPwiY39mbCq6Nuq0z2oD0zIvHUcwn94dSNA2
 Gh/d0XOEl1O91rCodURJhihChQuz
X-Google-Smtp-Source: APXvYqxtkDcqTrJRkj9JIcnpB8J9w2kBHod60eqCimwHCyPLhEW+SkX7AnFuGa/HEFx6zJT2ysw4Ow==
X-Received: by 2002:aa7:8812:: with SMTP id c18mr5026784pfo.60.1561009276191; 
 Wed, 19 Jun 2019 22:41:16 -0700 (PDT)
Received: from localhost (193-116-72-140.tpgi.com.au. [193.116.72.140])
 by smtp.gmail.com with ESMTPSA id s66sm21337328pgs.87.2019.06.19.22.41.14
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 22:41:15 -0700 (PDT)
Date: Thu, 20 Jun 2019 15:41:22 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 30/52] powerpc/64s/exception: optimise system_reset for
 idle, clean up non-idle case
To: linuxppc-dev@lists.ozlabs.org
References: <20190620051459.29573-1-npiggin@gmail.com>
 <20190620051459.29573-31-npiggin@gmail.com>
In-Reply-To: <20190620051459.29573-31-npiggin@gmail.com>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1561009203.aqiorjad1z.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin's on June 20, 2019 3:14 pm:
> The idle wake up code in the system reset interrupt is not very
> optimal. There are two requirements: perform idle wake up quickly;
> and save everything including CFAR for non-idle interrupts, with
> no performance requirement.
>=20
> The problem with placing the idle test in the middle of the handler
> and using the normal handler code to save CFAR, is that it's quite
> costly (e.g., mfcfar is serialising, speculative workarounds get
> applied, SRR1 has to be reloaded, etc). It also prevents the standard
> interrupt handler boilerplate being used.
>=20
> This pain can be avoided by using a dedicated idle interrupt handler
> at the start of the interrupt handler, which restores all registers
> back to the way they were in case it was not an idle wake up. CFAR
> is preserved without saving it before the non-idle case by making that
> the fall-through, and idle is a taken branch.
>=20
> Performance seems to be in the noise, but possibly around 0.5% faster,
> the executed instructions certainly look better. The bigger benefit is
> being able to drop in standard interrupt handlers after the idle code,
> which helps with subsequent cleanup and consolidation.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kernel/exceptions-64s.S | 89 ++++++++++++++--------------
>  1 file changed, 44 insertions(+), 45 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/e=
xceptions-64s.S
> index e0492912ea79..f582ae30f3f7 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -241,7 +241,7 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
>   * load KBASE for a slight optimisation.
>   */
>  #define BRANCH_TO_C000(reg, label)					\
> -	__LOAD_HANDLER(reg, label);					\
> +	__LOAD_FAR_HANDLER(reg, label);					\
>  	mtctr	reg;							\
>  	bctr
> =20
> @@ -784,16 +784,6 @@ EXC_VIRT_NONE(0x4000, 0x100)
> =20
> =20
>  EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
> -	SET_SCRATCH0(r13)
> -	EXCEPTION_PROLOG_0 PACA_EXNMI
> -
> -	/* This is EXCEPTION_PROLOG_1 with the idle feature section added */
> -	OPT_SAVE_REG_TO_PACA(PACA_EXNMI+EX_PPR, r9, CPU_FTR_HAS_PPR)
> -	OPT_SAVE_REG_TO_PACA(PACA_EXNMI+EX_CFAR, r10, CPU_FTR_CFAR)
> -	INTERRUPT_TO_KERNEL
> -	SAVE_CTR(r10, PACA_EXNMI)
> -	mfcr	r9
> -
>  #ifdef CONFIG_PPC_P7_NAP
>  	/*
>  	 * If running native on arch 2.06 or later, check if we are waking up
> @@ -801,45 +791,67 @@ EXC_REAL_BEGIN(system_reset, 0x100, 0x100)
>  	 * bits 46:47. A non-0 value indicates that we are coming from a power
>  	 * saving state. The idle wakeup handler initially runs in real mode,
>  	 * but we branch to the 0xc000... address so we can turn on relocation
> -	 * with mtmsr.
> +	 * with mtmsrd later, after SPRs are restored.
> +	 *
> +	 * Careful to minimise cost for the fast path (idle wakeup) while
> +	 * also avoiding clobbering CFAR for the non-idle case. Once we know
> +	 * it is an idle wake, volatiles don't matter, which is why we use
> +	 * those here, and then re-do the entry in case of non-idle (without
> +	 * branching for the non-idle case, to keep CFAR).
>  	 */
>  BEGIN_FTR_SECTION
> -	mfspr	r10,SPRN_SRR1
> -	rlwinm.	r10,r10,47-31,30,31
> -	beq-	1f
> -	cmpwi	cr1,r10,2
> +	SET_SCRATCH0(r13)
> +	GET_PACA(r13)
> +	std	r3,PACA_EXNMI+0*8(r13)
> +	std	r4,PACA_EXNMI+1*8(r13)
> +	std	r5,PACA_EXNMI+2*8(r13)
>  	mfspr	r3,SPRN_SRR1
> -	bltlr	cr1	/* no state loss, return to idle caller */
> -	BRANCH_TO_C000(r10, system_reset_idle_common)
> -1:
> +	mfocrf	r4,0x80
> +	rlwinm.	r5,r3,47-31,30,31
> +	bne+	system_reset_idle_wake
> +	/* Not powersave wakeup. Restore regs for regular interrupt handler. */
> +	mtocrf	0x80,r4
> +	ld	r12,PACA_EXNMI+0*8(r13)
> +	ld	r4,PACA_EXNMI+1*8(r13)
> +	ld	r5,PACA_EXNMI+2*8(r13)
> +	GET_SCRATCH0(r13)

For the love of... that should be 'ld r3', not 'ld r12', sorry.

Thanks,
Nick
=

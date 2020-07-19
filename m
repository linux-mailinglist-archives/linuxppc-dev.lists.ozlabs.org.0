Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2189B2254CB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 01:59:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B920637FbzDqq8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 09:59:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=uT2+zaTb; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B91y90kdczDqbg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 09:57:51 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id a24so8160811pfc.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Jul 2020 16:57:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=dSG09n2oHE5/NB8epYDiKNjgxgruVUEVoorNceuh6EY=;
 b=uT2+zaTbOowRyb+wAcQBYeUv45J/Uf3EtbdGezLqWCyzpuGEB8+JT+Bo9PbbWD6ZxT
 HtYgGwE6dkaBwIHbqKPqZw0CdpdMT8kJsUlOWH9kWg5v8oIM9UvKNbC03RX1ortX/ZMv
 Nl5Mck8Sn6oyAGelsP0GV48owyO7tKxHiiCkAvRGCbgmhblyKlMu5qgDEj2wvmSS1/fr
 W9wt3MPRdoyWV48fo5ooyqv4REhSo+evd6JGB2OJc1Ps4rKzt0bBhvPc3Pdv2qCB1gws
 d+MInfYr4ER9i5NEAx9Vpkbdt0oS//B2gOF3ggn/opFZP9oTjZLy0z7KxtwPGWxYpQqY
 iq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=dSG09n2oHE5/NB8epYDiKNjgxgruVUEVoorNceuh6EY=;
 b=JA3fgnKVQws0E3609ZjdHBt/OyNyDRuMU2dY2rOtqg7XsgAuAy6Drn/r9xoHutrJVO
 5a85hJSA92hcEio/JaXAns+oRojKwekqgjY3dDJuLl/f7gsbVBq/8C4Q0295SaYpqjO3
 skMhbbu1sek7KFmYDvWdpYvSeZ5MIhIYlhljzcHc8CnuUfq7DGYgXKVVnQyLM3DixEks
 lAJ5/FOgl0MdzT83+QzmtfuFpPwo2Zv36qV3tI7P3U+XFfKTg0pbctjbN5RJFflJ2Mjv
 oZs+Pdb006LzseTGbcCuYRdz6HlqqMuYLLwA+Oy6lUHzZLx/D1ekTZW3ewbMfchtJG5T
 gHjQ==
X-Gm-Message-State: AOAM5314gGWrFvBZ4OvnJrQ1o2FXL+YwbGW20EZUO8R1nKhrQLANMV6+
 GrpMA1m8fUHINez7pnnvHd0=
X-Google-Smtp-Source: ABdhPJyI+/k+zJZfCdHxZO6/LF9WqA4DVLP/ohb4RpMu/hW1sdcyHhyDxZjyDRVsACRz0GEb/hiEQg==
X-Received: by 2002:a62:7790:: with SMTP id s138mr16509948pfc.65.1595203068075; 
 Sun, 19 Jul 2020 16:57:48 -0700 (PDT)
Received: from localhost (110-174-173-27.tpgi.com.au. [110.174.173.27])
 by smtp.gmail.com with ESMTPSA id b11sm14802158pfr.179.2020.07.19.16.57.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jul 2020 16:57:47 -0700 (PDT)
Date: Mon, 20 Jul 2020 09:57:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 2/3] powerpc/powernv/idle: Rename
 pnv_first_spr_loss_level variable
To: benh@kernel.crashing.org, ego@linux.vnet.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mikey@neuling.org, mpe@ellerman.id.au, paulus@samba.org,
 pratik.r.sampat@gmail.com, Pratik Rajesh Sampat <psampat@linux.ibm.com>,
 svaidy@linux.ibm.com
References: <20200717185306.60607-1-psampat@linux.ibm.com>
 <20200717185306.60607-3-psampat@linux.ibm.com>
In-Reply-To: <20200717185306.60607-3-psampat@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1595202681.bt4670u7q7.astroid@bobo.none>
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

Excerpts from Pratik Rajesh Sampat's message of July 18, 2020 4:53 am:
> Replace the variable name from using "pnv_first_spr_loss_level" to
> "pnv_first_fullstate_loss_level".
>=20
> As pnv_first_spr_loss_level is supposed to be the earliest state that
> has OPAL_PM_LOSE_FULL_CONTEXT set, however as shallow states too loose
> SPR values, render an incorrect terminology.

It also doesn't lose "full" state at this loss level though. From the=20
architecture it could be called "hv state loss level", but in POWER10=20
even that is not strictly true.


>=20
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
> ---
>  arch/powerpc/platforms/powernv/idle.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platfor=
ms/powernv/idle.c
> index f62904f70fc6..d439e11af101 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -48,7 +48,7 @@ static bool default_stop_found;
>   * First stop state levels when SPR and TB loss can occur.
>   */
>  static u64 pnv_first_tb_loss_level =3D MAX_STOP_STATE + 1;
> -static u64 pnv_first_spr_loss_level =3D MAX_STOP_STATE + 1;
> +static u64 pnv_first_fullstate_loss_level =3D MAX_STOP_STATE + 1;
> =20
>  /*
>   * psscr value and mask of the deepest stop idle state.
> @@ -657,7 +657,7 @@ static unsigned long power9_idle_stop(unsigned long p=
sscr, bool mmu_on)
>  		  */
>  		mmcr0		=3D mfspr(SPRN_MMCR0);
>  	}
> -	if ((psscr & PSSCR_RL_MASK) >=3D pnv_first_spr_loss_level) {
> +	if ((psscr & PSSCR_RL_MASK) >=3D pnv_first_fullstate_loss_level) {
>  		sprs.lpcr	=3D mfspr(SPRN_LPCR);
>  		sprs.hfscr	=3D mfspr(SPRN_HFSCR);
>  		sprs.fscr	=3D mfspr(SPRN_FSCR);
> @@ -741,7 +741,7 @@ static unsigned long power9_idle_stop(unsigned long p=
sscr, bool mmu_on)
>  	 * just always test PSSCR for SPR/TB state loss.
>  	 */
>  	pls =3D (psscr & PSSCR_PLS) >> PSSCR_PLS_SHIFT;
> -	if (likely(pls < pnv_first_spr_loss_level)) {
> +	if (likely(pls < pnv_first_fullstate_loss_level)) {
>  		if (sprs_saved)
>  			atomic_stop_thread_idle();
>  		goto out;
> @@ -1088,7 +1088,7 @@ static void __init pnv_power9_idle_init(void)
>  	 * the deepest loss-less (OPAL_PM_STOP_INST_FAST) stop state.
>  	 */
>  	pnv_first_tb_loss_level =3D MAX_STOP_STATE + 1;
> -	pnv_first_spr_loss_level =3D MAX_STOP_STATE + 1;
> +	pnv_first_fullstate_loss_level =3D MAX_STOP_STATE + 1;
>  	for (i =3D 0; i < nr_pnv_idle_states; i++) {
>  		int err;
>  		struct pnv_idle_states_t *state =3D &pnv_idle_states[i];
> @@ -1099,8 +1099,8 @@ static void __init pnv_power9_idle_init(void)
>  			pnv_first_tb_loss_level =3D psscr_rl;
> =20
>  		if ((state->flags & OPAL_PM_LOSE_FULL_CONTEXT) &&
> -		     (pnv_first_spr_loss_level > psscr_rl))
> -			pnv_first_spr_loss_level =3D psscr_rl;
> +		     (pnv_first_fullstate_loss_level > psscr_rl))
> +			pnv_first_fullstate_loss_level =3D psscr_rl;
> =20
>  		/*
>  		 * The idle code does not deal with TB loss occurring
> @@ -1111,8 +1111,8 @@ static void __init pnv_power9_idle_init(void)
>  		 * compatibility.
>  		 */
>  		if ((state->flags & OPAL_PM_TIMEBASE_STOP) &&
> -		     (pnv_first_spr_loss_level > psscr_rl))
> -			pnv_first_spr_loss_level =3D psscr_rl;
> +		     (pnv_first_fullstate_loss_level > psscr_rl))
> +			pnv_first_fullstate_loss_level =3D psscr_rl;
> =20
>  		err =3D validate_psscr_val_mask(&state->psscr_val,
>  					      &state->psscr_mask,
> @@ -1158,7 +1158,7 @@ static void __init pnv_power9_idle_init(void)
>  	}
> =20
>  	pr_info("cpuidle-powernv: First stop level that may lose SPRs =3D 0x%ll=
x\n",
> -		pnv_first_spr_loss_level);
> +		pnv_first_fullstate_loss_level);
> =20
>  	pr_info("cpuidle-powernv: First stop level that may lose timebase =3D 0=
x%llx\n",
>  		pnv_first_tb_loss_level);
> --=20
> 2.25.4
>=20
>=20

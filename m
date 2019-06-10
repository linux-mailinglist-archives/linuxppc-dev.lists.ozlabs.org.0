Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AACCF3C117
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 03:51:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NCdj6bTFzDqKb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 11:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.36.150; helo=17.mo6.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 28802 seconds by postgrey-1.36 at bilbo;
 Tue, 11 Jun 2019 11:49:09 AEST
Received: from 17.mo6.mail-out.ovh.net (17.mo6.mail-out.ovh.net
 [46.105.36.150])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NCbT20TSzDqR1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 11:49:04 +1000 (AEST)
Received: from player687.ha.ovh.net (unknown [10.108.57.139])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 1DCEF1CF451
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jun 2019 19:31:33 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
 (Authenticated sender: clg@kaod.org)
 by player687.ha.ovh.net (Postfix) with ESMTPSA id 789E26A33C0D;
 Mon, 10 Jun 2019 17:31:30 +0000 (UTC)
Subject: Re: [PATCH v2] powerpc: Add force enable of DAWR on P9 option
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
References: <20190401060312.22670-1-mikey@neuling.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <68f4f99d-4bb7-7d25-1e68-96c65dfbfbe9@kaod.org>
Date: Mon, 10 Jun 2019 19:31:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190401060312.22670-1-mikey@neuling.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 10661427696369044271
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrudehvddgudduhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecu
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
Cc: linuxppc-dev@lists.ozlabs.org, Cameron Kaiser <spectre@floodgap.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Michael,


> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -822,18 +822,21 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
>  	mtspr	SPRN_IAMR, r5
>  	mtspr	SPRN_PSPB, r6
>  	mtspr	SPRN_FSCR, r7
> -	ld	r5, VCPU_DAWR(r4)
> -	ld	r6, VCPU_DAWRX(r4)
> -	ld	r7, VCPU_CIABR(r4)
> -	ld	r8, VCPU_TAR(r4)
>  	/*
>  	 * Handle broken DAWR case by not writing it. This means we
>  	 * can still store the DAWR register for migration.
>  	 */
> -BEGIN_FTR_SECTION
> +	LOAD_REG_ADDR(r5, dawr_force_enable)
> +	lbz	r5, 0(r5)
> +	cmpdi	r5, 0
> +	beq	1f
> +	ld	r5, VCPU_DAWR(r4)
> +	ld	r6, VCPU_DAWRX(r4)
>  	mtspr	SPRN_DAWR, r5
>  	mtspr	SPRN_DAWRX, r6
> -END_FTR_SECTION_IFSET(CPU_FTR_DAWR)
> +1:
> +	ld	r7, VCPU_CIABR(r4)
> +	ld	r8, VCPU_TAR(r4)
>  	mtspr	SPRN_CIABR, r7
>  	mtspr	SPRN_TAR, r8
>  	ld	r5, VCPU_IC(r4)
> @@ -2513,11 +2516,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>  	blr
>  
>  2:
> -BEGIN_FTR_SECTION
> -	/* POWER9 with disabled DAWR */
> +	LOAD_REG_ADDR(r11, dawr_force_enable)
> +	lbz	r11, 0(r11)
> +	cmpdi	r11, 0
>  	li	r3, H_HARDWARE
> -	blr
> -END_FTR_SECTION_IFCLR(CPU_FTR_DAWR)
> +	beqlr

Why is this a 'beqlr' ? Shouldn't it be a blr ? 

C.

>  	/* Emulate H_SET_DABR/X on P8 for the sake of compat mode guests */
>  	rlwimi	r5, r4, 5, DAWRX_DR | DAWRX_DW
>  	rlwimi	r5, r4, 2, DAWRX_WT
> 


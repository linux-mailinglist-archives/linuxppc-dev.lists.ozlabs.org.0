Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D1D296835
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 02:59:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CHQq932RJzDr1f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Oct 2020 11:59:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CHQnc4KmPzDqyS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Oct 2020 11:57:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IEB4JHQC; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CHQnc1XnVz9sSn;
 Fri, 23 Oct 2020 11:57:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1603414676;
 bh=1vfPsO+PTKHABF4ESaae2QVReim8BZkeKSL2McUEjn0=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=IEB4JHQCrvdRq7pLaHS9o7PY1nZ5/p1EYzSdpK7kberb/S/pWEUR7dFtfl0CqcEY+
 +mkvHiJf6kI3A4MSB+Ujgka1iXHiRdMKobUI5HGBCLq7BEGweUC9zkOzZErZfAsL1l
 5BLbPFNjIZP/YHkehPgCipSbnApub5X7QV1//Yh+aungm7qrPy+vgrsncHZAw/R9H5
 4r0eu9iUWFpPb3VqLRSLFlXlK7FKgyLU/7t09yvL7cmGPPFUFvCztoGJDdQk4VO56U
 9LtTzvqm9s1cLP0v8wQj+E1NRQg0VNtRiIkSvbMV8pgPIWxUUtaTmcz8YUOZ9rG52U
 4k32qsPjkAcdA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Joakim Tjernlund <joakim.tjernlund@infinera.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc: Send SIGBUS from machine_check
In-Reply-To: <20201001170557.10915-1-joakim.tjernlund@infinera.com>
References: <20201001170557.10915-1-joakim.tjernlund@infinera.com>
Date: Fri, 23 Oct 2020 11:57:51 +1100
Message-ID: <87d019yd0w.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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

Joakim Tjernlund <joakim.tjernlund@infinera.com> writes:
> Embedded PPC CPU should send SIGBUS to user space when applicable.

Yeah, but it's not clear that it's applicable in all cases.

At least I need some reasoning for why it's safe in all cases below to
just send a SIGBUS and take no other action.

Is there a particular CPU you're working on? Can we start with that and
look at all the machine check causes and which can be safely handled.

Some comments below ...


> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 0381242920d9..12715d24141c 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -621,6 +621,11 @@ int machine_check_e500mc(struct pt_regs *regs)

At the beginning of the function we have:

	printk("Machine check in kernel mode.\n");

Which should be updated.

>  		       reason & MCSR_MEA ? "Effective" : "Physical", addr);
>  	}
>  
> +	if ((user_mode(regs))) {
> +		_exception(SIGBUS, regs, reason, regs->nip);
> +		recoverable = 1;
> +	}

For most of the error causes we take no action and set recoverable = 0.

Then you just declare that it is recoverable because it hit in
userspace. Depending on the cause that might be OK, but it's not
obviously correct in all cases.


> +
>  silent_out:
>  	mtspr(SPRN_MCSR, mcsr);
>  	return mfspr(SPRN_MCSR) == 0 && recoverable;
> @@ -665,6 +670,10 @@ int machine_check_e500(struct pt_regs *regs)

Same comment about the printk().

>  	if (reason & MCSR_BUS_RPERR)
>  		printk("Bus - Read Parity Error\n");
>  
> +	if ((user_mode(regs))) {
> +		_exception(SIGBUS, regs, reason, regs->nip);
> +		return 1;
> +	}

And same comment more or less.

Other than the MCSR_BUS_RBERR cases that are explicitly checked, the
function does nothing to clear the cause of the machine check.

>  	return 0;
>  }
>  
> @@ -695,6 +704,10 @@ int machine_check_e200(struct pt_regs *regs)
>  	if (reason & MCSR_BUS_WRERR)
>  		printk("Bus - Write Bus Error on buffered store or cache line push\n");
>  
> +	if ((user_mode(regs))) {
> +		_exception(SIGBUS, regs, reason, regs->nip);
> +		return 1;
> +	}

Same.

>  	return 0;
>  }
>  #elif defined(CONFIG_PPC32)
> @@ -731,6 +744,10 @@ int machine_check_generic(struct pt_regs *regs)
>  	default:
>  		printk("Unknown values in msr\n");
>  	}
> +	if ((user_mode(regs))) {
> +		_exception(SIGBUS, regs, reason, regs->nip);
> +		return 1;
> +	}

Same.

>  	return 0;
>  }
>  #endif /* everything else */
> -- 
> 2.26.2


cheers

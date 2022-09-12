Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5545B5901
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 13:10:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MR3mB4KPYz3c4c
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:10:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JQFU2And;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JQFU2And;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MR3lX0qMxz2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 21:09:43 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id i19so4664665pgi.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 04:09:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=lh0eAcN6IKmWya3xTKUY4oE/KCOo+CsZKRl8gYsKAOo=;
        b=JQFU2AndiQgiZY/8Osctofx+K9GPFiMqwHlTXWZ4whua+qlB90KV1K4Qys1C2EFzxG
         fmXUXQ7uQbo8JrnVlBanh6qz0bE9hjaSZ8RE5bWFUnh9MsFD75LCkDLSWikPkQkFlIv4
         Y2jqs+fbwahhdTWzGdSkAjThCCqiPtLkrOO3qDb0wahyyIqkwTh7cDzxJMO675eilPjy
         RZlrZjIII4FkqcWvMBn0EqyPelQ2kYct289tTRvPLGo0f0J0Q5YWgI9YxuVoW1UL0Xbd
         nwBSLE1QyhviCjz/DubHPqg12A7cgcRjgU2OeLrw9rjV3PtRK5MSLm4+OrgJOrZztwig
         Myww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=lh0eAcN6IKmWya3xTKUY4oE/KCOo+CsZKRl8gYsKAOo=;
        b=VyH9qBn50+0Yg0/f+joepMApf7yFY6PCTB8vUE95fZvvvlUmgHwPbjs5qKpiZmFcg2
         n+T73Rw6UNfgHxQgWvUEbPT/rHA+/NEIQlI4OQYNbzqf6Kiw4WsbWoDggka++WUq3PaG
         ObgzUAerUO5TF2CD6owKobOWFPqDJVovead939IbJPNfDZu6sq6l5vsil+bAgHCBDHZA
         97ehpL+ZJBTuZnHqinG3EFsFb04Rr+0416wDD0ncBKyC9B2vjwuNEoM5vpOQR5m7JEBh
         uPinU9/1/YwyjxQH0VnoAIkLs3tsGXsWmMv9tfYHdS+FZzTarjuVg1ZIYDuKHhhy9HYE
         W1sQ==
X-Gm-Message-State: ACgBeo3P/GybB76XliVzt1WMDY697BVePlBkI05HbF0qJbm2jxlTkqWG
	yVkNAhDKQpoz3ae/wSHBfz8=
X-Google-Smtp-Source: AA6agR7ZXX4aZiyBj6oRGbGp32/Zd05RH5ca8aZThsODMcqMPI7rvtT1+nM8dKvN9aps4ZH4sD8Jmg==
X-Received: by 2002:a63:d312:0:b0:438:5cd8:8d56 with SMTP id b18-20020a63d312000000b004385cd88d56mr17200939pgg.615.1662980980945;
        Mon, 12 Sep 2022 04:09:40 -0700 (PDT)
Received: from localhost ([118.210.107.131])
        by smtp.gmail.com with ESMTPSA id o4-20020a170902d4c400b001782f94f8ebsm2435074plg.3.2022.09.12.04.09.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Sep 2022 04:09:40 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 12 Sep 2022 21:09:36 +1000
Message-Id: <CMUDK23FKG34.12SMOO6QFJ50R@bobo>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 11/20] powerpc: Add ZEROIZE_GPRS macros for register
 clears
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <20220824020548.62625-1-rmclure@linux.ibm.com>
 <20220824020548.62625-12-rmclure@linux.ibm.com>
In-Reply-To: <20220824020548.62625-12-rmclure@linux.ibm.com>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Aug 24, 2022 at 12:05 PM AEST, Rohan McLure wrote:
> Macros for restoring and saving registers to and from the stack exist.
> Provide macros with the same interface for clearing a range of gprs by
> setting each register's value in that range to zero.

Can I bikeshed this a bit more and ask if you would change the order?

Saving and restoring macros are incidental, and are neither the change
nor the reson for it. I think the changelog reads better if you state
the change (or the problem) up front.

Provid register zeroing macros ... follow the same convention as
existing register stack save/restore macros ... will be used in later
change to zero registers.

Or not, if you disagree.

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> The resulting macros are called ZEROIZE_GPRS and ZEROIZE_NVGPRS, keeping
> with the naming of the accompanying restore and save macros, and usage
> of zeroize to describe this operation elsewhere in the kernel.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Change 'ZERO' usage in naming to 'NULLIFY', a more obvious verb
> V2 -> V3: Change 'NULLIFY' usage in naming to 'ZEROIZE', which has
> precedent in kernel and explicitly specifies that we are zeroing.
> V3 -> V4: Update commit message to use zeroize.
> ---
>  arch/powerpc/include/asm/ppc_asm.h | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/as=
m/ppc_asm.h
> index 83c02f5a7f2a..b95689ada59c 100644
> --- a/arch/powerpc/include/asm/ppc_asm.h
> +++ b/arch/powerpc/include/asm/ppc_asm.h
> @@ -33,6 +33,20 @@
>  	.endr
>  .endm
> =20
> +/*
> + * This expands to a sequence of register clears for regs start to end
> + * inclusive, of the form:
> + *
> + *   li rN, 0
> + */
> +.macro ZEROIZE_REGS start, end
> +	.Lreg=3D\start
> +	.rept (\end - \start + 1)
> +	li	.Lreg, 0
> +	.Lreg=3D.Lreg+1
> +	.endr
> +.endm
> +
>  /*
>   * Macros for storing registers into and loading registers from
>   * exception frames.
> @@ -49,6 +63,14 @@
>  #define REST_NVGPRS(base)		REST_GPRS(13, 31, base)
>  #endif
> =20
> +#define	ZEROIZE_GPRS(start, end)	ZEROIZE_REGS start, end
> +#ifdef __powerpc64__
> +#define	ZEROIZE_NVGPRS()		ZEROIZE_GPRS(14, 31)
> +#else
> +#define	ZEROIZE_NVGPRS()		ZEROIZE_GPRS(13, 31)
> +#endif
> +#define	ZEROIZE_GPR(n)			ZEROIZE_GPRS(n, n)
> +
>  #define SAVE_GPR(n, base)		SAVE_GPRS(n, n, base)
>  #define REST_GPR(n, base)		REST_GPRS(n, n, base)
> =20
> --=20
> 2.34.1


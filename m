Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D263C3EA2A4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 12:02:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Glj0J4yFRz3cWH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Aug 2021 20:02:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=m7QhLkXo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m7QhLkXo; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GlhzK3gRVz3bY7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 20:01:17 +1000 (AEST)
Received: by mail-pj1-x1032.google.com with SMTP id
 28-20020a17090a031cb0290178dcd8a4d1so7570542pje.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 03:01:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=+qsDiG/u0qNSqiYDob4m8A+UZvUspauBM/mjXqKH/5c=;
 b=m7QhLkXoY2rnV9J9PRrFWxJjqJAe+l9MpA3v6uvasoI3UQtP3htCsK63++BRTqBPv7
 qKlIlEdp9CG68czgxhsdmpEOTjrfUsmocvGroCO8QDuxlx9Pb5NV+7ImfBs3Crj64Wfr
 FPrAgH4zj9mU463gi4+0YtC2SlmulfIVm2oXfIRKLSVZjymnI6k6DyVgVaPBfEMLEc21
 Y5rTtCwMcnazAhDWsk/1VtJhiKmNZTP50K4AnkSHS4Xp0ahUeMde+P9qR88fa959GXwV
 2lXuPMR+YIPHA9xv+WOZxqdE+7S7AUGDrSomKoOYaPX2dfv9UrvY4YGsJULdYVGfr6+e
 IBcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=+qsDiG/u0qNSqiYDob4m8A+UZvUspauBM/mjXqKH/5c=;
 b=nKcGT4+NOoGvJOD8N9/FAAouLV3NNU+Uc1fxatzJEaEqAHI3KoCI/tmosNBn+C0Sgn
 AZl6f6+ApgCzRrwOY2RBTXjEJwLWN3ViqnRZcl0XAxuaiwApzFsd9jFj9Om9jSKtJk1y
 tOlwy/YMr0YqndLZ4P0XtR7FEydJ89NcMb8OW6gitLQLDKEcV4iVVY11GVnj9EPXRN9W
 NhCCDr/kOoHYA+THqAqpZKATNPaDpdo/1ry2rwO1dRE47Zs6dFFmPL5eYBCmu9gELTZM
 NCFXWf/5WQKpSqEjmqf6KL58ktf3V+caD8h+v7aVOItm5IbzJV1x3h7doqTItFKZvlHW
 zX4g==
X-Gm-Message-State: AOAM532XY8gtPHG81xwWrTDXsIuiOU94HBEPd3ToGeDWXnbWiih2hudH
 fPvVnwywj864j0zEcB9ECKU=
X-Google-Smtp-Source: ABdhPJzOkUaqI03B0VQXdonY74JRw1ZY7dHfwTV1vXCDirOP5Pgv0GRN8j6MkHfK3q3Uhzv2JzVedw==
X-Received: by 2002:a65:6459:: with SMTP id s25mr3208005pgv.7.1628762474171;
 Thu, 12 Aug 2021 03:01:14 -0700 (PDT)
Received: from localhost ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id w3sm1781812pfn.96.2021.08.12.03.01.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 03:01:13 -0700 (PDT)
Date: Thu, 12 Aug 2021 20:01:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/interrupt: Do not call single_step_exception()
 from other exceptions
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, fthain@linux-m68k.org, Michael Ellerman
 <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>, userm57@yahoo.com
References: <aed174f5cbc06f2cf95233c071d8aac948e46043.1628611921.git.christophe.leroy@csgroup.eu>
In-Reply-To: <aed174f5cbc06f2cf95233c071d8aac948e46043.1628611921.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1628762462.y419h5w2nx.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of August 11, 2021 2:13 am:
> single_step_exception() is called by emulate_single_step() which
> is called from (at least) alignment exception() handler and
> program_check_exception() handler.
>=20
> Redefine it as a regular __single_step_exception() which is called
> by both single_step_exception() handler and emulate_single_step()
> function.
>=20

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Fixes: 3a96570ffceb ("powerpc: convert interrupt handlers to use wrappers=
")
> Cc: stable@vger.kernel.org
> Cc: Stan Johnson <userm57@yahoo.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Finn Thain <fthain@linux-m68k.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/kernel/traps.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index dfbce527c98e..d56254f05e17 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1104,7 +1104,7 @@ DEFINE_INTERRUPT_HANDLER(RunModeException)
>  	_exception(SIGTRAP, regs, TRAP_UNK, 0);
>  }
> =20
> -DEFINE_INTERRUPT_HANDLER(single_step_exception)
> +static void __single_step_exception(struct pt_regs *regs)
>  {
>  	clear_single_step(regs);
>  	clear_br_trace(regs);
> @@ -1121,6 +1121,11 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
>  	_exception(SIGTRAP, regs, TRAP_TRACE, regs->nip);
>  }
> =20
> +DEFINE_INTERRUPT_HANDLER(single_step_exception)
> +{
> +	__single_step_exception(regs);
> +}
> +
>  /*
>   * After we have successfully emulated an instruction, we have to
>   * check if the instruction was being single-stepped, and if so,
> @@ -1130,7 +1135,7 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
>  static void emulate_single_step(struct pt_regs *regs)
>  {
>  	if (single_stepping(regs))
> -		single_step_exception(regs);
> +		__single_step_exception(regs);
>  }
> =20
>  static inline int __parse_fpscr(unsigned long fpscr)
> --=20
> 2.25.0
>=20
>=20

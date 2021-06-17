Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A263AB282
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 13:26:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5KWB5vX0z3c2H
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 21:26:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=F4KIQ7i4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=F4KIQ7i4; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5KVl3JByz3bVD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 21:25:50 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id x16so4735090pfa.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 04:25:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=BtihkO7CCaTLPgwW0rcMA1QMgMvGSscuXR6fI3BnW8o=;
 b=F4KIQ7i4XRRvpgPQztzr1LqA3qBv/beuqleCgOOaz5eCl9kcl3VWkcZ/u8dMGmAU0q
 CQ7Bmd/t86J+OTlGWm9P4fu39wsXecmswHqNBSjIqzQlXOUOroZXkmr0ohcY9o+sAtlK
 d63vC0sWIAbMjTWBPTLEV+WxnAw9k7Sm4rP6w/DOfrGki1s2A+k7F2weMCyxWUjSkyd1
 4FVUuVMTLkOL62pgkk++i/WIJunDb4LQUf/Fhm+EQyDEqYXX8qSdw6Oi89S1bmxNsM2U
 C74Ol8/2CYO0IVq49btY+vzoDh1Lx3M7JyNq/Zae1/jXfnlET7Vj0pEscCTraGLXrn6u
 cu3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=BtihkO7CCaTLPgwW0rcMA1QMgMvGSscuXR6fI3BnW8o=;
 b=qtko+Nsxi70q4EkWJzA8QiN8PgXdBO3aU78NvZ6qi+lnI0AhFZH308WPXFB14fWmYd
 H4i3QgNylzMQ8yPXfwd7Ehg5TVGZVDKJZ3Arbv2Xqd7wKvLYSQJHXLJLlR7L2WrwAnRA
 xhxfofUvUtNt9q/f3OM56MIIdoRJfMUE0/Ee+rTkG9Z795Lr6QdQKSoXUZc84tA79i3b
 dvHbgf0TrRnvUlwb0GzhxeYsvK2dsvNrvoa17ReDqlJqbSKyGdxb6XKRuPyFBwXXYeTQ
 JXJ1wtkuU86mQutS8Z2KgyT1RR51nypWggUvy/qd1G80eKzskOEEdUyYuwRebh4wfVHP
 OCEg==
X-Gm-Message-State: AOAM5315xNw765UCWHuAL/pDJE7bqBoA3cuHbVvUBccvZi/aMF/uA5nY
 cX4AwfkY+3bV/L1dUBPrpUI=
X-Google-Smtp-Source: ABdhPJzc5zKeYQpcP+dAPsUVBEwyYkcz5l2dKfrt1FcvMGZkAMWl+rU3G+HkeF4kZOCDbB6hfX+kMA==
X-Received: by 2002:aa7:92c6:0:b029:2f1:3fbb:3171 with SMTP id
 k6-20020aa792c60000b02902f13fbb3171mr5059860pfa.0.1623929146339; 
 Thu, 17 Jun 2021 04:25:46 -0700 (PDT)
Received: from localhost (60-242-147-73.tpgi.com.au. [60.242.147.73])
 by smtp.gmail.com with ESMTPSA id g17sm5503175pgh.61.2021.06.17.04.25.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:25:46 -0700 (PDT)
Date: Thu, 17 Jun 2021 21:25:41 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 1/5] powerpc/interrupt: Rename and lightly change
 syscall_exit_prepare_main()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <8071cd2e2f2bdc0711e6ac435dff4a09ff21fee2.1623745949.git.christophe.leroy@csgroup.eu>
In-Reply-To: <8071cd2e2f2bdc0711e6ac435dff4a09ff21fee2.1623745949.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1623929016.jy0026dpmc.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of June 15, 2021 6:33 pm:
> Rename syscall_exit_prepare_main() into interrupt_exit_prepare_main()
>=20
> Make it static as it is not used anywhere else.
>=20
> Pass it the 'ret' so that it can 'or' it directly instead of
> oring twice, once inside the function and once outside.
>=20
> And remove 'r3' parameter which is not used.
>=20
> Also fix a typo where CONFIG_PPC_BOOK3S should be CONFIG_PPC_BOOK3S_64.
>=20
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> This series applies on top of Nic's series speeding up interrupt return o=
n 64s
>=20
>  arch/powerpc/kernel/interrupt.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interr=
upt.c
> index 74c995a42399..ba2d602d2da6 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -243,11 +243,10 @@ static notrace void booke_load_dbcr0(void)
>  #endif
>  }
> =20
> -notrace unsigned long syscall_exit_prepare_main(unsigned long r3,
> -						struct pt_regs *regs)
> +static notrace unsigned long
> +interrupt_exit_user_prepare_main(struct pt_regs *regs, unsigned long ret=
)

Hmm, I tried switching the order of the arguments thinking it would=20
match caller and return registers better but didn't seem to help
generated code. Yet I think I will make that change to your patch if
you don't mind.

Thanks,
Nick

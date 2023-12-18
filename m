Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0669E8169D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 10:25:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rA220P5B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4StvZK4vBbz3cBH
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Dec 2023 20:25:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rA220P5B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=aneesh.kumar@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4StvYX3M8Jz2yk7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Dec 2023 20:25:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8755C60DF9;
	Mon, 18 Dec 2023 09:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8166AC433C8;
	Mon, 18 Dec 2023 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702891501;
	bh=cO07dxNW1PUmAXiXVsm47VunUdfatHSRsSDDVCHJ6wc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=rA220P5BlJTSEX3Psx00JnQIFYvldI3rP2MKQwj21FcBWOwzOLIW6Rv6Vg0pJT6jt
	 b8SoUrqgHea+y4/ntqMhux0XUjNt+1ZS/8HEXaZtJuGXyXSuYp3iAQ1phrJb0pkDXH
	 pU7Z/4Ig7WdUHybk8YRHNlYX5m5o8Od8Xwm76FQHaKzSGrCHKDCnJi3NtRj6KDzB+l
	 gi+nKIj1KDBVS10wDuBD5rBzHdB//2G7UHy79v3n5OvKrnoHNFF84FI267k2wkQbWO
	 mXEdBvJZM/22gvePtaqVkv8XzX065dNGMImdmlTMHD73Kek70k+6x/Py3+7mj3aesj
	 1enb0BCuJctdQ==
X-Mailer: emacs 29.1 (via feedmail 11-beta-1 I)
From: Aneesh Kumar K.V <aneesh.kumar@kernel.org>
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: Re: [PATCH v1 2/2] powerpc/debug: hook to user return notifier
 infrastructure
In-Reply-To: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
References: <B375A36C9C4D73FF+20231218031338.2084-1-luming.yu@shingroup.cn>
Date: Mon, 18 Dec 2023 14:54:53 +0530
Message-ID: <8734vzsw0q.fsf@kernel.org>
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
Cc: shenghui.qu@shingroup.cn, Luming Yu <luming.yu@shingroup.cn>, dawei.li@shingroup.cn, ke.zhao@shingroup.cn, luming.yu@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Luming Yu <luming.yu@shingroup.cn> writes:

> Before we have powerpc to use the generic entry infrastructure,
> the call to fire user return notifier is made temporarily in powerpc
> entry code.
>

It is still not clear what will be registered as user return notifier.
Can you summarize that here?

>
> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>
> ---
>  arch/powerpc/kernel/interrupt.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index c4f6d3c69ba9..7fe704946e96 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -19,6 +19,7 @@
>  #include <asm/time.h>
>  #include <asm/tm.h>
>  #include <asm/unistd.h>
> +#include <asm/entry-common.h>
>  
>  #if defined(CONFIG_PPC_ADV_DEBUG_REGS) && defined(CONFIG_PPC32)
>  unsigned long global_dbcr0[NR_CPUS];
> @@ -245,6 +246,8 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
>  	/* Restore user access locks last */
>  	kuap_user_restore(regs);
>  
> +	arch_exit_to_user_mode_prepare(regs, ti_flags);
> +
>

That will run the notifier with user AMR/IAMR values. 

>  	return ret;
>  }
>  
> -- 
> 2.42.0.windows.2

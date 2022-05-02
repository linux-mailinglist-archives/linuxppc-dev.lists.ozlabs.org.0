Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E1C517023
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 15:19:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsNx060Z5z3bql
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 23:19:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OxypIl0D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsNwL6Bxfz305j
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 May 2022 23:19:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OxypIl0D; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KsNwC0BHxz4xdK;
 Mon,  2 May 2022 23:19:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651497548;
 bh=iEySDLJ6Aqsuxw7jZX+qz0oRACs5k7MznXRI7Is3+DM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OxypIl0DwsP8OIrDUEH4RcIYF9o9ktOM49sVtUdHk0FzRzM99aNOuSHBF/+dgU35P
 ampVokg9nrO7De2kFE1IJPrz1TJLybimd13gXV2VzwXUNHieV6NCqhNoL0C1V7REd+
 OGUG6lguapm84tveOaJGpujYq8ffZ4x0mdQvHhxIaDgt89ejEDaExc9eSCVRv0wWut
 XHGrjf89cMXoj3TN/twUJNl8+m0gfLHmdsH/77o3ZfyCZvp4k+mErhq18OfN9gR9yW
 qAIoNbz9sK8yCCnIzDMTkw5RzBY0CG+CSPjSzVi4jzXQMtCOH5Ymyhp6TonhuX2rnY
 5SWhWve5W6H6A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Randy Dunlap <rdunlap@infradead.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] POWERPC: idle: fix return value of __setup handler
In-Reply-To: <20220313065848.2150-1-rdunlap@infradead.org>
References: <20220313065848.2150-1-rdunlap@infradead.org>
Date: Mon, 02 May 2022 23:19:06 +1000
Message-ID: <87r15c8439.fsf@mpe.ellerman.id.au>
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
Cc: Randy Dunlap <rdunlap@infradead.org>, Paul Mackerras <paulus@samba.org>,
 patches@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Randy Dunlap <rdunlap@infradead.org> writes:
> __setup() handlers should return 1 to obsolete_checksetup() in
> init/main.c to indicate that the boot option has been handled.
> A return of 0 causes the boot option/value to be listed as an Unknown
> kernel parameter and added to init's (limited) argument or environment
> strings. Also, error return codes don't mean anything to
> obsolete_checksetup() -- only non-zero (usually 1) or zero.
> So return 1 from powersave_off().
>
> Fixes: 302eca184fb8 ("[POWERPC] cell: use ppc_md->power_save instead of cbe_idle_loop")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> From: Igor Zhbanov <i.zhbanov@omprussia.ru>

What happened here? Is the patch actually from Igor? If so he should be
the author, and it should include his SoB shouldn't it?

Same comment for "[PATCH] powerpc/4xx: cpm: fix return value of __setup handler".

cheers

> Link: lore.kernel.org/r/64644a2f-4a20-bab3-1e15-3b2cdd0defe3@omprussia.ru
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> ---
>  arch/powerpc/kernel/idle.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- linux-next-20220310.orig/arch/powerpc/kernel/idle.c
> +++ linux-next-20220310/arch/powerpc/kernel/idle.c
> @@ -37,7 +37,7 @@ static int __init powersave_off(char *ar
>  {
>  	ppc_md.power_save = NULL;
>  	cpuidle_disable = IDLE_POWERSAVE_OFF;
> -	return 0;
> +	return 1;
>  }
>  __setup("powersave=off", powersave_off);
>  

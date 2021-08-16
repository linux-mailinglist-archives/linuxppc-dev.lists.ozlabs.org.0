Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA5F3ED056
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 10:32:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gp6q843Mcz3d8S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Aug 2021 18:32:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gp6p34hVCz3029
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 18:31:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gp6nw15cVz9sVG;
 Mon, 16 Aug 2021 10:31:32 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qIU4wgJ1r51a; Mon, 16 Aug 2021 10:31:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gp6nw06Nfz9sV8;
 Mon, 16 Aug 2021 10:31:32 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D82368B78C;
 Mon, 16 Aug 2021 10:31:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id jj1ANunAVcqM; Mon, 16 Aug 2021 10:31:31 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 690FA8B788;
 Mon, 16 Aug 2021 10:31:31 +0200 (CEST)
Subject: Re: [PATCH 1/3] powerpc/64s: Fix build when !PPC_BARRIER_NOSPEC
To: Joel Stanley <joel@jms.id.au>, Paul Mackerras <paulus@samba.org>,
 Michael Neuling <mikey@neuling.org>, Anton Blanchard <anton@ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
References: <20210816082403.2293846-1-joel@jms.id.au>
 <20210816082403.2293846-2-joel@jms.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <71820896-9c74-bc68-79c5-cc6d6d63fb65@csgroup.eu>
Date: Mon, 16 Aug 2021 10:31:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210816082403.2293846-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/08/2021 à 10:24, Joel Stanley a écrit :
> When disabling PPC_BARRIER_NOSPEC the do_barrier_nospec_fixups_range
> definition is still included, as well as a stub in asm/setup.h:
> 
> ../arch/powerpc/lib/feature-fixups.c:502:6: error: redefinition of ‘do_barrier_nospec_fixu>
>    502 | void do_barrier_nospec_fixups_range(bool enable, void *fixup_start, void *fixup_en>
>        |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> In file included from ../arch/powerpc/lib/feature-fixups.c:23:
> ../arch/powerpc/include/asm/setup.h:70:20: note: previous definition of ‘do_barrier_nospec>
>     70 | static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void *>
>        |                    ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> I assume the intent was to put the just do_barrier_nospec_fixups
> behind PPC_BARRIER_NOSPEC and let the compiler drop _range when there
> are no users. (There is a caller in module.c, but this is behind
> PPC_BARRIER_NOSPEC).

The compiler won't drop do_barrier_nospec_fixups_range() because it is not static.

> 
> This makes PPC_BOOK3S_64 match how the PPC_FSL_BOOK3E build works.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>   arch/powerpc/include/asm/setup.h | 2 --
>   1 file changed, 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/setup.h b/arch/powerpc/include/asm/setup.h
> index 6c1a7d217d1a..71012284c044 100644
> --- a/arch/powerpc/include/asm/setup.h
> +++ b/arch/powerpc/include/asm/setup.h
> @@ -66,8 +66,6 @@ extern bool barrier_nospec_enabled;
>   
>   #ifdef CONFIG_PPC_BARRIER_NOSPEC
>   void do_barrier_nospec_fixups_range(bool enable, void *start, void *end);
> -#else
> -static inline void do_barrier_nospec_fixups_range(bool enable, void *start, void *end) { }
>   #endif
>   
>   #ifdef CONFIG_PPC_FSL_BOOK3E
> 

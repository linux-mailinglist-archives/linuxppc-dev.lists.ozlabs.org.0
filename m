Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 436BF948F7C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 14:50:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdY7T1sC7z3d2S
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 22:50:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdY745bGcz3ck2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 22:50:05 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WdY6x2Z41z9sRr;
	Tue,  6 Aug 2024 14:50:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HkUBW5cEupxE; Tue,  6 Aug 2024 14:50:01 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WdY6x1lgbz9sRk;
	Tue,  6 Aug 2024 14:50:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 28F8C8B76C;
	Tue,  6 Aug 2024 14:50:01 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Ha8emGShSbFq; Tue,  6 Aug 2024 14:50:01 +0200 (CEST)
Received: from [192.168.234.84] (unknown [192.168.234.84])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A6C258B763;
	Tue,  6 Aug 2024 14:50:00 +0200 (CEST)
Message-ID: <135289c2-78bc-4a14-ad43-6d45750af293@csgroup.eu>
Date: Tue, 6 Aug 2024 14:50:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next] powerpc: Fix a config comment typo in asm/percpu.h
To: Jinjie Ruan <ruanjinjie@huawei.com>, dennis@kernel.org, tj@kernel.org,
 cl@linux.com, mpe@ellerman.id.au, npiggin@gmail.com, naveen@kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20240806112345.2387969-1-ruanjinjie@huawei.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240806112345.2387969-1-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/08/2024 à 13:23, Jinjie Ruan a écrit :
> [Vous ne recevez pas souvent de courriers de ruanjinjie@huawei.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
> 
> commit 0db880fc865f ("powerpc: Avoid nmi_enter/nmi_exit in real mode
> interrupt.") has a config comment typo, fix it.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   arch/powerpc/include/asm/percpu.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/percpu.h b/arch/powerpc/include/asm/percpu.h
> index 634970ce13c6..c836b16ce30d 100644
> --- a/arch/powerpc/include/asm/percpu.h
> +++ b/arch/powerpc/include/asm/percpu.h
> @@ -23,7 +23,7 @@ DECLARE_STATIC_KEY_FALSE(__percpu_first_chunk_is_paged);
>                  (static_key_enabled(&__percpu_first_chunk_is_paged.key))
>   #else
>   #define percpu_first_chunk_is_paged    false
> -#endif /* CONFIG_PPC64 && CONFIG_SMP */
> +#endif /* CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK && CONFIG_SMP */

The #if/#else/#endif section is small and doesn't nest additional 
#ifdefs so the comment is useless and should be removed completely.

Christophe

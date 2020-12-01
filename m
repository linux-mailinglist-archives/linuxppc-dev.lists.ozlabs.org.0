Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 714DE2CA932
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Dec 2020 18:02:00 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ClpKw08p7zDqRr
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 04:01:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ClpDM3PMxzDqpK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 03:57:07 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4ClpDF6nXGz9v3pB;
 Tue,  1 Dec 2020 17:57:01 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Fw8xU2BzxYW9; Tue,  1 Dec 2020 17:57:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4ClpDF5js3z9v3p8;
 Tue,  1 Dec 2020 17:57:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 981A68B7BD;
 Tue,  1 Dec 2020 17:57:02 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EFRlEYXIR7eW; Tue,  1 Dec 2020 17:57:02 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 672CA8B7B7;
 Tue,  1 Dec 2020 17:56:58 +0100 (CET)
Subject: Re: [PATCH v9 5/6] powerpc/mm/kasan: rename kasan_init_32.c to
 init_32.c
To: Daniel Axtens <dja@axtens.net>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org,
 kasan-dev@googlegroups.com, christophe.leroy@c-s.fr,
 aneesh.kumar@linux.ibm.com, bsingharora@gmail.com
References: <20201201161632.1234753-1-dja@axtens.net>
 <20201201161632.1234753-6-dja@axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <459c6cf1-dd76-5d1f-e7c8-432fcbe5eef9@csgroup.eu>
Date: Tue, 1 Dec 2020 17:56:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201201161632.1234753-6-dja@axtens.net>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/12/2020 à 17:16, Daniel Axtens a écrit :
> kasan is already implied by the directory name, we don't need to
> repeat it.
> 
> Suggested-by: Christophe Leroy <christophe.leroy@c-s.fr>

My new address is <christophe.leroy@csgroup.eu>


> Signed-off-by: Daniel Axtens <dja@axtens.net>
> ---
>   arch/powerpc/mm/kasan/Makefile                       | 2 +-
>   arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} | 0
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename arch/powerpc/mm/kasan/{kasan_init_32.c => init_32.c} (100%)
> 
> diff --git a/arch/powerpc/mm/kasan/Makefile b/arch/powerpc/mm/kasan/Makefile
> index bb1a5408b86b..42fb628a44fd 100644
> --- a/arch/powerpc/mm/kasan/Makefile
> +++ b/arch/powerpc/mm/kasan/Makefile
> @@ -2,6 +2,6 @@
>   
>   KASAN_SANITIZE := n
>   
> -obj-$(CONFIG_PPC32)           += kasan_init_32.o
> +obj-$(CONFIG_PPC32)           += init_32.o
>   obj-$(CONFIG_PPC_8xx)		+= 8xx.o
>   obj-$(CONFIG_PPC_BOOK3S_32)	+= book3s_32.o
> diff --git a/arch/powerpc/mm/kasan/kasan_init_32.c b/arch/powerpc/mm/kasan/init_32.c
> similarity index 100%
> rename from arch/powerpc/mm/kasan/kasan_init_32.c
> rename to arch/powerpc/mm/kasan/init_32.c
> 

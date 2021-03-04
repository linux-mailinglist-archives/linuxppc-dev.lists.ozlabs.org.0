Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FD732D4ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 15:09:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drt5R68Xzz3dB6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 01:08:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drt5565RYz3cZt
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 01:08:38 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Drt4x6GPgz9v4Tn;
 Thu,  4 Mar 2021 15:08:33 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dT301ejb3PY6; Thu,  4 Mar 2021 15:08:33 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Drt4x59X3z9v4Tl;
 Thu,  4 Mar 2021 15:08:33 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B7EE28B80A;
 Thu,  4 Mar 2021 15:08:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LRqkBOW4SWOI; Thu,  4 Mar 2021 15:08:35 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DB758B812;
 Thu,  4 Mar 2021 15:08:35 +0100 (CET)
Subject: Re: [RFC PATCH v1] powerpc: Enable KFENCE for PPC32
To: Marco Elver <elver@google.com>
References: <CAG_fn=WFffkVzqC9b6pyNuweFhFswZfa8RRio2nL9-Wq10nBbw@mail.gmail.com>
 <f806de26-daf9-9317-fdaa-a0f7a32d8fe0@csgroup.eu>
 <CANpmjNPGj4C2rr2FbSD+FC-GnWUvJrtdLyX5TYpJE_Um8CGu1Q@mail.gmail.com>
 <08a96c5d-4ae7-03b4-208f-956226dee6bb@csgroup.eu>
 <CANpmjNPYEmLtQEu5G=zJLUzOBaGoqNKwLyipDCxvytdKDKb7mg@mail.gmail.com>
 <ad61cb3a-2b4a-3754-5761-832a1dd0c34e@csgroup.eu>
 <CANpmjNOnVzei7frKcMzMHxaDXh5NvTA-Wpa29C2YC1GUxyKfhQ@mail.gmail.com>
 <f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu>
 <CANpmjNMn_CUrgeSqBgiKx4+J8a+XcxkaLPWoDMUvUEXk8+-jxg@mail.gmail.com>
 <7270e1cc-bb6b-99ee-0043-08a027b8d83a@csgroup.eu>
 <YEDXJ5JNkgvDFehc@elver.google.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <4b46ecc9-ae47-eee1-843e-e0638a356b51@csgroup.eu>
Date: Thu, 4 Mar 2021 15:08:31 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <YEDXJ5JNkgvDFehc@elver.google.com>
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
Cc: LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>,
 Alexander Potapenko <glider@google.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/03/2021 à 13:48, Marco Elver a écrit :
>  From d118080eb9552073f5dcf1f86198f3d86d5ea850 Mon Sep 17 00:00:00 2001
> From: Marco Elver <elver@google.com>
> Date: Thu, 4 Mar 2021 13:15:51 +0100
> Subject: [PATCH] kfence: fix reports if constant function prefixes exist
> 
> Some architectures prefix all functions with a constant string ('.' on
> ppc64). Add ARCH_FUNC_PREFIX, which may optionally be defined in
> <asm/kfence.h>, so that get_stack_skipnr() can work properly.


It works, thanks.

> 
> Link: https://lkml.kernel.org/r/f036c53d-7e81-763c-47f4-6024c6c5f058@csgroup.eu
> Reported-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Marco Elver <elver@google.com>

Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   mm/kfence/report.c | 18 ++++++++++++------
>   1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/mm/kfence/report.c b/mm/kfence/report.c
> index 519f037720f5..e3f71451ad9e 100644
> --- a/mm/kfence/report.c
> +++ b/mm/kfence/report.c
> @@ -20,6 +20,11 @@
>   
>   #include "kfence.h"
>   
> +/* May be overridden by <asm/kfence.h>. */
> +#ifndef ARCH_FUNC_PREFIX
> +#define ARCH_FUNC_PREFIX ""
> +#endif
> +
>   extern bool no_hash_pointers;
>   
>   /* Helper function to either print to a seq_file or to console. */
> @@ -67,8 +72,9 @@ static int get_stack_skipnr(const unsigned long stack_entries[], int num_entries
>   	for (skipnr = 0; skipnr < num_entries; skipnr++) {
>   		int len = scnprintf(buf, sizeof(buf), "%ps", (void *)stack_entries[skipnr]);
>   
> -		if (str_has_prefix(buf, "kfence_") || str_has_prefix(buf, "__kfence_") ||
> -		    !strncmp(buf, "__slab_free", len)) {
> +		if (str_has_prefix(buf, ARCH_FUNC_PREFIX "kfence_") ||
> +		    str_has_prefix(buf, ARCH_FUNC_PREFIX "__kfence_") ||
> +		    !strncmp(buf, ARCH_FUNC_PREFIX "__slab_free", len)) {
>   			/*
>   			 * In case of tail calls from any of the below
>   			 * to any of the above.
> @@ -77,10 +83,10 @@ static int get_stack_skipnr(const unsigned long stack_entries[], int num_entries
>   		}
>   
>   		/* Also the *_bulk() variants by only checking prefixes. */
> -		if (str_has_prefix(buf, "kfree") ||
> -		    str_has_prefix(buf, "kmem_cache_free") ||
> -		    str_has_prefix(buf, "__kmalloc") ||
> -		    str_has_prefix(buf, "kmem_cache_alloc"))
> +		if (str_has_prefix(buf, ARCH_FUNC_PREFIX "kfree") ||
> +		    str_has_prefix(buf, ARCH_FUNC_PREFIX "kmem_cache_free") ||
> +		    str_has_prefix(buf, ARCH_FUNC_PREFIX "__kmalloc") ||
> +		    str_has_prefix(buf, ARCH_FUNC_PREFIX "kmem_cache_alloc"))
>   			goto found;
>   	}
>   	if (fallback < num_entries)
> 

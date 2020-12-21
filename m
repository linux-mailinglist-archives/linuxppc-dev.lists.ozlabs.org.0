Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41EEB2DF9EF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:31:02 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czt371z4TzDqgS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:30:59 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzsYZ5LxrzDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:08:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CzsYQ353VzB09ZW;
 Mon, 21 Dec 2020 09:08:42 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id MRaJ69p2zASa; Mon, 21 Dec 2020 09:08:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CzsYQ2B9gzB09ZV;
 Mon, 21 Dec 2020 09:08:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C4378B7C5;
 Mon, 21 Dec 2020 09:08:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id lw0bTMRhOAWF; Mon, 21 Dec 2020 09:08:47 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D44148B7BE;
 Mon, 21 Dec 2020 09:08:46 +0100 (CET)
Subject: Re: [PATCH 06/23] powerpc/setup_64: Make some routines static
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20201221074222.403894-1-clg@kaod.org>
 <20201221074222.403894-7-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3f239acc-5579-bc7a-defc-e5b133206d6b@csgroup.eu>
Date: Mon, 21 Dec 2020 09:08:34 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221074222.403894-7-clg@kaod.org>
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



Le 21/12/2020 à 08:42, Cédric Le Goater a écrit :
> Fixes these W=1 errors :

Explain why it can be made static, not just that it does fix a W=1 compile error,
because there are several possible ways to fix such a warning.

Also explain why you need to add asm/asm-prototypes.h

> 
> ../arch/powerpc/kernel/setup_64.c:261:13: error: no previous prototype for ‘record_spr_defaults’ [-Werror=missing-prototypes]
>    261 | void __init record_spr_defaults(void)
>        |             ^~~~~~~~~~~~~~~~~~~
> ../arch/powerpc/kernel/setup_64.c:1011:6: error: no previous prototype for ‘entry_flush_enable’ [-Werror=missing-prototypes]
>   1011 | void entry_flush_enable(bool enable)
>        |      ^~~~~~~~~~~~~~~~~~
> ../arch/powerpc/kernel/setup_64.c:1023:6: error: no previous prototype for ‘uaccess_flush_enable’ [-Werror=missing-prototypes]
>   1023 | void uaccess_flush_enable(bool enable)
>        |      ^~~~~~~~~~~~~~~~~~~~
> 
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/kernel/setup_64.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
> index c28e949cc222..560ed8b975e7 100644
> --- a/arch/powerpc/kernel/setup_64.c
> +++ b/arch/powerpc/kernel/setup_64.c
> @@ -67,6 +67,7 @@
>   #include <asm/kup.h>
>   #include <asm/early_ioremap.h>
>   #include <asm/pgalloc.h>
> +#include <asm/asm-prototypes.h>
>   
>   #include "setup.h"
>   
> @@ -258,7 +259,7 @@ static void cpu_ready_for_interrupts(void)
>   
>   unsigned long spr_default_dscr = 0;
>   
> -void __init record_spr_defaults(void)
> +static void __init record_spr_defaults(void)
>   {
>   	if (early_cpu_has_feature(CPU_FTR_DSCR))
>   		spr_default_dscr = mfspr(SPRN_DSCR);
> @@ -1008,7 +1009,7 @@ void rfi_flush_enable(bool enable)
>   	rfi_flush = enable;
>   }
>   
> -void entry_flush_enable(bool enable)
> +static void entry_flush_enable(bool enable)
>   {
>   	if (enable) {
>   		do_entry_flush_fixups(enabled_flush_types);
> @@ -1020,7 +1021,7 @@ void entry_flush_enable(bool enable)
>   	entry_flush = enable;
>   }
>   
> -void uaccess_flush_enable(bool enable)
> +static void uaccess_flush_enable(bool enable)
>   {
>   	if (enable) {
>   		do_uaccess_flush_fixups(enabled_flush_types);
> 

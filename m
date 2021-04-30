Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E5936F764
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 10:52:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWmMY22bfz2yyx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 18:52:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWmMB6NQBz2xMd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 18:51:49 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4FWmM65lWcz9wpv;
 Fri, 30 Apr 2021 10:51:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kDMDiR5czLYa; Fri, 30 Apr 2021 10:51:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FWmM64dTtz9wkP;
 Fri, 30 Apr 2021 10:51:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E0978B87A;
 Fri, 30 Apr 2021 10:51:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ILHb2NrNnZ0M; Fri, 30 Apr 2021 10:51:46 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B86C08B876;
 Fri, 30 Apr 2021 10:51:45 +0200 (CEST)
Subject: Re: [PATCH 2/3] powerpc: prom_init: switch to early string functions
To: Daniel Walker <danielwa@cisco.com>, linuxppc-dev@lists.ozlabs.org,
 x86@kernel.org, Andrew Morton <akpm@linux-foundation.org>
References: <20210430042217.1198052-1-danielwa@cisco.com>
 <20210430042217.1198052-2-danielwa@cisco.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e5de3724-ea9d-45a5-8f08-98ff325d055f@csgroup.eu>
Date: Fri, 30 Apr 2021 10:51:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210430042217.1198052-2-danielwa@cisco.com>
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/04/2021 à 06:22, Daniel Walker a écrit :
> This converts the prom_init string users to the early string function
> which don't suffer from KASAN or any other debugging enabled.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>   arch/powerpc/kernel/prom_init.c        | 185 ++++++-------------------
>   arch/powerpc/kernel/prom_init_check.sh |   9 +-
>   2 files changed, 51 insertions(+), 143 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/prom_init.c b/arch/powerpc/kernel/prom_init.c
> index ccf77b985c8f..4d4343da1280 100644
> --- a/arch/powerpc/kernel/prom_init.c
> +++ b/arch/powerpc/kernel/prom_init.c
> @@ -225,105 +225,6 @@ static bool  __prombss rtas_has_query_cpu_stopped;
>   #define PHANDLE_VALID(p)	((p) != 0 && (p) != PROM_ERROR)
>   #define IHANDLE_VALID(i)	((i) != 0 && (i) != PROM_ERROR)
>   
> -/* Copied from lib/string.c and lib/kstrtox.c */

Please leave the second part of the comment as you have not removed prom_strtobool()


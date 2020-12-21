Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 970C62DF9EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 09:29:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Czt0z4y10zDqx4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Dec 2020 19:29:07 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CzsXR4QLGzDqQc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Dec 2020 19:07:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CzsXH4LF8zB09ZW;
 Mon, 21 Dec 2020 09:07:43 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9n0EiL5C6e0W; Mon, 21 Dec 2020 09:07:43 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CzsXH2mDfzB09ZV;
 Mon, 21 Dec 2020 09:07:43 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4F3068B7C5;
 Mon, 21 Dec 2020 09:07:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id l4NncypEeQqF; Mon, 21 Dec 2020 09:07:48 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D30578B7BE;
 Mon, 21 Dec 2020 09:07:47 +0100 (CET)
Subject: Re: [PATCH 04/23] powerpc/pseries/ras: Make init_ras_hotplug_IRQ()
 static
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
References: <20201221074222.403894-1-clg@kaod.org>
 <20201221074222.403894-5-clg@kaod.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <85b13516-356c-85bf-d7a2-8f5f7800a3bd@csgroup.eu>
Date: Mon, 21 Dec 2020 09:07:35 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201221074222.403894-5-clg@kaod.org>
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/12/2020 à 08:42, Cédric Le Goater a écrit :
> It fixes this W=1 compile error:

Explain why it can be made static, not just that it does fix a W=1 compile error,
because there are several possible ways to fix such a warning.


> 
> ../arch/powerpc/platforms/pseries/ras.c:125:12: error: no previous prototype for ‘init_ras_hotplug_IRQ’ [-Werror=missing-prototypes]
>    125 | int __init init_ras_hotplug_IRQ(void)
>        |            ^~~~~~~~~~~~~~~~~~~~
> 
> Fixes: c9dccf1d074a ("powerpc/pseries: Enable RAS hotplug events later")
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   arch/powerpc/platforms/pseries/ras.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
> index e27310fc1481..de0a1747cbd1 100644
> --- a/arch/powerpc/platforms/pseries/ras.c
> +++ b/arch/powerpc/platforms/pseries/ras.c
> @@ -122,7 +122,7 @@ static inline u8 rtas_mc_error_sub_type(const struct pseries_mc_errorlog *mlog)
>    * devices or systems (e.g. hugepages) that have not been initialized at the
>    * subsys stage.
>    */
> -int __init init_ras_hotplug_IRQ(void)
> +static int __init init_ras_hotplug_IRQ(void)
>   {
>   	struct device_node *np;
>   
> 

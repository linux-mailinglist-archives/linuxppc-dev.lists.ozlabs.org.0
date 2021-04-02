Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276BD352E5A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 19:32:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FBnDz0vJjz3c7J
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Apr 2021 04:32:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FBnDd2jpKz3btY
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Apr 2021 04:32:16 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FBnDW1HYQz9v3qR;
 Fri,  2 Apr 2021 19:32:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id JHnZja8v_c6i; Fri,  2 Apr 2021 19:32:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FBnDW0PJdz9v3qQ;
 Fri,  2 Apr 2021 19:32:11 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2E6368BB77;
 Fri,  2 Apr 2021 19:32:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id ipqYX6I0tWmG; Fri,  2 Apr 2021 19:32:13 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 32C7A8BB6F;
 Fri,  2 Apr 2021 19:32:12 +0200 (CEST)
Subject: Re: [PATCH 2/8] CMDLINE: drivers: of: ifdef out cmdline section
To: Daniel Walker <danielwa@cisco.com>, Will Deacon <will@kernel.org>,
 ob Herring <robh@kernel.org>,
 Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>,
 Andrew Morton <akpm@linux-foundation.org>, x86@kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>
References: <41021d66db2ab427c14255d2a24bb4517c8b58fd.1617126961.git.danielwa@cisco.com>
 <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6d50809a-eb6b-b8bb-bb8b-88f66c52c0fa@csgroup.eu>
Date: Fri, 2 Apr 2021 19:32:08 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <0c4b839f023f87c451c8aa3c4f7a8d92729c2f02.1617126961.git.danielwa@cisco.com>
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
Cc: devicetree@vger.kernel.org, Ruslan Ruslichenko <rruslich@cisco.com>,
 linux-kernel@vger.kernel.org, xe-linux-external@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/03/2021 à 19:56, Daniel Walker a écrit :
> It looks like there's some seepage of cmdline stuff into
> the generic device tree code. This conflicts with the
> generic cmdline implementation so I remove it in the case
> when that's enabled.
> 
> Cc: xe-linux-external@cisco.com
> Signed-off-by: Ruslan Ruslichenko <rruslich@cisco.com>
> Signed-off-by: Daniel Walker <danielwa@cisco.com>
> ---
>   drivers/of/fdt.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> index dcc1dd96911a..d8805cd9717a 100644
> --- a/drivers/of/fdt.c
> +++ b/drivers/of/fdt.c
> @@ -25,6 +25,7 @@
>   #include <linux/serial_core.h>
>   #include <linux/sysfs.h>
>   #include <linux/random.h>
> +#include <linux/cmdline.h>
>   
>   #include <asm/setup.h>  /* for COMMAND_LINE_SIZE */
>   #include <asm/page.h>
> @@ -1050,6 +1051,18 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>   
>   	/* Retrieve command line */
>   	p = of_get_flat_dt_prop(node, "bootargs", &l);
> +
> +#if defined(CONFIG_GENERIC_CMDLINE) && defined(CONFIG_GENERIC_CMDLINE_OF)
> +	/*
> +	 * The builtin command line will be added here, or it can override
> +	 * with the DT bootargs.
> +	 */
> +	cmdline_add_builtin(data,
> +			    (l > 0 ? p : NULL), /* This is sanity checking */
> +			    COMMAND_LINE_SIZE);
> +#elif defined(CONFIG_GENERIC_CMDLINE)
> +	strlcpy(data, p, COMMAND_LINE_SIZE);
> +#else

Ugly.

Linux codying style recommend to limit the use of #ifdefs to headers as much as possible.

Why do we need so many alternatives ? Allthough they are temporary, can we order the changes in 
another way to reduce that ?

>   	if (p != NULL && l > 0)
>   		strlcpy(data, p, min(l, COMMAND_LINE_SIZE));
>   
> @@ -1070,6 +1083,7 @@ int __init early_init_dt_scan_chosen(unsigned long node, const char *uname,
>   		strlcpy(data, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
>   #endif
>   #endif /* CONFIG_CMDLINE */
> +#endif /* CONFIG_GENERIC_CMDLINE */
>   
>   	pr_debug("Command line is: %s\n", (char *)data);
>   
> 

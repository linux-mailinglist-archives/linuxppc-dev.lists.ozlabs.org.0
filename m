Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF3F34A940
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Mar 2021 15:09:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F6P3K6fWGz3cD4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Mar 2021 01:09:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nefkom.net (client-ip=212.18.0.10; helo=mail-out.m-online.net;
 envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.10])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F6P302tYbz3bPH
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Mar 2021 01:08:44 +1100 (AEDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
 by mail-out.m-online.net (Postfix) with ESMTP id 4F6P2d6PvWz1ryY1;
 Fri, 26 Mar 2021 15:08:25 +0100 (CET)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
 by mail.m-online.net (Postfix) with ESMTP id 4F6P2d4qBqz1qqwS;
 Fri, 26 Mar 2021 15:08:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
 by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new,
 port 10024)
 with ESMTP id onoyYkV_BZHU; Fri, 26 Mar 2021 15:08:24 +0100 (CET)
X-Auth-Info: OEvAU2bUcvvTBFMfvWGLhYIW4WQnHRDFk1cZLlSNZz300DmBDLQfVXreztynDrlR
Received: from igel.home (ppp-46-244-160-134.dynamic.mnet-online.de
 [46.244.160.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mnet-online.de (Postfix) with ESMTPSA;
 Fri, 26 Mar 2021 15:08:24 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
 id 998042C35E3; Fri, 26 Mar 2021 15:08:22 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3 11/17] riscv: Convert to GENERIC_CMDLINE
References: <cover.1616765869.git.christophe.leroy@csgroup.eu>
 <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
X-Yow: I'd like some JUNK FOOD...  and then I want to be ALONE --
Date: Fri, 26 Mar 2021 15:08:22 +0100
In-Reply-To: <46745e07b04139a22b5bd01dc37df97e6981e643.1616765870.git.christophe.leroy@csgroup.eu>
 (Christophe Leroy's message of "Fri, 26 Mar 2021 13:44:58 +0000
 (UTC)")
Message-ID: <87zgyqdn3d.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-arch@vger.kernel.org, robh@kernel.org, microblaze <monstr@monstr.eu>,
 daniel@gimpelevich.san-francisco.ca.us, devicetree@vger.kernel.org,
 linux-sh@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-xtensa@linux-xtensa.org, x86@kernel.org, linux-kernel@vger.kernel.org,
 nios2 <ley.foon.tan@intel.com>, linux-mips@vger.kernel.org,
 openrisc@lists.librecores.org, linux-hexagon@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, will@kernel.org,
 linux-arm-kernel@lists.infradead.org, danielwa@cisco.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mär 26 2021, Christophe Leroy wrote:

> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index f8f15332caa2..e7c91ee478d1 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -20,6 +20,7 @@
>  #include <linux/swiotlb.h>
>  #include <linux/smp.h>
>  #include <linux/efi.h>
> +#include <linux/cmdline.h>
>  
>  #include <asm/cpu_ops.h>
>  #include <asm/early_ioremap.h>
> @@ -228,10 +229,8 @@ static void __init parse_dtb(void)
>  	}
>  
>  	pr_err("No DTB passed to the kernel\n");
> -#ifdef CONFIG_CMDLINE_FORCE
> -	strlcpy(boot_command_line, CONFIG_CMDLINE, COMMAND_LINE_SIZE);
> +	cmdline_build(boot_command_line, NULL, COMMAND_LINE_SIZE);
>  	pr_info("Forcing kernel command line to: %s\n", boot_command_line);

Shouldn't that message become conditional in some way?

Andreas.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."

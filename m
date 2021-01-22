Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B91B52FFC61
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 06:53:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMT2G1S9qzDqgS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 16:53:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMT0Y4wmZzDqBM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Jan 2021 16:51:35 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DMT0K0zXRzB09ZQ;
 Fri, 22 Jan 2021 06:51:29 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id WBL27sZgFqmM; Fri, 22 Jan 2021 06:51:29 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DMT0J6P6BzB09ZP;
 Fri, 22 Jan 2021 06:51:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0652E8B776;
 Fri, 22 Jan 2021 06:51:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WfxlCzxB0EEj; Fri, 22 Jan 2021 06:51:28 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 65F3E8B773;
 Fri, 22 Jan 2021 06:51:26 +0100 (CET)
Subject: Re: [PATCH] powerpc/8xx: export 'cpm_setbrg' for modules
To: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
References: <20210122010819.30986-1-rdunlap@infradead.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <91159e78-4eea-c645-9171-a5b90271710f@csgroup.eu>
Date: Fri, 22 Jan 2021 06:51:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210122010819.30986-1-rdunlap@infradead.org>
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 kernel test robot <lkp@intel.com>, Nick Desaulniers <ndesaulniers@google.com>,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 22/01/2021 à 02:08, Randy Dunlap a écrit :
> Fix missing export for a loadable module build:
> 
> ERROR: modpost: "cpm_setbrg" [drivers/tty/serial/cpm_uart/cpm_uart.ko] undefined!
> 
> Fixes: 4128a89ac80d ("powerpc/8xx: move CPM1 related files from sysdev/ to platforms/8xx")

I don't understand. Before that commit cpm_setbrg() wasn't exported either.

For me, it fixes the commit that brought the capability to build the cpm uart driver as a module, 
that is commit 1da177e4c3f4 ("Linux-2.6.12-rc")

> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
> Cc: clang-built-linux@googlegroups.com
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: linuxppc-dev@lists.ozlabs.org
> ---
>   arch/powerpc/platforms/8xx/cpm1.c |    1 +
>   1 file changed, 1 insertion(+)
> 
> --- linux-next-20210121.orig/arch/powerpc/platforms/8xx/cpm1.c
> +++ linux-next-20210121/arch/powerpc/platforms/8xx/cpm1.c
> @@ -280,6 +280,7 @@ cpm_setbrg(uint brg, uint rate)
>   		out_be32(bp, (((BRG_UART_CLK_DIV16 / rate) - 1) << 1) |
>   			      CPM_BRG_EN | CPM_BRG_DIV16);
>   }
> +EXPORT_SYMBOL(cpm_setbrg);
>   
>   struct cpm_ioport16 {
>   	__be16 dir, par, odr_sor, dat, intr;
> 

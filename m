Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AE2197641
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 10:16:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rQJl3BsXzDqNB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:16:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=XdsiQyIi; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rQFs53BTzDqCK
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 19:13:37 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48rQFg1Hgqz9v19V;
 Mon, 30 Mar 2020 10:13:27 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=XdsiQyIi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id p_nXki-C38ot; Mon, 30 Mar 2020 10:13:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48rQFg0Ck5z9v19T;
 Mon, 30 Mar 2020 10:13:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585556007; bh=ScR/8+5XedHTIqudMXkvKJn5Yx9Zq+WzVh5/TkoMC+M=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=XdsiQyIihNFVXKmWF/UZB1op1iAhgtYxHur5jVb5F+8o5GWiwhgkSAUMg0cngUyAD
 wZZtgwZa0SJATNDjn+FojX83P6MdConQm1IGtgBGWGLekk9MPWgm1aBXMhbHxCml9B
 myQVdMa4J9uCH1COatwqdM4REDZERiKlYCRZaUgA=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 886118B752;
 Mon, 30 Mar 2020 10:13:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id NsxflLTqgaoe; Mon, 30 Mar 2020 10:13:31 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C95A08B783;
 Mon, 30 Mar 2020 10:13:30 +0200 (CEST)
Subject: Re: [PATCH v3] powerpc xmon: use `dcbf` inplace of `dcbi` instruction
 for 64bit Book3S
To: Balamuruhan S <bala24@linux.ibm.com>, mpe@ellerman.id.au
References: <20200330075954.538773-1-bala24@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <e63f665d-80e0-f4c3-dbb2-849f43381c20@c-s.fr>
Date: Mon, 30 Mar 2020 10:13:31 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200330075954.538773-1-bala24@linux.ibm.com>
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
Cc: ravi.bangoria@linux.ibm.com, jniethe5@gmail.com, paulus@samba.org,
 sandipan@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/03/2020 à 09:59, Balamuruhan S a écrit :
> Data Cache Block Invalidate (dcbi) instruction implemented back in
> PowerPC architecture version 2.03. But as per Power Processor Users Manual
> it is obsolete and not supported by POWER8/POWER9 core. Attempt to use of
> this illegal instruction results in a hypervisor emulation assistance
> interrupt. So, ifdef it out the option `i` in xmon for 64bit Book3S.
> 
> 0:mon> fi
> cpu 0x0: Vector: 700 (Program Check) at [c000000003be74a0]
>      pc: c000000000102030: cacheflush+0x180/0x1a0
>      lr: c000000000101f3c: cacheflush+0x8c/0x1a0
>      sp: c000000003be7730
>     msr: 8000000000081033
>    current = 0xc0000000035e5c00
>    paca    = 0xc000000001910000   irqmask: 0x03   irq_happened: 0x01
>      pid   = 1025, comm = bash
> Linux version 5.6.0-rc5-g5aa19adac (root@ltc-wspoon6) (gcc version 7.4.0
> (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #1 SMP Tue Mar 10 04:38:41 CDT 2020
> cpu 0x0: Exception 700 (Program Check) in xmon, returning to main loop
> [c000000003be7c50] c00000000084abb0 __handle_sysrq+0xf0/0x2a0
> [c000000003be7d00] c00000000084b3c0 write_sysrq_trigger+0xb0/0xe0
> [c000000003be7d30] c0000000004d1edc proc_reg_write+0x8c/0x130
> [c000000003be7d60] c00000000040dc7c __vfs_write+0x3c/0x70
> [c000000003be7d80] c000000000410e70 vfs_write+0xd0/0x210
> [c000000003be7dd0] c00000000041126c ksys_write+0xdc/0x130
> [c000000003be7e20] c00000000000b9d0 system_call+0x5c/0x68
> --- Exception: c01 (System Call) at 00007fffa345e420
> SP (7ffff0b08ab0) is in userspace
> 
> Signed-off-by: Balamuruhan S <bala24@linux.ibm.com>

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/xmon/xmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> ---
> changes in v3:
> -------------
> Fix Christophe's review comments and rebase it on latest mpe's merge
> tree,
> 	* mention the dcbi obsolete statement based on Power processor
> 	  users manual in commit message.
> 	* make #ifdef in a more simple way.
> changes in v2:
> -------------
> Fix review comments from Segher and Michael,
>          * change incorrect architecture version 2.01 to 2.03 in commit
>            message.
>          * ifdef it out the option `i` for PPC_BOOK3S_64 instead to drop
> 	  it and change the commit message accordingly.
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index ea303b7e4e29..7b62d5dcc4a1 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -1808,7 +1808,7 @@ static void cacheflush(void)
>   		catch_memory_errors = 1;
>   		sync();
>   
> -		if (cmd != 'i') {
> +		if (cmd != 'i' || IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
>   			for (; nflush > 0; --nflush, adrs += L1_CACHE_BYTES)
>   				cflush((void *) adrs);
>   		} else {
> 
> base-commit: 1ad3b5ebe084246ad593a22707cd91ef6418c31e
> 

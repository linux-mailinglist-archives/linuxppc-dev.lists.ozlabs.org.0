Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA2134D9775
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 10:18:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHnrN5nYsz3bTw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 20:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHnqz20Npz2yn9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 20:17:48 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KHnqp35RQz9sSj;
 Tue, 15 Mar 2022 10:17:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P8dfPOyh5Gos; Tue, 15 Mar 2022 10:17:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KHnqn2LFkz9sSp;
 Tue, 15 Mar 2022 10:17:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CDBB8B770;
 Tue, 15 Mar 2022 10:17:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id O-TSzOUhyEx1; Tue, 15 Mar 2022 10:17:41 +0100 (CET)
Received: from [192.168.202.50] (unknown [192.168.202.50])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id AC9488B763;
 Tue, 15 Mar 2022 10:17:40 +0100 (CET)
Message-ID: <bfdaba1e-333e-669b-e5c0-8a3e891ade35@csgroup.eu>
Date: Tue, 15 Mar 2022 10:17:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH] powerpc/xive: Fix unsigned comparison with less than zero
Content-Language: fr-FR
To: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, mpe@ellerman.id.au,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
References: <1620382851-67480-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1620382851-67480-1-git-send-email-jiapeng.chong@linux.alibaba.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, paulus@samba.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/05/2021 à 12:20, Jiapeng Chong a écrit :
> The return from the call to irq_domain_alloc_irqs() is int, it can be
> a negative error code, however this is being assigned to an unsigned
> int variable 'irq', this may lead to invalid if statement detection,
> so that kfree execution is invalid. So making 'irq' an int.
> 
> Clean up the following coccicheck warning:
> 
> ./arch/powerpc/sysdev/xive/common.c:1157:6-14: WARNING: Unsigned
> expression compared with zero: xid -> irq < 0.
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>

This was fixed by 
https://github.com/linuxppc/linux/commit/3f601608b71c3ca1e199898cd16f09d707fedb56

> ---
>   arch/powerpc/sysdev/xive/common.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/sysdev/xive/common.c b/arch/powerpc/sysdev/xive/common.c
> index a830432..a5fd45a 100644
> --- a/arch/powerpc/sysdev/xive/common.c
> +++ b/arch/powerpc/sysdev/xive/common.c
> @@ -65,7 +65,7 @@
>   #ifdef CONFIG_SMP
>   /* The IPIs use the same logical irq number when on the same chip */
>   static struct xive_ipi_desc {
> -	unsigned int irq;
> +	int irq;
>   	char name[16];
>   } *xive_ipis;
>   

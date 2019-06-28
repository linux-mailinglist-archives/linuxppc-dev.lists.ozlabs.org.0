Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A83D596AF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 11:01:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZrNb16p5zDqnZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 19:01:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="hCseVWrz"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ZrLh0XY4zDq5t
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 18:59:55 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45ZrLb32q7z9v1dq;
 Fri, 28 Jun 2019 10:59:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hCseVWrz; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id wg0kRk6LpBEP; Fri, 28 Jun 2019 10:59:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45ZrLb0JB7z9v1dW;
 Fri, 28 Jun 2019 10:59:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1561712391; bh=3PExFE1N6IiyQSDeWR2v89tJ9QeiWcAN1N4Hjay3PlI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hCseVWrzRRQQXlskmPHp+o3zZeA9GBRK4q98IdoDLwuXYMJZ0gqNOJzJu4lD6Mxqb
 cA/OiFk6yj7OXXXZDbS9ktAYJzXSFIfIfzeuxOXNEijxaOSJN+wsUKbnOH/ZnZ0Lmi
 Pgc6B8sCSvQ3DAwq+DJQJ9XYrlUTJvBjOpWEWRUQ=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 256308B966;
 Fri, 28 Jun 2019 10:59:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id mul6Zychpueb; Fri, 28 Jun 2019 10:59:52 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E11848B961;
 Fri, 28 Jun 2019 10:59:51 +0200 (CEST)
Subject: Re: [PATCH v2 27/27] sound: ppc: remove unneeded memset after
 dma_alloc_coherent
To: Fuqian Huang <huangfq.daxian@gmail.com>
References: <20190628025055.16242-1-huangfq.daxian@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Followup-To: Takashi Iwai <tiwai@suse.com>
Message-ID: <83108dee-72f7-e56f-95f6-26162c9a0ccc@c-s.fr>
Date: Fri, 28 Jun 2019 10:59:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190628025055.16242-1-huangfq.daxian@gmail.com>
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
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jaroslav Kysela <perex@perex.cz>, Richard Fontana <rfontana@redhat.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/06/2019 à 04:50, Fuqian Huang a écrit :
> In commit af7ddd8a627c
> ("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma-mapping"),
> dma_alloc_coherent has already zeroed the memory.
> So memset is not needed.

You are refering to a merge commit, is that correct ?

I can't see anything related in that commit, can you please pinpoint it ?

As far as I can see, on powerpc the memory has always been zeroized 
(since 2005 at least).

Christophe

> 
> Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
> ---
>   sound/ppc/pmac.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
> index 1b11e53f6a62..1ab12f4f8631 100644
> --- a/sound/ppc/pmac.c
> +++ b/sound/ppc/pmac.c
> @@ -56,7 +56,6 @@ static int snd_pmac_dbdma_alloc(struct snd_pmac *chip, struct pmac_dbdma *rec, i
>   	if (rec->space == NULL)
>   		return -ENOMEM;
>   	rec->size = size;
> -	memset(rec->space, 0, rsize);
>   	rec->cmds = (void __iomem *)DBDMA_ALIGN(rec->space);
>   	rec->addr = rec->dma_base + (unsigned long)((char *)rec->cmds - (char *)rec->space);
>   
> 

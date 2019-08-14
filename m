Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A79E8D5EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Aug 2019 16:28:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 467sQV139hzDqkd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 00:28:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tw9y0mDZ"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 467sGQ1kw6zDqXR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Aug 2019 00:21:49 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 467sGH235Bz9v0cP;
 Wed, 14 Aug 2019 16:21:43 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tw9y0mDZ; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ihWuT0UDAHpD; Wed, 14 Aug 2019 16:21:43 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 467sGH0zzDz9v0cN;
 Wed, 14 Aug 2019 16:21:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565792503; bh=WbfBX1iNlYYIE151XGSpJjY4OxfwXsdR+UkX1qdNpbQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=tw9y0mDZbaE5/e0Zdt6u9X/nGttQLRJ+l1EguSYqUjxHiaQ48pOTME7NT1lPZPaHm
 ASKLCWVPbADRh78PfFsjwR0hlpSeqXTfGVuzdMNeo061xCtutH+x2+OnRzxFnYVbJm
 1FZ6ZvZlnQi/T54/VCgwJJyT5JSMo6nqDa2S6Hlg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C32E18B7F9;
 Wed, 14 Aug 2019 16:21:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fXoh92ifn8SY; Wed, 14 Aug 2019 16:21:44 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 94EC68B761;
 Wed, 14 Aug 2019 16:21:44 +0200 (CEST)
Subject: Re: [PATCH] powerpc: use the generic dma coherent remap allocator
To: Christoph Hellwig <hch@lst.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20190814132230.31874-1-hch@lst.de>
 <20190814132230.31874-2-hch@lst.de>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <fd5df886-bd2e-8023-47aa-16d41973a8d3@c-s.fr>
Date: Wed, 14 Aug 2019 16:21:42 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190814132230.31874-2-hch@lst.de>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/08/2019 à 15:22, Christoph Hellwig a écrit :
> This switches to using common code for the DMA allocations, including
> potential use of the CMA allocator if configured.
> 
> Switching to the generic code enables DMA allocations from atomic
> context, which is required by the DMA API documentation, and also
> adds various other minor features drivers start relying upon.  It
> also makes sure we have on tested code base for all architectures
> that require uncached pte bits for coherent DMA allocations.
> 
> Another advantage is that consistent memory allocations now share
> the general vmalloc pool instead of needing an explicit careout
> from it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Tested-by: Christophe Leroy <christophe.leroy@c-s.fr> # tested on 8xx

> ---
>   arch/powerpc/Kconfig                         |  12 -
>   arch/powerpc/include/asm/book3s/32/pgtable.h |  12 +-
>   arch/powerpc/include/asm/nohash/32/pgtable.h |  12 +-
>   arch/powerpc/mm/dma-noncoherent.c            | 318 +------------------
>   arch/powerpc/mm/mem.c                        |   4 -
>   arch/powerpc/mm/ptdump/ptdump.c              |   9 -
>   arch/powerpc/platforms/Kconfig.cputype       |   2 +
>   7 files changed, 17 insertions(+), 352 deletions(-)
> 

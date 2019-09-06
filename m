Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD89AB659
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 12:48:59 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PvS44w7KzDqFD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 20:48:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="HOLjeNNY"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PvPf5rSlzDr7f
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 20:46:44 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46PvPV4nyTz9tyhC;
 Fri,  6 Sep 2019 12:46:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HOLjeNNY; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Wf0-uFD43N5c; Fri,  6 Sep 2019 12:46:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46PvPV3Yfvz9tyhB;
 Fri,  6 Sep 2019 12:46:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567766798; bh=qyPkleIJlsEDrkUzrIUe3XctQSX6LfsWh1v0PjaeKHQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HOLjeNNYzF7vef6tkbgsfvXHQ5CJCk8XiTs9zng0yGLU0hk3ETaxSUhfYxGpN9nbk
 HnTZv5roVEHOX/7w9loQmePH/vR1TgYTrwT56Ia/TORqgbZiquirl1k+/JGe6uy1tg
 toaUy6lCi/HTJCdhs58l+PaxEUmSzPAGJe4RYUp4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C5ED78B92A;
 Fri,  6 Sep 2019 12:46:39 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id wFvB4KQjGpor; Fri,  6 Sep 2019 12:46:39 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 279168B7DD;
 Fri,  6 Sep 2019 12:46:38 +0200 (CEST)
Subject: Re: [PATCH 1/2] powerpc/memcpy: Fix stack corruption for smaller sizes
To: Santosh Sivaraj <santosh@fossix.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20190903214359.23887-1-santosh@fossix.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <29543010-d2d2-2951-0bba-123441a500d5@c-s.fr>
Date: Fri, 6 Sep 2019 12:46:38 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190903214359.23887-1-santosh@fossix.org>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

The subjet is misleading. This isn't powerpc but only powerpc/64, and 
this is not memcpy() but memcpy_mcsafe()

Christophe

Le 03/09/2019 à 23:43, Santosh Sivaraj a écrit :
> For sizes lesser than 128 bytes, the code branches out early without saving
> the stack frame, which when restored later drops frame of the caller.
> 
> Tested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>   arch/powerpc/lib/memcpy_mcsafe_64.S | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/lib/memcpy_mcsafe_64.S b/arch/powerpc/lib/memcpy_mcsafe_64.S
> index 949976dc115d..cb882d9a6d8a 100644
> --- a/arch/powerpc/lib/memcpy_mcsafe_64.S
> +++ b/arch/powerpc/lib/memcpy_mcsafe_64.S
> @@ -84,7 +84,6 @@ err1;	stw	r0,0(r3)
>   
>   3:	sub	r5,r5,r6
>   	cmpldi	r5,128
> -	blt	5f
>   
>   	mflr	r0
>   	stdu	r1,-STACKFRAMESIZE(r1)
> @@ -99,6 +98,7 @@ err1;	stw	r0,0(r3)
>   	std	r22,STK_REG(R22)(r1)
>   	std	r0,STACKFRAMESIZE+16(r1)
>   
> +	blt	5f
>   	srdi	r6,r5,7
>   	mtctr	r6
>   
> 

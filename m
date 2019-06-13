Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 436E3435CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 14:18:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45PjSm4yxkzDrBG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jun 2019 22:18:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QTzoN144"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45PjQQ3LbBzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2019 22:16:27 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45PjQD1pWQz9tyy4;
 Thu, 13 Jun 2019 14:16:20 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QTzoN144; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 0z-cPEaDw6DI; Thu, 13 Jun 2019 14:16:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45PjQD0l9qz9tyy2;
 Thu, 13 Jun 2019 14:16:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560428180; bh=YHJw7/LT6s6Mbx+WwJg4XLbpCZLDT4xzeDMMq2n+Rg4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QTzoN144cYWA0+1oy0tEOLLpGgiHUzLs1Pw44RgVC91F4I+hXIZQiAyHreTRPnoxm
 KB0OQgeAAqSPbj8RS2x3wQCZLGMRplON74fI0kIAyTloPfE4/AGbfUn/yk7EAT+z/O
 h0RiddMBPDaZgPAy2IYf2vvyjh7ag9XLFAe1UxFs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C8CB8B8E1;
 Thu, 13 Jun 2019 14:16:21 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Y2kSGnZNBf7d; Thu, 13 Jun 2019 14:16:21 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A5D718B8B9;
 Thu, 13 Jun 2019 14:16:20 +0200 (CEST)
Subject: Re: [PATCH v2 1/4] crypto: talitos - move struct talitos_edesc into
 talitos.h
To: Horia Geanta <horia.geanta@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
References: <cover.1560263641.git.christophe.leroy@c-s.fr>
 <d9b5fade242f0806a587392d31c272709949479f.1560263641.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB3485C0F4CB13F8674B8B5A5598EF0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <7fb54918-4524-1e6b-dd29-46be8843577b@c-s.fr>
Date: Thu, 13 Jun 2019 14:16:20 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR0402MB3485C0F4CB13F8674B8B5A5598EF0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/06/2019 à 14:13, Horia Geanta a écrit :
> On 6/11/2019 5:39 PM, Christophe Leroy wrote:
>> Next patch will require struct talitos_edesc to be defined
>> earlier in talitos.c
>>
>> This patch moves it into talitos.h so that it can be used
>> from any place in talitos.c
>>
>> Fixes: 37b5e8897eb5 ("crypto: talitos - chain in buffered data for ahash on SEC1")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Again, this patch does not qualify as a fix.
> 

But as I said, the following one is a fix and require that one, you told 
me to add stable in Cc: to make it explicit it was to go into stable.
If someone tries to merge following one into stable with taking that one 
first, build will fail.

Christophe

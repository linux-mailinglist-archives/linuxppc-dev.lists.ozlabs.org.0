Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 233503CBEF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 14:40:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NV3C4VYzzDqSG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 22:40:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="EQD49fo6"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NV0s3hydzDqP0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 22:38:36 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45NV0k0lbbz9tyZn;
 Tue, 11 Jun 2019 14:38:30 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=EQD49fo6; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Yzt-cnmLSSyP; Tue, 11 Jun 2019 14:38:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45NV0j6pNYz9tyZm;
 Tue, 11 Jun 2019 14:38:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560256709; bh=BnL8IVV6Yq5wD86SmLNonMbSs9KBZFPcrKoyJr9Obpc=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=EQD49fo6h3lsSLZ+DpNf78l9VkYz9BqyS7T1QaZeYw+UyeXMdN/OdnioDPd0u5rYZ
 ISWcfxnLQcWGXzctazyhvDWI83vS0QWhi1Vu6ENZ0bgGoxsfPVtlztPurXB4QyTKIP
 bPBnxDpXhq+SYJrXJ7sD35c67OeQdkkbbrI5hE0M=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 487508B7F3;
 Tue, 11 Jun 2019 14:38:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id m055cEBEDQ_Y; Tue, 11 Jun 2019 14:38:31 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7F30E8B7F1;
 Tue, 11 Jun 2019 14:38:30 +0200 (CEST)
Subject: Re: [PATCH v1 2/5] crypto: talitos - move struct talitos_edesc into
 talitos.h
To: Horia Geanta <horia.geanta@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
References: <cover.1559819372.git.christophe.leroy@c-s.fr>
 <108a23c4d2f0803b1302bc00c7321d799e42edc1.1559819372.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB3485848D81EF07419EB0128F98ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a3474daf-3e51-4ce9-0634-8690c2e3045d@c-s.fr>
Date: Tue, 11 Jun 2019 14:38:30 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR0402MB3485848D81EF07419EB0128F98ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
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



Le 11/06/2019 à 13:57, Horia Geanta a écrit :
> On 6/6/2019 2:31 PM, Christophe Leroy wrote:
>> Next patch will require struct talitos_edesc to be defined
>> earlier in talitos.c
>>
>> This patch moves it into talitos.h so that it can be used
>> from any place in talitos.c
>>
>> Fixes: 37b5e8897eb5 ("crypto: talitos - chain in buffered data for ahash on SEC1")
> This isn't really a fix, so please drop the tag.

As the next patch requires this one and Fixes 37b5e8897eb5, by setting 
Fixes: 37b5e8897eb5 here was for me a way to tell stable that this one 
is required for the following one.

Otherwise, how can I ensure that this one will be taken when next one is 
taken ?

Christophe


> 
> Thanks,
> Horia
> 

Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA41E1FA3B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 20:51:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4543YC4ly4zDqYX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 04:51:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="HaT1YcGr"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4543Wn0YyhzDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 04:49:54 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4543Wc4Kftz9vBmK;
 Wed, 15 May 2019 20:49:48 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=HaT1YcGr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id XQfzn5YHrpCM; Wed, 15 May 2019 20:49:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4543Wc3BsCz9vBmJ;
 Wed, 15 May 2019 20:49:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557946188; bh=wBrpo1MoExfTHDTOuQ8khRkI2TENEgtLi5T2igaQbeQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HaT1YcGrmwozmMTALTyVjfG7UY2ZwxBgHEhiznnF1Rkkcv99Yvl13jdwMLRBwHQr7
 /N70qxjjLAiibtIyWXco+5MBOfXNOMQUW9pB1e50lbHz2G0TJstQdW0H1X/PqSmhRe
 8T4ZXBEcxNUX6Wy5Mb9RUMSxLVho5RdXsZGxfNYk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 75A228B914;
 Wed, 15 May 2019 20:49:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id RaVwrqDXustf; Wed, 15 May 2019 20:49:48 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 120318B918;
 Wed, 15 May 2019 20:49:48 +0200 (CEST)
Subject: Re: [PATCH] crypto: talitos - fix skcipher failure due to wrong
 output IV
To: Horia Geanta <horia.geanta@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
References: <a5b0d31d8fc9fc9bc2b69baa5330466090825a39.1557923113.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB34858D80A15D4B55F64570E398090@VI1PR0402MB3485.eurprd04.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <29db3f20-f931-efc6-02a8-fe160ab8b484@c-s.fr>
Date: Wed, 15 May 2019 20:49:48 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <VI1PR0402MB34858D80A15D4B55F64570E398090@VI1PR0402MB3485.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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



Le 15/05/2019 à 16:05, Horia Geanta a écrit :
> On 5/15/2019 3:29 PM, Christophe Leroy wrote:
>> Selftests report the following:
>>
>> [    2.984845] alg: skcipher: cbc-aes-talitos encryption test failed (wrong output IV) on test vector 0, cfg="in-place"
>> [    2.995377] 00000000: 3d af ba 42 9d 9e b4 30 b4 22 da 80 2c 9f ac 41
>> [    3.032673] alg: skcipher: cbc-des-talitos encryption test failed (wrong output IV) on test vector 0, cfg="in-place"
>> [    3.043185] 00000000: fe dc ba 98 76 54 32 10
>> [    3.063238] alg: skcipher: cbc-3des-talitos encryption test failed (wrong output IV) on test vector 0, cfg="in-place"
>> [    3.073818] 00000000: 7d 33 88 93 0f 93 b2 42
>>
>> This above dumps show that the actual output IV is indeed the input IV.
>> This is due to the IV not being copied back into the request.
>>
>> This patch fixes that.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Horia Geantă <horia.geanta@nxp.com>

It's missing a Fixes: tag and a Cc: to stable.

I'll resend tomorrow.

> 
> While here, could you please check ecb mode (which by definition does not have
> an IV) is behaving correctly?
> Looking in driver_algs[] list of crypto algorithms supported by talitos,
> ecb(aes,des,3des) are declared with ivsize != 0.

According to /proc/crypto, test are passed for ecb.

Christophe

> 
> Thanks,
> Horia
> 

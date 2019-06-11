Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD05E3D2BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 18:43:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NbRB2qvbzDqqW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 02:43:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="hAiF2huG"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NZ2S15wlzDqfH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 01:40:14 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 45NZ2K025Mz9v0CC;
 Tue, 11 Jun 2019 17:40:09 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=hAiF2huG; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id neQk5hWg6UDv; Tue, 11 Jun 2019 17:40:08 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 45NZ2J61y8z9v0CB;
 Tue, 11 Jun 2019 17:40:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1560267608; bh=nacfqdIc+gMnmYv/4j/Y6ajtQLWCe6LbE+j1wnUxsF8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=hAiF2huGd8nVnjWRuL4lLXCHBMUh/wFQ8bRhZ2DA8B5E3uomVGcNYyUdcI3ukZaK6
 JiiSDwBX99CTy0N8KHlaswTlJMAPN+zYveHMsAj2Kta3WT3Ggr/dRA30T5VmEgV6LB
 EvA67HFc3ggCyZycwf+rRWwj0+nXdR8iWMTTIGwk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 53CB58B7F8;
 Tue, 11 Jun 2019 17:40:10 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sd1TWQufMMeN; Tue, 11 Jun 2019 17:40:10 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8EB858B75B;
 Tue, 11 Jun 2019 17:40:09 +0200 (CEST)
Subject: Re: [PATCH v2 0/4] Additional fixes on Talitos driver
To: Horia Geanta <horia.geanta@nxp.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>
References: <cover.1560263641.git.christophe.leroy@c-s.fr>
 <VI1PR0402MB34853CAF031426F4183FE29B98ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <0cb7c534-6e48-5284-899c-c0ef85c3c126@c-s.fr>
Date: Tue, 11 Jun 2019 17:40:09 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <VI1PR0402MB34853CAF031426F4183FE29B98ED0@VI1PR0402MB3485.eurprd04.prod.outlook.com>
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



Le 11/06/2019 à 17:37, Horia Geanta a écrit :
> On 6/11/2019 5:39 PM, Christophe Leroy wrote:
>> This series is the last set of fixes for the Talitos driver.
>>
>> We now get a fully clean boot on both SEC1 (SEC1.2 on mpc885) and
>> SEC2 (SEC2.2 on mpc8321E) with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS:
>>
> I am getting below failures on a sec 3.3.2 (p1020rdb) for hmac(sha384) and
> hmac(sha512):

Is that new with this series or did you already have it before ?

What do you mean by "fuzz testing" enabled ? Is that 
CONFIG_CRYPTO_MANAGER_EXTRA_TESTS or something else ?

Christophe

> 
> alg: ahash: hmac-sha384-talitos test failed (wrong result) on test vector "random: psize=2497 ksize=124", cfg="random: inplace use_finup nosimd src_divs=[<reimport>76.49%@+4002, <reimport>23.51%@alignmask+26] iv_offset=4"
> alg: ahash: hmac-sha512-talitos test failed (wrong result) on test vector "random: psize=27 ksize=121", cfg="random: inplace may_sleep use_digest src_divs=[100.0%@+10] iv_offset=9"
> 
> Reproducibility rate is 100% so far, here are a few more runs - they might help finding a pattern:
> 
> 1.
> alg: ahash: hmac-sha384-talitos test failed (wrong result) on test vector "random: psize=184 ksize=121", cfg="random: use_finup src_divs=[<reimport,nosimd>100.0%@+3988] dst_divs=[100.0%@+547] iv_offset=44"
> alg: ahash: hmac-sha512-talitos test failed (wrong result) on test vector "random: psize=7 ksize=122", cfg="random: may_sleep use_digest src_divs=[100.0%@+3968] dst_divs=[100.0%@+20]"
> 
> 2.
> alg: ahash: hmac-sha384-talitos test failed (wrong result) on test vector "random: psize=6481 ksize=120", cfg="random: use_final src_divs=[<reimport>100.0%@+6] dst_divs=[43.84%@alignmask+6, 56.16%@+22]"
> alg: ahash: hmac-sha512-talitos test failed (wrong result) on test vector "random: psize=635 ksize=128", cfg="random: may_sleep use_finup src_divs=[100.0%@+4062] dst_divs=[20.47%@+2509, 72.36%@alignmask+2, 7.17%@alignmask+3990]"
> 
> 3.
> alg: ahash: hmac-sha384-talitos test failed (wrong result) on test vector "random: psize=2428 ksize=127", cfg="random: may_sleep use_finup src_divs=[<reimport>35.19%@+18, 64.81%@+1755] dst_divs=[100.0%@+111] iv_offset=5"
> alg: ahash: hmac-sha512-talitos test failed (wrong result) on test vector "random: psize=4345 ksize=128", cfg="random: may_sleep use_digest src_divs=[100.0%@+2820] iv_offset=59"
> 
> If you run several times with fuzz testing enabled on your sec2.2,
> are you able to see similar failures?
> 
> Thanks,
> Horia
> 

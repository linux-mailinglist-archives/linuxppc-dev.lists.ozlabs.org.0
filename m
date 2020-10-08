Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F165828720C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 11:56:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C6RRM2n8QzDqSS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Oct 2020 20:55:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C6RK90HWPzDqS0
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 20:50:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4C6RK80Rs3z8yHb
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Oct 2020 20:50:36 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 4C6RK74RLmz9sTL; Thu,  8 Oct 2020 20:50:35 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4C6RK70yZVz9sT6
 for <linuxppc-dev@ozlabs.org>; Thu,  8 Oct 2020 20:50:35 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C6RK24H26z9v0Jc;
 Thu,  8 Oct 2020 11:50:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id NUF0HJv3mLwk; Thu,  8 Oct 2020 11:50:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C6RK23TBvz9v0JY;
 Thu,  8 Oct 2020 11:50:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EE6C68B834;
 Thu,  8 Oct 2020 11:50:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id a4SYqGEfJIvK; Thu,  8 Oct 2020 11:50:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E45208B833;
 Thu,  8 Oct 2020 11:50:27 +0200 (CEST)
Subject: Re: [PATCH] crypto: talitos - Fix sparse warnings
To: Herbert Xu <herbert@gondor.apana.org.au>
References: <20201002115236.GA14707@gondor.apana.org.au>
 <be222fed-425b-d55c-3efc-9c4e873ccf8e@csgroup.eu>
 <20201002124223.GA1547@gondor.apana.org.au>
 <20201002124341.GA1587@gondor.apana.org.au>
 <20201003191553.Horde.qhVjpQA-iJND7COibFfWZQ7@messagerie.c-s.fr>
 <20201007065048.GA25944@gondor.apana.org.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <1716ab93-cd9d-bbb3-a954-f3f8378da437@csgroup.eu>
Date: Thu, 8 Oct 2020 11:50:21 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20201007065048.GA25944@gondor.apana.org.au>
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
Cc: linuxppc-dev@ozlabs.org, Kim Phillips <kim.phillips@arm.com>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 =?UTF-8?Q?Horia_Geant=c4=83?= <horia.geanta@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/10/2020 à 08:50, Herbert Xu a écrit :
> On Sat, Oct 03, 2020 at 07:15:53PM +0200, Christophe Leroy wrote:
>>
>> The following changes fix the sparse warnings with less churn:
> 
> Yes that works too.  Can you please submit this patch?
> 

This fixed two independant commits from the past. I sent out two fix patches.

Christophe

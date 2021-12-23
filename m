Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D6547DDF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 04:00:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JKFL174mfz3bhv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Dec 2021 14:00:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.54;
 helo=out30-54.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-54.freemail.mail.aliyun.com
 (out30-54.freemail.mail.aliyun.com [115.124.30.54])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JKFKb5Rbhz2yYJ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Dec 2021 13:59:41 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R121e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04400;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0V.Thv79_1640228358; 
Received: from 30.240.100.46(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0V.Thv79_1640228358) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 23 Dec 2021 10:59:20 +0800
Message-ID: <83ab2a55-d31e-acb8-3cae-9c2d06f08f6c@linux.alibaba.com>
Date: Thu, 23 Dec 2021 10:59:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH 1/5] crypto: sha256 - remove duplicate generic hash init
 function
Content-Language: en-US
To: Julian Calaby <julian.calaby@gmail.com>
References: <20211220092318.5793-1-tianjia.zhang@linux.alibaba.com>
 <20211220092318.5793-2-tianjia.zhang@linux.alibaba.com>
 <CAGRGNgXE_5H20K+e9oejqybOGh8JezMpi2yrDJKqaZ4rWJkZdA@mail.gmail.com>
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
In-Reply-To: <CAGRGNgXE_5H20K+e9oejqybOGh8JezMpi2yrDJKqaZ4rWJkZdA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Herbert Xu <herbert@gondor.apana.org.au>, Vasily Gorbik <gor@linux.ibm.com>,
 Heiko Carstens <hca@linux.ibm.com>, linux-mips@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-crypto@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Julian,

On 12/23/21 6:35 AM, Julian Calaby wrote:
> Hi Tianjia,
> 
> On Mon, Dec 20, 2021 at 8:25 PM Tianjia Zhang
> <tianjia.zhang@linux.alibaba.com> wrote:
>>
>> crypto_sha256_init() and sha256_base_init() are the same repeated
>> implementations, remove the crypto_sha256_init() in generic
>> implementation, sha224 is the same process.
>>
>> Signed-off-by: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
>> ---
>>   crypto/sha256_generic.c | 16 ++--------------
>>   1 file changed, 2 insertions(+), 14 deletions(-)
>>
>> diff --git a/crypto/sha256_generic.c b/crypto/sha256_generic.c
>> index 3b377197236e..bf147b01e313 100644
>> --- a/crypto/sha256_generic.c
>> +++ b/crypto/sha256_generic.c
>> @@ -72,7 +60,7 @@ EXPORT_SYMBOL(crypto_sha256_finup);
>>
>>   static struct shash_alg sha256_algs[2] = { {
>>          .digestsize     =       SHA256_DIGEST_SIZE,
>> -       .init           =       crypto_sha256_init,
>> +       .init           =       sha256_base_init,
>>          .update         =       crypto_sha256_update,
>>          .final          =       crypto_sha256_final,
>>          .finup          =       crypto_sha256_finup,
>> @@ -86,7 +74,7 @@ static struct shash_alg sha256_algs[2] = { {
>>          }
>>   }, {
>>          .digestsize     =       SHA224_DIGEST_SIZE,
>> -       .init           =       crypto_sha224_init,
>> +       .init           =       sha224_base_init,
>>          .update         =       crypto_sha256_update,
>>          .final          =       crypto_sha256_final,
>>          .finup          =       crypto_sha256_finup,
> 
> Aren't these two functions defined as static inline functions? It
> appears that these crypto_ wrappers were added so there's "actual"
> referenceable functions for these structs.
> 
> Did this actually compile?
> 
> Thanks,
> 

Judging from the compilation results, there is really no difference, but 
the modification made by this patch is still necessary, because 
crypto_sha256_init() wrapper and sha256_base_init() are two completely 
duplicate functions.

Best regards,
Tianjia

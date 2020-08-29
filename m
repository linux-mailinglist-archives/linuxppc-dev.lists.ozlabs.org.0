Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 890CC2568F1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Aug 2020 18:01:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bf1R74K1gzDqkk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Aug 2020 02:01:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bf1Nf45pTzDqZ9
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Aug 2020 01:58:55 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bf1NS3lsKz9v7Dc;
 Sat, 29 Aug 2020 17:58:48 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id AZI3cKIA-s-O; Sat, 29 Aug 2020 17:58:48 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bf1NS1r4Pz9v7Db;
 Sat, 29 Aug 2020 17:58:48 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EECD58B7B5;
 Sat, 29 Aug 2020 17:58:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id qSw0-iSMqS91; Sat, 29 Aug 2020 17:58:49 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 29E728B767;
 Sat, 29 Aug 2020 17:58:49 +0200 (CEST)
Subject: Re: [PATCH] fsldma: fsl_ioread64*() do not need lower_32_bits()
To: Guenter Roeck <linux@roeck-us.net>,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
References: <20200829150551.GA27225@roeck-us.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <dc4491f8-f74c-c3c4-82c4-3986c5352205@csgroup.eu>
Date: Sat, 29 Aug 2020 17:58:24 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200829150551.GA27225@roeck-us.net>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>,
 Joerg Roedel <joerg.roedel@amd.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, Zhang Wei <zw@zh-kernel.org>,
 Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Dan Williams <dan.j.williams@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 29/08/2020 à 17:05, Guenter Roeck a écrit :
> On Sat, Aug 29, 2020 at 02:45:38PM +0200, Luc Van Oostenryck wrote:
>> For ppc32, the functions fsl_ioread64() & fsl_ioread64be()
>> use lower_32_bits() as a fancy way to cast the pointer to u32
>> in order to do non-atomic 64-bit IO.
>>
>> But the pointer is already 32-bit, so simply cast the pointer to u32.
>>
>> This fixes a compile error introduced by
>>     ef91bb196b0d ("kernel.h: Silence sparse warning in lower_32_bits")
>>
>> Fixes: ef91bb196b0db1013ef8705367bc2d7944ef696b
> 
> checkpatch complains about this and prefers
> 
> Fixes: ef91bb196b0d ("kernel.h: Silence sparse warning in lower_32_bits")

Checkpatch also complains about spacing:

CHECK:SPACING: No space is necessary after a cast
#39: FILE: drivers/dma/fsldma.h:208:
+	u32 fsl_addr = (u32) addr;

CHECK:SPACING: No space is necessary after a cast
#48: FILE: drivers/dma/fsldma.h:222:
+	u32 fsl_addr = (u32) addr;

total: 0 errors, 0 warnings, 2 checks, 16 lines checked

Christophe

> 
> Otherwise
> 
> Tested-by: Guenter Roeck <linux@roeck-us.net>
> 
>> Reported-by: Guenter Roeck <linux@roeck-us.net>
>> Cc: Li Yang <leoyang.li@nxp.com>
>> Cc: Zhang Wei <zw@zh-kernel.org>
>> Cc: Dan Williams <dan.j.williams@intel.com>
>> Cc: Vinod Koul <vkoul@kernel.org>
>> Cc: Herbert Xu <herbert@gondor.apana.org.au>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: dmaengine@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
>> ---
>>   drivers/dma/fsldma.h | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/dma/fsldma.h b/drivers/dma/fsldma.h
>> index 56f18ae99233..6f6fa7641fa2 100644
>> --- a/drivers/dma/fsldma.h
>> +++ b/drivers/dma/fsldma.h
>> @@ -205,7 +205,7 @@ struct fsldma_chan {
>>   #else
>>   static u64 fsl_ioread64(const u64 __iomem *addr)
>>   {
>> -	u32 fsl_addr = lower_32_bits(addr);
>> +	u32 fsl_addr = (u32) addr;
>>   	u64 fsl_addr_hi = (u64)in_le32((u32 *)(fsl_addr + 1)) << 32;
>>   
>>   	return fsl_addr_hi | in_le32((u32 *)fsl_addr);
>> @@ -219,7 +219,7 @@ static void fsl_iowrite64(u64 val, u64 __iomem *addr)
>>   
>>   static u64 fsl_ioread64be(const u64 __iomem *addr)
>>   {
>> -	u32 fsl_addr = lower_32_bits(addr);
>> +	u32 fsl_addr = (u32) addr;
>>   	u64 fsl_addr_hi = (u64)in_be32((u32 *)fsl_addr) << 32;
>>   
>>   	return fsl_addr_hi | in_be32((u32 *)(fsl_addr + 1));
>> -- 
>> 2.28.0
>>

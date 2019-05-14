Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 129351C50B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 10:34:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4539w42TZJzDqJ3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 18:34:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="QAeNnARi"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4539rs3hgGzDqJ3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 18:31:38 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4539rh4DRpz9tyy5;
 Tue, 14 May 2019 10:31:32 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=QAeNnARi; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dl0lU7J_GCu4; Tue, 14 May 2019 10:31:32 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4539rh3947z9tyy4;
 Tue, 14 May 2019 10:31:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1557822692; bh=oMs/Oz9pXGUH5ZNlnEr5mhjsqI9k+f9eKQF4cd4w5x0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=QAeNnARiPonyZr1RyKXAdky1MBPh6QFeM+J+pPaMw7OFEqow4DrNzICELjFrTZ4xv
 rDHbrlv3RwtLcC/QzrFAAVVFO2p0CSgaUyxJxXuk4FzNHqBqF7RU1DKNpzX6IK1Zj9
 XhYUQFM3OnGxp494cj8/P9BKb+Hid2cTHtxLizSY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D1248B8A6;
 Tue, 14 May 2019 10:31:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 6uGeJKMw1Adf; Tue, 14 May 2019 10:31:33 +0200 (CEST)
Received: from PO15451 (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CB05D8B7C1;
 Tue, 14 May 2019 10:31:32 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/8xx: Add microcode patch to move SMC
 parameter RAM.
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Vitaly Bordug <vitb@kernel.crashing.org>,
 Scott Wood <oss@buserror.net>
References: <35488171038e3d40e7680b8513dfbd52ff7b6ef2.1557487355.git.christophe.leroy@c-s.fr>
 <dd715639629639505ef4edd36d5a1aa4361e6edf.1557487355.git.christophe.leroy@c-s.fr>
 <87a7fptth7.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <73ea3141-e48a-5647-aabc-370fe57585bc@c-s.fr>
Date: Tue, 14 May 2019 10:31:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87a7fptth7.fsf@concordia.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/05/2019 à 08:56, Michael Ellerman a écrit :
> Christophe Leroy <christophe.leroy@c-s.fr> writes:
> 
>> Some SCC functions like the QMC requires an extended parameter RAM.
>> On modern 8xx (ie 866 and 885), SPI area can already be relocated,
>> allowing the use of those functions on SCC2. But SCC3 and SCC4
>> parameter RAM collide with SMC1 and SMC2 parameter RAMs.
>>
>> This patch adds microcode to allow the relocation of both SMC1 and
>> SMC2, and relocate them at offsets 0x1ec0 and 0x1fc0.
>> Those offsets are by default for the CPM1 DSP1 and DSP2, but there
>> is no kernel driver using them at the moment so this area can be
>> reused.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> ---
>>   arch/powerpc/platforms/8xx/Kconfig      |   7 ++
>>   arch/powerpc/platforms/8xx/micropatch.c | 109 +++++++++++++++++++++++++++++++-
>>   2 files changed, 114 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/8xx/micropatch.c b/arch/powerpc/platforms/8xx/micropatch.c
>> index 33a9042fca80..dc4423daf7d4 100644
>> --- a/arch/powerpc/platforms/8xx/micropatch.c
>> +++ b/arch/powerpc/platforms/8xx/micropatch.c
>> @@ -622,6 +622,86 @@ static uint patch_2f00[] __initdata = {
>>   };
>>   #endif
>>   
>> +/*
>> + * SMC relocation patch arrays.
>> + */
>> +
>> +#ifdef CONFIG_SMC_UCODE_PATCH
>> +
>> +static uint patch_2000[] __initdata = {
>> +	0x3fff0000, 0x3ffd0000, 0x3ffb0000, 0x3ff90000,
>> +	0x5fefeff8, 0x5f91eff8, 0x3ff30000, 0x3ff10000,
>> +	0x3a11e710, 0xedf0ccb9, 0xf318ed66, 0x7f0e5fe2,
> 
> Do we have any doc on what these values are?

No we don't


> 
> I get that it's microcode but do we have any more detail than that?
> What's the source etc?
> 

There is an Engineering Bulletin (EB662) dated 2006 from Freescale which 
slightly describe things and there are associated S-Record files 
containing those values.

And an old related message in the mailing list 
https://www.mail-archive.com/linuxppc-dev@lists.ozlabs.org/msg46038.html

Christophe


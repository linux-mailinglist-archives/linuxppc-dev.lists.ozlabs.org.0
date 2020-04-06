Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B745B19F37E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 12:27:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wmtq1jsWzDqHr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:27:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=noON6gqV; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wms33hpJzDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 20:25:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48wmrp4vpZz9tyyr;
 Mon,  6 Apr 2020 12:25:30 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=noON6gqV; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id TZqWGvRUF6UI; Mon,  6 Apr 2020 12:25:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48wmrp3V1bz9v00G;
 Mon,  6 Apr 2020 12:25:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586168730; bh=r+tpZRe2XMK371DPFeoW1MHaEu424eXPW6Y3bbvQU/s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=noON6gqVXGcbg32yjIV3sgJMArZzw8JLWP7tAgLdx8/A33QupTqp98Gbg6zedXVpX
 kffhEWNNe2k5KWmBxf/sLTcCYp5+t9qu/yvuFk5pln8KSww7DMWsSnFTi9NZrrkRwd
 WBQQgeJIrQdowcqY01JH2U0+nmFoKdEyuKkNZhYI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3A9B48B790;
 Mon,  6 Apr 2020 12:25:35 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id g7hNgzlwbJGE; Mon,  6 Apr 2020 12:25:35 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4696A8B78C;
 Mon,  6 Apr 2020 12:25:34 +0200 (CEST)
Subject: Re: [PATCH v5 18/21] powerpc64: Add prefixed instructions to
 instruction data type
To: Alistair Popple <alistair@popple.id.au>, Jordan Niethe <jniethe5@gmail.com>
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-19-jniethe5@gmail.com> <7182352.hY56U9iWWN@townsend>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <4a8cf8b1-63e7-0b68-dede-48454bf5a4a7@c-s.fr>
Date: Mon, 6 Apr 2020 12:25:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7182352.hY56U9iWWN@townsend>
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
Cc: bala24@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/04/2020 à 11:52, Alistair Popple a écrit :

[...]

>> @@ -32,14 +76,31 @@ static inline struct ppc_inst ppc_inst_swab(struct
>> ppc_inst x) return ppc_inst(swab32(ppc_inst_val(x)));
>>   }
>>
>> +static inline u32 ppc_inst_val(struct ppc_inst x)
>> +{
>> +	return x.val;
>> +}
>> +
>>   static inline struct ppc_inst ppc_inst_read(const struct ppc_inst *ptr)
>>   {
>>   	return *ptr;
>>   }
>>
>> +static inline void ppc_inst_write(struct ppc_inst *ptr, struct ppc_inst x)
>> +{
>> +	*ptr = x;
>> +}
>> +
>> +#endif /* __powerpc64__ */
>> +
>>   static inline bool ppc_inst_equal(struct ppc_inst x, struct ppc_inst y)
>>   {
>>   	return !memcmp(&x, &y, sizeof(struct ppc_inst));
>>   }
> 
> Apologies for not picking this up earlier, I was hoping to get to the bottom
> of the issue I was seeing before you sent out v5. However the above definition
> of instruction equality does not seem correct because it does not consider the
> case when an instruction is not prefixed - a non-prefixed instruction should be
> considered equal if the first 32-bit opcode/value is the same. Something like:
> 
> 	if (ppc_inst_prefixed(x) != ppc_inst_prefixed(y))
> 		return false;
> 	else if (ppc_inst_prefixed(x))
> 		return !memcmp(&x, &y, sizeof(struct ppc_inst));

Are we sure memcmp() is a good candidate for the comparison ? Can we do 
simpler ? Especially, I understood a prefixed instruction is a 64 bits 
properly aligned instruction, can we do a simple u64 compare ? Or is GCC 
intelligent enough to do that without calling memcmp() function which is 
heavy ?

> 	else
> 		return x.val == y.val;
> 
> This was causing failures in ftrace_modify_code() as it would falsely detect
> two non-prefixed instructions as being not equal due to differences in the suffix.
>   

Christophe

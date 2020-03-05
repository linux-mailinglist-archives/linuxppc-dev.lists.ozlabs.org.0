Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE91179FCA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 07:09:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Y0hf21ZwzDqq7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Mar 2020 17:09:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Y0g05rk6zDqkK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Mar 2020 17:08:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=hksLamx9; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 48Y0g03Pmsz9sQt; Thu,  5 Mar 2020 17:08:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48Y0g02MHfz9sNg;
 Thu,  5 Mar 2020 17:08:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583388508;
 bh=NxWK+ZJrvSNKWYtiMj0zrErsYhVkJSm14BmzCSHgBOo=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=hksLamx94PxlEKTHyNNj1Pnu6y6PowlKRQCw/JrRWCB0NUp2KaEB6lyDwiCWm7dL4
 YfZJqhRHlp27/98Y5OzX/1OHaYkF6IZHqIu27bziUQkNN5LfZYzGYdUxg3Wq8UHetI
 osiOqCJiEqLuU9rk+FHpmhqHpfGabE9QQAIlZEXSBzqxxNm37K1Px03vzy//fOSCeq
 j2trJChuvZPKqQ6dwQIbPV2Lv34vOKJ+CQRIMMsiLoUk2GPm6Hb9H715GtSVusguo7
 quwSUJHOjGVXtA+Lu9iRRuD8iShTankeJ5ewIGcKrLWej+mUS5+g24baZ2uMmzbUn2
 1dZ5sQq/0CWCA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Andrew Donnellan <ajd@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2] powerpc/mm: Fix missing KUAP disable in
 flush_coherent_icache()
In-Reply-To: <ab27d125-54e7-3c31-709e-ff5d28c7bfbd@linux.ibm.com>
References: <20200303235708.26004-1-mpe@ellerman.id.au>
 <ab27d125-54e7-3c31-709e-ff5d28c7bfbd@linux.ibm.com>
Date: Thu, 05 Mar 2020 17:08:25 +1100
Message-ID: <875zfjqqp2.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Andrew Donnellan <ajd@linux.ibm.com> writes:
> On 4/3/20 10:57 am, Michael Ellerman wrote:
>> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
>> index ef7b1119b2e2..36a8c7b105ce 100644
>> --- a/arch/powerpc/mm/mem.c
>> +++ b/arch/powerpc/mm/mem.c
>> @@ -373,7 +373,9 @@ static inline bool flush_coherent_icache(unsigned long addr)
>>   	 */
>>   	if (cpu_has_feature(CPU_FTR_COHERENT_ICACHE)) {
>>   		mb(); /* sync */
>> +		allow_read_from_user((void *)addr, L1_CACHE_BYTES);
>>   		icbi((void *)addr);
>> +		prevent_read_from_user((void *)addr, L1_CACHE_BYTES);
>>   		mb(); /* sync */
>>   		isync();
>>   		return true;
>> 
>
> (void *) should be (const void __user *) to avoid sparse warnings.
>
> snowpatch reports: https://patchwork.ozlabs.org/patch/1248671/

Thanks.

cheers

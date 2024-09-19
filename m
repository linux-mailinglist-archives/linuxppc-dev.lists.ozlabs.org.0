Return-Path: <linuxppc-dev+bounces-1455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D21097C44D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 08:27:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8QYT0M5lz2yF0;
	Thu, 19 Sep 2024 16:27:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::633"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726727261;
	cv=none; b=WcMpEJlawl863o5k3MDdjFXYiBjQneMEx+KD5/hr6UE73Lp2xJDItzpiSMspGX8i1x8Kyi9XKhJe7MKOh50ZpDL0VlXbYF6aJF/zUfdq2kXQtnItIAvNl9yDeRguUHgQodcMC0HfCWLgMidx6BFkv3Ry2xt6s0qknizd2YAV0T0vKroy5ATzvqYIEm7RkKHZQrtRF/eGUg6FwbWub3JQz5QFh3oqfG3lOmdsgp3ePZcMpCZEDh+fDCPi1YfGXL7eo+QMFYOEBiXTRqMzuXUhmFoCbgLlAI37dJS+5ctru0eFa+BhbTfVhs0eqrwLSLZkdVVJHQ84FB4ROqkEbxvA7g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726727261; c=relaxed/relaxed;
	bh=2Hj+1vqgujWOrqlQpkce2sq1h+JT76BLtBiXrr9bmsw=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-version:Content-type; b=eFXg+kQNoRrrdaIYxxG09xyn1HqauwVFH/uINo33dRfYIjlllxNpewfXLRTt+m3Pvw7h8zsA8/PkJ28rTJutgoxgYU3eib9sBvYdbLe4ViWLljs64fxiD+GmNtDd0wgqLi6SLwcyzIqDKURchUIoP+ASNdiI4dj4LpQi+GCGiUESv31aAZaxkLc9QudEKs5WcYIy9o66A/3Bv0/SIDxLJEs5sztUt+FBI/q97BdTMitsLMdxYyF24XBABUULXBNeI/4eN1pjw0b3VT3hDO3rtw9ORg/dQT9n1RZ2WPnb+kccW4DnsThP7S0ifRZCpFDG8Q5nTKcsk8BkGwnDQMbtwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j19JX7be; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=j19JX7be;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8QYS4vMxz2yDt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 16:27:40 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-206f9b872b2so4371385ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 23:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726727258; x=1727332058; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Hj+1vqgujWOrqlQpkce2sq1h+JT76BLtBiXrr9bmsw=;
        b=j19JX7be+6DYYrhZBUpAxgWSeAE2vJSozTpbwND8N7LNirZhCBk1EKMJzkBC/N5NbK
         ah6mPxcWLrcMG5voexNRuqmAYG4zA9P84laU0Tg8WFHLZ+0HK1w0A90P3ZDoOlJKAI6u
         ncgFbghA+wEBfK14MDNb8XepYKmGHtBZuzA+WXSb7nKlXpc7oR6rvrcRU1hIe4D8Qnrz
         yIhOrN3u7Dcy6t1zVaDqxFfqTFsjVMOFij01YYH3mcuF26XeQ7WE63kFC00yWR3VsWMd
         CoBgjNq2PyxQ7j15TRWyDSjr8Zw2IMcS3v5Gq0WGS+jGGt4UGzOVnNnHMDynSev+YAcL
         DRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726727258; x=1727332058;
        h=content-transfer-encoding:mime-version:references:message-id:date
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Hj+1vqgujWOrqlQpkce2sq1h+JT76BLtBiXrr9bmsw=;
        b=SJmUX4d9kmtx4i1WKLecoiRSHWvtezwrHgs0wCKpp8cT9cSLk8YOf+JhYMkqFuQgYq
         DAFnaBAqsdr5U4UmZJK0dx2pzvoGhqx2zsKFMEF4ITbpy/2L9NneNSRrAQkUA8h6CF2y
         nWyT2IEaYWWyvjTcRNrPWiKjoslCty6rHfjW5mKE06j8WZfkN7BO9P5BnCR2P0svSp0w
         Y+AEfPfyYDoCvNwEn83ePwR+IaxWdjSfevjI+kUfkJ4Ct+nBNZupQIofuCROBQ4QwsEP
         2/cPUpn09B6Hwuyi9TC+x9wQB1Y37V/e4Ch04FCQlJIbvcYM+SIUwikT0e7xKuh5h/XC
         NlHA==
X-Forwarded-Encrypted: i=1; AJvYcCXpoUCCZjxUJMQNehfDRWB/uWLIZc11MfHtm2ZLZGA5VcEUjoP8b6/ZcveHnwoMFDHzS8XTdBsbGW4nUwE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxWyqo0uQPPE195aOk0S5xYvGbbQ0nP1AaIipW4FsbP6KLSy7Ll
	QkDDN//e0iC+rXar7ojKtIHhWqI86oNbN28FwBLnVlVln3+6JRMS
X-Google-Smtp-Source: AGHT+IE50XMoZa4hBwRIz3mN6qx5JWjHTF23/FUJHa75WuBjbh10hAyGn2DW14ljgJyxa6XgGD0eSg==
X-Received: by 2002:a17:902:eb8a:b0:206:ca91:1dda with SMTP id d9443c01a7336-2076e39c56bmr305359875ad.17.1726727258556;
        Wed, 18 Sep 2024 23:27:38 -0700 (PDT)
Received: from dw-tp ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207945da793sm73443715ad.54.2024.09.18.23.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 23:27:37 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, Nirjhar Roy <nirjhar@linux.ibm.com>, LKML <linux-kernel@vger.kernel.org>, kasan-dev@googlegroups.com
Subject: Re: [RFC v2 03/13] book3s64/hash: Remove kfence support temporarily
In-Reply-To: <d9d8703a-df24-47e3-bd0d-2ff5a6eae184@csgroup.eu>
Date: Thu, 19 Sep 2024 11:53:15 +0530
Message-ID: <87jzf8tb58.fsf@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com> <5f6809f3881d5929eedc33deac4847bf41a063b9.1726571179.git.ritesh.list@gmail.com> <d9d8703a-df24-47e3-bd0d-2ff5a6eae184@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-version: 1.0
Content-type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Christophe Leroy <christophe.leroy@csgroup.eu> writes:

> Le 19/09/2024 à 04:56, Ritesh Harjani (IBM) a écrit :
>> Kfence on book3s Hash on pseries is anyways broken. It fails to boot
>> due to RMA size limitation. That is because, kfence with Hash uses
>> debug_pagealloc infrastructure. debug_pagealloc allocates linear map
>> for entire dram size instead of just kfence relevant objects.
>> This means for 16TB of DRAM it will require (16TB >> PAGE_SHIFT)
>> which is 256MB which is half of RMA region on P8.
>> crash kernel reserves 256MB and we also need 2048 * 16KB * 3 for
>> emergency stack and some more for paca allocations.
>> That means there is not enough memory for reserving the full linear map
>> in the RMA region, if the DRAM size is too big (>=16TB)
>> (The issue is seen above 8TB with crash kernel 256 MB reservation).
>> 
>> Now Kfence does not require linear memory map for entire DRAM.
>> It only needs for kfence objects. So this patch temporarily removes the
>> kfence functionality since debug_pagealloc code needs some refactoring.
>> We will bring in kfence on Hash support in later patches.
>> 
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>>   arch/powerpc/include/asm/kfence.h     |  5 +++++
>>   arch/powerpc/mm/book3s64/hash_utils.c | 16 +++++++++++-----
>>   2 files changed, 16 insertions(+), 5 deletions(-)
>> 
>> diff --git a/arch/powerpc/include/asm/kfence.h b/arch/powerpc/include/asm/kfence.h
>> index fab124ada1c7..f3a9476a71b3 100644
>> --- a/arch/powerpc/include/asm/kfence.h
>> +++ b/arch/powerpc/include/asm/kfence.h
>> @@ -10,6 +10,7 @@
>>   
>>   #include <linux/mm.h>
>>   #include <asm/pgtable.h>
>> +#include <asm/mmu.h>
>>   
>>   #ifdef CONFIG_PPC64_ELF_ABI_V1
>>   #define ARCH_FUNC_PREFIX "."
>> @@ -25,6 +26,10 @@ static inline void disable_kfence(void)
>>   
>>   static inline bool arch_kfence_init_pool(void)
>>   {
>> +#ifdef CONFIG_PPC64
>> +	if (!radix_enabled())
>
> No need for a #ifdef here, you can just do:
>
> 	if (IS_ENABLED(CONFIG_PPC64) && !radix_enabled())
> 		return false;
>
>

This special radix handling is anyway dropped in later pacthes. 
So I didn't bother changing it here.

>> +		return false;
>> +#endif
>>   	return !kfence_disabled;
>
> But why not just set kfence_disabled to true by calling disable_kfence() 
> from one of the powerpc init functions ?
>

This patch is only temporarily disabling kfence support for only Hash.
This special Hash handling gets removed in patch-10 which brings back
kfence support.

-ritesh


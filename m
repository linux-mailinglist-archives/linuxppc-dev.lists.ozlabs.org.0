Return-Path: <linuxppc-dev+bounces-2211-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D73399C945
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 13:46:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRwS10zcdz3bq4;
	Mon, 14 Oct 2024 22:46:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728906401;
	cv=none; b=ozEFARrdOxhzDqBp0erZ4I9WI5BszmUrOivk270OecFmwY5aKrf2QIfjJN0rGoxbHLvWrmhselbZmp8dayy8opWAsCrxWv5jVuKMQGi0UwzAnmfTDdWSMgtmDe0PYQ0/AUVCgkWn9RZtYn8uGegRyMf84iJspzXdQ5GOC0irdR84sz9TtiC8HxO5JDfCuzN2MXNBDUVrtI39lbSfN60/nl2iFE9J8s5hCUge6pumnnMVhXrhkPYVqPK3IyzsFAem3oUesD9FnN97Y3m6PZXEJMSfQpLXj0N+QSTSuhAkraynp3me+97WaMCQUlV/CWX8LhI7Ga/TtmTgkO6MItOekQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728906401; c=relaxed/relaxed;
	bh=aWFh25nJyPJAANz+nHPv+XgVZ4oTsCk51SIBxPDCfHQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=U5i0SKmxBZVYOnLPJPrc1/OyuBGTGmNkmEpnTC9qQxqt4HFCD7avzQGH+nfktYehzeKrNb9EHVQmGOpNRwU5jAXGXQTKRH1HQTEhfNlKd1l7c+RMnmeD5sXxgWxanqNO6sQO6tGYpbcU96xkz74jpXncMARxS4UQxavunx+/ynZEWUcazLkBxE8F81UwgHozOhtWaWYZU/PV5ptubnxVp5gKYXrCYddXxCOBDHsWAaI9KzEkvbXPIicpJ+IlvHoECEQZc05a4MzxhbhBtwujSoigOAiUwZ0HrcGRm60SznjuUJx3Zwuu+5J9qIB5MJ1ISB4n+ITILbFV6XWf7b8iaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aAxhl+uI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aAxhl+uI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRwRz15WYz3bpS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 22:46:38 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-20c803787abso27567005ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 04:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728906394; x=1729511194; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aWFh25nJyPJAANz+nHPv+XgVZ4oTsCk51SIBxPDCfHQ=;
        b=aAxhl+uILTZZFbhEvTbmc2bY538QsO1DbrBuY8lRE2VzwDWuB5ee7F+NHTFZ791Us5
         370W3D3mvKBsTSnzaAgebYXF6BsB3gbm0hhIj1y4iVRbk8l1rf2vh0jUBhE49rXh3x1R
         /dd1leMuc7JK5JT91gydqtP/7YKjpCJkovhdUsyhb5uKIqQ88L+Pd9eO+MNz44H8uSII
         xZEWiBgXTr2uiotZhpjkcgSCnMKZwAFPKnpF1Mq8phXj5aeyWm1EyiM6FM5QiAvAVLOe
         JdIX0OLBbcsUd+LN1f4HydmrLb8zX/2PyjxoEJ8zYNdnKlE6/POB/FIb1YsdOsmfWODp
         DakA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728906394; x=1729511194;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aWFh25nJyPJAANz+nHPv+XgVZ4oTsCk51SIBxPDCfHQ=;
        b=s8WXpz7z0qlts7BUI3M/JskqUtidJwqefV5C7lGwOx8eU0bAa89reVye7sPaTVND07
         Oq1w7uyxnFfqKxEaQ+WhmHg7QQAprZgoqOZD266LNoO/V4ym709TyddxoUV+IPzKuWUZ
         ZPDCkxps99iyd+RLgAN5ZGTRA2iexahb1qKLfbqPt+eB+/KbPlUAIPPG47NpC9j4+Svv
         mdT8Jzu/sOXI99XTRQw+NXOv1Bz9XzyA9XQkhzG2sklI+M/b9Gje5kFW+4XM+Bx8Rvyz
         oxlJA34n8wbVM3H0EOWLezukd5weUjnQtEMyX3KZbYNI0f2I5MFp9xulx7HzbNK3z3aI
         RO0A==
X-Forwarded-Encrypted: i=1; AJvYcCUbCbxFp9M6TRA23I/OoEf8DKvAZvmz6aR9VApfd6ijR3oJFBiybZQ1RIPLmcvQdVQyOufsaTcVIyue28U=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yw6kFVsV8ks8KaWJz8EyteSZSERHyx4um7OvqDJTP1LqXDf/4LG
	cEPuhRnlVhFxVb1PAcA07qqVSD9eEjf+758ZIx3k0CytAj3UlnoU
X-Google-Smtp-Source: AGHT+IEbzH2rLW7vX0++DAbmN0Cd8+5Z4OH+8mqkENfD5VLnA/+m5ohpTGDY/xnSU5tPiRMckODPdA==
X-Received: by 2002:a17:903:110e:b0:205:5d71:561e with SMTP id d9443c01a7336-20ca0402291mr172569595ad.26.1728906393559;
        Mon, 14 Oct 2024 04:46:33 -0700 (PDT)
Received: from dw-tp ([171.76.85.106])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20c8c0eb755sm64431045ad.134.2024.10.14.04.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Oct 2024 04:46:32 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: linux-mm@kvack.org, Sourabh Jain <sourabhjain@linux.ibm.com>, Hari Bathini <hbathini@linux.ibm.com>, Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Sachin P Bappalige <sachinpb@linux.ibm.com>
Subject: Re: [RFC v3 1/3] fadump: Refactor and prepare fadump_cma_init for late init
In-Reply-To: <941875f7-0d7f-4ba3-bc7c-7aedc3b20dae@linux.ibm.com>
Date: Mon, 14 Oct 2024 16:54:56 +0530
Message-ID: <87bjznyliv.fsf@gmail.com>
References: <030b6d46fddac126a6cf7e119bea48055338f0ed.1728658614.git.ritesh.list@gmail.com> <941875f7-0d7f-4ba3-bc7c-7aedc3b20dae@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Madhavan Srinivasan <maddy@linux.ibm.com> writes:

> On 10/11/24 8:30 PM, Ritesh Harjani (IBM) wrote:
>> We anyway don't use any return values from fadump_cma_init(). Since
>> fadump_reserve_mem() from where fadump_cma_init() gets called today,
>> already has the required checks.
>> This patch makes this function return type as void. Let's also handle
>> extra cases like return if fadump_supported is false or dump_active, so
>> that in later patches we can call fadump_cma_init() separately from
>> setup_arch().
>
> Usually patches to this file are posted with title format of
>
> powerpc/fadump:<>

yes. I guess it is good to do it that way (I might have missed it)
Although commit history of oldest few patches to fadump shows..

ebaeb5ae2437 fadump: Convert firmware-assisted cpu state dump data into elf notes.
2df173d9e85d fadump: Initialize elfcore header and add PT_LOAD program headers.
3ccc00a7e04f fadump: Register for firmware assisted dump.
eb39c8803d0e fadump: Reserve the memory for firmware assisted dump.

>
>
>> 
>> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
>> Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
>> ---
>> v2 -> v3: Separated the series into 2 as discussed in v2.
>> [v2]: https://lore.kernel.org/linuxppc-dev/cover.1728585512.git.ritesh.list@gmail.com/
>> 
>>  arch/powerpc/kernel/fadump.c | 23 +++++++++--------------
>>  1 file changed, 9 insertions(+), 14 deletions(-)
>> 
>> diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
>> index a612e7513a4f..162327d66982 100644
>> --- a/arch/powerpc/kernel/fadump.c
>> +++ b/arch/powerpc/kernel/fadump.c
>> @@ -78,27 +78,23 @@ static struct cma *fadump_cma;
>>   * But for some reason even if it fails we still have the memory reservation
>>   * with us and we can still continue doing fadump.
>>   */
>> -static int __init fadump_cma_init(void)
>> +static void __init fadump_cma_init(void)
>>  {
>>  	unsigned long long base, size;
>>  	int rc;
>> 
>> -	if (!fw_dump.fadump_enabled)
>> -		return 0;
>> -
>> +	if (!fw_dump.fadump_supported || !fw_dump.fadump_enabled ||
>> +			fw_dump.dump_active)
>> +		return;
>
> Is these checks even needed here? fadump_reserve_mem() checked for all
> these already, also dont see any other caller for fadump_cma_init(). 
>
>

In the next patch we will move fadump_cma_init() call from within
fadump_reserve_mem() to setup_arch(). Hence we need these extra checks
in fadump_cma_init() as well. I mentioned the same in the commit msg of
this patch too.

>>  	/*
>>  	 * Do not use CMA if user has provided fadump=nocma kernel parameter.
>> -	 * Return 1 to continue with fadump old behaviour.
>>  	 */
>> -	if (fw_dump.nocma)
>> -		return 1;
>> +	if (fw_dump.nocma || !fw_dump.boot_memory_size)
>> +		return;
>> 
>>  	base = fw_dump.reserve_dump_area_start;
>>  	size = fw_dump.boot_memory_size;
>> 
>> -	if (!size)
>> -		return 0;
>
> So this is the only place where we return 0, which in turn will make the
> "ret" in fadump_reserve_mem() as zero forcing to call reserve_crashkernel()
> in early_init_devtree().
>
> we are removing it, becos we know "size" here will never be zero?
>
>

yes. Because we already check if boot_memory_size is less than
bootmem_min in fadump_reserve_mem(). If it is less, then we fail and
disable fadump (fadump_enabled = 0).

So then there is no need to check for !boot_memory_size in here.

fadump_reseve_mem( ) {
<...>
	if (!fw_dump.dump_active) {
		fw_dump.boot_memory_size =
			PAGE_ALIGN(fadump_calculate_reserve_size());

		bootmem_min = fw_dump.ops->fadump_get_bootmem_min();
		if (fw_dump.boot_memory_size < bootmem_min) {
			pr_err("Can't enable fadump with boot memory size (0x%lx) less than 0x%llx\n",
			       fw_dump.boot_memory_size, bootmem_min);
			goto error_out;
		}
    <...>    
    }
<...>
error_out:
	fw_dump.fadump_enabled = 0;
	fw_dump.reserve_dump_area_size = 0;
	return 0;
}


Thanks for the review!
-ritesh


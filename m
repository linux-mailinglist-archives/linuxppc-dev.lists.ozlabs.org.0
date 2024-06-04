Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 070FF8FAC06
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 09:31:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WVVQAyAD;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WVVQAyAD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vtj2l1FyPz3cVX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Jun 2024 17:31:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WVVQAyAD;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WVVQAyAD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vtj202vZyz3bqP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Jun 2024 17:31:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717486260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TsL19mGL2R17JenZwmF+AzwbMkbWhCiBk2OX/4KYHpk=;
	b=WVVQAyADLLAkwsKzEHoYtRa99eat5QDG6Py9clWUR5mAkQY8HwLOS+j+msfK1lEb2kAECM
	YLV0BBQ1yuN00yWs3eNeAjxo9tRUCzkw3NL4nCq+xulsaZcX/gCgi6nPqye4SLz1FEFz9F
	27shxQ3Xlc8bGCg6StTIdc7HtFPDRLM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717486260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TsL19mGL2R17JenZwmF+AzwbMkbWhCiBk2OX/4KYHpk=;
	b=WVVQAyADLLAkwsKzEHoYtRa99eat5QDG6Py9clWUR5mAkQY8HwLOS+j+msfK1lEb2kAECM
	YLV0BBQ1yuN00yWs3eNeAjxo9tRUCzkw3NL4nCq+xulsaZcX/gCgi6nPqye4SLz1FEFz9F
	27shxQ3Xlc8bGCg6StTIdc7HtFPDRLM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-RWK89qe6P42JNdSYhJKGSQ-1; Tue, 04 Jun 2024 03:30:56 -0400
X-MC-Unique: RWK89qe6P42JNdSYhJKGSQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a6917eb045bso65629066b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Jun 2024 00:30:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717486255; x=1718091055;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TsL19mGL2R17JenZwmF+AzwbMkbWhCiBk2OX/4KYHpk=;
        b=FTuqBt8B2reZ2SiLSMjA82RpK1qD8RycS2oKOZWNTJNkn+fv+XZMqFPkI00aQMRcwo
         Nfuar5CFHnqr9lVXVwB0xUE5FYDfOf7232xmXV69PDszFy1s5rruPHXRos8hfneau0hi
         4OcqGoARWNiyB9Cc+0AgYcR09kjL8HzqgC6JKJ8GBRQVEjUc36PgxMY9yuHt+ORLZmvB
         I342f6eatojegIxhVqTULPVK6g5AoQu8VZL6te6JdSjYXsXmWjebBwmUkFLmbkfpDDSm
         huKpnBvJE/HaC08Q5oZTtYLgONmhBNsgc4a1fvUxdvcpa3XmKeLnyci/zywjFGIbh6PB
         s4Ow==
X-Forwarded-Encrypted: i=1; AJvYcCWOhU9ZFiFGEnbM5MEV/f+qv+QvNP92oyVQj8bvsfCcM5y4FkI8HSHZL7wnuOioGRMbFq3eiW/ipPS0g5nRmEhvaJnoQjXuxCEfdnF6sQ==
X-Gm-Message-State: AOJu0Yzgc+KZy87deY3askEwCgp3mIVTNDtqo8VKME9+v6kzPkxmxHjQ
	JJG8fk7aEAZ2TAkzBtpwy+F090qJklB20NBvMgClH2csXQA4idEqGp8nsBNZ1eod2xcvZSG21M3
	jLhVAOMvrV1ynKI2Xg0P8I5LKiKHzfuhA0woUYNz22S1UWkIZHNoYETFsxYcHYyY=
X-Received: by 2002:a17:906:3411:b0:a68:f6c7:fed5 with SMTP id a640c23a62f3a-a68f6c7ffffmr333745966b.34.1717486255372;
        Tue, 04 Jun 2024 00:30:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFl4u9DCCzR7ZL9ZSxjy8x1q2NwB/erh1Hb52yDr4RfsMA8vvObCE0FdOfURN/kSozOxH7c5A==
X-Received: by 2002:a17:906:3411:b0:a68:f6c7:fed5 with SMTP id a640c23a62f3a-a68f6c7ffffmr333744466b.34.1717486254987;
        Tue, 04 Jun 2024 00:30:54 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-97.web.vodafone.de. [109.43.178.97])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68fbf068fesm315229066b.26.2024.06.04.00.30.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jun 2024 00:30:54 -0700 (PDT)
Message-ID: <75adb602-7ccc-4dcd-916e-5f79fcd1cdd3@redhat.com>
Date: Tue, 4 Jun 2024 09:30:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v9 22/31] powerpc: Add MMU support
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
 <20240504122841.1177683-23-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240504122841.1177683-23-npiggin@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 04/05/2024 14.28, Nicholas Piggin wrote:
> Add support for radix MMU, 4kB and 64kB pages.
> 
> This also adds MMU interrupt test cases, and runs the interrupts
> test entirely with MMU enabled if it is available (aside from
> machine check tests).
> 
> Acked-by: Andrew Jones <andrew.jones@linux.dev> (configure changes)
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
...
> diff --git a/lib/ppc64/mmu.c b/lib/ppc64/mmu.c
> new file mode 100644
> index 000000000..5307cd862
> --- /dev/null
> +++ b/lib/ppc64/mmu.c
> @@ -0,0 +1,281 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Radix MMU support
> + *
> + * Copyright (C) 2024, IBM Inc, Nicholas Piggin <npiggin@gmail.com>
> + *
> + * Derived from Linux kernel MMU code.
> + */
> +#include <asm/mmu.h>
> +#include <asm/setup.h>
> +#include <asm/smp.h>
> +#include <asm/page.h>
> +#include <asm/io.h>
> +#include <asm/processor.h>
> +#include <asm/hcall.h>
> +
> +#include "alloc_page.h"
> +#include "vmalloc.h"
> +#include <asm/pgtable-hwdef.h>
> +#include <asm/pgtable.h>
> +
> +#include <linux/compiler.h>
> +
> +static pgd_t *identity_pgd;
> +
> +bool vm_available(void)
> +{
> +	return cpu_has_radix;
> +}
> +
> +bool mmu_enabled(void)
> +{
> +	return current_cpu()->pgtable != NULL;
> +}
> +
> +void mmu_enable(pgd_t *pgtable)
> +{
> +	struct cpu *cpu = current_cpu();
> +
> +	if (!pgtable)
> +		pgtable = identity_pgd;
> +
> +	cpu->pgtable = pgtable;
> +
> +	mtmsr(mfmsr() | (MSR_IR|MSR_DR));
> +}
> +
> +void mmu_disable(void)
> +{
> +	struct cpu *cpu = current_cpu();
> +
> +	cpu->pgtable = NULL;
> +
> +	mtmsr(mfmsr() & ~(MSR_IR|MSR_DR));
> +}
> +
> +static inline void tlbie(unsigned long rb, unsigned long rs, int ric, int prs, int r)
> +{
> +	asm volatile(".machine push ; .machine power9; ptesync ; tlbie %0,%1,%2,%3,%4 ; eieio ; tlbsync ; ptesync ; .machine pop" :: "r"(rb), "r"(rs), "i"(ric), "i"(prs), "i"(r) : "memory");

That's a very long line, please split it up after every assembly instruction 
(using \n for new lines).

> +}
...
> diff --git a/powerpc/mmu.c b/powerpc/mmu.c
> new file mode 100644
> index 000000000..fef790506
> --- /dev/null
> +++ b/powerpc/mmu.c
> @@ -0,0 +1,283 @@
> +/* SPDX-License-Identifier: LGPL-2.0-only */
> +/*
> + * MMU Tests
> + *
> + * Copyright 2024 Nicholas Piggin, IBM Corp.
> + */
> +#include <libcflat.h>
> +#include <asm/atomic.h>
> +#include <asm/barrier.h>
> +#include <asm/processor.h>
> +#include <asm/mmu.h>
> +#include <asm/smp.h>
> +#include <asm/setup.h>
> +#include <asm/ppc_asm.h>
> +#include <vmalloc.h>
> +#include <devicetree.h>
> +
> +static inline void tlbie(unsigned long rb, unsigned long rs, int ric, int prs, int r)
> +{
> +	asm volatile(".machine push ; .machine power9; ptesync ; tlbie %0,%1,%2,%3,%4 ; eieio ; tlbsync ; ptesync ; .machine pop" :: "r"(rb), "r"(rs), "i"(ric), "i"(prs), "i"(r) : "memory");
> +}

Same function again? Maybe it could go into mmu.h instead?

> +static inline void tlbiel(unsigned long rb, unsigned long rs, int ric, int prs, int r)
> +{
> +	asm volatile(".machine push ; .machine power9; ptesync ; tlbiel %0,%1,%2,%3,%4 ; ptesync ; .machine pop" :: "r"(rb), "r"(rs), "i"(ric), "i"(prs), "i"(r) : "memory");
> +}

Please also split up the above long line.

It would also be cool if you could get one of the other ppc guys at IBM to 
review this patch, since I don't have a clue about this MMU stuff at all.

  Thanks,
   Thomas


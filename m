Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03ECE90DBBE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 20:40:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQGEBoZ0;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQGEBoZ0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W3bCt4wwmz3cGM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2024 04:40:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQGEBoZ0;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dQGEBoZ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W3bC93xN0z30T0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2024 04:39:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718735986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KeFj7FMj8vcEpASaDi0TP3uoKT7x+gqQ94gHCsvPSwY=;
	b=dQGEBoZ0YtoXTNonbEvFAOEkrpcsYEK8ShQcEacmyMuuJr1DxmV5kgZ7rcdTe5SjFPVKpg
	JcqW12gkQiXnNH6fL29mUAbpugNQwwxEWuXMC8TvLF70KZTv0X2v2Q7qr4TyV2W0CqkU8D
	GyL4oWKaqxlPK+q9q3L7HbeBJZxdSzo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718735986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=KeFj7FMj8vcEpASaDi0TP3uoKT7x+gqQ94gHCsvPSwY=;
	b=dQGEBoZ0YtoXTNonbEvFAOEkrpcsYEK8ShQcEacmyMuuJr1DxmV5kgZ7rcdTe5SjFPVKpg
	JcqW12gkQiXnNH6fL29mUAbpugNQwwxEWuXMC8TvLF70KZTv0X2v2Q7qr4TyV2W0CqkU8D
	GyL4oWKaqxlPK+q9q3L7HbeBJZxdSzo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-490-do4fVAq7NqyIzVjAVaNUIQ-1; Tue, 18 Jun 2024 14:39:44 -0400
X-MC-Unique: do4fVAq7NqyIzVjAVaNUIQ-1
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6ad8a2dbd97so74561486d6.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 11:39:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718735984; x=1719340784;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KeFj7FMj8vcEpASaDi0TP3uoKT7x+gqQ94gHCsvPSwY=;
        b=dYgaUlsikW8XOUgK8jR80r03m2SU+grymLP46iEYgrB2jksEKN51VFhsZqMTQ9lBMS
         UbhSX6/CM+m+/GrPGIadytFgo5Xq/rq1u2oX3yyQSvyv9TbQu1BtLrSmEiXQfTWeFfIe
         dtk05/k3mtT/cm3/OSaHWPgTPKHuUr96Cmqfyu26pNflOqM46Rl04QyN3GH9Ui9R8xXB
         p4IxQ/clwelnAV+UOIVvwOkQlKQ+8gPtihs/AVqNFLO2dTABrmdtEuTXtqXAhVdpiYK6
         oTfLlg00ASwF6+Lq30WK813Ngh/2AB1LGZDPqZqgfFQnn8w5XS55afFSSbHnqCFu00FL
         iHCA==
X-Forwarded-Encrypted: i=1; AJvYcCWkmeoTIHd2T2Jh5Xt/DrBy8KXfkt/NU5j/kLHhoSUbH/PcYBF1M+Ye3pj2W9xz6rRnfmojjFL7ij6NqilRX32ay8uHgsG8TSHMMRflUg==
X-Gm-Message-State: AOJu0YxoZMmqmjDlIQmF9k4AnoqZ14AABE6aPR+I5Uz30qu3VUkv6r0K
	BT/45WLvESTspiyRmeZhZJxSzpuRnmert1uEeSL5sOD5LMld7RVbFqEnGSTYL0TDTbLXzl/6FjQ
	fKMbIXv/Vaq0OfxKz2K1YVS67dnehRCTgmJEJCZHKC0OXGjaBEG6mSMqrEk9Jaw0=
X-Received: by 2002:a0c:c984:0:b0:6b0:5c89:a86e with SMTP id 6a1803df08f44-6b501e3dddcmr6398366d6.28.1718735984059;
        Tue, 18 Jun 2024 11:39:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSuIf4mge8tCBI7lR69nSs6E7dT6iTiDCdUQpb6hJlw9jBLlrMNBs3XDNtBhSqrrn0vqGljA==
X-Received: by 2002:a0c:c984:0:b0:6b0:5c89:a86e with SMTP id 6a1803df08f44-6b501e3dddcmr6398216d6.28.1718735983777;
        Tue, 18 Jun 2024 11:39:43 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de. [109.43.178.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5c466ccsm69413036d6.71.2024.06.18.11.39.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 11:39:43 -0700 (PDT)
Message-ID: <5bfe90ca-96aa-405b-a4b9-86ec4a497366@redhat.com>
Date: Tue, 18 Jun 2024 20:39:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [kvm-unit-tests PATCH v10 08/15] powerpc: add pmu tests
To: Nicholas Piggin <npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
 <20240612052322.218726-9-npiggin@gmail.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240612052322.218726-9-npiggin@gmail.com>
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

On 12/06/2024 07.23, Nicholas Piggin wrote:
> Add some initial PMU testing.
> 
> - PMC5/6 tests
> - PMAE / PMI test
> - BHRB basic tests
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
...
> diff --git a/powerpc/pmu.c b/powerpc/pmu.c
> new file mode 100644
> index 000000000..bdc45e167
> --- /dev/null
> +++ b/powerpc/pmu.c
> @@ -0,0 +1,562 @@
...
> +static void test_pmc5_with_ldat(void)
> +{
> +	unsigned long pmc5_1, pmc5_2;
> +	register unsigned long r4 asm("r4");
> +	register unsigned long r5 asm("r5");
> +	register unsigned long r6 asm("r6");
> +	uint64_t val;
> +
> +	reset_mmcr0();
> +	mtspr(SPR_PMC5, 0);
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> +	asm volatile(".rep 20 ; nop ; .endr" ::: "memory");
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> +	pmc5_1 = mfspr(SPR_PMC5);
> +
> +	val = 0xdeadbeef;
> +	r4 = 0;
> +	r5 = 0xdeadbeef;
> +	r6 = 100;
> +	reset_mmcr0();
> +	mtspr(SPR_PMC5, 0);
> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) & ~(MMCR0_FC | MMCR0_FC56));
> +	asm volatile(".rep 10 ; nop ; .endr ; ldat %0,%3,0x10 ; .rep 10 ; nop ; .endr" : "=r"(r4), "+r"(r5), "+r"(r6) : "r"(&val) :"memory");

Looks like older versions of Clang do not like this instruction:

  /tmp/pmu-4fda98.s: Assembler messages:
  /tmp/pmu-4fda98.s:1685: Error: unrecognized opcode: `ldat'
  clang-13: error: assembler command failed with exit code 1 (use -v to see 
invocation)

Could you please work-around that issue?

Also, please break the very long line here. Thanks!

> +	mtspr(SPR_MMCR0, mfspr(SPR_MMCR0) | (MMCR0_FC | MMCR0_FC56));
> +	pmc5_2 = mfspr(SPR_PMC5);
> +	assert(r4 == 0xdeadbeef);
> +	assert(val == 0xdeadbeef);
> +
> +	/* TCG does not count instructions around syscalls correctly */
> +	report_kfail(host_is_tcg, pmc5_1 != pmc5_2 + 1,
> +		     "PMC5 counts instructions with ldat");
> +}

  Thomas


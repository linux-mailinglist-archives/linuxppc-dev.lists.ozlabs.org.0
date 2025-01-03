Return-Path: <linuxppc-dev+bounces-4598-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27D94A00355
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 04:56:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPVBV4nb4z302P;
	Fri,  3 Jan 2025 14:56:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735876610;
	cv=none; b=Z5gpyrfL+1P7Tmoe7Zxg7dZKaGWN35/qA7Ap3mXpk4IAUlHh4YPhUC1Q4kFF+7nGBSuVhfRmiPnnTQ+atfcm4sPRUvCz7+E1qBn+T9tOJz7Ot9b16hY/CCHPaJpWTUBTcRJo4fwuX1Y89a70UQL1fhgIjMbjfVZoHgVH3TFyoX9BVZZ2EmNFJkcSw2vFrUE+zKe41SL78Nl4ut9cVdh9ajDe0POJyry1CjoXSKBJrv1fzwX6t7sVQEOsQQYeR9zuKOCtv2qUFc/rjRZyKhBhQR75Pcy8b4vUI+CHgYFyJuepBpN66K7v4KOAYufSmobc7fMmDebeM4BM7fkTH53foA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735876610; c=relaxed/relaxed;
	bh=ZAFSLXktiWezwRLeMqNHQIZ8a5HqagkfYDHtpNVk3Hg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JpDPPznQ6yQ2qpS2V54NKF0HsEa5njBHOeuiomgwqlHVU1eXzOV//xnHnrMsDN23W1SqY0ilBYNCuA1h90m0Wa7DWFQYic6YNrJv0aRgWlsOsrZeQiZpK37EyGpwJyoCsvD5XXjmwJWC5ScMvlFPEGeig3b/Paps1MFWQjEe4j8JyQMkJMWfbQumUZf1RzKws2JD5+0x7Scke6OT/OdpiGrBFgz7ay7iFmW1DegOAyrbY2BCBYnN4LVq9QhqFaMInyiLzDQOA95/BQPM1KKFdQGR9k+yvl4ULV7iAdXrHnJDaQ8VadayI47ODT+VM5cksuVZtUPusINUuQRrCPw5ZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AV/4cLAr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=AV/4cLAr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPVBT4mgYz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 14:56:49 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2161eb95317so168525905ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2025 19:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876607; x=1736481407; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZAFSLXktiWezwRLeMqNHQIZ8a5HqagkfYDHtpNVk3Hg=;
        b=AV/4cLArNX6fwh3ar6dOh8gs1Csq6YbV+p/CE0oCZohvFB/IkCo1FgBZpGuj60npaI
         JpyV5HrPw59hCU+HaGh75MVpRKFQpSgEwq4mGjZ3vUYN8s4QjTxv1hTA09dV54fjLKAb
         ls9elyx53JbMT0tFTKR9O8l58InOicQPV8N+W7b1yxIMTlSbVL2LtvLdLvBWPguwrQJC
         xROADs40huTMaDU/y0RnVuSqlf0I94G4tm2KAa3XWC/HCrmD82OVcI53S2o0V5kTHl/o
         Y16QzqA7kzhr4cTDMNi+kCDneERwgoli8pQX2KCf0i9KcvPT+BUXrM6JTx4Y8O3OfDPs
         mdDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876607; x=1736481407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAFSLXktiWezwRLeMqNHQIZ8a5HqagkfYDHtpNVk3Hg=;
        b=cOknm/+65B5fu8k4GLhsCJ4kl+bwra3x7xXU/Tq8oMfKhMxF3xvDuA8sXZYS9BmqOy
         TiGlMFkJ0YVlcQ3Iedubjvxg8+aZIwIl5piTKJwHGGr0FNp3jpYsc+GuquVHoYnexFhu
         OzjDQtfWtctUIFuuWS4UIKs9OKujsyqi0ipg7syOD+sHUmK3AJq7dSXb+xmDYjXnmsle
         VagNt4snPCfTFh+V9U6QHb9bipjLm7uRzYkbkKJVgpY8L10B9IIRp2c7DxMTSwV4F9y3
         cJ9BNQJTWWCKJfivXhjyaOn/qAOSrfN8oL/uE7+ZhspupUWODUtSIuNmCPjyDP0Pnskk
         Yzxw==
X-Forwarded-Encrypted: i=1; AJvYcCX10isVlSEdkB49YHaObrbp4xmiGwcnfwK6R4UjbbD+3FFXxXHLuV6Gc5qCbyzojRaRV+L+HCAP1MirTEM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzwJGGzn+xeeL7IIdOHi5c7f1cZVNBrero85EiNTHuFkJUeiLbR
	ED4qRWTTDgmIzsRSx+GZkjnBgtjDQTdD3sQKPbYOJ11Z23riHJplj7Ivu8xLEhg=
X-Gm-Gg: ASbGncvWN9fJqdnrvfdw6cCD0zIfQTTp1OqTGcUsD723nBH+CJB3o3GsK5SDKA1poAB
	GJ95Pt8r5qjMW4jEKocGUanV51dqhRrxyNYWbk6rtOcbDP9FLDzpFcPK1TBJL+cU0TFfiGRfuIS
	s+bkYN8bGuuutm+FWANX+p3ZX9i9m1g4E+ZQlyMa8skTmRYJ0yOp+3a5YJv3yw0cRDYw44Q9YmM
	TTQO19cqf3xieYCjKWdTvdhvWzEzyDYROz8WBsySZ/Ag+e7+SLLwdaqQtaYBrST+khYeQNTVIi7
	wijlHQ==
X-Google-Smtp-Source: AGHT+IEc/ggyHLTYoMeUluV4bigOVwXpofNkIsaBMCcId3pHP1FalWdw/+NGvDWYCJeax838Cotn8g==
X-Received: by 2002:a05:6a21:158d:b0:1e1:ca91:b0e3 with SMTP id adf61e73a8af0-1e5e0800420mr68823527637.36.1735876606776;
        Thu, 02 Jan 2025 19:56:46 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.148])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad8dbafesm25847661b3a.128.2025.01.02.19.56.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:56:46 -0800 (PST)
Message-ID: <1cea8c66-626e-434f-aafd-9d44d37f5cc4@bytedance.com>
Date: Fri, 3 Jan 2025 11:56:32 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 00/15] move pagetable_*_dtor() to __tlb_remove_table()
Content-Language: en-US
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: peterz@infradead.org, agordeev@linux.ibm.com, palmer@dabbelt.com,
 tglx@linutronix.de, david@redhat.com, jannh@google.com, hughd@google.com,
 yuzhao@google.com, willy@infradead.org, muchun.song@linux.dev,
 vbabka@kernel.org, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
 rientjes@google.com, vishal.moola@gmail.com, arnd@arndb.de, will@kernel.org,
 aneesh.kumar@kernel.org, npiggin@gmail.com, dave.hansen@linux.intel.com,
 rppt@kernel.org, ryan.roberts@arm.com, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org, x86@kernel.org,
 linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-um@lists.infradead.org
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <04b0a778-7a6b-4df3-b40e-ca76adddb243@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 2025/1/3 01:00, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>> Qi Zheng (13):
>>    Revert "mm: pgtable: make ptlock be freed by RCU"
>>    mm: pgtable: add statistics for P4D level page table
>>    arm64: pgtable: use mmu gather to free p4d level page table
>>    s390: pgtable: add statistics for PUD and P4D level page table
>>    mm: pgtable: introduce pagetable_dtor()
>>    arm: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    arm64: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    riscv: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    x86: pgtable: move pagetable_dtor() to __tlb_remove_table()
>>    s390: pgtable: also move pagetable_dtor() of PxD to
>>      __tlb_remove_table()
>>    mm: pgtable: introduce generic __tlb_remove_table()
>>    mm: pgtable: move __tlb_remove_table_one() in x86 to generic file
>>    mm: pgtable: introduce generic pagetable_dtor_free()
> 
> Aside from the nit on patch 4 and the request for clarification on patch
> 10, this is looking good to me, so for the whole series (aside from my
> own patches of course):
> 
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

Thanks for your review!

> 
> And happy new year!

Happy New Year!! :)

> 
> Cheers,
> - Kevin


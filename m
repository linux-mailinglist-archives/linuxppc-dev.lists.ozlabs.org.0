Return-Path: <linuxppc-dev+bounces-4596-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8274DA00345
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 04:48:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPV1F454wz301N;
	Fri,  3 Jan 2025 14:48:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735876129;
	cv=none; b=XJxCFJa+4//h4iF8TyqeZlOSis4ogwWYUxU3EKF4lCEmQ3H6tpL4DO/Uz8zXl23lG4OW4GZsA6XIWcsT2DY5FE2ln0eO5Rl02W/Z7tI6o+2iSBOxf+fPtZ2oCayZdy9zJwIWTMwdOR3B1fb8vkQBtT8Q1QAHfg69j1Hcw5gmTizDfIbG7l5sYqIQeMDJPxYQekTo/FNbRzJRUO1eGhv7mHrSKMOEJp4heWzSbZ7gP6HpRr5qD+JoBMk2lJwXN5Mehzpy4MCP21JOsMxfYQmmHXf2rF4OC+6EuvB4LOG2bOqZm4HLnKRTkdYM1d8Rzm0NHeRNKSnOvvVN+IXATqdKPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735876129; c=relaxed/relaxed;
	bh=oBhK1CXUGm9csX2RzVpIIXFvov7I6iYRPJ+9MZcmeVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e2pd5tbcj8VLkj2fKKzQJxgDXYgaI367rLyb02MwxaFDCrBENXdlP7HEsTQf9Pv1DLe5bSd9z/JqA2Hz4aoRT9Bbqtx1BaP4uACnrGrxHqhXVDVgot6ei9CQdURyKGSfYm9KMrB1MQWXhE1JpjTJn53lxzWYtkOXe1bHszek2kMOErsTfSMB6T2wmWIM/uDQ3DVAOOAKW6nBXfPQ98Nqc8GeWJ/k6T9FiCqTg/bmuagT3VygElWJro02azqwqJbS7/f4XMaLTSIhIgL4Ql+2jH1qW3If4COZJ0SxAolGAdXDNAwupwCUYEotA9gf+W4ag2ixo02qBoHctY/ckaZbOQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hCGOywTR; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org) smtp.mailfrom=bytedance.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=hCGOywTR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bytedance.com (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=zhengqi.arch@bytedance.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPV1C1Qldz2xxt
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 14:48:44 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-2164b1f05caso161800365ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jan 2025 19:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1735876122; x=1736480922; darn=lists.ozlabs.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oBhK1CXUGm9csX2RzVpIIXFvov7I6iYRPJ+9MZcmeVs=;
        b=hCGOywTR/mZD7VqyjIL4QwMLtUObcP+CYD54V7UNPEFXpjWwbi3hyguRid0xciqNS5
         jClW7alv502Fog1NiTV9EdjK/Xhy6PnLvTMZyTIqjYOhzSbdyZp4VhdW4z8M5PwpecwN
         kOETVOfL41Qw+2aXGSFEEJYRuY6vMj6V48DZLJ94eEyxgFwdQgGL/nNwI9Bm9WtToIdv
         D77PYYFY0/OU+hteisFAQM9nqi3LKHf1AVilktEsLLorVnpwS1MOmvbh1N8JLY+0IJZM
         9mhduj84XNHf809mO0lzaYBbTciRvxYAHXv8d+7KaJo47+X12oCmoB9RSSHnv/HXI2Dj
         lJ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735876122; x=1736480922;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oBhK1CXUGm9csX2RzVpIIXFvov7I6iYRPJ+9MZcmeVs=;
        b=blrcWwk+XxFQIEyFEHYQ/y9izmYVocMC30eYm+Ue6VfFzQgO2D3nBEglerxtCUtT26
         hTbDYEmjX79Z9YZ+bMLRwIgIb5iF84IwEETGniHbqZ3Wk+iPi6Y3+o/MogbgRU4ku8Hp
         iOitpENAAVP0heZuW3971olM9bvSK3WvTZGwRoVMsfB3yXRGir53ywHY6BBy7WWHQHM0
         Xozh0pE68SI/RmL0MxbAL5B3DTisO2/0TVA0s0WbKGDVKrN8gJZyPbiCNZmi+legkXMW
         XvG6XN0CHldLStYhiQ00HWoD4SxKbY9XXCOkE/bpjHsXMVZLJ04ngtnOiwd9J11T+4uI
         2Prg==
X-Forwarded-Encrypted: i=1; AJvYcCWdKANBfkxEbwHzLAaXLzztIbw9Gfj3vqZfHu0EMeI5l3vrDg7G5Q8Eipr6grv02Sy2ZkVhPNK35lrMZoM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzbTNV7lFIPZg1hpB3CRvaaT4298UmU1Q/nu4jeoTLQWwKlWmMu
	axzD52baSN9yMpIjL5HarRLvUl7rxXelZ0xRoasC8qeanpn1HDgnEwv56jf0iLw=
X-Gm-Gg: ASbGncvU0knKDiOE+r7MahUfbX1CUy81x/H5BIq/UwBiRxzxcQ+kuKkyhpdCZdJ89V4
	TGyFJ2TyF17S87KgHcIwwp/mZDfOWEDMnlsZaT1+ynYKV+7KKmYoFlUgmN5bAlpgx5KQtqRVfH4
	fSMxvycwtMxj8AeyhD0yIxyLDKLBoG63N3L72o4RmbzJuP8AH40G1qaClN+w9aGxziZ7n7qFh9g
	sFKqElIMj0YvflK4fmTHhRvrqA+OXgl0uImZntfnvHRe4FrBg3RWzRDk7GGGMe3GKHG32qT23vD
	xWiA6w==
X-Google-Smtp-Source: AGHT+IGYgpZrnqPiPCHLxVCKQrrsZq8D5LYrHf09cYbjj5EwfNYfddJqRahKvm2mW4f56s0g/0EfTw==
X-Received: by 2002:a05:6a00:2449:b0:728:e906:e45a with SMTP id d2e1a72fcca58-72abdecdbfdmr70684623b3a.24.1735876121963;
        Thu, 02 Jan 2025 19:48:41 -0800 (PST)
Received: from [10.84.148.23] ([203.208.167.150])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad84eb50sm25233750b3a.90.2025.01.02.19.48.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Jan 2025 19:48:41 -0800 (PST)
Message-ID: <ebce5e05-5e46-4c6e-94a0-bcf3655a862b@bytedance.com>
Date: Fri, 3 Jan 2025 11:48:27 +0800
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
Subject: Re: [PATCH v4 10/15] riscv: pgtable: move pagetable_dtor() to
 __tlb_remove_table()
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
 <0e8f0b3835c15e99145e0006ac1020ae45a2b166.1735549103.git.zhengqi.arch@bytedance.com>
 <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
From: Qi Zheng <zhengqi.arch@bytedance.com>
In-Reply-To: <1b09335c-f0b6-4ccb-9800-5fb22f7e8083@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Kevin,

On 2025/1/3 00:53, Kevin Brodsky wrote:
> On 30/12/2024 10:07, Qi Zheng wrote:
>>   static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, void *pt)
>>   {
>> -	if (riscv_use_sbi_for_rfence())
>> +	if (riscv_use_sbi_for_rfence()) {
>>   		tlb_remove_ptdesc(tlb, pt);
>> -	else
>> +	} else {
>> +		pagetable_dtor(pt);
>>   		tlb_remove_page_ptdesc(tlb, pt);
> 
> I find the imbalance pretty confusing: pagetable_dtor() is called
> explicitly before using tlb_remove_page() but not tlb_remove_ptdesc().
> Doesn't that assume that CONFIG_MMU_GATHER_HAVE_TABLE_FREE is selected?
> Could we not call pagetable_dtor() from __tlb_batch_free_encoded_pages()
> to ensure that the dtor is always called just before freeing, and remove

In __tlb_batch_free_encoded_pages(), we can indeed detect PageTable()
and call pagetable_dtor() to dtor the page table pages.
But __tlb_batch_free_encoded_pages() is also used to free normal pages
(not page table pages), so I don't want to add overhead there.

But now I think maybe we can do this in tlb_remove_page_ptdesc(), like
this:

diff --git a/arch/csky/include/asm/pgalloc.h 
b/arch/csky/include/asm/pgalloc.h
index f1ce5b7b28f22..e45c7e91dcbf9 100644
--- a/arch/csky/include/asm/pgalloc.h
+++ b/arch/csky/include/asm/pgalloc.h
@@ -63,7 +63,6 @@ static inline pgd_t *pgd_alloc(struct mm_struct *mm)

  #define __pte_free_tlb(tlb, pte, address)              \
  do {                                                   \
-       pagetable_dtor(page_ptdesc(pte));               \
         tlb_remove_page_ptdesc(tlb, page_ptdesc(pte));  \
  } while (0)

diff --git a/arch/hexagon/include/asm/pgalloc.h 
b/arch/hexagon/include/asm/pgalloc.h
index 40e42a0e71673..9903449f45cff 100644
--- a/arch/hexagon/include/asm/pgalloc.h
+++ b/arch/hexagon/include/asm/pgalloc.h
@@ -89,7 +89,6 @@ static inline void pmd_populate_kernel(struct 
mm_struct *mm, pmd_t *pmd,

  #define __pte_free_tlb(tlb, pte, addr)                         \
  do {                                                           \
-       pagetable_dtor((page_ptdesc(pte)));                     \
         tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
  } while (0)

diff --git a/arch/loongarch/include/asm/pgalloc.h 
b/arch/loongarch/include/asm/pgalloc.h
index 7211dff8c969e..de5b3f5c85d1c 100644
--- a/arch/loongarch/include/asm/pgalloc.h
+++ b/arch/loongarch/include/asm/pgalloc.h
@@ -57,7 +57,6 @@ static inline pte_t *pte_alloc_one_kernel(struct 
mm_struct *mm)

  #define __pte_free_tlb(tlb, pte, address)                      \
  do {                                                           \
-       pagetable_dtor(page_ptdesc(pte));                       \
         tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));        \
  } while (0)

diff --git a/arch/m68k/include/asm/sun3_pgalloc.h 
b/arch/m68k/include/asm/sun3_pgalloc.h
index 2b626cb3ad0ae..731cc8f0731d3 100644
--- a/arch/m68k/include/asm/sun3_pgalloc.h
+++ b/arch/m68k/include/asm/sun3_pgalloc.h
@@ -19,7 +19,6 @@ extern const char bad_pmd_string[];

  #define __pte_free_tlb(tlb, pte, addr)                         \
  do {                                                           \
-       pagetable_dtor(page_ptdesc(pte));                       \
         tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));        \
  } while (0)

diff --git a/arch/mips/include/asm/pgalloc.h 
b/arch/mips/include/asm/pgalloc.h
index 36d9805033c4b..964ad514be281 100644
--- a/arch/mips/include/asm/pgalloc.h
+++ b/arch/mips/include/asm/pgalloc.h
@@ -56,7 +56,6 @@ static inline void pgd_free(struct mm_struct *mm, 
pgd_t *pgd)

  #define __pte_free_tlb(tlb, pte, address)                      \
  do {                                                           \
-       pagetable_dtor(page_ptdesc(pte));                       \
         tlb_remove_page_ptdesc((tlb), page_ptdesc(pte));        \
  } while (0)

diff --git a/arch/nios2/include/asm/pgalloc.h 
b/arch/nios2/include/asm/pgalloc.h
index 12a536b7bfbd4..ef6b4b8301ac6 100644
--- a/arch/nios2/include/asm/pgalloc.h
+++ b/arch/nios2/include/asm/pgalloc.h
@@ -30,7 +30,6 @@ extern pgd_t *pgd_alloc(struct mm_struct *mm);

  #define __pte_free_tlb(tlb, pte, addr)                                 \
         do {                                                            \
-               pagetable_dtor(page_ptdesc(pte));                       \
                 tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
         } while (0)

diff --git a/arch/openrisc/include/asm/pgalloc.h 
b/arch/openrisc/include/asm/pgalloc.h
index 596e2355824e3..9361205610910 100644
--- a/arch/openrisc/include/asm/pgalloc.h
+++ b/arch/openrisc/include/asm/pgalloc.h
@@ -68,7 +68,6 @@ extern pte_t *pte_alloc_one_kernel(struct mm_struct *mm);

  #define __pte_free_tlb(tlb, pte, addr)                         \
  do {                                                           \
-       pagetable_dtor(page_ptdesc(pte));                       \
         tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
  } while (0)

diff --git a/arch/riscv/include/asm/pgalloc.h 
b/arch/riscv/include/asm/pgalloc.h
index c8907b8317115..61c26576614da 100644
--- a/arch/riscv/include/asm/pgalloc.h
+++ b/arch/riscv/include/asm/pgalloc.h
@@ -25,12 +25,10 @@
   */
  static inline void riscv_tlb_remove_ptdesc(struct mmu_gather *tlb, 
void *pt)
  {
-       if (riscv_use_sbi_for_rfence()) {
+       if (riscv_use_sbi_for_rfence())
                 tlb_remove_ptdesc(tlb, pt);
-       } else {
-               pagetable_dtor(pt);
+       else
                 tlb_remove_page_ptdesc(tlb, pt);
-       }
  }

  static inline void pmd_populate_kernel(struct mm_struct *mm,
diff --git a/arch/sh/include/asm/pgalloc.h b/arch/sh/include/asm/pgalloc.h
index 96d938fdf2244..5b5c73e9fdb4b 100644
--- a/arch/sh/include/asm/pgalloc.h
+++ b/arch/sh/include/asm/pgalloc.h
@@ -34,7 +34,6 @@ static inline void pmd_populate(struct mm_struct *mm, 
pmd_t *pmd,

  #define __pte_free_tlb(tlb, pte, addr)                         \
  do {                                                           \
-       pagetable_dtor(page_ptdesc(pte));                       \
         tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
  } while (0)

diff --git a/arch/um/include/asm/pgalloc.h b/arch/um/include/asm/pgalloc.h
index f0af23c3aeb2b..4fd59fb184818 100644
--- a/arch/um/include/asm/pgalloc.h
+++ b/arch/um/include/asm/pgalloc.h
@@ -27,7 +27,6 @@ extern pgd_t *pgd_alloc(struct mm_struct *);

  #define __pte_free_tlb(tlb, pte, address)                      \
  do {                                                           \
-       pagetable_dtor(page_ptdesc(pte));                       \
         tlb_remove_page_ptdesc((tlb), (page_ptdesc(pte)));      \
  } while (0)

@@ -35,7 +34,6 @@ do { 
        \

  #define __pmd_free_tlb(tlb, pmd, address)                      \
  do {                                                           \
-       pagetable_dtor(virt_to_ptdesc(pmd));                    \
         tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pmd));     \
  } while (0)

@@ -43,7 +41,6 @@ do { 
        \

  #define __pud_free_tlb(tlb, pud, address)                      \
  do {                                                           \
-       pagetable_dtor(virt_to_ptdesc(pud));            \
         tlb_remove_page_ptdesc((tlb), virt_to_ptdesc(pud));     \
  } while (0)

diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
index a96d4b440f3da..a59205863f431 100644
--- a/include/asm-generic/tlb.h
+++ b/include/asm-generic/tlb.h
@@ -506,6 +506,7 @@ static inline void tlb_remove_ptdesc(struct 
mmu_gather *tlb, void *pt)
  /* Like tlb_remove_ptdesc, but for page-like page directories. */
  static inline void tlb_remove_page_ptdesc(struct mmu_gather *tlb, 
struct ptdesc *pt)
  {
+       pagetable_dtor(pt);
         tlb_remove_page(tlb, ptdesc_page(pt));
  }

This avoids explicitly calling pagetable_dtor() in the architecture
code. If that makes sense, I can send a formal separate patch to do
this.

Thanks,
Qi


> the extra handling from arch code? I may well be missing something, I'm
> not super familiar with the tlb handling code >
> - Kevin


Return-Path: <linuxppc-dev+bounces-14839-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9BCC8914
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Dec 2025 16:49:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dWdWw4blqz2yxN;
	Thu, 18 Dec 2025 02:49:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765986556;
	cv=none; b=TbJYUWDvXOP9pLAUu16sYycSX3gITi4VHJpHXzLcpZlWBQwkVsHkLNnKxETXvKVPUZeJ2unRHZ+IRi9viJYiAnESQOJL9h/qqWYGlOCNmisnXqhXUGDrw4VSrqELkEI8En21XtEo4Z0i36JyoaPgGnqBIj5dwhPnDVc+YdkUyB/B2k6lwGT3Te7fRGXZDZRyFbzIND3jH/oXJ+JVlix8RhgRZWqZECAgtbmFsVjw+Xxf64Db61cAIYp+33KghqOXc+E58H7bLIU2/F4+XDfwIA76V/f8XywF5fqC3Y2h5v7MH84afH0zMZz3TboNBuAWk2mQh/UPe6sxKdemk35Dlw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765986556; c=relaxed/relaxed;
	bh=k7g6szJSc9qKXraE1vzVnFUR39QDkw3X32snO8YJ7Qo=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=LS+i4wHfr676vyvb4QPFntALg1Mh4dgBFhpqByNUuVYgSDB2FZI/2l7FiffUANEJnRoYfEPByIAISiZIeuwGaIgPr2Wwpj5OjrQUg9Pu2KplN8U2ysDo9m9VnmPiGzos3c6eoIhxLKZgSdhOlpuRcxKgWOrRgaBnB46Y1WhWwcu9UCYEWtmthPFO9h+O3YUN9a9z760TJdWEF+s0pwn7n52ikI6IhWv6PysckDIKGHrpPgtNmTemi5iYkVnC6ylXOGZwaVMoTT3YcP94uCdRVLXiBoKoOVMdcpQwG6QYwIGPuJ7o5+4SGt4XTjTAF3cRgspehS/tXGXwERUG2dfmZA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NXe/H7+d; dkim-atps=neutral; spf=pass (client-ip=209.85.214.175; helo=mail-pl1-f175.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NXe/H7+d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.214.175; helo=mail-pl1-f175.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dWdWt594Dz2yvZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 02:49:14 +1100 (AEDT)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2a1388cdac3so20239865ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Dec 2025 07:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765986492; x=1766591292; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=k7g6szJSc9qKXraE1vzVnFUR39QDkw3X32snO8YJ7Qo=;
        b=NXe/H7+dpNzSMtQZHApV/qR2Ee1vNCpf3ytGmxQVrRXB+bVXeKGWXr6EzIHehEY46K
         uYQNDS7n9Ndl/hb+qfgLsqF80V2UrImNS0/UbywBUfB0CG6rCKjJeDsgB4GtZyppG9Yw
         nuL87/Z8I+kKZNrVRX7JeyurwWcSsmDUmjImzy00vwmKdn0qiHpiK2U5EjmbdUJWZK2m
         KK9QqHaXB6JvRZ+Qik7Ey7eUKircBfzd6zO/qGe8zfZWbdIJ9ryz9+efOBHxM7bJZgC2
         k8mcGKNc3rOkoyKKCv7Rsw2W1T9MWxDVVS6aeFm56auPdT4wnM/ynmkgZuVbLysJlXAI
         j++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765986492; x=1766591292;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k7g6szJSc9qKXraE1vzVnFUR39QDkw3X32snO8YJ7Qo=;
        b=WMtxJoY6XcpAzfWSa1kjlMPcuffp2315aA550Hk7bKFpH0nSZ+2kTpW7b97qHpS4WQ
         eshrd1ezP5ogqz4xfhGZyGb66DIUeU0LH14FAHyICKHftwP7HzCbQ0aqVJpCfK2QAWgA
         ZbZdbHWyMabJIJvTgFkoOtrWXoOMc1seJpBi8vBpDSwJxdwixI9J8QAsLJ2ZVWblKrF6
         WjMlA1nRKY5wUCDzoW1f/NJcjiqct1+ZKpM0rICHMaGFUI6oLoK8YtBi0UBh07DCIcNB
         UQd1YgUAcJTt9JnYMXaV8VCNeL8K3OHZyr0FUnbIv8HUKLFJCEqg88KEgx8E2x3CmXdW
         6hYA==
X-Forwarded-Encrypted: i=1; AJvYcCVjEfNamK2EppnlY3jqvZBrGiawdFVNy2oKiWA79SpQBLtaG6bpgDpFwazIHXTF88+EVM/Yjt23SykLJKc=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwKJO6i1Colm1bwaIkvjbMau7wnUjXGT9vAoSl7OXpP8b7qtSvq
	y655LACEYMVXwzkZDtXooVeVs5SNReZ4Frl0fDXZdWMfT37O43gQmFUk
X-Gm-Gg: AY/fxX5Bp/Si9I8e9DvJDDcvVQYc8O2dAxrJTNBNWrZPeECQIWYAUJH6Ai9342XbsJ0
	2Fb0K6wL7hdApoCzdcfl58lZb3W1VU2o9mikwzTZ8Xcq16JuKhfoskkfMeIdDVR6UsSOdPSpLoF
	rXZtItjyFUNttGDZc1k/cDnmSANV/sIHsl7DFsixcDqL5u+avbmPvVi/KZ5qNjQ5y0nOE8/sbzF
	qxMImqpPrn2odCw2080Sf6ygsFXItn1+lmsdiXQAsGIR8v/lHvUeV1q5d1Ruzvv3M9nsUJm9oRW
	FnHHU4Wk4cAc2uNGWA2iBC4cMHhVQUz3lHVoMS/oauGEkqOoNAKPOigWbwJj/dMVv13MIuNrx/+
	UTcFj0WPSfO9fwoYVpR1Fj0OF+Apnw7czBcyN6O3F14sHl3ysB/kd3im4PGhp8E/sH5SqbuISFf
	jtRbNkgSZmRaIOAdnJ
X-Google-Smtp-Source: AGHT+IGzrC8xHoSohluxl3TB8gicGFdkGjx48ZJyAE+fsjdi1rZJJgtl3YetY/wOPW+z2c4mkNcmfA==
X-Received: by 2002:a17:902:cf03:b0:2a0:bb05:df4f with SMTP id d9443c01a7336-2a0bb05e314mr123346515ad.44.1765986491997;
        Wed, 17 Dec 2025 07:48:11 -0800 (PST)
Received: from dw-tp ([171.76.225.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29eea016ef4sm207003795ad.56.2025.12.17.07.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 07:48:11 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>, Kevin Brodsky <kevin.brodsky@arm.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Andreas Larsson <andreas@gaisler.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, 
	Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>, 
	David Hildenbrand <david@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	David Woodhouse <dwmw2@infradead.org>, "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>, 
	Jann Horn <jannh@google.com>, Juergen Gross <jgross@suse.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Suren Baghdasaryan <surenb@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, Yeoreum Yun <yeoreum.yun@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	sparclinux@vger.kernel.org, xen-devel@lists.xenproject.org, x86@kernel.org
Subject: Re: [PATCH v6 14/14] mm: Add basic tests for lazy_mmu
In-Reply-To: <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
Date: Wed, 17 Dec 2025 21:16:14 +0530
Message-ID: <87a4zhkt6h.ritesh.list@gmail.com>
References: <20251215150323.2218608-1-kevin.brodsky@arm.com> <20251215150323.2218608-15-kevin.brodsky@arm.com> <20251216201403.4647a4f9861d3122ee9e90d7@linux-foundation.org> <f9550d22-8810-4145-aaa8-48961f6ea35e@arm.com> <ca0da7fd-245c-4d52-8f4d-f8fce4717494@arm.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Ryan Roberts <ryan.roberts@arm.com> writes:

> On 17/12/2025 09:26, Kevin Brodsky wrote:
>> On 17/12/2025 05:14, Andrew Morton wrote:
>>> On Mon, 15 Dec 2025 15:03:23 +0000 Kevin Brodsky <kevin.brodsky@arm.com> wrote:
>>>
>>>> Add basic KUnit tests for the generic aspects of the lazy MMU mode:
>>>> ensure that it appears active when it should, depending on how
>>>> enable/disable and pause/resume pairs are nested.
>>> I needed this for powerpc allmodconfig;
>>>
>>> --- a/arch/powerpc/mm/book3s64/hash_tlb.c~mm-add-basic-tests-for-lazy_mmu-fix
>>> +++ a/arch/powerpc/mm/book3s64/hash_tlb.c
>>> @@ -30,6 +30,7 @@
>>>  #include <trace/events/thp.h>
>>>  
>>>  DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
>>> +EXPORT_SYMBOL_GPL(ppc64_tlb_batch);
>>>  
>>>  /*
>>>   * A linux PTE was changed and the corresponding hash table entry
>>> @@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tl
>>>  		flush_hash_range(i, local);
>>>  	batch->index = 0;
>>>  }
>>> +EXPORT_SYMBOL_GPL(__flush_tlb_pending);
>>>  
>>>  void hash__tlb_flush(struct mmu_gather *tlb)
>>>  {
>>> _
>> 
>> Oh indeed I hadn't considered that arch_{enter,leave}_lazy_mmu_mode()
>> refer to those symbols on powerpc... Maybe a bit overkill to export
>> those just for a test module, but I'm not sure there's a good
>> alternative. Forcing LAZY_MMU_MODE_KUNIT_TEST=y is ugly as it would also
>> force KUNIT=y. Alternatively we could depend on !PPC, not pretty either.
>
> Does EXPORT_SYMBOL_IF_KUNIT() help?
>

yes, that make sense. Thanks for the suggestion!
I guess we will need a diff like this in that case -


diff --git a/arch/powerpc/mm/book3s64/hash_tlb.c b/arch/powerpc/mm/book3s64/hash_tlb.c
index fbdeb8981ae7..ec2941cec815 100644
--- a/arch/powerpc/mm/book3s64/hash_tlb.c
+++ b/arch/powerpc/mm/book3s64/hash_tlb.c
@@ -25,11 +25,12 @@
 #include <asm/tlb.h>
 #include <asm/bug.h>
 #include <asm/pte-walk.h>
-
+#include <kunit/visibility.h>
 
 #include <trace/events/thp.h>
 
 DEFINE_PER_CPU(struct ppc64_tlb_batch, ppc64_tlb_batch);
+EXPORT_SYMBOL_IF_KUNIT(ppc64_tlb_batch);
 
 /*
  * A linux PTE was changed and the corresponding hash table entry
@@ -154,6 +155,7 @@ void __flush_tlb_pending(struct ppc64_tlb_batch *batch)
                flush_hash_range(i, local);
        batch->index = 0;
 }
+EXPORT_SYMBOL_IF_KUNIT(__flush_tlb_pending);
 
 void hash__tlb_flush(struct mmu_gather *tlb)
 {
diff --git a/mm/tests/lazy_mmu_mode_kunit.c b/mm/tests/lazy_mmu_mode_kunit.c
index 2720eb995714..340d7cda9096 100644
--- a/mm/tests/lazy_mmu_mode_kunit.c
+++ b/mm/tests/lazy_mmu_mode_kunit.c
@@ -69,3 +69,4 @@ kunit_test_suite(lazy_mmu_mode_test_suite);
 
 MODULE_DESCRIPTION("Tests for the lazy MMU mode");
 MODULE_LICENSE("GPL");
+MODULE_IMPORT_NS("EXPORTED_FOR_KUNIT_TESTING");


-ritesh


Return-Path: <linuxppc-dev+bounces-2384-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE789A44A9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Oct 2024 19:30:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XVWv95wb5z3bs0;
	Sat, 19 Oct 2024 04:30:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729272645;
	cv=none; b=S7qWuwRH+VU2sHNKDn+67h/NEBp+lCnYaL9Z+4eS6HGhzQEfQVBSZJQyw2L4ZWuoQzK9iYjIOcgrIphvQsYQoWhejtyxA4LmK4PqRftuWeDUqwpYZlKRIDp1uE9vsrWq4sA2FS8AT0JE0BZFldKk87L/wb1UPok23dywbrXStT44+sZ82qAYxnEdlRWYjm/h/lpav/a1nI5eMFcllXLUpmULitPL4CSbaK8hA+4SzliJg+0KMBLQ/yJJKRDB4WTm+D2txmDfPZs3deVdXkEAiuAjJo7izV64tzBUbby7ohAiyO2EN1uQ7UznXNf2fXZo4wdZg1zXedfgRr/t+84PoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729272645; c=relaxed/relaxed;
	bh=Jw41Uo4vlK/av70SyuzQ/EcBacKxJaXG8uVQm7tNSaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NrbynMK1yWVeyYoVPZEpHmyhu6djzm0Qg7LI53NErXc5OEIt80v0LCs9+fXONg/ldzkQapzj2STWHROMZhEP8rCDDTakFGVeDYGpN+xplac+t+IEwHYc43BliArqDV0LllD4NAPlg55F5AAwWh1cxM6MnY4UztqNFmqwMR6cDRfph6i8GEB5tsyVdOeYslw2KAE4BTYtjv0vPeKKVujN1fo5/kU9GsH5Q6nmNZtTHG8+QPj1b/ixbmfOH/snbHsqdvc0mEDTSSCBGxfO/uUiVRjr3fkT7ZAkKqkH33yi0WiZ0/10RXJsIqpX1bkVPGDr39XD0Z3qOm+9oc2BNBPP6A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BhtARTnC; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BhtARTnC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XVWv86PCfz3bqW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Oct 2024 04:30:44 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-71e5130832aso1706156b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729272641; x=1729877441; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jw41Uo4vlK/av70SyuzQ/EcBacKxJaXG8uVQm7tNSaA=;
        b=BhtARTnC5qoKixqr7JJvtlX8mYOEXpwWOhMLrJuZOrjGB/0wSogDhue7jYOCiVpr5+
         OUCZkeT6j3HQrdVDYyNWN4gCL1meN45tKb2b/ecgtZDnswsOYWbX/Zzgg0yApjLxU2L+
         z+SK4gz9wM3mM9Pk7vG3frWT+bhgSzAhs5gFuFK6QJ3eajRwIJ6gHzHHKh0Ri5sg1vnE
         H5FlEb0ooBYyM6O4BLqkyN9DTA7FoywivvB0rBX7QxM5Q3IKY6sArd5g68i8pUDO5+m6
         IQTsKDJOdrrkzwo38EU72GZW+WfSVO0D/7GIW28NSbdBhfPIwvnaIU/nbYswPEQ+KDmD
         8YbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729272641; x=1729877441;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jw41Uo4vlK/av70SyuzQ/EcBacKxJaXG8uVQm7tNSaA=;
        b=o2Qv6pBhXExn1bDQ7xN9gCS3qVrjsjpjPDT1XqokABATQfJ4Lyos8X4ManbWlR5paf
         KjBJXffl1vxgIYDAn4m2UkYH1Vj61m0ATGBKBdPXRT5bYSmf9XjqtN2fTS8/RwvsEKob
         8cvMmsQo5e7wcXeKi4ySZB7pApTvMfkKIqEfX20+y4QqUPnJTUhiGuGYqpxRklHxb49K
         bYUPfmrA+x5P1784GNrU5oXobQQAEy2DOM5Bv/+TkbIFtLHfAeahUw7wMS+7h+80qFiE
         6qReOWf7U2aSff0CFGbki4Iyj+jALcwH7hyL9RqdIX/ZAYq81Qt+fqMW6DSmHT2FLMAS
         TTcA==
X-Gm-Message-State: AOJu0YwYjs4kWhBSRs3Uay1xpdizb8hrhxJldP3z0MDCV8t/kGNUZteH
	dY53kRAEBq66JkNekw0GY+tCS5bD7tEUPB0n/OVBwwMcJsyow78RDvqsQUeJ
X-Google-Smtp-Source: AGHT+IHA05XWUstb450eeCq2YkOYG3UKP/gDh/dgZ6794ND1I3UZATF+JDsVTkAs4xXtweTSIyj5Uw==
X-Received: by 2002:aa7:86da:0:b0:71e:b1dc:f255 with SMTP id d2e1a72fcca58-71eb1dcf5e7mr118528b3a.9.1729272641491;
        Fri, 18 Oct 2024 10:30:41 -0700 (PDT)
Received: from dw-tp.ibmuc.com ([171.76.80.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ea3311f51sm1725242b3a.36.2024.10.18.10.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 10:30:40 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	Marco Elver <elver@google.com>,
	Alexander Potapenko <glider@google.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH v3 04/12] book3s64/hash: Add hash_debug_pagealloc_add_slot() function
Date: Fri, 18 Oct 2024 22:59:45 +0530
Message-ID: <026f0aaa1dddd89154dc8d20ceccfca4f63ccf79.1729271995.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1729271995.git.ritesh.list@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This adds hash_debug_pagealloc_add_slot() function instead of open
coding that in htab_bolt_mapping(). This is required since we will be
separating kfence functionality to not depend upon debug_pagealloc.

No functionality change in this patch.

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index fb2f717e9e74..de3cabd66812 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -328,6 +328,14 @@ static void kernel_unmap_linear_page(unsigned long vaddr, unsigned long lmi)
 				     mmu_kernel_ssize, 0);
 }
 
+static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot)
+{
+	if (!debug_pagealloc_enabled())
+		return;
+	if ((paddr >> PAGE_SHIFT) < linear_map_hash_count)
+		linear_map_hash_slots[paddr >> PAGE_SHIFT] = slot | 0x80;
+}
+
 int hash__kernel_map_pages(struct page *page, int numpages, int enable)
 {
 	unsigned long flags, vaddr, lmi;
@@ -353,6 +361,7 @@ int hash__kernel_map_pages(struct page *page, int numpages,
 {
 	return 0;
 }
+static inline void hash_debug_pagealloc_add_slot(phys_addr_t paddr, int slot) {}
 #endif /* CONFIG_DEBUG_PAGEALLOC */
 
 /*
@@ -513,9 +522,7 @@ int htab_bolt_mapping(unsigned long vstart, unsigned long vend,
 			break;
 
 		cond_resched();
-		if (debug_pagealloc_enabled() &&
-			(paddr >> PAGE_SHIFT) < linear_map_hash_count)
-			linear_map_hash_slots[paddr >> PAGE_SHIFT] = ret | 0x80;
+		hash_debug_pagealloc_add_slot(paddr, ret);
 	}
 	return ret < 0 ? ret : 0;
 }
-- 
2.46.0



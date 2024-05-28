Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF308D5573
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:33:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IeBdV/9j;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZOfuseJ9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1Hv10CFz3dLc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:33:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IeBdV/9j;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZOfuseJ9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=echanude@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vphg53Yk4z3wFj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 05:00:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716922842;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EroyhAMtYZlwFiF+i06GpFh0h6zXLI4AvXcFdjRTODk=;
	b=IeBdV/9jcqGNNyYozKP3D1mIkx/7YJEIIxvsd4/XHcIy2I5Qd/Qk2YIjGDR7ZGwPg7mpE1
	EDH1JHZ8lfhj8sScrZKL82jQuVOrYqtAIjDwZu0WOGXI7wlUVjjfqT8KIR/RORlRmHK50k
	q1FveX9b6r5IbnXiB9CCpckrOnNy47k=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716922843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=EroyhAMtYZlwFiF+i06GpFh0h6zXLI4AvXcFdjRTODk=;
	b=ZOfuseJ9EDGaYH/iCWacWsbvyQT4BsRG4OxXWHS34QJd8JBOquotwDIL2xEqQcSZRCbJrd
	iBTLGsjmYgxd7oag/b5cGiyAFYnWdRI/vRiKfF02zI41iVZtRfRuIfknd1+GuFx7cskBnA
	2/YZ9Fdwp2nAqVsO3Y1Aak85RKxXeN0=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-249-fOmUSTJPNZ26ethS8BG6NA-1; Tue, 28 May 2024 15:00:41 -0400
X-MC-Unique: fOmUSTJPNZ26ethS8BG6NA-1
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43fc7d851f5so12374241cf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 12:00:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716922838; x=1717527638;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EroyhAMtYZlwFiF+i06GpFh0h6zXLI4AvXcFdjRTODk=;
        b=T8fl+J3vX4V78Fj04NHqkXWIYtty4SqUYOKuRb1bDGQ43AVIp7Y9yavOmCT6Wo7D+B
         i08Twd+RbgjniVgoowzLNlMwhn16ZyJnRTIC9kJMFkgXNvppqG7dz5TnxTqrf44s/xpg
         CVor9knXNDO1EvX8UM9hE/AAEqdXZDVxn0f7yppWTtQLfP0SHaPJSa9tY5upuvfF4hzL
         vt/bNhEGBUqCIhbqt9aKdyg361sjXaBU5fO3dXI9p8hHQ76SGR09EZxFkgyiIQP56r3W
         PuMc9mkA1KNk2J7HYNBnWI8G9eysElcau5Cc8dq84RpcnKdnG9b+5y0UrfqWUxvF+ge9
         sfEA==
X-Forwarded-Encrypted: i=1; AJvYcCWbAgZjUrrD8eWPJBujefSvarApr3yuHGYNaIXXUs35UQUQeZimJotOAxFGDXWrdeh/OT2RKUGI85Kd7VvcKc6tfuYZEtr/+DYVuXhasw==
X-Gm-Message-State: AOJu0YydR7YudfkjAaF5L3zobPVLwO8pfsIrL5bQrbaifRSIBYSeh+ld
	lUb6HZSOWtFjM9uiKqzcO3Z9yYjSLuulq7NFaIL1SvoklwAuSGt14vYeeUndh+sUgyyds+FoF7E
	5prha5ctXrtYdej9qHvomqU303v22/0D785W0W/fo7fiVzWTgms49lG6OZoaWuI8=
X-Received: by 2002:a05:622a:10a:b0:43e:34ea:80ee with SMTP id d75a77b69052e-43fb0e8d809mr134383941cf.29.1716922837921;
        Tue, 28 May 2024 12:00:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLHIs0G4ODwLtaTgMc9fP7BM4N2EDamkPS2f5rSvXhQ/RuodqmrywBv65gQp5ZlO5A4PV4Ug==
X-Received: by 2002:a05:622a:10a:b0:43e:34ea:80ee with SMTP id d75a77b69052e-43fb0e8d809mr134383451cf.29.1716922837199;
        Tue, 28 May 2024 12:00:37 -0700 (PDT)
Received: from localhost (pool-71-184-142-128.bstnma.fios.verizon.net. [71.184.142.128])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-43fb17f69ddsm44981881cf.41.2024.05.28.12.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:00:36 -0700 (PDT)
From: Eric Chanudet <echanude@redhat.com>
To: Dave Hansen <dave.hansen@linux.intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nick Piggin <npiggin@gmail.com>
Subject: [PATCH v3] mm/mm_init: use node's number of cpus in deferred_page_init_max_threads
Date: Tue, 28 May 2024 14:54:58 -0400
Message-ID: <20240528185455.643227-4-echanude@redhat.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: linux-s390@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Eric Chanudet <echanude@redhat.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When DEFERRED_STRUCT_PAGE_INIT=y, use a node's cpu count as maximum
thread count for the deferred initialization of struct pages via padata.
This should result in shorter boot times for these configurations by
going through page_alloc_init_late() faster as systems tend not to be
under heavy load that early in the bootstrap.

Only x86_64 does that now. Make it archs agnostic when
DEFERRED_STRUCT_PAGE_INIT is set. With the default defconfigs, that
includes powerpc and s390.

It used to be so before offering archs to override the function for
tuning with commit ecd096506922 ("mm: make deferred init's max threads
arch-specific").

Setting DEFERRED_STRUCT_PAGE_INIT and testing on a few arm64 platforms
shows faster deferred_init_memmap completions:
|         | x13s        | SA8775p-ride | Ampere R137-P31 | Ampere HR330 |
|         | Metal, 32GB | VM, 36GB     | VM, 58GB        | Metal, 128GB |
|         | 8cpus       | 8cpus        | 8cpus           | 32cpus       |
|---------|-------------|--------------|-----------------|--------------|
| threads |  ms     (%) | ms       (%) |  ms         (%) |  ms      (%) |
|---------|-------------|--------------|-----------------|--------------|
| 1       | 108    (0%) | 72      (0%) | 224        (0%) | 324     (0%) |
| cpus    |  24  (-77%) | 36    (-50%) |  40      (-82%) |  56   (-82%) |

Michael Ellerman on a powerpc machine (1TB, 40 cores, 4KB pages) reports
faster deferred_init_memmap from 210-240ms to 90-110ms between nodes.

Signed-off-by: Eric Chanudet <echanude@redhat.com>
Tested-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

---
- v1: https://lore.kernel.org/linux-arm-kernel/20240520231555.395979-5-echanude@redhat.com
- Changes since v1:
 - Make the generic function return the number of cpus of the node as
   max threads limit instead overriding it for arm64.
 - Drop Baoquan He's R-b on v1 since the logic changed.
 - Add CCs according to patch changes (ppc and s390 set
   DEFERRED_STRUCT_PAGE_INIT by default).

- v2: https://lore.kernel.org/linux-arm-kernel/20240522203758.626932-4-echanude@redhat.com/
- Changes since v2:
 - deferred_page_init_max_threads returns unsigned and use max instead
   of max_t.
 - Make deferred_page_init_max_threads static since there are no more
   override.
 - Rephrase description.
 - Add T-b and report from Michael Ellerman.

 arch/x86/mm/init_64.c    | 12 ------------
 include/linux/memblock.h |  2 --
 mm/mm_init.c             |  5 ++---
 3 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
index 7e177856ee4f..adec42928ec1 100644
--- a/arch/x86/mm/init_64.c
+++ b/arch/x86/mm/init_64.c
@@ -1354,18 +1354,6 @@ void __init mem_init(void)
 	preallocate_vmalloc_pages();
 }
 
-#ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
-int __init deferred_page_init_max_threads(const struct cpumask *node_cpumask)
-{
-	/*
-	 * More CPUs always led to greater speedups on tested systems, up to
-	 * all the nodes' CPUs.  Use all since the system is otherwise idle
-	 * now.
-	 */
-	return max_t(int, cpumask_weight(node_cpumask), 1);
-}
-#endif
-
 int kernel_set_to_readonly;
 
 void mark_rodata_ro(void)
diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index e2082240586d..40c62aca36ec 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -335,8 +335,6 @@ void __next_mem_pfn_range_in_zone(u64 *idx, struct zone *zone,
 	for (; i != U64_MAX;					  \
 	     __next_mem_pfn_range_in_zone(&i, zone, p_start, p_end))
 
-int __init deferred_page_init_max_threads(const struct cpumask *node_cpumask);
-
 #endif /* CONFIG_DEFERRED_STRUCT_PAGE_INIT */
 
 /**
diff --git a/mm/mm_init.c b/mm/mm_init.c
index f72b852bd5b8..acfeba508796 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2122,11 +2122,10 @@ deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
 	}
 }
 
-/* An arch may override for more concurrency. */
-__weak int __init
+static unsigned int __init
 deferred_page_init_max_threads(const struct cpumask *node_cpumask)
 {
-	return 1;
+	return max(cpumask_weight(node_cpumask), 1U);
 }
 
 /* Initialise remaining memory on a node */
-- 
2.44.0


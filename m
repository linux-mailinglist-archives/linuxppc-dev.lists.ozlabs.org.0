Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F72A8D554F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:22:05 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMdtV+A/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMdtV+A/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr12L3TRjz3dBX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:22:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMdtV+A/;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=JMdtV+A/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=echanude@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vl3q54DCGz3gFm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 07:10:08 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716412203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BFrd5ebkEcX4DAl9U00OWoi+E1totBiZiszJ1VoHyFU=;
	b=JMdtV+A/CsFmDCX/N3nqEhHf095oJQs0RPfNBfbjsFstzE4kJFsUQEcqAIiD+FJlxxQrkK
	4fi+LAH2mMx2lYopIVyfSF2vaFvB62RfXbN3TrT6wa8+mG7eTLzITKcKMt/aHBDH+/9KVH
	lWNrVv709muZ4F1KwOZMo1iEgW6uZ68=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716412203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BFrd5ebkEcX4DAl9U00OWoi+E1totBiZiszJ1VoHyFU=;
	b=JMdtV+A/CsFmDCX/N3nqEhHf095oJQs0RPfNBfbjsFstzE4kJFsUQEcqAIiD+FJlxxQrkK
	4fi+LAH2mMx2lYopIVyfSF2vaFvB62RfXbN3TrT6wa8+mG7eTLzITKcKMt/aHBDH+/9KVH
	lWNrVv709muZ4F1KwOZMo1iEgW6uZ68=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-h2_abTYVN0ShzMolc-DPHQ-1; Wed, 22 May 2024 17:10:01 -0400
X-MC-Unique: h2_abTYVN0ShzMolc-DPHQ-1
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ab906db8e4so57476d6.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 14:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716412201; x=1717017001;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BFrd5ebkEcX4DAl9U00OWoi+E1totBiZiszJ1VoHyFU=;
        b=igxUcL3q/x/fgfhH8IvjoaXEk5e6I8w9DMtvHj3KyoOI+nSgk7EmINoLJ3PW23IW1w
         XW7QBdpCAstOljcAOejSVBGki4yAfApmmaC6Jl3OpvzI6Hew09NhfHVs3h+xTCOpekUR
         3Um57vlWpiWhqXWcCEQ9uWp+5h25pEVPqNm+ToR6KU3sEXW5jJ188p7eIyIu5swH4ITR
         5l1fYUSIZoZsa4uUaB8mcS/y87AtE3AfpPyhIFAOkkItnx4gdSMMkm6mQ/gnRbdyQG4D
         1++Qy8eEg30h+hFjtaRjceQyIbvWeHkdN1f761FJa5m17WxlB3MskD0pyiGtbFss0NXi
         KaNQ==
X-Forwarded-Encrypted: i=1; AJvYcCV8rb1UWi0QLCPFAe6B6SuDIvxip7KHIwHWZWuA/tTlBnL7/lv9CsjaQY0Cauy9sakCSCzwjNm3oShv3PU8NpaZoODvNRRfMRKX8vCd1g==
X-Gm-Message-State: AOJu0YyP2Jog3UFA118bmCTKNXBLeD+apdKYkAlrNNGZ+YYtJGhatzzT
	KJc+WXI4odzQppuotkEhLwVw4HnOGb0qYlNpuBpH8r7+DIFqFFPp2DG4zjZiy035dAtdlEf4jha
	aFmrYUqu1wyfGqjgxoB2HuQyfGM5ZYVhATW0TJ7Nn1NcGPp5eAYg/tKo/zcGS4lg=
X-Received: by 2002:a05:6214:5b8a:b0:6a3:48af:8e82 with SMTP id 6a1803df08f44-6ab80900d8dmr35624576d6.46.1716412200537;
        Wed, 22 May 2024 14:10:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFReHW/gidOrXfSOPUsmAujbeGWtlLPFc/p6bBtQ535MfveRlLhqKqI7KsQ5F/jf8a4uc7Dvw==
X-Received: by 2002:a05:6214:5b8a:b0:6a3:48af:8e82 with SMTP id 6a1803df08f44-6ab80900d8dmr35624146d6.46.1716412199899;
        Wed, 22 May 2024 14:09:59 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6a35d0bfeabsm73204686d6.2.2024.05.22.14.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 14:09:59 -0700 (PDT)
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
Subject: [PATCH v2] mm/mm_init: use node's number of cpus in deferred_page_init_max_threads
Date: Wed, 22 May 2024 16:38:01 -0400
Message-ID: <20240522203758.626932-4-echanude@redhat.com>
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

x86_64 is already using the node's cpu as maximum threads. Make that the
default for all archs setting DEFERRED_STRUCT_PAGE_INIT.

This returns to the behavior prior making the function arch-specific
with commit ecd096506922 ("mm: make deferred init's max threads
arch-specific").

Signed-off-by: Eric Chanudet <echanude@redhat.com>

---
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

- v1: https://lore.kernel.org/linux-arm-kernel/20240520231555.395979-5-echanude@redhat.com
- Changes since v1:
 - Make the generic function return the number of cpus of the node as
   max threads limit instead overriding it for arm64.
- Drop Baoquan He's R-b on v1 since the logic changed.
- Add CCs according to patch changes (ppc and s390 set
  DEFERRED_STRUCT_PAGE_INIT by default).

 arch/x86/mm/init_64.c | 12 ------------
 mm/mm_init.c          |  2 +-
 2 files changed, 1 insertion(+), 13 deletions(-)

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
diff --git a/mm/mm_init.c b/mm/mm_init.c
index f72b852bd5b8..e0023aa68555 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -2126,7 +2126,7 @@ deferred_init_memmap_chunk(unsigned long start_pfn, unsigned long end_pfn,
 __weak int __init
 deferred_page_init_max_threads(const struct cpumask *node_cpumask)
 {
-	return 1;
+	return max_t(int, cpumask_weight(node_cpumask), 1);
 }
 
 /* Initialise remaining memory on a node */
-- 
2.44.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E808998A3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:56:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=beY7OxXA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sml4K1Lz3wHF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:56:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=beY7OxXA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22a; helo=mail-oi1-x22a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sLg2RVJz3vYG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:47 +1100 (AEDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3c3e2e18db7so1152578b6e.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306265; x=1712911065; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ecQCAwbQxkkxUlhSFJlIXC1kR8UrvIOTCdxcEI2+MAs=;
        b=beY7OxXAyLRmq8c7/+C6xkd+vytoeku4iNunQY29pOQBX9t6OLdEy4kop0QKbnpNU6
         ylSUOOIuTmLzAmrxmaRmMB3RQsSbqVeQ+Q0OUypd+ewL2w0F7AEYZfjfHvu9xfVb7YTy
         kHgd52M24u3iBDKvwk5sHVM+rp8LqufBK1TfaTm1kIf7bSNfL0M5FV3FS4PYbebwAuY3
         A4v1tHFeTvg6ZlC58idoWMFPM1sIZ8wSY8S7xLToeZjnDunQNQFqcOYq2z6c7JVtmqfK
         AzqO40DkyzodYNBSXWXOIB1J4drA4nJCXtTjw86d69PDVNVcW1KesWHsvGn8HOXykQAc
         bc0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306265; x=1712911065;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ecQCAwbQxkkxUlhSFJlIXC1kR8UrvIOTCdxcEI2+MAs=;
        b=NJGZgsf0oikQEIGj945v7f8GWmfwd+V9berhLHeUjhiLHdUL9pfiCYwsn9PDe2wznF
         ADAFhIRCiO/oZoAdQLVv9eyOLvKY8WQ9e/p/CjJ/t92MQ/5bgP6KwRPLItL8RN7FiT0T
         GMaaAK33dO1gA6BTbJ/JgMPWWRuGYFqZZBcerbxd5bXBNvqucUfG4Q32hARjHX8qYrBG
         RwcxwlGBmhVaVYPiUItospiXVwpE3wAimVBcKq7y6EC1vL9KLTfXLrIcnFO9OMV/LOMW
         TsggFJz+gw9xwn09qPHfFmZXPG2P4qXQT5gs/toEjAu5oPCoZGJ5LgH8vcqTrtNSgcWU
         jQjQ==
X-Forwarded-Encrypted: i=1; AJvYcCW/YDPoq7E3qF55ZVKWUxXepDa1BVK6+tsOKmrIfEX3wZKS93yBf5yViPUmC7/B7/csjO0XMc39aH+xj7v6Yz3owSiJSPt16sdNbZ74TA==
X-Gm-Message-State: AOJu0YwYH4UUuz74wJJJXVQ69UiOBlaWjo17VSzIPQEq36FFXnAI3zkk
	Pnk6p/PgRgrlD1sc/vfc7tC50LSsrHzIbwK6gQEYGOhTw3UFfrYYKQSPpAYm
X-Google-Smtp-Source: AGHT+IGW29UYKqDLZAk+yL4v7/50eGF/rvzg/Lhhx6XRFsz75OKULY49heFMhhxfjo56f8CDu05fmw==
X-Received: by 2002:aca:f13:0:b0:3c4:f89f:2a8e with SMTP id 19-20020aca0f13000000b003c4f89f2a8emr780399oip.44.1712306265363;
        Fri, 05 Apr 2024 01:37:45 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:37:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 28/35] common/sieve: Use vmalloc.h for setup_mmu definition
Date: Fri,  5 Apr 2024 18:35:29 +1000
Message-ID: <20240405083539.374995-29-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, =?UTF-8?q?Nico=20B=C3=B6hr?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There is no good reason to put setup_vm in libcflat.h when it's
defined in vmalloc.h.

Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Janosch Frank <frankja@linux.ibm.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: Nico Böhr <nrb@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: kvm@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Acked-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 common/sieve.c         | 1 +
 lib/libcflat.h         | 2 --
 lib/s390x/io.c         | 1 +
 lib/s390x/uv.h         | 1 +
 lib/x86/vm.h           | 1 +
 s390x/mvpg.c           | 1 +
 s390x/selftest.c       | 1 +
 x86/pmu.c              | 1 +
 x86/pmu_lbr.c          | 1 +
 x86/vmexit.c           | 1 +
 x86/vmware_backdoors.c | 1 +
 11 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/common/sieve.c b/common/sieve.c
index 8150f2d98..8fe05ef13 100644
--- a/common/sieve.c
+++ b/common/sieve.c
@@ -1,5 +1,6 @@
 #include "alloc.h"
 #include "libcflat.h"
+#include "vmalloc.h"
 
 static int sieve(char* data, int size)
 {
diff --git a/lib/libcflat.h b/lib/libcflat.h
index 700f43527..8c8dd0286 100644
--- a/lib/libcflat.h
+++ b/lib/libcflat.h
@@ -152,8 +152,6 @@ do {									\
 void binstr(unsigned long x, char out[BINSTR_SZ]);
 void print_binstr(unsigned long x);
 
-extern void setup_vm(void);
-
 #endif /* !__ASSEMBLY__ */
 
 #define SZ_256			(1 << 8)
diff --git a/lib/s390x/io.c b/lib/s390x/io.c
index fb7b7ddaa..2b28ccaa0 100644
--- a/lib/s390x/io.c
+++ b/lib/s390x/io.c
@@ -10,6 +10,7 @@
  */
 #include <libcflat.h>
 #include <argv.h>
+#include <vmalloc.h>
 #include <asm/spinlock.h>
 #include <asm/facility.h>
 #include <asm/sigp.h>
diff --git a/lib/s390x/uv.h b/lib/s390x/uv.h
index 286933caa..00a370410 100644
--- a/lib/s390x/uv.h
+++ b/lib/s390x/uv.h
@@ -4,6 +4,7 @@
 
 #include <sie.h>
 #include <asm/pgtable.h>
+#include <vmalloc.h>
 
 bool uv_os_is_guest(void);
 bool uv_os_is_host(void);
diff --git a/lib/x86/vm.h b/lib/x86/vm.h
index 4b714bad7..cf39787aa 100644
--- a/lib/x86/vm.h
+++ b/lib/x86/vm.h
@@ -2,6 +2,7 @@
 #define _X86_VM_H_
 
 #include "processor.h"
+#include "vmalloc.h"
 #include "asm/page.h"
 #include "asm/io.h"
 #include "asm/bitops.h"
diff --git a/s390x/mvpg.c b/s390x/mvpg.c
index 296338d4f..a0cfc575a 100644
--- a/s390x/mvpg.c
+++ b/s390x/mvpg.c
@@ -15,6 +15,7 @@
 #include <asm/page.h>
 #include <asm/facility.h>
 #include <asm/mem.h>
+#include <vmalloc.h>
 #include <alloc_page.h>
 #include <bitops.h>
 #include <hardware.h>
diff --git a/s390x/selftest.c b/s390x/selftest.c
index 92ed4e5d3..3eaae9b06 100644
--- a/s390x/selftest.c
+++ b/s390x/selftest.c
@@ -9,6 +9,7 @@
 #include <libcflat.h>
 #include <util.h>
 #include <alloc.h>
+#include <vmalloc.h>
 #include <asm/interrupt.h>
 #include <asm/barrier.h>
 #include <asm/pgtable.h>
diff --git a/x86/pmu.c b/x86/pmu.c
index 47a1a602a..7062c1ad9 100644
--- a/x86/pmu.c
+++ b/x86/pmu.c
@@ -6,6 +6,7 @@
 #include "x86/apic.h"
 #include "x86/desc.h"
 #include "x86/isr.h"
+#include "vmalloc.h"
 #include "alloc.h"
 
 #include "libcflat.h"
diff --git a/x86/pmu_lbr.c b/x86/pmu_lbr.c
index 40b63fa3d..c6f010847 100644
--- a/x86/pmu_lbr.c
+++ b/x86/pmu_lbr.c
@@ -2,6 +2,7 @@
 #include "x86/processor.h"
 #include "x86/pmu.h"
 #include "x86/desc.h"
+#include "vmalloc.h"
 
 #define N 1000000
 
diff --git a/x86/vmexit.c b/x86/vmexit.c
index eb5d3023a..48a38f60f 100644
--- a/x86/vmexit.c
+++ b/x86/vmexit.c
@@ -1,6 +1,7 @@
 #include "libcflat.h"
 #include "acpi.h"
 #include "smp.h"
+#include "vmalloc.h"
 #include "pci.h"
 #include "x86/vm.h"
 #include "x86/desc.h"
diff --git a/x86/vmware_backdoors.c b/x86/vmware_backdoors.c
index bc1002056..f8cf7ecb1 100644
--- a/x86/vmware_backdoors.c
+++ b/x86/vmware_backdoors.c
@@ -6,6 +6,7 @@
 #include "x86/desc.h"
 #include "x86/isr.h"
 #include "alloc.h"
+#include "vmalloc.h"
 #include "setjmp.h"
 #include "usermode.h"
 #include "fault_test.h"
-- 
2.43.0


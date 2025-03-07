Return-Path: <linuxppc-dev+bounces-6799-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B54D9A56375
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Mar 2025 10:19:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z8LM62nZcz2xQ6;
	Fri,  7 Mar 2025 20:18:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::b7"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741339138;
	cv=none; b=m4TPfs12Ga0d2CtlCb3HPthlOsdwDFhj91BDyTJt4Gy5zal3IWWZW1Qt2k6zzJc/okS8M9vS0c/wrzgE5+mV+FbHaoz5TlHSB7W7KSRjq9KxP3cnnazIF1b8NTFTUmQ6nvcBdhkyKBczPsulunVuV2wYWaCtzsAwDuJ6cvM89dCpiQ49uhO2iIdFmn7aU/I15nKFVrbsSKsR5q83OrRnNQdAw1C8OHAAaAe3ADU4nk9JUBoXPlP0Dj3UGzbMRV7+sut+AXuhj/Wv8EXutwTwHlQVsaMqA6RC8JyBXLcEzbth/aLAY4U7AHAAQYHveEY0IAdSlUan38bg6ZjoKbZndg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741339138; c=relaxed/relaxed;
	bh=y2FBvybRQ7hGNDuactnNvnWlcdQr0dcjdCw8K+WSDT8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E6lll1F9N/vFTqxqvW3yxxs1tR4X6GZV1xfPnkunpS9bzBPpqCUgjOWVldii9ki12Or2pjRlgeO+a1oxx3yXRuM/KNuSi7Bj8cTr/3k2K1yBtSsNf/8qjLqtklAIH8YtyWlYTk81sAnU/NM+1AD/jrh1SJeh7A+gmJknd6Za26kEYFOsVwV2FiWi7t31UlltbYzuSssdy5qrnNUt+RosMlXq36/cC/dWP5eW7qb/T0G2WB/3xwJKE/gH3St+zB3Ux66TGZ9DWBYxzRW94v33bfh9UWYi+GS6649tPzBJ/YC288ZkoV0JKYYPIcMOPZ6Mx8ejXVXSUsxotdJNfoic+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v/um14Qj; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::b7; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=v/um14Qj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::b7; helo=out-183.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [IPv6:2001:41d0:203:375::b7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z8LM36Rsvz2x9g
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 20:18:55 +1100 (AEDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1741339111;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=y2FBvybRQ7hGNDuactnNvnWlcdQr0dcjdCw8K+WSDT8=;
	b=v/um14QjntUhD9/+RjAPoAqg5hVIFWfCDpaGuI3rZaVkVpnzjZ4cpDc2xZ3mkeysr6W9z2
	xbw+4yumPwu7bH4NmlPTKPqXmnDnAh2JsHoY5L/yMVAZYEQMBt0P+TSM4mxRcP6MI3jdoT
	lkxLHe4Zyn/2jMILuyMorKlQiFsHWWQ=
From: Andrew Jones <andrew.jones@linux.dev>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev,
	kvm-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org
Cc: pbonzini@redhat.com,
	thuth@redhat.com,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	lvivier@redhat.com,
	frankja@linux.ibm.com,
	imbrenda@linux.ibm.com,
	nrb@linux.ibm.com
Subject: [kvm-unit-tests PATCH v2] Makefile: Use CFLAGS in cc-option
Date: Fri,  7 Mar 2025 10:18:29 +0100
Message-ID: <20250307091828.57933-2-andrew.jones@linux.dev>
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
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

When cross compiling with clang we need to specify the target in
CFLAGS and cc-option will fail to recognize target-specific options
without it. Add CFLAGS to the CC invocation in cc-option.

The introduction of the realmode_bits variable is necessary to
avoid make failing to build x86 due to CFLAGS referencing itself.

Signed-off-by: Andrew Jones <andrew.jones@linux.dev>
---
v2:
 - Fixed x86 builds with the realmode_bits variable

 Makefile            | 2 +-
 x86/Makefile.common | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 78352fced9d4..9dc5d2234e2a 100644
--- a/Makefile
+++ b/Makefile
@@ -21,7 +21,7 @@ DESTDIR := $(PREFIX)/share/kvm-unit-tests/
 
 # cc-option
 # Usage: OP_CFLAGS+=$(call cc-option, -falign-functions=0, -malign-functions=0)
-cc-option = $(shell if $(CC) -Werror $(1) -S -o /dev/null -xc /dev/null \
+cc-option = $(shell if $(CC) $(CFLAGS) -Werror $(1) -S -o /dev/null -xc /dev/null \
               > /dev/null 2>&1; then echo "$(1)"; else echo "$(2)"; fi ;)
 
 libcflat := lib/libcflat.a
diff --git a/x86/Makefile.common b/x86/Makefile.common
index 0b7f35c8de85..e97464912e28 100644
--- a/x86/Makefile.common
+++ b/x86/Makefile.common
@@ -98,6 +98,7 @@ tests-common = $(TEST_DIR)/vmexit.$(exe) $(TEST_DIR)/tsc.$(exe) \
 ifneq ($(CONFIG_EFI),y)
 tests-common += $(TEST_DIR)/realmode.$(exe) \
 		$(TEST_DIR)/la57.$(exe)
+realmode_bits := $(if $(call cc-option,-m16,""),16,32)
 endif
 
 test_cases: $(tests-common) $(tests)
@@ -108,7 +109,7 @@ $(TEST_DIR)/realmode.elf: $(TEST_DIR)/realmode.o
 	$(LD) -m elf_i386 -nostdlib -o $@ \
 	      -T $(SRCDIR)/$(TEST_DIR)/realmode.lds $^
 
-$(TEST_DIR)/realmode.o: bits = $(if $(call cc-option,-m16,""),16,32)
+$(TEST_DIR)/realmode.o: bits = $(realmode_bits)
 
 $(TEST_DIR)/access_test.$(bin): $(TEST_DIR)/access.o
 
-- 
2.48.1



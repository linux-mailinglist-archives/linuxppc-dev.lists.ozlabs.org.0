Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE89A904A23
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 06:43:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YXHTi8Yo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzXwz2fcHz3fqy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 14:43:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=YXHTi8Yo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzXwG2s57z3cTp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 14:42:52 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1f6fada63a6so28461565ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 21:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718167371; x=1718772171; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y8v3v+i8Ggw/AVGwDDCI9JHG5YYl3a/3EDerkme1e7c=;
        b=YXHTi8YoKZoE+sNKhVsd2PKovhrYECgzMSrXzPwEy4zGZtnuhX5JaitslvvR3qShCM
         VDorhH081t56j+pJEibS7C85QGn7YskEvt7JM9QxxToTXdu+tTFDymbR9bAf1J0uRRII
         pahsuZh/Yj5hhSLOnD/5cC12Rx4IjMjKSjuCedDrwgQ70+nHg/w6z9DUbbe70BwXGxGt
         x4AZpQVYtsN792r9PbQKhV2/zNczXDlA+4hr02DUzITCWL4dhFzjggYfndJ2My7yZYaL
         8rwyRBhOXSEVToKkhWAZypox8MEg2KOg9xSpAhGbkDzDZFE+Op9MrGkaCEsDEWBxgjMZ
         ZdHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718167371; x=1718772171;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y8v3v+i8Ggw/AVGwDDCI9JHG5YYl3a/3EDerkme1e7c=;
        b=A9oRPN1pVoj+7gzoMmzcU+iryzPjnc7XqsRBk5q7tMLwyCfCXHvJzyiDH9sI6rheRm
         7uG2T9c1NM4jSMIBun6GcpYaHyyxYqFskFsqA3DAf0U6WT5oxQfLBnzdAmyjjwso4k7T
         feJwrX3ChQ8DfrCjBDDmi2AbKsMZj74/Axb+2FRnp+1Kc523xNH8e/9c1/WfZSISPguU
         En9xYjorIkba0SMTTgsHndyMmMqJGKRxZl8Ms7VwASA6T6W/mH93O+LD+v37prGRdsst
         gALsUoazsRLnc6xGelzmlhJX6cIFKy4jyMmSNBowFFWc18qjn4ZBbAoUZ+bneQU7zGDI
         MyCw==
X-Forwarded-Encrypted: i=1; AJvYcCVg6fggh/JatSvo+hUJdl/fREg02y85KuxS+1W9Y+OPTcAv4L0jasiAqJ9hnwaGx7eaqDNZ20HNpuhinq3wpXHf/tu3BrIhwIG/To2mIQ==
X-Gm-Message-State: AOJu0YwceFkL++lAdzniYznLMR2IbHVLg4E4dQlz06bETilmk1SXLmGe
	Y+DoUstyOeWcoVTJ8LYtNLky8EFe5gRBns7ey4RJ7YTpJlyY/Szb
X-Google-Smtp-Source: AGHT+IHpwHlh4iJRWgbNKg9wzqjgXtSTZ/ZgvwJw6UxQFuG3nQAI47SaA434g24rShYkZX8sK7hePg==
X-Received: by 2002:a17:903:234d:b0:1f7:3d0d:4c8 with SMTP id d9443c01a7336-1f83b569c9amr9508185ad.13.1718167370569;
        Tue, 11 Jun 2024 21:42:50 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f71017b639sm52957535ad.21.2024.06.11.21.42.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 21:42:49 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>,
	kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH] build: retain intermediate .aux.o targets
Date: Wed, 12 Jun 2024 14:42:32 +1000
Message-ID: <20240612044234.212156-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
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
Cc: linux-s390@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arm, powerpc, riscv, build .aux.o targets with implicit pattern rules
in dependency chains that cause them to be made as intermediate files,
which get removed when make finishes. This results in unnecessary
partial rebuilds. If make is run again, this time the .aux.o targets
are not intermediate, possibly due to being made via different
dependencies.

Adding .aux.o files to .PRECIOUS prevents them being removed and solves
the rebuild problem.

s390x does not have the problem because .SECONDARY prevents dependancies
from being built as intermediate. However the same change is made for
s390x, for consistency.

Suggested-by: Marc Hartmayer <mhartmay@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arm/Makefile.common     | 2 +-
 powerpc/Makefile.common | 2 +-
 riscv/Makefile          | 2 +-
 s390x/Makefile          | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arm/Makefile.common b/arm/Makefile.common
index f828dbe01..0b26a92a6 100644
--- a/arm/Makefile.common
+++ b/arm/Makefile.common
@@ -31,7 +31,7 @@ CFLAGS += -O2
 CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
 
 # We want to keep intermediate files
-.PRECIOUS: %.elf %.o
+.PRECIOUS: %.elf %.o %.aux.o
 
 asm-offsets = lib/$(ARCH)/asm-offsets.h
 include $(SRCDIR)/scripts/asm-offsets.mak
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index b98f71c2f..16f14577e 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -30,7 +30,7 @@ CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
 CFLAGS += -Wa,-mregnames
 
 # We want to keep intermediate files
-.PRECIOUS: %.o
+.PRECIOUS: %.o %.aux.o
 
 asm-offsets = lib/$(ARCH)/asm-offsets.h
 include $(SRCDIR)/scripts/asm-offsets.mak
diff --git a/riscv/Makefile b/riscv/Makefile
index 919a3ebb5..7207ff988 100644
--- a/riscv/Makefile
+++ b/riscv/Makefile
@@ -53,7 +53,7 @@ AUXFLAGS ?= 0x0
 KEEP_FRAME_POINTER := y
 
 # We want to keep intermediate files
-.PRECIOUS: %.elf %.o
+.PRECIOUS: %.elf %.o %.aux.o
 
 define arch_elf_check =
 	$(if $(shell ! $(READELF) -rW $(1) >&/dev/null && echo "nok"),
diff --git a/s390x/Makefile b/s390x/Makefile
index 23342bd64..d436c6e9a 100644
--- a/s390x/Makefile
+++ b/s390x/Makefile
@@ -85,7 +85,7 @@ CFLAGS += -fno-delete-null-pointer-checks
 LDFLAGS += -Wl,--build-id=none
 
 # We want to keep intermediate files
-.PRECIOUS: %.o %.lds
+.PRECIOUS: %.o %.aux.o %.lds
 
 asm-offsets = lib/$(ARCH)/asm-offsets.h
 include $(SRCDIR)/scripts/asm-offsets.mak
-- 
2.45.1


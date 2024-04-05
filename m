Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9108998B3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 11:00:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f8TQxm3J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9srp3zT0z86q4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 20:00:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f8TQxm3J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::12f; helo=mail-il1-x12f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com [IPv6:2607:f8b0:4864:20::12f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sM63V4lz3vjQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:38:10 +1100 (AEDT)
Received: by mail-il1-x12f.google.com with SMTP id e9e14a558f8ab-36a0d311333so2299965ab.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306287; x=1712911087; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sGCyPgl3I2RhYB72u4qf5QL0i6/5w7xwNKgPUqw6zXE=;
        b=f8TQxm3J+jAT+Q6VMBwMYzKcdnVVBK0x2VicIsOkjagNe3K+ycXLM9gW0vDJGbXVWt
         UZai5ZUjdz5FvBYz+J+Zd8qFEb8PbcF8w8T9gFnJGgm7mVOelUNeVZxEiJ9EInAKqvsn
         jndx/QRJwkKmpB+o1AnMZMIXCcrhgS0zM2m0IqFbcBR18R8Lr0HkNlMlxjWAlmVr0a0/
         csJACnsy8z+d7b1NT0VJsMC5+CKn9yklfDplzdUQBqC+5Tr7Rj74Odnp2yob/Lu7H+pb
         9GKKMvUL1iwk5HbH2lJoVovoC1Sl7JEmscaSGJkjfA7plcEbYfDO75QjO+NPkieWne6T
         9o9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306287; x=1712911087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sGCyPgl3I2RhYB72u4qf5QL0i6/5w7xwNKgPUqw6zXE=;
        b=HvnxwGiHZH0SHyzHKlBJi8re1KW4HHLJZ/GAFGptWH1zpyFIT5L/NpYI+JKlwot4kc
         XcuYj1yG0lLvWMF1uO7ydF+3vUzrfGPSrmVPAj/23cCQjvAGC44XKwY6ocIszLO+DHSc
         BlEaZKMRT43pOVYkn+H6EjrsDQL1i/vz3o1ae2aTA/NMEeNWaZXkonGffWg+uiP00P2a
         Ppem7foQDsIU4hf3s75R1ByZ5u/JB7SCK+Uubr1HWLDS7AMc5PzeAluLjATnbrJzWZix
         HKfQWMj+qI1zhf8gWVBCu0GXq/Yv02waSi0wDOWfnV4f8KkPiCto4ZTE1Q0OtspcXuzE
         ciRA==
X-Forwarded-Encrypted: i=1; AJvYcCVHKIe7fMKHe5I/8olBZvsDBGHMomvKw8FJRfB7rNrsiskIt+mOGWueLUodiErvzza/aBZnLHHc7z6u0O6IR0DEAicCfNjd6FstKSAtyQ==
X-Gm-Message-State: AOJu0Ywq2BfYRQH4Hlli+Aib1bjj1YT1kaWFZiHNKGPGcnwdhkOBqkOy
	GZ2co6u9iC74pF8KBOVrQB6R3vEvovXL9t1fKKdOMrZpm/hl0kiw
X-Google-Smtp-Source: AGHT+IEXdRMMtpxkTXLY1QR9+bDc6JrDHOZHEaNaHrlHrdrhRUuA/h4JbDJfUfZ+VZMIfoOk2EDb4A==
X-Received: by 2002:a05:6e02:219b:b0:368:a856:aa20 with SMTP id j27-20020a056e02219b00b00368a856aa20mr661890ila.20.1712306287401;
        Fri, 05 Apr 2024 01:38:07 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.38.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:38:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 33/35] configure: Make arch_libdir a first-class entity
Date: Fri,  5 Apr 2024 18:35:34 +1000
Message-ID: <20240405083539.374995-34-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, =?UTF-8?q?Nico=20B=C3=B6hr?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, Alexandru Elisei <alexandru.elisei@arm.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

arch_libdir was brought in to improve the heuristic determination of
the lib/ directory based on arch and testdir names, but it did not
entirely clean that mess up.

Remove the arch_libdir->arch->testdir heuristic and just require
everybody sets arch_libdir correctly. Fail if the lib/arch or
lib/arch/asm directories can not be found.

Cc: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: Janosch Frank <frankja@linux.ibm.com>
Cc: Laurent Vivier <lvivier@redhat.com>
Cc: Nico Böhr <nrb@linux.ibm.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: kvm@vger.kernel.org
Cc: linux-s390@vger.kernel.org
Cc: kvmarm@lists.linux.dev
Cc: kvm-riscv@lists.infradead.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Andrew Jones <andrew.jones@linux.dev>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 Makefile  |  2 +-
 configure | 18 +++++++++++++-----
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 4f35fffc6..4e0f54543 100644
--- a/Makefile
+++ b/Makefile
@@ -10,7 +10,7 @@ include config.mak
 VPATH = $(SRCDIR)
 
 libdirs-get = $(shell [ -d "lib/$(1)" ] && echo "lib/$(1) lib/$(1)/asm")
-ARCH_LIBDIRS := $(call libdirs-get,$(ARCH_LIBDIR)) $(call libdirs-get,$(TEST_DIR))
+ARCH_LIBDIRS := $(call libdirs-get,$(ARCH_LIBDIR))
 OBJDIRS := $(ARCH_LIBDIRS)
 
 DESTDIR := $(PREFIX)/share/kvm-unit-tests/
diff --git a/configure b/configure
index e19ba6f0c..a1308db8e 100755
--- a/configure
+++ b/configure
@@ -216,7 +216,6 @@ fi
 arch_name=$arch
 [ "$arch" = "aarch64" ] && arch="arm64"
 [ "$arch_name" = "arm64" ] && arch_name="aarch64"
-arch_libdir=$arch
 
 if [ "$arch" = "riscv" ]; then
     echo "riscv32 or riscv64 must be specified"
@@ -286,8 +285,10 @@ fi
 
 if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
     testdir=x86
+    arch_libdir=x86
 elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
     testdir=arm
+    arch_libdir=$arch
     if [ "$target" = "qemu" ]; then
         arm_uart_early_addr=0x09000000
     elif [ "$target" = "kvmtool" ]; then
@@ -336,6 +337,7 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
     fi
 elif [ "$arch" = "ppc64" ]; then
     testdir=powerpc
+    arch_libdir=ppc64
     firmware="$testdir/boot_rom.bin"
     if [ "$endian" != "little" ] && [ "$endian" != "big" ]; then
         echo "You must provide endianness (big or little)!"
@@ -346,6 +348,7 @@ elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
     arch_libdir=riscv
 elif [ "$arch" = "s390x" ]; then
     testdir=s390x
+    arch_libdir=s390x
 else
     echo "arch $arch is not supported!"
     arch=
@@ -355,6 +358,10 @@ if [ ! -d "$srcdir/$testdir" ]; then
     echo "$srcdir/$testdir does not exist!"
     exit 1
 fi
+if [ ! -d "$srcdir/lib/$arch_libdir" ]; then
+    echo "$srcdir/lib/$arch_libdir does not exist!"
+    exit 1
+fi
 
 if [ "$efi" = "y" ] && [ -f "$srcdir/$testdir/efi/run" ]; then
     ln -fs "$srcdir/$testdir/efi/run" $testdir-run
@@ -417,10 +424,11 @@ fi
 # link lib/asm for the architecture
 rm -f lib/asm
 asm="asm-generic"
-if [ -d "$srcdir/lib/$arch/asm" ]; then
-	asm="$srcdir/lib/$arch/asm"
-elif [ -d "$srcdir/lib/$testdir/asm" ]; then
-	asm="$srcdir/lib/$testdir/asm"
+if [ -d "$srcdir/lib/$arch_libdir/asm" ]; then
+    asm="$srcdir/lib/$arch_libdir/asm"
+else
+    echo "$srcdir/lib/$arch_libdir/asm does not exist"
+    exit 1
 fi
 mkdir -p lib
 ln -sf "$asm" lib/asm
-- 
2.43.0


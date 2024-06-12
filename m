Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C24F904AE4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:30:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fdSnwnqf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzYzR1yKJz3gGq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:30:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fdSnwnqf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYqr63Y3z3fpD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:24:08 +1000 (AEST)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1f6fada63a6so28658605ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169847; x=1718774647; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQuI8YGQgLmsUNQvvWuFnLsfcid8kBB0k+CZ86TDvAk=;
        b=fdSnwnqfcBJoFmISOESpJKD0r6GtpEPjehHvhIV2fAVafikb8LWsTIzYMB4BSLtkr0
         OvTMnQ8exJvmxDvLxZaphMnHEnuxzmRwq4iL7HNEElBkUMNzS7fBWipV9aT+gchwyvO2
         AF/AI+Gzg0SjHjaIj74xWjcaShhzYm8XHISHfShwBRPfOSmTEUPlGAovJYu5LCROOSgO
         5KJGsT2Vj1jKMyzObI4WpDMQ81ClENm7VuDQ0a19m4xXWM/mtM75yvvwfuz31cPEcle/
         ESEE749Vw+F0NXYqDekQVJcGaneHwaPd1Hd+Nc68tzBA9xYVFqZCpA44lg/ZOkkjtWu+
         dj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169847; x=1718774647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cQuI8YGQgLmsUNQvvWuFnLsfcid8kBB0k+CZ86TDvAk=;
        b=v3Mfa7xZvzUANi6ffKAX35SsEke2VJrWw6PcN7P+yEI8WSZtJAG107HHjAfGs5T2sp
         kgE8+WKBb2HI9ZjyRS7Awkzap9xKYzZIWiCWK1Qt3wOQmTCIpLbVF+SKJFpID0Vb+hGL
         Q+OIk3owUSIKRBzpEbKkHstL+ncC/BBzgSvYryuqZA0gt4X39kZ8o2h2HZpdIJI3Glb2
         oqtwoYwnivEnhFg4USbLyE2h9n6GRsoLiec9Hl/gWSvwnzmx6vUYEWbV0Zqc0H2Ec8eW
         /O+eJ8sfvaUm93Z0f2aS+6upNxw7hLgkJ4azDj/SxXOPesrAWVecC0GD3suuHh8+hdxV
         OEHA==
X-Forwarded-Encrypted: i=1; AJvYcCXy2FIRgzLYZ1RvT3Vm/ckBipny++CNLNEZ93VA13a9gAj3Y2SMGm2YGVbqaS4ImRSjGmVPheDEqMo9vLQfQZYa19ecGMKswDf888OpeQ==
X-Gm-Message-State: AOJu0Ywe1162JoyHZcc76S2HP0AtvDYoddMvFMRvnLkFv10eOT+oe8FZ
	tudlL+YnwEsrxq/QUKCeDFzeN8kV9EYeIGR5sN1TSqhzaZAM3Ck6
X-Google-Smtp-Source: AGHT+IGibBQ31aFbHM2KNIyG3WXGmC6uDThIWGe0iAzdMLifnbTThBiAhC+djmwgDB3YyNkgibzPkg==
X-Received: by 2002:a17:902:ceca:b0:1f7:969:7e87 with SMTP id d9443c01a7336-1f83b666b52mr10420065ad.35.1718169846856;
        Tue, 11 Jun 2024 22:24:06 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.24.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:24:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 09/15] configure: Make arch_libdir a first-class entity
Date: Wed, 12 Jun 2024 15:23:14 +1000
Message-ID: <20240612052322.218726-10-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240612052322.218726-1-npiggin@gmail.com>
References: <20240612052322.218726-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, =?UTF-8?q?Nico=20B=C3=B6hr?= <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
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
index 5b7998b79..7fe93dfd8 100644
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
index db15e85d6..b93723142 100755
--- a/configure
+++ b/configure
@@ -217,7 +217,6 @@ fi
 arch_name=$arch
 [ "$arch" = "aarch64" ] && arch="arm64"
 [ "$arch_name" = "arm64" ] && arch_name="aarch64"
-arch_libdir=$arch
 
 if [ "$arch" = "riscv" ]; then
     echo "riscv32 or riscv64 must be specified"
@@ -285,8 +284,10 @@ fi
 
 if [ "$arch" = "i386" ] || [ "$arch" = "x86_64" ]; then
     testdir=x86
+    arch_libdir=x86
 elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
     testdir=arm
+    arch_libdir=$arch
     if [ "$target" = "qemu" ]; then
         arm_uart_early_addr=0x09000000
     elif [ "$target" = "kvmtool" ]; then
@@ -335,6 +336,7 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
     fi
 elif [ "$arch" = "ppc64" ]; then
     testdir=powerpc
+    arch_libdir=ppc64
     firmware="$testdir/boot_rom.bin"
     if [ "$endian" != "little" ] && [ "$endian" != "big" ]; then
         echo "You must provide endianness (big or little)!"
@@ -345,6 +347,7 @@ elif [ "$arch" = "riscv32" ] || [ "$arch" = "riscv64" ]; then
     arch_libdir=riscv
 elif [ "$arch" = "s390x" ]; then
     testdir=s390x
+    arch_libdir=s390x
 else
     echo "arch $arch is not supported!"
     arch=
@@ -354,6 +357,10 @@ if [ ! -d "$srcdir/$testdir" ]; then
     echo "$srcdir/$testdir does not exist!"
     exit 1
 fi
+if [ ! -d "$srcdir/lib/$arch_libdir" ]; then
+    echo "$srcdir/lib/$arch_libdir does not exist!"
+    exit 1
+fi
 
 if [ "$efi" = "y" ] && [ -f "$srcdir/$testdir/efi/run" ]; then
     ln -fs "$srcdir/$testdir/efi/run" $testdir-run
@@ -416,10 +423,11 @@ fi
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
2.45.1


Return-Path: <linuxppc-dev+bounces-455-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2B795CCE4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 14:52:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wr0Mm6fcSz2ysd;
	Fri, 23 Aug 2024 22:52:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.222.181
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724417540;
	cv=none; b=TMgXfuXAK6lNm1iXO3B2QKzprchURPUm/JKd336DkvRbLB5ole2fUn+hoeL4X7RIK16yQPUYEkV+2wzlFmGrl650BtA/1+fOwhIWnIeuiJ7i3+UDL1cJL3Z1/Tt5ZYHelx0lJ5wTFOAuoR7Uv16ww1iAHs6TVjZk1qNsdeYk6+Vvi8Oonba3KiMXDYqYBq3MufgAnF2hjrGvxxBdCjW2Ad/6Z4T6Qz5AN2lVw3PBhaIYAfbwVDTJUuhpNChD2r2SZdBNtLY1QOsLFuoLaFDMnemB+tHZ2o63g7GOUPpSHEr9L2vSp5rvqBzFWcLVErQmnhtVYFS8ui1StJF44pmfFA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724417540; c=relaxed/relaxed;
	bh=S9E6XTkrddueeZOivGiIofK2AhGee/oAp8YjyBl5PzE=;
	h=Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:From:
	 To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding; b=YluGoppG4EZTtYOgTPrjNcQh63qqqlhDKA9wmMH2wqw5Ti6XYRek+TbpbbBp9p6At1jIaW/rOZqAZu6iNcjFeoKYv6ttn+26IWO16U6VM+fla/ePNmDh6TvVVaAJvxFSeCO+7Z49YBqwu3rCGEoUBHqFcEKDD2mTTbHeAbFAjN9nocpLzKTNvKjTFESa6O+O7riOAHGm7XeXAuT+LNJ+BL8RU3BCbPpSiReyWqRltpziHw/jqKNUDp6n7Ja74VoDto5fTeiBcR9F+U5PrANyGWmFNzwghinDQpd6oI3xnYAJFi338jaa4ed30GxG6UE+bpmiKnpRi7sUqgXuKD8dqg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.222.181; helo=mail-qk1-f181.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.222.181; helo=mail-qk1-f181.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wr0Mm3PjNz2yl1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 22:52:19 +1000 (AEST)
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7a4df9dc885so122453285a.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 05:52:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724417538; x=1725022338;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S9E6XTkrddueeZOivGiIofK2AhGee/oAp8YjyBl5PzE=;
        b=pCLLqvWXtGVlxSV05wW5mKOD8zKqKqZbwl8sxM6fVs/KTj9l61jXYjZUIYtLoNjK8E
         BOT09Tmf5GEOMA3QvSoyF5hWxvU5KrqEOyCmr0UWTQ+3cyVwevn5oGqLDjUxM//5pnmS
         cq/7MPCdNfMIpqrEJ1G3zYZUPglvjQN5HBEjkgk44+V93QfVQ7iOiD+k2dltZg6k/krS
         dbPPvViPnB3jY29ISvwyNt502EkPaRng9fVpT7u3SDH90MnAxwJ+/wKIr+7dBg64CtTn
         sv4Mv80ZJIsDeHLKsJ4I2HRPMB1jZChHmMQuYQOYNWPsbcWkkf3lolSX87Rn9pXdJ0ag
         AJug==
X-Forwarded-Encrypted: i=1; AJvYcCVQRaF4/J8raRxS02aXA3xD01sMAM2LS91v//h9IiWCaGhBGKMKAJaJSQWX9a+nG1I9L7lipnU8SolyOvE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzjvTQWv0oabBGnxfri3TfgmJobD/UUu38hw4Fx0UqYyXF562UJ
	Q1dKld/EG48/P0Czba7xRivT0C7bt3n64dId8iW4C65iHyuq+LDe
X-Google-Smtp-Source: AGHT+IF3mA/YQvpHZgkDzEa+/SMAZxpXC7oi2zf6N4sk58c/EQ2mjae+vOE2n5jzZqc4FH/k7dNcfw==
X-Received: by 2002:a05:620a:258f:b0:79f:12e9:1e51 with SMTP id af79cd13be357-7a688d09607mr398432085a.5.1724417537529;
        Fri, 23 Aug 2024 05:52:17 -0700 (PDT)
Received: from dogali.home (bras-base-mtrlpq3141w-grc-05-65-93-184-127.dsl.bell.ca. [65.93.184.127])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7a67f41f249sm174739185a.126.2024.08.23.05.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 05:52:16 -0700 (PDT)
From: Dave Vasilevsky <dave@vasilevsky.ca>
To: glaubitz@physik.fu-berlin.de,
	bhe@redhat.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	mpe@ellerman.id.au,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Dave Vasilevsky <dave@vasilevsky.ca>,
	=?UTF-8?q?Reimar=20D=C3=B6ffinger?= <Reimar.Doeffinger@gmx.de>
Subject: [PATCH] crash: Default to CRASH_DUMP=n when support for it is unlikely
Date: Fri, 23 Aug 2024 08:51:56 -0400
Message-Id: <20240823125156.104775-1-dave@vasilevsky.ca>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Fixes boot failures on 6.9 on PPC_BOOK3S_32 machines using
Open Firmware. On these machines, the kernel refuses to boot
from non-zero PHYSICAL_START, which occurs when CRASH_DUMP is on.

Since most PPC_BOOK3S_32 machines boot via Open Firmware, it should
default to off for them. Users booting via some other mechanism
can still turn it on explicitly.

Also defaults to CRASH_DUMP=n on sh.

Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
Reported-by: Reimar Döffinger <Reimar.Doeffinger@gmx.de>
Closes: https://lists.debian.org/debian-powerpc/2024/07/msg00001.html
Fixes: 75bc255a7444 ("crash: clean up kdump related config items")
---
 arch/arm/Kconfig       | 3 +++
 arch/arm64/Kconfig     | 3 +++
 arch/loongarch/Kconfig | 3 +++
 arch/mips/Kconfig      | 3 +++
 arch/powerpc/Kconfig   | 4 ++++
 arch/riscv/Kconfig     | 3 +++
 arch/s390/Kconfig      | 3 +++
 arch/sh/Kconfig        | 3 +++
 arch/x86/Kconfig       | 3 +++
 kernel/Kconfig.kexec   | 2 +-
 10 files changed, 29 insertions(+), 1 deletion(-)

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index 54b2bb817a7f..200995052690 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -1597,6 +1597,9 @@ config ATAGS_PROC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config AUTO_ZRELADDR
 	bool "Auto calculation of the decompressed kernel image address" if !ARCH_MULTIPLATFORM
 	default !(ARCH_FOOTBRIDGE || ARCH_RPC || ARCH_SA1100)
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index a2f8ff354ca6..43e08cc8204f 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1558,6 +1558,9 @@ config ARCH_DEFAULT_KEXEC_IMAGE_VERIFY_SIG
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 	def_bool CRASH_RESERVE
 
diff --git a/arch/loongarch/Kconfig b/arch/loongarch/Kconfig
index 70f169210b52..ce232ddcd27d 100644
--- a/arch/loongarch/Kconfig
+++ b/arch/loongarch/Kconfig
@@ -599,6 +599,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config ARCH_SELECTS_CRASH_DUMP
 	def_bool y
 	depends on CRASH_DUMP
diff --git a/arch/mips/Kconfig b/arch/mips/Kconfig
index 60077e576935..b547f4304d0c 100644
--- a/arch/mips/Kconfig
+++ b/arch/mips/Kconfig
@@ -2881,6 +2881,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config PHYSICAL_START
 	hex "Physical address where the kernel is loaded"
 	default "0xffffffff84000000"
diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d7b09b064a8a..0f3c1f958eac 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -682,6 +682,10 @@ config RELOCATABLE_TEST
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool PPC64 || PPC_BOOK3S_32 || PPC_85xx || (44x && !SMP)
 
+config ARCH_DEFAULT_CRASH_DUMP
+	bool
+	default y if !PPC_BOOK3S_32
+
 config ARCH_SELECTS_CRASH_DUMP
 	def_bool y
 	depends on CRASH_DUMP
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 0f3cd7c3a436..eb247b5ee569 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -880,6 +880,9 @@ config ARCH_SUPPORTS_KEXEC_PURGATORY
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool y
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config ARCH_HAS_GENERIC_CRASHKERNEL_RESERVATION
 	def_bool CRASH_RESERVE
 
diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index a822f952f64a..05a1fb408471 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -275,6 +275,9 @@ config ARCH_SUPPORTS_CRASH_DUMP
 	  This option also enables s390 zfcpdump.
 	  See also <file:Documentation/arch/s390/zfcpdump.rst>
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 menu "Processor type and features"
 
 config HAVE_MARCH_Z10_FEATURES
diff --git a/arch/sh/Kconfig b/arch/sh/Kconfig
index 1aa3c4a0c5b2..b04cfa23378c 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -549,6 +549,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool BROKEN_ON_SMP
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool n
+
 config ARCH_SUPPORTS_KEXEC_JUMP
 	def_bool y
 
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 007bab9f2a0e..aa4666bb9e9c 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2087,6 +2087,9 @@ config ARCH_SUPPORTS_KEXEC_JUMP
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool X86_64 || (X86_32 && HIGHMEM)
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
+
 config ARCH_SUPPORTS_CRASH_HOTPLUG
 	def_bool y
 
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 6c34e63c88ff..4d111f871951 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -97,7 +97,7 @@ config KEXEC_JUMP
 
 config CRASH_DUMP
 	bool "kernel crash dumps"
-	default y
+	default ARCH_DEFAULT_CRASH_DUMP
 	depends on ARCH_SUPPORTS_CRASH_DUMP
 	depends on KEXEC_CORE
 	select VMCORE_INFO
-- 
2.34.1



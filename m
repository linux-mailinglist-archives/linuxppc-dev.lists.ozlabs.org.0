Return-Path: <linuxppc-dev+bounces-404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B93695C307
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2024 03:57:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wqjql0FQ9z2yYk;
	Fri, 23 Aug 2024 11:57:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.219.182
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724373710;
	cv=none; b=mqhcoLjt1Xgzgxcc45lMaWtGsUevbZdumz++tQYNznBWVs7FGL/h9RMxUryLGj2oqLALo5WvwYOYc8xXH/i2OOr9gy7QlE6QUZaMXy8kKRw9ZbR4gUrllI25H/cprAK3B6jF8ukBO/mB3Dw1mvdfBzNWaRiuolw8FAyXVLYmmdOv+GXqQet9PMB0XcLTZQ3fEU5Sejv+8IPQ5dh143i6Xr6/gNUCqcIJU+Nk4tQpBJWtZ0fq1CxZBCSdlneAUR8bAsNr4w8tNcyVdFVITlg0pNa5JFQYrJZ4tI/h/da9gJrtQKWR5GecSE8aSt4KNCvU1bObBbyAaZc4k6F1gFz4SA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724373710; c=relaxed/relaxed;
	bh=hrrorkPUTMRy8B+Se5r9dC5v0n87yzEWeWGrk9H7liI=;
	h=Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding; b=VHe44z9gKp1BTH66f6ntDWI97ZTMfVc5KJhSbMfG0O6lLRnKqVqenYlUz7DWsN6uEKjo7ahjUlNsZtdH5Nm7+Jpesb5Kkinf4KpjEUQ8vobrGOUnwlrcDwMOejNHh9o2EvxMJIiNj9dc8iHxcKEmuxvtOZk9CLxsaznFB5mucquECr7aK2BOY4pKR9n88zWiJVcAXaMvbSUAtc1hvqOB5x6P1NMRU8OEAwh6+R04Gv420ZUMMbAYj0ylrs3+AV4IeJE7faiRkk8wUttA30mFK3MJgTTBhDHPHOdr2KJzgvO5RYFUTatYqG5YReexPkeJYK+PBB/Qn5yTnKgytLlhdw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca; spf=pass (client-ip=209.85.219.182; helo=mail-yb1-f182.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=vasilevsky.ca
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.219.182; helo=mail-yb1-f182.google.com; envelope-from=djvasi@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wqh8s30xSz2yNt
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 10:41:49 +1000 (AEST)
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-dff1ccdc17bso1403442276.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 17:41:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724373706; x=1724978506;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hrrorkPUTMRy8B+Se5r9dC5v0n87yzEWeWGrk9H7liI=;
        b=gvGSZBw5AgomsrZndHLPp9+sFkUgUM7ptc71P7KEQQEDt6P6vG97Om2yXDsvoosIgO
         6fMdjc3W/dCoOOerEWfzBYx957H48bOtT5Iev3LZsZWVCow/qZp4pQPOBqtv3+qRbXva
         ysd5L+WeQ8ph2nwlHLZxK1//FhTS9+mnlVeIpyyh8+BPvn8dKKTjNCyqrE5hD/iYETVz
         rsxMyqgiB1N6cC2Vh03gmUWyuBpdg7ZyCbTnaQinv8oKcvfRIzWzntghLaDkMAExAH48
         LgemdFqznrFsqRz6dYnmrSBuec3SkwdSFmO5G/JIna0GGGC1RCAq8tThJ08xUDM6BUeL
         BAzw==
X-Forwarded-Encrypted: i=1; AJvYcCU9USmiUW29cTsafgc9CdmJXUNXhEgHS/SK5yA3fn+P9n+zf7GcD0YUgV2VdWZbVMLzjNiRawiVAUoBY+Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwSHgzYXP+6aUdd4Bfs0X+hE0qSIxyi7QOEC0E4dj7ZZbdv7vV8
	uUJAEAONG3KWV5IhcRdYzg3PtRkFysNfsO9aCkSCB2+hdF7Dp0EU
X-Google-Smtp-Source: AGHT+IFIoz3CpMkQuGZF7qiev1E8+/L42B5M6zof+vl5mrM+UBz8KVmsk5nfokb4H2v2uq4x0faLyg==
X-Received: by 2002:a05:6902:2083:b0:e16:4dc8:3cbf with SMTP id 3f1490d57ef6-e17a83e2837mr770622276.28.1724373706517;
        Thu, 22 Aug 2024 17:41:46 -0700 (PDT)
Received: from [192.168.2.219] (bras-base-mtrlpq3141w-grc-05-65-93-184-127.dsl.bell.ca. [65.93.184.127])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fe0dda4bsm12009631cf.22.2024.08.22.17.41.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 17:41:46 -0700 (PDT)
Message-ID: <768dfe3e-c437-40cc-96a5-6c5b34b2d19d@vasilevsky.ca>
Date: Thu, 22 Aug 2024 20:41:40 -0400
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH linux-next v3 05/14] crash: clean up kdump related config
 items
To: Baoquan He <bhe@redhat.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
 kexec@lists.infradead.org, debian-powerpc@lists.debian.org, x86@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 loongarch@lists.linux.dev, akpm@linux-foundation.org, ebiederm@xmission.com,
 hbathini@linux.ibm.com, piliu@redhat.com, viro@zeniv.linux.org.uk,
 Sam James <sam@gentoo.org>
References: <20240124051254.67105-1-bhe@redhat.com>
 <20240124051254.67105-6-bhe@redhat.com>
 <a9d9ecd1ed8d62eae47ec26257093495e6cbd44a.camel@physik.fu-berlin.de>
 <ZscCMLfNbj2MDiaB@MiWiFi-R3L-srv>
 <c5e9996e4d2ba2a0849d65f68e3dce94fffc5828.camel@physik.fu-berlin.de>
 <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
Content-Language: en-US
From: Dave Vasilevsky <dave@vasilevsky.ca>
In-Reply-To: <ZsfR9rdMt8yn1+Bz@MiWiFi-R3L-srv>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 2024-08-22 20:04, Baoquan He wrote:
> If so, below patch possiblly can fix it. Can you help check if it's OK?

That removes the possibility of enabling CRASH_DUMP on PPC_BOOK3S_32, even when booting via other mechanisms. Maybe it would be best to just make it not-default? Please take a look at this patch:


From d6e5fe3a45f46f1aa01914648c443291d956de9e Mon Sep 17 00:00:00 2001
From: Dave Vasilevsky <dave@vasilevsky.ca>
Date: Thu, 22 Aug 2024 20:13:46 -0400
Subject: [PATCH] powerpc: Default to CRASH_DUMP=n when Open Firmware boot is
 likely
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Open Firmware is unable to boot a kernel where PHYSICAL_START is
non-zero, which occurs when CRASH_DUMP is on.

On PPC_BOOK3S_32, the most common way of booting is Open Firmware, so
most users probably don't want CRASH_DUMP. Users booting via some
other mechanism can turn it on explicitly.

Signed-off-by: Dave Vasilevsky <dave@vasilevsky.ca>
Reported-by: Reimar Döffinger <Reimar.Doeffinger@gmx.de>
Fixes: 75bc255a7444
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
index 1aa3c4a0c5b2..3a6338962636 100644
--- a/arch/sh/Kconfig
+++ b/arch/sh/Kconfig
@@ -549,6 +549,9 @@ config ARCH_SUPPORTS_KEXEC
 config ARCH_SUPPORTS_CRASH_DUMP
 	def_bool BROKEN_ON_SMP
 
+config ARCH_DEFAULT_CRASH_DUMP
+	def_bool y
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



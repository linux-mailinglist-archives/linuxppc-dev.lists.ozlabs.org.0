Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 663EA899881
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:51:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dhYtTS9x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sfr0trmz3wRY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:51:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=dhYtTS9x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32d; helo=mail-ot1-x32d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com [IPv6:2607:f8b0:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sL63qX5z3vcW
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:37:18 +1100 (AEDT)
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-6e675181ceaso1085351a34.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306235; x=1712911035; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NtLrnSXqdt678CiS0tNUCc+5b/rRAvRjP5Z8cb4bKlQ=;
        b=dhYtTS9xHUT8EWUP9617fD8SINkP8760K4ZFkF3GqHkoZgAyIPCqiu4aMg9vh+pK0x
         XOBpcwW1hKwEyjQ1z8ViAXwSPl5FZgDUdiWBIxe9+4MrZOYfyx8w9Y3WQf8P7n+UnXwD
         +gGbUW2A2vOGTFqEDGItgbrUKNLQLvcdilxTuZLuPkJtPIKZx226s7A7TbAqxdW38O/H
         CpvD01xVU7qIoGZ5Mj65FG4HlsSntVoIc8YAr9yRi45af/KnlAVgqHx+UtkNPp/bJzl6
         SeMrxvSRU4yl+EroiEvQIqmqrB8EDMzF9JJAmL3bSlEr22Y22D7cidiJ53OtElv2V7Gm
         rOww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306235; x=1712911035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtLrnSXqdt678CiS0tNUCc+5b/rRAvRjP5Z8cb4bKlQ=;
        b=P5etVVtnmShnscQPIZy3BDtbZ1okDjt4tI0LfN+/zLvnokbSN2dlSafh2EpHJ6JhiS
         4SdFJTo1qjh4mh+60Fs+8RUCGiyOwPA5+gfEmAkzpMF894ZTYhLCuyQ8bQH7PfhipEcR
         jBm272EXhT0DYE1UYjvvwEzMkHlV5cZ1ppe6AOA3YNJwKyFQ8nXMUuWtZWxyjt4gohf0
         rnEg8NEjGO7AJfym2CSS5fqFrj39vaVokKewdXuZhME76fmlVLogXK90RpSHErUH2Gpl
         dtJrZqhYJRMl3YwV51mg59DGEe+F1huNLOvL4WBHSbTQuzVszLnGdKDIh2oo/uDziB5N
         3KpA==
X-Forwarded-Encrypted: i=1; AJvYcCXRCkEDvSXRX/7ewhrNOkEzSu1YExiiFPNd+9d7eV6g4okkuCsVYM9Ke0mBK4yuD27zXqlZNjRcDYHf0bXqbK0d09C5X/IGStAXyjXK+w==
X-Gm-Message-State: AOJu0YzYKRH3mARs1lUfMEXZZdTYiMaMrShnyth1ZkQ2F0es0kDp4UT8
	WqmLsbkH82CtfWLh6KlxHbM6VlP2FCCw7x7AQsWzwHO3HeaO48Ze
X-Google-Smtp-Source: AGHT+IHmWOpjV+Y1L3Hng8oVd+HC+SSPr9KDiyUK4PN0GZhAizbWKsuQLfdEdo5jlJnCbyqJBRWlZg==
X-Received: by 2002:a05:6830:6c18:b0:6e8:9b1a:6bc2 with SMTP id ds24-20020a0568306c1800b006e89b1a6bc2mr930386otb.20.1712306235503;
        Fri, 05 Apr 2024 01:37:15 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:37:15 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 21/35] powerpc: Remove broken SMP exception stack setup
Date: Fri,  5 Apr 2024 18:35:22 +1000
Message-ID: <20240405083539.374995-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The exception stack setup does not work correctly for SMP, because
it is the boot processor that calls cpu_set() which sets SPRG2 to
the exception stack, not the target CPU itself. So secondaries
never got their SPRG2 set to a valid exception stack.

Remove the SMP code and just set an exception stack for the boot
processor. Make the stack 64kB while we're here, to match the
size of the regular stack.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/setup.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 9b665f59c..496af40f8 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -42,10 +42,6 @@ struct cpu_set_params {
 	uint64_t tb_hz;
 };
 
-#define EXCEPTION_STACK_SIZE	(32*1024) /* 32kB */
-
-static char exception_stack[NR_CPUS][EXCEPTION_STACK_SIZE];
-
 static void cpu_set(int fdtnode, u64 regval, void *info)
 {
 	static bool read_common_info = false;
@@ -56,10 +52,6 @@ static void cpu_set(int fdtnode, u64 regval, void *info)
 
 	cpus[cpu] = regval;
 
-	/* set exception stack address for this CPU (in SPGR0) */
-	asm volatile ("mtsprg0 %[addr]" ::
-		      [addr] "r" (exception_stack[cpu + 1]));
-
 	if (!read_common_info) {
 		const struct fdt_property *prop;
 		u32 *data;
@@ -180,6 +172,10 @@ static void mem_init(phys_addr_t freemem_start)
 					 ? __icache_bytes : __dcache_bytes);
 }
 
+#define EXCEPTION_STACK_SIZE	SZ_64K
+
+static char boot_exception_stack[EXCEPTION_STACK_SIZE];
+
 void setup(const void *fdt)
 {
 	void *freemem = &stacktop;
@@ -189,6 +185,10 @@ void setup(const void *fdt)
 
 	cpu_has_hv = !!(mfmsr() & (1ULL << MSR_HV_BIT));
 
+	/* set exception stack address for this CPU (in SPGR0) */
+	asm volatile ("mtsprg0 %[addr]" ::
+		      [addr] "r" (boot_exception_stack));
+
 	enable_mcheck();
 
 	/*
-- 
2.43.0


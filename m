Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB26D8670BC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:25:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ew1ru9Cn;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxZS3cc4z3w9w
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:25:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Ew1ru9Cn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxKK3LcKz3fFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:13:41 +1100 (AEDT)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-5ce9555d42eso2527350a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:13:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942420; x=1709547220; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGo+1arrsYAVXsfTP4gQ2EL+vABqvISnH52kVRdFyBU=;
        b=Ew1ru9CnbpAUDAZYo6SqOt2YrYstpzstcaBIka0OFFGrxfsvpiOZA2Qyb+W6bDHiqA
         fcPnl/vAcUtudaNBCH9XLKKsutMnWhoo0UUfHqbI43r0cVGOHKWzxPESzFpUnWXcSdBU
         6r9fgnTC4R/v14xON8Gb06nWEDf+D78/Jr9PgwZmdSiQhckBEJGZa5tLMWJEQ0skPbc/
         QbA8dvEXQ2hElJ5ha6aNjEy0yfpj6SdOs170N14285JQqM+hgQWuGsv4z4eYjJOuYvJ6
         uUYKqCiMx92unByaXa36Ec9LjV5l0pCH35L9Gt3pgzAsV5lUnlDz2XD4JIEuF4jkiZuy
         Gm2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942420; x=1709547220;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGo+1arrsYAVXsfTP4gQ2EL+vABqvISnH52kVRdFyBU=;
        b=anU6W2GQU6gvN2eyUX7LNSd+aeWPPtlZGFqGoBiG/lt7aoip1z76oxRPXTMSHrHCth
         8W8jmmyit/JVIeCMqHcH0qfkZGPidjPlIJjfJmd1/xoSPFnjY7aRUOQrmr+SYri23i4/
         7sdewvWbMFTQsWo3taRpWXGFBoSoVSs2EgoN5vWn5UHlt9mkWGdDAB0ELrMmsOYyZW7p
         q9WpzArEh4LY59rzjWrlyJtXlnfwHb31x6JqcW5mA5tLlVr8Z4X/oGqtbreFhmF6cP2W
         AwW7q1nkL63air+be1dCFkDWrqoOn3DaIv/gIi06UueuKkq9PRJLTrNPkC5CjNPCxU9v
         q5Mg==
X-Forwarded-Encrypted: i=1; AJvYcCXyIE5B5YhMjekThiqgG4BVjMwsIGAP2y4ScWDOdwJduXelreNzRbnnBb64w8YhhZ71pWvLj0TFaxRChRMBi2PUUIyjAw51K0ODs7ihYg==
X-Gm-Message-State: AOJu0Yzps79nTPk3BjrLDAxtlVcqigBWg8cKccijGZ/q/9xEWTLNsdC+
	I+jC8twffOSxIbdPn00nx2YOYNThJAvS6ofpIxF/+EIp4h+a8kli
X-Google-Smtp-Source: AGHT+IGmdxxayQXgJvWM0G91cEodyIXuZQEu0yL5dXAiDbtmtpAhynPpesxFSZ24zZJ/kBp/aQ6TSA==
X-Received: by 2002:a05:6a20:9c8b:b0:1a0:e4af:3c12 with SMTP id mj11-20020a056a209c8b00b001a0e4af3c12mr10054112pzb.48.1708942419825;
        Mon, 26 Feb 2024 02:13:39 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:13:39 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 16/32] powerpc: Remove broken SMP exception stack setup
Date: Mon, 26 Feb 2024 20:12:02 +1000
Message-ID: <20240226101218.1472843-17-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226101218.1472843-1-npiggin@gmail.com>
References: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
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
2.42.0


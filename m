Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E44087F945
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:15:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jmq+2X6F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPfw1vYxz3wPY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:15:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Jmq+2X6F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c31; helo=mail-oo1-xc31.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc31.google.com (mail-oo1-xc31.google.com [IPv6:2607:f8b0:4864:20::c31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPL1704Sz3vY9
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:00:57 +1100 (AEDT)
Received: by mail-oo1-xc31.google.com with SMTP id 006d021491bc7-5a21859a4b8so2348798eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835255; x=1711440055; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GGo+1arrsYAVXsfTP4gQ2EL+vABqvISnH52kVRdFyBU=;
        b=Jmq+2X6F4BpTTB26NgCj43lV69M3F/HgBEU0SAJq4+i81V+IM2awSyinsvE5CAUXzZ
         hi0pvRXmVdQWCtcW4QQOJ22G2zw2b8MT1XCOlvHTkjD9ZHPn1SF2C3Jpfp7yAol3DhMO
         HjC8Xme52WN/ZuBPsRRDv71SHOI2VFfjWIkDMbY1i04L5sqvt6Oxb6xMJ2NtrP4BViBL
         oZSZufX5z6zzRmUXdUVxGjy2kQVQT/TTd5cdypqTZLydw2vKAZPKtbqc0K0llYq/fS8/
         n6n+eCEcd/MtwyNBNsVBfygx1gE7Fnq7b9DMdmjL9U5gvLy0W6S0IvLWcbWBu+6eun0U
         2O5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835255; x=1711440055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GGo+1arrsYAVXsfTP4gQ2EL+vABqvISnH52kVRdFyBU=;
        b=QdvPvx403vALAQmyfP6Y24X2AXjV3Jq+wn4Qwrasagh5crPNm5G4de7tcaYsI/5Svl
         /q1LbA0VifUnArLxNyHJohJv6BefX0gS60/Na+KjLBSe/A+xSpzLyLIVwGZx0vUaUbz5
         IeUa16YjCIrRo5bA9tLiJxLVf3/XLMA0hpjrjT8oD96+paO8DSxZURjAwmo0fQWAGUI6
         c9p2JtIP4ArGIiT7bY+R99k4CssxeDxwfweCGOV8t8VkidC2IUwknmtCQkhqHNPLTKYU
         8a+HNgQaWH8TjHBfYpy9Cp6x4vt5ls1GzYTHutLGfA5vuykmjdnK96/A1giJJfxtOYmW
         Xyjw==
X-Forwarded-Encrypted: i=1; AJvYcCWU9FJA+6L2u+vwqNMjfNIhPtjJ64DQ4/WfdoU0oXN/FNz2VVzX1QuMNvnWbA7HWZJuOjvjvSGUhgylLeLMfPs4afDJzgw7QqF4o1F9Zg==
X-Gm-Message-State: AOJu0YyJU/b+IFsqPz9bySrlmwYHLhvcKTbxw0I16Wa4Dz2EsIbGmEsf
	HYmqQrN9tfMz7UKr9wA+zsVQAaWID2VnvwnTg0JjI+1lOfWB2vyfk5MtGvTCL1I=
X-Google-Smtp-Source: AGHT+IFs4elYHLqSQaWxfOpvn0n1iBEA3/4l52mkNvpdgddck5fItF7mXhG/KqTc01Uq87acxqM7Qg==
X-Received: by 2002:a05:6820:1629:b0:5a1:78c0:4327 with SMTP id bb41-20020a056820162900b005a178c04327mr13805982oob.4.1710835254929;
        Tue, 19 Mar 2024 01:00:54 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:00:54 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 21/35] powerpc: Remove broken SMP exception stack setup
Date: Tue, 19 Mar 2024 17:59:12 +1000
Message-ID: <20240319075926.2422707-22-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
2.42.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 60B398BBB71
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:39:54 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JO6TxM2E;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnLc0BlFz3fnt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:39:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JO6TxM2E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn6z4cWLz3cSN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:29:47 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6f467fb2e66so83694b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825785; x=1715430585; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCnyyrhUMJlPFe7cyug7bxp4Z8jcIGiZmkD9LBikPH8=;
        b=JO6TxM2ENW+rOre+Hzd6nOgtAVKwgDYrhBgeKwTKAl+CJs4MkwHy284LfKbr5rryrJ
         Ehq1JGpHIHID7QE5CAycb79xu/IytpQtsPMDuDlQVqWClgayIxiaMBUCC4FN1LG3wm4a
         mXjDj9ItahLAdZkHdZ03YuI7EUqha6xq1CMyWE3lWdQpcoafRE+t/N/2H/N+WJJfLI27
         KwADA66kRdy7LXCPbHqHcDURyFvqp2t+c8aa4JBBQqYQW32a61OaRl0kXjl3pAyAledw
         5fC3n6fOSg+dQs50u+uNWAercD1Vvuj4I5B9NN7Hcj6it+GMHRCPJBh2Hv0egf7cZ/7H
         UMrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825785; x=1715430585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JCnyyrhUMJlPFe7cyug7bxp4Z8jcIGiZmkD9LBikPH8=;
        b=QtiBP9Sqr1GxbN1AODSxt7Ijo3a7u2bEX/CpOR/Cd1pFfLkJDgMnUrndXEBM2p4TXc
         MsG8bDDGvS/tuUJwNxg/SugmNAzCJ/QMd70WV5DfHyT++bdjzrS5g+HA2ghZGwsV5pFz
         nBm/mQgo/nw10Fsg6SiuVMn2vF0rpW3DOJRhZXd7BI94s5niTd8g8WmM9vgQxUBpq9o6
         McZhhwNFrWpj/1lbY8hXiQImNAmN7xcQzXb7riXPWwRXDuUWBHv90cEWO8MuVZwwQJRs
         y/IUMp2hag+MlnCk/OMl3EK0CmxVgKZfkvFvh7TVu12dpWugZwOzB+fJOY2UZlOkAwEK
         Yy3A==
X-Forwarded-Encrypted: i=1; AJvYcCUpFNAIPcOO/r2jrtKotAMJ0n9ZbtkMnq2FQtuN0kuvT+sd9UtDLvdLm74MJPT3JdM223UCnM7nxLWTH4JPGj63lMbYWVffC63f9b08Dw==
X-Gm-Message-State: AOJu0YwsdzOR6uXKf8FIA1sBIef2yiSQ6cNcY3f14H25ZZcgLT0S7bkG
	wsUm1wCpJXB+/B/vyAM1AfTDikbEh+5uFMrlOR1JTjY91e8Sl/y9UPBX5g==
X-Google-Smtp-Source: AGHT+IHpmwlZ1Ova538YiLDhjk47+Mf6xmDk20bCNSb9DMpIy00uqVcKZrw5LeJQK/2vW1ivif+7wA==
X-Received: by 2002:a05:6a00:22c2:b0:6f0:c214:7974 with SMTP id f2-20020a056a0022c200b006f0c2147974mr5985175pfj.12.1714825785325;
        Sat, 04 May 2024 05:29:45 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:29:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 14/31] powerpc: Remove broken SMP exception stack setup
Date: Sat,  4 May 2024 22:28:20 +1000
Message-ID: <20240504122841.1177683-15-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
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
index 9b665f59c..58be93f08 100644
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
+		      [addr] "r" (boot_exception_stack + EXCEPTION_STACK_SIZE - 64));
+
 	enable_mcheck();
 
 	/*
-- 
2.43.0


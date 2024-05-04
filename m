Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 175F18BBB72
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:40:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Js3MNsk4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnMN59Zgz3g8q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:40:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Js3MNsk4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn7326VZz30VV
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:29:51 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-6f44390e328so524549b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825789; x=1715430589; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fDXzWLE/DUs3GDPPxGlpa8evNqGRj/CtlxJusPx/GlU=;
        b=Js3MNsk4uxa2KFd4Np29cFpWWAW8jFXBHmR4p5R0HB4LS93hRm8Yk9dmocgdq4IpxH
         BNuSjyHX3q9CaZU2XA/8DVig0x6nj9BtLYKg0xdldOpSSeFCBl/ChMoEf913sj2MIpaV
         /LFytxB1YsUr8AeJGVP9CF09e6Ue1HAttE/GQzJRRqHOQ6apQiKkWwYN2Abhf99RCFnJ
         hSGeIq4F8DmJra1XskIzO7EQhoLZ9s2M7tQmTEVv+lb/S0x+js3nm6bKH36W7L4HSPJq
         G0ig9rBIeEzDveCYul8nfSsOp1uVLt3uZLwzXVI6tjXGOSExmyxU8qtCvCKJ9aiwVgIW
         TI2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825789; x=1715430589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDXzWLE/DUs3GDPPxGlpa8evNqGRj/CtlxJusPx/GlU=;
        b=j8VQFX1NxQag4zflPwl0RhtCMcLItSvPgK37PCFbENFp0Hugu6aHmSHJv1JtUoB71S
         bwFOmA5mN6ZbLI+uPqYiNAoYvdvMwl2Dtu9gKSfMZBeM6FaeSy8FMBpMGswUrLTKtovS
         ZTDfWdGP/yzmGu28IlpeL/qvrtYnvl4wT2GAkT7zBcIbeRXZk6cnj9Q2NNivsp8K5R5e
         vkn5vZfEo3C681OYdBX+hg5cPrbFq8zbRaMpPgMONWEB+Cyn8LHngWayC5RXFS1YkJ1f
         HosU2ZWNe0A2NsVa4OwYJrKjDcAvRm+zjxJuUyqpT/a0JDbQtz5pcY1ZaS0piICAbwgj
         G4zA==
X-Forwarded-Encrypted: i=1; AJvYcCUOI38Q9XuddQU3MLolAX9yypX5CtPi7nr29UVi/MztBfkCVJ1wfGHVnD6634/CtcZ8S8ZgCaXNV2CbSqWLYe522xk2sn1d5jCMGrjnMw==
X-Gm-Message-State: AOJu0YwLB3W2d4nSw5Vx6klbc4zUdUQCmJphyY1aOA6nlg/mXs1GqGxI
	WRCfPiRTjDy0ibnLlVuvrEegVeKeQLopusnHZu9GmzEAKtNm715d
X-Google-Smtp-Source: AGHT+IHnQ2zuv/B+C0SD3NBohPwkG9C/rQDC8UTekLkLibupZ9dNhnjts9LIMNCchzomoGQJps/l9g==
X-Received: by 2002:a05:6a00:4b4d:b0:6f3:ee81:13b5 with SMTP id kr13-20020a056a004b4d00b006f3ee8113b5mr7759237pfb.17.1714825788886;
        Sat, 04 May 2024 05:29:48 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:29:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 15/31] powerpc: Enable page alloc operations
Date: Sat,  4 May 2024 22:28:21 +1000
Message-ID: <20240504122841.1177683-16-npiggin@gmail.com>
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

These will be used for stack allocation for secondary CPUs.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/powerpc/setup.c     | 8 ++++++++
 powerpc/Makefile.common | 1 +
 2 files changed, 9 insertions(+)

diff --git a/lib/powerpc/setup.c b/lib/powerpc/setup.c
index 58be93f08..73ca2f931 100644
--- a/lib/powerpc/setup.c
+++ b/lib/powerpc/setup.c
@@ -15,6 +15,7 @@
 #include <devicetree.h>
 #include <alloc.h>
 #include <alloc_phys.h>
+#include <alloc_page.h>
 #include <argv.h>
 #include <asm/setup.h>
 #include <asm/page.h>
@@ -133,6 +134,7 @@ static void mem_init(phys_addr_t freemem_start)
 		.start = (phys_addr_t)-1,
 	};
 	int nr_regs, i;
+	phys_addr_t base, top;
 
 	nr_regs = dt_get_memory_params(regs, NR_MEM_REGIONS);
 	assert(nr_regs > 0);
@@ -170,6 +172,12 @@ static void mem_init(phys_addr_t freemem_start)
 	phys_alloc_init(freemem_start, primary.end - freemem_start);
 	phys_alloc_set_minimum_alignment(__icache_bytes > __dcache_bytes
 					 ? __icache_bytes : __dcache_bytes);
+
+	phys_alloc_get_unused(&base, &top);
+	base = PAGE_ALIGN(base);
+	top &= PAGE_MASK;
+	page_alloc_init_area(0, base >> PAGE_SHIFT, top >> PAGE_SHIFT);
+	page_alloc_ops_enable();
 }
 
 #define EXCEPTION_STACK_SIZE	SZ_64K
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
index 68165fc25..6374418d2 100644
--- a/powerpc/Makefile.common
+++ b/powerpc/Makefile.common
@@ -38,6 +38,7 @@ cflatobjs += lib/util.o
 cflatobjs += lib/getchar.o
 cflatobjs += lib/alloc_phys.o
 cflatobjs += lib/alloc.o
+cflatobjs += lib/alloc_page.o
 cflatobjs += lib/devicetree.o
 cflatobjs += lib/migrate.o
 cflatobjs += lib/powerpc/io.o
-- 
2.43.0


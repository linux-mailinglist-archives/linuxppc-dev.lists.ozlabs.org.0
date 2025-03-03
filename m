Return-Path: <linuxppc-dev+bounces-6620-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C191A4BD99
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Mar 2025 12:11:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z5x2V51J4z2xQD;
	Mon,  3 Mar 2025 22:11:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741000274;
	cv=none; b=QCr/VyA7fhAXBW9kYVA2lCXoChz7sykX9vo7GYxTs8bDM/nYsoFTrxzo/w1BK9nx4iEcjcNhAAo6i+BQgbUnkeWg46rHttxR6XUAGyQz4XsntnDGSfrMV7c7QWJRJaK8IMtFT6gZ3bAP1Q4gmI4sZSh+KPkG1J7Ua1SSkmXfKpx9SWfP04rps/wbc+9Ivav7w4gFiq3Q+88CrNZ83jNaRstIxzaonGvR04vitXdPp4qcV4ucI9WTr4JqsdWv600PdFD2Jcu3t9rXRJSKjTmpi7Cn0xzqWfVyYZVHw6+u7MhBUdoqgLSSXel2QXHCV88b7hghIQTt0EBDA6D1OaLBbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741000274; c=relaxed/relaxed;
	bh=TOb1j+830+L2uc5mgMSRGFN3ViOd+N17QiffCrSYHk4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ncw1txBH1Kg1ZQxzfkV2g5luP0mq839ftOK5V7av3y5dBgR8W9JEeBj9dkZQmzLFcGtzP8n0id8qT71IS5beM+YJUw7FHOu378M30h28pQS6PhVAsilON59CalQOg5gjF/5c022b7XCzvx65vTCyx0/o9vcvuMnOHNYbtRqCO/8vQ4fXduS8vxU2Qqo5RNy/cwrgQ4NcTzZGvpMFoESOrge8cwxlxwYSb8gVJwr6sK5WZYWdCMyeKOK90x0RCdNYBcvIXCQIcX41CNRDi8o2Ln3gedR0A6MwTuh/R8JUCweYhSkNS+bAwug19D2KB/vWdXuArVS78mhBTjac0brI0w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XmXWkKs1; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=daDT/5PB; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=XmXWkKs1;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=daDT/5PB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=t-8ch@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4Z5x2T5ZMWz30VS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Mar 2025 22:11:13 +1100 (AEDT)
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1741000268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOb1j+830+L2uc5mgMSRGFN3ViOd+N17QiffCrSYHk4=;
	b=XmXWkKs18KvBgwCLec9sE2WfytIol8uBJMrocKvJVLbeiOYYi4FaLohlwg2bG4tNOaAosv
	u/weCBoaVG0JKctHLyYHHYK47Mta9LgUbpf0rB+op47Golj1hfJ7gkkO9lQY/w10+fEljY
	6IGSd4P7CBHQfRNt9LjCH12rYr/zg2eH74yz4kSq1iQYuVWyv+larEEmeu9Q8zFMVwfjvT
	EdLy6uzdF0kguXQpqZWK22VArwZdItGzGam4LCcMGiul8kd15o/sjXZ354UtlcWc5YvF/U
	U9/kOxK+C0JCRIoXNYKeQYQz8HNeaPGfZ4VWkdItWhdU4mCgDMHm1CbZ/OTTPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1741000268;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOb1j+830+L2uc5mgMSRGFN3ViOd+N17QiffCrSYHk4=;
	b=daDT/5PBEsCo5YvUqMaO/OFqg8j4UWG6U+YVX4tUUbVhnThgHXXAeFdxh16iUrDM7UiwNX
	eoviGFLDEC8Du5Bg==
Date: Mon, 03 Mar 2025 12:11:03 +0100
Subject: [PATCH 01/19] vdso: Introduce vdso/cache.h
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250303-vdso-clock-v1-1-c1b5c69a166f@linutronix.de>
References: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
In-Reply-To: <20250303-vdso-clock-v1-0-c1b5c69a166f@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Frederic Weisbecker <frederic@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, 
 Vasily Gorbik <gor@linux.ibm.com>, 
 Alexander Gordeev <agordeev@linux.ibm.com>, 
 Christian Borntraeger <borntraeger@linux.ibm.com>, 
 Sven Schnelle <svens@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org, 
 linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741000267; l=2031;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=QicJWSkRxiGmzzoQ0Aniprry18vJY+DCMdz2bkhHj00=;
 b=GtEtpiK0bFbVap25sLkJQRfP4QgJXwKc/eEYZUJvPvc3sE2U4JP5GeW1CvH6eCUWZ4Gd03Xdo
 esTi0v4kjEwDDKsbHURqiM8BoZI6WHvtyKXGg9Tunv9JgZNVRL4XaXD
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The vDSO implementation can only include headers from the vdso/
namespace. To enable the usage of ____cacheline_aligned from
the vDSO, move it and its dependencies into a new header vdso/cache.h.
Keep compatibility by including vdso/cache.h from linux/cache.h.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 include/linux/cache.h |  9 +--------
 include/vdso/cache.h  | 15 +++++++++++++++
 2 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/include/linux/cache.h b/include/linux/cache.h
index ca2a05682a54b51af991154a99f57a00c88fc5a8..e69768f50d5327b874ba4bd56609300526511a69 100644
--- a/include/linux/cache.h
+++ b/include/linux/cache.h
@@ -3,16 +3,13 @@
 #define __LINUX_CACHE_H
 
 #include <uapi/linux/kernel.h>
+#include <vdso/cache.h>
 #include <asm/cache.h>
 
 #ifndef L1_CACHE_ALIGN
 #define L1_CACHE_ALIGN(x) __ALIGN_KERNEL(x, L1_CACHE_BYTES)
 #endif
 
-#ifndef SMP_CACHE_BYTES
-#define SMP_CACHE_BYTES L1_CACHE_BYTES
-#endif
-
 /**
  * SMP_CACHE_ALIGN - align a value to the L2 cacheline size
  * @x: value to align
@@ -63,10 +60,6 @@
 #define __ro_after_init __section(".data..ro_after_init")
 #endif
 
-#ifndef ____cacheline_aligned
-#define ____cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
-#endif
-
 #ifndef ____cacheline_aligned_in_smp
 #ifdef CONFIG_SMP
 #define ____cacheline_aligned_in_smp ____cacheline_aligned
diff --git a/include/vdso/cache.h b/include/vdso/cache.h
new file mode 100644
index 0000000000000000000000000000000000000000..f89d48304bf8f101df581aee0e32a2efa9d2fb2d
--- /dev/null
+++ b/include/vdso/cache.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __VDSO_CACHE_H
+#define __VDSO_CACHE_H
+
+#include <asm/cache.h>
+
+#ifndef SMP_CACHE_BYTES
+#define SMP_CACHE_BYTES L1_CACHE_BYTES
+#endif
+
+#ifndef ____cacheline_aligned
+#define ____cacheline_aligned __attribute__((__aligned__(SMP_CACHE_BYTES)))
+#endif
+
+#endif	/* __VDSO_ALIGN_H */

-- 
2.48.1



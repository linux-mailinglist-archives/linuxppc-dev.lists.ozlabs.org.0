Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B82D970FB0A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 17:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRG8P4fC8z3f7N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 01:59:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FJuoWLcd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRG5m58jfz3bkM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 May 2023 01:57:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FJuoWLcd;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QRG5m3Sfqz4wj7;
	Thu, 25 May 2023 01:57:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1684943820;
	bh=qwsZV+PJ3cb3Udy+/4CR3STWLoi8PlYV5C8cGtG8aK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=FJuoWLcdzkR8HnaGpngf5T4KtnCDJHSDZUYmwKw3pPxMTPIJ0xX7+0v5GR54wH+kT
	 cuGSHMg0dx13uCyFD3IBLTK3e6SDAvv0mqCg1Hmf9CSz9Z4hnw9l0sW3l1hkXjoXMq
	 r7jtYBZvjoCjlR35GmMLhH0iMd1Xorj0G46RkgASgGqRKgTAN80OsyhNaaXO8loUB0
	 FZ/4RhTQAJFdkAGi3T7fyarIQk20iuDMfCXAsjJSh/vzvslkN40aRZXaH08pfS8xD/
	 tY+3SiUJMnpRPAvVboalycZAvtCcz7rbuLSJEyc33AJaAHdGbwWm+JxUrX3A7ZU13F
	 Q4VfivmwPfBHw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linux-kernel@vger.kernel.org>
Subject: [PATCH 4/9] cpu/SMT: Create topology_smt_threads_supported()
Date: Thu, 25 May 2023 01:56:25 +1000
Message-Id: <20230524155630.794584-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524155630.794584-1-mpe@ellerman.id.au>
References: <20230524155630.794584-1-mpe@ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, tglx@linutronix.de, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A subsequent patch will enable partial SMT states, ie. when not all SMT
threads are brought online.

To support that, add an arch helper to check how many SMT threads are
supported.

To retain existing behaviour, the x86 implementation only allows a
single thread or all threads to be online.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/x86/include/asm/topology.h |  2 ++
 arch/x86/kernel/smpboot.c       | 12 ++++++++++++
 2 files changed, 14 insertions(+)

diff --git a/arch/x86/include/asm/topology.h b/arch/x86/include/asm/topology.h
index 66927a59e822..197ec2589f5d 100644
--- a/arch/x86/include/asm/topology.h
+++ b/arch/x86/include/asm/topology.h
@@ -144,6 +144,7 @@ int topology_phys_to_logical_pkg(unsigned int pkg);
 int topology_phys_to_logical_die(unsigned int die, unsigned int cpu);
 bool topology_is_primary_thread(unsigned int cpu);
 bool topology_smt_supported(void);
+bool topology_smt_threads_supported(unsigned int threads);
 #else
 #define topology_max_packages()			(1)
 static inline int
@@ -157,6 +158,7 @@ static inline int topology_max_die_per_package(void) { return 1; }
 static inline int topology_max_smt_threads(void) { return 1; }
 static inline bool topology_is_primary_thread(unsigned int cpu) { return true; }
 static inline bool topology_smt_supported(void) { return false; }
+static inline bool topology_smt_threads_supported(unsigned int threads) { return false; }
 #endif
 
 static inline void arch_fix_phys_package_id(int num, u32 slot)
diff --git a/arch/x86/kernel/smpboot.c b/arch/x86/kernel/smpboot.c
index 352f0ce1ece4..c7ba62beae3e 100644
--- a/arch/x86/kernel/smpboot.c
+++ b/arch/x86/kernel/smpboot.c
@@ -286,6 +286,18 @@ bool topology_smt_supported(void)
 	return smp_num_siblings > 1;
 }
 
+/**
+ * topology_smt_threads_supported - Check if the given number of SMT threads
+ *				    is supported.
+ *
+ * @threads:	The number of SMT threads.
+ */
+bool topology_smt_threads_supported(unsigned int threads)
+{
+	// Only support a single thread or all threads.
+	return threads == 1 || threads == smp_num_siblings;
+}
+
 /**
  * topology_phys_to_logical_pkg - Map a physical package id to a logical
  *
-- 
2.40.1


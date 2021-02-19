Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9606331FD8E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Feb 2021 18:07:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dhyg64cLpz3cKk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Feb 2021 04:07:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=bla3Rx2U;
	dkim=fail reason="signature verification failed" header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=56jWW3az;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=bla3Rx2U; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=56jWW3az; 
 dkim-atps=neutral
X-Greylist: delayed 582 seconds by postgrey-1.36 at boromir;
 Sat, 20 Feb 2021 04:06:52 AEDT
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dhyfh6hKqz30L1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Feb 2021 04:06:52 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1613753815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdU0iboDEey4FC8O6SOKv/h7osOTqA9hZkg15g+4QRY=;
 b=bla3Rx2UH00EcNwioofnf7W/CsvSPPMYqZYCaT+hYd2AzgsgWfP0+LhyNpQay3/R5WLSvm
 rdsbDfuRmY4iU9lmoie4tGqvDRRtAcTopYcf2poiP4bFIk0FccWLAbJo+UZs9Kp/WcInr6
 bDhGoxzsAKGW6qtON/2DBUx6BFPXnZi1pVtfB0PVECje2ItZn/SO/ujvTDCwXyHZoOUZO0
 YZ4s5iKSRYj3koZNkHKHZHUXxg0yZXAzFquu9wAdjZUyVCjAAsPvp1cDP2nIu0qIuhch6M
 7Hho3GAWhFT3eaa7AMqJvyxQP3c/1nHdN9tIZ19ZeCsRMHwZQeh2zoOz5CZFKQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1613753815;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=sdU0iboDEey4FC8O6SOKv/h7osOTqA9hZkg15g+4QRY=;
 b=56jWW3azYvq21J6NVRghXXGhwPp3FZLwuRF1dX/j0WPt15qAOdbzCO0G6OQZhFmP/QEL7p
 NjMTuWoPTG/TD2AA==
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/mm: Move the linear_mapping_mutex to the ifdef where
 it is used
Date: Fri, 19 Feb 2021 17:56:48 +0100
Message-Id: <20210219165648.2505482-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The mutex linear_mapping_mutex is defined at the of the file while its
only two user are within the CONFIG_MEMORY_HOTPLUG block.
A compile without CONFIG_MEMORY_HOTPLUG set fails on PREEMPT_RT because
its mutex implementation is smart enough to realize that it is unused.

Move the definition of linear_mapping_mutex to ifdef block where it is
used.

Fixes: 1f73ad3e8d755 ("powerpc/mm: print warning in arch_remove_linear_mapp=
ing()")
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 arch/powerpc/mm/mem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index afab328d08874..d6c3f0b79f1d1 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -54,7 +54,6 @@
=20
 #include <mm/mmu_decl.h>
=20
-static DEFINE_MUTEX(linear_mapping_mutex);
 unsigned long long memory_limit;
 bool init_mem_is_free;
=20
@@ -72,6 +71,7 @@ pgprot_t phys_mem_access_prot(struct file *file, unsigned=
 long pfn,
 EXPORT_SYMBOL(phys_mem_access_prot);
=20
 #ifdef CONFIG_MEMORY_HOTPLUG
+static DEFINE_MUTEX(linear_mapping_mutex);
=20
 #ifdef CONFIG_NUMA
 int memory_add_physaddr_to_nid(u64 start)
--=20
2.30.0


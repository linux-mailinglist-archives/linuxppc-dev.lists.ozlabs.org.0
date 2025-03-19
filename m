Return-Path: <linuxppc-dev+bounces-7204-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A0507A68813
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 10:32:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHk5c2vHqz2yrg;
	Wed, 19 Mar 2025 20:32:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742376772;
	cv=none; b=biJd03mVfi025AVYV/L0paDZUhx25PoJnjGH+9TwPZVHGs7jAzSdjxsSQwUed1o2yl7tDFkr1bdeG9hUlK617oljUCrfLMNlQFbabz/C9Hmp6XVIVE796RIRvLVbMJMngB/sRHtcIhzTFTrE/i/P8BZ/HyO6VRfgZfE2/RpLTFlTydKS7bImazswyBer//MKGa4vUX69fbkmtqPvuGMVEXvqDL8NdNJMynsKiOZemdQP4qs8fTZhw9Md9+76/0frNG0fUMwqCtrTHsyYOTQN1osOwqEb/nKLHaAfa02wexxsfkMxwMOdY0CvjIn3DZ+NTzURUQxlcg0hBubAMRnSAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742376772; c=relaxed/relaxed;
	bh=7b2ALWXSS82gN7uOneb0J3YEOUq9WJtM75PQJZRTkYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Vq1QoFgHoY1dIF+gqWNQibWgrPG7xlPrUtUCSTyGof3lACgaE5NWyn4/s6IYjH978IQh9hjawBYL8hv9IO7B04xtEf1IhxWLdMy/cy2mXrNiqka38W8gVPEzV3VSgcvJjSWWhwT0bfAufxt5N8QYUX0o67XufETY4k7GTmlHikZhpb5HmRqQl8nuyO52HSBdcIYBXl8bWQQtPVwPwVJwDNTG/ol8Ce3iDaeMPFDZHjqIW9eEQbP2RQRbSSX+A8EbR6pWPQJtw+JBYS98Gp7eT3T+5lvgPcPtauTgo04Qs8NEioRIKwmr7YLN7raqkEzpoyspkJTcVGqhBnd4KtAIiw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WA23J/ew; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WA23J/ew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jirislaby@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHk5b3vKBz2xtt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 20:32:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ECDD15C59EB;
	Wed, 19 Mar 2025 09:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54191C4CEEA;
	Wed, 19 Mar 2025 09:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742376769;
	bh=X8wudJPii2FdSLgylneYrvJlLDA9ojvTW0l/YVqFwHE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WA23J/ew5erlnbkD8lMQ/orw9PaZX4ufHQyXg/QR7SfKTRRWVBBeM4N12tcYBpvzS
	 98CjAsimJH+LuRMhGZWqQ6O01+GNGScujWglkOFG0DvhOqpq7RfR/ly5b7VL00IHil
	 UXqMwW3/6YRiV5d0ETYoKj+C0VTg6EbVBUent8d2Ym4fdievKjLAz3cpycGaok+X7A
	 4bhYKwXMnNuOhbIkaZ4JiS1EbMej3FnFf0F0qPOBVJO1LNf35pmbFPm2CXKvGY1cMU
	 3fPKYgeZfpLa+vyspFvtbVmvKSJzZjEPyHihzaOj7S8M5AKwmwEgYzd1Ja4MBKfR1u
	 8vHS8lwsGx1wg==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: tglx@linutronix.de
Cc: maz@kernel.org,
	linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Dongliang Mu <dzm91@hust.edu.cn>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Geoff Levand <geoff@infradead.org>,
	linuxppc-dev@lists.ozlabs.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 39/57] irqdomain: ppc: Switch irq_domain_add_nomap() to use fwnode
Date: Wed, 19 Mar 2025 10:29:32 +0100
Message-ID: <20250319092951.37667-40-jirislaby@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319092951.37667-1-jirislaby@kernel.org>
References: <20250319092951.37667-1-jirislaby@kernel.org>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All irq_domain_add_*() functions are going away. PowerPC is the only
user of irq_domain_add_nomap() and there is no irq_domain_create_nomap()
complement.

Therefore, to align with the rest of kernel, rename
irq_domain_add_nomap() to irq_domain_create_nomap() and accept
fwnode_handle instead of device_node.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Alex Shi <alexs@kernel.org>
Cc: Yanteng Si <si.yanteng@linux.dev>
Cc: Dongliang Mu <dzm91@hust.edu.cn>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Naveen N Rao <naveen@kernel.org>
Cc: Geoff Levand <geoff@infradead.org>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/core-api/irq/irq-domain.rst                    | 2 +-
 Documentation/translations/zh_CN/core-api/irq/irq-domain.rst | 2 +-
 arch/powerpc/platforms/powermac/smp.c                        | 2 +-
 arch/powerpc/platforms/ps3/interrupt.c                       | 2 +-
 include/linux/irqdomain.h                                    | 4 ++--
 5 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/Documentation/core-api/irq/irq-domain.rst b/Documentation/core-api/irq/irq-domain.rst
index f88a6ee67a35..44f4ba5480df 100644
--- a/Documentation/core-api/irq/irq-domain.rst
+++ b/Documentation/core-api/irq/irq-domain.rst
@@ -141,7 +141,7 @@ No Map
 
 ::
 
-	irq_domain_add_nomap()
+	irq_domain_create_nomap()
 
 The No Map mapping is to be used when the hwirq number is
 programmable in the hardware.  In this case it is best to program the
diff --git a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
index 9174fce12c1b..ecb23cfbc9fc 100644
--- a/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
+++ b/Documentation/translations/zh_CN/core-api/irq/irq-domain.rst
@@ -124,7 +124,7 @@ irq_domain_add_tree()和irq_domain_create_tree()在功能上是等价的，除
 
 ::
 
-	irq_domain_add_nomap()
+	irq_domain_create_nomap()
 
 当硬件中的hwirq号是可编程的时候，就可以采用无映射类型。 在这种情况下，最好将
 Linux IRQ号编入硬件本身，这样就不需要映射了。 调用irq_create_direct_mapping()
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 09e7fe24fac1..88e92af8acf9 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -190,7 +190,7 @@ static int __init psurge_secondary_ipi_init(void)
 {
 	int rc = -ENOMEM;
 
-	psurge_host = irq_domain_add_nomap(NULL, ~0, &psurge_host_ops, NULL);
+	psurge_host = irq_domain_create_nomap(NULL, ~0, &psurge_host_ops, NULL);
 
 	if (psurge_host)
 		psurge_secondary_virq = irq_create_direct_mapping(psurge_host);
diff --git a/arch/powerpc/platforms/ps3/interrupt.c b/arch/powerpc/platforms/ps3/interrupt.c
index 95e96bd61a20..a4ad4b49eef7 100644
--- a/arch/powerpc/platforms/ps3/interrupt.c
+++ b/arch/powerpc/platforms/ps3/interrupt.c
@@ -743,7 +743,7 @@ void __init ps3_init_IRQ(void)
 	unsigned cpu;
 	struct irq_domain *host;
 
-	host = irq_domain_add_nomap(NULL, PS3_PLUG_MAX + 1, &ps3_host_ops, NULL);
+	host = irq_domain_create_nomap(NULL, PS3_PLUG_MAX + 1, &ps3_host_ops, NULL);
 	irq_set_default_domain(host);
 
 	for_each_possible_cpu(cpu) {
diff --git a/include/linux/irqdomain.h b/include/linux/irqdomain.h
index 1480951a690b..984d0188f9ec 100644
--- a/include/linux/irqdomain.h
+++ b/include/linux/irqdomain.h
@@ -431,13 +431,13 @@ static inline struct irq_domain *irq_domain_add_linear(struct device_node *of_no
 }
 
 #ifdef CONFIG_IRQ_DOMAIN_NOMAP
-static inline struct irq_domain *irq_domain_add_nomap(struct device_node *of_node,
+static inline struct irq_domain *irq_domain_create_nomap(struct fwnode_handle *fwnode,
 					 unsigned int max_irq,
 					 const struct irq_domain_ops *ops,
 					 void *host_data)
 {
 	struct irq_domain_info info = {
-		.fwnode		= of_fwnode_handle(of_node),
+		.fwnode		= fwnode,
 		.hwirq_max	= max_irq,
 		.direct_max	= max_irq,
 		.ops		= ops,
-- 
2.49.0



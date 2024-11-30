Return-Path: <linuxppc-dev+bounces-3624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C41EE9DF2E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2024 21:11:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y11RF23LPz2xfb;
	Sun,  1 Dec 2024 07:11:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=52.95.49.90
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732997513;
	cv=none; b=kzyZxA35R6rIhRVkDyQhGakm/Hxgngf4R5nGNrLVamDfWMxac+KX/P8fIS4qCj37ltZQNeu39XhbCs2ybZ5L/LU+lEq7eWJUYIHvu2nCS8M/b4AWdWZ823sHwtdXcbpWATuu8d1SiS1zvTd3xneQgAYtWtC0LmAZuUXtgqTXqTmAWqFj6jJ5NyFc9d7ARfPvHxAXsCuwjYBg5499qLCCE8IaTje0isYzbBDUSPfbfucrOGIudKArVXjEUP1Esp2ku/vHZAkjXKbZRLMtheVxm5TNDRQu2U5Mc0gxzyKg9YIUOMjwX8F6h3KgyrxAlpZJEHZXBEbZuXodRgp9F1WMMg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732997513; c=relaxed/relaxed;
	bh=t+WQb6BJgufEUtZmDEGv1ME0aTsf7gIJocZMkFV+cR4=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=mju8/G1bDjhBvlsdH1i1KzN9+DIIpDtYgm39nJ7VB/6jlh4LhsCvbmcYp0nJd03Y9v3sISZJpgA4Vcxn6pT1Ie1eFEMVFadZFRq4W4g8LGb9orj/qsjkCse70WxWMG22GGVqSABB2fijGAokdAzmJz2Xide+qp8DNKvTrOhjsvSaBSPX4gOXH45PdRVOLdU/NyyAunWF0GhErSQpPaLavcqDGxCbvCqiPymg2hcZcQ6HN9m5VKmYVz1+TlRjhlgjFpqlKBL66pwAoQ1KaAAur9shSnEDz2mNv3zWHAWNH2gv9smeLlgKTasenfIY7kdMUGdS5JltXcA70yu+NsbP+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=JRBWAObQ; dkim-atps=neutral; spf=pass (client-ip=52.95.49.90; helo=smtp-fw-6002.amazon.com; envelope-from=prvs=057a1cabc=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=JRBWAObQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=52.95.49.90; helo=smtp-fw-6002.amazon.com; envelope-from=prvs=057a1cabc=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-6002.amazon.com (smtp-fw-6002.amazon.com [52.95.49.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y11RC728tz2y66
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Dec 2024 07:11:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732997512; x=1764533512;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=t+WQb6BJgufEUtZmDEGv1ME0aTsf7gIJocZMkFV+cR4=;
  b=JRBWAObQobcX5d0hw917+hai3xmRBGOwkTAuOLTjxa3tZ3cvlIjDsXpo
   ct9jBBmZ3KbzCV0jaD8pzFwU9/q+oQa/TcWV4pmwQH9tUVuFvRKGwQmNP
   kfax21D5eevRsM/Ge22V7AHnQIXVjrtRqMOjhh0cagKxaEZk3zOouui4f
   8=;
X-IronPort-AV: E=Sophos;i="6.12,199,1728950400"; 
   d="scan'208";a="452383875"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-6002.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2024 20:11:46 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.21.151:11108]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.190:2525] with esmtp (Farcaster)
 id 49529e1b-bc79-4e0e-b4f2-a5e69d56acc6; Sat, 30 Nov 2024 20:11:45 +0000 (UTC)
X-Farcaster-Flow-ID: 49529e1b-bc79-4e0e-b4f2-a5e69d56acc6
Received: from EX19D013UWB001.ant.amazon.com (10.13.138.52) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 30 Nov 2024 20:11:44 +0000
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.204) by
 EX19D013UWB001.ant.amazon.com (10.13.138.52) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Sat, 30 Nov 2024 20:11:44 +0000
Received: from email-imr-corp-prod-pdx-all-2b-22fa938e.us-west-2.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Sat, 30 Nov 2024 20:11:44 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-pdx-all-2b-22fa938e.us-west-2.amazon.com (Postfix) with ESMTP id 0512FC05E4;
	Sat, 30 Nov 2024 20:11:44 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id 8F5347001; Sat, 30 Nov 2024 20:11:43 +0000 (UTC)
From: Eliav Farber <farbere@amazon.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <maddy@linux.ibm.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
	<akpm@linux-foundation.org>, <bhe@redhat.com>, <farbere@amazon.com>,
	<hbathini@linux.ibm.com>, <sourabhjain@linux.ibm.com>,
	<adityag@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<takakura@valinux.co.jp>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>
CC: <jonnyc@amazon.com>
Subject: [PATCH v5 0/2] Improve interrupt handling during machine kexec
Date: Sat, 30 Nov 2024 20:11:41 +0000
Message-ID: <20241130201143.48808-1-farbere@amazon.com>
X-Mailer: git-send-email 2.40.1
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
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Spam-Status: No, score=-10.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This patch series focuses on improving the machine_kexec_mask_interrupts()
function by consolidating its implementation and optimizing its behavior to
avoid redundant interrupt masking.

Patch Summary:
[PATCH v5 1/2] Move machine_kexec_mask_interrupts() to kernel/irq/kexec.c,
               removing duplicate architecture-specific implementations.
[PATCH v5 2/2] Refine machine_kexec_mask_interrupts() to avoid re-masking
               already-masked interrupts, resolving specific warnings
               triggered in GPIO IRQ flows.

Changes between v4 and v5:
 - The function machine_kexec_mask_interrupts() has been moved
   from kernel/kexec_core.c to a new file kernel/irq/kexec.c.
 - A new configuration option, GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD, has been
   added.
 - The parameters for the machine_kexec_mask_interrupts() function have
   been defined in reverse Christmas Tree style.
 - The comment explaining the call to irq_set_irqchip_state() has been
   improved for clarity.
 - The phrase 'This patch' has been removed from the commit message.
 
Changes between v3 and v4:
 - Add missing <linux/irqdesc.h> and <linux/irq.h> includes.

Eliav Farber (2):
  kexec: Consolidate machine_kexec_mask_interrupts() implementation
  kexec: Prevent redundant IRQ masking by checking state before shutdown

 arch/arm/kernel/machine_kexec.c   | 23 --------------------
 arch/arm64/Kconfig                |  1 +
 arch/arm64/kernel/machine_kexec.c | 31 --------------------------
 arch/powerpc/include/asm/kexec.h  |  1 -
 arch/powerpc/kexec/core.c         | 22 -------------------
 arch/powerpc/kexec/core_32.c      |  1 +
 arch/riscv/kernel/machine_kexec.c | 23 --------------------
 include/linux/irq.h               |  3 +++
 kernel/irq/Kconfig                |  9 ++++++++
 kernel/irq/Makefile               |  2 +-
 kernel/irq/kexec.c                | 36 +++++++++++++++++++++++++++++++
 11 files changed, 51 insertions(+), 101 deletions(-)
 create mode 100644 kernel/irq/kexec.c

-- 
2.40.1



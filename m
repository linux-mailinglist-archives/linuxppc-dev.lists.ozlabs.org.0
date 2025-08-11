Return-Path: <linuxppc-dev+bounces-10794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB796B20391
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Aug 2025 11:29:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c0q8V2MYpz3cht;
	Mon, 11 Aug 2025 19:29:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754904554;
	cv=none; b=Q7rpt/OKC0FPfk/dUvR9pVR/jijnG34ERR7CYxGMqW8wT4UtE4bjc3kOXwWLVjJPW0bdWeLVUef5A40acHVFPnBN5/PQ2mz1yFaC5oIFKEsO3nXjv/lHHkQOLrPQxyzIFEntimPNijYNWIrreIYnDDbQBT7iEoZ/Ei9xEFWEIAcpPimj55ABZorIqJausrPB4eJIR6oAs5mmvQBthfLy6oBjzwkPfP92qVxE9VnvSm7EuSgUnzSuI8hsNNdtWej8FLRmU74vYlL6soGXCGrzV35Hx2s0UtJj35LUKe1yHGYp6hpgLyx7Myhe/m62NoPXt9EAKb1c5QVpTx5L6dEBMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754904554; c=relaxed/relaxed;
	bh=AXKzVCw7IsUb34U/kKmIY7e47KoojqYo9HB446Sbrjg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WJEYSChNUaWDeABhCAfo/vVBGO+FIYWfQ6NSCEOmVHZGTCCgGpBDkHQQGiJ8Ky1dBBRMWb9Hp6vIb/wHRRNqlWeJgP12x9OqEUODyejJtDT3/mrgPiWPqsYDMtvGdRJ7hMia6cNhiwZRx0JO6UGGHwz37/QO0g3W+UoI0pJZJNyPSXdIhEAzDZh/JhNDDNxcHEIHVAf2J8zIbgjC0Y1VmnQ6Q5psviWhPdJhZN7Kmkc2H1SS8Es//D7ySQ8eiOR6GUTXVOxRqVPN8QJo+GR63YCcJVfL4w3sGmRiGZUbJ7BFS/ZTj3AllVeuIi9jF9KoS1w97vmntrtwbV8NZkh05Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=x/oxzYql; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nAh/6cZb; dkim-atps=neutral; spf=pass (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=x/oxzYql;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=nAh/6cZb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=193.142.43.55; helo=galois.linutronix.de; envelope-from=namcao@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c0q8T529Nz3cjG
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Aug 2025 19:29:13 +1000 (AEST)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1754904541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AXKzVCw7IsUb34U/kKmIY7e47KoojqYo9HB446Sbrjg=;
	b=x/oxzYqlZ+jopJclpXABwRfCmmhNSAxw/zAMigRGh/gXsH3CQ3AAgQgpMBvnGc9Wt8tEAL
	rPmpOMzzLkoMhJTH746XaQd6Qp4KNy2Flx1NiObT8MWu/F12ORjkPHuH0kHori96p1g6ea
	Ll343aYX7u7KkwdSLtQOzWYSg4q9Eu2IGKyKMmz6P0BNFv3qgwPaij0PXureexBI1zYnbV
	qNYnEyCeSma4SFLo1zH5feNR1JyGxm5NHPQAF7pBP/cj4VQ1w1aS5kOGl76h7XQNZkk6P1
	1sjEMJoocSznpnak3o9mVrymW7g8AwN8osMMeXvpyHv2SQ7jwEAZhrVAZDbQJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1754904541;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=AXKzVCw7IsUb34U/kKmIY7e47KoojqYo9HB446Sbrjg=;
	b=nAh/6cZbbnnR1MjZsdwQK1r/HmAyyfsRbnB/eXeB6CgQp9zOYVZTtwK/kl+ajKiDSNQyRj
	9DhVImlDoky8wwDw==
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Gautam Menghani <gautam@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2 0/3] powerpc: Cleanup and convert to MSI parent domain
Date: Mon, 11 Aug 2025 11:28:53 +0200
Message-Id: <cover.1754903590.git.namcao@linutronix.de>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The initial implementation of PCI/MSI interrupt domains in the hierarchical
interrupt domain model used a shortcut by providing a global PCI/MSI
domain.

This works because the PCI/MSI[X] hardware is standardized and uniform, but
it violates the basic design principle of hierarchical interrupt domains:
Each hardware block involved in the interrupt delivery chain should have a
separate interrupt domain.

For PCI/MSI[X], the interrupt controller is per PCI device and not a global
made-up entity.

Unsurprisingly, the shortcut turned out to have downsides as it does not
allow dynamic allocation of interrupt vectors after initialization and it
prevents supporting IMS on PCI. For further details, see:

https://lore.kernel.org/lkml/20221111120501.026511281@linutronix.de/

The solution is implementing per device MSI domains, this means the
entities which provide global PCI/MSI domain so far have to implement MSI
parent domain functionality instead.

This series:

   - Untangle XIVE driver from Powernv and Pseries drivers

   - Convert the Powernv and Pseries drivers to implement MSI parent domain
     functionality

v2: Fix up boot issue with NVMe

Nam Cao (3):
  powerpc/xive: Untangle xive from child interrupt controller drivers
  powerpc/powernv/pci: Switch to use msi_create_parent_irq_domain()
  powerpc/pseries/msi: Switch to msi_create_parent_irq_domain()

 arch/powerpc/include/asm/pci-bridge.h     |   2 -
 arch/powerpc/include/asm/xive.h           |   1 -
 arch/powerpc/platforms/powernv/Kconfig    |   1 +
 arch/powerpc/platforms/powernv/pci-ioda.c |  96 ++++++----------
 arch/powerpc/platforms/pseries/Kconfig    |   1 +
 arch/powerpc/platforms/pseries/msi.c      | 132 ++++++++--------------
 arch/powerpc/sysdev/xive/common.c         |  63 +++++------
 7 files changed, 117 insertions(+), 179 deletions(-)

--=20
2.39.5



Return-Path: <linuxppc-dev+bounces-3608-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1169DC2E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2024 12:31:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y09xL0Gn6z2yvh;
	Fri, 29 Nov 2024 22:31:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=52.95.48.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732879893;
	cv=none; b=cydZhfh/DUMteOWZTCOcDekczFjodLihNpHEF4amlW1WokHVMkgjuK3U1IB/l0NmCYnJUEFGjjpkgpy3/ZiSjjMHta1iyP7c6v6+KM/030sYfY2EjHx4IaRxmjCswlxi1Adt6dBXiMjuvZVnjDsTlAx9BJLMPipcJ+qI72XkarGZGJvFAfzYaETuJm2SYWbZD4iC1bol22BR8hrEvT2jR3f0VHYUkZi1aGIbeSNFtO+l6sSROanFImruW1OGqag/jQ9Yh0iBz7lCXs1NdjXHjpEKNrzrgKQAuiWnklMVzG4Rm6cN4zknmUnXAwcy6JzOAQrtVe8HFHB/2QClqkUipA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732879893; c=relaxed/relaxed;
	bh=XxQ3De7RUhc+RdOPHYM+OjqpU7dn3KwiW10hYXSFbC8=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=g6O1aSmXFOn5pzeb14bQexUC8lpEgPf37urjCgX3BblesvmviVB7q3uSpBRQquk/Ke+knO3Q/bBNl5d48KwdJcXu75r0LcRjwqvdZH1ddX/MD9nXweqORnuSWTiUjkb5c+3vDBGEIXlkmWWJE/f0FfeNgcW24WlY6e57ihM3aJSrjnh5UNUEr99IsRAI22WB7x/Oic7OvRFqtNGIGolAg1gVRSYRBgb/lRfoJw6hpfV94dV9ptcJRaxdhg6NGjBNIEy4kMPptVMSVAjLM6z65Pfc75rggOdHn9pqJReqHB7R4irCHxw4PWGRAMzp7I+Nsbd292663uaTN/BZ6ka69A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=SmXQC/h0; dkim-atps=neutral; spf=pass (client-ip=52.95.48.154; helo=smtp-fw-6001.amazon.com; envelope-from=prvs=056b32221=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=SmXQC/h0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=52.95.48.154; helo=smtp-fw-6001.amazon.com; envelope-from=prvs=056b32221=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-6001.amazon.com (smtp-fw-6001.amazon.com [52.95.48.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y09xH3pRVz2ytl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2024 22:31:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732879892; x=1764415892;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=XxQ3De7RUhc+RdOPHYM+OjqpU7dn3KwiW10hYXSFbC8=;
  b=SmXQC/h05OAEx8AbyIVAVy64MLxUVfd/XfMG/zj5VMh/yusAc0DUjtJL
   j7cawSctR16BiQ1+PfUtLGP3syksbsx5gDMf3eIweLY1e2zD1JkIVo1Vl
   r8t034E1uWO6FdsV+2moj9sBfA5c5qF2m0cJP6fYv5vKYkngF7tqJpTXk
   0=;
X-IronPort-AV: E=Sophos;i="6.12,195,1728950400"; 
   d="scan'208";a="441793923"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.2])
  by smtp-border-fw-6001.iad6.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 11:31:25 +0000
Received: from EX19MTAUWA002.ant.amazon.com [10.0.38.20:47324]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.2:2525] with esmtp (Farcaster)
 id ecdc713d-df63-4dcd-9dd4-55bcc88c3341; Fri, 29 Nov 2024 11:31:24 +0000 (UTC)
X-Farcaster-Flow-ID: ecdc713d-df63-4dcd-9dd4-55bcc88c3341
Received: from EX19D013UWB002.ant.amazon.com (10.13.138.21) by
 EX19MTAUWA002.ant.amazon.com (10.250.64.202) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 29 Nov 2024 11:31:20 +0000
Received: from EX19MTAUEA002.ant.amazon.com (10.252.134.9) by
 EX19D013UWB002.ant.amazon.com (10.13.138.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Fri, 29 Nov 2024 11:31:19 +0000
Received: from email-imr-corp-prod-iad-all-1a-8c151b82.us-east-1.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.134.34) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Fri, 29 Nov 2024 11:31:19 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-iad-all-1a-8c151b82.us-east-1.amazon.com (Postfix) with ESMTP id 78A5940640;
	Fri, 29 Nov 2024 11:31:19 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id 355A79E9A; Fri, 29 Nov 2024 11:31:19 +0000 (UTC)
From: Eliav Farber <farbere@amazon.com>
To: <linux@armlinux.org.uk>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <maddy@linux.ibm.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <tglx@linutronix.de>,
	<ebiederm@xmission.com>, <akpm@linux-foundation.org>, <bhe@redhat.com>,
	<farbere@amazon.com>, <hbathini@linux.ibm.com>, <sourabhjain@linux.ibm.com>,
	<adityag@linux.ibm.com>, <songshuaishuai@tinylab.org>,
	<takakura@valinux.co.jp>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-riscv@lists.infradead.org>, <kexec@lists.infradead.org>
CC: <jonnyc@amazon.com>
Subject: [PATCH v4 0/2] Improve interrupt handling during machine kexec
Date: Fri, 29 Nov 2024 11:31:17 +0000
Message-ID: <20241129113119.26669-1-farbere@amazon.com>
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
[PATCH v4 1/2] Move machine_kexec_mask_interrupts() to kexec_core.c,
               removing duplicate architecture-specific implementations.
[PATCH v4 2/2] Refine machine_kexec_mask_interrupts() to avoid re-masking
               already-masked interrupts, resolving specific warnings
               triggered in GPIO IRQ flows.

Changes between v3 and v4:
 - Add missing <linux/irqdesc.h> and <linux/irq.h> includes.

Eliav Farber (2):
  kexec: Consolidate machine_kexec_mask_interrupts() implementation
  kexec: Prevent redundant IRQ masking by checking state before shutdown

 arch/arm/kernel/machine_kexec.c   | 23 -----------------------
 arch/arm64/kernel/machine_kexec.c | 31 -------------------------------
 arch/powerpc/include/asm/kexec.h  |  1 -
 arch/powerpc/kexec/core.c         | 22 ----------------------
 arch/riscv/kernel/machine_kexec.c | 23 -----------------------
 include/linux/irq.h               |  3 +++
 include/linux/kexec.h             |  2 ++
 kernel/irq/internals.h            |  1 -
 kernel/kexec_core.c               | 30 ++++++++++++++++++++++++++++++
 9 files changed, 35 insertions(+), 101 deletions(-)

-- 
2.40.1



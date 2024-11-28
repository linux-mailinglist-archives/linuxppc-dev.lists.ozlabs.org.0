Return-Path: <linuxppc-dev+bounces-3602-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 404139DBCC5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2024 21:10:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XznVm6sDHz2ywC;
	Fri, 29 Nov 2024 07:10:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=207.171.184.29
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732824640;
	cv=none; b=hOdMpFeI8dWuOSYaVcg2FkftbCRB2FcZH6ByB6fqxys0h4xuJwMfAhwwQ+VEN2NXCzeHYsabfL2SvXaNWAy6iDmpzW5QiVLdGbD9j6YMENLN701EjBGz3j9Rehk4VwY3guMvRwsz7tBTeNYb4MBM4dV3I/3vszKEVZbZERYWGzc2g9yneTk+ysNauYF4Zx4angQU0md+dqbEujSumQvCm8IQFqPW91IJW8HAFTcmLAQmD2qdQezhhZ27hm3kowYd+/LD+7wRXhalaLqT59FtnfaOfWf10NUhh2k+7QxdlUmwuZd/G4kz3RnjcX93NU9GEaQ4iyHttYRye+mUdzXS9w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732824640; c=relaxed/relaxed;
	bh=Oqbo5Ux4OrhsJI4uowmEwMruoxJmsMCjMmy8LyWeTpM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=U9l5lAc6eMHDTg3AZ+u/6TMXdi/SQbwKUqLDWNEleI0jb9dWkSvAT0uxd8UwHUwAdf033PMTI6UJGKrx3nlp1V128teN+XP5xKXuZSbks8vlmBpo5qHSiFIRtyirWkOC3jvYpXqlASAyTinXW1bnT58UUCdUt9zKaX31UhHsxuq9e6FZCbOjR5Siime92NBFD4lGtDpgBpkPq0ztUaEV3Xv+P05EhWuHErpbt3JQGFHVnSt8YTGZC7pIL3JOjEcDBFjPdgh/0nRQ51HFykpe1uYJN7EyjvkPvGlxI2Hx8Gg2wKFuoX7knSI1+qULnpsabA3LBiYYooLiXBKZrwMDAw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=Bt0/BXLj; dkim-atps=neutral; spf=pass (client-ip=207.171.184.29; helo=smtp-fw-9102.amazon.com; envelope-from=prvs=055e4adf4=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=Bt0/BXLj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=207.171.184.29; helo=smtp-fw-9102.amazon.com; envelope-from=prvs=055e4adf4=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-9102.amazon.com (smtp-fw-9102.amazon.com [207.171.184.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XznVl4pL3z2yvj
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2024 07:10:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1732824640; x=1764360640;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Oqbo5Ux4OrhsJI4uowmEwMruoxJmsMCjMmy8LyWeTpM=;
  b=Bt0/BXLjM9Z455hp0+L1VSjS1OQ/Jlae9+qaZHINid8VIplK0+IRahpN
   uX7T8JQB8ySN1pLJurzTLA9xLdmCTdkDLuyRjIfDfi+coGEHWgsqRzM+z
   F4EaQ7At0drJ2CPrdsvl4ZyyxSGFTQ+3Z3pcTqYFlA4oHioulfYm7dbxj
   g=;
X-IronPort-AV: E=Sophos;i="6.12,193,1728950400"; 
   d="scan'208";a="474023892"
Received: from pdx4-co-svc-p1-lb2-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.25.36.214])
  by smtp-border-fw-9102.sea19.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 20:10:32 +0000
Received: from EX19MTAUWB001.ant.amazon.com [10.0.21.151:3078]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.32.230:2525] with esmtp (Farcaster)
 id e228fb57-fca2-4faa-a153-d79a23d0243c; Thu, 28 Nov 2024 20:10:31 +0000 (UTC)
X-Farcaster-Flow-ID: e228fb57-fca2-4faa-a153-d79a23d0243c
Received: from EX19D013UWB004.ant.amazon.com (10.13.138.62) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 28 Nov 2024 20:10:28 +0000
Received: from EX19MTAUWA001.ant.amazon.com (10.250.64.204) by
 EX19D013UWB004.ant.amazon.com (10.13.138.62) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Thu, 28 Nov 2024 20:10:28 +0000
Received: from email-imr-corp-prod-iad-all-1b-3ae3de11.us-east-1.amazon.com
 (10.25.36.214) by mail-relay.amazon.com (10.250.64.204) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Thu, 28 Nov 2024 20:10:28 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-iad-all-1b-3ae3de11.us-east-1.amazon.com (Postfix) with ESMTP id 82252A0279;
	Thu, 28 Nov 2024 20:10:27 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id 3FB005ED0; Thu, 28 Nov 2024 20:10:27 +0000 (UTC)
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
Subject: [PATCH v3 0/2] Improve interrupt handling during machine kexec
Date: Thu, 28 Nov 2024 20:10:25 +0000
Message-ID: <20241128201027.10396-1-farbere@amazon.com>
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

This patch series focuses on improving the machine_kexec_mask_interrupts()
function by consolidating its implementation and optimizing its behavior to
avoid redundant interrupt masking.

Patch Summary:
[PATCH v3 1/2] Move machine_kexec_mask_interrupts() to kexec_core.c,
               removing duplicate architecture-specific implementations.
[PATCH v3 2/2] Refine machine_kexec_mask_interrupts() to avoid re-masking
               already-masked interrupts, resolving specific warnings
               triggered in GPIO IRQ flows.

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
 kernel/kexec_core.c               | 28 ++++++++++++++++++++++++++++
 9 files changed, 33 insertions(+), 101 deletions(-)

-- 
2.40.1



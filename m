Return-Path: <linuxppc-dev+bounces-3794-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E638A9E3C8E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 15:20:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3KRh73mgz30WM;
	Thu,  5 Dec 2024 01:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=52.119.213.152
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733322016;
	cv=none; b=Q5YYl1fMoq9rQu28Yl75abkwrEd0a6aaVKczAiIxVrMSif+RjoppyRpnBF8axr/MDbRQWdunFrr12lVXaoLzyHnsde2OXTbeiN+zYUunICod/XyDaHl73y/uMDOgSOZmirCYk2J6y9zak2O24a0qgP4WI17c0icrfxGEpbyA/uHMGLXQJVvItOSidHufB56AUH5MbED+CzDVs54Z/3+R5TLuuV4RvPJybxQ9peM/TAgJmejVHLFP8eSf2pZyI/ArVl+vXieDVKM18SwLkDzu7Z/oYdlxlfiDTXcfy7LMBBY6gEbAw7XNrUCyg8StGbhe3GJ8sJj+WkX0lPMH1oV+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733322016; c=relaxed/relaxed;
	bh=zswYcgJLwrXZ5Noz0/+vVn+a499HuoexmUzvToEzvkM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PTNUedNxhHgr2XjajpWdwsaDeWzlf9UohKSiP2rvzJHB7cq0T5JvK+gnkxdTK0vEBMCcw+c1l7U7q/CQoEBiaELYKoTTEqR/EGmIZqsKo+RcFPJl8RSuSrgoPpoUuhbWT4JwK7oeVmOBilqFU77D/I1pBMa3BGfQ79aQYvUEKmnPkQPoV8fk2qVQMe3jDOKxKi2+Rp5JjOXmWuMIENyJ3Z7KYS2jLy3lVlHD9/IO7xEZFztddOdCdgTVywInGJhMfkpxOaGRxQtzuj92MX6fbHed0RfKReKP57VAvR7OZN+0og+12fvjLL0oeR+E1UlbCM/JTujvfUNtQesdqpJFzg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=NW2xKzi/; dkim-atps=neutral; spf=pass (client-ip=52.119.213.152; helo=smtp-fw-52003.amazon.com; envelope-from=prvs=061ca9da5=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=NW2xKzi/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=52.119.213.152; helo=smtp-fw-52003.amazon.com; envelope-from=prvs=061ca9da5=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-52003.amazon.com (smtp-fw-52003.amazon.com [52.119.213.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3KRf5FQ0z30VY
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 01:20:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1733322014; x=1764858014;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=zswYcgJLwrXZ5Noz0/+vVn+a499HuoexmUzvToEzvkM=;
  b=NW2xKzi/dwq1u//vHpia+s4UeFL9T+jd95g9jbParj+W5shXKlkXt2Jg
   XmBo7zjiQEixnG8wganZyCgGzURNRRvgrkyyRGc0PyZ0dvXHuskOS1uAS
   m63wUfTbUOq6okw468JVm1B3kPmVY3YViSALpz7M9ImFckinjrb0Hol9B
   4=;
X-IronPort-AV: E=Sophos;i="6.12,207,1728950400"; 
   d="scan'208";a="46564984"
Received: from iad6-co-svc-p1-lb1-vlan3.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.6])
  by smtp-border-fw-52003.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 14:20:05 +0000
Received: from EX19MTAUWC001.ant.amazon.com [10.0.7.35:50901]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.190:2525] with esmtp (Farcaster)
 id 609709e8-0189-4b6b-b1ef-da475ec79ee4; Wed, 4 Dec 2024 14:20:05 +0000 (UTC)
X-Farcaster-Flow-ID: 609709e8-0189-4b6b-b1ef-da475ec79ee4
Received: from EX19D013UWB003.ant.amazon.com (10.13.138.111) by
 EX19MTAUWC001.ant.amazon.com (10.250.64.174) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 4 Dec 2024 14:20:04 +0000
Received: from EX19MTAUEC002.ant.amazon.com (10.252.135.146) by
 EX19D013UWB003.ant.amazon.com (10.13.138.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 4 Dec 2024 14:20:04 +0000
Received: from email-imr-corp-prod-iad-all-1a-6ea42a62.us-east-1.amazon.com
 (10.124.125.6) by mail-relay.amazon.com (10.252.135.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Wed, 4 Dec 2024 14:20:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-iad-all-1a-6ea42a62.us-east-1.amazon.com (Postfix) with ESMTP id DBF344066C;
	Wed,  4 Dec 2024 14:20:03 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id 98F487591; Wed,  4 Dec 2024 14:20:03 +0000 (UTC)
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
Subject: [PATCH v6 0/2] Improve interrupt handling during machine kexec
Date: Wed, 4 Dec 2024 14:20:01 +0000
Message-ID: <20241204142003.32859-1-farbere@amazon.com>
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
[PATCH v6 1/2] Move machine_kexec_mask_interrupts() to kernel/irq/kexec.c,
               removing duplicate architecture-specific implementations.
[PATCH v6 2/2] Refine machine_kexec_mask_interrupts() to avoid re-masking
               already-masked interrupts, resolving specific warnings
               triggered in GPIO IRQ flows.

Changes between v5 and v6:
 - Change GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD to not be user selectable.

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
 kernel/irq/Kconfig                |  6 ++++++
 kernel/irq/Makefile               |  2 +-
 kernel/irq/kexec.c                | 36 +++++++++++++++++++++++++++++++
 11 files changed, 48 insertions(+), 101 deletions(-)
 create mode 100644 kernel/irq/kexec.c

-- 
2.40.1



Return-Path: <linuxppc-dev+bounces-3793-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C81C9E3C8D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Dec 2024 15:20:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y3KRh6jVTz30Vb;
	Thu,  5 Dec 2024 01:20:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=52.119.213.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733322016;
	cv=none; b=nCkP2pK+WUJoTVLmzjZWHceaxP7LRJwEHctfcSsm9u8ojg9GsqM+osCb+Pmx+p+DkilsFxTbiE5fhh3/7o1ePGwo+RLhgkVuG5DvbhGb5b+i52ODTU8zziexkAflDg1a6c9IfK045hjFjFf0hRmXvdnVVJ6S0icq92gzaySl35ltieteWSRSzmoLcPTZu2VrVztbtpRvPBjR7PPTrWTIOuQHWloBkIjWlrQeTe7UUDi3jf32FeISGtmyq3uLmy1zUXLUJJJvrtarwSA0Fpl4AtOYtGn2N7Mc7yqsBYxoIqR5S8bQ56T+ceArjPbN596bWsWZRVlgPMaGMaMEw0Ez9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733322016; c=relaxed/relaxed;
	bh=5mJN0xDsc3RBo9kCI5VpP+8GDP08z7fNPcgv7+CVrqU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BLbyHdToBCPENbVoBdzSnqBjZVrPtvlBansLJsRksIa9bm8cYsvWsXKMDPNpzu4V7xUqlqgJdavjz2KdSk3a4mUszEN3gtSINxRSTBnzvt38NFDI4OSOQVWucn0oyjUj9V7ODljleU0e0aNdtWJZLcKsxeug2gUpkzMWaTz99Zwie9DCBVFeVOP3gJ7D4ZIViWpKUlVBY25PVnCCOoGE7iI7cjHl0LFog2S84Hdp1qW2HYwu+3mytDsntWaAc0VxqovC53gYRjNQ0K5aWd1JmhnMLsYglRTlGfx3qp+dr6XU+JFYJY9504Fwb1NhVPdllcsQFLQRYPR7DyKS+4wjjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=f63snR/S; dkim-atps=neutral; spf=pass (client-ip=52.119.213.154; helo=smtp-fw-52004.amazon.com; envelope-from=prvs=061ca9da5=farbere@amazon.com; receiver=lists.ozlabs.org) smtp.mailfrom=amazon.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amazon.com header.i=@amazon.com header.a=rsa-sha256 header.s=amazon201209 header.b=f63snR/S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amazon.com (client-ip=52.119.213.154; helo=smtp-fw-52004.amazon.com; envelope-from=prvs=061ca9da5=farbere@amazon.com; receiver=lists.ozlabs.org)
Received: from smtp-fw-52004.amazon.com (smtp-fw-52004.amazon.com [52.119.213.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y3KRf4kmCz30Sx
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Dec 2024 01:20:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1733322014; x=1764858014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5mJN0xDsc3RBo9kCI5VpP+8GDP08z7fNPcgv7+CVrqU=;
  b=f63snR/SBAYEqBGcxGYfbjp3wnNaozf1gb6dBuMufwbkJmUAw6KXMdiM
   gNEKbT2kJJnL5iuVS9ueNlky5Q7oJo5ZIPwlv1tLmDewzSP1ltumlfjVC
   oR5vmhcQrvsYRKEy6Vwr+uR6nwo3ITg0+IMuPYDA2yQFNQK7zFt33v6Th
   g=;
X-IronPort-AV: E=Sophos;i="6.12,207,1728950400"; 
   d="scan'208";a="252220900"
Received: from iad6-co-svc-p1-lb1-vlan2.amazon.com (HELO smtpout.prod.us-west-2.prod.farcaster.email.amazon.dev) ([10.124.125.2])
  by smtp-border-fw-52004.iad7.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2024 14:20:05 +0000
Received: from EX19MTAEUA001.ant.amazon.com [10.0.10.100:35215]
 by smtpin.naws.eu-west-1.prod.farcaster.email.amazon.dev [10.0.23.253:2525] with esmtp (Farcaster)
 id 4f701277-230b-4dbe-9bbd-a2fd4c729600; Wed, 4 Dec 2024 14:20:04 +0000 (UTC)
X-Farcaster-Flow-ID: 4f701277-230b-4dbe-9bbd-a2fd4c729600
Received: from EX19D018EUA004.ant.amazon.com (10.252.50.85) by
 EX19MTAEUA001.ant.amazon.com (10.252.50.223) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.35;
 Wed, 4 Dec 2024 14:20:04 +0000
Received: from EX19MTAUEB002.ant.amazon.com (10.252.135.47) by
 EX19D018EUA004.ant.amazon.com (10.252.50.85) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.1258.34;
 Wed, 4 Dec 2024 14:20:04 +0000
Received: from email-imr-corp-prod-iad-all-1b-1323ce6b.us-east-1.amazon.com
 (10.124.125.2) by mail-relay.amazon.com (10.252.135.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id
 15.2.1258.34 via Frontend Transport; Wed, 4 Dec 2024 14:20:04 +0000
Received: from dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com [172.19.116.181])
	by email-imr-corp-prod-iad-all-1b-1323ce6b.us-east-1.amazon.com (Postfix) with ESMTP id E07CC4056B;
	Wed,  4 Dec 2024 14:20:03 +0000 (UTC)
Received: by dev-dsk-farbere-1a-46ecabed.eu-west-1.amazon.com (Postfix, from userid 14301484)
	id A058A7595; Wed,  4 Dec 2024 14:20:03 +0000 (UTC)
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
Subject: [PATCH v6 2/2] kexec: Prevent redundant IRQ masking by checking state before shutdown
Date: Wed, 4 Dec 2024 14:20:03 +0000
Message-ID: <20241204142003.32859-3-farbere@amazon.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241204142003.32859-1-farbere@amazon.com>
References: <20241204142003.32859-1-farbere@amazon.com>
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

During machine kexec, the function machine_kexec_mask_interrupts() is
responsible for disabling or masking all interrupts. While the irq_disable
hook ensures that an already-disabled IRQ is not disabled again, the
current implementation unconditionally invokes the irq_mask() function for
every interrupt descriptor, even when the interrupt is already masked.

A specific issue was observed in the crash kernel flow after unbinding a
device (prior to kexec) that used a GPIO as an IRQ source. The warning was
triggered by the gpiochip_disable_irq() function, which attempted to clear
the FLAG_IRQ_IS_ENABLED flag when FLAG_USED_AS_IRQ was not set:

```
void gpiochip_disable_irq(struct gpio_chip *gc, unsigned int offset)
{
	struct gpio_desc *desc = gpiochip_get_desc(gc, offset);

	if (!IS_ERR(desc) &&
	    !WARN_ON(!test_bit(FLAG_USED_AS_IRQ, &desc->flags)))
		clear_bit(FLAG_IRQ_IS_ENABLED, &desc->flags);
}
```

This issue surfaced after commit a8173820f441 ("gpio: gpiolib: Allow GPIO
IRQs to lazy disable") introduced lazy disablement for GPIO IRQs. It
replaced disable/enable hooks with mask/unmask hooks. Unlike the disable
hook, the mask hook doesn't handle already-masked IRQs.

When a GPIO-IRQ driver is unbound, the IRQ is released, triggering
__irq_disable() and irq_state_set_masked(). A subsequent call to
machine_kexec_mask_interrupts() re-invokes chip->irq_mask(). This results
in a call chain, including gpiochip_irq_mask() and gpiochip_disable_irq().
Since FLAG_USED_AS_IRQ was cleared earlier, a warning occurs.

Replace calls to irq_mask() and irq_disable() hooks with a simplified call
to irq_shutdown(), and check if the interrupt is started (irqd_is_started)
before calling the shutdown.

Signed-off-by: Eliav Farber <farbere@amazon.com>
---
V5 -> V6: No changes.

 kernel/irq/kexec.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/kernel/irq/kexec.c b/kernel/irq/kexec.c
index 0f9548c1708d..1a3deffe6b5b 100644
--- a/kernel/irq/kexec.c
+++ b/kernel/irq/kexec.c
@@ -17,7 +17,7 @@ void machine_kexec_mask_interrupts(void)
 		int check_eoi = 1;
 
 		chip = irq_desc_get_chip(desc);
-		if (!chip)
+		if (!chip || !irqd_is_started(&desc->irq_data))
 			continue;
 
 		if (IS_ENABLED(CONFIG_GENERIC_IRQ_KEXEC_CLEAR_VM_FORWARD)) {
@@ -31,10 +31,6 @@ void machine_kexec_mask_interrupts(void)
 		if (check_eoi && chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
 			chip->irq_eoi(&desc->irq_data);
 
-		if (chip->irq_mask)
-			chip->irq_mask(&desc->irq_data);
-
-		if (chip->irq_disable && !irqd_irq_disabled(&desc->irq_data))
-			chip->irq_disable(&desc->irq_data);
+		irq_shutdown(desc);
 	}
 }
-- 
2.40.1



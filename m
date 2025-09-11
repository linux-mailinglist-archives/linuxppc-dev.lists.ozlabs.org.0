Return-Path: <linuxppc-dev+bounces-12024-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E5B528DA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 08:35:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMnqN6vXzz2yrV;
	Thu, 11 Sep 2025 16:35:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757572512;
	cv=none; b=dh/WtpURwSTTi8p8GuGHg6xLAFnSjG5gq/qYQlpXNLcgWfZgLCLTqdfl0PAyfm4ZOwjGeu2vEDA2Di7OOtBZcIWchgBoy4BnUSKGtAJ3FckJLsZJ8/q3JBIFO7ZabhhVE5apMxHMEns3dwf4diHCgxI/ZUYhhtUOeaoQ2Trh9eM7SzoSV7ESLpMkV0bAVnMaBsSv47paJwcmjsXwgYPM7B1/brUKRfVHy/ykqIm6c8Oxk/gyMmC7FUgYeSMhmN1qIXBmK97qN8WSKNMjZMoe9G408GyZsio7jesAq/GSvgVRgkp3INNbQ31q/eexXG52H53RTcTz4ZHhtF4xBZIVaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757572512; c=relaxed/relaxed;
	bh=SsAQTCseIJhCQnFQTlVMy9rcg4IKshyIFW2pS9ONYfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PFt+jWHJqFg5fxEROaaThZ9wh7LfDjnvznQ1iqiOaKYALZCLN2Y+vq3WKxLGGkEnHV9zjQNVH35e6emwuZ9Hlx6+UN1/FO2dbteXvU1Lf06gTPVDybg3izLaEjLzeDKV36AEIzYScHD8ssKTU7NQmSa/ameKUsg0iArPoDixxzWAp8UARV0BblO8Yx6oxIrChz0DQ7V5rrqhFyZebToSIzlGKCkJ+6sqnaPJW4m2aWVCj/DHshC1K8bafC9G5VDZEV2Zgh5t4PqvQFCOK9kv8rrh9yJe4wCsEIYYIgIlU8Cf4u5q0qpP8VZ5iiXExsccOuMWKduVcVzGX1/Lucn4VA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Bp6L3BPH; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Bp6L3BPH; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Bp6L3BPH;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=Bp6L3BPH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMnqN0bZKz2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 16:35:12 +1000 (AEST)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 622C2683EE;
	Thu, 11 Sep 2025 06:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757572509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SsAQTCseIJhCQnFQTlVMy9rcg4IKshyIFW2pS9ONYfw=;
	b=Bp6L3BPH2wNxjHr4Ge7sXWw33PRf46TLnWeFpGlvbzdHuc5MvETpIWiS52t/iftWmO/9gY
	iOCWslpNjS+sJrY+K9z+SF1nY1CIbj90ytGZEQKQkK8H7HD6gU6AKpr9Pg/HmdfvDoSZgg
	kONKjLB5a2h6+HWNt3T6+Yv/nRFcsLA=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1757572509; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SsAQTCseIJhCQnFQTlVMy9rcg4IKshyIFW2pS9ONYfw=;
	b=Bp6L3BPH2wNxjHr4Ge7sXWw33PRf46TLnWeFpGlvbzdHuc5MvETpIWiS52t/iftWmO/9gY
	iOCWslpNjS+sJrY+K9z+SF1nY1CIbj90ytGZEQKQkK8H7HD6gU6AKpr9Pg/HmdfvDoSZgg
	kONKjLB5a2h6+HWNt3T6+Yv/nRFcsLA=
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 60C3C1372E;
	Thu, 11 Sep 2025 06:35:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6CUDFpxtwmgSTQAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 11 Sep 2025 06:35:08 +0000
From: Juergen Gross <jgross@suse.com>
To: linux-kernel@vger.kernel.org,
	x86@kernel.org,
	virtualization@lists.linux.dev,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org
Cc: Juergen Gross <jgross@suse.com>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 05/14] paravirt: remove asm/paravirt_api_clock.h
Date: Thu, 11 Sep 2025 08:34:24 +0200
Message-ID: <20250911063433.13783-6-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250911063433.13783-1-jgross@suse.com>
References: <20250911063433.13783-1-jgross@suse.com>
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
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCPT_COUNT_TWELVE(0.00)[37];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[suse.com,broadcom.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,sifive.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,linutronix.de,redhat.com,alien8.de,linux.intel.com,zytor.com,infradead.org,linaro.org,goodmis.org,google.com,suse.de,lists.infradead.org];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLfdszjqhz8kzzb9uwpzdm8png)];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-Spam-Level: 
X-Spam-Score: -6.80
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All architectures supporting CONFIG_PARAVIRT share the same contents
of asm/paravirt_api_clock.h:

  #include <asm/paravirt.h>

So remove all incarnations of asm/paravirt_api_clock.h and remove the
only place where it is included, as there asm/paravirt.h is included
anyway.

Signed-off-by: Juergen Gross <jgross@suse.com>
---
 arch/arm/include/asm/paravirt_api_clock.h       | 1 -
 arch/arm64/include/asm/paravirt_api_clock.h     | 1 -
 arch/loongarch/include/asm/paravirt_api_clock.h | 1 -
 arch/powerpc/include/asm/paravirt_api_clock.h   | 2 --
 arch/riscv/include/asm/paravirt_api_clock.h     | 1 -
 arch/x86/include/asm/paravirt_api_clock.h       | 1 -
 kernel/sched/sched.h                            | 1 -
 7 files changed, 8 deletions(-)
 delete mode 100644 arch/arm/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/arm64/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/loongarch/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/powerpc/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/riscv/include/asm/paravirt_api_clock.h
 delete mode 100644 arch/x86/include/asm/paravirt_api_clock.h

diff --git a/arch/arm/include/asm/paravirt_api_clock.h b/arch/arm/include/asm/paravirt_api_clock.h
deleted file mode 100644
index 65ac7cee0dad..000000000000
--- a/arch/arm/include/asm/paravirt_api_clock.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm/paravirt.h>
diff --git a/arch/arm64/include/asm/paravirt_api_clock.h b/arch/arm64/include/asm/paravirt_api_clock.h
deleted file mode 100644
index 65ac7cee0dad..000000000000
--- a/arch/arm64/include/asm/paravirt_api_clock.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm/paravirt.h>
diff --git a/arch/loongarch/include/asm/paravirt_api_clock.h b/arch/loongarch/include/asm/paravirt_api_clock.h
deleted file mode 100644
index 65ac7cee0dad..000000000000
--- a/arch/loongarch/include/asm/paravirt_api_clock.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm/paravirt.h>
diff --git a/arch/powerpc/include/asm/paravirt_api_clock.h b/arch/powerpc/include/asm/paravirt_api_clock.h
deleted file mode 100644
index d25ca7ac57c7..000000000000
--- a/arch/powerpc/include/asm/paravirt_api_clock.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/paravirt.h>
diff --git a/arch/riscv/include/asm/paravirt_api_clock.h b/arch/riscv/include/asm/paravirt_api_clock.h
deleted file mode 100644
index 65ac7cee0dad..000000000000
--- a/arch/riscv/include/asm/paravirt_api_clock.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm/paravirt.h>
diff --git a/arch/x86/include/asm/paravirt_api_clock.h b/arch/x86/include/asm/paravirt_api_clock.h
deleted file mode 100644
index 65ac7cee0dad..000000000000
--- a/arch/x86/include/asm/paravirt_api_clock.h
+++ /dev/null
@@ -1 +0,0 @@
-#include <asm/paravirt.h>
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index be9745d104f7..6442441b46d7 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -84,7 +84,6 @@ struct cpuidle_state;
 
 #ifdef CONFIG_PARAVIRT
 # include <asm/paravirt.h>
-# include <asm/paravirt_api_clock.h>
 #endif
 
 #include <asm/barrier.h>
-- 
2.51.0



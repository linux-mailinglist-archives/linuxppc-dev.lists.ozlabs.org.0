Return-Path: <linuxppc-dev+bounces-14517-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A51C8D018
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Nov 2025 08:09:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dH6xF1PDqz30B4;
	Thu, 27 Nov 2025 18:09:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764227361;
	cv=none; b=Pyx2aamfshiB+BAIsaAOm+MTgj+iXdROnLc2QZnTBOvsPNjqjoIuq/cF8D1zdwK6Hd//MjkQ5r6zTAauVfyEYimFyforTdbQ0iAoCvNsPytYShznFxdXO3AGgjf5StEiE5KAWL+7chvhA8+CL5aV+eUjDGy56UKSgoRv1Gzk02x3e7T5OlNV79NZDZdA/7Q09EtJaP3G9khOsFaz0oeWcJI+DqRDsXnePzW/+8rCOj6Gba8OB+mmouqML/8PP+ms8zvmgJ9uqb9Ng79WWyrAfUnJ0Z2ADtMwPcl9WXrhSkWgvTFKpE+N52Vz4zILeoRAQlpRy31Yxw+L7wxtR+qKcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764227361; c=relaxed/relaxed;
	bh=ri3G54J52VIuqz8u2sXoh7KWmcbo/VetIbM7wMg5XNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jdcfxAOX9OV52WxppDEILng0RZVFmBZv5B/Dnc79Vj7gGkOJdHn+ctN5IRKysb6z0AXfr0REXCO6qZBDyD1NjT492CeotPA453V/SaWupNsBHK5gMTezbHs0lTiNN/20c9lMYgTSr9DQ6WwRFxAs0ssQvHwYxKmUEVAQJTyqG8uLVISR0mkyoYwNdH+/HgJ9JsHgduZY1l+I0kAPCASFFS+f9eVL3WMZBP8wwmp2flooi8sEAmNMPVqvw2OOAa8dY5Tb4z3tarWYzLfKZzZL/9uls6GwzitbIi4/62j4yWLzFuUFt5kjJvJax6Ec/aDCgcxf3Iz2MZoWZ9Y/uAd4Rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=jgross@suse.com; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dH6xD3WpFz2yrX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Nov 2025 18:09:20 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4206A33693;
	Thu, 27 Nov 2025 07:09:18 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 353CD3EA63;
	Thu, 27 Nov 2025 07:09:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id EWuXCx35J2l8XAAAD6G6ig
	(envelope-from <jgross@suse.com>); Thu, 27 Nov 2025 07:09:17 +0000
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
	Paul Walmsley <pjw@kernel.org>,
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
	linux-arm-kernel@lists.infradead.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH v4 05/21] paravirt: Remove asm/paravirt_api_clock.h
Date: Thu, 27 Nov 2025 08:08:28 +0100
Message-ID: <20251127070844.21919-6-jgross@suse.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127070844.21919-1-jgross@suse.com>
References: <20251127070844.21919-1-jgross@suse.com>
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
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLkdkdrsxe9hqhhs5ask8616i6)]
X-Rspamd-Queue-Id: 4206A33693
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Score: -4.00
X-Spam-Level: 
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

All architectures supporting CONFIG_PARAVIRT share the same contents
of asm/paravirt_api_clock.h:

  #include <asm/paravirt.h>

So remove all incarnations of asm/paravirt_api_clock.h and remove the
only place where it is included, as there asm/paravirt.h is included
anyway.

Signed-off-by: Juergen Gross <jgross@suse.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com> # powerpc, scheduler bits
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
index adfb6e3409d7..ccd0d92ff7d1 100644
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



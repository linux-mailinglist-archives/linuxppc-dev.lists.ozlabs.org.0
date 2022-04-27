Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30053512912
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 03:47:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpdlT02W2z3dyq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 11:47:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=PMFgjQG4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com;
 envelope-from=gpiccoli@igalia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=PMFgjQG4; dkim-atps=neutral
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpZ0K14G4z3bYF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 08:57:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C9iT/xJ8gF8J/f7SmqQO2c8pu+KvBPlFfkqGdYboS2I=; b=PMFgjQG40D4y0EE10+nqxAPHVI
 yNLZ1EZJdP0IH30iYafdBfM788VaINOAVfe8Gnevld0DclzQJRd8t+br/vJapdawGOEWHQTLdmHei
 1IQvYGZ//MLpN+QQDVtOXWSfDQyyspNE1J3gOgOC4NUam3dGx8JeBgJ9jpYRHFoaP71Y3fG1ERN+7
 JvwIb059Xf3lNBTrEP8JiyuPOh5ugwSvNao5NfaR+bMPV8BospKPkEU02jshVAtp1UBbOdjrRb2r2
 ze90RIwfaZigyOQntmQCmXs163wt4gsMUWHmf1nSoidLeEjFKj9WA7H531Eyz4iqvzof4LvLiIP9u
 dq8Lxg9g==;
Received: from [179.113.53.197] (helo=localhost)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1njqbL-0002UI-QD; Thu, 28 Apr 2022 00:57:40 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: akpm@linux-foundation.org, bhe@redhat.com, pmladek@suse.com,
 kexec@lists.infradead.org
Subject: [PATCH 27/30] powerpc: Do not force all panic notifiers to execute
 before kdump
Date: Wed, 27 Apr 2022 19:49:21 -0300
Message-Id: <20220427224924.592546-28-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427224924.592546-1-gpiccoli@igalia.com>
References: <20220427224924.592546-1-gpiccoli@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 28 Apr 2022 11:34:03 +1000
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
Cc: linux-hyperv@vger.kernel.org, halves@canonical.com,
 gregkh@linuxfoundation.org, peterz@infradead.org,
 alejandro.j.jimenez@oracle.com, linux-remoteproc@vger.kernel.org,
 feng.tang@intel.com, linux-mips@vger.kernel.org, hidehiro.kawai.ez@hitachi.com,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org, will@kernel.org,
 tglx@linutronix.de, linux-leds@vger.kernel.org, linux-s390@vger.kernel.org,
 mikelley@microsoft.com, john.ogness@linutronix.de, corbet@lwn.net,
 paulmck@kernel.org, fabiomirmar@gmail.com, x86@kernel.org, mingo@redhat.com,
 bcm-kernel-feedback-list@broadcom.com, Hari Bathini <hbathini@linux.ibm.com>,
 xen-devel@lists.xenproject.org, dyoung@redhat.com, vgoyal@redhat.com,
 linux-xtensa@linux-xtensa.org, dave.hansen@linux.intel.com,
 keescook@chromium.org, arnd@arndb.de, linux-pm@vger.kernel.org,
 coresight@lists.linaro.org, linux-um@lists.infradead.org, rostedt@goodmis.org,
 rcu@vger.kernel.org, bp@alien8.de, Nicholas Piggin <npiggin@gmail.com>,
 luto@kernel.org, linux-tegra@vger.kernel.org,
 openipmi-developer@lists.sourceforge.net, andriy.shevchenko@linux.intel.com,
 senozhatsky@chromium.org, linux-arm-kernel@lists.infradead.org,
 linux-edac@vger.kernel.org, jgross@suse.com, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, kernel@gpiccoli.net, linux-kernel@vger.kernel.org,
 stern@rowland.harvard.edu, gpiccoli@igalia.com, d.hatayama@jp.fujitsu.com,
 mhiramat@kernel.org, kernel-dev@igalia.com, linux-alpha@vger.kernel.org,
 vkuznets@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 06e629c25daa ("powerpc/fadump: Fix inaccurate CPU state info in
vmcore generated with panic") introduced a hardcoded setting of kernel
parameter "crash_kexec_post_notifiers", effectively forcing all the
panic notifiers to execute earlier in the panic path, before kdump.

The reason for that was a fadump issue on collecting data accurately,
due to smp_send_stop() setting all CPUs offline, so the net effect
desired with this change was to avoid calling the regular CPU
shutdown function, and instead rely on crash_smp_send_stop(), which
copes fine with fadump. The collateral effect was to increase the
risk for kdump if fadump is not used, since it forces all panic
notifiers to execute early, before kdump.

Happens that, after a panic refactor, crash_smp_send_stop() is
now used by default in the panic path, so there is no reason to
mess with the notifiers ordering (which was also improved in the
refactor) from within arch code.

Fixes: 06e629c25daa ("powerpc/fadump: Fix inaccurate CPU state info in vmcore generated with panic")
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Paul Mackerras <paulus@samba.org>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---

We'd like to thanks specially the MiniCloud infrastructure [0] maintainers,
that allow us to test PowerPC code in a very complete, functional and FREE
environment.

[0] https://openpower.ic.unicamp.br/minicloud

 arch/powerpc/kernel/fadump.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 65562c4a0a69..35ae8c09af66 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1649,14 +1649,6 @@ int __init setup_fadump(void)
 		register_fadump();
 	}
 
-	/*
-	 * In case of panic, fadump is triggered via ppc_panic_event()
-	 * panic notifier. Setting crash_kexec_post_notifiers to 'true'
-	 * lets panic() function take crash friendly path before panic
-	 * notifiers are invoked.
-	 */
-	crash_kexec_post_notifiers = true;
-
 	return 1;
 }
 /*
-- 
2.36.0


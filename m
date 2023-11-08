Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CDB7E6013
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Nov 2023 22:45:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U6dgTgqd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SQdsy18ZSz3vbn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 08:45:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U6dgTgqd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=arnd@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SQQD40ZGXz3cBH
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Nov 2023 00:00:04 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2D151615BA;
	Wed,  8 Nov 2023 13:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A176C433D9;
	Wed,  8 Nov 2023 12:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699448402;
	bh=lWSNAkUa9zp9KaZHQMU5GW4zFS42gSKCMng8P6T4A2I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U6dgTgqdrhjCu/me4BW5zxGXxjkr3PVJ1avxPAZ6so0kvLG8+yeKS1POYYVMevcff
	 ej2TK9Qha2L8Mi7XQdRSl+xglVkhgvVrVNZW+ORQMvL9bwQhn8LizVhhMSOgSPns7u
	 JJyzzo+WsONP/YGaENuw0woNnreq3zT9OSDFf0LY703y2te6yNDmw7EQyq7guOhrXC
	 ObIXRkM7LuyUPJ5UZPajzeSUMzXsZ/oTNFS2AJ66D/lUMhyNIjeaTtoFkQGGCIJgxj
	 RCicg9Ci7MtSk8h1rZwozbVS6sb/U0v0rjiKUe13d/py/jMXF9uCJB9/QPCiHgI0di
	 LaebSIFDWfJMQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-kbuild@vger.kernel.org
Subject: [PATCH 04/22] [RESEND] time: make sysfs_get_uname() function visible in header
Date: Wed,  8 Nov 2023 13:58:25 +0100
Message-Id: <20231108125843.3806765-5-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231108125843.3806765-1-arnd@kernel.org>
References: <20231108125843.3806765-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 09 Nov 2023 08:41:16 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Juri Lelli <juri.lelli@redhat.com>, linux-fbdev@vger.kernel.org, x86@kernel.org, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org, netdev@vger.kernel.org, Guo Ren <guoren@kernel.org>, Anil S Keshavamurthy <anil.s.keshavamurthy@intel.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, Greg Ungerer <gerg@linux-m68k.org>, Nicolas Schier <nicolas@fjasle.eu>, linux-s390@vger.kernel.org, Vincent Guittot <vincent.guittot@linaro.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ard Biesheuvel <ardb@kernel.org>, linux-bcachefs@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, Vineet Gupta <vgupta@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>
 , linux-snps-arc@lists.infradead.org, linux-trace-kernel@vger.kernel.org, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org, linux-csky@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Timur Tabi <timur@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, Nick Desaulniers <ndesaulniers@google.com>, linux-mips@vger.kernel.org, Sudip Mukherjee <sudipm.mukherj
 ee@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, linux-usb@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Masami Hiramatsu <mhiramat@kernel.org>, linux-alpha@vger.kernel.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, "David S. Miller" <davem@davemloft.net>, Al Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Arnd Bergmann <arnd@arndb.de>

This function is defined globally in clocksource.c and used conditionally
in clockevent.c, which the declaration hidden when clockevent support
is disabled. This causes a harmless warning in the definition:

kernel/time/clocksource.c:1324:9: warning: no previous prototype for 'sysfs_get_uname' [-Wmissing-prototypes]
 1324 | ssize_t sysfs_get_uname(const char *buf, char *dst, size_t cnt)

Move the declaration out of the #ifdef so it is always visible.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 kernel/time/tick-internal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
index 649f2b48e8f0..481b7ab65e2c 100644
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@ -56,7 +56,6 @@ extern int clockevents_program_event(struct clock_event_device *dev,
 				     ktime_t expires, bool force);
 extern void clockevents_handle_noop(struct clock_event_device *dev);
 extern int __clockevents_update_freq(struct clock_event_device *dev, u32 freq);
-extern ssize_t sysfs_get_uname(const char *buf, char *dst, size_t cnt);
 
 /* Broadcasting support */
 # ifdef CONFIG_GENERIC_CLOCKEVENTS_BROADCAST
@@ -197,3 +196,5 @@ void hrtimers_resume_local(void);
 #else
 #define JIFFIES_SHIFT	8
 #endif
+
+extern ssize_t sysfs_get_uname(const char *buf, char *dst, size_t cnt);
-- 
2.39.2


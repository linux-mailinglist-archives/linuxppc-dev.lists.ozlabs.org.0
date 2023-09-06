Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7550D793C59
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 14:10:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lrw3bSBC;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KXOEyvnW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rgh5y2xrlz3c1R
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 22:10:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=lrw3bSBC;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=KXOEyvnW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rgh513PYSz2yQL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Sep 2023 22:09:41 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 7C21822425;
	Wed,  6 Sep 2023 12:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694002177; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POC+WMTqqjATWBgKEWTz6msplurqu/mxnJy1Ka2dUjY=;
	b=lrw3bSBCTbfDALXwuQ5X3grIn0Oo9uZrP685QuhcBB95Vr+hQKTSH9P4u/pgViTLomj1Ey
	lqJWjzUVE4I20zMDNdxGdwmK7StgP1lEteZRU6drvii4rg7Sp+b6kngiqWjH6gHAui+fQV
	X+rmtXwYZHQfeUHu3Lmv/LKoRt6WUOk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694002177;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=POC+WMTqqjATWBgKEWTz6msplurqu/mxnJy1Ka2dUjY=;
	b=KXOEyvnWFtOqA0knbyYFLjdfIUvKlzHJ2fTaIqDaF8MFCU6S5KqvvvagKr3hNgZ9XhyZKt
	92fTQS1MaSSGdkBw==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	by relay2.suse.de (Postfix) with ESMTP id 121942C142;
	Wed,  6 Sep 2023 12:09:36 +0000 (UTC)
From: Michal Suchanek <msuchanek@suse.de>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	=?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>
Subject: [PATCH RFC] powerpc/rtas: Make it possible to disable sys_rtas
Date: Wed,  6 Sep 2023 14:08:46 +0200
Message-ID: <20230906120855.28331-1-msuchanek@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
References: <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Additional patch suggestion to go with the rtas devices:

-----------------------------------------------------------------------

With most important rtas functions available through different
interfaces the sys_rtas interface can be disabled completely.

Do not remove it for now to make it possible to run older versions of
userspace tools that don't support other interfaces.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 arch/powerpc/kernel/rtas.c     | 2 ++
 arch/powerpc/platforms/Kconfig | 9 +++++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index eddc031c4b95..5854a8bb5731 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1684,6 +1684,7 @@ noinstr struct pseries_errorlog *get_pseries_errorlog(struct rtas_error_log *log
 	return NULL;
 }
 
+#ifdef PPC_RTAS_SYSCALL
 /*
  * The sys_rtas syscall, as originally designed, allows root to pass
  * arbitrary physical addresses to RTAS calls. A number of RTAS calls
@@ -1893,6 +1894,7 @@ SYSCALL_DEFINE1(rtas, struct rtas_args __user *, uargs)
 
 	return 0;
 }
+#endif
 
 static void __init rtas_function_table_init(void)
 {
diff --git a/arch/powerpc/platforms/Kconfig b/arch/powerpc/platforms/Kconfig
index 1fd253f92a77..9563e38188d5 100644
--- a/arch/powerpc/platforms/Kconfig
+++ b/arch/powerpc/platforms/Kconfig
@@ -150,6 +150,15 @@ config RTAS_FLASH
 	tristate "Firmware flash interface"
 	depends on PPC64 && RTAS_PROC
 
+config RTAS_SYSCALL
+	bool "Legacy syscall interface to RTAS"
+	depends on PPC_RTAS
+	default y
+	help
+	  Enables support for the legacy sys_rtas interface. Calls that need to
+	  pass data buffers use /dev/mem directly which is not compatible with
+	  lockdown. For now some tools still need this interface to work.
+
 config MMIO_NVRAM
 	bool
 
-- 
2.41.0


Return-Path: <linuxppc-dev+bounces-15635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F985D18E2C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:46:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8BQ3PfQz2yRC;
	Tue, 13 Jan 2026 23:46:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308382;
	cv=none; b=n99w2moe2yVWXpdLqmQyitZUERkUIjh2YvgwnTxDl2zEU1NI2g8wJAD7BCaNhYCmekx37ImKcbOU4PP2OZOmUOW+2HoMhMzwr5czy428ydPwxx5Qx8e2vpMozvR4Uffjr9XWSiB0JBIeJrRRbSOHbZwy7BitoDEhaU6mjfhVnfW23t3SH57NYiLu4kQwcTK+oggey25FZJwLaOHJjScxAGew4v/Kyvf/B9GsK4OkeFsiViMGExwTrpzuIh+tM3hCXeWrT/uBeXYWWbUUJcRtYh2UBeINLrD9k3eqdUA8d7ezX3eomOC/DZCAFO/Y8I2yv2mIIXBAMMQag2iTqqRPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308382; c=relaxed/relaxed;
	bh=JLfQ93ordRTDsTPx+LC+83v3+tYhsvui6tA+KjQgqkQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B8eFODoocKTd5ld/7Xqae2lzLmPBrG70DVXzIO0cdek4YMdrJOtVtq7kx1VtXExEY/ykN57o+vjZSpVPH9XLLjELj4Mg0E3/LVcRpMqTfBvbq7STZToa0kQlVJ3rLjDJrcbtcgUru/ZhE2/mZy0oAG4g2OBkJHwWLFJg+SMaD1p1fHXdkxludmYAw0NOnN4MBvFdeSZLff3flkibLTCgkWqdj54y7WLlCdOHQdv47C1ze7xh8e/NBPmDmnM3JrXMa9CTPOiYQX+o439PFikVxklpc0JXlYTqVswqXJ76vJcRA3PNQwzESeTyDWPg4vB7WQoa68FpFzVcAegZ9oi1+A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=O9Xe+RO7; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=O9Xe+RO7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8BP6FThz2xWJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:46:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307861;
	bh=Ws8Eb0NwBaSsIELRvPFLQCi4wI4t0JSg+rOArDpr4jQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O9Xe+RO75UPCb36u5nzxwzV4aFggvjHY0s8dnC9SRndh/IQGhUfIuuT5vLRHHP6Mc
	 K1sGiiSW4ebwVx+7Utb4cgjie5ndXNJBjH7Lg49kYigRXnXpkxRbcHBRO0bqcmXgZj
	 MgNncGcUilz/vm19oRV49rtYw8DPUlXsLyytbp+Y=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:29:01 +0100
Subject: [PATCH v4 17/17] kbuild: make CONFIG_MODULE_HASHES compatible with
 module stripping
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260113-module-hashes-v4-17-0b932db9b56b@weissschuh.net>
References: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
In-Reply-To: <20260113-module-hashes-v4-0-0b932db9b56b@weissschuh.net>
To: Nathan Chancellor <nathan@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Paul Moore <paul@paul-moore.com>, 
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
 Jonathan Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Naveen N Rao <naveen@kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, 
 Nicolas Schier <nicolas.schier@linux.dev>, 
 Daniel Gomez <da.gomez@kernel.org>, Aaron Tomlin <atomlin@atomlin.com>, 
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
 Nicolas Schier <nsc@kernel.org>, 
 Nicolas Bouchinet <nicolas.bouchinet@oss.cyber.gouv.fr>, 
 Xiu Jianfeng <xiujianfeng@huawei.com>, Nicolas Schier <nsc@kernel.org>, 
 Christophe Leroy <chleroy@kernel.org>
Cc: =?utf-8?q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>, 
 Arnout Engelen <arnout@bzzt.net>, Mattia Rizzolo <mattia@mapreri.org>, 
 kpcyrd <kpcyrd@archlinux.org>, Christian Heusel <christian@heusel.eu>, 
 =?utf-8?q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org, 
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=3767;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Ws8Eb0NwBaSsIELRvPFLQCi4wI4t0JSg+rOArDpr4jQ=;
 b=oEsyx/jtBizezIcvSkje+0qtObz/4ddhy8qPoVzSRgXe5bKNpF2FVLAcW5REc98tF23qYcGl2
 oWzLDhETAiYD5GsTguxB0tE2w91SHoXCLNfs4qDbap5w+MSSx88FHYp
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

CONFIG_MODULE_HASHES needs to process the modules at build time in the
exact form they will be loaded at runtime. If the modules are stripped
afterwards they will not be loadable anymore.

Also evaluate INSTALL_MOD_STRIP at build time and build the hashes based
on modules stripped this way.

If users specify inconsistent values of INSTALL_MOD_STRIP between build
and installation time, an error is reported.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 .gitignore                | 1 +
 kernel/module/Kconfig     | 5 +++++
 scripts/Makefile.modfinal | 9 +++++++--
 scripts/Makefile.modinst  | 4 ++--
 scripts/Makefile.vmlinux  | 1 +
 5 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/.gitignore b/.gitignore
index 299c54083672..900251c72ade 100644
--- a/.gitignore
+++ b/.gitignore
@@ -29,6 +29,7 @@
 *.gz
 *.i
 *.ko
+*.ko.stripped
 *.lex.c
 *.ll
 *.lst
diff --git a/kernel/module/Kconfig b/kernel/module/Kconfig
index c00ca830330c..9fd34765ce2c 100644
--- a/kernel/module/Kconfig
+++ b/kernel/module/Kconfig
@@ -425,6 +425,11 @@ config MODULE_HASHES
 
 	  Also see the warning in MODULE_SIG about stripping modules.
 
+# To validate the consistency of INSTALL_MOD_STRIP for MODULE_HASHES
+config MODULE_INSTALL_STRIP
+	string
+	default "$(INSTALL_MOD_STRIP)"
+
 config MODULE_ALLOW_MISSING_NAMESPACE_IMPORTS
 	bool "Allow loading of modules with missing namespace imports"
 	help
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index 5b8e94170beb..890724edac69 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -63,10 +63,14 @@ ifdef CONFIG_DEBUG_INFO_BTF_MODULES
 endif
 	+$(call cmd,check_tracepoint)
 
+%.ko.stripped: %.ko $(wildcard include/config/MODULE_INSTALL_STRIP)
+	$(call cmd,install_mod)
+	$(call cmd,strip_mod)
+
 quiet_cmd_merkle = MERKLE  $@
-      cmd_merkle = $(objtree)/scripts/modules-merkle-tree $@ .ko
+      cmd_merkle = $(objtree)/scripts/modules-merkle-tree $@ $(if $(CONFIG_MODULE_INSTALL_STRIP),.ko.stripped,.ko)
 
-.tmp_module_hashes.c: $(modules:%.o=%.ko) $(objtree)/scripts/modules-merkle-tree FORCE
+.tmp_module_hashes.c: $(if $(CONFIG_MODULE_INSTALL_STRIP),$(modules:%.o=%.ko.stripped),$(modules:%.o=%.ko)) $(objtree)/scripts/modules-merkle-tree $(wildcard include/config/MODULE_INSTALL_STRIP) FORCE
 	$(call cmd,merkle)
 
 ifdef CONFIG_MODULE_HASHES
@@ -75,6 +79,7 @@ endif
 
 targets += $(modules:%.o=%.ko) $(modules:%.o=%.mod.o) .module-common.o
 targets += $(modules:%.o=%.merkle) .tmp_module_hashes.c
+targets += $(modules:%.o=%.ko.stripped)
 
 # Add FORCE to the prerequisites of a target to force it to be always rebuilt.
 # ---------------------------------------------------------------------------
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index 07380c7233a0..45606f994ad9 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -68,8 +68,8 @@ __modinst: $(install-y)
 
 ifdef CONFIG_MODULE_HASHES
 ifeq ($(KBUILD_EXTMOD),)
-ifdef INSTALL_MOD_STRIP
-$(error CONFIG_MODULE_HASHES and INSTALL_MOD_STRIP are mutually exclusive)
+ifneq ($(INSTALL_MOD_STRIP),$(CONFIG_MODULE_INSTALL_STRIP))
+$(error Inconsistent values for INSTALL_MOD_STRIP between build and installation)
 endif
 endif
 endif
diff --git a/scripts/Makefile.vmlinux b/scripts/Makefile.vmlinux
index f4e38b953b01..4ce849f6253a 100644
--- a/scripts/Makefile.vmlinux
+++ b/scripts/Makefile.vmlinux
@@ -81,6 +81,7 @@ endif
 ifdef CONFIG_MODULE_HASHES
 vmlinux.unstripped: $(objtree)/scripts/modules-merkle-tree
 vmlinux.unstripped: modules.order
+vmlinux.unstripped: $(wildcard include/config/MODULE_INSTALL_STRIP)
 endif
 
 # vmlinux

-- 
2.52.0



Return-Path: <linuxppc-dev+bounces-15641-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75CD6D18E4D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 13:47:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr8C02tqrz2yv2;
	Tue, 13 Jan 2026 23:46:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768308412;
	cv=none; b=WvnEjBqF6pdsRlGhhlQfJHBJxugN1zkMmfMik1dmFCSA/+BYtQ0GiZUuKjMfYFWR7eItwfGFq1y11vu9ArVe07510wkKr8a/vJCUblid3T94akP1RBPXqeH8E1OHeQ+yazk1O8WgY4us4N42NIQfgAzfMsHN0RPjEk8+lx0ytV5+NjvoIWDCpjX996WeksKxQuPDHJt0inrzo6wu+MYORseyZgWL27paEO69r0m6MA+a/Ee22eLEq7SXFcCUFsL18UHFLXC8oPbwSGWIyODKvsKcxRRGeNipODN66LOCstxptBfJ8A+rxZ+LjiiA5hwt3zV81vGYQPr+Ex/seopXaA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768308412; c=relaxed/relaxed;
	bh=sjvZ6ExXZKIsGr0LtGmK9CiSA8CcuTr0wY4xdHiLd6E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZeiIXUCmC0Fsk3xX3ytp316iI0KmSUFMa8XmsEou5ayRl8sF82opPSYCUouq4/5EVO/t9OAyrNybJK/5AhJmWj78/pBmBiQjRawvvV3MoEqOz0jaD249/cTcnVljpBcnshbDSfNt04ZCXlrNx6otHsbojRN2c9s0sg7JJ5KUWDop5BLjQjzDClsTxJL3XwZpGO6OnwZqG4ZoADFtPNWmGUU4trQZ3RYGXAPOVkF7BKUiSlFRwWrbVPUX57hK66VXAQSvx/ZLqJtP27iPmR+0eK7rOS1cm3WwS7Ndczn1nZw0UTcqJ/zZsoPjmdWR9ztlkSW/893pq6dKx04ovRD5+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=U1KnkUqV; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=U1KnkUqV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr8Bz5rgmz2yks
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 23:46:51 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1768307861;
	bh=b2TM6fz30nYE4pXc7lphgAZV10HkjJO6Y6M5OUfLXpI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U1KnkUqV1THtBM/FnYjupYo4PNuIDXrDa9wv1DZZEcE2tF6N/S6c6EF/7n1DbgEIo
	 qOks4JyottD1KEeI5d5Su4cVMYj6/huuFG1gQCYx8NWdP5UZzwImedmtvEXcdV9YUP
	 QToV2OswA9J3WiLqB4jdefpF4mhb4HxgZoFv100U=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 13 Jan 2026 13:29:00 +0100
Subject: [PATCH v4 16/17] kbuild: move handling of module stripping to
 Makefile.lib
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
Message-Id: <20260113-module-hashes-v4-16-0b932db9b56b@weissschuh.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768307859; l=3531;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=b2TM6fz30nYE4pXc7lphgAZV10HkjJO6Y6M5OUfLXpI=;
 b=Xez2lBrIjdFMFK8Oh5pBpyprlmOXfIFf5MbbX1IYj3vnIscUbHikzrmsTG8b9pMw9G8LxfD6v
 TVK+2le9j2rBEgHkmELEMe8iyvQ9/x6dQX0oXApfSpXVDLL5sLXzdtE
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To allow CONFIG_MODULE_HASHES in combination with INSTALL_MOD_STRIP,
this logc will also be used by Makefile.modfinal.

Move it to a shared location to enable reuse.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 scripts/Makefile.lib     | 32 ++++++++++++++++++++++++++++++++
 scripts/Makefile.modinst | 37 +++++--------------------------------
 2 files changed, 37 insertions(+), 32 deletions(-)

diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 28a1c08e3b22..7fcf3c43e408 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -474,6 +474,38 @@ define sed-offsets
 	s:->::; p;}'
 endef
 
+#
+# Module Installation
+#
+quiet_cmd_install_mod = INSTALL $@
+      cmd_install_mod = cp $< $@
+
+# Module Strip
+# ---------------------------------------------------------------------------
+#
+# INSTALL_MOD_STRIP, if defined, will cause modules to be stripped after they
+# are installed. If INSTALL_MOD_STRIP is '1', then the default option
+# --strip-debug will be used. Otherwise, INSTALL_MOD_STRIP value will be used
+# as the options to the strip command.
+ifeq ($(INSTALL_MOD_STRIP),1)
+mod-strip-option := --strip-debug
+else
+mod-strip-option := $(INSTALL_MOD_STRIP)
+endif
+
+# Strip
+ifdef INSTALL_MOD_STRIP
+
+quiet_cmd_strip_mod = STRIP   $@
+      cmd_strip_mod = $(STRIP) $(mod-strip-option) $@
+
+else
+
+quiet_cmd_strip_mod =
+      cmd_strip_mod = :
+
+endif
+
 # Use filechk to avoid rebuilds when a header changes, but the resulting file
 # does not
 define filechk_offsets
diff --git a/scripts/Makefile.modinst b/scripts/Makefile.modinst
index ba4343b40497..07380c7233a0 100644
--- a/scripts/Makefile.modinst
+++ b/scripts/Makefile.modinst
@@ -8,6 +8,7 @@ __modinst:
 
 include $(objtree)/include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
 
 install-y :=
 
@@ -36,7 +37,7 @@ install-y += $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo)
 install-$(CONFIG_BUILTIN_MODULE_RANGES) += $(MODLIB)/modules.builtin.ranges
 
 $(addprefix $(MODLIB)/, modules.builtin modules.builtin.modinfo modules.builtin.ranges): $(MODLIB)/%: % FORCE
-	$(call cmd,install)
+	$(call cmd,install_mod)
 
 endif
 
@@ -65,40 +66,12 @@ install-$(CONFIG_MODULES) += $(modules)
 __modinst: $(install-y)
 	@:
 
-#
-# Installation
-#
-quiet_cmd_install = INSTALL $@
-      cmd_install = cp $< $@
-
-# Strip
-#
-# INSTALL_MOD_STRIP, if defined, will cause modules to be stripped after they
-# are installed. If INSTALL_MOD_STRIP is '1', then the default option
-# --strip-debug will be used. Otherwise, INSTALL_MOD_STRIP value will be used
-# as the options to the strip command.
-ifdef INSTALL_MOD_STRIP
-
 ifdef CONFIG_MODULE_HASHES
 ifeq ($(KBUILD_EXTMOD),)
+ifdef INSTALL_MOD_STRIP
 $(error CONFIG_MODULE_HASHES and INSTALL_MOD_STRIP are mutually exclusive)
 endif
 endif
-
-ifeq ($(INSTALL_MOD_STRIP),1)
-strip-option := --strip-debug
-else
-strip-option := $(INSTALL_MOD_STRIP)
-endif
-
-quiet_cmd_strip = STRIP   $@
-      cmd_strip = $(STRIP) $(strip-option) $@
-
-else
-
-quiet_cmd_strip =
-      cmd_strip = :
-
 endif
 
 #
@@ -133,8 +106,8 @@ endif
 $(foreach dir, $(sort $(dir $(install-y))), $(shell mkdir -p $(dir)))
 
 $(dst)/%.ko: %.ko FORCE
-	$(call cmd,install)
-	$(call cmd,strip)
+	$(call cmd,install_mod)
+	$(call cmd,strip_mod)
 	$(call cmd,sign)
 
 ifdef CONFIG_MODULES

-- 
2.52.0



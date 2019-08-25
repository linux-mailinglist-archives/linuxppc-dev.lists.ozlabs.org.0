Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB4F9C403
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 15:35:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GbkD2hLjzDqD0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 23:35:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="g0nxmzW0"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GbSb5G8szDqcg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 23:23:58 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id y9so9461810pfl.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 06:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ATcCbM6biHkdS6pzkwBCxjjCLgoJOMzk+hMVWKlY49s=;
 b=g0nxmzW0zZ8NOi10EuoUp6vH1QqnVKl2IMIkaHt7cnF9O3K6n0oILEW7cwjrYanydu
 gtoL3DlYM2M5MgCbMEnM06N2evopvAboFj4vypZN5kjGpI15b8rhq5rh/KAkudzPdJpR
 sLDbzKbUi7x6t+5MFWoJogmWGPO2NmboeiEiGdRisvYQ9toPvwp5sS0u6lAQ6B1HzHtA
 NeqnHB9yIGItC6Df2iIXR2yzDjYytV106x33kfO6K4887MnkmD7Xx47qsOPdysl9o3r6
 VHxKFYS5Dpwv/D05aGqO18ep0Y7hxYUSiawMaYs0cINAZIcwP14La+QLXLaoHQpwqAit
 rYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ATcCbM6biHkdS6pzkwBCxjjCLgoJOMzk+hMVWKlY49s=;
 b=pZKuhdkYjCvIhKXgAQajelMuDfcQrwN91ZC27jkzsmkrYgFF71KmS5EImauJ994DFi
 /NlyttvFpKc8I9LsIjulDZulMjaNmwSSrhlo/8PQdn1SzXyu//bIkSlCZXKBq67T1MvJ
 9qYkvH673g4JJwzOwOnIjh32/xt7b8wfpSIuUDWO51FusMwd1zy7Nq6wFy2l0NhR2l/R
 RSkeKu/O8msjiYduszjCsRmzIQzG0kOddfDoOAjRUUUuzThOSX2FDeNrMJuQyxtNFD5L
 yM0zv3bT+ttzXdW2ItX4of90UEENiiPqdNCYpikcacmvJ69CK0X/NqZRYy5Ah4r5Gqsn
 gOwg==
X-Gm-Message-State: APjAAAXMLNbdJGqqMDok0TFl79gR8t51MBzjeKSEIT/W+ORfqJsYK+Gs
 CTGE9nroOHDZdtpw12HnXI1B5Us+3RxeAg==
X-Google-Smtp-Source: APXvYqzaJqepN4zSy7ymgD+GkZvtuT8tWiHagREHmYhkwZsvhh4laEBbm32dRe/EdCR5Hh5hXENyXQ==
X-Received: by 2002:a17:90a:fb8e:: with SMTP id
 cp14mr14686883pjb.54.1566739434878; 
 Sun, 25 Aug 2019 06:23:54 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.23.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:23:54 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 01/11] ftrace: move recordmcount tools to scripts/ftrace
Date: Sun, 25 Aug 2019 21:23:20 +0800
Message-Id: <20190825132330.5015-2-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190825132330.5015-1-changbin.du@gmail.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org,
 "John F . Reiser" <jreiser@BitWagon.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move ftrace tools to its own directory. We will add another tool later.

Cc: John F. Reiser <jreiser@BitWagon.com>
Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 scripts/.gitignore                   |  1 -
 scripts/Makefile                     |  2 +-
 scripts/Makefile.build               | 10 +++++-----
 scripts/ftrace/.gitignore            |  4 ++++
 scripts/ftrace/Makefile              |  4 ++++
 scripts/{ => ftrace}/recordmcount.c  |  0
 scripts/{ => ftrace}/recordmcount.h  |  0
 scripts/{ => ftrace}/recordmcount.pl |  0
 8 files changed, 14 insertions(+), 7 deletions(-)
 create mode 100644 scripts/ftrace/.gitignore
 create mode 100644 scripts/ftrace/Makefile
 rename scripts/{ => ftrace}/recordmcount.c (100%)
 rename scripts/{ => ftrace}/recordmcount.h (100%)
 rename scripts/{ => ftrace}/recordmcount.pl (100%)
 mode change 100755 => 100644

diff --git a/scripts/.gitignore b/scripts/.gitignore
index 17f8cef88fa8..1b5b5d595d80 100644
--- a/scripts/.gitignore
+++ b/scripts/.gitignore
@@ -6,7 +6,6 @@ conmakehash
 kallsyms
 pnmtologo
 unifdef
-recordmcount
 sortextable
 asn1_compiler
 extract-cert
diff --git a/scripts/Makefile b/scripts/Makefile
index 16bcb8087899..d5992def49a8 100644
--- a/scripts/Makefile
+++ b/scripts/Makefile
@@ -14,7 +14,6 @@ hostprogs-$(CONFIG_BUILD_BIN2C)  += bin2c
 hostprogs-$(CONFIG_KALLSYMS)     += kallsyms
 hostprogs-$(CONFIG_LOGO)         += pnmtologo
 hostprogs-$(CONFIG_VT)           += conmakehash
-hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
 hostprogs-$(CONFIG_BUILDTIME_EXTABLE_SORT) += sortextable
 hostprogs-$(CONFIG_ASN1)	 += asn1_compiler
 hostprogs-$(CONFIG_MODULE_SIG)	 += sign-file
@@ -34,6 +33,7 @@ hostprogs-y += unifdef
 subdir-$(CONFIG_GCC_PLUGINS) += gcc-plugins
 subdir-$(CONFIG_MODVERSIONS) += genksyms
 subdir-$(CONFIG_SECURITY_SELINUX) += selinux
+subdir-$(CONFIG_FTRACE) += ftrace
 
 # Let clean descend into subdirs
 subdir-	+= basic dtc gdb kconfig mod package
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 2f66ed388d1c..67558983c518 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -188,18 +188,18 @@ endif
 # files, including recordmcount.
 sub_cmd_record_mcount =					\
 	if [ $(@) != "scripts/mod/empty.o" ]; then	\
-		$(objtree)/scripts/recordmcount $(RECORDMCOUNT_FLAGS) "$(@)";	\
+		$(objtree)/scripts/ftrace/recordmcount $(RECORDMCOUNT_FLAGS) "$(@)"; \
 	fi;
-recordmcount_source := $(srctree)/scripts/recordmcount.c \
-		    $(srctree)/scripts/recordmcount.h
+recordmcount_source := $(srctree)/scripts/ftrace/recordmcount.c \
+		       $(srctree)/scripts/ftrace/recordmcount.h
 else
-sub_cmd_record_mcount = perl $(srctree)/scripts/recordmcount.pl "$(ARCH)" \
+sub_cmd_record_mcount = perl $(srctree)/scripts/ftrace/recordmcount.pl "$(ARCH)" \
 	"$(if $(CONFIG_CPU_BIG_ENDIAN),big,little)" \
 	"$(if $(CONFIG_64BIT),64,32)" \
 	"$(OBJDUMP)" "$(OBJCOPY)" "$(CC) $(KBUILD_CPPFLAGS) $(KBUILD_CFLAGS)" \
 	"$(LD) $(KBUILD_LDFLAGS)" "$(NM)" "$(RM)" "$(MV)" \
 	"$(if $(part-of-module),1,0)" "$(@)";
-recordmcount_source := $(srctree)/scripts/recordmcount.pl
+recordmcount_source := $(srctree)/scripts/ftrace/recordmcount.pl
 endif # BUILD_C_RECORDMCOUNT
 cmd_record_mcount = $(if $(findstring $(strip $(CC_FLAGS_FTRACE)),$(_c_flags)),	\
 	$(sub_cmd_record_mcount))
diff --git a/scripts/ftrace/.gitignore b/scripts/ftrace/.gitignore
new file mode 100644
index 000000000000..54d582c8faad
--- /dev/null
+++ b/scripts/ftrace/.gitignore
@@ -0,0 +1,4 @@
+#
+# Generated files
+#
+recordmcount
diff --git a/scripts/ftrace/Makefile b/scripts/ftrace/Makefile
new file mode 100644
index 000000000000..6797e51473e5
--- /dev/null
+++ b/scripts/ftrace/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0
+
+hostprogs-$(BUILD_C_RECORDMCOUNT) += recordmcount
+always         := $(hostprogs-y)
diff --git a/scripts/recordmcount.c b/scripts/ftrace/recordmcount.c
similarity index 100%
rename from scripts/recordmcount.c
rename to scripts/ftrace/recordmcount.c
diff --git a/scripts/recordmcount.h b/scripts/ftrace/recordmcount.h
similarity index 100%
rename from scripts/recordmcount.h
rename to scripts/ftrace/recordmcount.h
diff --git a/scripts/recordmcount.pl b/scripts/ftrace/recordmcount.pl
old mode 100755
new mode 100644
similarity index 100%
rename from scripts/recordmcount.pl
rename to scripts/ftrace/recordmcount.pl
-- 
2.20.1


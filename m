Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B72ECB344C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 07:13:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46WvX52B0HzDrB1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Sep 2019 15:13:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=adam.zerella@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="T1bh5zbj"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46WHy62CtpzF3hH
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Sep 2019 15:30:00 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id q5so20450471pfg.13
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2019 22:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ej/u95XewO8oxEcD2YFAX3/VQ7PaDTsn1Re04y77RLQ=;
 b=T1bh5zbjHeIbb7GZFFEVni5AAysciCtvB/KQ9lIsQ85fRHqx7JXsCMmfaHDzD6PV1W
 +NXn7kytaZhwXPxVR4XPk9g3MsrFtt1rmWwZlAtRKlz3nmcfC7aqZT2NYSSW1/rDgU1C
 kN0anx2X5g0Q76wYs9VcObT5VEqXzwukhtDh2LcuKl0bWzjsig7c0CZhluljfKt1n4tQ
 LdLJFjHGDAQKiUwTKSoc9cTiOuFxHw4/zbpD/F8wd06vEPZF5u2IeS/SPpa6cQ1vQWPg
 48gaqT/EoXD25G4ZVvSty9cj+LCTV3QIAwiVU7W0jqnCohJroadAO9Sti+8RW6DlLpoY
 03ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ej/u95XewO8oxEcD2YFAX3/VQ7PaDTsn1Re04y77RLQ=;
 b=s31yJ1e4PE1IKj3c2KaBhhP5FlnHF/wjST6EQ1hR93aW6m+VVPckJ/KvKcC4zQ7yjx
 FvLKIFfv8BnWjS5vXzrZzb78MrthdMUVboKIKzRcj/JpJ8Wppr4jjeSZXV+VMkdIj9GP
 piXvpsr7XS0O7yAq3OQwzv/WgXYzX7cIcTBkqO/ZRuaxWHvqWNFuwx7tIj/rlo1Xri63
 oBFLiXVgisXwVgYejcAMoh9LnGssAJWcrluRl3km2FJyAIGxhOEzGUkbRMefoS+Fl1wQ
 XpZ/7rEsCU9HqbJQVYqYV5rBj6+lEvsvkyxO61tzL5WfTzAPD/t1O2pAXlTicmSx+wOj
 Lk9Q==
X-Gm-Message-State: APjAAAWz04/xo13J4h9DIJiaNFiKSxE2h8Te2EIdJtZLQS2kQiAwB3mA
 sapRky8OrxA5yWMFLVK8P0I=
X-Google-Smtp-Source: APXvYqzeq0YV1qXcBW4pAZjUEGQu2bHQdU+w4lR0v9u4fxe2rtZWEtYaTSm/FiG9LwmD9ljfJIIM4g==
X-Received: by 2002:a65:6104:: with SMTP id z4mr6748738pgu.27.1568525397425;
 Sat, 14 Sep 2019 22:29:57 -0700 (PDT)
Received: from localhost.localdomain (ip-103-85-37-119.syd.xi.com.au.
 [103.85.37.119])
 by smtp.gmail.com with ESMTPSA id q42sm7137156pja.16.2019.09.14.22.29.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2019 22:29:56 -0700 (PDT)
From: Adam Zerella <adam.zerella@gmail.com>
To: 
Subject: [PATCH] docs: powerpc: Add missing documentation reference
Date: Sun, 15 Sep 2019 15:29:05 +1000
Message-Id: <20190915052905.13431-1-adam.zerella@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 16 Sep 2019 15:11:42 +1000
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
Cc: Adam Zerella <adam.zerella@gmail.com>, corbet@lwn.net, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The documentation pages for 'elfnote' and 'ultravisor'
are not included in the powerpc documentation index, this
generates Sphinx warnings:

WARNING: document isn't included in any toctree

Additionally, when one includes these missing doc pages,
more Sphinx warnings appear. Unused footnote references,
syntax highlighting and table of content ordering has
been adjusted.

Signed-off-by: Adam Zerella <adam.zerella@gmail.com>
---
 Documentation/powerpc/elfnote.rst    | 29 ++++++++++++++--------------
 Documentation/powerpc/index.rst      |  2 ++
 Documentation/powerpc/ultravisor.rst | 13 +++++--------
 3 files changed, 21 insertions(+), 23 deletions(-)

diff --git a/Documentation/powerpc/elfnote.rst b/Documentation/powerpc/elfnote.rst
index 2a5c4beeb809..06602248621c 100644
--- a/Documentation/powerpc/elfnote.rst
+++ b/Documentation/powerpc/elfnote.rst
@@ -8,8 +8,7 @@ capabilities and information which can be used by a bootloader or userland.
 Types and Descriptors
 ---------------------
 
-The types to be used with the "PowerPC" namesapce are defined in the
-include/uapi/asm/elfnote.h
+The types to be used with the "PowerPC" namesapce are defined in [#f1]_.
 
 	1) PPC_ELFNOTE_CAPABILITIES
 
@@ -18,25 +17,25 @@ bitmap as "descriptor" field. Each bit is described below:
 
 - Ultravisor-capable bit (PowerNV only).
 
+.. code-block:: c
+
 	#define PPCCAP_ULTRAVISOR_BIT (1 << 0)
 
-	Indicate that the powerpc kernel binary knows how to run in an
-	ultravisor-enabled system.
+Indicate that the powerpc kernel binary knows how to run in an
+ultravisor-enabled system.
 
-	In an ultravisor-enabled system, some machine resources are now controlled
-	by the ultravisor. If the kernel is not ultravisor-capable, but it ends up
-	being run on a machine with ultravisor, the kernel will probably crash
-	trying to access ultravisor resources. For instance, it may crash in early
-	boot trying to set the partition table entry 0.
+In an ultravisor-enabled system, some machine resources are now controlled
+by the ultravisor. If the kernel is not ultravisor-capable, but it ends up
+being run on a machine with ultravisor, the kernel will probably crash
+trying to access ultravisor resources. For instance, it may crash in early
+boot trying to set the partition table entry 0.
 
-	In an ultravisor-enabled system, a bootloader could warn the user or prevent
-   	the kernel from being run if the PowerPC ultravisor capability doesn't exist
-	or the Ultravisor-capable bit is not set.
+In an ultravisor-enabled system, a bootloader could warn the user or prevent
+the kernel from being run if the PowerPC ultravisor capability doesn't exist
+or the Ultravisor-capable bit is not set.
 
 References
 ----------
 
-arch/powerpc/include/asm/elfnote.h
-arch/powerpc/kernel/note.S
-
+.. [#f1] arch/powerpc/include/asm/elfnote.h
 
diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 549b1cdd77ae..db7b6a880f52 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -15,6 +15,7 @@ powerpc
     dawr-power9
     dscr
     eeh-pci-error-recovery
+    elfnote
     firmware-assisted-dump
     hvcs
     isa-versions
@@ -25,6 +26,7 @@ powerpc
     qe_firmware
     syscall64-abi
     transactional_memory
+    ultravisor
 
 .. only::  subproject and html
 
diff --git a/Documentation/powerpc/ultravisor.rst b/Documentation/powerpc/ultravisor.rst
index 94a149f34ec3..730854f73830 100644
--- a/Documentation/powerpc/ultravisor.rst
+++ b/Documentation/powerpc/ultravisor.rst
@@ -1,5 +1,5 @@
 .. SPDX-License-Identifier: GPL-2.0
-﻿.. _ultravisor:
+.. _ultravisor:
 
 ============================
 Protected Execution Facility
@@ -8,9 +8,6 @@ Protected Execution Facility
 .. contents::
     :depth: 3
 
-.. sectnum::
-    :depth: 3
-
 Protected Execution Facility
 ############################
 
@@ -255,10 +252,10 @@ Ultravisor calls API
     be made available in the public/OpenPower version of the PAPR
     specification.
 
-    **Note**
+    .. note::
 
-    If PEF is not enabled, the ultracalls will be redirected to the
-    Hypervisor which must handle/fail the calls.
+        If PEF is not enabled, the ultracalls will be redirected to the
+        Hypervisor which must handle/fail the calls.
 
 Ultracalls used by Hypervisor
 =============================
@@ -1054,4 +1051,4 @@ Use cases
 References
 ##########
 
-.. [1] `Supporting Protected Computing on IBM Power Architecture <https://developer.ibm.com/articles/l-support-protected-computing/>`_
+- `Supporting Protected Computing on IBM Power Architecture <https://developer.ibm.com/articles/l-support-protected-computing/>`_
-- 
2.21.0


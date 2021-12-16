Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33288476E36
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 10:50:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF6nB0v0mz3clf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 20:50:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=oBfC3JBc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=alexandre.ghiti@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=oBfC3JBc; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF6mD31vPz3cTG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 20:50:04 +1100 (AEDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 276863FFD8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 09:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1639648202;
 bh=UE9qVdLRJW7bpl/DPmIb38u9EtZ1GCmDXsqavcnm0Z0=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=oBfC3JBc6AEea/1FbtHiplONMLL0/cNjgqzMII6wdO+oPBMNmBLgvn8W+8JLMTRWF
 OffGRMmWIXakFC7LFbDnOFuPSRigku18V1QxrE8E+WABbfGW3p8C5Yk/i+xHjZ/Rkl
 kFmZsg8uoK8hGtm8UMOP7a2cDf+6QND8kx/Wz6pVR7S6zBvCDMwTpbno1kJcGjcryH
 5ohwGtCyo7lsuNqIR5ynX/XIodh81uiTOYf4InAIrwpYRELs4pyLOA2qZtBvxZaBSz
 94gUaY38teD30Y7DmAXfAbSFwPQ3mvFWuyfFQ9izKt+6yANfA672N9eI6qKEcgLzyN
 rnF2c8ypgozrw==
Received: by mail-wr1-f69.google.com with SMTP id
 t30-20020adfa2de000000b001a24004e1fbso485640wra.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 01:50:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UE9qVdLRJW7bpl/DPmIb38u9EtZ1GCmDXsqavcnm0Z0=;
 b=DhACuIyefsLv4iFayiZuC1C9ao6tzko5lEo/Zia4TUDABgOw7ap2SXkmZTazNbnScv
 uNVWwDsGJ+Xl2DctdRVFAxRmwNZ4o7NOSdCXcCSWQKVGAYsYO530RmPWi13OIRha+9g3
 fjyrJpvm/8H+HbojRcNvIXQptaHOD7dSJCSblKb9OsNEUUKxmwaSj4jyHTGshjr+/p3V
 JYJXcU2xHkK0a0v8uCMXylUu42FnCxLnrO2fo/VfAhBaO2IiYLyiUOaxLwkNuMTVfWg2
 ClhtnrXGCobpg+J+JjxRFo0FVL9er2B1/wdoZDkzsWU1dTJtJ8XgV+QlFT5zj8TEkaQG
 vmsQ==
X-Gm-Message-State: AOAM5323FBMMa2oMmcK1BAhItOJY54j949btmA433MMG8rp0W9EcYmSL
 iUiyR+OXbnI29wublhJCpG6Zu7dI9hND9XV6vYRmVrSEwi9fUGidFuB0BSoIRIouhW8Wj+BD6Xp
 ckZiCMhYIVXCl7Kv9c9MN2sSJcSTfstc6UbVH60+H730=
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr2381563wrx.569.1639648200618; 
 Thu, 16 Dec 2021 01:50:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx/xLlJnCExECCDNoAM44eP9543vxxsGpjhjfHYoFuaFs3LQSghst7DJCdkhsW2zDOpmEE8rA==
X-Received: by 2002:a05:6000:1d1:: with SMTP id
 t17mr2381544wrx.569.1639648200429; 
 Thu, 16 Dec 2021 01:50:00 -0800 (PST)
Received: from alex.home (lfbn-gre-1-195-1.w90-112.abo.wanadoo.fr.
 [90.112.158.1])
 by smtp.gmail.com with ESMTPSA id k6sm3892637wmj.16.2021.12.16.01.49.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 01:50:00 -0800 (PST)
From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
To: Steve French <sfrench@samba.org>, Jonathan Corbet <corbet@lwn.net>,
 David Howells <dhowells@redhat.com>, Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Lee Jones <lee.jones@linaro.org>, Jeff Layton <jlayton@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Arnd Bergmann <arnd@arndb.de>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 linux-cifs@vger.kernel.org, samba-technical@lists.samba.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-cachefs@redhat.com, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, linux-power@fi.rohmeurope.com
Subject: [PATCH v2 5/6] Documentation, arch,
 fs: Remove leftovers from fscache object list
Date: Thu, 16 Dec 2021 10:44:25 +0100
Message-Id: <20211216094426.2083802-6-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
References: <20211216094426.2083802-1-alexandre.ghiti@canonical.com>
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
Cc: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A few references to the fscache object list were left in the
Documentation, some arch defconfigs and in fs: remove them since this
config does not exists anymore.

Fixes: 58f386a73f16 ("fscache: Remove the object list procfile")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
Acked-by: Arnd Bergmann <arnd@arndb.de> [arch/arm/configs]
---
 Documentation/filesystems/caching/fscache.rst | 89 -------------------
 arch/arm/configs/axm55xx_defconfig            |  1 -
 fs/fscache/object.c                           |  3 -
 fs/fscache/proc.c                             | 12 ---
 4 files changed, 105 deletions(-)

diff --git a/Documentation/filesystems/caching/fscache.rst b/Documentation/filesystems/caching/fscache.rst
index 66e31a6d1070..7cedab444947 100644
--- a/Documentation/filesystems/caching/fscache.rst
+++ b/Documentation/filesystems/caching/fscache.rst
@@ -411,95 +411,6 @@ proc file.
 +--------------+-------+-------------------------------------------------------+
 
 
-
-Object List
-===========
-
-If CONFIG_FSCACHE_OBJECT_LIST is enabled, the FS-Cache facility will maintain a
-list of all the objects currently allocated and allow them to be viewed
-through::
-
-	/proc/fs/fscache/objects
-
-This will look something like::
-
-	[root@andromeda ~]# head /proc/fs/fscache/objects
-	OBJECT   PARENT   STAT CHLDN OPS OOP IPR EX READS EM EV F S | NETFS_COOKIE_DEF TY FL NETFS_DATA       OBJECT_KEY, AUX_DATA
-	======== ======== ==== ===== === === === == ===== == == = = | ================ == == ================ ================
-	   17e4b        2 ACTV     0   0   0   0  0     0 7b  4 0 0 | NFS.fh           DT  0 ffff88001dd82820 010006017edcf8bbc93b43298fdfbe71e50b57b13a172c0117f38472, e567634700000000000000000000000063f2404a000000000000000000000000c9030000000000000000000063f2404a
-	   1693a        2 ACTV     0   0   0   0  0     0 7b  4 0 0 | NFS.fh           DT  0 ffff88002db23380 010006017edcf8bbc93b43298fdfbe71e50b57b1e0162c01a2df0ea6, 420ebc4a000000000000000000000000420ebc4a0000000000000000000000000e1801000000000000000000420ebc4a
-
-where the first set of columns before the '|' describe the object:
-
-	=======	===============================================================
-	COLUMN	DESCRIPTION
-	=======	===============================================================
-	OBJECT	Object debugging ID (appears as OBJ%x in some debug messages)
-	PARENT	Debugging ID of parent object
-	STAT	Object state
-	CHLDN	Number of child objects of this object
-	OPS	Number of outstanding operations on this object
-	OOP	Number of outstanding child object management operations
-	IPR
-	EX	Number of outstanding exclusive operations
-	READS	Number of outstanding read operations
-	EM	Object's event mask
-	EV	Events raised on this object
-	F	Object flags
-	S	Object work item busy state mask (1:pending 2:running)
-	=======	===============================================================
-
-and the second set of columns describe the object's cookie, if present:
-
-	================ ======================================================
-	COLUMN		 DESCRIPTION
-	================ ======================================================
-	NETFS_COOKIE_DEF Name of netfs cookie definition
-	TY		 Cookie type (IX - index, DT - data, hex - special)
-	FL		 Cookie flags
-	NETFS_DATA	 Netfs private data stored in the cookie
-	OBJECT_KEY	 Object key } 1 column, with separating comma
-	AUX_DATA	 Object aux data } presence may be configured
-	================ ======================================================
-
-The data shown may be filtered by attaching the a key to an appropriate keyring
-before viewing the file.  Something like::
-
-		keyctl add user fscache:objlist <restrictions> @s
-
-where <restrictions> are a selection of the following letters:
-
-	==	=========================================================
-	K	Show hexdump of object key (don't show if not given)
-	A	Show hexdump of object aux data (don't show if not given)
-	==	=========================================================
-
-and the following paired letters:
-
-	==	=========================================================
-	C	Show objects that have a cookie
-	c	Show objects that don't have a cookie
-	B	Show objects that are busy
-	b	Show objects that aren't busy
-	W	Show objects that have pending writes
-	w	Show objects that don't have pending writes
-	R	Show objects that have outstanding reads
-	r	Show objects that don't have outstanding reads
-	S	Show objects that have work queued
-	s	Show objects that don't have work queued
-	==	=========================================================
-
-If neither side of a letter pair is given, then both are implied.  For example:
-
-	keyctl add user fscache:objlist KB @s
-
-shows objects that are busy, and lists their object keys, but does not dump
-their auxiliary data.  It also implies "CcWwRrSs", but as 'B' is given, 'b' is
-not implied.
-
-By default all objects and all fields will be shown.
-
-
 Debugging
 =========
 
diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index b36e0b347d1f..c0ea326d4c5e 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -205,7 +205,6 @@ CONFIG_CUSE=y
 CONFIG_FSCACHE=y
 CONFIG_FSCACHE_STATS=y
 CONFIG_FSCACHE_DEBUG=y
-CONFIG_FSCACHE_OBJECT_LIST=y
 CONFIG_CACHEFILES=y
 CONFIG_ISO9660_FS=y
 CONFIG_UDF_FS=y
diff --git a/fs/fscache/object.c b/fs/fscache/object.c
index 6a675652129b..f31257a74f35 100644
--- a/fs/fscache/object.c
+++ b/fs/fscache/object.c
@@ -321,9 +321,6 @@ void fscache_object_init(struct fscache_object *object,
 	object->cookie = cookie;
 	fscache_cookie_get(cookie, fscache_cookie_get_attach_object);
 	object->parent = NULL;
-#ifdef CONFIG_FSCACHE_OBJECT_LIST
-	RB_CLEAR_NODE(&object->objlist_link);
-#endif
 
 	object->oob_event_mask = 0;
 	for (t = object->oob_table; t->events; t++)
diff --git a/fs/fscache/proc.c b/fs/fscache/proc.c
index 061df8f61ffc..4c327aeed91b 100644
--- a/fs/fscache/proc.c
+++ b/fs/fscache/proc.c
@@ -31,18 +31,9 @@ int __init fscache_proc_init(void)
 		goto error_stats;
 #endif
 
-#ifdef CONFIG_FSCACHE_OBJECT_LIST
-	if (!proc_create("fs/fscache/objects", S_IFREG | 0444, NULL,
-			 &fscache_objlist_proc_ops))
-		goto error_objects;
-#endif
-
 	_leave(" = 0");
 	return 0;
 
-#ifdef CONFIG_FSCACHE_OBJECT_LIST
-error_objects:
-#endif
 #ifdef CONFIG_FSCACHE_STATS
 	remove_proc_entry("fs/fscache/stats", NULL);
 error_stats:
@@ -60,9 +51,6 @@ int __init fscache_proc_init(void)
  */
 void fscache_proc_cleanup(void)
 {
-#ifdef CONFIG_FSCACHE_OBJECT_LIST
-	remove_proc_entry("fs/fscache/objects", NULL);
-#endif
 #ifdef CONFIG_FSCACHE_STATS
 	remove_proc_entry("fs/fscache/stats", NULL);
 #endif
-- 
2.32.0


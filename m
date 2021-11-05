Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7171C44661F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 16:45:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hm4b32f7kz3bvH
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Nov 2021 02:45:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=Wxi/k4DH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=alexandre.ghiti@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=Wxi/k4DH; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hm4ZN3Y6Tz2xsq
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Nov 2021 02:44:44 +1100 (AEDT)
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 059BD40001
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 15:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1636127081;
 bh=jHLHivxStKmmA/vK1gxbQJ1JTHvdFc1nwcxGtaT2GSQ=;
 h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Wxi/k4DHM8xoeMb2+7tp/c4gBTftv8uLHRkROgTXcLZPAUka5G4iM2wVpGgC57ezV
 8QKQZKVs2KpdnHK818UzohnIUZXWuo7btqMxcuc634CSAwoFqTGZgF8HpOvpX+pjMC
 OdNaEmK5u5JKnVcBBr/SBeLXo6EUGK/HZr+K94fSKCk20nJoKUqBkuFgvLxBAz22dQ
 8+mNxKh/0eIaOmkLQ/PXjviP5CgX79xpD/UhZ7B0PkmEcP7bIxnx+4ZZOPPj9Ms0vE
 OgKVxCuVgSDI3BBRMcfdWvajCn3dfA6xXcY0/K0b8LRi2F+i1F8Hb7qG+ywsMJ4FXt
 /Fi3RPfx5ezZQ==
Received: by mail-wm1-f71.google.com with SMTP id
 k6-20020a7bc306000000b0030d92a6bdc7so3375839wmj.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Nov 2021 08:44:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jHLHivxStKmmA/vK1gxbQJ1JTHvdFc1nwcxGtaT2GSQ=;
 b=K9u9+Wc01xMzDMzjvtxO1w2iWRNJn51yAdYdEK+RzvcydOK6EFCx0vHoPQyQdSzj5F
 5dH6U1seozW2iNj2FKwDg779Lg6bWcKD3eD8rZ+UvIMwkO8vvsTfCPLYakqZxsoq61wd
 SDaFTbddycMk8jAhyE0EI2rNt3DBg9qRyLT+SwEwtaK0iJ7YjplWzFDEROjDwvvflEqB
 4tHUPDY5H5Lt51LH1Ub9RKYn0y1GR8lwOgW3tc5REObvIVxPHKLkQEoQA71FIJJJNFzb
 LOHURnu6rYipKEnzUgW3BN4+dQXc2a/2e1AoX3wPhsLrFtgEMokLqkZkZq5qPCizJPqW
 LRcw==
X-Gm-Message-State: AOAM533X3zs+0DZ3fTLpKYjlHIePJ+DgdGFrnA8jEtUTmS7xkdFJ5xYZ
 U2HHpf4e1Is2bvHF4SFV/gvxDMFPk7iC96GXngG6knDD90UisklMminuhyoJG2qLcmZ0UeNqXQx
 Q3LjLgPb/YSlyaL95K18//keL0FO82DGIfW+voRfwyFk=
X-Received: by 2002:adf:fb44:: with SMTP id c4mr71913784wrs.179.1636127080592; 
 Fri, 05 Nov 2021 08:44:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwubhhFLZ1HPTor4i3ntryLRhJH9bsSukDKTrsUDEYR79CovJvijb9h2VluKlN2+0XYoTfgRg==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr71913748wrs.179.1636127080324; 
 Fri, 05 Nov 2021 08:44:40 -0700 (PDT)
Received: from localhost.localdomain (lfbn-lyo-1-470-249.w2-7.abo.wanadoo.fr.
 [2.7.60.249])
 by smtp.gmail.com with ESMTPSA id l11sm8178812wrp.61.2021.11.05.08.44.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Nov 2021 08:44:40 -0700 (PDT)
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
Subject: [PATCH 1/7] Documentation,
 arch: Remove leftovers from fscache/cachefiles histograms
Date: Fri,  5 Nov 2021 16:43:28 +0100
Message-Id: <20211105154334.1841927-2-alexandre.ghiti@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
References: <20211105154334.1841927-1-alexandre.ghiti@canonical.com>
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

A few references to the fscache and cachefiles histograms were left in
the Documentation and some arch defconfigs: remove them since those
configs do not exist anymore.

Fixes: 6ae9bd8bb037("fscache, cachefiles: Remove the histogram stuff")
Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
---
 .../filesystems/caching/cachefiles.rst        | 34 -------------------
 Documentation/filesystems/caching/fscache.rst | 34 ++-----------------
 arch/arm/configs/axm55xx_defconfig            |  2 --
 arch/mips/configs/nlm_xlp_defconfig           |  1 -
 arch/mips/configs/nlm_xlr_defconfig           |  1 -
 5 files changed, 2 insertions(+), 70 deletions(-)

diff --git a/Documentation/filesystems/caching/cachefiles.rst b/Documentation/filesystems/caching/cachefiles.rst
index e58bc1fd312a..e59861458029 100644
--- a/Documentation/filesystems/caching/cachefiles.rst
+++ b/Documentation/filesystems/caching/cachefiles.rst
@@ -424,40 +424,6 @@ for CacheFiles to run in a context of a specific security label, or to create
 files and directories with another security label.
 
 
-Statistical Information
-=======================
-
-If FS-Cache is compiled with the following option enabled::
-
-	CONFIG_CACHEFILES_HISTOGRAM=y
-
-then it will gather certain statistics and display them through a proc file.
-
- /proc/fs/cachefiles/histogram
-
-     ::
-
-	cat /proc/fs/cachefiles/histogram
-	JIFS  SECS  LOOKUPS   MKDIRS    CREATES
-	===== ===== ========= ========= =========
-
-     This shows the breakdown of the number of times each amount of time
-     between 0 jiffies and HZ-1 jiffies a variety of tasks took to run.  The
-     columns are as follows:
-
-	=======		=======================================================
-	COLUMN		TIME MEASUREMENT
-	=======		=======================================================
-	LOOKUPS		Length of time to perform a lookup on the backing fs
-	MKDIRS		Length of time to perform a mkdir on the backing fs
-	CREATES		Length of time to perform a create on the backing fs
-	=======		=======================================================
-
-     Each row shows the number of events that took a particular range of times.
-     Each step is 1 jiffy in size.  The JIFS column indicates the particular
-     jiffy range covered, and the SECS field the equivalent number of seconds.
-
-
 Debugging
 =========
 
diff --git a/Documentation/filesystems/caching/fscache.rst b/Documentation/filesystems/caching/fscache.rst
index 70de86922b6a..66e31a6d1070 100644
--- a/Documentation/filesystems/caching/fscache.rst
+++ b/Documentation/filesystems/caching/fscache.rst
@@ -201,10 +201,9 @@ Statistical Information
 If FS-Cache is compiled with the following options enabled::
 
 	CONFIG_FSCACHE_STATS=y
-	CONFIG_FSCACHE_HISTOGRAM=y
 
-then it will gather certain statistics and display them through a number of
-proc files.
+then it will gather certain statistics and display them through the following
+proc file.
 
 /proc/fs/fscache/stats
 ----------------------
@@ -413,35 +412,6 @@ proc files.
 
 
 
-/proc/fs/fscache/histogram
---------------------------
-
-     ::
-
-	cat /proc/fs/fscache/histogram
-	JIFS  SECS  OBJ INST  OP RUNS   OBJ RUNS  RETRV DLY RETRIEVLS
-	===== ===== ========= ========= ========= ========= =========
-
-     This shows the breakdown of the number of times each amount of time
-     between 0 jiffies and HZ-1 jiffies a variety of tasks took to run.  The
-     columns are as follows:
-
-	=========	=======================================================
-	COLUMN		TIME MEASUREMENT
-	=========	=======================================================
-	OBJ INST	Length of time to instantiate an object
-	OP RUNS		Length of time a call to process an operation took
-	OBJ RUNS	Length of time a call to process an object event took
-	RETRV DLY	Time between an requesting a read and lookup completing
-	RETRIEVLS	Time between beginning and end of a retrieval
-	=========	=======================================================
-
-     Each row shows the number of events that took a particular range of times.
-     Each step is 1 jiffy in size.  The JIFS column indicates the particular
-     jiffy range covered, and the SECS field the equivalent number of seconds.
-
-
-
 Object List
 ===========
 
diff --git a/arch/arm/configs/axm55xx_defconfig b/arch/arm/configs/axm55xx_defconfig
index 46075216ee6d..b36e0b347d1f 100644
--- a/arch/arm/configs/axm55xx_defconfig
+++ b/arch/arm/configs/axm55xx_defconfig
@@ -204,11 +204,9 @@ CONFIG_FUSE_FS=y
 CONFIG_CUSE=y
 CONFIG_FSCACHE=y
 CONFIG_FSCACHE_STATS=y
-CONFIG_FSCACHE_HISTOGRAM=y
 CONFIG_FSCACHE_DEBUG=y
 CONFIG_FSCACHE_OBJECT_LIST=y
 CONFIG_CACHEFILES=y
-CONFIG_CACHEFILES_HISTOGRAM=y
 CONFIG_ISO9660_FS=y
 CONFIG_UDF_FS=y
 CONFIG_MSDOS_FS=y
diff --git a/arch/mips/configs/nlm_xlp_defconfig b/arch/mips/configs/nlm_xlp_defconfig
index 32c290611723..c97f00ece828 100644
--- a/arch/mips/configs/nlm_xlp_defconfig
+++ b/arch/mips/configs/nlm_xlp_defconfig
@@ -420,7 +420,6 @@ CONFIG_FUSE_FS=y
 CONFIG_CUSE=m
 CONFIG_FSCACHE=m
 CONFIG_FSCACHE_STATS=y
-CONFIG_FSCACHE_HISTOGRAM=y
 CONFIG_CACHEFILES=m
 CONFIG_ISO9660_FS=m
 CONFIG_JOLIET=y
diff --git a/arch/mips/configs/nlm_xlr_defconfig b/arch/mips/configs/nlm_xlr_defconfig
index bf9b9244929e..60ea102783d9 100644
--- a/arch/mips/configs/nlm_xlr_defconfig
+++ b/arch/mips/configs/nlm_xlr_defconfig
@@ -372,7 +372,6 @@ CONFIG_FUSE_FS=y
 CONFIG_CUSE=m
 CONFIG_FSCACHE=m
 CONFIG_FSCACHE_STATS=y
-CONFIG_FSCACHE_HISTOGRAM=y
 CONFIG_CACHEFILES=m
 CONFIG_ISO9660_FS=m
 CONFIG_JOLIET=y
-- 
2.32.0


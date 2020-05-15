Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D86A81D5963
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 20:46:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Ny790ZqszDqHW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 04:46:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=FFCdriJS; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ny4v20VTzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 04:44:43 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id k19so1247717pll.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jsyBNCdfoL98sYl7cnpntA0QaiVdKf/pQHgqAm6lCYc=;
 b=FFCdriJSY7EREhlVw7IxRxRBK6Ih8PscgoyfU0YOxFmw+mYa4P8kbYTdI3Abj2xsbv
 dSBqe5xNx4EdU6OBEbPL6+Ktp8r1MwV2GC+z42GBSCy/OKACQ/TjY0Z+0HyakSj6TLKK
 bj22i9zQWZ2HwbBoxp38600+xxhVI0OIEt8ug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jsyBNCdfoL98sYl7cnpntA0QaiVdKf/pQHgqAm6lCYc=;
 b=WLPHdDTWI9JEPNeTqGbTmtJ9KmqWcWHzJA0cZida6M0lZtBCB0iPZa6oEtnLKyEDgM
 TjHo6rWmBoMtFQUXz4HA3EzhgUrutveuKqbXHIhGv8/Acpd/LeMTmEqGYllGL4U8gNSu
 oQXY5X/TJ9fxeW8HP4eik4rjHcXRX7y4gSiBvZamHP/CeRy+QmlnQDscE8doHmkn7y7d
 4ek5cWLOerwFSivwgNeX+53LB+B8Mug+vu+vp2pPb+yPn6ZGhiMl93oqVdhN1BAXfC6/
 KLICk5KKtx1LV0kvpnGS0RqfAvWgX8PUFsTGbiMnLO6rRxH4HdTC+1zZNg5c4TU/JZF0
 mnaQ==
X-Gm-Message-State: AOAM530m7LeCCqFjps+WhMlhm++W1Z6SOAzYFRl+8Swj7sr5VwDgAVfP
 VzkjoXzmIB5YSDrPYmdTlS+bSA==
X-Google-Smtp-Source: ABdhPJxBfb/RPReNIGiBtLiME/PRnLfy/gMnbNQWUG6b6p1tr5eRGW/FhmqI7QvZ6RmEUD62weuFvQ==
X-Received: by 2002:a17:90a:7f83:: with SMTP id
 m3mr5175792pjl.147.1589568281062; 
 Fri, 15 May 2020 11:44:41 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id z190sm2549307pfb.1.2020.05.15.11.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 11:44:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH v4 3/6] printk: Introduce kmsg_dump_reason_str()
Date: Fri, 15 May 2020 11:44:31 -0700
Message-Id: <20200515184434.8470-4-keescook@chromium.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200515184434.8470-1-keescook@chromium.org>
References: <20200515184434.8470-1-keescook@chromium.org>
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
Cc: Petr Mladek <pmladek@suse.com>, Tony Luck <tony.luck@intel.com>,
 Kees Cook <keescook@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 Anton Vorontsov <anton@enomsg.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Sergey Senozhatsky <sergey.senozhatsky@gmail.com>, devicetree@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>,
 Colin Cross <ccross@android.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linuxppc-dev@lists.ozlabs.org, Benson Leung <bleung@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The pstore subsystem already had a private version of this function.
With the coming addition of the pstore/zone driver, this needs to be
shared. As it really should live with printk, move it there instead.

Link: https://lore.kernel.org/lkml/20200510202436.63222-8-keescook@chromium.org/
Acked-by: Petr Mladek <pmladek@suse.com>
Acked-by: Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c      | 18 +-----------------
 include/linux/kmsg_dump.h |  7 +++++++
 kernel/printk/printk.c    | 17 +++++++++++++++++
 3 files changed, 25 insertions(+), 17 deletions(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 90d74ebaa70a..5e6c6022deb9 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -135,22 +135,6 @@ enum pstore_type_id pstore_name_to_type(const char *name)
 }
 EXPORT_SYMBOL_GPL(pstore_name_to_type);
 
-static const char *get_reason_str(enum kmsg_dump_reason reason)
-{
-	switch (reason) {
-	case KMSG_DUMP_PANIC:
-		return "Panic";
-	case KMSG_DUMP_OOPS:
-		return "Oops";
-	case KMSG_DUMP_EMERG:
-		return "Emergency";
-	case KMSG_DUMP_SHUTDOWN:
-		return "Shutdown";
-	default:
-		return "Unknown";
-	}
-}
-
 static void pstore_timer_kick(void)
 {
 	if (pstore_update_ms < 0)
@@ -403,7 +387,7 @@ static void pstore_dump(struct kmsg_dumper *dumper,
 	unsigned int	part = 1;
 	int		ret;
 
-	why = get_reason_str(reason);
+	why = kmsg_dump_reason_str(reason);
 
 	if (down_trylock(&psinfo->buf_lock)) {
 		/* Failed to acquire lock: give up if we cannot wait. */
diff --git a/include/linux/kmsg_dump.h b/include/linux/kmsg_dump.h
index 9826014771ab..3378bcbe585e 100644
--- a/include/linux/kmsg_dump.h
+++ b/include/linux/kmsg_dump.h
@@ -70,6 +70,8 @@ void kmsg_dump_rewind(struct kmsg_dumper *dumper);
 int kmsg_dump_register(struct kmsg_dumper *dumper);
 
 int kmsg_dump_unregister(struct kmsg_dumper *dumper);
+
+const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason);
 #else
 static inline void kmsg_dump(enum kmsg_dump_reason reason)
 {
@@ -111,6 +113,11 @@ static inline int kmsg_dump_unregister(struct kmsg_dumper *dumper)
 {
 	return -EINVAL;
 }
+
+static inline const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason)
+{
+	return "Disabled";
+}
 #endif
 
 #endif /* _LINUX_KMSG_DUMP_H */
diff --git a/kernel/printk/printk.c b/kernel/printk/printk.c
index a121c2255737..14ca4d05d902 100644
--- a/kernel/printk/printk.c
+++ b/kernel/printk/printk.c
@@ -3144,6 +3144,23 @@ EXPORT_SYMBOL_GPL(kmsg_dump_unregister);
 static bool always_kmsg_dump;
 module_param_named(always_kmsg_dump, always_kmsg_dump, bool, S_IRUGO | S_IWUSR);
 
+const char *kmsg_dump_reason_str(enum kmsg_dump_reason reason)
+{
+	switch (reason) {
+	case KMSG_DUMP_PANIC:
+		return "Panic";
+	case KMSG_DUMP_OOPS:
+		return "Oops";
+	case KMSG_DUMP_EMERG:
+		return "Emergency";
+	case KMSG_DUMP_SHUTDOWN:
+		return "Shutdown";
+	default:
+		return "Unknown";
+	}
+}
+EXPORT_SYMBOL_GPL(kmsg_dump_reason_str);
+
 /**
  * kmsg_dump - dump kernel log to kernel message dumpers.
  * @reason: the reason (oops, panic etc) for dumping
-- 
2.20.1


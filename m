Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D928B1D5975
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 20:50:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NyCF5WYszDqM9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 May 2020 04:50:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=kFD/V16e; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Ny4v21yzzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 May 2020 04:44:43 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id a5so1295342pjh.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 11:44:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ma8a3IEAfy5hkhHsO5eKEOmN1t9cPUU6UBCxHjpj29E=;
 b=kFD/V16eJ50vNYvQlv772jPHRykPYjlwl1Um5D+Hle7uWzCtgZBfQwS/KwK/nZTCfr
 j7KkvjVgSES0XLwXjE9WlI7wIu/Nf8fUAlNzwExUrzHOkC2R1ilVSTKU/mq7IEzMjFjU
 4aduh2ic/Jzv/txp6IEmmoGgNg+5FXR5uWH8Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ma8a3IEAfy5hkhHsO5eKEOmN1t9cPUU6UBCxHjpj29E=;
 b=IiH2cinCuRbw/hqu77mjoFeGhCQpFp60wyc21/NiqkG0JTj//PiTlg9oXD9NkamInR
 6m86G5TcrEE4SfPZH/Uuolz6nySWPGacL1o6SUiA44oUFeilMVIk+SYSAnqDz0stKGNm
 nbiqzM1kMVurP66oYiYpHt3m/MrTPDVNygBFSDcd9l79ogpwvqmWrWaVDjxlaZdtKPLg
 cLIT04PHyjwnKb20B0ZMxwcUyRRyZfCGtJQne4bd5ShuuiqEeyOQku2/Owj+qczU0YGn
 nT304F3qwCLcAaQ21uN8L4sbEZOxLHHdXK8yLkocPFMsNSRApB14hFYeTMlL+KzrXYn7
 xqoA==
X-Gm-Message-State: AOAM532KxXePzdKHohmf11cytP4cJFkUXmoFmI+ttF7JZHu2X34ZAJ+J
 0dsLGh9rfw8Se1dSHImGDSwTPw==
X-Google-Smtp-Source: ABdhPJxrmBmEg335hMMKhTsZxipJMSKlq5GwMgh5rKfEUwuGPTZ3/FFaBx7j/3lkOTeALmalHA9y/g==
X-Received: by 2002:a17:90b:41d5:: with SMTP id
 jm21mr4562657pjb.96.1589568280507; 
 Fri, 15 May 2020 11:44:40 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t20sm2075905pjo.13.2020.05.15.11.44.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 May 2020 11:44:38 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: Pavel Tatashin <pasha.tatashin@soleen.com>
Subject: [PATCH v4 4/6] pstore/platform: Pass max_reason to kmesg dump
Date: Fri, 15 May 2020 11:44:32 -0700
Message-Id: <20200515184434.8470-5-keescook@chromium.org>
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

From: Pavel Tatashin <pasha.tatashin@soleen.com>

Add a new member to struct pstore_info for passing information about
kmesg dump maximum reason. This allows a finer control of what kmesg
dumps are sent to pstore storage backends.

Those backends that do not explicitly set this field (keeping it equal to
0), get the default behavior: store only Oopses and Panics, or everything
if the printk.always_kmsg_dump boot param is set.

Signed-off-by: Pavel Tatashin <pasha.tatashin@soleen.com>
Link: https://lore.kernel.org/lkml/20200506211523.15077-3-keescook@chromium.org/
Co-developed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 fs/pstore/platform.c   | 4 +++-
 include/linux/pstore.h | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/pstore/platform.c b/fs/pstore/platform.c
index 5e6c6022deb9..a9e297eefdff 100644
--- a/fs/pstore/platform.c
+++ b/fs/pstore/platform.c
@@ -595,8 +595,10 @@ int pstore_register(struct pstore_info *psi)
 
 	pstore_get_records(0);
 
-	if (psi->flags & PSTORE_FLAGS_DMESG)
+	if (psi->flags & PSTORE_FLAGS_DMESG) {
+		pstore_dumper.max_reason = psinfo->max_reason;
 		pstore_register_kmsg();
+	}
 	if (psi->flags & PSTORE_FLAGS_CONSOLE)
 		pstore_register_console();
 	if (psi->flags & PSTORE_FLAGS_FTRACE)
diff --git a/include/linux/pstore.h b/include/linux/pstore.h
index f6f22b13e04f..eb93a54cff31 100644
--- a/include/linux/pstore.h
+++ b/include/linux/pstore.h
@@ -96,6 +96,12 @@ struct pstore_record {
  *
  * @read_mutex:	serializes @open, @read, @close, and @erase callbacks
  * @flags:	bitfield of frontends the backend can accept writes for
+ * @max_reason:	Used when PSTORE_FLAGS_DMESG is set. Contains the
+ *		kmsg_dump_reason enum value. KMSG_DUMP_UNDEF means
+ *		"use existing kmsg_dump() filtering, based on the
+ *		printk.always_kmsg_dump boot param" (which is either
+ *		KMSG_DUMP_OOPS when false, or KMSG_DUMP_MAX when
+ *		true); see printk.always_kmsg_dump for more details.
  * @data:	backend-private pointer passed back during callbacks
  *
  * Callbacks:
@@ -179,6 +185,7 @@ struct pstore_info {
 	struct mutex	read_mutex;
 
 	int		flags;
+	int		max_reason;
 	void		*data;
 
 	int		(*open)(struct pstore_info *psi);
-- 
2.20.1


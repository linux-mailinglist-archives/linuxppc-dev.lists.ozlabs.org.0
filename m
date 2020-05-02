Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A621C24C7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:39:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnGK57rtzDqSV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:39:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OmHYqsOi; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmqf0Lh9zDr7D
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:19:57 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id v63so2879036pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IQkeNeEnXCNQTTGVgT0Jtti91/uShgLOHBav68NJGnM=;
 b=OmHYqsOill6Zx1icteljeSlQBDLzvVx9hGVOk0t3qjRHLudqaAKYde4FLrR8RuOKnr
 yLTTgh0uyb0abpc9pbtCmqrr8kPRWKyY8pj6cAQ6cC8fI/+ImLolLwK5/QtyjJKq81mv
 kf43N9RoMuqaiqaqqcg3TBIOOfBMqclSywLUE3sggh46CRwEYz/vrPJ0DNsdbHwNLTRw
 riYnL+6FutcS9SVKge2zJaIQW98OKeX/nFSpMI65MNMeaMeYfo9MvmjmohVfbhVa8UqC
 KMBDJ4/oG7P27DvPsciiVP+Ax8dVMRIei10EYHXSMWatTrNTN/gpXjyeFC+JsQ3xrX2v
 wjbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IQkeNeEnXCNQTTGVgT0Jtti91/uShgLOHBav68NJGnM=;
 b=YSise/TCK6oZTdtbFkgBhp2y9T2kiZNzkrIkK3xDZLyZhGlvIWuNHfSBNIBgRW/dGL
 e6nLXpMGSDTbL7JgbxiwySYo8i8ELORrCOu09p+uNveAUhfjTbIQNjMK6tGD359B+RQs
 Be2D/Te9oqJlOVWaHAJcw0F9HOYEwyYYCBEBWuiroYxsWoYLPFSZbhGYZ3YbkM9575Wr
 i4mhznGO4FL5Q0QBxXl6lQrl1XisUbc7esX5nz9ardHXfQqCE+KDQWdZTnFhkqHkjzhF
 YXILOLXjDBzJG5C/KG8qmmKNFZr/0Y49mVqmkq6gXFKKkKGwnp8pbEyBKkEsplWus3jq
 +V/Q==
X-Gm-Message-State: AGi0PuYkL0rVn75nV+tgBa5jpVdotzhdoZaOhB1g7cEcxMuKZvgZufcG
 fXkKRBwDdnMjU+S9YQo3yFnNMZjW
X-Google-Smtp-Source: APiQypI1Wrvod1HOHTukTrZMCkn5QvEw1vJZhb9x+8lfobUcmlMGBC5mlVgmQ2hJq6RCr3KSEG8rIQ==
X-Received: by 2002:a63:d30b:: with SMTP id b11mr8068320pgg.230.1588418393679; 
 Sat, 02 May 2020 04:19:53 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.19.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:19:53 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 01/10] kallsyms: architecture specific symbol lookups
Date: Sat,  2 May 2020 21:19:05 +1000
Message-Id: <20200502111914.166578-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200502111914.166578-1-npiggin@gmail.com>
References: <20200502111914.166578-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Provide CONFIG_ARCH_HAS_SYMBOL_LOOKUP which allows architectures to
do their own symbol/address lookup if kernel and module lookups miss.

powerpc will use this to deal with firmware symbols.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 include/linux/kallsyms.h | 20 ++++++++++++++++++++
 kernel/kallsyms.c        | 13 ++++++++++++-
 lib/Kconfig              |  3 +++
 3 files changed, 35 insertions(+), 1 deletion(-)

diff --git a/include/linux/kallsyms.h b/include/linux/kallsyms.h
index 657a83b943f0..e17c1e7c01c0 100644
--- a/include/linux/kallsyms.h
+++ b/include/linux/kallsyms.h
@@ -83,6 +83,26 @@ extern int kallsyms_lookup_size_offset(unsigned long addr,
 				  unsigned long *symbolsize,
 				  unsigned long *offset);
 
+#ifdef CONFIG_ARCH_HAS_SYMBOL_LOOKUP
+const char *arch_symbol_lookup_address(unsigned long addr,
+			    unsigned long *symbolsize,
+			    unsigned long *offset,
+			    char **modname, char *namebuf);
+unsigned long arch_symbol_lookup_name(const char *name);
+#else
+static inline const char *arch_symbol_lookup_address(unsigned long addr,
+			    unsigned long *symbolsize,
+			    unsigned long *offset,
+			    char **modname, char *namebuf)
+{
+	return NULL;
+}
+static inline unsigned long arch_symbol_lookup_name(const char *name)
+{
+	return 0;
+}
+#endif
+
 /* Lookup an address.  modname is set to NULL if it's in the kernel. */
 const char *kallsyms_lookup(unsigned long addr,
 			    unsigned long *symbolsize,
diff --git a/kernel/kallsyms.c b/kernel/kallsyms.c
index 16c8c605f4b0..1e403e616126 100644
--- a/kernel/kallsyms.c
+++ b/kernel/kallsyms.c
@@ -164,6 +164,7 @@ static unsigned long kallsyms_sym_address(int idx)
 unsigned long kallsyms_lookup_name(const char *name)
 {
 	char namebuf[KSYM_NAME_LEN];
+	unsigned long ret;
 	unsigned long i;
 	unsigned int off;
 
@@ -173,7 +174,12 @@ unsigned long kallsyms_lookup_name(const char *name)
 		if (strcmp(namebuf, name) == 0)
 			return kallsyms_sym_address(i);
 	}
-	return module_kallsyms_lookup_name(name);
+
+	ret = module_kallsyms_lookup_name(name);
+	if (ret)
+		return ret;
+
+	return arch_symbol_lookup_name(name);
 }
 
 int kallsyms_on_each_symbol(int (*fn)(void *, const char *, struct module *,
@@ -309,6 +315,11 @@ const char *kallsyms_lookup(unsigned long addr,
 	if (!ret)
 		ret = ftrace_mod_address_lookup(addr, symbolsize,
 						offset, modname, namebuf);
+
+	if (!ret)
+		ret = arch_symbol_lookup_address(addr, symbolsize,
+						offset, modname, namebuf);
+
 	return ret;
 }
 
diff --git a/lib/Kconfig b/lib/Kconfig
index 5d53f9609c25..9f86f649a712 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -80,6 +80,9 @@ config ARCH_USE_CMPXCHG_LOCKREF
 config ARCH_HAS_FAST_MULTIPLIER
 	bool
 
+config ARCH_HAS_SYMBOL_LOOKUP
+	bool
+
 config INDIRECT_PIO
 	bool "Access I/O in non-MMIO mode"
 	depends on ARM64
-- 
2.23.0


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 33777172F2C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:10:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TF0H10KfzDrCX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 14:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ARHkIbbv; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TDyN3fWrzDqnW;
 Fri, 28 Feb 2020 14:08:44 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id j15so734966pgm.6;
 Thu, 27 Feb 2020 19:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S6rVYewWfV0+gGm3/xioJyR5LXV7Vr3o8UEcISpDcq0=;
 b=ARHkIbbvTlOZXfnU51D10VkcxywRfrfpa5tF+DHPzRPwkOaUCxas/Kvae1ZJi9xvAj
 7YzXAqdqkvMgDd2hmLhNjDYB8xCx10dJr8hHkU0pZcucvqJZEskGgr/PBo/zOVJ+KWcy
 mW1oeBlAooVGpQ/jX1UTm/vEqIEnqGIXx0fPvm7mJSTiO41ZuTWDLtql1OCEkr4ZwQAq
 TR/vR2pBd5TLePOwps2Ffmjf9NfHpDYKEeXBD1IdQWqKE8G2MklaPvvT8EXX6rsQZO3r
 83cPQbddq0pulCSxaFTcs+SHJcoeQ+glE8xgln9c2B+qFwTd/DkngC2Z6ZXq343Pg890
 hFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S6rVYewWfV0+gGm3/xioJyR5LXV7Vr3o8UEcISpDcq0=;
 b=AvpvRTVUDAwdsoQrwlPT34secnLvvvlaOHYcF9YIIGtB3cxdPOFRLWIjuhKO/jAj2Y
 acpOlqjgiZbuse8Mkt0pFUKMrGiudZdRFlRNGj7ZO1FkFFVRvK/hrL/+Cu0+uIo3mvkB
 L/QTN3lEEsXCLygGZsl3POkKgrklmsbqV+YudkL7GD1RmJFJ++WDXlThXXtjYG4z/57N
 OeKxBb8QfXQ4Wd3bEFEgGH+hCUF/hprblxMQxiO2xypZmEDUqOym/BqskeSA6zOkddhX
 bwCe9eHcH/ZlEJ1bRkgx1rKbJouEz7iYgR/qmiq43X+o9kQcFDbRlzm5FZzfEey/lhUB
 8J4g==
X-Gm-Message-State: APjAAAVy33WIzaBWdk8QuIt0KQWHVRkiUNfb6Nk0OqdLn7TEBPhDMuxX
 ImskMb3wSamqbTFJSksZMMkuEoB6
X-Google-Smtp-Source: APXvYqwc30yxOJYWs2ICSaWn4CRLKitaF2L8oxXHjA6wUwDBnuSgQItlutilH00RWaDY1IamATMCMA==
X-Received: by 2002:a62:1883:: with SMTP id 125mr2208980pfy.166.1582859321623; 
 Thu, 27 Feb 2020 19:08:41 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-109-34.tpgi.com.au.
 [193.116.109.34])
 by smtp.gmail.com with ESMTPSA id iq22sm99077pjb.9.2020.02.27.19.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 19:08:41 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: skiboot@lists.ozlabs.org
Subject: [PATCH] Add OPAL_GET_SYMBOL / OPAL_LOOKUP_SYMBOL
Date: Fri, 28 Feb 2020 13:07:51 +1000
Message-Id: <20200228030751.271382-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These calls can be used by Linux to annotate BUG addresses with symbols,
look up symbol addresses in xmon, etc.

This is preferable over having Linux parse the OPAL symbol map itself,
because OPAL's parsing code already exists for its own symbol printing,
and it can support other code regions than the skiboot symbols, e.g.,
the wake-up code in the HOMER (where CPUs have been seen to get stuck).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 core/opal.c                             |  2 +
 core/utils.c                            | 92 +++++++++++++++++++++++--
 doc/opal-api/opal-get-symbol-181.rst    | 42 +++++++++++
 doc/opal-api/opal-lookup-symbol-182.rst | 35 ++++++++++
 include/opal-api.h                      |  4 +-
 5 files changed, 168 insertions(+), 7 deletions(-)
 create mode 100644 doc/opal-api/opal-get-symbol-181.rst
 create mode 100644 doc/opal-api/opal-lookup-symbol-182.rst

diff --git a/core/opal.c b/core/opal.c
index d6ff6027b..d9fc4fe05 100644
--- a/core/opal.c
+++ b/core/opal.c
@@ -142,6 +142,8 @@ int64_t opal_entry_check(struct stack_frame *eframe)
 		case OPAL_CEC_REBOOT:
 		case OPAL_CEC_REBOOT2:
 		case OPAL_SIGNAL_SYSTEM_RESET:
+		case OPAL_GET_SYMBOL:
+		case OPAL_LOOKUP_SYMBOL:
 			break;
 		default:
 			printf("CPU ATTEMPT TO RE-ENTER FIRMWARE! PIR=%04lx cpu @%p -> pir=%04x token=%llu\n",
diff --git a/core/utils.c b/core/utils.c
index 8fd63fcb7..5f0d5130b 100644
--- a/core/utils.c
+++ b/core/utils.c
@@ -48,40 +48,120 @@ char __attrconst tohex(uint8_t nibble)
 	return __tohex[nibble];
 }
 
-static unsigned long get_symbol(unsigned long addr, char **sym, char **sym_end)
+static unsigned long get_symbol(unsigned long addr, char **sym, char **sym_end, unsigned long *size)
 {
 	unsigned long prev = 0, next;
 	char *psym = NULL, *p = __sym_map_start;
 
 	*sym = *sym_end = NULL;
-	while(p < __sym_map_end) {
+	while (p < __sym_map_end) {
 		next = strtoul(p, &p, 16) | SKIBOOT_BASE;
 		if (next > addr && prev <= addr) {
-			p = psym + 3;;
+			p = psym + 3;
 			if (p >= __sym_map_end)
 				return 0;
 			*sym = p;
-			while(p < __sym_map_end && *p != 10)
+			while (p < __sym_map_end && *p != '\n')
 				p++;
 			*sym_end = p;
+			*size = next - prev;
 			return prev;
 		}
 		prev = next;
 		psym = p;
-		while(p < __sym_map_end && *p != 10)
+		while (p < __sym_map_end && *p != '\n')
 			p++;
 		p++;
 	}
 	return 0;
 }
 
+static unsigned long lookup_symbol(const char *name, unsigned long *size)
+{
+	size_t len = strlen(name);
+	unsigned long addr = 0;
+	char *sym;
+	char *p = __sym_map_start;
+
+	while (p < __sym_map_end) {
+		addr = strtoul(p, &p, 16) | SKIBOOT_BASE;
+		p += 3;
+		if (p >= __sym_map_end)
+			return 0;
+
+		if (*(p + len) == '\n' && !strncmp(name, p, len)) {
+			char *sym_end;
+
+			if (get_symbol(addr, &sym, &sym_end, size) == 0) {
+				assert(!strcmp(name, "_end"));
+				*size = 0;
+			}
+
+			/*
+			 * May be more than one symbol at this address but
+			 * symbol length calculation should still work in
+			 * that case.
+			 */
+
+			return addr;
+		}
+
+		while(p < __sym_map_end && *p != '\n')
+			p++;
+		p++;
+	}
+	return 0;
+}
+
+static int64_t opal_get_symbol(uint64_t addr, __be64 *symaddr, __be64 *symsize, char *namebuf, uint64_t buflen)
+{
+	unsigned long saddr;
+	unsigned long ssize;
+	char *sym, *sym_end;
+	size_t l;
+
+	saddr = get_symbol(addr, &sym, &sym_end, &ssize);
+	if (!saddr)
+		return OPAL_RESOURCE;
+
+	if (buflen > sym_end - sym)
+		l = sym_end - sym;
+	else
+		l = buflen - 1;
+	memcpy(namebuf, sym, l);
+	namebuf[l] = '\0';
+
+	*symaddr = cpu_to_be64(saddr);
+	*symsize = cpu_to_be64(ssize);
+
+	return OPAL_SUCCESS;
+}
+opal_call(OPAL_GET_SYMBOL, opal_get_symbol, 5);
+
+static int64_t opal_lookup_symbol(const char *name, __be64 *symaddr, __be64 *symsize)
+{
+	unsigned long saddr;
+	unsigned long ssize;
+
+	saddr = lookup_symbol(name, &ssize);
+	if (!saddr)
+		return OPAL_RESOURCE;
+
+	*symaddr = cpu_to_be64(saddr);
+	*symsize = cpu_to_be64(ssize);
+
+	return OPAL_SUCCESS;
+}
+opal_call(OPAL_LOOKUP_SYMBOL, opal_lookup_symbol, 3);
+
 size_t snprintf_symbol(char *buf, size_t len, uint64_t addr)
 {
 	unsigned long saddr;
+	unsigned long ssize;
 	char *sym, *sym_end;
 	size_t l;
 
-	saddr = get_symbol(addr, &sym, &sym_end);
+	saddr = get_symbol(addr, &sym, &sym_end, &ssize);
 	if (!saddr)
 		return 0;
 
diff --git a/doc/opal-api/opal-get-symbol-181.rst b/doc/opal-api/opal-get-symbol-181.rst
new file mode 100644
index 000000000..a57de6c1c
--- /dev/null
+++ b/doc/opal-api/opal-get-symbol-181.rst
@@ -0,0 +1,42 @@
+.. _OPAL_GET_SYMBOL:
+
+OPAL_GET_SYMBOL
+================
+
+.. code-block:: c
+
+   #define OPAL_GET_SYMBOL			181
+
+   static int64_t opal_get_symbol(uint64_t addr, __be64 *symaddr, __be64 *symsize, char *namebuf, uint64_t buflen);
+
+This OPAL call looks up a firmware code address for symbol information.
+
+Arguments
+---------
+
+  ``addr``
+    Contains address to be looked up.
+
+  ``symaddr``
+    Returns the start address of the symbol for the object which
+    contains addr or immediately precedes addr.
+
+  ``symsize``
+    Returns the size of the object, or the number of bytes until the
+    next symbol.
+
+  ``namebuf``
+    Contains a buffer for the symbol name to be copied into, as a NUL
+    terminated string.
+
+  ``buflen``
+    Contains the length of the bufer that may be used.
+
+
+Returns
+-------
+
+:ref:`OPAL_SUCCESS`
+  Found a symbol.
+:ref:`OPAL_RESOURCE`
+  Did not find a symbol.
diff --git a/doc/opal-api/opal-lookup-symbol-182.rst b/doc/opal-api/opal-lookup-symbol-182.rst
new file mode 100644
index 000000000..e9f6eba33
--- /dev/null
+++ b/doc/opal-api/opal-lookup-symbol-182.rst
@@ -0,0 +1,35 @@
+.. _OPAL_LOOKUP_SYMBOL:
+
+OPAL_LOOKUP_SYMBOL
+================
+
+.. code-block:: c
+
+   #define OPAL_LOOKUP_SYMBOL			182
+
+   static int64_t opal_lookup_symbol(const char *name, __be64 *symaddr, __be64 *symsize);
+
+This OPAL call looks up a firmware symbol name for its address.
+
+Arguments
+---------
+
+  ``name``
+    Contains a pointer to NUL terminated symbol name to be looked up.
+
+  ``symaddr``
+    Returns the start address of the symbol for the object which
+    contains addr or immediately precedes addr.
+
+  ``symsize``
+    Returns the size of the object, or the number of bytes until the
+    next symbol.
+
+
+Returns
+-------
+
+:ref:`OPAL_SUCCESS`
+  Found a symbol.
+:ref:`OPAL_RESOURCE`
+  Did not find a symbol.
diff --git a/include/opal-api.h b/include/opal-api.h
index 5b07dea13..4474631a6 100644
--- a/include/opal-api.h
+++ b/include/opal-api.h
@@ -227,7 +227,9 @@
 #define OPAL_SECVAR_ENQUEUE_UPDATE		178
 #define OPAL_PHB_SET_OPTION			179
 #define OPAL_PHB_GET_OPTION			180
-#define OPAL_LAST				180
+#define OPAL_GET_SYMBOL				181
+#define OPAL_LOOKUP_SYMBOL			182
+#define OPAL_LAST				182
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
-- 
2.23.0


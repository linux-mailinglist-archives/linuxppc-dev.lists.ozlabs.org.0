Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 804C71D41E0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 01:56:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49NT2C37s5zDqv9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 May 2020 09:55:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f43;
 helo=mail-qv1-xf43.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Jh/+EqQj; dkim-atps=neutral
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com
 [IPv6:2607:f8b0:4864:20::f43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49NSyB758SzDqs3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 May 2020 09:52:18 +1000 (AEST)
Received: by mail-qv1-xf43.google.com with SMTP id d1so228412qvl.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 May 2020 16:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1M7pUn0rkqc7ZsQoZUKloLq7Q6JRk8mWdAedCgZjaZs=;
 b=Jh/+EqQjndlD4XKkYssfR1khmnWT25Yr1FuUBLcAhRMPnEEZK+hEpeza+CSxyRwacm
 c61Y6aRAsjJHpIBIU5idOvCjBLm84EAT/h0n+ibCDJpzsDTnKg5qBvyZ0msOoSSov+vs
 n521ElZFYl5frphGjWry2OaVghKgpSZO0GFLAJjTj3lBOl5JXUiCMMlY6hftAf2/z3pu
 tN7MV6M3j/7VJg7ZzYlPUNyVEnLrY+sEyQRGhINOPOa1rNSOv1C1Bl5X/zyssoFebHoe
 3bjJvKN6tY4TStsxetDLvuiej0qZtoociGwPsxVN0pmvA3KKLA3KI13aXdlnvW8o5s3o
 hF9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1M7pUn0rkqc7ZsQoZUKloLq7Q6JRk8mWdAedCgZjaZs=;
 b=pFw/Q8bVIuidLt1Wba6iL0BM/bj9TEbvnNnXxPg/L0WD3x3AWcM08Jh59OEWONNh/Z
 iHptssduEPPDITAfvwwp+h4zIfnR2y5/HUkdwG1sUHgvZ7bfcXTXxf9RTLWhuIROg7nN
 yCdU7JoDpMxDw18VhroTFZqGHLRIAeOAOSIjSGxIWfjS0yxHIzaSNjqzaDYbFrlHfzm3
 VkxO+kxB/U9QD8hUf+3XjeL04RDRFTOf/TCvzRfVLGC959Ga/DMMa0o7rEdPtKmRXw9G
 WPhkPghG8zBdmvODB4dnonEaJeMohPKGUY3GiK+bz5bpeGBqmHxtfJy3svUoBSScnXRK
 FLuw==
X-Gm-Message-State: AOAM530T7mP1Ur9pQPrgmixrr8zJZg/BWSYpny5Jko77JyWWOmWAHUFm
 O4hVsslI4RUvETFAF6X94dg=
X-Google-Smtp-Source: ABdhPJzVsG5rikUeN0EvuE7mncy00DwSQ4n47XtHXfyuPFXb6XYhaK5sK/CMG7Onc6RbWMp55lLN6w==
X-Received: by 2002:a0c:e4d4:: with SMTP id g20mr940715qvm.228.1589500336113; 
 Thu, 14 May 2020 16:52:16 -0700 (PDT)
Received: from LeoBras.aus.stglabs.ibm.com
 (179-125-143-209.dynamic.desktop.com.br. [179.125.143.209])
 by smtp.gmail.com with ESMTPSA id j45sm644279qtk.14.2020.05.14.16.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2020 16:52:15 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Leonardo Bras <leobras.c@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 Allison Randal <allison@lohutok.net>, Nicholas Piggin <npiggin@gmail.com>,
 Nathan Lynch <nathanl@linux.ibm.com>,
 "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>, Nadav Amit <namit@vmware.com>
Subject: [PATCH v4 1/2] powerpc/rtas: Move type/struct definitions from rtas.h
 into rtas-types.h
Date: Thu, 14 May 2020 20:51:37 -0300
Message-Id: <20200514235138.150722-2-leobras.c@gmail.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20200514235138.150722-1-leobras.c@gmail.com>
References: <20200514235138.150722-1-leobras.c@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In order to get any rtas* struct into other headers, including rtas.h
may cause a lot of errors, regarding include dependency needed for
inline functions.

Create rtas-types.h and move there all type/struct definitions
from rtas.h, then include rtas-types.h into rtas.h.

Also, as suggested by checkpath.pl, replace uint8_t for u8, and keep
the same type pattern for the whole file, as they are the same
according to powerpc/boot/types.h.

Signed-off-by: Leonardo Bras <leobras.c@gmail.com>
---
 arch/powerpc/include/asm/rtas-types.h | 126 ++++++++++++++++++++++++++
 arch/powerpc/include/asm/rtas.h       | 118 +-----------------------
 2 files changed, 127 insertions(+), 117 deletions(-)
 create mode 100644 arch/powerpc/include/asm/rtas-types.h

diff --git a/arch/powerpc/include/asm/rtas-types.h b/arch/powerpc/include/asm/rtas-types.h
new file mode 100644
index 000000000000..87354e28f160
--- /dev/null
+++ b/arch/powerpc/include/asm/rtas-types.h
@@ -0,0 +1,126 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+#ifndef _POWERPC_RTAS_TYPES_H
+#define _POWERPC_RTAS_TYPES_H
+#ifdef __KERNEL__
+
+#include <linux/spinlock_types.h>
+
+typedef __be32 rtas_arg_t;
+
+struct rtas_args {
+	__be32 token;
+	__be32 nargs;
+	__be32 nret;
+	rtas_arg_t args[16];
+	rtas_arg_t *rets;     /* Pointer to return values in args[]. */
+};
+
+struct rtas_t {
+	unsigned long entry;		/* physical address pointer */
+	unsigned long base;		/* physical address pointer */
+	unsigned long size;
+	arch_spinlock_t lock;
+	struct rtas_args args;
+	struct device_node *dev;	/* virtual address pointer */
+};
+
+struct rtas_suspend_me_data {
+	atomic_t working; /* number of cpus accessing this struct */
+	atomic_t done;
+	int token; /* ibm,suspend-me */
+	atomic_t error;
+	struct completion *complete; /* wait on this until working == 0 */
+};
+
+struct rtas_error_log {
+	/* Byte 0 */
+	u8		byte0;			/* Architectural version */
+
+	/* Byte 1 */
+	u8		byte1;
+	/* XXXXXXXX
+	 * XXX		3: Severity level of error
+	 *    XX	2: Degree of recovery
+	 *      X	1: Extended log present?
+	 *       XX	2: Reserved
+	 */
+
+	/* Byte 2 */
+	u8		byte2;
+	/* XXXXXXXX
+	 * XXXX		4: Initiator of event
+	 *     XXXX	4: Target of failed operation
+	 */
+	u8		byte3;			/* General event or error*/
+	__be32		extended_log_length;	/* length in bytes */
+	unsigned char	buffer[1];		/* Start of extended log */
+						/* Variable length.      */
+};
+
+/* RTAS general extended event log, Version 6. The extended log starts
+ * from "buffer" field of struct rtas_error_log defined above.
+ */
+struct rtas_ext_event_log_v6 {
+	/* Byte 0 */
+	u8 byte0;
+	/* XXXXXXXX
+	 * X		1: Log valid
+	 *  X		1: Unrecoverable error
+	 *   X		1: Recoverable (correctable or successfully retried)
+	 *    X		1: Bypassed unrecoverable error (degraded operation)
+	 *     X	1: Predictive error
+	 *      X	1: "New" log (always 1 for data returned from RTAS)
+	 *       X	1: Big Endian
+	 *        X	1: Reserved
+	 */
+
+	/* Byte 1 */
+	u8 byte1;			/* reserved */
+
+	/* Byte 2 */
+	u8 byte2;
+	/* XXXXXXXX
+	 * X		1: Set to 1 (indicating log is in PowerPC format)
+	 *  XXX		3: Reserved
+	 *     XXXX	4: Log format used for bytes 12-2047
+	 */
+
+	/* Byte 3 */
+	u8 byte3;			/* reserved */
+	/* Byte 4-11 */
+	u8 reserved[8];			/* reserved */
+	/* Byte 12-15 */
+	__be32  company_id;		/* Company ID of the company	*/
+					/* that defines the format for	*/
+					/* the vendor specific log type	*/
+	/* Byte 16-end of log */
+	u8 vendor_log[1];		/* Start of vendor specific log	*/
+					/* Variable length.		*/
+};
+
+/* Vendor specific Platform Event Log Format, Version 6, section header */
+struct pseries_errorlog {
+	__be16 id;			/* 0x00 2-byte ASCII section ID	*/
+	__be16 length;			/* 0x02 Section length in bytes	*/
+	u8 version;			/* 0x04 Section version		*/
+	u8 subtype;			/* 0x05 Section subtype		*/
+	__be16 creator_component;	/* 0x06 Creator component ID	*/
+	u8 data[];			/* 0x08 Start of section data	*/
+};
+
+/* RTAS pseries hotplug errorlog section */
+struct pseries_hp_errorlog {
+	u8	resource;
+	u8	action;
+	u8	id_type;
+	u8	reserved;
+	union {
+		__be32	drc_index;
+		__be32	drc_count;
+		struct { __be32 count, index; } ic;
+		char	drc_name[1];
+	} _drc_u;
+};
+
+#endif /* __KERNEL__ */
+#endif /* _POWERPC_RTAS_TYPES_H */
diff --git a/arch/powerpc/include/asm/rtas.h b/arch/powerpc/include/asm/rtas.h
index 3c1887351c71..c35c5350b7e4 100644
--- a/arch/powerpc/include/asm/rtas.h
+++ b/arch/powerpc/include/asm/rtas.h
@@ -5,6 +5,7 @@
 
 #include <linux/spinlock.h>
 #include <asm/page.h>
+#include <asm/rtas-types.h>
 #include <linux/time.h>
 #include <linux/cpumask.h>
 
@@ -42,33 +43,6 @@
  *
  */
 
-typedef __be32 rtas_arg_t;
-
-struct rtas_args {
-	__be32 token;
-	__be32 nargs;
-	__be32 nret; 
-	rtas_arg_t args[16];
-	rtas_arg_t *rets;     /* Pointer to return values in args[]. */
-};  
-
-struct rtas_t {
-	unsigned long entry;		/* physical address pointer */
-	unsigned long base;		/* physical address pointer */
-	unsigned long size;
-	arch_spinlock_t lock;
-	struct rtas_args args;
-	struct device_node *dev;	/* virtual address pointer */
-};
-
-struct rtas_suspend_me_data {
-	atomic_t working; /* number of cpus accessing this struct */
-	atomic_t done;
-	int token; /* ibm,suspend-me */
-	atomic_t error;
-	struct completion *complete; /* wait on this until working == 0 */
-};
-
 /* RTAS event classes */
 #define RTAS_INTERNAL_ERROR		0x80000000 /* set bit 0 */
 #define RTAS_EPOW_WARNING		0x40000000 /* set bit 1 */
@@ -148,31 +122,6 @@ struct rtas_suspend_me_data {
 /* RTAS check-exception vector offset */
 #define RTAS_VECTOR_EXTERNAL_INTERRUPT	0x500
 
-struct rtas_error_log {
-	/* Byte 0 */
-	uint8_t		byte0;			/* Architectural version */
-
-	/* Byte 1 */
-	uint8_t		byte1;
-	/* XXXXXXXX
-	 * XXX		3: Severity level of error
-	 *    XX	2: Degree of recovery
-	 *      X	1: Extended log present?
-	 *       XX	2: Reserved
-	 */
-
-	/* Byte 2 */
-	uint8_t		byte2;
-	/* XXXXXXXX
-	 * XXXX		4: Initiator of event
-	 *     XXXX	4: Target of failed operation
-	 */
-	uint8_t		byte3;			/* General event or error*/
-	__be32		extended_log_length;	/* length in bytes */
-	unsigned char	buffer[1];		/* Start of extended log */
-						/* Variable length.      */
-};
-
 static inline uint8_t rtas_error_severity(const struct rtas_error_log *elog)
 {
 	return (elog->byte1 & 0xE0) >> 5;
@@ -212,47 +161,6 @@ uint32_t rtas_error_extended_log_length(const struct rtas_error_log *elog)
 
 #define RTAS_V6EXT_COMPANY_ID_IBM	(('I' << 24) | ('B' << 16) | ('M' << 8))
 
-/* RTAS general extended event log, Version 6. The extended log starts
- * from "buffer" field of struct rtas_error_log defined above.
- */
-struct rtas_ext_event_log_v6 {
-	/* Byte 0 */
-	uint8_t byte0;
-	/* XXXXXXXX
-	 * X		1: Log valid
-	 *  X		1: Unrecoverable error
-	 *   X		1: Recoverable (correctable or successfully retried)
-	 *    X		1: Bypassed unrecoverable error (degraded operation)
-	 *     X	1: Predictive error
-	 *      X	1: "New" log (always 1 for data returned from RTAS)
-	 *       X	1: Big Endian
-	 *        X	1: Reserved
-	 */
-
-	/* Byte 1 */
-	uint8_t byte1;			/* reserved */
-
-	/* Byte 2 */
-	uint8_t byte2;
-	/* XXXXXXXX
-	 * X		1: Set to 1 (indicating log is in PowerPC format)
-	 *  XXX		3: Reserved
-	 *     XXXX	4: Log format used for bytes 12-2047
-	 */
-
-	/* Byte 3 */
-	uint8_t byte3;			/* reserved */
-	/* Byte 4-11 */
-	uint8_t reserved[8];		/* reserved */
-	/* Byte 12-15 */
-	__be32  company_id;		/* Company ID of the company	*/
-					/* that defines the format for	*/
-					/* the vendor specific log type	*/
-	/* Byte 16-end of log */
-	uint8_t vendor_log[1];		/* Start of vendor specific log	*/
-					/* Variable length.		*/
-};
-
 static
 inline uint8_t rtas_ext_event_log_format(struct rtas_ext_event_log_v6 *ext_log)
 {
@@ -287,16 +195,6 @@ inline uint32_t rtas_ext_event_company_id(struct rtas_ext_event_log_v6 *ext_log)
 #define PSERIES_ELOG_SECT_ID_HOTPLUG		(('H' << 8) | 'P')
 #define PSERIES_ELOG_SECT_ID_MCE		(('M' << 8) | 'C')
 
-/* Vendor specific Platform Event Log Format, Version 6, section header */
-struct pseries_errorlog {
-	__be16 id;			/* 0x00 2-byte ASCII section ID	*/
-	__be16 length;			/* 0x02 Section length in bytes	*/
-	uint8_t version;		/* 0x04 Section version		*/
-	uint8_t subtype;		/* 0x05 Section subtype		*/
-	__be16 creator_component;	/* 0x06 Creator component ID	*/
-	uint8_t data[];			/* 0x08 Start of section data	*/
-};
-
 static
 inline uint16_t pseries_errorlog_id(struct pseries_errorlog *sect)
 {
@@ -309,20 +207,6 @@ inline uint16_t pseries_errorlog_length(struct pseries_errorlog *sect)
 	return be16_to_cpu(sect->length);
 }
 
-/* RTAS pseries hotplug errorlog section */
-struct pseries_hp_errorlog {
-	u8	resource;
-	u8	action;
-	u8	id_type;
-	u8	reserved;
-	union {
-		__be32	drc_index;
-		__be32	drc_count;
-		struct { __be32 count, index; } ic;
-		char	drc_name[1];
-	} _drc_u;
-};
-
 #define PSERIES_HP_ELOG_RESOURCE_CPU	1
 #define PSERIES_HP_ELOG_RESOURCE_MEM	2
 #define PSERIES_HP_ELOG_RESOURCE_SLOT	3
-- 
2.25.4


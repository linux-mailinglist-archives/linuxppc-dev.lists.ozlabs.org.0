Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B3D36FFB7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 19:36:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX00335rlz3bVC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 03:36:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KsPrPE9I;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYKS+3MV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=rgb@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=KsPrPE9I; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=TYKS+3MV; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWzz55YNDz2xZ2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 03:35:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619804107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=080ZRzmQyMdpqhn7xyF9MpAEP0q2TUhJoOlSaWmhCKc=;
 b=KsPrPE9Ica8MMVn5X48veEgnXzCbeI3WDG3JVI9n1PnyyDNeCJU+QyjT98Pk7LRl50ANe5
 PKiZlkE+4nfNNBWYCX6KKK8McuBvzu+RZlYbEyLcf73tU69nvtBPulJWX9TQI7+1qrrjMh
 juddYrE/+N6c5XmBqxos2hge31Gwxss=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619804108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=080ZRzmQyMdpqhn7xyF9MpAEP0q2TUhJoOlSaWmhCKc=;
 b=TYKS+3MV5HZbuekSiqrMejoMyIcl4j6mt3uGQGjLElvpE19IhihC3nHCfV7hDqRPHB7eNx
 KW1qtmdJH6jGCnMQA2aPbuBa0QOnPRw/tHg/Lx1ReVcxg/rLac+EMAKYjgjxARWnBoWxgp
 jO9YL2PsfkKjncB1si3SRbxtEzjmqe4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-Kfe2qdBeMi-XtxnaRif7sg-1; Fri, 30 Apr 2021 13:35:04 -0400
X-MC-Unique: Kfe2qdBeMi-XtxnaRif7sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 48F53107ACE4;
 Fri, 30 Apr 2021 17:35:02 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.3.128.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 61F3D36DE;
 Fri, 30 Apr 2021 17:34:58 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 1/3] audit: replace magic audit syscall class numbers with
 macros
Date: Fri, 30 Apr 2021 13:29:35 -0400
Message-Id: <7d2bafdc928676cd6c3023cfce924b97715e8559.1619729297.git.rgb@redhat.com>
In-Reply-To: <cover.1619729297.git.rgb@redhat.com>
References: <cover.1619729297.git.rgb@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 Paul Moore <paul@paul-moore.com>, linux-parisc@vger.kernel.org,
 Richard Guy Briggs <rgb@redhat.com>, x86@kernel.org,
 Eric Paris <eparis@redhat.com>, Aleksa Sarai <cyphar@cyphar.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, Eric Paris <eparis@parisplace.org>,
 Steve Grubb <sgrubb@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace the magic numbers used to indicate audit syscall classes with macros.

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 arch/alpha/kernel/audit.c          |  8 ++++----
 arch/ia64/kernel/audit.c           |  8 ++++----
 arch/parisc/kernel/audit.c         |  8 ++++----
 arch/parisc/kernel/compat_audit.c  |  9 +++++----
 arch/powerpc/kernel/audit.c        | 10 +++++-----
 arch/powerpc/kernel/compat_audit.c | 11 ++++++-----
 arch/s390/kernel/audit.c           | 10 +++++-----
 arch/s390/kernel/compat_audit.c    | 11 ++++++-----
 arch/sparc/kernel/audit.c          | 10 +++++-----
 arch/sparc/kernel/compat_audit.c   | 11 ++++++-----
 arch/x86/ia32/audit.c              | 11 ++++++-----
 arch/x86/kernel/audit_64.c         |  8 ++++----
 include/linux/audit.h              |  1 +
 include/linux/auditscm.h           | 23 +++++++++++++++++++++++
 kernel/auditsc.c                   | 12 ++++++------
 lib/audit.c                        | 10 +++++-----
 lib/compat_audit.c                 | 11 ++++++-----
 17 files changed, 101 insertions(+), 71 deletions(-)
 create mode 100644 include/linux/auditscm.h

diff --git a/arch/alpha/kernel/audit.c b/arch/alpha/kernel/audit.c
index 96a9d18ff4c4..81cbd804e375 100644
--- a/arch/alpha/kernel/audit.c
+++ b/arch/alpha/kernel/audit.c
@@ -37,13 +37,13 @@ int audit_classify_syscall(int abi, unsigned syscall)
 {
 	switch(syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 0;
+		return AUDITSC_NATIVE;
 	}
 }
 
diff --git a/arch/ia64/kernel/audit.c b/arch/ia64/kernel/audit.c
index 5192ca899fe6..dba6a74c9ab3 100644
--- a/arch/ia64/kernel/audit.c
+++ b/arch/ia64/kernel/audit.c
@@ -38,13 +38,13 @@ int audit_classify_syscall(int abi, unsigned syscall)
 {
 	switch(syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 0;
+		return AUDITSC_NATIVE;
 	}
 }
 
diff --git a/arch/parisc/kernel/audit.c b/arch/parisc/kernel/audit.c
index 9eb47b2225d2..14244e83db75 100644
--- a/arch/parisc/kernel/audit.c
+++ b/arch/parisc/kernel/audit.c
@@ -47,13 +47,13 @@ int audit_classify_syscall(int abi, unsigned syscall)
 #endif
 	switch (syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 0;
+		return AUDITSC_NATIVE;
 	}
 }
 
diff --git a/arch/parisc/kernel/compat_audit.c b/arch/parisc/kernel/compat_audit.c
index 20c39c9d86a9..0c181bb39f34 100644
--- a/arch/parisc/kernel/compat_audit.c
+++ b/arch/parisc/kernel/compat_audit.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/auditscm.h>
 #include <asm/unistd.h>
 
 unsigned int parisc32_dir_class[] = {
@@ -30,12 +31,12 @@ int parisc32_classify_syscall(unsigned syscall)
 {
 	switch (syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 1;
+		return AUDITSC_COMPAT;
 	}
 }
diff --git a/arch/powerpc/kernel/audit.c b/arch/powerpc/kernel/audit.c
index a2dddd7f3d09..6eb18ef77dff 100644
--- a/arch/powerpc/kernel/audit.c
+++ b/arch/powerpc/kernel/audit.c
@@ -47,15 +47,15 @@ int audit_classify_syscall(int abi, unsigned syscall)
 #endif
 	switch(syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_socketcall:
-		return 4;
+		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 0;
+		return AUDITSC_NATIVE;
 	}
 }
 
diff --git a/arch/powerpc/kernel/compat_audit.c b/arch/powerpc/kernel/compat_audit.c
index 55c6ccda0a85..f250777f6365 100644
--- a/arch/powerpc/kernel/compat_audit.c
+++ b/arch/powerpc/kernel/compat_audit.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #undef __powerpc64__
+#include <linux/auditscm.h>
 #include <asm/unistd.h>
 
 unsigned ppc32_dir_class[] = {
@@ -31,14 +32,14 @@ int ppc32_classify_syscall(unsigned syscall)
 {
 	switch(syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_socketcall:
-		return 4;
+		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 1;
+		return AUDITSC_COMPAT;
 	}
 }
diff --git a/arch/s390/kernel/audit.c b/arch/s390/kernel/audit.c
index d395c6c9944c..7e331e1831d4 100644
--- a/arch/s390/kernel/audit.c
+++ b/arch/s390/kernel/audit.c
@@ -47,15 +47,15 @@ int audit_classify_syscall(int abi, unsigned syscall)
 #endif
 	switch(syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_socketcall:
-		return 4;
+		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 0;
+		return AUDITSC_NATIVE;
 	}
 }
 
diff --git a/arch/s390/kernel/compat_audit.c b/arch/s390/kernel/compat_audit.c
index 444fb1f66944..b2a2ed5d605a 100644
--- a/arch/s390/kernel/compat_audit.c
+++ b/arch/s390/kernel/compat_audit.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #undef __s390x__
+#include <linux/auditscm.h>
 #include <asm/unistd.h>
 #include "audit.h"
 
@@ -32,14 +33,14 @@ int s390_classify_syscall(unsigned syscall)
 {
 	switch(syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_socketcall:
-		return 4;
+		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 1;
+		return AUDITSC_COMPAT;
 	}
 }
diff --git a/arch/sparc/kernel/audit.c b/arch/sparc/kernel/audit.c
index a6e91bf34d48..50fab35bdaba 100644
--- a/arch/sparc/kernel/audit.c
+++ b/arch/sparc/kernel/audit.c
@@ -48,15 +48,15 @@ int audit_classify_syscall(int abi, unsigned int syscall)
 #endif
 	switch(syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_socketcall:
-		return 4;
+		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 0;
+		return AUDITSC_NATIVE;
 	}
 }
 
diff --git a/arch/sparc/kernel/compat_audit.c b/arch/sparc/kernel/compat_audit.c
index 10eeb4f15b20..fdf0d70b569b 100644
--- a/arch/sparc/kernel/compat_audit.c
+++ b/arch/sparc/kernel/compat_audit.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #define __32bit_syscall_numbers__
+#include <linux/auditscm.h>
 #include <asm/unistd.h>
 #include "kernel.h"
 
@@ -32,14 +33,14 @@ int sparc32_classify_syscall(unsigned int syscall)
 {
 	switch(syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_socketcall:
-		return 4;
+		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 1;
+		return AUDITSC_COMPAT;
 	}
 }
diff --git a/arch/x86/ia32/audit.c b/arch/x86/ia32/audit.c
index 6efe6cb3768a..d3dc8b57df81 100644
--- a/arch/x86/ia32/audit.c
+++ b/arch/x86/ia32/audit.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/auditscm.h>
 #include <asm/unistd_32.h>
 #include <asm/audit.h>
 
@@ -31,15 +32,15 @@ int ia32_classify_syscall(unsigned syscall)
 {
 	switch (syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_socketcall:
-		return 4;
+		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
 	case __NR_execveat:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 1;
+		return AUDITSC_COMPAT;
 	}
 }
diff --git a/arch/x86/kernel/audit_64.c b/arch/x86/kernel/audit_64.c
index 83d9cad4e68b..2a6cc9c9c881 100644
--- a/arch/x86/kernel/audit_64.c
+++ b/arch/x86/kernel/audit_64.c
@@ -47,14 +47,14 @@ int audit_classify_syscall(int abi, unsigned syscall)
 #endif
 	switch(syscall) {
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 	case __NR_execve:
 	case __NR_execveat:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 0;
+		return AUDITSC_NATIVE;
 	}
 }
 
diff --git a/include/linux/audit.h b/include/linux/audit.h
index 82b7c1116a85..1137df4d4171 100644
--- a/include/linux/audit.h
+++ b/include/linux/audit.h
@@ -11,6 +11,7 @@
 
 #include <linux/sched.h>
 #include <linux/ptrace.h>
+#include <linux/auditscm.h> /* syscall class macros */
 #include <uapi/linux/audit.h>
 #include <uapi/linux/netfilter/nf_tables.h>
 
diff --git a/include/linux/auditscm.h b/include/linux/auditscm.h
new file mode 100644
index 000000000000..1c4f0ead5931
--- /dev/null
+++ b/include/linux/auditscm.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/* auditscm.h -- Auditing support syscall macros
+ *
+ * Copyright 2021 Red Hat Inc., Durham, North Carolina.
+ * All Rights Reserved.
+ *
+ * Author: Richard Guy Briggs <rgb@redhat.com>
+ */
+#ifndef _LINUX_AUDITSCM_H_
+#define _LINUX_AUDITSCM_H_
+
+enum auditsc_class_t {
+	AUDITSC_NATIVE = 0,
+	AUDITSC_COMPAT,
+	AUDITSC_OPEN,
+	AUDITSC_OPENAT,
+	AUDITSC_SOCKETCALL,
+	AUDITSC_EXECVE,
+
+	AUDITSC_NVALS /* count */
+};
+
+#endif
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 8bb9ac84d2fb..8807afa6e237 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -165,7 +165,7 @@ static int audit_match_perm(struct audit_context *ctx, int mask)
 	n = ctx->major;
 
 	switch (audit_classify_syscall(ctx->arch, n)) {
-	case 0:	/* native */
+	case AUDITSC_NATIVE:
 		if ((mask & AUDIT_PERM_WRITE) &&
 		     audit_match_class(AUDIT_CLASS_WRITE, n))
 			return 1;
@@ -176,7 +176,7 @@ static int audit_match_perm(struct audit_context *ctx, int mask)
 		     audit_match_class(AUDIT_CLASS_CHATTR, n))
 			return 1;
 		return 0;
-	case 1: /* 32bit on biarch */
+	case AUDITSC_COMPAT: /* 32bit on biarch */
 		if ((mask & AUDIT_PERM_WRITE) &&
 		     audit_match_class(AUDIT_CLASS_WRITE_32, n))
 			return 1;
@@ -187,13 +187,13 @@ static int audit_match_perm(struct audit_context *ctx, int mask)
 		     audit_match_class(AUDIT_CLASS_CHATTR_32, n))
 			return 1;
 		return 0;
-	case 2: /* open */
+	case AUDITSC_OPEN:
 		return mask & ACC_MODE(ctx->argv[1]);
-	case 3: /* openat */
+	case AUDITSC_OPENAT:
 		return mask & ACC_MODE(ctx->argv[2]);
-	case 4: /* socketcall */
+	case AUDITSC_SOCKETCALL:
 		return ((mask & AUDIT_PERM_WRITE) && ctx->argv[0] == SYS_BIND);
-	case 5: /* execve */
+	case AUDITSC_EXECVE:
 		return mask & AUDIT_PERM_EXEC;
 	default:
 		return 0;
diff --git a/lib/audit.c b/lib/audit.c
index 5004bff928a7..3ec1a94d8d64 100644
--- a/lib/audit.c
+++ b/lib/audit.c
@@ -45,23 +45,23 @@ int audit_classify_syscall(int abi, unsigned syscall)
 	switch(syscall) {
 #ifdef __NR_open
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 #endif
 #ifdef __NR_openat
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 #endif
 #ifdef __NR_socketcall
 	case __NR_socketcall:
-		return 4;
+		return AUDITSC_SOCKETCALL;
 #endif
 #ifdef __NR_execveat
 	case __NR_execveat:
 #endif
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 0;
+		return AUDITSC_NATIVE;
 	}
 }
 
diff --git a/lib/compat_audit.c b/lib/compat_audit.c
index 77eabad69b4a..63125ad2edc0 100644
--- a/lib/compat_audit.c
+++ b/lib/compat_audit.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <linux/init.h>
 #include <linux/types.h>
+#include <linux/auditscm.h>
 #include <asm/unistd32.h>
 
 unsigned compat_dir_class[] = {
@@ -33,19 +34,19 @@ int audit_classify_compat_syscall(int abi, unsigned syscall)
 	switch (syscall) {
 #ifdef __NR_open
 	case __NR_open:
-		return 2;
+		return AUDITSC_OPEN;
 #endif
 #ifdef __NR_openat
 	case __NR_openat:
-		return 3;
+		return AUDITSC_OPENAT;
 #endif
 #ifdef __NR_socketcall
 	case __NR_socketcall:
-		return 4;
+		return AUDITSC_SOCKETCALL;
 #endif
 	case __NR_execve:
-		return 5;
+		return AUDITSC_EXECVE;
 	default:
-		return 1;
+		return AUDITSC_COMPAT;
 	}
 }
-- 
2.27.0


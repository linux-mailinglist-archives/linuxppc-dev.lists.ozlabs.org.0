Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05037023F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 22:38:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FX4212lz1z30DQ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 May 2021 06:38:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mr/OvA24;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mr/OvA24;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=rgb@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Mr/OvA24; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Mr/OvA24; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FX40X57PMz2yxk
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 May 2021 06:36:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619815001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88ObglMi23PFhsx5xuK+j7sB27VL+IqmOJ432hGAy4o=;
 b=Mr/OvA24tk8sa+X02QIEhyVGcEivq78XyFAh2oSAuy8FqISWSCXWgi/9qfrGI11ruL2fKN
 MZ0y0mb/NgjrnRqb0FsR5qJZLYyn1THdAWEZ4q/FC3a3g/iWXrkjbXzgH9B1XAm1npp2hE
 sU5PSnpJ/kUYzNcm6jYz60jPNnGpTcQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619815001;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88ObglMi23PFhsx5xuK+j7sB27VL+IqmOJ432hGAy4o=;
 b=Mr/OvA24tk8sa+X02QIEhyVGcEivq78XyFAh2oSAuy8FqISWSCXWgi/9qfrGI11ruL2fKN
 MZ0y0mb/NgjrnRqb0FsR5qJZLYyn1THdAWEZ4q/FC3a3g/iWXrkjbXzgH9B1XAm1npp2hE
 sU5PSnpJ/kUYzNcm6jYz60jPNnGpTcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-LbToS9TlOeqCAV1sGlyDkA-1; Fri, 30 Apr 2021 16:36:38 -0400
X-MC-Unique: LbToS9TlOeqCAV1sGlyDkA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 96090107ACE3;
 Fri, 30 Apr 2021 20:36:36 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.3.128.45])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE0F93807;
 Fri, 30 Apr 2021 20:36:32 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>, linux-fsdevel@vger.kernel.org
Subject: [PATCH v3 2/3] audit: add support for the openat2 syscall
Date: Fri, 30 Apr 2021 16:35:22 -0400
Message-Id: <29e7068e8121aee22bdd9f4c9a6d08a1762b20e9.1619811762.git.rgb@redhat.com>
In-Reply-To: <cover.1619811762.git.rgb@redhat.com>
References: <cover.1619811762.git.rgb@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
 Arnd Bergmann <arnd@kernel.org>, Richard Guy Briggs <rgb@redhat.com>,
 x86@kernel.org, Eric Paris <eparis@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org,
 Eric Paris <eparis@parisplace.org>, Steve Grubb <sgrubb@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The openat2(2) syscall was added in kernel v5.6 with commit fddb5d430ad9
("open: introduce openat2(2) syscall")

Add the openat2(2) syscall to the audit syscall classifier.

See the github issue
https://github.com/linux-audit/audit-kernel/issues/67

Signed-off-by: Richard Guy Briggs <rgb@redhat.com>
---
 arch/alpha/kernel/audit.c          | 2 ++
 arch/ia64/kernel/audit.c           | 2 ++
 arch/parisc/kernel/audit.c         | 2 ++
 arch/parisc/kernel/compat_audit.c  | 2 ++
 arch/powerpc/kernel/audit.c        | 2 ++
 arch/powerpc/kernel/compat_audit.c | 2 ++
 arch/s390/kernel/audit.c           | 2 ++
 arch/s390/kernel/compat_audit.c    | 2 ++
 arch/sparc/kernel/audit.c          | 2 ++
 arch/sparc/kernel/compat_audit.c   | 2 ++
 arch/x86/ia32/audit.c              | 2 ++
 arch/x86/kernel/audit_64.c         | 2 ++
 include/linux/auditscm.h           | 1 +
 kernel/auditsc.c                   | 3 +++
 lib/audit.c                        | 4 ++++
 lib/compat_audit.c                 | 4 ++++
 16 files changed, 36 insertions(+)

diff --git a/arch/alpha/kernel/audit.c b/arch/alpha/kernel/audit.c
index 81cbd804e375..3ab04709784a 100644
--- a/arch/alpha/kernel/audit.c
+++ b/arch/alpha/kernel/audit.c
@@ -42,6 +42,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return AUDITSC_OPENAT;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_NATIVE;
 	}
diff --git a/arch/ia64/kernel/audit.c b/arch/ia64/kernel/audit.c
index dba6a74c9ab3..ec61f20ca61f 100644
--- a/arch/ia64/kernel/audit.c
+++ b/arch/ia64/kernel/audit.c
@@ -43,6 +43,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return AUDITSC_OPENAT;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_NATIVE;
 	}
diff --git a/arch/parisc/kernel/audit.c b/arch/parisc/kernel/audit.c
index 14244e83db75..f420b5552140 100644
--- a/arch/parisc/kernel/audit.c
+++ b/arch/parisc/kernel/audit.c
@@ -52,6 +52,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return AUDITSC_OPENAT;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_NATIVE;
 	}
diff --git a/arch/parisc/kernel/compat_audit.c b/arch/parisc/kernel/compat_audit.c
index 0c181bb39f34..02cfd9d1ebeb 100644
--- a/arch/parisc/kernel/compat_audit.c
+++ b/arch/parisc/kernel/compat_audit.c
@@ -36,6 +36,8 @@ int parisc32_classify_syscall(unsigned syscall)
 		return AUDITSC_OPENAT;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_COMPAT;
 	}
diff --git a/arch/powerpc/kernel/audit.c b/arch/powerpc/kernel/audit.c
index 6eb18ef77dff..1bcfca5fdf67 100644
--- a/arch/powerpc/kernel/audit.c
+++ b/arch/powerpc/kernel/audit.c
@@ -54,6 +54,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_NATIVE;
 	}
diff --git a/arch/powerpc/kernel/compat_audit.c b/arch/powerpc/kernel/compat_audit.c
index f250777f6365..1fa0c902be8a 100644
--- a/arch/powerpc/kernel/compat_audit.c
+++ b/arch/powerpc/kernel/compat_audit.c
@@ -39,6 +39,8 @@ int ppc32_classify_syscall(unsigned syscall)
 		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_COMPAT;
 	}
diff --git a/arch/s390/kernel/audit.c b/arch/s390/kernel/audit.c
index 7e331e1831d4..02051a596b87 100644
--- a/arch/s390/kernel/audit.c
+++ b/arch/s390/kernel/audit.c
@@ -54,6 +54,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_NATIVE;
 	}
diff --git a/arch/s390/kernel/compat_audit.c b/arch/s390/kernel/compat_audit.c
index b2a2ed5d605a..320b5e7d96f0 100644
--- a/arch/s390/kernel/compat_audit.c
+++ b/arch/s390/kernel/compat_audit.c
@@ -40,6 +40,8 @@ int s390_classify_syscall(unsigned syscall)
 		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_COMPAT;
 	}
diff --git a/arch/sparc/kernel/audit.c b/arch/sparc/kernel/audit.c
index 50fab35bdaba..b092274eca79 100644
--- a/arch/sparc/kernel/audit.c
+++ b/arch/sparc/kernel/audit.c
@@ -55,6 +55,8 @@ int audit_classify_syscall(int abi, unsigned int syscall)
 		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_NATIVE;
 	}
diff --git a/arch/sparc/kernel/compat_audit.c b/arch/sparc/kernel/compat_audit.c
index fdf0d70b569b..b0a7d0112b96 100644
--- a/arch/sparc/kernel/compat_audit.c
+++ b/arch/sparc/kernel/compat_audit.c
@@ -40,6 +40,8 @@ int sparc32_classify_syscall(unsigned int syscall)
 		return AUDITSC_SOCKETCALL;
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_COMPAT;
 	}
diff --git a/arch/x86/ia32/audit.c b/arch/x86/ia32/audit.c
index d3dc8b57df81..8f6bf3a46a3a 100644
--- a/arch/x86/ia32/audit.c
+++ b/arch/x86/ia32/audit.c
@@ -40,6 +40,8 @@ int ia32_classify_syscall(unsigned syscall)
 	case __NR_execve:
 	case __NR_execveat:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_COMPAT;
 	}
diff --git a/arch/x86/kernel/audit_64.c b/arch/x86/kernel/audit_64.c
index 2a6cc9c9c881..44c3601cfdc4 100644
--- a/arch/x86/kernel/audit_64.c
+++ b/arch/x86/kernel/audit_64.c
@@ -53,6 +53,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 	case __NR_execve:
 	case __NR_execveat:
 		return AUDITSC_EXECVE;
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
 	default:
 		return AUDITSC_NATIVE;
 	}
diff --git a/include/linux/auditscm.h b/include/linux/auditscm.h
index 1c4f0ead5931..0893c373e12b 100644
--- a/include/linux/auditscm.h
+++ b/include/linux/auditscm.h
@@ -16,6 +16,7 @@ enum auditsc_class_t {
 	AUDITSC_OPENAT,
 	AUDITSC_SOCKETCALL,
 	AUDITSC_EXECVE,
+	AUDITSC_OPENAT2,
 
 	AUDITSC_NVALS /* count */
 };
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 8807afa6e237..27c747e0d5ab 100644
--- a/kernel/auditsc.c
+++ b/kernel/auditsc.c
@@ -76,6 +76,7 @@
 #include <linux/fsnotify_backend.h>
 #include <uapi/linux/limits.h>
 #include <uapi/linux/netfilter/nf_tables.h>
+#include <uapi/linux/openat2.h>
 
 #include "audit.h"
 
@@ -195,6 +196,8 @@ static int audit_match_perm(struct audit_context *ctx, int mask)
 		return ((mask & AUDIT_PERM_WRITE) && ctx->argv[0] == SYS_BIND);
 	case AUDITSC_EXECVE:
 		return mask & AUDIT_PERM_EXEC;
+	case AUDITSC_OPENAT2:
+		return mask & ACC_MODE((u32)((struct open_how *)ctx->argv[2])->flags);
 	default:
 		return 0;
 	}
diff --git a/lib/audit.c b/lib/audit.c
index 3ec1a94d8d64..738bda22dd39 100644
--- a/lib/audit.c
+++ b/lib/audit.c
@@ -60,6 +60,10 @@ int audit_classify_syscall(int abi, unsigned syscall)
 #endif
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+#ifdef __NR_openat2
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
+#endif
 	default:
 		return AUDITSC_NATIVE;
 	}
diff --git a/lib/compat_audit.c b/lib/compat_audit.c
index 63125ad2edc0..7ed9461b52b7 100644
--- a/lib/compat_audit.c
+++ b/lib/compat_audit.c
@@ -46,6 +46,10 @@ int audit_classify_compat_syscall(int abi, unsigned syscall)
 #endif
 	case __NR_execve:
 		return AUDITSC_EXECVE;
+#ifdef __NR_openat2
+	case __NR_openat2:
+		return AUDITSC_OPENAT2;
+#endif
 	default:
 		return AUDITSC_COMPAT;
 	}
-- 
2.27.0


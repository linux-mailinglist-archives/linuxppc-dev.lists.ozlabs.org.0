Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5887533FCBF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 02:48:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F190m2zpMz3bvd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 12:48:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MkqVQkJK;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MkqVQkJK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=rgb@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MkqVQkJK; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=MkqVQkJK; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F190K0N92z303T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 12:48:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616032091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuMfiKtlHJ9YtiMEQ803haS0RFolvE5VmV2RzbMQkXA=;
 b=MkqVQkJKxN6l0GQ/AAkkpxwUvQDkNU3XYyoh1tcryH8NFTaWi9bJ3XcrK1yKnVYLY3n3Sq
 4FNK/w4lsWOgBWzW5vynlNWebwHmUFSKf0MzLydpTdwvRj3dcxvNrhJbq77lafJmUK27u1
 9TGcofDkyzeINEyHJDqkqOmTpKzecxo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616032091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuMfiKtlHJ9YtiMEQ803haS0RFolvE5VmV2RzbMQkXA=;
 b=MkqVQkJKxN6l0GQ/AAkkpxwUvQDkNU3XYyoh1tcryH8NFTaWi9bJ3XcrK1yKnVYLY3n3Sq
 4FNK/w4lsWOgBWzW5vynlNWebwHmUFSKf0MzLydpTdwvRj3dcxvNrhJbq77lafJmUK27u1
 9TGcofDkyzeINEyHJDqkqOmTpKzecxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-Yg0X8aOYOhmb-aInmv1mmg-1; Wed, 17 Mar 2021 21:48:06 -0400
X-MC-Unique: Yg0X8aOYOhmb-aInmv1mmg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97E0D180FCA0;
 Thu, 18 Mar 2021 01:48:04 +0000 (UTC)
Received: from madcap2.tricolour.ca (unknown [10.10.110.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCAB14C;
 Thu, 18 Mar 2021 01:48:00 +0000 (UTC)
From: Richard Guy Briggs <rgb@redhat.com>
To: Linux-Audit Mailing List <linux-audit@redhat.com>,
 LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] audit: add support for the openat2 syscall
Date: Wed, 17 Mar 2021 21:47:17 -0400
Message-Id: <49510cacfb5fbbaa312a4a389f3a6619675007ab.1616031035.git.rgb@redhat.com>
In-Reply-To: <cover.1616031035.git.rgb@redhat.com>
References: <cover.1616031035.git.rgb@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
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
 Eric Paris <eparis@redhat.com>, linux-fsdevel@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-alpha@vger.kernel.org,
 sparclinux@vger.kernel.org, Eric Paris <eparis@parisplace.org>,
 Steve Grubb <sgrubb@redhat.com>, linuxppc-dev@lists.ozlabs.org
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
 kernel/auditsc.c                   | 3 +++
 lib/audit.c                        | 4 ++++
 lib/compat_audit.c                 | 4 ++++
 15 files changed, 35 insertions(+)

diff --git a/arch/alpha/kernel/audit.c b/arch/alpha/kernel/audit.c
index 96a9d18ff4c4..06a911b685d1 100644
--- a/arch/alpha/kernel/audit.c
+++ b/arch/alpha/kernel/audit.c
@@ -42,6 +42,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return 3;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 0;
 	}
diff --git a/arch/ia64/kernel/audit.c b/arch/ia64/kernel/audit.c
index 5192ca899fe6..5eaa888c8fd3 100644
--- a/arch/ia64/kernel/audit.c
+++ b/arch/ia64/kernel/audit.c
@@ -43,6 +43,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return 3;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 0;
 	}
diff --git a/arch/parisc/kernel/audit.c b/arch/parisc/kernel/audit.c
index 9eb47b2225d2..fc721a7727ba 100644
--- a/arch/parisc/kernel/audit.c
+++ b/arch/parisc/kernel/audit.c
@@ -52,6 +52,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return 3;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 0;
 	}
diff --git a/arch/parisc/kernel/compat_audit.c b/arch/parisc/kernel/compat_audit.c
index 20c39c9d86a9..fc6d35918c44 100644
--- a/arch/parisc/kernel/compat_audit.c
+++ b/arch/parisc/kernel/compat_audit.c
@@ -35,6 +35,8 @@ int parisc32_classify_syscall(unsigned syscall)
 		return 3;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 1;
 	}
diff --git a/arch/powerpc/kernel/audit.c b/arch/powerpc/kernel/audit.c
index a2dddd7f3d09..8f32700b0baa 100644
--- a/arch/powerpc/kernel/audit.c
+++ b/arch/powerpc/kernel/audit.c
@@ -54,6 +54,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return 4;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 0;
 	}
diff --git a/arch/powerpc/kernel/compat_audit.c b/arch/powerpc/kernel/compat_audit.c
index 55c6ccda0a85..ebe45534b1c9 100644
--- a/arch/powerpc/kernel/compat_audit.c
+++ b/arch/powerpc/kernel/compat_audit.c
@@ -38,6 +38,8 @@ int ppc32_classify_syscall(unsigned syscall)
 		return 4;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 1;
 	}
diff --git a/arch/s390/kernel/audit.c b/arch/s390/kernel/audit.c
index d395c6c9944c..d964cb94cfaf 100644
--- a/arch/s390/kernel/audit.c
+++ b/arch/s390/kernel/audit.c
@@ -54,6 +54,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 		return 4;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 0;
 	}
diff --git a/arch/s390/kernel/compat_audit.c b/arch/s390/kernel/compat_audit.c
index 444fb1f66944..f7b32933ce0e 100644
--- a/arch/s390/kernel/compat_audit.c
+++ b/arch/s390/kernel/compat_audit.c
@@ -39,6 +39,8 @@ int s390_classify_syscall(unsigned syscall)
 		return 4;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 1;
 	}
diff --git a/arch/sparc/kernel/audit.c b/arch/sparc/kernel/audit.c
index a6e91bf34d48..b6dcca9c6520 100644
--- a/arch/sparc/kernel/audit.c
+++ b/arch/sparc/kernel/audit.c
@@ -55,6 +55,8 @@ int audit_classify_syscall(int abi, unsigned int syscall)
 		return 4;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 0;
 	}
diff --git a/arch/sparc/kernel/compat_audit.c b/arch/sparc/kernel/compat_audit.c
index 10eeb4f15b20..d2652a1083ad 100644
--- a/arch/sparc/kernel/compat_audit.c
+++ b/arch/sparc/kernel/compat_audit.c
@@ -39,6 +39,8 @@ int sparc32_classify_syscall(unsigned int syscall)
 		return 4;
 	case __NR_execve:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 1;
 	}
diff --git a/arch/x86/ia32/audit.c b/arch/x86/ia32/audit.c
index 6efe6cb3768a..57a02ade5503 100644
--- a/arch/x86/ia32/audit.c
+++ b/arch/x86/ia32/audit.c
@@ -39,6 +39,8 @@ int ia32_classify_syscall(unsigned syscall)
 	case __NR_execve:
 	case __NR_execveat:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 1;
 	}
diff --git a/arch/x86/kernel/audit_64.c b/arch/x86/kernel/audit_64.c
index 83d9cad4e68b..39de1e021258 100644
--- a/arch/x86/kernel/audit_64.c
+++ b/arch/x86/kernel/audit_64.c
@@ -53,6 +53,8 @@ int audit_classify_syscall(int abi, unsigned syscall)
 	case __NR_execve:
 	case __NR_execveat:
 		return 5;
+	case __NR_openat2:
+		return 6;
 	default:
 		return 0;
 	}
diff --git a/kernel/auditsc.c b/kernel/auditsc.c
index 8bb9ac84d2fb..f5616e70d129 100644
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
 	case 5: /* execve */
 		return mask & AUDIT_PERM_EXEC;
+	case 6: /* openat2 */
+		return mask & ACC_MODE((u32)((struct open_how *)ctx->argv[2])->flags);
 	default:
 		return 0;
 	}
diff --git a/lib/audit.c b/lib/audit.c
index 5004bff928a7..8f030b9a2d10 100644
--- a/lib/audit.c
+++ b/lib/audit.c
@@ -60,6 +60,10 @@ int audit_classify_syscall(int abi, unsigned syscall)
 #endif
 	case __NR_execve:
 		return 5;
+#ifdef __NR_openat2
+	case __NR_openat2:
+		return 6;
+#endif
 	default:
 		return 0;
 	}
diff --git a/lib/compat_audit.c b/lib/compat_audit.c
index 77eabad69b4a..8aff0d0d9ba0 100644
--- a/lib/compat_audit.c
+++ b/lib/compat_audit.c
@@ -45,6 +45,10 @@ int audit_classify_compat_syscall(int abi, unsigned syscall)
 #endif
 	case __NR_execve:
 		return 5;
+#ifdef __NR_openat2
+	case __NR_openat2:
+		return 6;
+#endif
 	default:
 		return 1;
 	}
-- 
2.27.0


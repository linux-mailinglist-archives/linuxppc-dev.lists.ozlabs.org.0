Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 177752A4F05
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:38:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQdp22ccSzDqlY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:38:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=zhuyifei1999@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=iuwgpDk+; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQWHx2qTBzDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 00:45:14 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id s14so14576110qkg.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LIHaRbcW33holGtLxAdu7MnC0XA7v48flZenL4Xa8vU=;
 b=iuwgpDk+ywyZuJVS5CkkW+UWoj8ZeMu3W2DRLryyvnrW+Yalap3GJHVoD8C4+cBD+7
 i0mlc7ylUKWR3VTM8HUiGkrSd6GfEzWHDrKM2Yi/EUh4SUeQJGC5iWhdIlHg1FwsfmU7
 5j2mbRcAQ+Kabs4nK6b2QlwboR4cF7QiMu8M72ms85+IdB3oy7S+KkgeNASKDc+esvNS
 rxHPsuHmxZd6k2hEmZ4gnCaD4zMtAJepsCqvCTOJcS3RDl0yqGmQrE1llfApvK0RDGby
 kEpnD+/cchNFssyPLLdYRHqwyzAWUPNEyXHCd8X+DCF/NW6Ni9L1BESHJg76npfZXeog
 1pWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LIHaRbcW33holGtLxAdu7MnC0XA7v48flZenL4Xa8vU=;
 b=Kv1IvDyC7iUv/rvE1rO9ZcN/+pN85KNlbWvRQltNUi5lZdcyHXqczwO+H05Ljt0d/N
 QT/CMzZFOZDWm0Qh0Ns3780snvdtE/S5AdCufkawv8/sNq5KyfY28FLihXW4GU/Vimqm
 KnmAw0K50vd5Mha1fDTJJKDXLyswKlKZmIBctXJftI+nDdKkrT565nc4EbbfzIwAEmM6
 Sz8Lwg2bRjNSPPgoz6x+o9lozZaogzBB3n5SpMRx2KWts5lGWID8jCWRmzjMxmBMrM9y
 huij7tZlHmbZx8DteWgiyf6HHx/4Npl8DkZmvvbHZqQrYYOhBbb8VgC4jIwd1S+Q11zT
 bi1A==
X-Gm-Message-State: AOAM533M9yFr+C0ze8jUNJi+bI3FK4pYxESuBThJ/+dGh/+KbXVd93lg
 dsc9qUyEdd0n4dhBfgBw6X0=
X-Google-Smtp-Source: ABdhPJza/Al4BmaaKLSE3M46BZOoXGqpH/lMostTkMqGorYeqXkDTUPky+7rUNYdGBfTqt+ibTx7dg==
X-Received: by 2002:a05:620a:492:: with SMTP id
 18mr20260926qkr.149.1604411110339; 
 Tue, 03 Nov 2020 05:45:10 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:08 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 2/8] parisc: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:42:58 -0600
Message-Id: <9bb86c546eda753adf5270425e7353202dbce87c.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Nov 2020 05:22:57 +1100
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: YiFei Zhu <yifeifz2@illinois.edu>

To enable seccomp constant action bitmaps, we need to have a static
mapping to the audit architecture and system call table size. Add these
for parisc.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/parisc/include/asm/Kbuild    |  1 -
 arch/parisc/include/asm/seccomp.h | 22 ++++++++++++++++++++++
 2 files changed, 22 insertions(+), 1 deletion(-)
 create mode 100644 arch/parisc/include/asm/seccomp.h

diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index e3ee5c0bfe80..f16c4db80116 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -5,5 +5,4 @@ generated-y += syscall_table_c32.h
 generic-y += kvm_para.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
-generic-y += seccomp.h
 generic-y += user.h
diff --git a/arch/parisc/include/asm/seccomp.h b/arch/parisc/include/asm/seccomp.h
new file mode 100644
index 000000000000..b058b2220322
--- /dev/null
+++ b/arch/parisc/include/asm/seccomp.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H
+
+#include <asm-generic/seccomp.h>
+
+#ifdef CONFIG_64BIT
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_PARISC64
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"parisc64"
+# ifdef CONFIG_COMPAT
+#  define SECCOMP_ARCH_COMPAT		AUDIT_ARCH_PARISC
+#  define SECCOMP_ARCH_COMPAT_NR	NR_syscalls
+#  define SECCOMP_ARCH_COMPAT_NAME	"parisc"
+# endif
+#else /* !CONFIG_64BIT */
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_PARISC
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"parisc"
+#endif
+
+#endif /* _ASM_SECCOMP_H */
-- 
2.29.2


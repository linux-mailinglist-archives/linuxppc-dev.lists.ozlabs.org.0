Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE92A4EEB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:32:54 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQdgl2vCHzDqck
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:32:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=zhuyifei1999@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=HUmeo8PK; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQWHv4WpKzDqj1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 00:45:11 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id p3so14604755qkk.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 05:45:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/wWgXpwOKfWu89zfH4z55YdVS4FoKgsyU3KjhUPw2Xk=;
 b=HUmeo8PKFkCINZljvfRc+P6j2X0+0GOhvVUFZGwDVi5RBcL6yCRRP7JuB0zv9c9+Po
 E3+9kj9NX57UzwwDZNGdD8iaYBGU9wXX967tHeoCgvkJm1CovDmhTO1emhffrLi5usDF
 0oEzRtLhoIuA39ggcO6eQcTv/OGvRmPgCQX4sTZrzio50ODOqs0YICXq0MgBjQAfHPdz
 xl7tXTacq4qNhz9LC51MS1M++unu3TcfcbkGRzSQxWGdRezIwQbhQELfkQD+RH+S21A/
 sax7yhctLMgZTMGgygja3clLmsRRE7W8PkbbGI7EUIeZ8EaqV18ap7HIw7j/Z7WF3HJx
 8pfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/wWgXpwOKfWu89zfH4z55YdVS4FoKgsyU3KjhUPw2Xk=;
 b=oXVPGcF1azLn6h/vEfIrXpaO7Ejp2A4HewM8ta+xaL6+IqPDI/Dox7FNCHSXU1WNiN
 G8CSXG6L/Qmxj4v4SVVRlAR2pleb32Uf1/6HEF1aW84KSyzPwXK3kNl/2MEcPreycgGi
 2m9stXWr9BvrwGcFCtMHzR1lY/X9xhXWlra+JA4Gg8b6IBUbr0JM1ICp+lFYhD9By91W
 kWnBckSQ28kYJuC9WDi+w9QdZqqlo+cVlz0GmvDUp/N7BPQwjLOVHzMmj2vSqd2A4vRc
 7W5f7RUljw0dppFwtClMJp3O0+06ENrae3MWwYMdeW5XGuWFxQAIiO92OR2G+baTSY88
 1iVQ==
X-Gm-Message-State: AOAM5314R7BtatAem2efzzKS++H24HpgoHwFE3Rt06PZPe+L33PHuRBE
 1PdBKsjLaBmwx21gS3ImNog=
X-Google-Smtp-Source: ABdhPJyHAHCGbEEm09WION+/UIzzZ/lrqbH487CGEGOVROPc59579zIEupD9GaMmhFNRyF9+2N11RQ==
X-Received: by 2002:ae9:dec5:: with SMTP id
 s188mr20227157qkf.250.1604411107951; 
 Tue, 03 Nov 2020 05:45:07 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:07 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 1/8] csky: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:42:57 -0600
Message-Id: <f9219026d4803b22f3e57e3768b4e42e004ef236.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Nov 2020 05:22:55 +1100
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
for csky.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/csky/include/asm/Kbuild    |  1 -
 arch/csky/include/asm/seccomp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 arch/csky/include/asm/seccomp.h

diff --git a/arch/csky/include/asm/Kbuild b/arch/csky/include/asm/Kbuild
index 64876e59e2ef..93372255984d 100644
--- a/arch/csky/include/asm/Kbuild
+++ b/arch/csky/include/asm/Kbuild
@@ -4,6 +4,5 @@ generic-y += gpio.h
 generic-y += kvm_para.h
 generic-y += local64.h
 generic-y += qrwlock.h
-generic-y += seccomp.h
 generic-y += user.h
 generic-y += vmlinux.lds.h
diff --git a/arch/csky/include/asm/seccomp.h b/arch/csky/include/asm/seccomp.h
new file mode 100644
index 000000000000..d33e758126fb
--- /dev/null
+++ b/arch/csky/include/asm/seccomp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H
+
+#include <asm-generic/seccomp.h>
+
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_CSKY
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"csky"
+
+#endif /* _ASM_SECCOMP_H */
-- 
2.29.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E762A4F29
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:44:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQdxB697WzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:44:30 +1100 (AEDT)
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
 header.s=20161025 header.b=b4PJS/xa; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQWJ35wZfzDqjQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 00:45:23 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id s14so14576554qkg.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 05:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
 b=b4PJS/xarNSgluAWCDQQJdu5ZZO0VU1I/CVu92i5vqJojdmesNzdpHU7yArgmVQ/E0
 ssbV0IRGKePz0hLGbtulnwYnTx5COwyQyc9m5w6wHYmkYcfAi0KMHRRx7s4bial5QlHm
 FvgIq+A4dw+gBa8aET875i6MrhNYYoEziVxW0mYaQlwHJjIC17MKQQffriRcRcrqbvIZ
 E0DUUKInWpAcW0rkp9bF5XrHmo61/Wt1H/vsEPSTiCc6yDtBv1y+2E2shnOXWuZJykAv
 qixeNSrBN1O663ndDaowUg7ftIsFgDEFacIeZyHTHWsjCEpnDR4tkoP+lBgPM5gFOtbX
 RUdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
 b=Owt8XUCJfMYcrpUpx2NNM00jSEQZok1a973Q6NKTF2XqSDKFgFBC9vNycNE45MDOHv
 eZtfhM0/185bn8vgrILfvG1TpfKHsmLeMZfuvpfRGTpsiyMFE/WPiQnICOEorJizaz2w
 VSnJYnN8yJzdf0qlR1zz0jHnsC5e52hRvPCl7kDK8jj1eDT/qXRPZE7NE338Fv/ZcF1f
 x+TVoFsJn0AQkTnbA5LwCn8hfxCiGBza789FUpZPpgKMci3owUHX4T3orqXiCnEx0e0M
 hf4Y4WQU4pP+GMbaO9SSYBm6UxRxQ4PBnoJOQrZAiIRD6DqzTgTnJ6VBmENas5u4mBay
 r3sQ==
X-Gm-Message-State: AOAM530n9XJuyANLWs0dTJvruYaVDnOoyacMEx6z1fh1qTy5DwIPOe+6
 ugOgvMOu24oamymUCI9bKJI=
X-Google-Smtp-Source: ABdhPJxjlZ3tKnk2e7vxZIf8aOb5eHzCPcpqw48aBWIjBaLIjY56iC7mD5NkhJDWu4rwTzCntUVI8A==
X-Received: by 2002:a05:620a:62b:: with SMTP id
 11mr20584746qkv.229.1604411118944; 
 Tue, 03 Nov 2020 05:45:18 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:18 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 7/8] xtensa: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:43:03 -0600
Message-Id: <eab25a03fbf296e65e5292c7a25d15285e93e6de.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Nov 2020 05:23:00 +1100
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
for xtensa.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/xtensa/include/asm/Kbuild    |  1 -
 arch/xtensa/include/asm/seccomp.h | 11 +++++++++++
 2 files changed, 11 insertions(+), 1 deletion(-)
 create mode 100644 arch/xtensa/include/asm/seccomp.h

diff --git a/arch/xtensa/include/asm/Kbuild b/arch/xtensa/include/asm/Kbuild
index c59c42a1221a..9718e9593564 100644
--- a/arch/xtensa/include/asm/Kbuild
+++ b/arch/xtensa/include/asm/Kbuild
@@ -7,5 +7,4 @@ generic-y += mcs_spinlock.h
 generic-y += param.h
 generic-y += qrwlock.h
 generic-y += qspinlock.h
-generic-y += seccomp.h
 generic-y += user.h
diff --git a/arch/xtensa/include/asm/seccomp.h b/arch/xtensa/include/asm/seccomp.h
new file mode 100644
index 000000000000..f1cb6b0a9e1f
--- /dev/null
+++ b/arch/xtensa/include/asm/seccomp.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_SECCOMP_H
+#define _ASM_SECCOMP_H
+
+#include <asm-generic/seccomp.h>
+
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_XTENSA
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"xtensa"
+
+#endif /* _ASM_SECCOMP_H */
-- 
2.29.2


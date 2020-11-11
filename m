Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 11B9A2AF2A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 14:56:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWR921d7MzDqkX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 00:56:22 +1100 (AEDT)
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
 header.s=20161025 header.b=F8D/Y+HZ; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWQh636F9zDqq7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 00:34:46 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id n132so1625025qke.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 05:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
 b=F8D/Y+HZfrpZoxY1WSpU1XD08FGxbbmSRvBeCuS4pVYlmDmDfHK+86TEUz2GSieEB6
 /G826gCZaufPpqw9yqU3gNUSRCTgM9O12K4UhmNyeNdIkVTjqwPtJI9Lf+tvkb9Fg8+c
 qRpmL5clJ5CA1S+ea2Ab7oCBQhLxWEhivtggHkttRUxU6H+6bwKCbKQw40vyQeowP2ps
 XMXoUoPJxCmgod7Htt5aWIQRnBxAeBFeM00worN++PmF2dIyJGX4tB4Z/JpSdxEQSkmp
 0SlWBQ6C7R2fx7uyThUkfX85xTr/0pRg1d8IYFbC/KQ5PAYWXyryWS92ixdQ2PxoggBD
 zMoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KyUFBIsp7WG/ZlJY7JJxE8NR9eUIpLAxO9Zr6R0PBAI=;
 b=iYfX/tBcL0FGbyMZrz6jFEip3uwCGSoLWXwpi2HLL1fYuGbnB11DqjNgHZm0DIP4xj
 jaSY7OH5x/2/V53AqovmwR1bBhNt5v/h0lNt2YuUJux8fRhn7PTrR0r/TVu/dqEY4rsA
 v2aDDJOHKneoGZVMIc5PINKXCIQfxrtCGbDDtl/Z1b8/bZAO8tn70pEHrT9voGwDLz9P
 7LV5Ijt2F7QxAUrj+A6RQ61kVGEOp4zqFlfkHxViWAIxNX9fa/a+BGJ7UQi27cm0MN/q
 dWS1LqrtuimFFsUd1cATbsckdqsfJ5Om4ER+vJ9OpZxfjfz14Qd6JFRpZjb5lYwJW5RU
 oh9w==
X-Gm-Message-State: AOAM530vovV47vTO1SYzT9KqLxRA7RdZwZ3/UxqSkyaZz75flFrszhc9
 fJtPhyoEk/FJKFvxC+d5hSI=
X-Google-Smtp-Source: ABdhPJz84XkbzmcCHTc2+SdZFUqORQfeEggNtVRT4ylMevKQ8zIMjt4i44s0v7vCLpX1u6c6tS/Tlw==
X-Received: by 2002:a37:4145:: with SMTP id o66mr19607495qka.426.1605101683404; 
 Wed, 11 Nov 2020 05:34:43 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:42 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 7/8] xtensa: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:53 -0600
Message-Id: <79669648ba167d668ea6ffb4884250abcd5ed254.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
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


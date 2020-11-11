Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 226962AF293
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 14:53:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWR5M0DNmzDqKf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 00:53:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=zhuyifei1999@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AiHrWEt1; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWQh36C5nzDqbr
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 00:34:43 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id f93so1220285qtb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 05:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z8BEo0x7DBxygVu3ezyut+Q+/5lHQFyLMFsea6yH4dY=;
 b=AiHrWEt19R14SjvDJPKLr7v7i72FmAs7tKIcKGMSWFQwQ/DIoBrkASCkncBIALbImW
 ovXjCz0vPL0IwyG05D0ScobV3buaYwTntzRWG4DvErPgobGS3lP6aF57Y5z/ROppbM15
 U5alV4hGDTuqamCbUCRSnEElgLlyHQqyfApA9IFdiByMiEgJ9T5aChZZ8FuOLffq7taE
 8RCryXNGD6+QzxN4QWCFwCmheQXdMAr5LaXXLZuZJoit1BPXhkYBBltSg8ODItIgxHp4
 ULkURkvuGrMOziExOLhaMa/N/5bMiNtXHKjvWx5fTW5xKcw7pTxjO4xz/fvpWPD8dS5Q
 jWQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z8BEo0x7DBxygVu3ezyut+Q+/5lHQFyLMFsea6yH4dY=;
 b=ptegb51jefrQnJ77JBqz+GLrkZMDND3edofNAqTH5JwZ/tpjyCIRotkIqnBvLYjUHJ
 drgIgmhT19E5A6T2n65GMv4jgeb28+02809fkFuNXJcy4BbJVcWxP0EnE6WoNGezxN2Y
 VN4K4EDt4GMSju2VtaBBJe0YfdyPwId0VYV8lKq2vySVsQJD+LMIBY9TTPeJmSdy1CEh
 0bgB4WkeZzq/Jx8t0AeJdMJQt2U78nGKjt09b6vQ2fvyyDJR061L3cB2nFaOOyny4nfr
 UDY3W8C0UFHOv6L4nWx82wwEk2dXBYblohBSTj1/OoEPhdKMWsuUBWYfXE77Nhojrn84
 k3rw==
X-Gm-Message-State: AOAM533gzpm5cFG0cZ8FKB7UWoEBrGlXxCnyG3bzI/WL6IIX5oTXTSTU
 Z+jUruDlTx1geg/P7N9N29xY0KNXnzGKcw==
X-Google-Smtp-Source: ABdhPJyZWAhNIXxg3LfT4oElO/X43US70dnQmIy4NoyGeM0Dg949Sb1UtyuDuo3lMLZdX0WTBziFrQ==
X-Received: by 2002:aed:2744:: with SMTP id n62mr24170273qtd.67.1605101681720; 
 Wed, 11 Nov 2020 05:34:41 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:41 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 6/8] sh: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:52 -0600
Message-Id: <61ae084cd4783b9b50860d9dedb4a348cf1b7b6f.1605101222.git.yifeifz2@illinois.edu>
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
for sh.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/sh/include/asm/seccomp.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/sh/include/asm/seccomp.h b/arch/sh/include/asm/seccomp.h
index 54111e4d32b8..d4578395fd66 100644
--- a/arch/sh/include/asm/seccomp.h
+++ b/arch/sh/include/asm/seccomp.h
@@ -8,4 +8,14 @@
 #define __NR_seccomp_exit __NR_exit
 #define __NR_seccomp_sigreturn __NR_rt_sigreturn
 
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+#define __SECCOMP_ARCH_LE		__AUDIT_ARCH_LE
+#else
+#define __SECCOMP_ARCH_LE		0
+#endif
+
+#define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_SH | __SECCOMP_ARCH_LE)
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"sh"
+
 #endif /* __ASM_SECCOMP_H */
-- 
2.29.2


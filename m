Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59FDA2A4F19
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:40:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQdrh4MMtzDqBZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:40:36 +1100 (AEDT)
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
 header.s=20161025 header.b=WQlGQ9Jd; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQWHy662xzDqGM
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 00:45:18 +1100 (AEDT)
Received: by mail-qk1-x742.google.com with SMTP id b18so14595229qkc.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 05:45:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+eMXBOnvKPM7N/Eu0cs4UA1I6FeurfdgB6uFLVTMPX8=;
 b=WQlGQ9Jd6IJQey7nb9UMUDYsL+DEjmMTVkMHPOOrYSdV926tvA93ywvzKvPW9EdJzQ
 xWYruju83XXsh1i6XxcvxRg6hDqU6tq8BaNfGIDHsg2pgJYtsAkvynEeGwGPRGe+ZPsx
 biGcniO7POm0x08s1Iwq88HHNGiqadVQYcORh5b/WkN2ytRV8n2H7zXHbG9CyN36/TNs
 CvFVpr4PvgANBbzTT2RtpSiuCEWpI/CT6RmO+Fk+zaNRO64hUzWUoNMlpPKDi4ZwlNos
 6rRlllg7BYoJdX53s9pkkLBvkmTEqozVXkK0+PARPMrbpsjLaiSLI/uef0UWqLlg9En5
 LfmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+eMXBOnvKPM7N/Eu0cs4UA1I6FeurfdgB6uFLVTMPX8=;
 b=o1Qirn/5D4tQnH+r8XgFVLynhpcWWEB/4xW0LH6vdUs2AWoNIUG+H7uqwCDI++E6Dd
 8TrFN2HjaWPScDjksOm7+BUTlZYZOonBiVE/9TYznSvOX/0fnBebjv4nS0wNydmJRFy5
 YKVMPO2AxFF+Zsp5jwfFqCeSTx+Oe/JPu+EGMZNCDntTPb9T10r/DZdJoXYLOlSoJJqv
 cI5mXWU7jMbBOqJlSBgDDTonMRJCQaDOpdsIOZnBwMhlCj0sYBM9uizHmIPmW/JrhYwb
 AHtQ2I21dr8167vl+YQp/6wYWNlZ2DJq/yWQnlC1NP+ybjZW4Pe4jdaxRJNi3Lk0IWzM
 UuMQ==
X-Gm-Message-State: AOAM533uIW8j5zxYJjqMNGg1VDR3VY9zoQDORV14TX67zDVCFd9OsBMY
 MK3wv3CGxVbVWcke8Y96/DE=
X-Google-Smtp-Source: ABdhPJwPGCoGB0mzNqbRbE7eqaQrs2dVEZ+ysMN9iFWpphI5Jv582QKy4aIVAjZqImUIW48ZcJyckw==
X-Received: by 2002:a37:6187:: with SMTP id v129mr8374191qkb.31.1604411115473; 
 Tue, 03 Nov 2020 05:45:15 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:14 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 5/8] s390: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:43:01 -0600
Message-Id: <0fbe0c14d598e18effad3b648ab4808f9cd95eba.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Nov 2020 05:22:58 +1100
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
for s390.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/s390/include/asm/seccomp.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/s390/include/asm/seccomp.h b/arch/s390/include/asm/seccomp.h
index 795bbe0d7ca6..71d46f0ba97b 100644
--- a/arch/s390/include/asm/seccomp.h
+++ b/arch/s390/include/asm/seccomp.h
@@ -16,4 +16,13 @@
 
 #include <asm-generic/seccomp.h>
 
+#define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_S390X
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"s390x"
+#ifdef CONFIG_COMPAT
+# define SECCOMP_ARCH_COMPAT		AUDIT_ARCH_S390
+# define SECCOMP_ARCH_COMPAT_NR		NR_syscalls
+# define SECCOMP_ARCH_COMPAT_NAME	"s390"
+#endif
+
 #endif	/* _ASM_S390_SECCOMP_H */
-- 
2.29.2


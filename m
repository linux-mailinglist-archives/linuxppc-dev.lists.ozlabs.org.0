Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC052A4F52
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 19:49:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQf2R69CPzDqNS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 05:49:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=zhuyifei1999@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PMy31dQJ; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQWJ45WdQzDqjb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Nov 2020 00:45:23 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id m14so11535113qtc.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Nov 2020 05:45:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9/hEAP0td3DKDEonOQx/BrDGR67nDcwn+HdeFH8wdFU=;
 b=PMy31dQJueagbOReuh4TyHKDHnWAkQvYrpAxEIErX4xPuMN4MlNB2tU7IkrAnlx5qR
 uhiVg0r41UxTv/gr4jsg2Wl8FCoeHTXIjjT8/6kSbvOBLPV4TYfJCrk8J0g2rFJRrlKD
 1hx2REJtkovGnmyDSF4OhzIchxZlhVI33gOeYruCrarfFMdqwMbuze+ne7D3usBg1+Vq
 DnVMU0VjWHDphquu2ZmwzzqKtLL7eO8+3YSpHLjN+/oLDv2OFzem5txt9rfYq8LN1OI+
 2+w6DzMI4hNFhProTsfpRsIxSVaEXoTrzgUyJ2J91ehNlbAFEuRmMAY+8h22ZlecP47B
 /smQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9/hEAP0td3DKDEonOQx/BrDGR67nDcwn+HdeFH8wdFU=;
 b=b76CXokVbtTqGKnaVf6yiuNR9xIcpZCZ44FlBD0t7ukNwMGYkTYUZMyKp3MmI8Mip4
 7yrLR3nfogkesbf/+u50cr6/EL9ED2kK8GqvDdKkVviTe3+0NrWVzMXielUdkhsHT1sE
 X0DN0iQRrGRb9jCEjjRpa/Gv2GfAwJzXb35X29dSCt1Qst6JSTTY3oNYlOvbT55aIDna
 BP7DC1CdfVApIhkAef3MmZhfC8uv9V6seD/0u4absRL9EiOtVmtc01RtJkboPYi9g5ag
 p1J7nzmeOE4wH4ZxjEIcPOBr7Y9rB550D+ygelGvpLMYL+PIk9JfIZSm4OhaHjR4KJEf
 31Mg==
X-Gm-Message-State: AOAM531ywfrTrrNnTf9pL+KqKFPJlWt8EUAhqLxFArd562a3pSLqZStl
 uKiCIuortU3Vx/d1QKlLEbE=
X-Google-Smtp-Source: ABdhPJxZpuM+FL2rdeo54BZFwmZgnUAh5zGzhGJrI7NUoaE9OPGoZYZ+/yTeLM9bmqKuOcXR8gpKgw==
X-Received: by 2002:aed:2064:: with SMTP id 91mr19450606qta.383.1604411117345; 
 Tue, 03 Nov 2020 05:45:17 -0800 (PST)
Received: from zhuyifei1999-ThinkPad-T480.gw.illinois.edu
 ([2620:0:e00:400f::31])
 by smtp.gmail.com with ESMTPSA id a206sm7356568qkb.64.2020.11.03.05.45.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Nov 2020 05:45:16 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp 6/8] sh: Enable seccomp architecture tracking
Date: Tue,  3 Nov 2020 07:43:02 -0600
Message-Id: <46d7f8d02bdaadf364a59db2d60f43466227b3af.1604410035.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1604410035.git.yifeifz2@illinois.edu>
References: <cover.1604410035.git.yifeifz2@illinois.edu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Nov 2020 05:23:01 +1100
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
index 54111e4d32b8..b8d169292a34 100644
--- a/arch/sh/include/asm/seccomp.h
+++ b/arch/sh/include/asm/seccomp.h
@@ -8,4 +8,14 @@
 #define __NR_seccomp_exit __NR_exit
 #define __NR_seccomp_sigreturn __NR_rt_sigreturn
 
+#ifdef CONFIG_CPU_LITTLE_ENDIAN
+#define __SECCOMP_ARCH_LE_BIT		__AUDIT_ARCH_LE
+#else
+#define __SECCOMP_ARCH_LE_BIT		0
+#endif
+
+#define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_SH | __SECCOMP_ARCH_LE)
+#define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+#define SECCOMP_ARCH_NATIVE_NAME	"sh"
+
 #endif /* __ASM_SECCOMP_H */
-- 
2.29.2


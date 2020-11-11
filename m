Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EEDD2AF249
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 14:37:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWQlF4QBFzDqqK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 00:37:29 +1100 (AEDT)
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
 header.s=20161025 header.b=dNmx8let; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWQgx3PtxzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 00:34:37 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id m65so1216387qte.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 05:34:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/wWgXpwOKfWu89zfH4z55YdVS4FoKgsyU3KjhUPw2Xk=;
 b=dNmx8letqvw7/kng3JJM9MT8cp864llEi2W+fdgHjl0ywQOexzPsPUHJHFNPynp1Fu
 KyowDk74TZHDe12eygZFrmJx/0ykft94sWcknmiP/gb2ci8KYGrnhUPNAVoX1CQ7micC
 W9dxg0yPt32jkNPh+v2S6Ec8TERKRUxhAcuQXa3NFkbWo80pdfJ6Bl7pZT/OVLOTmPOj
 ZqSlW3XjT5hv6sk/2vSinzAG6ZS7KozmDUro8la2o7lq04jT1uzUKYXTrmPAjUt7smwf
 isz4yxPSfYvHYghHVVTVYFLVyuwWgAnYoJ33J4COWXdBK+Sc1/TKSOTKCGWEZcvZVt2n
 sfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/wWgXpwOKfWu89zfH4z55YdVS4FoKgsyU3KjhUPw2Xk=;
 b=blLSqnc+7dMA6lgbEkSbplNgmq9r51oDR3xj1PwQh834xFYHMTSJZF4D4dH/uq2fTn
 8SwIw8fPk3ARKFdOTTv+LYozr+X37B+Rc7IG+awREWizrimg7rcjElZJ9FukTRXGzuPC
 UAjW4DH9eOvit0PCvAQHPX1+5Yfzu9nCb5GXe2ErdO4HK4umtH5BTgs4wa3EqZEtbTTT
 Tl+FjJ4/7mCbtYq9p59FMtjq6+m2XUxSNcKNasCSaQ9OHkpL4XbXPW1FKk3gDDIwmdHu
 tFwFgTazDUTP+kTjUt/jwrFDc5GKiIu237LiPWYBns93dRwp3qOCujSjY1jzQMtcQG+i
 I7vw==
X-Gm-Message-State: AOAM5310XQpsXyFRAn4QfLjVQN+4gqcTtym4HrQ2CZF1E6RflV7nDMfC
 bqFtieLco5dKLG7nIF03Vxw=
X-Google-Smtp-Source: ABdhPJyXr79D39F72KQTAuWFk25+3xGmXqPHFQ+ygjm2TFYHLHgr595PCW4dLHay6xJ4RhIuu7lNGA==
X-Received: by 2002:ac8:5901:: with SMTP id 1mr17048871qty.350.1605101673552; 
 Wed, 11 Nov 2020 05:34:33 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:33 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 1/8] csky: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:47 -0600
Message-Id: <f9219026d4803b22f3e57e3768b4e42e004ef236.1605101222.git.yifeifz2@illinois.edu>
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


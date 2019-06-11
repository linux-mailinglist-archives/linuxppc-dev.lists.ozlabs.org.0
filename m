Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D8F293D14B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jun 2019 17:48:19 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45NZCj0zzCzDqvV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2019 01:48:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="LnPHun1C"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45NXZt03J5zDqWl
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2019 00:34:46 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id k187so6588692pga.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2019 07:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YZJgvtviNUnIWOS/HgWiTGklwujBjmKlLWmHEmiXJi8=;
 b=LnPHun1CxTXrS/mumpZ6hShzX3tHqSfjdrf1qRljzO0ghZ7WGwh8VmivJY/bcOHuzL
 y8RBPJAMXwHC25/qyEc2Xyp3PLxjVKeW3+6EjWNsF5gQAmwERd0G/9RU+d/drV/XjDFP
 B8syLzz30VG8FwWCoZWxbbuHuOtiURhyaAoMBV9ffY/7ZHEu3YEr2YhRK2UFIeJSm/33
 rLrgxxc4olIYx8mDFraYLC/UL7LkQ0P5WaGwHXp3ZBY0B+K9y7d6fjUyxQHxcJvrsDBN
 M+4Yf6lQ9pqjVIzLepjgDngGSpJVFo6fSs9ftTcxBkqqkRQYKb3hFfuxTkhvBYHaFu4B
 EY7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZJgvtviNUnIWOS/HgWiTGklwujBjmKlLWmHEmiXJi8=;
 b=Q7amM7zGenwqt2Yug9pJyY/fNBpiorHzSQAc4JuT1IBHipJEMfjcp/heWlYSlwdPSl
 UpTovTr9QwjCrPYK8ZwcCO6JfWZkkEqdm90JaVyyYtI+RgO+g27TYukSDEBwdp6zLHLp
 JPY8j4ea5JSB/0juhYzp1u3LJfpOVqeT/fzflu2YHnhoQoBLD2N08pcyYHZS3DmSHZf0
 mXx1sZDvtDG4+xmwm9Wp4B/7Rm270W2w9FqEGodWLjDnxGoVbV9JmitBbt/u/43ITwS6
 3nMccgvFm/TcPHOxU8hiNddUeSBGvzKF60NzLbHAhh4REIo9bHUN5VB+s8FgNggYpCSo
 IaPg==
X-Gm-Message-State: APjAAAW4IU5Fracx0p4wJOeQTOE8vKZ2Sf09ZO00dP084PqCr0TiHR+p
 SHIXZ74W/kk9WAbndOZaC7JcqZ/i
X-Google-Smtp-Source: APXvYqw43JjHKXdYgpQYUw/RH/XZqVmxLYz1RGvFiWUDQTCS1tPUYs5xt7yPkAcLFeiidqyw7/NrVg==
X-Received: by 2002:a63:ec02:: with SMTP id j2mr21292527pgh.340.1560263684073; 
 Tue, 11 Jun 2019 07:34:44 -0700 (PDT)
Received: from bobo.local0.net (242.60.168.202.static.comindico.com.au.
 [202.168.60.242])
 by smtp.gmail.com with ESMTPSA id a16sm25345568pfd.68.2019.06.11.07.34.42
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 11 Jun 2019 07:34:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 26/28] powerpc/64s/exception: move paca save area offsets into
 exception-64s.S
Date: Wed, 12 Jun 2019 00:30:38 +1000
Message-Id: <20190611143040.7834-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190611143040.7834-1-npiggin@gmail.com>
References: <20190611143040.7834-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

No generated code change. File is change is in bug table line numbers.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/exception-64s.h | 17 +++--------------
 arch/powerpc/kernel/exceptions-64s.S     | 22 ++++++++++++++++++++++
 2 files changed, 25 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
index 79e5ac87c029..33f4f72eb035 100644
--- a/arch/powerpc/include/asm/exception-64s.h
+++ b/arch/powerpc/include/asm/exception-64s.h
@@ -32,22 +32,11 @@
  */
 #include <asm/feature-fixups.h>
 
-/* PACA save area offsets (exgen, exmc, etc) */
-#define EX_R9		0
-#define EX_R10		8
-#define EX_R11		16
-#define EX_R12		24
-#define EX_R13		32
-#define EX_DAR		40
-#define EX_DSISR	48
-#define EX_CCR		52
-#define EX_CFAR		56
-#define EX_PPR		64
+/* PACA save area size in u64 units (exgen, exmc, etc) */
 #if defined(CONFIG_RELOCATABLE)
-#define EX_CTR		72
-#define EX_SIZE		10	/* size in u64 units */
+#define EX_SIZE		10
 #else
-#define EX_SIZE		9	/* size in u64 units */
+#define EX_SIZE		9
 #endif
 
 /*
diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index 8b571a2b3d76..c1075bbe4677 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -21,6 +21,28 @@
 #include <asm/feature-fixups.h>
 #include <asm/kup.h>
 
+/* PACA save area offsets (exgen, exmc, etc) */
+#define EX_R9		0
+#define EX_R10		8
+#define EX_R11		16
+#define EX_R12		24
+#define EX_R13		32
+#define EX_DAR		40
+#define EX_DSISR	48
+#define EX_CCR		52
+#define EX_CFAR		56
+#define EX_PPR		64
+#if defined(CONFIG_RELOCATABLE)
+#define EX_CTR		72
+.if EX_SIZE != 10
+	.error "EX_SIZE is wrong"
+.endif
+#else
+.if EX_SIZE != 9
+	.error "EX_SIZE is wrong"
+.endif
+#endif
+
 /*
  * We're short on space and time in the exception prolog, so we can't
  * use the normal LOAD_REG_IMMEDIATE macro to load the address of label.
-- 
2.20.1


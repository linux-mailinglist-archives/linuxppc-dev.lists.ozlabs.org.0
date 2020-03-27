Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99ED81951B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 08:06:02 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXvC4H6CzDqYB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:05:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LzKtTtUh; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pXsL5r3TzDqCw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 18:04:22 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id q3so4046930pff.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 00:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F02UZwhBwdgldCLcU0Iivu17Y6S1Ck0a6L3YUXwaaWg=;
 b=LzKtTtUhy37I41mCTLtim9Fd8tZaf+bcL5IhPv7R9wOkkGBIMn17816O+VGD/qMDEw
 5jy4Goz4zJgGODSjXlu6w+UcWROOGygcvNZU6+2/Y28M/5X/d0w9uyPkT72WhoJ/ALNn
 z8ssjtwrYOx4+USclLM9c4dhUaVPDK/CP0N19gHhV/v59DASZlD7IPO6EK/QDayNI3S6
 hzSRM1sT4CyfMao5py06WIvd8L/vohj2m4TlYTm1QdkiKLGnuGQwuLZlHbZnR3+Sbfiy
 TNsULtUjGxudeK7Sa/I7BHg9OwiSJ82UZI02sZLXxiyD7tn2O5TeFcj1mm7DTn9587re
 64Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=F02UZwhBwdgldCLcU0Iivu17Y6S1Ck0a6L3YUXwaaWg=;
 b=IR+QQ6brAtTLyRH8Ryy1szUG2vIhXVrUOQ5pa0kEhisfyGpQGNFIP5KLZaWMPc0kSu
 bXhQARhY3NxOV7G/SPYz1JgEvaSwtp2bMwqU6/9yXCb6F2LCpb64zdFuxxlLp5DppPGk
 LsgSM7nuOqagFwqckHrBhVwYoi5ma5WEZ+OEuWtVsVM0EAn3/ACZQH9OzJx/FJelz8ah
 nfsh7/Eakwwxn4YFcR06ina2RHq+t64HxlUOp0StBXvCzDyDJ+2gTjq2PwsqbE0ZB7Ce
 nAYCah8DdCJpeuET0joQibWkgk+oG7xO2lqebtoTA7gWG1ujeoHiOIroa8skhchCZZj2
 98bA==
X-Gm-Message-State: ANhLgQ0rsbYbN+q2bWyGu8+Uo96/FVPYcPOYFu5gdpse7wEDpMxTuPuv
 u3Dt74Dlo1jRM+yx8SvDDw0GBC26
X-Google-Smtp-Source: ADFU+vubO6Za2z1He/l/5J5VbsZ6WFXVJbYZWEZYcXti+zepB781EyDzTFL97RjQ+GDcOUL6Zp0d5Q==
X-Received: by 2002:a63:9c4:: with SMTP id 187mr12271361pgj.389.1585292659051; 
 Fri, 27 Mar 2020 00:04:19 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id s98sm3075805pjb.46.2020.03.27.00.04.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 00:04:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/64s: implement probe_kernel_read/write without
 touching AMR
Date: Fri, 27 Mar 2020 17:02:37 +1000
Message-Id: <20200327070240.427074-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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

There is no need to allow user accesses when probing kernel addresses.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/uaccess.h | 25 ++++++++++-----
 arch/powerpc/lib/Makefile          |  2 +-
 arch/powerpc/lib/uaccess.c         | 50 ++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 9 deletions(-)
 create mode 100644 arch/powerpc/lib/uaccess.c

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 2f500debae21..670910df3cc7 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -341,8 +341,8 @@ raw_copy_in_user(void __user *to, const void __user *from, unsigned long n)
 }
 #endif /* __powerpc64__ */
 
-static inline unsigned long raw_copy_from_user(void *to,
-		const void __user *from, unsigned long n)
+static inline unsigned long
+raw_copy_from_user_allowed(void *to, const void __user *from, unsigned long n)
 {
 	unsigned long ret;
 	if (__builtin_constant_p(n) && (n <= 8)) {
@@ -351,19 +351,19 @@ static inline unsigned long raw_copy_from_user(void *to,
 		switch (n) {
 		case 1:
 			barrier_nospec();
-			__get_user_size(*(u8 *)to, from, 1, ret);
+			__get_user_size_allowed(*(u8 *)to, from, 1, ret);
 			break;
 		case 2:
 			barrier_nospec();
-			__get_user_size(*(u16 *)to, from, 2, ret);
+			__get_user_size_allowed(*(u16 *)to, from, 2, ret);
 			break;
 		case 4:
 			barrier_nospec();
-			__get_user_size(*(u32 *)to, from, 4, ret);
+			__get_user_size_allowed(*(u32 *)to, from, 4, ret);
 			break;
 		case 8:
 			barrier_nospec();
-			__get_user_size(*(u64 *)to, from, 8, ret);
+			__get_user_size_allowed(*(u64 *)to, from, 8, ret);
 			break;
 		}
 		if (ret == 0)
@@ -371,9 +371,18 @@ static inline unsigned long raw_copy_from_user(void *to,
 	}
 
 	barrier_nospec();
-	allow_read_from_user(from, n);
 	ret = __copy_tofrom_user((__force void __user *)to, from, n);
-	prevent_read_from_user(from, n);
+	return ret;
+}
+
+static inline unsigned long
+raw_copy_from_user(void *to, const void __user *from, unsigned long n)
+{
+	unsigned long ret;
+
+	allow_read_from_user(to, n);
+	ret = raw_copy_from_user_allowed(to, from, n);
+	prevent_read_from_user(to, n);
 	return ret;
 }
 
diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
index b8de3be10eb4..a15060b5008e 100644
--- a/arch/powerpc/lib/Makefile
+++ b/arch/powerpc/lib/Makefile
@@ -36,7 +36,7 @@ extra-$(CONFIG_PPC64)	+= crtsavres.o
 endif
 
 obj-$(CONFIG_PPC_BOOK3S_64) += copyuser_power7.o copypage_power7.o \
-			       memcpy_power7.o
+			       memcpy_power7.o uaccess.o
 
 obj64-y	+= copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
 	   memcpy_64.o memcpy_mcsafe_64.o
diff --git a/arch/powerpc/lib/uaccess.c b/arch/powerpc/lib/uaccess.c
new file mode 100644
index 000000000000..0057ab52d6fe
--- /dev/null
+++ b/arch/powerpc/lib/uaccess.c
@@ -0,0 +1,50 @@
+#include <linux/mm.h>
+#include <linux/uaccess.h>
+
+static __always_inline long
+probe_read_common(void *dst, const void __user *src, size_t size)
+{
+	long ret;
+
+	pagefault_disable();
+	ret = raw_copy_from_user_allowed(dst, src, size);
+	pagefault_enable();
+
+	return ret ? -EFAULT : 0;
+}
+
+static __always_inline long
+probe_write_common(void __user *dst, const void *src, size_t size)
+{
+	long ret;
+
+	pagefault_disable();
+	ret = raw_copy_to_user_allowed(dst, src, size);
+	pagefault_enable();
+
+	return ret ? -EFAULT : 0;
+}
+
+long probe_kernel_read(void *dst, const void *src, size_t size)
+{
+	long ret;
+	mm_segment_t old_fs = get_fs();
+
+	set_fs(KERNEL_DS);
+	ret = probe_read_common(dst, (__force const void __user *)src, size);
+	set_fs(old_fs);
+
+	return ret;
+}
+
+long probe_kernel_write(void *dst, const void *src, size_t size)
+{
+	long ret;
+	mm_segment_t old_fs = get_fs();
+
+	set_fs(KERNEL_DS);
+	ret = probe_write_common((__force void __user *)dst, src, size);
+	set_fs(old_fs);
+
+	return ret;
+}
-- 
2.23.0


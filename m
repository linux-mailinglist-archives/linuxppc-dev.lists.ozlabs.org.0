Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 112181951BB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 08:10:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pY0m6QCDzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 18:10:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rbwtyKUo; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pXsV3lYLzDqYJ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 18:04:30 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id l36so3480996pjb.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 00:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zqTn5wDRyVl1agDWVaLPJJ+hMiVwWP9czCnmC0dbaXE=;
 b=rbwtyKUoA9jOn0M4odkS1DBQVYYsWhnY0pQWYUauJJvNpPxE1C+NgkS8DkATxnsscW
 0hK1Oq+PjnI0JN980ewBIfhqyoX5V7muXgU4MQiI998EqbAOCJEMBP8OpD9lMdNjBKKw
 9oReBzOdGYCMaFqaMUNxYLg8dKI/ZYxODSrSNOQA9a9GisJn2sVQj+YwbQt7HBf3yppG
 q+BUw3hs+2roO2D6aWkX/AGxYDvAVWEOBLyeXKCF4ZuMH6mwG48WqVpqHIm+xPjkSjC+
 p8KZza4KKnCLc2ehGqNlMgvbI0mg4Hr3swaa7ycA+4dStmArvmQQgLEGWs91WSjHxfCU
 WAOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zqTn5wDRyVl1agDWVaLPJJ+hMiVwWP9czCnmC0dbaXE=;
 b=K8x2w02jt9safiFM6vmpGJn4ThfU7Yqk+Qdw1VJ4OnQ2lA8UA3bFsp9FDf8D//fPae
 +LqTgLo+S/ar6E5yQY6DRX1u1qq0qA8oNRnd3xUyxl8I4GXRgPXEY6N1eUZa9MqFnJtS
 3D5HLGZ+3MbkyaDV4RstCU40pJzqqaPINFZmHph2nMoREaERWAFSWOjD1X+xAR4zI48b
 FR/PNzD9EBuZu9c0CF6W5sJRWdENqHCnXclTddni2vseqx2ldTofoeBM3OFEt0HiZNk5
 nqpQEVbaEVKTw/aGSznlScYWJm+afn1WCJJdOeJtYo77CPyLRJmRUv0bxqqfSzXCOFWo
 i3tg==
X-Gm-Message-State: ANhLgQ1utgSE4G5+Kx2YtVkKp4KpYebgYS3BKpDAJMAl1MmMznLiBnCs
 RkOBZGzz+qflyo+QtwLFFDnqhEfH
X-Google-Smtp-Source: ADFU+vuPkVF+0JGNbJ33b/1SrYsjAMgYn7k04t8eKw0dm3BKW65TpwRU8tGbWYrsqvPt9dke4NTWTA==
X-Received: by 2002:a17:90a:3188:: with SMTP id
 j8mr4231206pjb.82.1585292668294; 
 Fri, 27 Mar 2020 00:04:28 -0700 (PDT)
Received: from bobo.ibm.com (14-202-190-183.tpgi.com.au. [14.202.190.183])
 by smtp.gmail.com with ESMTPSA id s98sm3075805pjb.46.2020.03.27.00.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Mar 2020 00:04:27 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/uaccess: add more __builtin_expect annotations
Date: Fri, 27 Mar 2020 17:02:40 +1000
Message-Id: <20200327070240.427074-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200327070240.427074-1-npiggin@gmail.com>
References: <20200327070240.427074-1-npiggin@gmail.com>
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

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/uaccess.h | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 1cf8595aeef1..896d43d8c891 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -48,16 +48,16 @@ static inline void set_fs(mm_segment_t fs)
  * gap between user addresses and the kernel addresses
  */
 #define __access_ok(addr, size, segment)	\
-	(((addr) <= (segment).seg) && ((size) <= (segment).seg))
+	likely(((addr) <= (segment).seg) && ((size) <= (segment).seg))
 
 #else
 
 static inline int __access_ok(unsigned long addr, unsigned long size,
 			mm_segment_t seg)
 {
-	if (addr > seg.seg)
+	if (unlikely(addr > seg.seg))
 		return 0;
-	return (size == 0 || size - 1 <= seg.seg - addr);
+	return likely(size == 0 || size - 1 <= seg.seg - addr);
 }
 
 #endif
@@ -177,7 +177,7 @@ do {								\
 	else							\
 		__put_user_size_allowed(__pu_val, __pu_addr, __pu_size, __pu_err); \
 								\
-	__pu_err;						\
+	__builtin_expect(__pu_err, 0);				\
 })
 
 #define __put_user_check(x, ptr, size)				\
@@ -191,7 +191,7 @@ do {								\
 	if (access_ok(__pu_addr, __pu_size))			\
 		__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
 								\
-	__pu_err;						\
+	__builtin_expect(__pu_err, 0);				\
 })
 
 #define __put_user_nosleep(x, ptr, size)			\
@@ -204,7 +204,7 @@ do {								\
 	__chk_user_ptr(__pu_addr);				\
 	__put_user_size(__pu_val, __pu_addr, __pu_size, __pu_err); \
 								\
-	__pu_err;						\
+	__builtin_expect(__pu_err, 0);				\
 })
 
 
@@ -307,7 +307,7 @@ do {								\
 		__get_user_size_allowed(__gu_val, __gu_addr, __gu_size, __gu_err); \
 	(x) = (__typeof__(*(ptr)))__gu_val;			\
 								\
-	__gu_err;						\
+	__builtin_expect(__gu_err, 0);				\
 })
 
 #define __get_user_check(x, ptr, size)				\
@@ -324,7 +324,7 @@ do {								\
 	}							\
 	(x) = (__force __typeof__(*(ptr)))__gu_val;		\
 								\
-	__gu_err;						\
+	__builtin_expect(__gu_err, 0);				\
 })
 
 #define __get_user_nosleep(x, ptr, size)			\
@@ -339,7 +339,7 @@ do {								\
 	__get_user_size(__gu_val, __gu_addr, __gu_size, __gu_err); \
 	(x) = (__force __typeof__(*(ptr)))__gu_val;		\
 								\
-	__gu_err;						\
+	__builtin_expect(__gu_err, 0);				\
 })
 
 
-- 
2.23.0


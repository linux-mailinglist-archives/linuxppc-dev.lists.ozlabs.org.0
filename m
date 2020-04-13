Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F2D1A6CDB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 21:53:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491K6n62r7zDqNb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 05:53:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::343;
 helo=mail-ot1-x343.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Q0dRq4el; dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491K5C2CMLzDqM7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:51:58 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id b13so6110056oti.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 12:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/SNyg00K2RwmSQDXWhtQELp/kcSR3KGW1LXJbdnOpQ=;
 b=Q0dRq4ely6RLAhSX1StR+9Jf6tB4Yl0Ok6oR0atbLDcb1iA2l0vmDteomZyJ+dSL/Y
 XN7LVUBsBQc2bT7C+rsDXdoB4vcCqbmZe0gOV/JqE8EXsdzLcrWi2PPQoA+pfMpKqy3c
 iQufiEA8rCbCz11dbUWli0jZiyDSBAjzSA7irsk4EqXsKrl+PaifM+/YbhXw8zf/OLwM
 TFLvOP0UtL1VOuHsn6PRo52Jg2slpcEYsrli+mIajGYDQZoVryZXRUCH8lsi1H6g6bJs
 m6voCiHeABFVW+ZjC6xogpek8bqMjnmhiUTuvFHqW3lf+Z0hVUi0a+OOsgkKv66Q9MNs
 ZSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9/SNyg00K2RwmSQDXWhtQELp/kcSR3KGW1LXJbdnOpQ=;
 b=eVD756wamWlpziiOegAgUolgKP4I+9iTerIRC6rxmOASiKlzjonqtU5H8k+r0zSzMK
 O/H+unTpvT5I8JI0aRaKy9Nzx2sjS6HpJE/4S50M9M6gz5sYMppnVhXu6YbmyjKB1qpp
 lyxOR/YkmiEh7MUrx9QuC8W9pJ41diO8G9XPueticBfN+mnrtAxmEdaOSngRjTH49p7e
 6nyQYbSLIaknZS5pVUHOsrUWujtt7kRy++jPIHNUPWEnnNJZDrzSShuam7dVo8j0NlEu
 kKURy3sqrmcWc4csCKjY1TLKgKlvwdwebAjnEVU85EdlmqJrIBFIAHcQW6wpoRi20Xf+
 YhoQ==
X-Gm-Message-State: AGi0PualCP2TeBsk4twZDz9jQ9/NAotl8HOklofNSZy1aQMQFcvZNREL
 hMF6BfuuYySNp1EagL6iBKY=
X-Google-Smtp-Source: APiQypKcyBXUAjalJbfVVO3djNnYHVDw1NxMcM9ZBwADCdMrg+lhgj5MBPG1RZm/TdnV09v9osC1lQ==
X-Received: by 2002:a4a:95ee:: with SMTP id p43mr15297173ooi.24.1586807517032; 
 Mon, 13 Apr 2020 12:51:57 -0700 (PDT)
Received: from localhost.localdomain ([2604:1380:4111:8b00::3])
 by smtp.gmail.com with ESMTPSA id t193sm5062852oif.34.2020.04.13.12.51.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 12:51:56 -0700 (PDT)
From: Nathan Chancellor <natechancellor@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] lib/mpi: Fix building for powerpc with clang
Date: Mon, 13 Apr 2020 12:50:42 -0700
Message-Id: <20200413195041.24064-1-natechancellor@gmail.com>
X-Mailer: git-send-email 2.26.0
MIME-Version: 1.0
X-Patchwork-Bot: notify
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
Cc: kbuild test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linux-crypto@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

0day reports over and over on an powerpc randconfig with clang:

lib/mpi/generic_mpih-mul1.c:37:13: error: invalid use of a cast in a
inline asm context requiring an l-value: remove the cast or build with
-fheinous-gnu-extensions

Remove the superfluous casts, which have been done previously for x86
and arm32 in commit dea632cadd12 ("lib/mpi: fix build with clang") and
commit 7b7c1df2883d ("lib/mpi/longlong.h: fix building with 32-bit
x86").

Reported-by: kbuild test robot <lkp@intel.com>
Link: https://github.com/ClangBuiltLinux/linux/issues/991
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

Herbet seems to take lib/mpi patches but there does not seem to be a
formal maintainer so Michael could take it since it is just a powerpc
thing.

 lib/mpi/longlong.h | 34 +++++++++++++++++-----------------
 1 file changed, 17 insertions(+), 17 deletions(-)

diff --git a/lib/mpi/longlong.h b/lib/mpi/longlong.h
index 2dceaca27489..891e1c3549c4 100644
--- a/lib/mpi/longlong.h
+++ b/lib/mpi/longlong.h
@@ -722,22 +722,22 @@ do {									\
 do { \
 	if (__builtin_constant_p(bh) && (bh) == 0) \
 		__asm__ ("{a%I4|add%I4c} %1,%3,%4\n\t{aze|addze} %0,%2" \
-		: "=r" ((USItype)(sh)), \
-		"=&r" ((USItype)(sl)) \
+		: "=r" (sh), \
+		"=&r" (sl) \
 		: "%r" ((USItype)(ah)), \
 		"%r" ((USItype)(al)), \
 		"rI" ((USItype)(bl))); \
 	else if (__builtin_constant_p(bh) && (bh) == ~(USItype) 0) \
 		__asm__ ("{a%I4|add%I4c} %1,%3,%4\n\t{ame|addme} %0,%2" \
-		: "=r" ((USItype)(sh)), \
-		"=&r" ((USItype)(sl)) \
+		: "=r" (sh), \
+		"=&r" (sl) \
 		: "%r" ((USItype)(ah)), \
 		"%r" ((USItype)(al)), \
 		"rI" ((USItype)(bl))); \
 	else \
 		__asm__ ("{a%I5|add%I5c} %1,%4,%5\n\t{ae|adde} %0,%2,%3" \
-		: "=r" ((USItype)(sh)), \
-		"=&r" ((USItype)(sl)) \
+		: "=r" (sh), \
+		"=&r" (sl) \
 		: "%r" ((USItype)(ah)), \
 		"r" ((USItype)(bh)), \
 		"%r" ((USItype)(al)), \
@@ -747,36 +747,36 @@ do { \
 do { \
 	if (__builtin_constant_p(ah) && (ah) == 0) \
 		__asm__ ("{sf%I3|subf%I3c} %1,%4,%3\n\t{sfze|subfze} %0,%2" \
-		: "=r" ((USItype)(sh)), \
-		"=&r" ((USItype)(sl)) \
+		: "=r" (sh), \
+		"=&r" (sl) \
 		: "r" ((USItype)(bh)), \
 		"rI" ((USItype)(al)), \
 		"r" ((USItype)(bl))); \
 	else if (__builtin_constant_p(ah) && (ah) == ~(USItype) 0) \
 		__asm__ ("{sf%I3|subf%I3c} %1,%4,%3\n\t{sfme|subfme} %0,%2" \
-		: "=r" ((USItype)(sh)), \
-		"=&r" ((USItype)(sl)) \
+		: "=r" (sh), \
+		"=&r" (sl) \
 		: "r" ((USItype)(bh)), \
 		"rI" ((USItype)(al)), \
 		"r" ((USItype)(bl))); \
 	else if (__builtin_constant_p(bh) && (bh) == 0) \
 		__asm__ ("{sf%I3|subf%I3c} %1,%4,%3\n\t{ame|addme} %0,%2" \
-		: "=r" ((USItype)(sh)), \
-		"=&r" ((USItype)(sl)) \
+		: "=r" (sh), \
+		"=&r" (sl) \
 		: "r" ((USItype)(ah)), \
 		"rI" ((USItype)(al)), \
 		"r" ((USItype)(bl))); \
 	else if (__builtin_constant_p(bh) && (bh) == ~(USItype) 0) \
 		__asm__ ("{sf%I3|subf%I3c} %1,%4,%3\n\t{aze|addze} %0,%2" \
-		: "=r" ((USItype)(sh)), \
-		"=&r" ((USItype)(sl)) \
+		: "=r" (sh), \
+		"=&r" (sl) \
 		: "r" ((USItype)(ah)), \
 		"rI" ((USItype)(al)), \
 		"r" ((USItype)(bl))); \
 	else \
 		__asm__ ("{sf%I4|subf%I4c} %1,%5,%4\n\t{sfe|subfe} %0,%3,%2" \
-		: "=r" ((USItype)(sh)), \
-		"=&r" ((USItype)(sl)) \
+		: "=r" (sh), \
+		"=&r" (sl) \
 		: "r" ((USItype)(ah)), \
 		"r" ((USItype)(bh)), \
 		"rI" ((USItype)(al)), \
@@ -787,7 +787,7 @@ do { \
 do { \
 	USItype __m0 = (m0), __m1 = (m1); \
 	__asm__ ("mulhwu %0,%1,%2" \
-	: "=r" ((USItype) ph) \
+	: "=r" (ph) \
 	: "%r" (__m0), \
 	"r" (__m1)); \
 	(pl) = __m0 * __m1; \

base-commit: 8f3d9f354286745c751374f5f1fcafee6b3f3136
-- 
2.26.0


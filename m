Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1152E6AB266
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 22:04:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDjx6pJTz3fDq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 08:04:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NXbVUoif;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NXbVUoif;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDXy2vLGz3cLW
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:57:06 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id a25so31041712edb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:57:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oXoBl7+op9aWSq5Dkg0e/fVhHu4Qq2D4107mPK7NLLs=;
        b=NXbVUoifiR5f9wJbmip3eWTWXYXEwmyaIdEBNnfCyRdyAk7zaaXRY0sYnfJRGWuLAS
         g8x59fLsFLmo5M3Ik3s/tk1KKBZCczl1Fgw42WTZOWS04DzPYnwi4w55o7h+c+eVefjA
         yGaHfjFFSAxNqbiQZpqt3i+u6y2V2BkU7O67/5ecoxTFpwzclUj8SQCgKdL2w7dE53dA
         5xMBuutmSq1NOS9h1Fdt7g9A/4eDJZHogsS6RiAAuXcSEX6dnzhJIQ7F1HTmc/YOQoP6
         jsa1rwU2ODNFy+VyW2rjw0v/ilyUvuIGQPs1yrtAiQeKZDT2jOBr7m4vLNyVajzwbMKC
         dB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oXoBl7+op9aWSq5Dkg0e/fVhHu4Qq2D4107mPK7NLLs=;
        b=rSWiAuT2q2cf2FqyVZQE+yCAz8CVPGiCB7itUwie/90ZzjOCyQ4WPofP79R3GDKaWl
         sdWOhHjG+HEoqobQLbkZC9Zu1YLZHmv7FMyByFzQE66bAnOcS0Mey6UenPnYjrio+6T+
         e9pVrh35g2Fz2HqvYagkPkdi0cR0JawSkE2K03J6hj41JLeANGCaVqSKooE7cRFxjTfT
         bhUnBosiX3XQ/M5AmAAU9lo52+hfjtqIy0BHaNXSZNjQ5fal/No4o8JtP+jUD3jIguSE
         xPDOpqHFI6ygzmL4vn/Nbn8g7AXFnu3qnGrooAph4YAoG6kFLsqWiKWeT19xPfZo5p5u
         xWPQ==
X-Gm-Message-State: AO0yUKVsiMzhtmJOEfaRea9WmR6JETopKmgYs/DhzLedPBh23SDroXzV
	cD+Y0jvJlr7zqfPwHYvdEBI=
X-Google-Smtp-Source: AK7set82bFu6nQYw7chShTqd/Oc7Lhw2Ixl//LUdtfoQSZu7/ZtYQcw9c6CERUPnPhuuiN2uS3xPww==
X-Received: by 2002:a17:907:8c8a:b0:8ee:babc:d2dd with SMTP id td10-20020a1709078c8a00b008eebabcd2ddmr7854988ejc.18.1678049825779;
        Sun, 05 Mar 2023 12:57:05 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:05 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 08/10] locking/generic: Wire up local{,64}_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:26 +0100
Message-Id: <20230305205628.27385-9-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
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
Cc: Uros Bizjak <ubizjak@gmail.com>, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement generic support for local{,64}_try_cmpxchg.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/asm-generic/local.h   | 1 +
 include/asm-generic/local64.h | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/include/asm-generic/local.h b/include/asm-generic/local.h
index fca7f1d84818..7f97018df66f 100644
--- a/include/asm-generic/local.h
+++ b/include/asm-generic/local.h
@@ -42,6 +42,7 @@ typedef struct
 #define local_inc_return(l) atomic_long_inc_return(&(l)->a)
 
 #define local_cmpxchg(l, o, n) atomic_long_cmpxchg((&(l)->a), (o), (n))
+#define local_try_cmpxchg(l, po, n) atomic_long_try_cmpxchg((&(l)->a), (po), (n))
 #define local_xchg(l, n) atomic_long_xchg((&(l)->a), (n))
 #define local_add_unless(l, _a, u) atomic_long_add_unless((&(l)->a), (_a), (u))
 #define local_inc_not_zero(l) atomic_long_inc_not_zero(&(l)->a)
diff --git a/include/asm-generic/local64.h b/include/asm-generic/local64.h
index 765be0b7d883..54b91e93ae76 100644
--- a/include/asm-generic/local64.h
+++ b/include/asm-generic/local64.h
@@ -43,6 +43,7 @@ typedef struct {
 #define local64_inc_return(l)	local_inc_return(&(l)->a)
 
 #define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
+#define local64_try_cmpxchg(l, po, n) local_try_cmpxchg((&(l)->a), (po), (n))
 #define local64_xchg(l, n)	local_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) local_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	local_inc_not_zero(&(l)->a)
@@ -81,6 +82,7 @@ typedef struct {
 #define local64_inc_return(l)	atomic64_inc_return(&(l)->a)
 
 #define local64_cmpxchg(l, o, n) atomic64_cmpxchg((&(l)->a), (o), (n))
+#define local64_try_cmpxchg(l, po, n) atomic64_try_cmpxchg((&(l)->a), (po), (n))
 #define local64_xchg(l, n)	atomic64_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) atomic64_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	atomic64_inc_not_zero(&(l)->a)
-- 
2.39.2


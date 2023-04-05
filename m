Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B426D7F25
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 16:19:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps6Fw03bRz3fBk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 00:19:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h6B0D1gu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52d; helo=mail-ed1-x52d.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h6B0D1gu;
	dkim-atps=neutral
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps6D35lcHz3bW0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 00:17:55 +1000 (AEST)
Received: by mail-ed1-x52d.google.com with SMTP id cn12so141516344edb.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Apr 2023 07:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680704270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Aezn9KwOiaMHT8QBIvXqxw3/7pRoTbwoU4+L6kaZfo=;
        b=h6B0D1guAAz/+Fh3o2MFRuBp2njF7Fye/Xxf2r9nX8V7xNi91MOio5aDjUQBXijRT0
         75EwXqWNYR/1gi60t0DEKttu9WLaqB3/MY8gXnTwiu4Oz4MkVmFrs2JDhb+L8fnPcptQ
         7nrJoQYBcxE0Ipea11+gFcYnJH92f8uuVoDqyuTltBWba1oiCcF6uWTEYtwCT5xdTLlI
         qcI67O3MKKtm2Ll2/izFTSnFMbusRse/8HmyoHl63V/KzowbwYrV1X/+8pt5J0I287/X
         g/ngG/l9UiDfge5nIclREoyJnIxf0VVxBnBlDK8hGh94SIMNrCXES8Wpb/gmo+IR/6pP
         21wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680704270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Aezn9KwOiaMHT8QBIvXqxw3/7pRoTbwoU4+L6kaZfo=;
        b=TmUsI6lR5CuSzOiKnd036Vtz+c0/LF7OXGMgD5KDE1vpMvkR6vUrSkweF2+arrLP3n
         Gewe2cF525Y1wejN9ES63lW+fmXUk9j/HABcJaSCB+YVeQRRsD84y9v85jImilAAfdYh
         xwQK7tFIllzyD+6N7OtsF/X9B46WNTwYJIzgjZeD9jIngZHylAZSJL43FYsb2NozAyOA
         TDz/quSIJ+jWRbdgW6A5hNYetEHDPLdzMCzyv9U4VkZ2A/VQ3kGBhmSx+LEEBwV/5d4N
         5nDZXUzENGLdUlaolyjF5yuNptvvaibo3UJFj5m5v0AmWGQ84m1pNXOxqxMIipU7PRdK
         wGjA==
X-Gm-Message-State: AAQBX9eu1xj7cJHIqC1Pl/9DBVPanMpXRS0NtBcBix0wPsxrAfvy73zg
	qByxXOCGdpY+OSbseTlhm+I=
X-Google-Smtp-Source: AKy350Z/3xgh/xSykpZuUX3JQoJOOenna0pCFqtY30j4WZoVD6fIcb1JmDg2U9Ji+C4VhgW2S0ytyw==
X-Received: by 2002:a17:906:d977:b0:8b0:f277:5cde with SMTP id rp23-20020a170906d97700b008b0f2775cdemr3133825ejb.32.1680704270128;
        Wed, 05 Apr 2023 07:17:50 -0700 (PDT)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id g6-20020a170906348600b009334219656dsm7381246ejb.56.2023.04.05.07.17.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 07:17:49 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] locking/generic: Wire up local{,64}_try_cmpxchg
Date: Wed,  5 Apr 2023 16:17:07 +0200
Message-Id: <20230405141710.3551-3-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230405141710.3551-1-ubizjak@gmail.com>
References: <20230405141710.3551-1-ubizjak@gmail.com>
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

Redirect to the atomic_ family of functions when the target
does not provide its own local.h definitions.

For 64-bit targets, implement local64_try_cmpxchg and
local64_cmpxchg using typed C wrappers that call local_
family of functions and provide additional checking
of their input arguments.

Cc: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/asm-generic/local.h   |  1 +
 include/asm-generic/local64.h | 12 +++++++++++-
 2 files changed, 12 insertions(+), 1 deletion(-)

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
index 765be0b7d883..14963a7a6253 100644
--- a/include/asm-generic/local64.h
+++ b/include/asm-generic/local64.h
@@ -42,7 +42,16 @@ typedef struct {
 #define local64_sub_return(i, l) local_sub_return((i), (&(l)->a))
 #define local64_inc_return(l)	local_inc_return(&(l)->a)
 
-#define local64_cmpxchg(l, o, n) local_cmpxchg((&(l)->a), (o), (n))
+static inline s64 local64_cmpxchg(local64_t *l, s64 old, s64 new)
+{
+	return local_cmpxchg(&l->a, old, new);
+}
+
+static inline bool local64_try_cmpxchg(local64_t *l, s64 *old, s64 new)
+{
+	return local_try_cmpxchg(&l->a, (long *)old, new);
+}
+
 #define local64_xchg(l, n)	local_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) local_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	local_inc_not_zero(&(l)->a)
@@ -81,6 +90,7 @@ typedef struct {
 #define local64_inc_return(l)	atomic64_inc_return(&(l)->a)
 
 #define local64_cmpxchg(l, o, n) atomic64_cmpxchg((&(l)->a), (o), (n))
+#define local64_try_cmpxchg(l, po, n) atomic64_try_cmpxchg((&(l)->a), (po), (n))
 #define local64_xchg(l, n)	atomic64_xchg((&(l)->a), (n))
 #define local64_add_unless(l, _a, u) atomic64_add_unless((&(l)->a), (_a), (u))
 #define local64_inc_not_zero(l)	atomic64_inc_not_zero(&(l)->a)
-- 
2.39.2


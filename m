Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB926AB257
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 21:58:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDZm4TX9z3cJv
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 07:58:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=asi5utLd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=asi5utLd;
	dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDXp6mvcz30QS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:56:57 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id a25so31040684edb.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:56:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nVG2kgy9F760CmPn8vSVrkbNIw0KpbygTeYMJL/3wHc=;
        b=asi5utLdWW1N1er0bksuBA8v5b1amWbTv0KOBvgiy8Iq2U+koWsRhR6IqIsB96ZzFo
         RMdO6VENOxHuzI8q6i57ivzsrmds+Qydp0zIcueL5R8/WPuPDj9jwqzGDYz4blWiwMSf
         /W0Z5E6D9C9cNRhuSPhtp98V3I7py6Lt7d3OmAEFtC0xVTDC5m4jYRUFC88j+LQU2U/b
         /rY2VlSnb0DKov6ld71YIylJ++dgLrjqmYWE382OJOZPVSfs/nR5zWbNwRgfUBiF/lnX
         uTxnaw9+jBV/4QcQgK2Dgh2w2pTgCVdFrY9WfPDrzRcXWeoA8lOM2hU2keXlcv7RSB4Q
         ijnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nVG2kgy9F760CmPn8vSVrkbNIw0KpbygTeYMJL/3wHc=;
        b=lAvZ9PDJO0bPLEmOLYJPN7Z2mJwT9thxk2pbMLgtxgtyEgVfvTIX0uiWupLf7X+19W
         33/ayGmuj5LwaTHANH5S1CPjToDqk8Pc1RPk6qqVM8cFR5nSkdparYyK8xu+Z0baGH6w
         MzMgG+y8akYKzcOoMAASMNynSvw0g52y8bPeUY2TcOm+CG4kAdQe1VxSMKQDW+ASaCi+
         fU9R+QeKA3hzizC+RDjyJOv3Y27d/WFdJarxYBQoEus0R0jcZDd8P09NZz67ScUEmG00
         XDxqBel52is4oMsgytnSzmi65xiCmWpNJMTR/B6ugoSyvNZQWXsR+NE6eb0l3FNsNR8z
         JTMw==
X-Gm-Message-State: AO0yUKVquRgz5KEjVGiYcWhOwsPfWwlAcTJC3+QE6DkGbZ8DZ9DOOR+J
	dPcEFgupV2aE8+y50OSZu/s=
X-Google-Smtp-Source: AK7set+RJQKs9QlFP/fuW0+0r4cthBgsbcujjamf/UFg8WkoC4IrOQHMZQcJaAn7QEfYYDX6cVoXeg==
X-Received: by 2002:a17:907:3f18:b0:8f6:5a70:cccc with SMTP id hq24-20020a1709073f1800b008f65a70ccccmr11620167ejc.66.1678049814399;
        Sun, 05 Mar 2023 12:56:54 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:56:54 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 01/10] locking/atomic: Add missing cast to try_cmpxchg() fallbacks
Date: Sun,  5 Mar 2023 21:56:19 +0100
Message-Id: <20230305205628.27385-2-ubizjak@gmail.com>
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
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Uros Bizjak <ubizjak@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Cast _oldp to the type of _ptr to avoid incompatible-pointer-types warning.

Fixes: 29f006fdefe6 ("asm-generic/atomic: Add try_cmpxchg() fallbacks")
Cc: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 include/linux/atomic/atomic-arch-fallback.h | 18 +++++++++---------
 scripts/atomic/gen-atomic-fallback.sh       |  2 +-
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/include/linux/atomic/atomic-arch-fallback.h b/include/linux/atomic/atomic-arch-fallback.h
index 77bc5522e61c..19debd501ee7 100644
--- a/include/linux/atomic/atomic-arch-fallback.h
+++ b/include/linux/atomic/atomic-arch-fallback.h
@@ -87,7 +87,7 @@
 #ifndef arch_try_cmpxchg
 #define arch_try_cmpxchg(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -98,7 +98,7 @@
 #ifndef arch_try_cmpxchg_acquire
 #define arch_try_cmpxchg_acquire(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg_acquire((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -109,7 +109,7 @@
 #ifndef arch_try_cmpxchg_release
 #define arch_try_cmpxchg_release(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg_release((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -120,7 +120,7 @@
 #ifndef arch_try_cmpxchg_relaxed
 #define arch_try_cmpxchg_relaxed(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg_relaxed((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -157,7 +157,7 @@
 #ifndef arch_try_cmpxchg64
 #define arch_try_cmpxchg64(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -168,7 +168,7 @@
 #ifndef arch_try_cmpxchg64_acquire
 #define arch_try_cmpxchg64_acquire(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64_acquire((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -179,7 +179,7 @@
 #ifndef arch_try_cmpxchg64_release
 #define arch_try_cmpxchg64_release(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64_release((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -190,7 +190,7 @@
 #ifndef arch_try_cmpxchg64_relaxed
 #define arch_try_cmpxchg64_relaxed(_ptr, _oldp, _new) \
 ({ \
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \
 	___r = arch_cmpxchg64_relaxed((_ptr), ___o, (_new)); \
 	if (unlikely(___r != ___o)) \
 		*___op = ___r; \
@@ -2456,4 +2456,4 @@ arch_atomic64_dec_if_positive(atomic64_t *v)
 #endif
 
 #endif /* _LINUX_ATOMIC_FALLBACK_H */
-// b5e87bdd5ede61470c29f7a7e4de781af3770f09
+// 1b4d4c82ae653389cd1538d5b07170267d9b3837
diff --git a/scripts/atomic/gen-atomic-fallback.sh b/scripts/atomic/gen-atomic-fallback.sh
index 3a07695e3c89..39f447161108 100755
--- a/scripts/atomic/gen-atomic-fallback.sh
+++ b/scripts/atomic/gen-atomic-fallback.sh
@@ -171,7 +171,7 @@ cat <<EOF
 #ifndef arch_try_${cmpxchg}${order}
 #define arch_try_${cmpxchg}${order}(_ptr, _oldp, _new) \\
 ({ \\
-	typeof(*(_ptr)) *___op = (_oldp), ___o = *___op, ___r; \\
+	typeof(*(_ptr)) *___op = (typeof(_ptr))(_oldp), ___o = *___op, ___r; \\
 	___r = arch_${cmpxchg}${order}((_ptr), ___o, (_new)); \\
 	if (unlikely(___r != ___o)) \\
 		*___op = ___r; \\
-- 
2.39.2


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EB3292C56FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Nov 2020 15:21:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Chg0y1H7XzDqgM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Nov 2020 01:21:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4ChdRB3sjTzDqZm
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 00:10:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=IgnI9oqb; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4ChdR849Qkz9sWk; Fri, 27 Nov 2020 00:10:28 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4ChdR73FXgz9sWj; Fri, 27 Nov 2020 00:10:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1606396227;
 bh=X6vxgwhiTYZ/s4xlqKWRb4ov50/ZRYn1un4Vfc9x4iU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IgnI9oqbr4Ufa8Zkj+9wXOyUISVf5CKxYoUQR6dmSN/ZG/fW6oie3rPUSHehfELz2
 UM2P05VvwjH7vFbLQbHQF7zyF0zuqR/UvLhulXmmkzY50lcnxDQVNM0hotNvC3Y/8j
 Y4zkuZbYmaGkmUuWTJAbx7kL80YSuRTNFR4FaR9Nq/3gey8yqNYri0WoA2S/BHI6yZ
 mFufOY2nTdflzy1acpdr4hZwMNTqI22dgR2C3GVqef1OQkVeIg/cWCDL99oMs+xZ/9
 fDWxvXHygz1YkmlOEOzPx3wHhmDEQC44INJ6tp0DaACG68FjNUtxMP7jUsdzXWkMni
 MfxN8Ji3VbGrQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v14 9/9] powerpc/vdso: Provide __kernel_clock_gettime64() on
 vdso32
Date: Fri, 27 Nov 2020 00:10:06 +1100
Message-Id: <20201126131006.2431205-9-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126131006.2431205-1-mpe@ellerman.id.au>
References: <20201126131006.2431205-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Provides __kernel_clock_gettime64() on vdso32. This is the
64 bits version of __kernel_clock_gettime() which is
y2038 compliant.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/r/44a5541c0355b9eedbac712eabe682118b3a508c.1604426550.git.christophe.leroy@csgroup.eu
---
 arch/powerpc/include/asm/vdso/gettimeofday.h | 2 ++
 arch/powerpc/kernel/vdso32/gettimeofday.S    | 9 +++++++++
 arch/powerpc/kernel/vdso32/vdso32.lds.S      | 1 +
 arch/powerpc/kernel/vdso32/vgettimeofday.c   | 6 ++++++
 4 files changed, 18 insertions(+)

v14: unchanged

diff --git a/arch/powerpc/include/asm/vdso/gettimeofday.h b/arch/powerpc/include/asm/vdso/gettimeofday.h
index 6f56a6bce615..0f95569e8fc3 100644
--- a/arch/powerpc/include/asm/vdso/gettimeofday.h
+++ b/arch/powerpc/include/asm/vdso/gettimeofday.h
@@ -187,6 +187,8 @@ int __c_kernel_clock_getres(clockid_t clock_id, struct __kernel_timespec *res,
 #else
 int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
 			     const struct vdso_data *vd);
+int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
+			       const struct vdso_data *vd);
 int __c_kernel_clock_getres(clockid_t clock_id, struct old_timespec32 *res,
 			    const struct vdso_data *vd);
 #endif
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index fd7b01c51281..a6e29f880e0e 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -35,6 +35,15 @@ V_FUNCTION_BEGIN(__kernel_clock_gettime)
 	cvdso_call __c_kernel_clock_gettime
 V_FUNCTION_END(__kernel_clock_gettime)
 
+/*
+ * Exact prototype of clock_gettime64()
+ *
+ * int __kernel_clock_gettime64(clockid_t clock_id, struct __timespec64 *ts);
+ *
+ */
+V_FUNCTION_BEGIN(__kernel_clock_gettime64)
+	cvdso_call __c_kernel_clock_gettime64
+V_FUNCTION_END(__kernel_clock_gettime64)
 
 /*
  * Exact prototype of clock_getres()
diff --git a/arch/powerpc/kernel/vdso32/vdso32.lds.S b/arch/powerpc/kernel/vdso32/vdso32.lds.S
index 51e9b3f3f88a..27a2d03c72d5 100644
--- a/arch/powerpc/kernel/vdso32/vdso32.lds.S
+++ b/arch/powerpc/kernel/vdso32/vdso32.lds.S
@@ -147,6 +147,7 @@ VERSION
 		__kernel_get_syscall_map;
 		__kernel_gettimeofday;
 		__kernel_clock_gettime;
+		__kernel_clock_gettime64;
 		__kernel_clock_getres;
 		__kernel_time;
 		__kernel_get_tbfreq;
diff --git a/arch/powerpc/kernel/vdso32/vgettimeofday.c b/arch/powerpc/kernel/vdso32/vgettimeofday.c
index 0d4bc217529e..65fb03fb1731 100644
--- a/arch/powerpc/kernel/vdso32/vgettimeofday.c
+++ b/arch/powerpc/kernel/vdso32/vgettimeofday.c
@@ -10,6 +10,12 @@ int __c_kernel_clock_gettime(clockid_t clock, struct old_timespec32 *ts,
 	return __cvdso_clock_gettime32_data(vd, clock, ts);
 }
 
+int __c_kernel_clock_gettime64(clockid_t clock, struct __kernel_timespec *ts,
+			       const struct vdso_data *vd)
+{
+	return __cvdso_clock_gettime_data(vd, clock, ts);
+}
+
 int __c_kernel_gettimeofday(struct __kernel_old_timeval *tv, struct timezone *tz,
 			    const struct vdso_data *vd)
 {
-- 
2.25.1


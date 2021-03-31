Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFEA335050F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 18:49:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9XNR6ZL9z3cBf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 03:49:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9XMR0Jvxz2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 03:48:47 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F9XMJ0htpz9txhh;
 Wed, 31 Mar 2021 18:48:44 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rUNfHAYkFI1O; Wed, 31 Mar 2021 18:48:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F9XMH6xDxz9txhd;
 Wed, 31 Mar 2021 18:48:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1316E8B828;
 Wed, 31 Mar 2021 18:48:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id yqdnjLv44r9p; Wed, 31 Mar 2021 18:48:45 +0200 (CEST)
Received: from po16121vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C0ED58B80D;
 Wed, 31 Mar 2021 18:48:44 +0200 (CEST)
Received: by po16121vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 9F60067641; Wed, 31 Mar 2021 16:48:44 +0000 (UTC)
Message-Id: <90dcf45ebadfd5a07f24241551c62f619d1cb930.1617209142.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1617209141.git.christophe.leroy@csgroup.eu>
References: <cover.1617209141.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH RESEND v1 1/4] lib/vdso: Mark do_hres_timens() and
 do_coarse_timens() __always_inline()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 31 Mar 2021 16:48:44 +0000 (UTC)
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
Cc: linux-arch@vger.kernel.org, arnd@arndb.de, dima@arista.com,
 linux-kernel@vger.kernel.org, avagin@gmail.com, luto@kernel.org,
 tglx@linutronix.de, vincenzo.frascino@arm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In the same spirit as commit c966533f8c6c ("lib/vdso: Mark do_hres()
and do_coarse() as __always_inline"), mark do_hres_timens() and
do_coarse_timens() __always_inline.

The measurement below in on a non timens process, ie on the fastest path.

On powerpc32, without the patch:

clock-gettime-monotonic-raw:    vdso: 1155 nsec/call
clock-gettime-monotonic-coarse:    vdso: 813 nsec/call
clock-gettime-monotonic:    vdso: 1076 nsec/call

With the patch:

clock-gettime-monotonic-raw:    vdso: 1100 nsec/call
clock-gettime-monotonic-coarse:    vdso: 667 nsec/call
clock-gettime-monotonic:    vdso: 1025 nsec/call

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 lib/vdso/gettimeofday.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/lib/vdso/gettimeofday.c b/lib/vdso/gettimeofday.c
index 2919f1698140..c6f6dee08746 100644
--- a/lib/vdso/gettimeofday.c
+++ b/lib/vdso/gettimeofday.c
@@ -46,8 +46,8 @@ static inline bool vdso_cycles_ok(u64 cycles)
 #endif
 
 #ifdef CONFIG_TIME_NS
-static int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
-			  struct __kernel_timespec *ts)
+static __always_inline int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
+					  struct __kernel_timespec *ts)
 {
 	const struct vdso_data *vd = __arch_get_timens_vdso_data();
 	const struct timens_offset *offs = &vdns->offset[clk];
@@ -97,8 +97,8 @@ static __always_inline const struct vdso_data *__arch_get_timens_vdso_data(void)
 	return NULL;
 }
 
-static int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
-			  struct __kernel_timespec *ts)
+static __always_inline int do_hres_timens(const struct vdso_data *vdns, clockid_t clk,
+					  struct __kernel_timespec *ts)
 {
 	return -EINVAL;
 }
@@ -159,8 +159,8 @@ static __always_inline int do_hres(const struct vdso_data *vd, clockid_t clk,
 }
 
 #ifdef CONFIG_TIME_NS
-static int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
-			    struct __kernel_timespec *ts)
+static __always_inline int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
+					    struct __kernel_timespec *ts)
 {
 	const struct vdso_data *vd = __arch_get_timens_vdso_data();
 	const struct vdso_timestamp *vdso_ts = &vd->basetime[clk];
@@ -188,8 +188,8 @@ static int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
 	return 0;
 }
 #else
-static int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
-			    struct __kernel_timespec *ts)
+static __always_inline int do_coarse_timens(const struct vdso_data *vdns, clockid_t clk,
+					    struct __kernel_timespec *ts)
 {
 	return -1;
 }
-- 
2.25.0


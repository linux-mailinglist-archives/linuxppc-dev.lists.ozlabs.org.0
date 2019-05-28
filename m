Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D19052C62D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 14:10:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Ct2R2ppyzDqMy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 22:10:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=arm.com
 (client-ip=217.140.101.70; helo=foss.arm.com;
 envelope-from=vincenzo.frascino@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.101.70])
 by lists.ozlabs.org (Postfix) with ESMTP id 45Cswf0BDSzDqGJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 22:05:05 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 805BA15AD;
 Tue, 28 May 2019 05:05:04 -0700 (PDT)
Received: from e119884-lin.cambridge.arm.com (e119884-lin.cambridge.arm.com
 [10.1.196.72])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 232373F59C;
 Tue, 28 May 2019 05:05:01 -0700 (PDT)
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
To: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: [PATCH v5 2/3] s390: Fix vDSO clock_getres()
Date: Tue, 28 May 2019 13:04:45 +0100
Message-Id: <20190528120446.48911-3-vincenzo.frascino@arm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190528120446.48911-1-vincenzo.frascino@arm.com>
References: <20190528120446.48911-1-vincenzo.frascino@arm.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Paul Mackerras <paulus@samba.org>, Martin Schwidefsky <schwidefsky@de.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, vincenzo.frascino@arm.com,
 Shuah Khan <shuah@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clock_getres in the vDSO library has to preserve the same behaviour
of posix_get_hrtimer_res().

In particular, posix_get_hrtimer_res() does:
    sec = 0;
    ns = hrtimer_resolution;
and hrtimer_resolution depends on the enablement of the high
resolution timers that can happen either at compile or at run time.

Fix the s390 vdso implementation of clock_getres keeping a copy of
hrtimer_resolution in vdso data and using that directly.

Cc: Martin Schwidefsky <schwidefsky@de.ibm.com>
Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Acked-by: Martin Schwidefsky <schwidefsky@de.ibm.com>
---

Note: This patch is independent from the others in this series, hence it
can be merged singularly by the s390 maintainers.

 arch/s390/include/asm/vdso.h           |  1 +
 arch/s390/kernel/asm-offsets.c         |  2 +-
 arch/s390/kernel/time.c                |  1 +
 arch/s390/kernel/vdso32/clock_getres.S | 12 +++++++-----
 arch/s390/kernel/vdso64/clock_getres.S | 10 +++++-----
 5 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/arch/s390/include/asm/vdso.h b/arch/s390/include/asm/vdso.h
index 169d7604eb80..f3ba84fa9bd1 100644
--- a/arch/s390/include/asm/vdso.h
+++ b/arch/s390/include/asm/vdso.h
@@ -36,6 +36,7 @@ struct vdso_data {
 	__u32 tk_shift;			/* Shift used for xtime_nsec	0x60 */
 	__u32 ts_dir;			/* TOD steering direction	0x64 */
 	__u64 ts_end;			/* TOD steering end		0x68 */
+	__u32 hrtimer_res;		/* hrtimer resolution		0x70 */
 };
 
 struct vdso_per_cpu_data {
diff --git a/arch/s390/kernel/asm-offsets.c b/arch/s390/kernel/asm-offsets.c
index 41ac4ad21311..4a229a60b24a 100644
--- a/arch/s390/kernel/asm-offsets.c
+++ b/arch/s390/kernel/asm-offsets.c
@@ -76,6 +76,7 @@ int main(void)
 	OFFSET(__VDSO_TK_SHIFT, vdso_data, tk_shift);
 	OFFSET(__VDSO_TS_DIR, vdso_data, ts_dir);
 	OFFSET(__VDSO_TS_END, vdso_data, ts_end);
+	OFFSET(__VDSO_CLOCK_REALTIME_RES, vdso_data, hrtimer_res);
 	OFFSET(__VDSO_ECTG_BASE, vdso_per_cpu_data, ectg_timer_base);
 	OFFSET(__VDSO_ECTG_USER, vdso_per_cpu_data, ectg_user_time);
 	OFFSET(__VDSO_CPU_NR, vdso_per_cpu_data, cpu_nr);
@@ -87,7 +88,6 @@ int main(void)
 	DEFINE(__CLOCK_REALTIME_COARSE, CLOCK_REALTIME_COARSE);
 	DEFINE(__CLOCK_MONOTONIC_COARSE, CLOCK_MONOTONIC_COARSE);
 	DEFINE(__CLOCK_THREAD_CPUTIME_ID, CLOCK_THREAD_CPUTIME_ID);
-	DEFINE(__CLOCK_REALTIME_RES, MONOTONIC_RES_NSEC);
 	DEFINE(__CLOCK_COARSE_RES, LOW_RES_NSEC);
 	BLANK();
 	/* idle data offsets */
diff --git a/arch/s390/kernel/time.c b/arch/s390/kernel/time.c
index e8766beee5ad..8ea9db599d38 100644
--- a/arch/s390/kernel/time.c
+++ b/arch/s390/kernel/time.c
@@ -310,6 +310,7 @@ void update_vsyscall(struct timekeeper *tk)
 
 	vdso_data->tk_mult = tk->tkr_mono.mult;
 	vdso_data->tk_shift = tk->tkr_mono.shift;
+	vdso_data->hrtimer_res = hrtimer_resolution;
 	smp_wmb();
 	++vdso_data->tb_update_count;
 }
diff --git a/arch/s390/kernel/vdso32/clock_getres.S b/arch/s390/kernel/vdso32/clock_getres.S
index eaf9cf1417f6..fecd7684c645 100644
--- a/arch/s390/kernel/vdso32/clock_getres.S
+++ b/arch/s390/kernel/vdso32/clock_getres.S
@@ -18,20 +18,22 @@
 __kernel_clock_getres:
 	CFI_STARTPROC
 	basr	%r1,0
-	la	%r1,4f-.(%r1)
+10:	al	%r1,4f-10b(%r1)
+	l	%r0,__VDSO_CLOCK_REALTIME_RES(%r1)
 	chi	%r2,__CLOCK_REALTIME
 	je	0f
 	chi	%r2,__CLOCK_MONOTONIC
 	je	0f
-	la	%r1,5f-4f(%r1)
+	basr	%r1,0
+	la	%r1,5f-.(%r1)
+	l	%r0,0(%r1)
 	chi	%r2,__CLOCK_REALTIME_COARSE
 	je	0f
 	chi	%r2,__CLOCK_MONOTONIC_COARSE
 	jne	3f
 0:	ltr	%r3,%r3
 	jz	2f				/* res == NULL */
-1:	l	%r0,0(%r1)
-	xc	0(4,%r3),0(%r3)			/* set tp->tv_sec to zero */
+1:	xc	0(4,%r3),0(%r3)			/* set tp->tv_sec to zero */
 	st	%r0,4(%r3)			/* store tp->tv_usec */
 2:	lhi	%r2,0
 	br	%r14
@@ -39,6 +41,6 @@ __kernel_clock_getres:
 	svc	0
 	br	%r14
 	CFI_ENDPROC
-4:	.long	__CLOCK_REALTIME_RES
+4:	.long	_vdso_data - 10b
 5:	.long	__CLOCK_COARSE_RES
 	.size	__kernel_clock_getres,.-__kernel_clock_getres
diff --git a/arch/s390/kernel/vdso64/clock_getres.S b/arch/s390/kernel/vdso64/clock_getres.S
index 081435398e0a..022b58c980db 100644
--- a/arch/s390/kernel/vdso64/clock_getres.S
+++ b/arch/s390/kernel/vdso64/clock_getres.S
@@ -17,12 +17,14 @@
 	.type  __kernel_clock_getres,@function
 __kernel_clock_getres:
 	CFI_STARTPROC
-	larl	%r1,4f
+	larl	%r1,3f
+	lg	%r0,0(%r1)
 	cghi	%r2,__CLOCK_REALTIME_COARSE
 	je	0f
 	cghi	%r2,__CLOCK_MONOTONIC_COARSE
 	je	0f
-	larl	%r1,3f
+	larl	%r1,_vdso_data
+	l	%r0,__VDSO_CLOCK_REALTIME_RES(%r1)
 	cghi	%r2,__CLOCK_REALTIME
 	je	0f
 	cghi	%r2,__CLOCK_MONOTONIC
@@ -36,7 +38,6 @@ __kernel_clock_getres:
 	jz	2f
 0:	ltgr	%r3,%r3
 	jz	1f				/* res == NULL */
-	lg	%r0,0(%r1)
 	xc	0(8,%r3),0(%r3)			/* set tp->tv_sec to zero */
 	stg	%r0,8(%r3)			/* store tp->tv_usec */
 1:	lghi	%r2,0
@@ -45,6 +46,5 @@ __kernel_clock_getres:
 	svc	0
 	br	%r14
 	CFI_ENDPROC
-3:	.quad	__CLOCK_REALTIME_RES
-4:	.quad	__CLOCK_COARSE_RES
+3:	.quad	__CLOCK_COARSE_RES
 	.size	__kernel_clock_getres,.-__kernel_clock_getres
-- 
2.21.0


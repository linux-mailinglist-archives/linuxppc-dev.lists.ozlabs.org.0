Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F5799962
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 18:38:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Dqwp28NWzDr97
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Aug 2019 02:38:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="tTijd0qe"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DqqM5tc7zDrV2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2019 02:34:07 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46DqqG6SJSz9v0d6;
 Thu, 22 Aug 2019 18:34:02 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tTijd0qe; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id bpxJyy_Gps_1; Thu, 22 Aug 2019 18:34:02 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46DqqG5LS3z9v0d3;
 Thu, 22 Aug 2019 18:34:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566491642; bh=XO+IlMMbRHSUR7gK6moLEuVyOmK9cT4RSO4jarRXsO0=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tTijd0qeHyYnRBHncYhPRNx4cvL8jHqLAcSwyMFEGUxVBAez7fA63xRnlxZdaDqNr
 gbluooFC7g9M8hrNqQuOf8jrdoD7XEBDwE0oahjVU839mI5VMfx3qU/Q1vuVG+9QD6
 VPtCeZXiM8VJgSeqs1jJGMNosIcJh9iQ4bI/YvHg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6F9DB8B84C;
 Thu, 22 Aug 2019 18:34:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id J3DjJP1XkAUn; Thu, 22 Aug 2019 18:34:04 +0200 (CEST)
Received: from pc16032vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 23CA58B81D;
 Thu, 22 Aug 2019 18:34:04 +0200 (CEST)
Received: by pc16032vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id E11E86B730; Thu, 22 Aug 2019 16:34:03 +0000 (UTC)
Message-Id: <4a609ab9f76ebeb01742ea09b42e2ec3d7cb2418.1566491310.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1566491310.git.christophe.leroy@c-s.fr>
References: <cover.1566491310.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v2 3/8] powerpc: Fix vDSO clock_getres()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Thu, 22 Aug 2019 16:34:03 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Vincenzo Frascino <vincenzo.frascino@arm.com>

clock_getres in the vDSO library has to preserve the same behaviour
of posix_get_hrtimer_res().

In particular, posix_get_hrtimer_res() does:
    sec = 0;
    ns = hrtimer_resolution;
and hrtimer_resolution depends on the enablement of the high
resolution timers that can happen either at compile or at run time.

Fix the powerpc vdso implementation of clock_getres keeping a copy of
hrtimer_resolution in vdso data and using that directly.

Fixes: a7f290dad32e ("[PATCH] powerpc: Merge vdso's and add vdso support
to 32 bits kernel")
Cc: stable@vger.kernel.org
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
Acked-by: Shuah Khan <skhan@linuxfoundation.org>
[chleroy: changed CLOCK_REALTIME_RES to CLOCK_HRTIMER_RES]
Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/vdso_datapage.h  | 2 ++
 arch/powerpc/kernel/asm-offsets.c         | 2 +-
 arch/powerpc/kernel/time.c                | 1 +
 arch/powerpc/kernel/vdso32/gettimeofday.S | 7 +++++--
 arch/powerpc/kernel/vdso64/gettimeofday.S | 7 +++++--
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/vdso_datapage.h b/arch/powerpc/include/asm/vdso_datapage.h
index c61d59ed3b45..2ccb938d8544 100644
--- a/arch/powerpc/include/asm/vdso_datapage.h
+++ b/arch/powerpc/include/asm/vdso_datapage.h
@@ -82,6 +82,7 @@ struct vdso_data {
 	__s32 wtom_clock_nsec;			/* Wall to monotonic clock nsec */
 	__s64 wtom_clock_sec;			/* Wall to monotonic clock sec */
 	struct timespec stamp_xtime;		/* xtime as at tb_orig_stamp */
+	__u32 hrtimer_res;			/* hrtimer resolution */
    	__u32 syscall_map_64[SYSCALL_MAP_SIZE]; /* map of syscalls  */
    	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
 };
@@ -103,6 +104,7 @@ struct vdso_data {
 	__s32 wtom_clock_nsec;
 	struct timespec stamp_xtime;	/* xtime as at tb_orig_stamp */
 	__u32 stamp_sec_fraction;	/* fractional seconds of stamp_xtime */
+	__u32 hrtimer_res;		/* hrtimer resolution */
    	__u32 syscall_map_32[SYSCALL_MAP_SIZE]; /* map of syscalls */
 	__u32 dcache_block_size;	/* L1 d-cache block size     */
 	__u32 icache_block_size;	/* L1 i-cache block size     */
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 4ccb6b3a7fbd..6279053967fd 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -387,6 +387,7 @@ int main(void)
 	OFFSET(WTOM_CLOCK_NSEC, vdso_data, wtom_clock_nsec);
 	OFFSET(STAMP_XTIME, vdso_data, stamp_xtime);
 	OFFSET(STAMP_SEC_FRAC, vdso_data, stamp_sec_fraction);
+	OFFSET(CLOCK_HRTIMER_RES, vdso_data, hrtimer_res);
 	OFFSET(CFG_ICACHE_BLOCKSZ, vdso_data, icache_block_size);
 	OFFSET(CFG_DCACHE_BLOCKSZ, vdso_data, dcache_block_size);
 	OFFSET(CFG_ICACHE_LOGBLOCKSZ, vdso_data, icache_log_block_size);
@@ -417,7 +418,6 @@ int main(void)
 	DEFINE(CLOCK_REALTIME_COARSE, CLOCK_REALTIME_COARSE);
 	DEFINE(CLOCK_MONOTONIC_COARSE, CLOCK_MONOTONIC_COARSE);
 	DEFINE(NSEC_PER_SEC, NSEC_PER_SEC);
-	DEFINE(CLOCK_REALTIME_RES, MONOTONIC_RES_NSEC);
 
 #ifdef CONFIG_BUG
 	DEFINE(BUG_ENTRY_SIZE, sizeof(struct bug_entry));
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index 694522308cd5..619447b1b797 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -959,6 +959,7 @@ void update_vsyscall(struct timekeeper *tk)
 	vdso_data->wtom_clock_nsec = tk->wall_to_monotonic.tv_nsec;
 	vdso_data->stamp_xtime = xt;
 	vdso_data->stamp_sec_fraction = frac_sec;
+	vdso_data->hrtimer_res = hrtimer_resolution;
 	smp_wmb();
 	++(vdso_data->tb_update_count);
 }
diff --git a/arch/powerpc/kernel/vdso32/gettimeofday.S b/arch/powerpc/kernel/vdso32/gettimeofday.S
index decd263c16e0..355b537d327a 100644
--- a/arch/powerpc/kernel/vdso32/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso32/gettimeofday.S
@@ -206,12 +206,15 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
 	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
 	bne	cr0,99f
 
+	mflr	r12
+  .cfi_register lr,r12
+	bl	__get_datapage@local	/* get data page */
+	lwz	r5, CLOCK_HRTIMER_RES(r3)
+	mtlr	r12
 	li	r3,0
 	cmpli	cr0,r4,0
 	crclr	cr0*4+so
 	beqlr
-	lis	r5,CLOCK_REALTIME_RES@h
-	ori	r5,r5,CLOCK_REALTIME_RES@l
 	stw	r3,TSPC32_TV_SEC(r4)
 	stw	r5,TSPC32_TV_NSEC(r4)
 	blr
diff --git a/arch/powerpc/kernel/vdso64/gettimeofday.S b/arch/powerpc/kernel/vdso64/gettimeofday.S
index 07bfe33fe874..81757f06bbd7 100644
--- a/arch/powerpc/kernel/vdso64/gettimeofday.S
+++ b/arch/powerpc/kernel/vdso64/gettimeofday.S
@@ -186,12 +186,15 @@ V_FUNCTION_BEGIN(__kernel_clock_getres)
 	cror	cr0*4+eq,cr0*4+eq,cr1*4+eq
 	bne	cr0,99f
 
+	mflr	r12
+  .cfi_register lr,r12
+	bl	V_LOCAL_FUNC(__get_datapage)
+	lwz	r5, CLOCK_HRTIMER_RES(r3)
+	mtlr	r12
 	li	r3,0
 	cmpldi	cr0,r4,0
 	crclr	cr0*4+so
 	beqlr
-	lis	r5,CLOCK_REALTIME_RES@h
-	ori	r5,r5,CLOCK_REALTIME_RES@l
 	std	r3,TSPC64_TV_SEC(r4)
 	std	r5,TSPC64_TV_NSEC(r4)
 	blr
-- 
2.13.3


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D78F630D203
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 04:12:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVmv60DNbzDwhp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 14:12:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.ru (client-ip=107.174.27.60; helo=ozlabs.ru;
 envelope-from=aik@ozlabs.ru; receiver=<UNKNOWN>)
Received: from ozlabs.ru (ozlabs.ru [107.174.27.60])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DVlT128kczDwhr
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 13:08:03 +1100 (AEDT)
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 38835AE80017;
 Tue,  2 Feb 2021 21:07:57 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH kernel v2] powerpc/uaccess: Skip might_fault() when user
 access is enabled
Date: Wed,  3 Feb 2021 13:07:55 +1100
Message-Id: <20210203020755.117593-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The amount of code executed with enabled user space access (unlocked KUAP)
should be minimal. However with CONFIG_PROVE_LOCKING or
CONFIG_DEBUG_ATOMIC_SLEEP enabled, might_fault() may end up replaying
interrupts which in turn may access the user space and forget to restore
the KUAP state.

The problem places are strncpy_from_user (and similar) which unlock KUAP
and call unsafe_get_user -> __get_user_allowed -> __get_user_nocheck()
with do_allow=false to skip KUAP as the caller took care of it.

This changes __get_user_nocheck() to look at @do_allow to decide whether
to skip might_fault(). Since strncpy_from_user/etc call might_fault()
anyway before unlocking KUAP, there should be no visible change.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
Changes:
v2:
* s/!do_allow/do_allow/
---
 arch/powerpc/include/asm/uaccess.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/asm/uaccess.h
index 501c9a79038c..27e109866c42 100644
--- a/arch/powerpc/include/asm/uaccess.h
+++ b/arch/powerpc/include/asm/uaccess.h
@@ -313,7 +313,7 @@ do {								\
 	__typeof__(size) __gu_size = (size);			\
 								\
 	__chk_user_ptr(__gu_addr);				\
-	if (!is_kernel_addr((unsigned long)__gu_addr))		\
+	if (do_allow && !is_kernel_addr((unsigned long)__gu_addr)) \
 		might_fault();					\
 	barrier_nospec();					\
 	if (do_allow)								\
-- 
2.17.1


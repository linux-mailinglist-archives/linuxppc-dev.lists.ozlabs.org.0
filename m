Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B34F32CEEF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 09:56:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Drl8j0ysQz3d5f
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 19:56:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=uniontech.com (client-ip=211.157.147.132;
 helo=lucky1.263xmail.com; envelope-from=maqianga@uniontech.com;
 receiver=<UNKNOWN>)
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.132])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Drl8N0hgYz30H5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 19:56:00 +1100 (AEDT)
Received: from localhost (unknown [192.168.167.13])
 by lucky1.263xmail.com (Postfix) with ESMTP id 15D02F2E75;
 Thu,  4 Mar 2021 16:55:53 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
 by smtp.263.net (postfix) whith ESMTP id
 P4300T140473634674432S1614848149085210_; 
 Thu, 04 Mar 2021 16:55:53 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <8bd820151685312b0cf2c2d9ebb054b2>
X-RL-SENDER: maqianga@uniontech.com
X-SENDER: maqianga@uniontech.com
X-LOGIN-NAME: maqianga@uniontech.com
X-FST-TO: mpe@ellerman.id.au
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Qiang Ma <maqianga@uniontech.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc: fix coding style issues
Date: Thu,  4 Mar 2021 16:55:41 +0800
Message-Id: <20210304085541.766-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Qiang Ma <maqianga@uniontech.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are several style issues in this function,
so fix them.

Signed-off-by: Qiang Ma <maqianga@uniontech.com>
---
 arch/powerpc/kernel/syscalls.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 078608ec2e92..bcbb5fb2a0c1 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -81,15 +81,15 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
 int
 ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp, struct __kernel_old_timeval __user *tvp)
 {
-	if ( (unsigned long)n >= 4096 )
-	{
+	if ((unsigned long)n >= 4096) {
 		unsigned long __user *buffer = (unsigned long __user *)n;
-		if (!access_ok(buffer, 5*sizeof(unsigned long))
+		if (!access_ok(buffer, 5 * sizeof(unsigned long))
 		    || __get_user(n, buffer)
-		    || __get_user(inp, ((fd_set __user * __user *)(buffer+1)))
-		    || __get_user(outp, ((fd_set  __user * __user *)(buffer+2)))
-		    || __get_user(exp, ((fd_set  __user * __user *)(buffer+3)))
-		    || __get_user(tvp, ((struct __kernel_old_timeval  __user * __user *)(buffer+4))))
+		    || __get_user(inp, ((fd_set __user * __user *)(buffer + 1)))
+		    || __get_user(outp, ((fd_set  __user * __user *)(buffer + 2)))
+		    || __get_user(exp, ((fd_set  __user * __user *)(buffer + 3)))
+		    || __get_user(tvp,
+			    ((struct __kernel_old_timeval  __user * __user *)(buffer + 4))))
 			return -EFAULT;
 	}
 	return sys_select(n, inp, outp, exp, tvp);
-- 
2.20.1




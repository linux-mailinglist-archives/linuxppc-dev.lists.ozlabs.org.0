Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB23D32BAFC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 22:03:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrRLF6J3Cz3d47
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 08:03:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=uniontech.com (client-ip=211.157.147.134;
 helo=lucky1.263xmail.com; envelope-from=maqianga@uniontech.com;
 receiver=<UNKNOWN>)
X-Greylist: delayed 209 seconds by postgrey-1.36 at boromir;
 Wed, 03 Mar 2021 23:01:09 AEDT
Received: from lucky1.263xmail.com (lucky1.263xmail.com [211.157.147.134])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrCJP3Hbqz3cJL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Mar 2021 23:01:09 +1100 (AEDT)
Received: from localhost (unknown [192.168.167.13])
 by lucky1.263xmail.com (Postfix) with ESMTP id E7B09C75D3;
 Wed,  3 Mar 2021 19:57:16 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [124.126.19.250])
 by smtp.263.net (postfix) whith ESMTP id
 P4300T140473571735296S1614772632866484_; 
 Wed, 03 Mar 2021 19:57:18 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <ba80ddaa333c65d3e86d5ece2779404c>
X-RL-SENDER: maqianga@uniontech.com
X-SENDER: maqianga@uniontech.com
X-LOGIN-NAME: maqianga@uniontech.com
X-FST-TO: mpe@ellerman.id.au
X-SENDER-IP: 124.126.19.250
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: maqiang <maqianga@uniontech.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc: remove redundant space
Date: Wed,  3 Mar 2021 19:57:10 +0800
Message-Id: <20210303115710.30886-1-maqianga@uniontech.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 04 Mar 2021 08:03:17 +1100
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
 maqiang <maqianga@uniontech.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These one line of code don't meet the kernel coding style,
so remove the redundant space.

Signed-off-by: maqiang <maqianga@uniontech.com>
---
 arch/powerpc/kernel/syscalls.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 078608ec2e92..9248288752d5 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -81,7 +81,7 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
 int
 ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp, struct __kernel_old_timeval __user *tvp)
 {
-	if ( (unsigned long)n >= 4096 )
+	if ((unsigned long)n >= 4096)
 	{
 		unsigned long __user *buffer = (unsigned long __user *)n;
 		if (!access_ok(buffer, 5*sizeof(unsigned long))
-- 
2.20.1




Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9960577CF4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 09:59:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LmZ9P5yM1z3c5d
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Jul 2022 17:59:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.155.67.158; helo=smtpbg.qq.com; envelope-from=wangborong@cdjrlc.com; receiver=<UNKNOWN>)
Received: from smtpbg.qq.com (unknown [43.155.67.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LmZ90497Pz3bl6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Jul 2022 17:58:40 +1000 (AEST)
X-QQ-mid: bizesmtp90t1658130956t7fduxie
Received: from localhost.localdomain ( [182.148.15.157])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 Jul 2022 15:55:54 +0800 (CST)
X-QQ-SSF: 01000000002000E0U000B00A0000020
X-QQ-FEAT: I6umPUGCYXFVJ41OBmTHZCAuvOk0nuyFrkzHbZ8yYJoOROKptEgxbDoCpvPR9
	H/m0c+9zbgRNGfDO/X7hMqpdcb4va5GYfy/hmVMHVhWSbkjkUvv8Qt5+CiM1TNmZI2OFFvN
	wfWHF/wSJCGxar3kCDs4Xk+nhc32kr4otZcjYhZrY79pJCYk835bcpIqAax0RMBUVJWGUQ6
	Ecm9kyMl9m2247XTSBRUhN7jRs++ijF/UKv9K/l3QdT0WtpM/KkotQy4m399oHHI2Ld58Mu
	quPaPe16EpC6iEjFk+3L+9QQHocK/Iqdawv4IgD3lngTVdLswAWgkLB+dwBXjeERLxHZxYt
	1AgnKLhEziE3VyMTF7jC1cP7HgBbAAAkfpCn7iIsfzD/Fn/JxrgF7AhPK6btNnFSoUpLQeq
X-QQ-GoodBg: 0
From: Jason Wang <wangborong@cdjrlc.com>
To: paulus@samba.org
Subject: [PATCH] powerpc/pseries/vas: Fix comment typo
Date: Mon, 18 Jul 2022 15:55:53 +0800
Message-Id: <20220718075553.70897-1-wangborong@cdjrlc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
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
Cc: nick.child@ibm.com, haren@linux.ibm.com, linux-kernel@vger.kernel.org, npiggin@gmail.com, Julia.Lawall@inria.fr, clg@kaod.org, Jason Wang <wangborong@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The double `the' in line 807 is duplicated, remove one.

Signed-off-by: Jason Wang <wangborong@cdjrlc.com>
---
 arch/powerpc/platforms/pseries/vas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
index 91e7eda0606c..7e6e6dd2e33e 100644
--- a/arch/powerpc/platforms/pseries/vas.c
+++ b/arch/powerpc/platforms/pseries/vas.c
@@ -804,7 +804,7 @@ int vas_reconfig_capabilties(u8 type, int new_nr_creds)
 	 * The total number of available credits may be decreased or
 	 * increased with DLPAR operation. Means some windows have to be
 	 * closed / reopened. Hold the vas_pseries_mutex so that the
-	 * the user space can not open new windows.
+	 * user space can not open new windows.
 	 */
 	if (old_nr_creds <  new_nr_creds) {
 		/*
-- 
2.35.1


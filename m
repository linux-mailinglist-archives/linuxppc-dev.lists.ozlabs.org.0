Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE1C5B4CB3
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Sep 2022 10:46:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQNd00Tm6z3cB6
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Sep 2022 18:46:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=xiujianfeng@huawei.com; receiver=<UNKNOWN>)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQNcV4gVyz2yN9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Sep 2022 18:46:15 +1000 (AEST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MQNX564KTzmV74;
	Sun, 11 Sep 2022 16:42:29 +0800 (CST)
Received: from ubuntu1804.huawei.com (10.67.174.58) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Sun, 11 Sep 2022 16:46:10 +0800
From: Xiu Jianfeng <xiujianfeng@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<willy@infradead.org>, <zuoqilin@yulong.com>
Subject: [PATCH] powerpc: pseries: add __init/__exit annotations to module init/exit funcs
Date: Sun, 11 Sep 2022 16:42:41 +0800
Message-ID: <20220911084241.196091-1-xiujianfeng@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.58]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add missing __init/__exit annotations to module init/exit funcs.

Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
---
 arch/powerpc/platforms/pseries/cmm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 5f4037c1d7fe..3c56c5cb0fa9 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -565,7 +565,7 @@ static void cmm_balloon_compaction_init(void)
  * Return value:
  * 	0 on success / other on failure
  **/
-static int cmm_init(void)
+static int __init cmm_init(void)
 {
 	int rc;
 
@@ -615,7 +615,7 @@ static int cmm_init(void)
  * Return value:
  * 	nothing
  **/
-static void cmm_exit(void)
+static void __exit cmm_exit(void)
 {
 	if (cmm_thread_ptr)
 		kthread_stop(cmm_thread_ptr);
-- 
2.17.1


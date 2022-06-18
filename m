Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 35205550295
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 05:53:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ27d18MWz3cdM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 13:53:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=HciIVu+E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.113; helo=m15113.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=HciIVu+E;
	dkim-atps=neutral
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ26y2kzxz303t
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 13:52:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=B5LgJ
	wZ+mPjWqyMswOQulY2y3abQQoRCtFlG8faFEGc=; b=HciIVu+Ell31IepjGrn5u
	YjpWgrElOwmr2apsZpgr2i8vWcESlPeufQOX5cTAQ5/Z4/dIKxLM7aFQpAddXgY3
	M+mKcE718LFuHLklYMXdJLmciBlDnq3Jt+uCCp7sI3LuypnAm+LJoGA2cNxfsjVi
	EnQir5HGUqpT83LeERjD5E=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp3 (Coremail) with SMTP id DcmowAA3R5_kS61isxLFDg--.40406S2;
	Sat, 18 Jun 2022 11:52:06 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	christophe.leroy@csgroup.eu,
	nick.child@ibm.com,
	npiggin@gmail.com
Subject: [PATCH] powerpc: embedded6xx: Fix refcount leak bug in holly.c
Date: Sat, 18 Jun 2022 11:52:04 +0800
Message-Id: <20220618035204.4057698-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowAA3R5_kS61isxLFDg--.40406S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XFWruF43WryrCr13KrWDtwb_yoWfJrb_Xw
	n7Aan7Cr4Fqa1DZr1DZ3W3XFW8A3s5Gr4xGrnYqa12v3WfJa13Wr45tFy8uay8WrWYy398
	Ga1ktFWjkaySyjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjksqtUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi7QckF1pEAOPbAAAAs-
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In holly_init_pci(), of_find_node_by_type() will return a node
pointer with refcount incremented. We should use of_node_put()
when it is not used anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/platforms/embedded6xx/holly.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/platforms/embedded6xx/holly.c b/arch/powerpc/platforms/embedded6xx/holly.c
index 78f2378d9223..a4938505e89a 100644
--- a/arch/powerpc/platforms/embedded6xx/holly.c
+++ b/arch/powerpc/platforms/embedded6xx/holly.c
@@ -122,6 +122,7 @@ static void __init holly_init_pci(void)
 	np = of_find_node_by_type(NULL, "pci");
 	if (np)
 		tsi108_setup_pci(np, HOLLY_PCI_CFG_PHYS, 1);
+	of_node_put(np);
 
 	ppc_md.pci_exclude_device = holly_exclude_device;
 	if (ppc_md.progress)
-- 
2.25.1


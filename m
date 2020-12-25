Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 718012E7406
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 21:52:18 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D566c5xJbzDq8W
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 07:52:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=123.126.96.4; helo=mail-m964.mail.126.com;
 envelope-from=bodefang@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256
 header.s=s110527 header.b=XjcCnFcv; dkim-atps=neutral
X-Greylist: delayed 1917 seconds by postgrey-1.36 at bilbo;
 Fri, 25 Dec 2020 18:45:08 AEDT
Received: from mail-m964.mail.126.com (mail-m964.mail.126.com [123.126.96.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D2JrN3FDczDqJ7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Dec 2020 18:45:07 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=iJJoJscBI/+hKpJYBX
 zopxzPlvxajIEcfsRetkuiDGM=; b=XjcCnFcvScn5ZnrlF73ybd0bpt6l9ERaor
 knBLj0du7YMzDS+GHBdTtHpS4rPNrUax5QS2odUjMdCcpK70sz9N9rGByaAmPmak
 iKRzC9sxqMFVAFlQ6JQsRTV05nstUr6xSx3MtJs1uJctOH1X4hFYJBenTj4WLRoq
 2II6RPlz0=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp9 (Coremail) with SMTP id NeRpCgAnXYqakOVfbXMoQA--.6041S2;
 Fri, 25 Dec 2020 15:11:24 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] powerpc/mm: avoid null pointer dereference in flush_tlb_mm
Date: Fri, 25 Dec 2020 15:11:11 +0800
Message-Id: <1608880271-2294955-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: NeRpCgAnXYqakOVfbXMoQA--.6041S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW5Jw4fury8Kr4rtF1rXrb_yoWxZrgEq3
 9xAws7J3yqy3ykZF4kAr4rWF98Aws7ZF4agwn0g34avr90gw4rJFW0q39rGF15WFWIvFWD
 Xa4Dtr15JF1FvjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRRoGQPUUUUU==
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbikhwG11pECE6EAAAAsD
X-Mailman-Approved-At: Wed, 30 Dec 2020 07:50:45 +1100
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
Cc: linux-kernel@vger.kernel.org, penberg@kernel.org,
 Defang Bo <bodefang@126.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to commit<0dc294f7>, there should be a check for 'mm' to prevent Null pointer dereference in case of 'mm' argument was legitimately passed.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 arch/powerpc/mm/nohash/tlb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5872f69..09796c9 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -268,6 +268,9 @@ void flush_tlb_mm(struct mm_struct *mm)
 {
 	unsigned int pid;
 
+	if (unlikely(!mm))
+		return;
+
 	preempt_disable();
 	pid = mm->context.id;
 	if (unlikely(pid == MMU_NO_CONTEXT))
-- 
2.7.4


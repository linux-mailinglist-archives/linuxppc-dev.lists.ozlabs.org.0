Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F922E7409
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Dec 2020 21:53:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D568N16qHzDq9S
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Dec 2020 07:53:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=126.com
 (client-ip=220.181.15.112; helo=m15112.mail.126.com;
 envelope-from=bodefang@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256
 header.s=s110527 header.b=NtHzNaDk; dkim-atps=neutral
X-Greylist: delayed 1996 seconds by postgrey-1.36 at bilbo;
 Mon, 28 Dec 2020 14:49:20 AEDT
Received: from m15112.mail.126.com (m15112.mail.126.com [220.181.15.112])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D43Sw5KjTzDqBZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Dec 2020 14:49:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:Subject:Date:Message-Id; bh=rHDg0EM4Tc1M0YYKA4
 UQMqhy0tOgpr+WAMZImhXGOPI=; b=NtHzNaDkdtCeFRfNcfqGRqx3IgKH9zeS3l
 zRMSm+9FOhhQQIRYnVg5N+i4zKgyO+xHQzDpUNz6BgLZiz1E6+g61pfOlE77N1cy
 IJQrmGDlqv0DpVj0WAgcWHpOu8BdKAn41HLj/ib6zornorzyZe62JqEpF39pjKdD
 DqehwFycY=
Received: from localhost.localdomain (unknown [36.112.86.14])
 by smtp2 (Coremail) with SMTP id DMmowAAX3UDBTOlf7uVwKg--.26924S2;
 Mon, 28 Dec 2020 11:10:58 +0800 (CST)
From: Defang Bo <bodefang@126.com>
To: mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org,
 christophe.leroy@csgroup.eu, akpm@linux-foundation.org,
 geert@linux-m68k.org, rppt@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/mm: add sanity check to avoid null pointer dereference
Date: Mon, 28 Dec 2020 11:10:50 +0800
Message-Id: <1609125050-240351-1-git-send-email-bodefang@126.com>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: DMmowAAX3UDBTOlf7uVwKg--.26924S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrZFW3Cw4xCF17Wr4xuFW3Jrb_yoW8JF4rpw
 1vyr1vvw4Fq3Z5KrySkF1DWryYga1ktF1xC39Fk398ua4rtws5uF1fKwnYya13XF95C3WS
 kFZxKw15Jr13X37anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRX_-QUUUUU=
X-Originating-IP: [36.112.86.14]
X-CM-SenderInfo: pergvwxdqjqiyswou0bp/1tbiFgwJ11pECtLJ6gAAsh
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
Cc: Defang Bo <bodefang@126.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similar to commit<0dc294f717d4>("powerpc/mm: bail out early when flushing TLB page"),
there should be a check for 'mm' to prevent Null pointer dereference
in case of 'mm' argument was legitimately passed.

Signed-off-by: Defang Bo <bodefang@126.com>
---
 arch/powerpc/mm/nohash/tlb.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 5872f69..1d89335 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -192,6 +192,9 @@ void local_flush_tlb_mm(struct mm_struct *mm)
 {
 	unsigned int pid;
 
+	if (WARN_ON(!mm))
+		return;
+
 	preempt_disable();
 	pid = mm->context.id;
 	if (pid != MMU_NO_CONTEXT)
@@ -205,8 +208,11 @@ void __local_flush_tlb_page(struct mm_struct *mm, unsigned long vmaddr,
 {
 	unsigned int pid;
 
+	if (WARN_ON(!mm))
+		return;
+
 	preempt_disable();
-	pid = mm ? mm->context.id : 0;
+	pid = mm->context.id;
 	if (pid != MMU_NO_CONTEXT)
 		_tlbil_va(vmaddr, pid, tsize, ind);
 	preempt_enable();
@@ -268,6 +274,9 @@ void flush_tlb_mm(struct mm_struct *mm)
 {
 	unsigned int pid;
 
+	if (WARN_ON(!mm))
+		return;
+
 	preempt_disable();
 	pid = mm->context.id;
 	if (unlikely(pid == MMU_NO_CONTEXT))
-- 
2.7.4


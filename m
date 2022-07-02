Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C14B563DC2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 04:31:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZbfD4V0Zz3c1w
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 12:31:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=fhLZ14zg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=123.126.96.3; helo=mail-m963.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=fhLZ14zg;
	dkim-atps=neutral
Received: from mail-m963.mail.126.com (mail-m963.mail.126.com [123.126.96.3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZbdc1GnCz3bd3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 12:30:09 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=LQ3fT
	mUC3tPCdS9PAPkBSdYV0nG0JYJ5jFe6PDldyV4=; b=fhLZ14zgxclwZxoJnqzPr
	fQi2MdXK7yPUerqU1EBIL1WpIrEvNzyGhk8CXxS+OtH62ptcnlgrZXPYyVLHQ/ly
	PW2wE4i8Yv+bumXnwjElKta4/N+DQOnJO9l8/qh+1qKtkvhYPPjIsbSYwguWqo+o
	W3gN7nJfcPP3ZJSaSnBiIc=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp8 (Coremail) with SMTP id NORpCgCnK5iRrb9iunEXHA--.14519S2;
	Sat, 02 Jul 2022 10:29:38 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc: kernel: pci-common: Fix refcount bug for 'phb->dn'
Date: Sat,  2 Jul 2022 10:29:36 +0800
Message-Id: <20220702022936.266146-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: NORpCgCnK5iRrb9iunEXHA--.14519S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Cr4Uuw13AFy7tr13trWUJwb_yoW8Wr13pa
	90ka43Ar10gFWv9a90yF18WFy2q3WkJr43J390kF9YkFsaqryqyF1kZry2gr15Ja1xJasY
	vF4vqw12ya1Uu3JanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UY_MfUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/xtbBGgIyF1-HZa8UbgAAsV
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In pcibios_alloc_controller(), 'phb' is allocated and escaped into
global 'hose_list'. So we should call of_node_get() when a new reference
created into 'phb->dn'. And when phb is freed, we should call
of_node_put() on it.

NOTE: This function is called in the iteration of for_each_xx in
chrp_find_bridges() function. If there is no of_node_get(), the object
maybe prematurely freed.

Signed-off-by: Liang He <windhl@126.com>
---

 I do not know if we should insert the of_node_put() in or out of the
spin_lock/spin_unlock. Please check it carefully.

 arch/powerpc/kernel/pci-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 068410cd54a3..f58dcf3a92bb 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -117,7 +117,7 @@ struct pci_controller *pcibios_alloc_controller(struct device_node *dev)
 	phb->global_number = get_phb_number(dev);
 	list_add_tail(&phb->list_node, &hose_list);
 	spin_unlock(&hose_spinlock);
-	phb->dn = dev;
+	phb->dn = of_node_get(dev);
 	phb->is_dynamic = slab_is_available();
 #ifdef CONFIG_PPC64
 	if (dev) {
@@ -140,7 +140,7 @@ void pcibios_free_controller(struct pci_controller *phb)
 	/* Clear bit of phb_bitmap to allow reuse of this PHB number. */
 	if (phb->global_number < MAX_PHBS)
 		clear_bit(phb->global_number, phb_bitmap);
-
+	of_node_put(phb->dn);
 	list_del(&phb->list_node);
 	spin_unlock(&hose_spinlock);
 
-- 
2.25.1


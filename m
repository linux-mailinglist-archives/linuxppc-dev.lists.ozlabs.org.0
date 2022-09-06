Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E935AF780
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Sep 2022 23:59:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMfRV227Nz3cBS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 07:59:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KU/WK+Fe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.15; helo=m12-15.163.com; envelope-from=jingyuwang_vip@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=KU/WK+Fe;
	dkim-atps=neutral
X-Greylist: delayed 925 seconds by postgrey-1.36 at boromir; Wed, 07 Sep 2022 01:48:54 AEST
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMVDQ2lhmz2xGD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 01:48:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=Avs+l
	kNxs6NZXbIVlOQF+VhUGa8d5JIFiKFcr6zVKnE=; b=KU/WK+FeSv3nJFfMvmbHi
	ANdeHLMEt8yMqQGm3tEz9wm2ihQ7naMVrTnQV3Qg8GJ8xnPPfqAUxXu4oAEWG75A
	nKLGYL5FZd8BRBsnREl47l3LFxenX1VSr29H4gayA2tUSjqQCsZPB5xmpIzj23FG
	1Qh/ufr4pTKlVSfFJbyEI0=
Received: from f00160-VMware-Virtual-Platform.localdomain (unknown [1.203.67.201])
	by smtp11 (Coremail) with SMTP id D8CowACnj9EpaBdjG4wsAQ--.54244S4;
	Tue, 06 Sep 2022 23:33:08 +0800 (CST)
From: Jingyu Wang <jingyuwang_vip@163.com>
To: mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu
Subject: [PATCH] powerpc: remove redundant space
Date: Tue,  6 Sep 2022 23:32:55 +0800
Message-Id: <20220906153255.6688-1-jingyuwang_vip@163.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowACnj9EpaBdjG4wsAQ--.54244S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7KFW5Jr4UXF1rtFWktryDAwb_yoW8Jw1kpr
	n7ta4FkFs5Ar1rJr1vga1Ygry7XrnrArWavw4jy397AF1UZrs5JF4F9r9xXF15tFyUua1S
	9FZ3uF1Sya1UC3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRI31NUUUUU=
X-Originating-IP: [1.203.67.201]
X-CM-SenderInfo: 5mlqw5xxzd0whbyl1qqrwthudrp/xtbCoBV0F1zmWFxfuQABsP
X-Mailman-Approved-At: Wed, 07 Sep 2022 07:57:55 +1000
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
Cc: Jingyu Wang <jingyuwang_vip@163.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This commit remmove redundant space in arch/powerpc/sysdev/mmio_nvram.c

Signed-off-by: Jingyu Wang <jingyuwang_vip@163.com>
---
 arch/powerpc/sysdev/mmio_nvram.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/sysdev/mmio_nvram.c b/arch/powerpc/sysdev/mmio_nvram.c
index eb48210ef98e..cc15b161ada6 100644
--- a/arch/powerpc/sysdev/mmio_nvram.c
+++ b/arch/powerpc/sysdev/mmio_nvram.c
@@ -35,7 +35,7 @@ static ssize_t mmio_nvram_read(char *buf, size_t count, loff_t *index)
 	memcpy_fromio(buf, mmio_nvram_start + *index, count);
 
 	spin_unlock_irqrestore(&mmio_nvram_lock, flags);
-	
+
 	*index += count;
 	return count;
 }
@@ -71,7 +71,7 @@ static ssize_t mmio_nvram_write(char *buf, size_t count, loff_t *index)
 	memcpy_toio(mmio_nvram_start + *index, buf, count);
 
 	spin_unlock_irqrestore(&mmio_nvram_lock, flags);
-	
+
 	*index += count;
 	return count;
 }
@@ -117,7 +117,7 @@ int __init mmio_nvram_init(void)
 	}
 	nvram_addr = r.start;
 	mmio_nvram_len = resource_size(&r);
-	if ( (!mmio_nvram_len) || (!nvram_addr) ) {
+	if ((!mmio_nvram_len) || (!nvram_addr)) {
 		printk(KERN_WARNING "nvram: address or length is 0\n");
 		ret = -EIO;
 		goto out;

base-commit: e47eb90a0a9ae20b82635b9b99a8d0979b757ad8
-- 
2.34.1


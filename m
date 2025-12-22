Return-Path: <linuxppc-dev+bounces-14932-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89404CD4A0D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 04:29:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZNtX5yYMz2xpt;
	Mon, 22 Dec 2025 14:29:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.84
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766373182;
	cv=none; b=lsyQ9Qeudvi/FP3mdzjn+2X4VlJLL+M2eEINK5rwXPxm8OQ6p1uNSWXCz4BRjQaM3ctj2A3VDRqF428Gzi4k4qT5hXcDbqHS6T5fJpMz6+yNQZ0jRFNOrRnOOBq6q0BDnm7nJIxosBlZTWL5KsDS9kpRFFMgdXYeKV/gUFG0rd1NmmWqgP0GQ2CdTiUWlp75i+9A6Y9sfaGLusLswIAKz/J+fUrS0U9ZY4dyjvo6dLvVSIkT/AsQ0fyKd+WI2cSnQqtUDfQU9NchUbtu3oJ6TYE4DW7GfSAbEiPyvhGjwNOUxMflHLDUrRrHpFttP3gz/rC7KDDpRYn9nMPsGAWE2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766373182; c=relaxed/relaxed;
	bh=pHOQVDZA3NyP5KF7/VyPz40FpHR0WxnZcqlo3bEcVZs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=K71DqA000pYAgaxcRUpTYZoBY3OsARgZTSswhftw6URldXZo2hSHMeBmx5tZw99zd0URdDY9RTKxIwP4PkgEDHSw95rgxWfD543mizktrw52smwNrTzZMvU2vm2yEuaxgp0g63dEuyAc7+ahEiFK3ZB/3HDpYDR6OFazYI4loy7Ql2RlxqWZ2/04Cjy80wVTWaleKAhDtyXaoO6BK3d/1wIxFPM4TLBavy6FP4dw0oBtaAsRskwewnylROIvoGop7gzje77112KvYMm3QsLbujOk04yL1M4Nz8cZFMxKtwrrd0Ta9+EM0YJlemETZecUQY5lN1q6f/dS72c4eosejQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn; spf=pass (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=isrc.iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=isrc.iscas.ac.cn (client-ip=159.226.251.84; helo=cstnet.cn; envelope-from=lihaoxiang@isrc.iscas.ac.cn; receiver=lists.ozlabs.org)
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZNW06cxXz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 14:12:53 +1100 (AEDT)
Received: from localhost.localdomain (unknown [36.112.3.209])
	by APP-05 (Coremail) with SMTP id zQCowABH3RAbt0hpYO9+AQ--.54336S2;
	Mon, 22 Dec 2025 11:12:27 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	chleroy@kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	gregkh@linuxfoundation.org,
	ritesh.list@gmail.com,
	byungchul@sk.com,
	abarnas@google.com,
	kay.sievers@vrfy.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/pseries/cmm: fix the error handling in cmm_sysfs_register()
Date: Mon, 22 Dec 2025 11:12:25 +0800
Message-Id: <20251222031225.968472-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:zQCowABH3RAbt0hpYO9+AQ--.54336S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrykuw1DZF4kXr4xJr4kCrg_yoWDZwb_Kw
	109ayDuws3GrnakFZxAF1Uur1Syw1DtrW3tr1qqFs7t345XayDWw43ZrWYvr1xXF4xAr43
	GF1DtwsxC34akjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3xFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVWUJVW8JwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
	jxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
	1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxa
	n2IY04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4
	AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
	17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
	IF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4l
	IxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvf
	C2KfnxnUUI43ZEXa7VUbGQ6JUUUUU==
X-Originating-IP: [36.112.3.209]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBwsEE2lIrP0lygAAsE
X-Spam-Status: No, score=-2.3 required=3.0 tests=RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

If device_register() fails, put_device() should be called to drop
the device reference.
Thus add put_device() after subsys_unregister label and change
device_unregister() to device_del() in fail label.

Found by code review.

Fixes: 6c9d29095264 ("power: cmm - convert sysdev_class to a regular subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
---
 arch/powerpc/platforms/pseries/cmm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
index 4cbbe2ee58ab..0666d3300bdb 100644
--- a/arch/powerpc/platforms/pseries/cmm.c
+++ b/arch/powerpc/platforms/pseries/cmm.c
@@ -419,8 +419,9 @@ static int cmm_sysfs_register(struct device *dev)
 fail:
 	while (--i >= 0)
 		device_remove_file(dev, cmm_attrs[i]);
-	device_unregister(dev);
+	device_del(dev);
 subsys_unregister:
+	put_device(dev);
 	bus_unregister(&cmm_subsys);
 	return rc;
 }
-- 
2.25.1



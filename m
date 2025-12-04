Return-Path: <linuxppc-dev+bounces-14597-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43350CA3506
	for <lists+linuxppc-dev@lfdr.de>; Thu, 04 Dec 2025 11:52:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dMWYj40Q6z2xJ1;
	Thu, 04 Dec 2025 21:52:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=117.135.210.3
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764845561;
	cv=none; b=dZ8v5rv1pftpK/32nvHeaK3Y6IVN2Wlp9gMptDujdNyKOMWeY7H0lQRZFj+rizdckrHewgxe9lX2j+Jvim4o5NGP0lhXI7tDl2FGIAl/Ntgg7dnZdiLezaJZF6yW7cMGSjuR2CNcHoQ5LBg/tLuBQhiJOS73ddAfum+vt7pz6tyGy460q/nvvdaoHrEgcUuA/WiWfvRzwge3M0s3nMd7eiFHfhV/7j4RYrqx4bmu+24gNz2x2xWvBzLVkjCcYcWcWtvMQpEYXRVM3bOtsOiVy5FGMZA+UNla3NnVX7TuEQA8O3F4L5wkkqfHqWnq5nQcWpdZKRlSwCMqeLpNvfr7TA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764845561; c=relaxed/relaxed;
	bh=oObGAmjdi3JvAty33o5ujX20oFjqkuDLoWzF8n+fhio=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WTe1ka5W8dDZQrDMZwRCnKAjPrnAJ2wV6iCnVnE5Il19SlA6WvysnHXUZ3aLhTmS6duzs0Azb4bEMmI8A0/BGwMnNeDJ/ZOeIliFF6wivXWpjEtZ/6arU3041gqxgquoQrBqIbioycuco1HvQCponi+1TOx7tDGY8tvuZLyxJcpI/uPUV6N8wI+YzEiL3hDsA7xjE+bXwSxLNz7FeXSPKK6a99mZOnqT8Gzzt15ent1BzRuY9geGaEwQxatdL5ar4VilOj1AmdyQ9jmsBQfOymN3r4VGpPQqg0q1t2GsnmvFAJQ5XTH9z07olP0Q9i6A+iIpWPInIRmVLqps8fyRDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com; dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CK7uQmx7; dkim-atps=neutral; spf=pass (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=haoxiang_li2024@163.com; receiver=lists.ozlabs.org) smtp.mailfrom=163.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=CK7uQmx7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=117.135.210.3; helo=m16.mail.163.com; envelope-from=haoxiang_li2024@163.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1225 seconds by postgrey-1.37 at boromir; Thu, 04 Dec 2025 21:52:37 AEDT
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dMWYd48Xmz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Dec 2025 21:52:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=oO
	bGAmjdi3JvAty33o5ujX20oFjqkuDLoWzF8n+fhio=; b=CK7uQmx7goPzoD/MiE
	tDBXU7gEFOEACEFRZYgWqstqOaA2sLL0iRnpVLxSirNbIjCB22s8YR+g0qhHqM7E
	EBj1J8GFfsde7zG9lf1Qfu+q19ANLxGJKxs5lNT46Y5UT3Drg/SXj1iLUxbsUfyh
	eF8cQXHX0bMhLV/4KJV6x9dls=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wAXcVyBYDFph89sEg--.16629S4;
	Thu, 04 Dec 2025 18:20:50 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	haoxiang_li2024@163.com,
	kay.sievers@vrfy.org,
	gregkh@suse.de
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] powerpc: cell: Fix a reference leak bug in create_spu()
Date: Thu,  4 Dec 2025 18:20:47 +0800
Message-Id: <20251204102047.85545-1-haoxiang_li2024@163.com>
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
X-CM-TRANSID:_____wAXcVyBYDFph89sEg--.16629S4
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWDAr43GFyruFWfZFW3trb_yoWDGwc_Kw
	1xu3WDWr48Grs2vrnIya4fXr1UAws2gr48Kw4Iqa17Jay5Xan0gr4fZFW3GF13Wa1Ikrsx
	JF4kGF9rAa4S9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7sRMxR67UUUUU==
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxgLeTWkxYIJyvAAA3j
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

spu_create_dev() calls device_register(), if it fails, put_device()
is required to drop the device reference.

Fixes: 8a25a2fd126c ("cpu: convert 'cpu' and 'machinecheck' sysdev_class to a regular subsystem")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 arch/powerpc/platforms/cell/spu_base.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/cell/spu_base.c b/arch/powerpc/platforms/cell/spu_base.c
index 2c07387201d0..18145142d3ac 100644
--- a/arch/powerpc/platforms/cell/spu_base.c
+++ b/arch/powerpc/platforms/cell/spu_base.c
@@ -581,8 +581,10 @@ static int __init create_spu(void *data)
 		goto out_destroy;
 
 	ret = spu_create_dev(spu);
-	if (ret)
+	if (ret) {
+		put_device(&spu->dev);
 		goto out_free_irqs;
+	}
 
 	mutex_lock(&cbe_spu_info[spu->node].list_mutex);
 	list_add(&spu->cbe_list, &cbe_spu_info[spu->node].spus);
-- 
2.25.1



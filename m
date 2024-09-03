Return-Path: <linuxppc-dev+bounces-901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A319692CE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Sep 2024 06:13:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyXLW3ZqJz2yGd;
	Tue,  3 Sep 2024 14:13:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.226.251.21
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725331046;
	cv=none; b=Il6Gm2IhKON0WcdA+YB3USvInNaiCO32gKqyb5ySSlj9+11QfF9iT4VkFsDR3NfJKT4IVOEd87jtKYTWE9wJZicd3zIox13fWgiNYSea3mxaFThUwvirkwbCK0gZWF6GiD13xwJZHYrfGEZsLr0h+7OsdRSP6CXWXYwEIVtOT8kgLbobh/C0h3cv+gKaPVwwIATtwl/pCnmHyMyoPZHOgZwdu51rn4EAfzzMAluCpL9S29VVa6EPnywTorWDlgBxpMOqZEqEnoZHjiNntiEEQ+ZgUXtyILDEF3XElAY0FzWMj1fnzcjHW2ZZcnuMn6SHlUmvUCb1JYGAgTBM1hgmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725331046; c=relaxed/relaxed;
	bh=pl6diveakjWnVjdlEVLSM6Ew9pVoqxm00LK1Z0BCiY8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KrTs+bomptGK2LPrQws1VlPfcNiCEDiwMuizAULSaR4yizIJ5UhaeVU7oMyZ+yuqFwt947fo6aJW0WCAxcAA+Jka6E+BCo9uNE8veXSgyQGYJCAtnA7pIGgA02eRX6i5Z3gf36f3zbYspbXazyoWwiAuI5L5CQ3HGVReE2R1AKUeN2askmbYtwnGzV7uOy9iqqZnTJP1i6IOtiNac2EvloLrxB01XmodJibFwdIGDRh8zH0MTWUJ+67j1SDBNoiT8Iz3HnUR9wQIhm+dl1al7GTyjLNcayW0DT4WrPaPbkaI+9Y3YgQD+0zEa+3VgjaWJZuBsznGFMv7+x9erzbhpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org) smtp.mailfrom=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iscas.ac.cn (client-ip=159.226.251.21; helo=cstnet.cn; envelope-from=nichen@iscas.ac.cn; receiver=lists.ozlabs.org)
X-Greylist: delayed 417 seconds by postgrey-1.37 at boromir; Tue, 03 Sep 2024 12:37:25 AEST
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyVC96NxGz2yJL
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 12:37:25 +1000 (AEST)
Received: from localhost (unknown [124.16.138.129])
	by APP-01 (Coremail) with SMTP id qwCowACH3aq9dNZmBmG0AA--.35682S2;
	Tue, 03 Sep 2024 10:30:21 +0800 (CST)
From: Chen Ni <nichen@iscas.ac.cn>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org,
	Chen Ni <nichen@iscas.ac.cn>
Subject: [PATCH] tty: hvc: convert comma to semicolon
Date: Tue,  3 Sep 2024 10:30:01 +0800
Message-Id: <20240903023001.491055-1-nichen@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowACH3aq9dNZmBmG0AA--.35682S2
X-Coremail-Antispam: 1UD129KBjvdXoW7Jw4UZF15Zr47GrWUJFyxKrg_yoW3ZFb_AF
	sIyrWxu3W5ArsI93Wjqr4F9F92qF45uFs3CrnIqF9aqFZrZr48Xa47Xr13W34Y9a4DXF98
	AFZxJr1kKF43tjkaLaAFLSUrUUUUbb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbVxFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr1j
	6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6xkF7I0E14v26F
	4UJVW0owAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AK
	xVWUAVWUtwCY02Avz4vE14v_Gr1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr
	0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY
	17CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcV
	C0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY
	6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
	73UjIFyTuYvjfUYdgADUUUU
X-Originating-IP: [124.16.138.129]
X-CM-SenderInfo: xqlfxv3q6l2u1dvotugofq/

Replace a comma between expression statements by a semicolon.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
---
 drivers/tty/hvc/hvsi_lib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tty/hvc/hvsi_lib.c b/drivers/tty/hvc/hvsi_lib.c
index 22e1bc4d8a66..b35c44caf3d7 100644
--- a/drivers/tty/hvc/hvsi_lib.c
+++ b/drivers/tty/hvc/hvsi_lib.c
@@ -303,7 +303,7 @@ int hvsilib_write_mctrl(struct hvsi_priv *pv, int dtr)
 	pr_devel("HVSI@%x: %s DTR...\n", pv->termno,
 		 dtr ? "Setting" : "Clearing");
 
-	ctrl.hdr.type = VS_CONTROL_PACKET_HEADER,
+	ctrl.hdr.type = VS_CONTROL_PACKET_HEADER;
 	ctrl.hdr.len = sizeof(struct hvsi_control);
 	ctrl.verb = cpu_to_be16(VSV_SET_MODEM_CTL);
 	ctrl.mask = cpu_to_be32(HVSI_TSDTR);
-- 
2.25.1



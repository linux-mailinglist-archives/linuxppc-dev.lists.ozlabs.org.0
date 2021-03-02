Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BE2329673
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 07:41:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DqSFg0ZWMz3cVQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Mar 2021 17:41:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=M4IAEP65;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.12.14; helo=m12-14.163.com;
 envelope-from=dingsenjie@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=M4IAEP65; dkim-atps=neutral
X-Greylist: delayed 1011 seconds by postgrey-1.36 at boromir;
 Tue, 02 Mar 2021 14:58:23 AEDT
Received: from m12-14.163.com (m12-14.163.com [220.181.12.14])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DqNdq5Fnfz30Ld
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Mar 2021 14:58:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=6+L6S
 3PF+6atFy4jcL2HpjZWPg77zuao14pJR5Pd/C8=; b=M4IAEP65qhN9uRUtZBpE4
 er8phBbh0WUyuH6eIuy4+yqBs0rp34D0r3bf6HOHHqK5W7dQsYyWLmGwi0Mg3wZH
 nn0lxXc2G79me9A0skSg/6isswce54SHbSWwoyjD/AnuAlWOAOvbWB0fxSvjUI7f
 jsivNSHZxFPLyf5wOC0si4=
Received: from COOL-20201222LC.ccdomain.com (unknown [218.94.48.178])
 by smtp10 (Coremail) with SMTP id DsCowACHnyvHsz1gggkAnQ--.8851S2;
 Tue, 02 Mar 2021 11:40:57 +0800 (CST)
From: dingsenjie@163.com
To: geoff@infradead.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] sound: pps: fix spelling typo of values
Date: Tue,  2 Mar 2021 11:40:53 +0800
Message-Id: <20210302034053.34524-1-dingsenjie@163.com>
X-Mailer: git-send-email 2.21.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsCowACHnyvHsz1gggkAnQ--.8851S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7XF4rtrWDur4UWFyUJryxZrb_yoWxCwbE9a
 ykt3y8Wr95XFsrAr4jyF1rJrWFqas5Aryqgr4xKF4DGw15Zrs5C3y5Cry7Jr97WF4DXFyr
 ZFnYgrnxKr92kjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnzT5PUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: 5glqw25hqmxvi6rwjhhfrp/1tbiTglJyFUDH86npgAAsA
X-Mailman-Approved-At: Tue, 02 Mar 2021 17:40:50 +1100
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
Cc: dingsenjie <dingsenjie@yulong.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: dingsenjie <dingsenjie@yulong.com>

vaules -> values

Signed-off-by: dingsenjie <dingsenjie@yulong.com>
---
 sound/ppc/snd_ps3_reg.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/ppc/snd_ps3_reg.h b/sound/ppc/snd_ps3_reg.h
index 566a318..e2212b7 100644
--- a/sound/ppc/snd_ps3_reg.h
+++ b/sound/ppc/snd_ps3_reg.h
@@ -308,7 +308,7 @@
 each interrupt in this register.
 Writing 1b to a field containing 1b clears field and de-asserts interrupt.
 Writing 0b to a field has no effect.
-Field vaules are the following:
+Field values are the following:
 0 - Interrupt hasn't occurred.
 1 - Interrupt has occurred.
 
-- 
1.9.1



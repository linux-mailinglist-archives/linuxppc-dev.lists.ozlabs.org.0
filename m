Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10725345BBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 11:14:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4S0V09bDz3bqp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 21:14:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=ckSKexqu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=163.com
 (client-ip=220.181.12.15; helo=m12-15.163.com;
 envelope-from=tomstomsczc@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256
 header.s=s110527 header.b=ckSKexqu; dkim-atps=neutral
X-Greylist: delayed 1043 seconds by postgrey-1.36 at boromir;
 Tue, 23 Mar 2021 20:15:04 AEDT
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4QgX66CZz2xZ7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 20:15:03 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=8X1qg
 gjYrOr60RWTjePpjNY4Tvz0un9W9c9kxBNZccc=; b=ckSKexquUmMdAbMwdw1pK
 Vu4dQ/H88GnRk1kOkKZJfLEFhHN4l7jfpYuIDrjsq4IGN1ZkpT8pe+XvSv5XXQR5
 kB9/XIuAhHKVQVvHkUdV6kWB89Y534sK5tU0BNxKckL9QByjqGSfWOXkz8NR7zlT
 +jD+ZRhapu+gnU7sZqVMKw=
Received: from caizhichao.ccdomain.com (unknown [218.94.48.178])
 by smtp11 (Coremail) with SMTP id D8CowADHDAEDrVlgKAJaGA--.51S2;
 Tue, 23 Mar 2021 16:55:48 +0800 (CST)
From: caizhichao <tomstomsczc@163.com>
To: geoff@infradead.org,
	perex@perex.cz,
	tiwai@suse.com
Subject: [PATCH] sound:ppc: fix spelling typo of values
Date: Tue, 23 Mar 2021 16:55:43 +0800
Message-Id: <20210323085543.741-1-tomstomsczc@163.com>
X-Mailer: git-send-email 2.30.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: D8CowADHDAEDrVlgKAJaGA--.51S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Gr1DZw4rAF4kuFW5GF45Wrg_yoWxCwbE9a
 ykArW8WF95XFsrCr1YyF1rGr4Yqas8Cr929r47KF1DGw4Yvrs5G3yrAry7Jr92gF1vvry5
 WF9YgrnxKr92kjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU0RBTUUUUUU==
X-Originating-IP: [218.94.48.178]
X-CM-SenderInfo: pwrp23prpvu6rf6rljoofrz/xtbBdRReilaD+k4Q8wAAs3
X-Mailman-Approved-At: Tue, 23 Mar 2021 21:14:29 +1100
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
Cc: alsa-devel@alsa-project.org, caizhichao <caizhichao@yulong.com>,
 linux-kernel@vger.kernel.org, paulus@samba.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: caizhichao <caizhichao@yulong.com>

vaules -> values

Signed-off-by: caizhichao <caizhichao@yulong.com>
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



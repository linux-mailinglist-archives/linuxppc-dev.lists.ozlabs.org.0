Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 203FE58931B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 22:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lyjxb0l2Mz3bpW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Aug 2022 06:24:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iO8q7J2u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=163.com (client-ip=220.181.12.11; helo=m12-11.163.com; envelope-from=studentxswpy@163.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=iO8q7J2u;
	dkim-atps=neutral
X-Greylist: delayed 966 seconds by postgrey-1.36 at boromir; Tue, 02 Aug 2022 17:58:13 AEST
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxnRT50ttz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 17:58:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DNakM
	8KxiYtvg6qSWyaAM8M+Rao4NDhg/QTEDD4Tz1A=; b=iO8q7J2uY2+W4GAacA88e
	b3jRb1ul1eb5ZC80FXfLBYkvHLGaWI8JttFPT2skA9xZ0Lh/mkmZ9h93ySICPVNC
	bqK7R8d2vmJCglcS3Zco1nE5aH/bW4JWXHjrQFTmxTcgTl7JZo5yFgZpcRCOzKfF
	sy+6lVS4/KKzAwq0awN+NY=
Received: from localhost.localdomain (unknown [123.58.221.99])
	by smtp7 (Coremail) with SMTP id C8CowABHmrpD1ehiPIRqRg--.2476S2;
	Tue, 02 Aug 2022 15:41:57 +0800 (CST)
From: studentxswpy@163.com
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: check the return value of ioremap() in macio_init()
Date: Tue,  2 Aug 2022 15:41:48 +0800
Message-Id: <20220802074148.3213659-1-studentxswpy@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: C8CowABHmrpD1ehiPIRqRg--.2476S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7Xw4kuF45tF15trWDXryrWFg_yoW3KrXEya
	4SvFs7XanFk3WUtr1DKF1fX34UKF18uFyDXa15KrZxCa48CFyxXFs5ZryDWa4UZF40ya9x
	CFs5XFyvywsFkjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8gVy7UUUUU==
X-Originating-IP: [123.58.221.99]
X-CM-SenderInfo: xvwxvv5qw024ls16il2tof0z/1tbiHQVRJGI66PZqHgAAsf
X-Mailman-Approved-At: Thu, 04 Aug 2022 06:23:31 +1000
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
Cc: Hacash Robot <hacashRobot@santino.com>, Xie Shaowen <studentxswpy@163.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Xie Shaowen <studentxswpy@163.com>

The function ioremap() in macio_init() can fail, so
its return value should be checked.

Fixes: 36874579dbf4c ("[PATCH] powerpc: macio-adb build fix")
Reported-by: Hacash Robot <hacashRobot@santino.com>
Signed-off-by: Xie Shaowen <studentxswpy@163.com>
---
 drivers/macintosh/macio-adb.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/macintosh/macio-adb.c b/drivers/macintosh/macio-adb.c
index 9b63bd2551c6..cd4e34d15c26 100644
--- a/drivers/macintosh/macio-adb.c
+++ b/drivers/macintosh/macio-adb.c
@@ -108,6 +108,10 @@ int macio_init(void)
 		return -ENXIO;
 	}
 	adb = ioremap(r.start, sizeof(struct adb_regs));
+	if (!adb) {
+		of_node_put(adbs);
+		return -ENOMEM;
+	}
 
 	out_8(&adb->ctrl.r, 0);
 	out_8(&adb->intr.r, 0);
-- 
2.25.1


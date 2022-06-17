Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2592D54F9FB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 17:17:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPjMl0KH2z3c97
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 01:17:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=BLYii+Cd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.113; helo=m15113.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=BLYii+Cd;
	dkim-atps=neutral
Received: from m15113.mail.126.com (m15113.mail.126.com [220.181.15.113])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPjM30xQNz305C
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 01:17:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=vy1/z
	mDGugMG37ryPH+Tv9++kz/jYiS+PNBOnKejF74=; b=BLYii+CdmmgloV+8qoUs6
	5D5Gkl9KEhdNq39k35e9sspeBUc+UlYSxr5/X/izQ+2caoRxwtj+O/d83Mofx1Q6
	0gcIIFxsOv5nRugHhtamRuw7BUJAtW+FJ6BVr+4LjOv1ZdggYQWzd6w5NVIycomT
	uZTMn5PBwkRbyz5rv0p+9U=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp3 (Coremail) with SMTP id DcmowADHZZf0maxiKDiLDg--.37809S2;
	Fri, 17 Jun 2022 23:12:53 +0800 (CST)
From: Liang He <windhl@126.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org,
	christophe.leroy@csgroup.eu,
	joel@jms.id.au
Subject: [PATCH] powerpc: sysdev: Fix refcount leak bug in mpic_msgr
Date: Fri, 17 Jun 2022 23:12:52 +0800
Message-Id: <20220617151252.4051291-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcmowADHZZf0maxiKDiLDg--.37809S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr1kKr1UGr1ftF1kWF13CFg_yoWfZrcEk3
	Z2g34kAFWkJr48ZFsxZrWrX3Z5A3WfWrn8Jrn2qa17Aw1aqa17Xw47X395AryqgFsFy3yr
	AFn3Wrnaga40yjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUjnYwUUUUUU==
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbiuBYjF2JVj6in2AAAs1
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
Cc: linuxppc-dev@lists.ozlabs.org, windhl@126.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In mpic_msgr_number_of_blocks() and mpic_msgr_block_number(),
of_find_node_by_name() will return a node pointer with refcount
incremented. We should use of_node_put() when it is not used
anymore.

Signed-off-by: Liang He <windhl@126.com>
---
 arch/powerpc/sysdev/mpic_msgr.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/sysdev/mpic_msgr.c b/arch/powerpc/sysdev/mpic_msgr.c
index 698fefaaa6dd..c2a235d9eb09 100644
--- a/arch/powerpc/sysdev/mpic_msgr.c
+++ b/arch/powerpc/sysdev/mpic_msgr.c
@@ -122,6 +122,7 @@ static unsigned int mpic_msgr_number_of_blocks(void)
 			count += 1;
 		}
 	}
+	of_node_put(aliases);
 
 	return count;
 }
@@ -150,6 +151,7 @@ static int mpic_msgr_block_number(struct device_node *node)
 		if (node == of_find_node_by_path(prop->value))
 			break;
 	}
+	of_node_put(aliases);
 
 	return index == number_of_blocks ? -1 : index;
 }
-- 
2.25.1


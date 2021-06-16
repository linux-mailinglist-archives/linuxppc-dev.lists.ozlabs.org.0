Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0133A9E1B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 16:51:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4p6m10Vhz3byq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 00:51:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=vivo.com header.i=@vivo.com header.a=rsa-sha256 header.s=default header.b=ZeLfAbsO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=vivo.com (client-ip=115.236.121.144;
 helo=mail-m121144.qiye.163.com; envelope-from=wanjiabing@vivo.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dkim=fail reason="key not found in DNS" header.d=vivo.com header.i=@vivo.com
 header.a=rsa-sha256 header.s=default header.b=ZeLfAbsO; 
 dkim-atps=neutral
X-Greylist: delayed 551 seconds by postgrey-1.36 at boromir;
 Thu, 17 Jun 2021 00:51:21 AEST
Received: from mail-m121144.qiye.163.com (mail-m121144.qiye.163.com
 [115.236.121.144])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4p6K6Bfrz306n
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 00:51:20 +1000 (AEST)
DKIM-Signature: a=rsa-sha256;
 b=ZeLfAbsON47mDckqA0db4BwOC11IAO/fhpl3DqYiVptZ8ix/fPS5pNhIiRWknn/sL9uSFVaJUVWG1IsJRn9y6QgHs9jMnAFANwDT5z6dO53VAVM1pXjjxKUblnm7zb2czlK6gwPGIy7QNjnzGJ7yMPwXFdEt1535avkjh6lFmCA=;
 s=default; c=relaxed/relaxed; d=vivo.com; v=1;
 bh=7jayIAvLdxe4BYaM+zA/siNMUWJMUwXobFneLmZhBhs=;
 h=date:mime-version:subject:message-id:from;
Received: from wanjb-KLV-WX9.. (unknown [121.229.73.16])
 by mail-m121144.qiye.163.com (Hmail) with ESMTPA id AFF13AC0173;
 Wed, 16 Jun 2021 22:41:52 +0800 (CST)
From: Wan Jiabing <wanjiabing@vivo.com>
To: Geoff Levand <geoff@infradead.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] PS3: Remove unneeded semicolons
Date: Wed, 16 Jun 2021 22:41:31 +0800
Message-Id: <20210616144131.27441-1-wanjiabing@vivo.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ0IaTFYZHUJKSxhOSx5CGEhVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oj46Ngw6HT8SEU4dMR8aOSwq
 MEMwCzJVSlVKTUlIQ05PTkpISk1MVTMWGhIXVQwaFRESGhkSFRw7DRINFFUYFBZFWVdZEgtZQVlK
 SUpVSUlCVUxIVUpNWVdZCAFZQUlLT083Bg++
X-HM-Tid: 0a7a15457ab5b039kuuuaff13ac0173
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
Cc: kael_w@yeah.net, Wan Jiabing <wanjiabing@vivo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix coccicheck warning:

./arch/powerpc/platforms/ps3/system-bus.c:607:2-3: Unneeded semicolon
./arch/powerpc/platforms/ps3/system-bus.c:766:2-3: Unneeded semicolon

Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
---
 arch/powerpc/platforms/ps3/system-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index 1a5665875165..f57f37fe038c 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -604,7 +604,7 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
 	default:
 		/* not happned */
 		BUG();
-	};
+	}
 	result = ps3_dma_map(dev->d_region, (unsigned long)ptr, size,
 			     &bus_addr, iopte_flag);
 
@@ -763,7 +763,7 @@ int ps3_system_bus_device_register(struct ps3_system_bus_device *dev)
 		break;
 	default:
 		BUG();
-	};
+	}
 
 	dev->core.of_node = NULL;
 	set_dev_node(&dev->core, 0);
-- 
2.30.2


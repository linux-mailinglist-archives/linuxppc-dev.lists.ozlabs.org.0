Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B213A560C1E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 00:13:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYG1p4mc0z3dsP
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 08:13:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.54.12; helo=smtpbg.qq.com; envelope-from=yuanjilin@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 315 seconds by postgrey-1.36 at boromir; Wed, 29 Jun 2022 23:01:02 AEST
Received: from smtpbg.qq.com (biz-43-154-54-12.mail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LY1mZ6xp1z3bqN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jun 2022 23:01:00 +1000 (AEST)
X-QQ-mid: bizesmtp63t1656507291tfsra6c3
Received: from localhost.localdomain ( [182.148.13.66])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 29 Jun 2022 20:54:48 +0800 (CST)
X-QQ-SSF: 0100000000200060C000C00A0000000
X-QQ-FEAT: xoS364mEyr00dFkTgfgNEjTaoF4BmwMd0CJyYGBO7nG8ghAnd04j3/n2cv+cO
	+wrHSkmNl3aNXNDMUN9e99ldFJgDUvmcmwIum6NyP7X+i7FA2jTKQgYpOj1j2xucTNyzgq9
	vJ+a+sqnYHuHkHuVwBM+t0a84XnxTAmTKfj5HULnf06+gYoYZcSdnwY4mNWYeRGnM8A8GCc
	vh/IbEXoGhH0LRkuVKYm3yPADPKbfXfhn0qV5DS6pd0H9QfkVKG8lMCOfIoAJLxSsgiXlAs
	zymwHrzeUglHsXnFQiGDwlavaWfVsO1+oTK+ZcFZZc+n+R+qtGp6p4X6mipXeSaZV2tMPN1
	npWneCq5Y4KttdBBdg=
X-QQ-GoodBg: 0
From: Jilin Yuan <yuanjilin@cdjrlc.com>
To: pantelis.antoniou@gmail.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com
Subject: [PATCH] freescale/fs_enet:fix repeated words in comments
Date: Wed, 29 Jun 2022 20:54:41 +0800
Message-Id: <20220629125441.62420-1-yuanjilin@cdjrlc.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr4
X-Mailman-Approved-At: Thu, 30 Jun 2022 08:13:02 +1000
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
Cc: netdev@vger.kernel.org, Jilin Yuan <yuanjilin@cdjrlc.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Delete the redundant word 'a'.

Signed-off-by: Jilin Yuan <yuanjilin@cdjrlc.com>
---
 drivers/net/ethernet/freescale/fs_enet/fs_enet.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
index 5ff2634bee2f..cb419aef8d1b 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet.h
@@ -201,7 +201,7 @@ void fs_enet_platform_cleanup(void);
 
 /* access macros */
 #if defined(CONFIG_CPM1)
-/* for a a CPM1 __raw_xxx's are sufficient */
+/* for a CPM1 __raw_xxx's are sufficient */
 #define __cbd_out32(addr, x)	__raw_writel(x, addr)
 #define __cbd_out16(addr, x)	__raw_writew(x, addr)
 #define __cbd_in32(addr)	__raw_readl(addr)
-- 
2.36.1


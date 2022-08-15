Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90420593A87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Aug 2022 21:59:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M64qz3cMgz3cFK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Aug 2022 05:59:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cdjrlc.com (client-ip=43.154.54.12; helo=bg5.exmail.qq.com; envelope-from=gaoxin@cdjrlc.com; receiver=<UNKNOWN>)
X-Greylist: delayed 316 seconds by postgrey-1.36 at boromir; Tue, 16 Aug 2022 05:59:20 AEST
Received: from bg5.exmail.qq.com (bg4.exmail.qq.com [43.154.54.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M64qX45Nmz2xJ7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Aug 2022 05:59:20 +1000 (AEST)
X-QQ-mid: bizesmtp69t1660593215tx3hnipr
Received: from harry-jrlc.. ( [182.148.12.144])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 16 Aug 2022 03:53:23 +0800 (CST)
X-QQ-SSF: 0100000000200050C000B00A0000020
X-QQ-FEAT: LG+NUo/f6sHc2m+cla/T+TR13heGFQ57WGv8lyWz+MZXwhlAK72VuvQreUg9X
	rVxxcEAhGeBkoGVsEE/39EHtyMQH0pfQEbV/+hVdnsli4VHitkd4wWIGCbRhQlkpMtC8gpe
	2FFLHZCnYzl0z2vNe9M1ovLOUHpRiihnkG3QOg0XMHOZQcjau+L1yFYT4jvPQ+2pHutx/3K
	N4/3olFCLPVmPsLNBJMHj1e74R+2bHM3gPGWCK1e4gFnzgZ0Bj6xtMZEhyUwFqhk+ZVpQ5a
	f4k6eoHr0jrE2/Q7t/lZOmIDXZgTPo40w+YSZpkfdixYoD1YWg+YXsofBFD5WPY7DMlTiDa
	vajZB6Kq+id2No9KWmF3NNDU1nrO+lS5GyoL95trIp4iCDT3z004SW1aAK/YQ==
X-QQ-GoodBg: 0
From: Xin Gao <gaoxin@cdjrlc.com>
To: mpe@ellerman.id.au
Subject: [PATCH] treewide: Complete variable type
Date: Tue, 16 Aug 2022 03:53:22 +0800
Message-Id: <20220815195322.3683-1-gaoxin@cdjrlc.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:cdjrlc.com:qybglogicsvr:qybglogicsvr6
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Xin Gao <gaoxin@cdjrlc.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

It is better to use "unsigned int" instead of "unsigned", line 24.

Signed-off-by: Xin Gao <gaoxin@cdjrlc.com>
---
 arch/powerpc/boot/epapr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/epapr.c b/arch/powerpc/boot/epapr.c
index 7c5b26ade6c4..4133bee28673 100644
--- a/arch/powerpc/boot/epapr.c
+++ b/arch/powerpc/boot/epapr.c
@@ -21,7 +21,7 @@ BSS_STACK(4096);
 #define EPAPR_SMAGIC	0x65504150
 #define EPAPR_EMAGIC	0x45504150
 
-static unsigned epapr_magic;
+static unsigned int epapr_magic;
 static unsigned long ima_size;
 static unsigned long fdt_addr;
 
-- 
2.30.2


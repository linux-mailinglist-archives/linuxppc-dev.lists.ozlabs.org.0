Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3A3576C4A
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 08:55:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlJs80thFz3cdl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jul 2022 16:55:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Wqbjv3Hn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=126.com (client-ip=220.181.15.114; helo=m15114.mail.126.com; envelope-from=windhl@126.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=126.com header.i=@126.com header.a=rsa-sha256 header.s=s110527 header.b=Wqbjv3Hn;
	dkim-atps=neutral
Received: from m15114.mail.126.com (m15114.mail.126.com [220.181.15.114])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LlJrR67pLz3blD
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jul 2022 16:54:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=mGezQ
	zdrPEbSOowusAnTwJgfMX0zyo63gGcLRVcnMzQ=; b=Wqbjv3Hn8V5HXfdzfttCv
	VtpVWjoVoicrsAiYVkISIrPoNAnxfgN692D1IO85kubsNZGsDh2/oEfJlozN9DOq
	OxAdBh3PHIM7mK6up2s3GJJ4ScbJ5a/TNpX8f1VhcTufYBjYVuT1M9iXNpQQpt06
	+99xh87WJOsRNWsFc4v6uo=
Received: from localhost.localdomain (unknown [124.16.139.61])
	by smtp7 (Coremail) with SMTP id DsmowAAnxv6UYNJiG08yFA--.15408S2;
	Sat, 16 Jul 2022 14:54:13 +0800 (CST)
From: Liang He <windhl@126.com>
To: benh@kernel.crashing.org,
	mpe@ellerman.id.au,
	paulus@samba.org,
	linuxppc-dev@lists.ozlabs.org,
	windhl@126.com
Subject: [PATCH] powerpc/powermac/feature: Fix refcount leak bug
Date: Sat, 16 Jul 2022 14:54:12 +0800
Message-Id: <20220716065412.539153-1-windhl@126.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DsmowAAnxv6UYNJiG08yFA--.15408S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CrW3KF48KrWkWrW5Kw4fGrg_yoW8Kr48pr
	s5WrWavrn7tr1rJa1xta48urWYkFn5Jr4UJ3WxCwnFvFsxW3s3tw4jkF1rZrZxJFW8Xa4r
	Ar4SqFs5CFn7CFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi4CJdUUUUU=
X-Originating-IP: [124.16.139.61]
X-CM-SenderInfo: hzlqvxbo6rjloofrz/1tbi2hZAF1uwMag0oQAAs8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In probe_one_macio(), we should call of_node_put() for the refernece
'node' escaped out of the for_each_node_by_name() which has increased
its refcount. While the 'node' will finally escaped into a global
reference, we should still call of_node_put() in fail path which will
stop global reference creation.

Fixes: 51d3082fe6e5 ("[PATCH] powerpc: Unify udbg (#2)")
Signed-off-by: Liang He <windhl@126.com>
---
 commit-51d3082fe6e5 first introduces the 'of_find_node_by_name' which
involved the refcounting bug.

 arch/powerpc/platforms/powermac/feature.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/platforms/powermac/feature.c
index 5cc958adba13..0382d20b5619 100644
--- a/arch/powerpc/platforms/powermac/feature.c
+++ b/arch/powerpc/platforms/powermac/feature.c
@@ -2632,31 +2632,31 @@ static void __init probe_one_macio(const char *name, const char *compat, int typ
 		if (!macio_chips[i].of_node)
 			break;
 		if (macio_chips[i].of_node == node)
-			return;
+			goto out_put;
 	}
 
 	if (i >= MAX_MACIO_CHIPS) {
 		printk(KERN_ERR "pmac_feature: Please increase MAX_MACIO_CHIPS !\n");
 		printk(KERN_ERR "pmac_feature: %pOF skipped\n", node);
-		return;
+		goto out_put;
 	}
 	addrp = of_get_pci_address(node, 0, &size, NULL);
 	if (addrp == NULL) {
 		printk(KERN_ERR "pmac_feature: %pOF: can't find base !\n",
 		       node);
-		return;
+		goto out_put;
 	}
 	addr = of_translate_address(node, addrp);
 	if (addr == 0) {
 		printk(KERN_ERR "pmac_feature: %pOF, can't translate base !\n",
 		       node);
-		return;
+		goto out_put;
 	}
 	base = ioremap(addr, (unsigned long)size);
 	if (!base) {
 		printk(KERN_ERR "pmac_feature: %pOF, can't map mac-io chip !\n",
 		       node);
-		return;
+		goto out_put;
 	}
 	if (type == macio_keylargo || type == macio_keylargo2) {
 		const u32 *did = of_get_property(node, "device-id", NULL);
@@ -2677,6 +2677,11 @@ static void __init probe_one_macio(const char *name, const char *compat, int typ
 		macio_chips[i].rev = *revp;
 	printk(KERN_INFO "Found a %s mac-io controller, rev: %d, mapped at 0x%p\n",
 		macio_names[type], macio_chips[i].rev, macio_chips[i].base);
+
+	return;
+
+out_put:
+	of_node_put(node);
 }
 
 static int __init
-- 
2.25.1


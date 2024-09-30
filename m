Return-Path: <linuxppc-dev+bounces-1685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B013989C39
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2024 10:11:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XHDKp63wSz2xSl;
	Mon, 30 Sep 2024 18:11:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.191
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727683867;
	cv=none; b=FxNeEwuK4VX/Sm0TjUDpQBNCpAy/jeXanJp+ZNPw6FTnl0/xCpxD+e7JkLQWEY4SK8RrQBU9R817xCHjyb+/b4IJkqNsXBbIwWje83b3/sbJVM0/40Q7fFyUF7uNl0yuZAM99NggWzJUJ7STlCMBOElmGR1IsPlq6S/cRc/7Iac3X4LCfR9Uo2Xo4A8E2/7XT96OwHMWGrIjdPY1gfbposnubUUv2hzsqsD9nVi6S1vaDVOO7jREmGIC8Kl1ASsBhjN6F60uCA3rUZ9YGoM3TiZNmYtKHpnBHv54ijT1HENdV7iaaj3MpAIsHpK/tBAC57w/rsWyb2y4BA1OUQNDHw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727683867; c=relaxed/relaxed;
	bh=HLycQApx8pxhD8j47d1dL2iWz5ynQbkYEqHPYwUfLbM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CVlwoqknPFT5DggsWYWmaEPmpc050iMa934sJ50ksMTfnqwRIMD2Z/bpus6bUQzZaZUnAJ9e7pyod8dc3tRgIR3sJXxm9j3LWvJBNDLYth/xhPHDYh6PMasgNL3YVtejXj3YWttKVhcfbmv7S28aYC2AAZMh7CVVlHw3qtUTh2iOWeQaW2bBUtgOSsru7KJs7lTuiAqydpS6noPdunlSqHzEYtxYydvVrKyKGx8gyvT35mgdnym/QA2A5a7bhdHl7pcEt+gM0ftDby/WmU/4c6plNL1tDNIPQH0EmXc/KXWvryalei/FvXUnfZCV7u/DHeQj6/WHKG3VPtuiOGMOKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.191; helo=szxga05-in.huawei.com; envelope-from=zhangzekun11@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XHDKk1zgdz2xQK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2024 18:11:01 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XHDJT6ymMz2QTvx;
	Mon, 30 Sep 2024 16:10:01 +0800 (CST)
Received: from kwepemf500003.china.huawei.com (unknown [7.202.181.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 6AC741A0188;
	Mon, 30 Sep 2024 16:10:55 +0800 (CST)
Received: from huawei.com (10.175.112.208) by kwepemf500003.china.huawei.com
 (7.202.181.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Sep
 2024 16:10:54 +0800
From: Zhang Zekun <zhangzekun11@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <maddy@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
CC: <chenjun102@huawei.com>, <zhangzekun11@huawei.com>
Subject: [PATCH] powerpc/kexec: Fix the return of uninitialized variable
Date: Mon, 30 Sep 2024 15:56:28 +0800
Message-ID: <20240930075628.125138-1-zhangzekun11@huawei.com>
X-Mailer: git-send-email 2.17.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.208]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemf500003.china.huawei.com (7.202.181.241)
X-Spam-Status: No, score=0.0 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

The of_property_read_u64() can fail and remain the variable uninitialized,
which will then be used. Return error if we failed to read the property.

Fixes: 2e6bd221d96f ("powerpc/kexec_file: Enable early kernel OPAL calls")
Signed-off-by: Zhang Zekun <zhangzekun11@huawei.com>
---
 arch/powerpc/kexec/file_load_64.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
index 9738adabeb1f..dc65c1391157 100644
--- a/arch/powerpc/kexec/file_load_64.c
+++ b/arch/powerpc/kexec/file_load_64.c
@@ -736,13 +736,18 @@ int setup_purgatory_ppc64(struct kimage *image, const void *slave_code,
 	if (dn) {
 		u64 val;
 
-		of_property_read_u64(dn, "opal-base-address", &val);
+		ret = of_property_read_u64(dn, "opal-base-address", &val);
+		if (ret)
+			goto out;
+
 		ret = kexec_purgatory_get_set_symbol(image, "opal_base", &val,
 						     sizeof(val), false);
 		if (ret)
 			goto out;
 
-		of_property_read_u64(dn, "opal-entry-address", &val);
+		ret = of_property_read_u64(dn, "opal-entry-address", &val);
+		if (ret)
+			goto out;
 		ret = kexec_purgatory_get_set_symbol(image, "opal_entry", &val,
 						     sizeof(val), false);
 	}
-- 
2.17.1



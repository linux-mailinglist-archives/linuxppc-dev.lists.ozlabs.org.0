Return-Path: <linuxppc-dev+bounces-351-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ABE95B78D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 15:55:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqPq65mwyz2yR9;
	Thu, 22 Aug 2024 23:55:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724331982;
	cv=none; b=EZNQRtBB5gL2zCjH6g7L9seqmBe2ls0ZXaiWWditnhmzNDvN98fzueR6uPmiritk7oC/GYpy9Amtku4/un0rRpWDQqMVOfhzNGdae9ealYPtTfVH/zz66VyJ7W4Q8kTqSJBwZR0nRGhXkt5R0kRn7AAY5tdp2YjvsaCvRDYsOVIub0qkOODNDHYd+uvDfr+2OoR98+HR9jfvSke0Tpu7ULO/z2oLeRIIANKJdzxXEq9Axu6kcKF7ti3y+AiRRC+epuHCXwr9FjRp8UqPGDlLc9PL6mWd0+h3K7vuNqWyOvEyqoTlL+IiRRAhmbiqcg5N4XfYXBvJANfXpNmmR9pMJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724331982; c=relaxed/relaxed;
	bh=zaoBtypygZSI6j4bBgXLowImhXp4LtSLDIuMumd9sps=;
	h=X-Greylist:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-Originating-IP:
	 X-ClientProxiedBy; b=P8PNJ46VMy+CzNLxKoc6gBPxU+Vwvbzan2Pt9JJVIMRBOhDw5I79nrcivwSny4eVjJCtCoVhFYfD//6cNtZNWDc5AbkYTcgXPs/4K4lkN50cffwPztuPZV0aj3YAXHufj+9oG/CXHYVeWdFXDbaaJvnDhTO0CAi6xRGILl/F6EbJ8Q/yCWTbfITZPqdB1G7EDvH35eEX4oRVYmwlheuke8rJA59z4yQVac/pfjSpYawn5lsuXnVEkZtexUYBTKXb1vyippQW4ftg0w0+NXen+ItMTcrm56q5bQcDZcrFkuTiozAFrLo0vMLpBEb36IskWXa/3kIZwVJUdx/rXZGb1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=cuigaosheng1@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 323 seconds by postgrey-1.37 at boromir; Thu, 22 Aug 2024 23:06:22 AEST
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WqNkQ3412z2yN1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2024 23:06:22 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4WqNjR626gz13lgB;
	Thu, 22 Aug 2024 21:05:31 +0800 (CST)
Received: from kwepemd200011.china.huawei.com (unknown [7.221.188.251])
	by mail.maildlp.com (Postfix) with ESMTPS id 3A8B018009B;
	Thu, 22 Aug 2024 21:06:12 +0800 (CST)
Received: from cgs.huawei.com (10.244.148.83) by
 kwepemd200011.china.huawei.com (7.221.188.251) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Thu, 22 Aug 2024 21:06:11 +0800
From: Gaosheng Cui <cuigaosheng1@huawei.com>
To: <mpe@ellerman.id.au>, <npiggin@gmail.com>, <christophe.leroy@csgroup.eu>,
	<naveen@kernel.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
	<Liam.Howlett@oracle.com>, <tglx@linutronix.de>, <cuigaosheng1@huawei.com>,
	<bgray@linux.ibm.com>, <joel@jms.id.au>, <bhelgaas@google.com>
CC: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH -next 2/4] powerpc: Remove obsoleted declaration for maple_calibrate_decr
Date: Thu, 22 Aug 2024 21:06:07 +0800
Message-ID: <20240822130609.786431-3-cuigaosheng1@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822130609.786431-1-cuigaosheng1@huawei.com>
References: <20240822130609.786431-1-cuigaosheng1@huawei.com>
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
Content-Type: text/plain
X-Originating-IP: [10.244.148.83]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemd200011.china.huawei.com (7.221.188.251)

The maple_calibrate_decr() have been removed since
commit 10f7e7c15e6c ("[PATCH] ppc64: consolidate calibrate_decr
implementations"), and now it is useless, so remove it.

Signed-off-by: Gaosheng Cui <cuigaosheng1@huawei.com>
---
 arch/powerpc/platforms/maple/maple.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/platforms/maple/maple.h b/arch/powerpc/platforms/maple/maple.h
index 4f358b55c341..8ddbaa4ebd0b 100644
--- a/arch/powerpc/platforms/maple/maple.h
+++ b/arch/powerpc/platforms/maple/maple.h
@@ -7,7 +7,6 @@
 extern int maple_set_rtc_time(struct rtc_time *tm);
 extern void maple_get_rtc_time(struct rtc_time *tm);
 extern time64_t maple_get_boot_time(void);
-extern void maple_calibrate_decr(void);
 extern void maple_pci_init(void);
 extern void maple_pci_irq_fixup(struct pci_dev *dev);
 extern int maple_pci_get_legacy_ide_irq(struct pci_dev *dev, int channel);
-- 
2.25.1



Return-Path: <linuxppc-dev+bounces-2721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CF09B636D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 13:55:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdnCP2hhZz2ygG;
	Wed, 30 Oct 2024 23:54:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.255
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730292897;
	cv=none; b=E/LmzVZJsLY2IVjWwC1NH2gotZbXbNvppGqH9eII1wHkHc1273d/mVyU7UiyczE/PZryqBq+oo+iekIIrMqv5wkEfUucYSsAR4H71DnCM/YIG1MAubVXJr4PgHbfFjLCnNS9oMY5yIT40JxF1aq5wXZk81OjKjMuMqXhyilU3XE5rtGLc+4LVkLaFZWNwc34EDOkmmwSKXK+bpffgE9f2wkqRr6ssyrHIW6QHBseg2pfytWiPJzBfkUVDCRGo152x3XmnuyaF9NJ74vWZBazURC6rOXnRmYdd3DFTUsMBw5x75pOTdEVdbuDKG7VUWJhHOB7hTzex+oIK9FLi61lAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730292897; c=relaxed/relaxed;
	bh=nCkJxl64TFoivXnjWLAmDpTZu1SPFMNla8fLWwo/+p0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FLrU6az2nkUv/Yb762Po+nZuQNpP5+1eDdg2bDnrt24/FXqjnfgjSGA3UJfmZXNT8UIsrAWK6ZS6/R2AYOx1HWWdYeoeXdNQOhvZjNlkZSGZZ8DlcbQyMVmYk9Wc9ZoRnVLgtGTWc0uIOQ4mScTdUnCfuN+iNbv7FguLmh6AswU6aGKZ70mQE2Trdsxxa25BLKbJpM8oOcGSg3bYryXMyFMIMCJcInujACUl2fqN2+SkZjktyWeX8lr19vDH7EdSeMqlNoQEcP0o5eqif5b01qsPjq5Nb3kC0TTj4e6hrWE0GVfVzkCkj8pRYOUc+ffILP+Sdx3bNJ1h76rnuCaGUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.255; helo=szxga08-in.huawei.com; envelope-from=yangyicong@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdnCM57FRz2yfm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 23:54:54 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Xdn8h61hPz1T9MM;
	Wed, 30 Oct 2024 20:52:36 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id BCDEC1800A5;
	Wed, 30 Oct 2024 20:54:47 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Wed, 30 Oct 2024 20:54:46 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <sudeep.holla@arm.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <mpe@ellerman.id.au>,
	<linux-arm-kernel@lists.infradead.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <pierre.gondois@arm.com>,
	<dietmar.eggemann@arm.com>
CC: <linuxppc-dev@lists.ozlabs.org>, <x86@kernel.org>,
	<linux-kernel@vger.kernel.org>, <morten.rasmussen@arm.com>,
	<msuchanek@suse.de>, <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
	<jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <xuwei5@huawei.com>,
	<guohanjun@huawei.com>
Subject: [PATCH v7 4/4] arm64: Kconfig: Enable HOTPLUG_SMT
Date: Wed, 30 Oct 2024 20:54:15 +0800
Message-ID: <20241030125415.18994-5-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241030125415.18994-1-yangyicong@huawei.com>
References: <20241030125415.18994-1-yangyicong@huawei.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-Spam-Status: No, score=-2.3 required=5.0 tests=RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Yicong Yang <yangyicong@hisilicon.com>

Enable HOTPLUG_SMT for SMT control.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index fd9df6dcc593..cccd0a07c050 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -243,6 +243,7 @@ config ARM64
 	select HAVE_KRETPROBES
 	select HAVE_GENERIC_VDSO
 	select HOTPLUG_CORE_SYNC_DEAD if HOTPLUG_CPU
+	select HOTPLUG_SMT if HOTPLUG_CPU
 	select IRQ_DOMAIN
 	select IRQ_FORCED_THREADING
 	select KASAN_VMALLOC if KASAN
-- 
2.24.0



Return-Path: <linuxppc-dev+bounces-12873-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 78503BDC2CA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 04:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmb2t0qpLz3chg;
	Wed, 15 Oct 2025 13:42:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760496133;
	cv=none; b=FHwd97EOWGIqHwvs7QE/rrthEfGFemDiyOPUcekIcVpLP2w4oxVcP/rCGwd16xjxTjnCz/4wPlpiy7WMkfrRdhWNHYIvvNlUSw9thF5T+Zhdp4coBw9x6xiMgBlnfHu+xOeWGjaCnORZaO5tJpv47Y4N9Yox9brJa0MgKoZQSykWili0F6LAJ5rgQMqMu04ZF/AbPxTQC4/dDScQYxl7CM+UAKcuWYn0zmSE+c1rfnHX17NiYif6OAw+fv8qLBN8iq4DjJSpxYEuDItVQXjMyKype2M52oH6gifb47iPWwYuSUYMJ3KLYIQZjdNcq5wvMqv6m+AX0PHpUl8b2LLKgg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760496133; c=relaxed/relaxed;
	bh=2YpK1F7xJrl75rOzzaOJkPak7Buh/ePLPsLeAsL/GDA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=U59n6TTjSWRzpCr8NO5aHH/FBH2lxJqipplRkgiDvUdhiIbMF36t+rsq/71+VEDAPKShN2KrsMyk0x6hQVIxm8sdgY7inb9iYxiWP1/7lXy4HxYLE4h7t3NKh1lQZ5fBDGI0DGCz0bXudA8Jh1x/VfUxO1/VUKnWft1uVwrwhCz2D8DRrwqt/2H7hm9aw8FjXzvBVBZdZJk4sF1YhfFID/95OLwyAucha3b0ZeoF3oBmK+NHEJpF80r6sLmSqOJAgBLYonoiyHGeiIXxPeFqgeT5d6Wq9VcwIcedcGbPqI2QHqn2EmgB1PnS6UDSQoeSxb3oqJWTB2dLz6tIfiqE5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=R3h4itYj; dkim-atps=neutral; spf=pass (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=R3h4itYj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=xueshuai@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmb2r5T6Xz3cdV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 13:42:11 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1760496127; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=2YpK1F7xJrl75rOzzaOJkPak7Buh/ePLPsLeAsL/GDA=;
	b=R3h4itYjGBqfP7ru5V5JDXIgkeJtRIEybW7wg1Y3ho3V8bxu0dxywYq9tafz2FQA/T6xoJLZTQl1a33+j+5gMBOY6sdrLCZnhhnvr0JVobvjJQ6peuH1Avvdc2lNWaSNQs7UckwVxheqKwqSp5HWoWjRmo5+sXIeofaPgIXeHZc=
Received: from localhost.localdomain(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0WqEYD84_1760496125 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 15 Oct 2025 10:42:05 +0800
From: Shuai Xue <xueshuai@linux.alibaba.com>
To: linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	bhelgaas@google.com,
	kbusch@kernel.org,
	sathyanarayanan.kuppuswamy@linux.intel.com
Cc: mahesh@linux.ibm.com,
	oohall@gmail.com,
	xueshuai@linux.alibaba.com,
	Jonathan.Cameron@huawei.com,
	terry.bowman@amd.com,
	tianruidong@linux.alibaba.com,
	lukas@wunner.de
Subject: [PATCH v6 5/5] PCI/AER: Clear both AER fatal and non-fatal status
Date: Wed, 15 Oct 2025 10:41:59 +0800
Message-Id: <20251015024159.56414-6-xueshuai@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
References: <20251015024159.56414-1-xueshuai@linux.alibaba.com>
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
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The DPC driver clears AER fatal status for the port that reported the
error, but not for the downstream device that deteced the error.  The
current recovery code only clears non-fatal AER status, leaving fatal
status bits set in the error device.

Use pci_aer_raw_clear_status() to clear both fatal and non-fatal error
status in the error device, ensuring all AER status bits are properly
cleared after recovery.

Signed-off-by: Shuai Xue <xueshuai@linux.alibaba.com>
---
 drivers/pci/pcie/err.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/pcie/err.c b/drivers/pci/pcie/err.c
index 097990094b71..28c5ca7d86ce 100644
--- a/drivers/pci/pcie/err.c
+++ b/drivers/pci/pcie/err.c
@@ -290,7 +290,7 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
 	 */
 	if (pcie_aer_is_native(dev)) {
 		pcie_clear_device_status(dev);
-		pci_aer_clear_nonfatal_status(dev);
+		pci_aer_raw_clear_status(dev);
 	}
 
 	pci_walk_bridge(bridge, pci_pm_runtime_put, NULL);
-- 
2.39.3



Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2015A432378
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Oct 2021 18:06:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HY1w951dZz308m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 03:06:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=md7qhpuS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=tim.gardner@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=md7qhpuS; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HY1vP5s8Qz2ynp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Oct 2021 03:06:08 +1100 (AEDT)
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EE62C40018
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 16:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1634573159;
 bh=UwuVR/x7VT/cOQTFcqIu0KjQRbfwdcmSL/xYEKrPIRE=;
 h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
 b=md7qhpuSZahyCW3Hyl6zEhTM3T635aDZC1/62OIBeZ+E6FWB4GUFfgmElSM7tX44C
 SyN0SwWkHfmLAqsz4YBTR4M6JdIUiwmWiaA2yxKgIj2Hb8pl91SBB8hMhBvr33Z7n7
 6Hh335QOVSw/2BOKE22idG8CGK7r/Pb6wO08r1RbQiXsSJUKB4bbVU35QToGlRX7G6
 CAyZ6/JzwKOMG0rR0avlDHCsdD5Lte7gYtp9hhfhWk7CYCBCzc1QCTlxxfLBsA0aWp
 YcP7Kyv1zN/bxaxucgqkE4LKuUZ7IzwKvzDcOevbVsrVAl9840K4B8koo8HXxP8Keu
 oErlLhD5SyOJA==
Received: by mail-pj1-f72.google.com with SMTP id
 nl15-20020a17090b384f00b001a0d49be015so9980665pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Oct 2021 09:05:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UwuVR/x7VT/cOQTFcqIu0KjQRbfwdcmSL/xYEKrPIRE=;
 b=LSBpyXtyocQW86bfxCfvgWRABIEJi30f9i8K8mgETu02z5rMkQ502bTm7oBN0+N3u4
 o1xRCMDatveu2GsHarTul1jd/128bq+/bz0F4Q8mVGsxXrtXWjueGqJ/HXJP2E+8YajM
 ioRgVTzf8XzDJtxDGYmrQjO7uejsQ9UjvEQvthNXUR9zc26yY/vwmB3/C8PjHfB4VhjY
 VIxtGgTkFvDRcVV6D/SmVrqJM9miC1utEDWutTrjc+I29mfAn7KQPjlRzjFWOzrCROfD
 hkeNHINosXGyrYOmE1ij4K8yc7el8XgKeScpYltmrzbQU5h6hgHKP9eHfMoEVpiEnNwo
 wYNA==
X-Gm-Message-State: AOAM532WKblbEHFWR3ickWunJXd1UAXXEsoQxRKYkFHPLRVXLZ+M9D62
 OyZSR9Nc/6mhNM4QMGMBT5BDmjF0bxQIoGw5LPbGImsWk9BTb6PFBitwp8xZyDfmb8Bjp/J++IT
 Yl9BQ3EtkN8ZWR2CjTVFlWkw/2Zua9gYvys14XeKwiWk=
X-Received: by 2002:a63:f356:: with SMTP id t22mr24443625pgj.18.1634573158434; 
 Mon, 18 Oct 2021 09:05:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTWyH9GbLkYIHLYPV5b2YP7Ek0Zcm/M4vmWJOVn1YIdz3V4X13i+DMfc/AS49ZtXTFcacYmQ==
X-Received: by 2002:a63:f356:: with SMTP id t22mr24443603pgj.18.1634573158224; 
 Mon, 18 Oct 2021 09:05:58 -0700 (PDT)
Received: from localhost.localdomain ([69.163.84.166])
 by smtp.gmail.com with ESMTPSA id u74sm13131500pfc.87.2021.10.18.09.05.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:57 -0700 (PDT)
From: Tim Gardner <tim.gardner@canonical.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH][linux-next] soc: fsl: dpio: Unsigned compared against 0 in
 qbman_swp_set_irq_coalescing()
Date: Mon, 18 Oct 2021 10:05:41 -0600
Message-Id: <20211018160541.13512-1-tim.gardner@canonical.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Roy Pledge <Roy.Pledge@nxp.com>, tim.gardner@canonical.com,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Coverity complains of unsigned compare against 0. There are 2 cases in
this function:

1821        itp = (irq_holdoff * 1000) / p->desc->qman_256_cycles_per_ns;

CID 121131 (#1 of 1): Unsigned compared against 0 (NO_EFFECT)
unsigned_compare: This less-than-zero comparison of an unsigned value is never true. itp < 0U.
1822        if (itp < 0 || itp > 4096) {
1823                max_holdoff = (p->desc->qman_256_cycles_per_ns * 4096) / 1000;
1824                pr_err("irq_holdoff must be between 0..%dus\n", max_holdoff);
1825                return -EINVAL;
1826        }
1827
    	unsigned_compare: This less-than-zero comparison of an unsigned value is never true. irq_threshold < 0U.
1828        if (irq_threshold >= p->dqrr.dqrr_size || irq_threshold < 0) {
1829                pr_err("irq_threshold must be between 0..%d\n",
1830                       p->dqrr.dqrr_size - 1);
1831                return -EINVAL;
1832        }

Fix this by checking for 0. Also fix a minor comment typo.

Fixes ed1d2143fee53755ec601eb4d48a337a93933f71 ("soc: fsl: dpio: add support for
irq coalescing per software portal")

Cc: Roy Pledge <Roy.Pledge@nxp.com>
Cc: Li Yang <leoyang.li@nxp.com>
Cc: linux-kernel@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Tim Gardner <tim.gardner@canonical.com>
---

I'm not 100% sure this is the right way to fix the warning, but according to the
pr_err() comments these values should never be 0.

---
 drivers/soc/fsl/dpio/qbman-portal.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/fsl/dpio/qbman-portal.c b/drivers/soc/fsl/dpio/qbman-portal.c
index d3c58df6240d..b768a14bb271 100644
--- a/drivers/soc/fsl/dpio/qbman-portal.c
+++ b/drivers/soc/fsl/dpio/qbman-portal.c
@@ -1816,16 +1816,16 @@ int qbman_swp_set_irq_coalescing(struct qbman_swp *p, u32 irq_threshold,
 	u32 itp, max_holdoff;
 
 	/* Convert irq_holdoff value from usecs to 256 QBMAN clock cycles
-	 * increments. This depends to the QBMAN internal frequency.
+	 * increments. This depends on the QBMAN internal frequency.
 	 */
 	itp = (irq_holdoff * 1000) / p->desc->qman_256_cycles_per_ns;
-	if (itp < 0 || itp > 4096) {
+	if (!itp || itp > 4096) {
 		max_holdoff = (p->desc->qman_256_cycles_per_ns * 4096) / 1000;
 		pr_err("irq_holdoff must be between 0..%dus\n", max_holdoff);
 		return -EINVAL;
 	}
 
-	if (irq_threshold >= p->dqrr.dqrr_size || irq_threshold < 0) {
+	if (irq_threshold >= p->dqrr.dqrr_size || !irq_threshold) {
 		pr_err("irq_threshold must be between 0..%d\n",
 		       p->dqrr.dqrr_size - 1);
 		return -EINVAL;
-- 
2.33.1


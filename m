Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846587372F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 14:00:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Dv+OjKxp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqXc76JnJz3vfN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 00:00:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Dv+OjKxp;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqXYr6cTFz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 23:58:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1709729936;
	bh=9HCPBoMCNUXsKBXM+ZdHQnglsx8sI0rEYyLYiTLALSI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Dv+OjKxptTxTLWPUqJL/pZmXSmxbvpqZJnyMxzyoDQvirxnLTekGGHV0qDwRC2aNo
	 w0lj8lWnoW2fMSu+LwTLWB20yCDNZPepUxW9rqDHlHkMdN1nuJFxoXblpqGKmNBocL
	 9+zeKZ/BEY18i0c7lpWq5WvT8Oj0ihUqL9dka0aMOBptg7DNu2VAN9eX6t+kw4ASN9
	 tYTs2TBHhMWWsrmHF9ngA5+/QOVuPkBo80b49uUfYtYNQDINbBSLnOCVLZPSCXkEQ/
	 ZGq4LtMBxk3VlFS7qJ6QY8QXrHQjssAr2wUxjjjPgWem8EkhtZO7gJRTu/TQ7/UdQA
	 Aj/nYZWZsnPhQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TqXYr5Rz3z4wqN;
	Wed,  6 Mar 2024 23:58:56 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 3/3] macintosh/ams: Fix unused variable warning
Date: Wed,  6 Mar 2024 23:58:53 +1100
Message-ID: <20240306125853.3714578-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240306125853.3714578-1-mpe@ellerman.id.au>
References: <20240306125853.3714578-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If both CONFIG_SENSORS_AMS_PMU and CONFIG_SENSORS_AMS_I2C are unset,
there is an unused variable warning in the ams driver:

  drivers/macintosh/ams/ams-core.c: In function 'ams_init':
  drivers/macintosh/ams/ams-core.c:181:29: warning: unused variable 'np'
    181 |         struct device_node *np;

Fix it by using IS_ENABLED() to create a block for each case, and move
the variable declartion in there.

Probably the dependencies should be changed so that the driver can't be
built with both variants disabled, but that would be a larger change.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/macintosh/ams/ams-core.c | 29 ++++++++++++++---------------
 1 file changed, 14 insertions(+), 15 deletions(-)

diff --git a/drivers/macintosh/ams/ams-core.c b/drivers/macintosh/ams/ams-core.c
index c978b4272daa..22d3e6605287 100644
--- a/drivers/macintosh/ams/ams-core.c
+++ b/drivers/macintosh/ams/ams-core.c
@@ -178,25 +178,24 @@ int ams_sensor_attach(void)
 
 static int __init ams_init(void)
 {
-	struct device_node *np;
-
 	spin_lock_init(&ams_info.irq_lock);
 	mutex_init(&ams_info.lock);
 	INIT_WORK(&ams_info.worker, ams_worker);
 
-#ifdef CONFIG_SENSORS_AMS_I2C
-	np = of_find_node_by_name(NULL, "accelerometer");
-	if (np && of_device_is_compatible(np, "AAPL,accelerometer_1"))
-		/* Found I2C motion sensor */
-		return ams_i2c_init(np);
-#endif
-
-#ifdef CONFIG_SENSORS_AMS_PMU
-	np = of_find_node_by_name(NULL, "sms");
-	if (np && of_device_is_compatible(np, "sms"))
-		/* Found PMU motion sensor */
-		return ams_pmu_init(np);
-#endif
+	if (IS_ENABLED(CONFIG_SENSORS_AMS_I2C)) {
+		struct device_node *np = of_find_node_by_name(NULL, "accelerometer");
+		if (np && of_device_is_compatible(np, "AAPL,accelerometer_1"))
+			/* Found I2C motion sensor */
+			return ams_i2c_init(np);
+	}
+
+	if (IS_ENABLED(CONFIG_SENSORS_AMS_PMU)) {
+		struct device_node *np = of_find_node_by_name(NULL, "sms");
+		if (np && of_device_is_compatible(np, "sms"))
+			/* Found PMU motion sensor */
+			return ams_pmu_init(np);
+	}
+
 	return -ENODEV;
 }
 
-- 
2.43.2


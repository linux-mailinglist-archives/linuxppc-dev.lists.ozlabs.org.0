Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F14E8BE511
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 16:02:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Cw25HhCg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYg2p5LtCz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 00:02:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Cw25HhCg;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYg226dhwz3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 00:02:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1715090522;
	bh=wwbSr6Io8l+1rUzv2r144YlW+nyHRQXiVH0MG87Qxyk=;
	h=From:To:Cc:Subject:Date:From;
	b=Cw25HhCg1ao3xJdRVwKfEWwMpbwcSrszPiARY3ux9a7Y6AAfHhh2RzJ/4h1mVtgKd
	 KC1u1vDBT8koNk6disbKYI18Lrhes4sNtVNhoBl7MlmuKL32FIIJNJPgALkvHkU4IH
	 XtsWfNrDtQNJVM2/jxnE1Kf/Ybc0yqBPpAWT7xXA5TSjtMEtbgOuLObg02SXRoXsSZ
	 /Xyt4Rau/tAZ0vwit/HdMFiGCM88jc6HyaAHh4Y4wfcxQSjSOqtpL4mrWnGRCODBR6
	 /aQX82V3S0EzeBrQSgbQZkEHHMHRoatwFGaDp0v+hILgCffM0GWWHFnkCSvSzm2tpy
	 aspZA6fXLsg5w==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VYg1t051jz4wcn;
	Wed,  8 May 2024 00:01:53 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] macintosh/ams: Fix unused variable warning
Date: Wed,  8 May 2024 00:01:50 +1000
Message-ID: <20240507140150.54630-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.0
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

The driver needs at least one of the configs enabled in order to
actually function. So fix the compiler warning by ensuring at least one
of the configs is enabled.

Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 drivers/macintosh/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/macintosh/Kconfig b/drivers/macintosh/Kconfig
index a0e717a986dc..fb38f684444f 100644
--- a/drivers/macintosh/Kconfig
+++ b/drivers/macintosh/Kconfig
@@ -262,7 +262,7 @@ config SENSORS_AMS
 	  will be called ams.
 
 config SENSORS_AMS_PMU
-	bool "PMU variant"
+	bool "PMU variant" if SENSORS_AMS_I2C
 	depends on SENSORS_AMS && ADB_PMU
 	default y
 	help
-- 
2.45.0


Return-Path: <linuxppc-dev+bounces-3254-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 341FB9CF05F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Nov 2024 16:41:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xqh8B67wMz308Z;
	Sat, 16 Nov 2024 02:41:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1098:5b::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731685290;
	cv=none; b=bEI3/s7eenwe8j0oO7AoK9gFA+iUPC+P3oc3FqyjslJ52Hl5fbWhehj5w0v8UBspc+Qyk2dTT0BoLMHV5+BMPZSOOtmBKqIAIfia5jZvRuJr7Axe2KJbDPWCCyKSpARxPufq1pFhlcqjaTr2M9mW/d7p1A8tyuDfRRFO5liTY36KGDW/rz5ID8V3EjTR1mpT8TguvtkoqnwAvqGbwDcEFFbn/0Jodggw3PF1+8KvEWCZw7tQHLcp7lIqD7b52bUgFv8JD4IPWQYHaFqGTY9uXgTZJ4Tl8T6SiFkD/QTtNxvrH8jYA67vdhk5JfbghoO/yn7DCQ+X3nINV7pkfVo6Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731685290; c=relaxed/relaxed;
	bh=f6mRNT+3cEEBFBqNnfm9nrFBEqUKrx55F3XWxjHMxiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mBbyjPSjEIp2zCVJy5ZdoVLAO+7akaHmX/asBGDe6j05sG6z8TxmZKVe7Vx5P2ezODKTT7zJxlRm1Dxa5buBWtTOW6O/GrZEC5paz2Att/5wyZ4JvDfMZDxSfaIVhFpnkDpfuQYLsU1B+AThIPolw891Qtoy6n2jEbieWFxgOKFYzeTe5kmfcC7lOxCkEl00LuCxuyUfQZn1rmSR9qL/7bi1PznMG0OB6dcRNvPtH19pYSdW/4Gpfefaj0QWjtD2fcViOTH5prNrrow0HGuyOBbsPZ3vSc6iMw++hjD6Nu7RpKEo9ummKQ+uZoIvV7eFh1VHd880EIWOBxXek1XPKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org; dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=BgqBMXtN; dkim-atps=neutral; spf=pass (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=linux@treblig.org; receiver=lists.ozlabs.org) smtp.mailfrom=treblig.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.a=rsa-sha256 header.s=bytemarkmx header.b=BgqBMXtN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=treblig.org (client-ip=2a00:1098:5b::1; helo=mx.treblig.org; envelope-from=linux@treblig.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 1220 seconds by postgrey-1.37 at boromir; Sat, 16 Nov 2024 02:41:27 AEDT
Received: from mx.treblig.org (mx.treblig.org [IPv6:2a00:1098:5b::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xqh8767sFz305G
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2024 02:41:27 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=f6mRNT+3cEEBFBqNnfm9nrFBEqUKrx55F3XWxjHMxiY=; b=BgqBMXtNDTMuQkKC
	sV+s8ZTrZbXSIoSC2Eu9uS0ojjn6VNVMK8pFpzkrJpm+fEyl9WDGT54akTB/hJ0d97xnRnKndP+VG
	9JdTQCHTLx7Ti20VYEbjGIiVbqQMHRxEPCBi4CSMa8cChA6vQ6QjBztFTcsTWCk8w087eKJ6Tg8cf
	d1jxWTmKiAijSffIgLcdVRp/e45SfuHZON7mt9iQJDR1DV5PZQZ1pHfwfb9p4CLzTs/AbBxgfcK/I
	kEg9Gzr0mO13y2nmRgC1VV1K1xqiA19UL60ydL4i5qJ0GAlY48oBrcDaEST38lnZKsYaewCTp6kyQ
	4tqXHFCjgZ9FFLWD5Q==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tBy80-00098y-2k;
	Fri, 15 Nov 2024 15:20:56 +0000
From: linux@treblig.org
To: ioana.ciornei@nxp.com,
	stuyoder@gmail.com,
	christophe.leroy@csgroup.eu
Cc: linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] bus: fsl-mc: Remove deadcode
Date: Fri, 15 Nov 2024 15:20:55 +0000
Message-ID: <20241115152055.279732-1-linux@treblig.org>
X-Mailer: git-send-email 2.47.0
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
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "Dr. David Alan Gilbert" <linux@treblig.org>

fsl_mc_allocator_driver_exit() was added explicitly by
commit 1e8ac83b6caf ("bus: fsl-mc: add fsl_mc_allocator cleanup function")
but was never used.

Remove it.

fsl_mc_portal_reset() was added in 2015 by
commit 197f4d6a4a00 ("staging: fsl-mc: fsl-mc object allocator driver")
but was never used.

Remove it.

fsl_mc_portal_reset() was the only caller of dpmcp_reset().

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/bus/fsl-mc/dpmcp.c            | 22 ----------------------
 drivers/bus/fsl-mc/fsl-mc-allocator.c |  5 -----
 drivers/bus/fsl-mc/fsl-mc-private.h   |  6 ------
 drivers/bus/fsl-mc/mc-io.c            | 20 --------------------
 include/linux/fsl/mc.h                |  2 --
 5 files changed, 55 deletions(-)

diff --git a/drivers/bus/fsl-mc/dpmcp.c b/drivers/bus/fsl-mc/dpmcp.c
index 5fbd0dbde24a..7816c0a728ef 100644
--- a/drivers/bus/fsl-mc/dpmcp.c
+++ b/drivers/bus/fsl-mc/dpmcp.c
@@ -75,25 +75,3 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
 	/* send command to mc*/
 	return mc_send_command(mc_io, &cmd);
 }
-
-/**
- * dpmcp_reset() - Reset the DPMCP, returns the object to initial state.
- * @mc_io:	Pointer to MC portal's I/O object
- * @cmd_flags:	Command flags; one or more of 'MC_CMD_FLAG_'
- * @token:	Token of DPMCP object
- *
- * Return:	'0' on Success; Error code otherwise.
- */
-int dpmcp_reset(struct fsl_mc_io *mc_io,
-		u32 cmd_flags,
-		u16 token)
-{
-	struct fsl_mc_command cmd = { 0 };
-
-	/* prepare command */
-	cmd.header = mc_encode_cmd_header(DPMCP_CMDID_RESET,
-					  cmd_flags, token);
-
-	/* send command to mc*/
-	return mc_send_command(mc_io, &cmd);
-}
diff --git a/drivers/bus/fsl-mc/fsl-mc-allocator.c b/drivers/bus/fsl-mc/fsl-mc-allocator.c
index b5e8c021fa1f..6c3beb82dd1b 100644
--- a/drivers/bus/fsl-mc/fsl-mc-allocator.c
+++ b/drivers/bus/fsl-mc/fsl-mc-allocator.c
@@ -656,8 +656,3 @@ int __init fsl_mc_allocator_driver_init(void)
 {
 	return fsl_mc_driver_register(&fsl_mc_allocator_driver);
 }
-
-void fsl_mc_allocator_driver_exit(void)
-{
-	fsl_mc_driver_unregister(&fsl_mc_allocator_driver);
-}
diff --git a/drivers/bus/fsl-mc/fsl-mc-private.h b/drivers/bus/fsl-mc/fsl-mc-private.h
index b3520ea1b9f4..e1b7ec3ed1a7 100644
--- a/drivers/bus/fsl-mc/fsl-mc-private.h
+++ b/drivers/bus/fsl-mc/fsl-mc-private.h
@@ -66,10 +66,6 @@ int dpmcp_close(struct fsl_mc_io *mc_io,
 		u32 cmd_flags,
 		u16 token);
 
-int dpmcp_reset(struct fsl_mc_io *mc_io,
-		u32 cmd_flags,
-		u16 token);
-
 /*
  * Data Path Resource Container (DPRC) API
  */
@@ -631,8 +627,6 @@ int dprc_scan_objects(struct fsl_mc_device *mc_bus_dev,
 
 int __init fsl_mc_allocator_driver_init(void);
 
-void fsl_mc_allocator_driver_exit(void);
-
 void fsl_mc_init_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
 
 void fsl_mc_cleanup_all_resource_pools(struct fsl_mc_device *mc_bus_dev);
diff --git a/drivers/bus/fsl-mc/mc-io.c b/drivers/bus/fsl-mc/mc-io.c
index 95b10a6cf307..a0ad7866cbfc 100644
--- a/drivers/bus/fsl-mc/mc-io.c
+++ b/drivers/bus/fsl-mc/mc-io.c
@@ -263,23 +263,3 @@ void fsl_mc_portal_free(struct fsl_mc_io *mc_io)
 	dpmcp_dev->consumer_link = NULL;
 }
 EXPORT_SYMBOL_GPL(fsl_mc_portal_free);
-
-/**
- * fsl_mc_portal_reset - Resets the dpmcp object for a given fsl_mc_io object
- *
- * @mc_io: Pointer to the fsl_mc_io object that wraps the MC portal to free
- */
-int fsl_mc_portal_reset(struct fsl_mc_io *mc_io)
-{
-	int error;
-	struct fsl_mc_device *dpmcp_dev = mc_io->dpmcp_dev;
-
-	error = dpmcp_reset(mc_io, 0, dpmcp_dev->mc_handle);
-	if (error < 0) {
-		dev_err(&dpmcp_dev->dev, "dpmcp_reset() failed: %d\n", error);
-		return error;
-	}
-
-	return 0;
-}
-EXPORT_SYMBOL_GPL(fsl_mc_portal_reset);
diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index c90ec889bfc2..37316a58d2ed 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -417,8 +417,6 @@ int __must_check fsl_mc_portal_allocate(struct fsl_mc_device *mc_dev,
 
 void fsl_mc_portal_free(struct fsl_mc_io *mc_io);
 
-int fsl_mc_portal_reset(struct fsl_mc_io *mc_io);
-
 int __must_check fsl_mc_object_allocate(struct fsl_mc_device *mc_dev,
 					enum fsl_mc_pool_type pool_type,
 					struct fsl_mc_device **new_mc_adev);
-- 
2.47.0



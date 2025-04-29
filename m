Return-Path: <linuxppc-dev+bounces-8139-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91E09AA08C1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 12:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zmxj55PNVz30QJ;
	Tue, 29 Apr 2025 20:42:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=95.215.58.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745923353;
	cv=none; b=Hiwzkk8+VRJvPec3WehP8XpL4lsP/JuyxjlvExDGyykGDBI8pDXScxckkhoW+mGE9cqrxDQxnCFXy9I3Ycdia504uD5+fP37/O+fne4CVOa8N2ALoqzkHoNgGLWBZW095HuODDAWCDdpwQKldWwepKTUVOChbmIUWrdpQp7aG+fK54GLneXcu1pd+ffG7xzHs51ZTV0REpvqfkCNrQIV7xO3c69uJtCvjdUPboVdi2YnZC+JhTXF0uVY5sTmnMdtyHBgJm+pbLKvLXEJxCsSCID0q1NCwimPv1tyause4z9tlHccuQ9KzPxASvt43Ns6luT+1lEz0q0vFUsSZK7/dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745923353; c=relaxed/relaxed;
	bh=xMkIid6gHyNzydzTpQIq/sI+CyiABJLPBLSUcxMe7Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DcDA+pQ1X04XKDb0ZsfwCDsB4eFjfuY2YHyj0uH/lDYee3KNSd5zgX6/c1WtvsSZz81ccBTrI7QXyj1BnC4vcuOnJRZqGXc1dSBdtG6qJlZtm5UCYpj12ZkYL/xna/WP0L4xQ+Pdl7CBFni16Qhf3uxz6BAckOxwGnUJP5OxXg23JOdHHDQ5P1PzmylQUN5v1ifKvFashQb8KclOB6kj6w1YqkFGONBd/tALSzL6OMOqcfH50hpKKvbXv8vDAbrnzrAGwPuouhfjX8FU1ti2qzhqQ6wzFfZNCFWJZtXY8oQOWC3MoeCF7+MtDs4wVkYIkMxFmNCSLoke2J5ya1ZANQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ls01d7e2; dkim-atps=neutral; spf=pass (client-ip=95.215.58.172; helo=out-172.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=Ls01d7e2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.172; helo=out-172.mta1.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zmxj30k5Vz2yVV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 20:42:29 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745923329;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xMkIid6gHyNzydzTpQIq/sI+CyiABJLPBLSUcxMe7Wc=;
	b=Ls01d7e2J35C1GTAxra8JFRllV0MOlJuMkHd6aRBwzU1GVX+i30qym1DIMTXNMYoHJRU1n
	IQXqWAyV/8pZGBYsY/oTG0pS5bApiu2WBMMOgTlBp2JHTt1r9AkbTzlULUd5A2VokJAW2+
	lpz7uG0yshRRNZZl70P0Rbyv0NQ4QFo=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [RESEND PATCH] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
Date: Tue, 29 Apr 2025 12:41:48 +0200
Message-ID: <20250429104149.66334-1-thorsten.blum@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Both destination buffers are already zero-initialized, making strscpy()
sufficient for safely copying 'obj_type'. The additional NUL-padding
performed by strscpy_pad() is unnecessary.

If the destination buffer has a fixed length, strscpy() automatically
determines its size using sizeof() when the argument is omitted. This
makes the explicit size arguments unnecessary.

No functional changes intended.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/bus/fsl-mc/dprc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bus/fsl-mc/dprc.c b/drivers/bus/fsl-mc/dprc.c
index dd1b5c0fb7e2..38d40c09b719 100644
--- a/drivers/bus/fsl-mc/dprc.c
+++ b/drivers/bus/fsl-mc/dprc.c
@@ -489,7 +489,7 @@ int dprc_set_obj_irq(struct fsl_mc_io *mc_io,
 	cmd_params->irq_addr = cpu_to_le64(irq_cfg->paddr);
 	cmd_params->irq_num = cpu_to_le32(irq_cfg->irq_num);
 	cmd_params->obj_id = cpu_to_le32(obj_id);
-	strscpy_pad(cmd_params->obj_type, obj_type, 16);
+	strscpy(cmd_params->obj_type, obj_type);
 
 	/* send command to mc*/
 	return mc_send_command(mc_io, &cmd);
@@ -561,7 +561,7 @@ int dprc_get_obj_region(struct fsl_mc_io *mc_io,
 	cmd_params = (struct dprc_cmd_get_obj_region *)cmd.params;
 	cmd_params->obj_id = cpu_to_le32(obj_id);
 	cmd_params->region_index = region_index;
-	strscpy_pad(cmd_params->obj_type, obj_type, 16);
+	strscpy(cmd_params->obj_type, obj_type);
 
 	/* send command to mc*/
 	err = mc_send_command(mc_io, &cmd);
-- 
2.49.0



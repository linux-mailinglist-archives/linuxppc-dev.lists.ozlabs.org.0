Return-Path: <linuxppc-dev+bounces-7644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE79FA87307
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Apr 2025 19:38:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZbHhM2xPFz2xrJ;
	Mon, 14 Apr 2025 03:38:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.181
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744565907;
	cv=none; b=l9H4IQqU4p003v0bd3GlMN26v/uvDaW00u4QdRAWDZ0CLHPwdxw8SRDt639s9ulVdGWVLUezlNw1yyY67Lv5HcxKmy7KMZfUvwn5NZB1E/pXbriOVI1ob+JgUIDcfypg1is9EB2IG2ACMVsFWJVv+qClYkMQ3ztvWfxTdYdoBhm6hP6IbUojOg4yEcez4hIrLb0JAqCLkhTUTk9K0ruDszgL/3Hn/9gs+TjIpMYnaZwF7u2JGoJdnbBC3iJHIaCCzU3yjBtgCwgBxiI945eeaZtx4mlgXyvvKsvcExmWPczkI2f/8iM2pUf7vQtyYS0d7CJ/i4cQe71vXM8JXADP9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744565907; c=relaxed/relaxed;
	bh=xMkIid6gHyNzydzTpQIq/sI+CyiABJLPBLSUcxMe7Wc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JwgDqZeMgQPS8cKnfJ3Up05732Btq2cp/tkF8I1IpMrq6R3/Mm8c7HlAmXZj7Ltuq/MshrYlIWARMVxyErF+RILGlhixlenkxjel2su+o3P52NsDtzlK70rQp0QS/9B7HV+TilOr1WNGoC3WD+Qbj4qjmj3FvmLFchXE9HB6olVGsMDjO2CIrocCAkERrMCguBRi8FlQ6XTi2VbrdvhwBoPu6wfEohDQDiXxuiUfl4BYT0or6LrvMfo97jNF+9pbpzZH6HFC3SrlFk6WyXzGnTMFtXsoglt0jzEFFKYje1nUPilkxNUWFYMAwKZEbrZiI3o9S1AcsWcwZnCa7QiFpw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=91.218.175.181; helo=out-181.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.181; helo=out-181.mta0.migadu.com; envelope-from=thorsten.blum@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 358 seconds by postgrey-1.37 at boromir; Mon, 14 Apr 2025 03:38:19 AEST
Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZbHhC5QH0z2xYl
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Apr 2025 03:38:19 +1000 (AEST)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744565519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=xMkIid6gHyNzydzTpQIq/sI+CyiABJLPBLSUcxMe7Wc=;
	b=QZGbANdEQ25WsCx7Zl8N4+SXimLvNM4zFfBtEzGswd51FVcsa19WNsjBevyysQsa6XQA0s
	3RuDghrrqjkqFFxAdmnfAgn+LvdcPDYVtnxNadh+Aba/MGOkWB6hP9gYEaVdDCB7/Q4qGr
	lr65PstiSUOSL6yqApPYaDe0EX81TeI=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: fsl-mc: Use strscpy() instead of strscpy_pad()
Date: Sun, 13 Apr 2025 19:29:50 +0200
Message-ID: <20250413172948.207258-4-thorsten.blum@linux.dev>
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
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
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



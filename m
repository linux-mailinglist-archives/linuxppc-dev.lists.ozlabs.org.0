Return-Path: <linuxppc-dev+bounces-6011-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C9EA2E106
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Feb 2025 22:59:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YrhSD1cmCz2xHp;
	Mon, 10 Feb 2025 08:59:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739138348;
	cv=none; b=hNW9L9jt/WSfD08D1FRl1ZJ6NypHVQbbcF0NqGFalWkiPWJsUlM/Z0TNyYpgDChFjWPiBK81+Z1ps+0QWML4+ljSIBMHkenidktWkk9DGWJCs6ZYD1uW9+UEL9qN+PI8EsZ51eOxrZ/RLkQtkdRq6ua4rvC2R43UtZF4tld1OGjZKSp62fUyEsdMa/wzl1sFFMgBlIGKkpyn4fgFDUKQ8ujPA5qJ9xwi9mQLjPZYhAR62tvOilqHD8I08sdSgmi8Jur13BIBRrJKndnG9C8HvO0tW3d/ZoK19DgucvWWird+1Lk8EVr+vGex7lJvheL+rpSpOWgPuehp2KZMKeUwpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739138348; c=relaxed/relaxed;
	bh=cRE49M51A6bP5/SHVnphQu7WBXOr2NVkdH9aHvBC1VU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=a4wAx13ktZeaYaYcu8XcMrLPXFbGSRchV+Csm2oPS20qNHcJOOXfLECwMXu5+jWO1btyAjrxYXGenLwQT/JtxyYI2x7ELGUOdOafq2sYl7TKJ40JYZvx2AbCqHbnfj4/0j9RdPznxlZvItVZ0eG55cgBY3BJkkqEDiicsBRFrBmtMR0TTrSNQdjjzs8/USb5dovNYsU6n8/s3FEjUJL0D0leWABmwHvKfW/IQAJDhB1UaUEaDbWNBZ5DJcQmVJdN1M95VvQJboMZpYPyBwS5DT3DhJpFsOoUMVCbC0ONHSJnr8OrKSaxRZK7OvmHkTYOnU7wH1Hdu6cAvUEgWPfwhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sn0t8fvD; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=sn0t8fvD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=devnull+j.ne.posteo.net@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YrhSB6ZTZz2x9M
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 08:59:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D55AFA4032E;
	Sun,  9 Feb 2025 21:57:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 252DAC4CEDD;
	Sun,  9 Feb 2025 21:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739138343;
	bh=rZZRsjlSpeAfRhzHyE/VdMTRY0VDQU8RR2sZYVcrZ+g=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=sn0t8fvDgnnM0G8WgbMBwfqaYq+4K+RbZ58zF6wzg7w7+HOYix29zo+HOt62dXp3P
	 MpGUmzYl4Y0DrwoZp4TM0zi0GMAt5QgqH6N0WFZB0lbo59gVmwxuShQaQsjonxvMFh
	 DMCld16GaUBJgrU1xa0+rHN4WlgBftewKmNjJuy3HdJh7ys10l/XPvZGKhS/gWET+2
	 1SANKWNxcFMZrmbg6Mt4XsITmfWH0I81xuaa6zNtiuP/93joENFG68Q39MlbeVwj+c
	 DnvlKzpCHQWHxfEMZP1vISxB4+jQM4XRC9khsO3sulxmLCgMsn8km/pH0l4bBEPL3n
	 BQ4MJQ0LOlw4w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09650C0219B;
	Sun,  9 Feb 2025 21:59:03 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 09 Feb 2025 22:58:50 +0100
Subject: [PATCH] powerpc/fsl_lbc: Explicitly populate bus
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250209-localbus-v1-1-efcd780153a0@posteo.net>
X-B4-Tracking: v=1; b=H4sIABklqWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNL3Zz85MScpNJiXUuTRLPUpCQDk2RDIyWg8oKi1LTMCrBR0bG1tQD
 KGYEMWgAAAA==
X-Change-ID: 20250209-localbus-94a6ebb04c12
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739138342; l=2166;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=B9wRS8xBkWgNM3MVMQKFspl9gtSoxY/bCMh2+zmQDxk=;
 b=tFftKrynp3tkKOIsn1G7hLG/50HmSiZgFICzklnzo02+5OzJ4z2O3yOXtbYkOd2tIUzTztvUP
 3jBRUyGXE5fDRuAWF65KNIo8wVffEwkkRvHkDHvXqMss2mBlUNCGA2P
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Historically, devicetree nodes representing the Freescale Enhanced
Local Bus Controller (eLBC) have compatible strings such as:

    compatible = "fsl,mpc8313-elbc", "fsl,elbc", "simple-bus";

The "simple-bus" string causes the bus to be populated, and the memory
devices contained within it to be discovered. The eLBC bus (as
represented in device trees) differs from a simple-bus in a few ways,
though:

 - Addresses are not simple/linear: The first cell of an address is a
   chip select, the second is an linear address within the space thus
   selected. Representing 1,0 as 100000000, for example, would decrease
   readability[1].
 - It is expected that the devices on a simple-bus "can be accessed
   directly without additional configuration required"[2], but the eLBC
   needs some configuration.

To accommodate devicetrees that declare an eLBC without "simple-bus",
explicitly populate the bus in the eLBC driver.

[1]: dtc makes such a suggestion opon encountering an eLBC
[2]: Quoting the Devicetree Specification Release v0.3

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/powerpc/sysdev/fsl_lbc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/sysdev/fsl_lbc.c b/arch/powerpc/sysdev/fsl_lbc.c
index 217cea150987df1e1b5c6dbf9e9a1607dd5ce49b..2007ced997fcf0c7059e5b780893b530764dc8b2 100644
--- a/arch/powerpc/sysdev/fsl_lbc.c
+++ b/arch/powerpc/sysdev/fsl_lbc.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
+#include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
 #include <linux/platform_device.h>
@@ -336,7 +337,7 @@ static int fsl_lbc_ctrl_probe(struct platform_device *dev)
 	/* Enable interrupts for any detected events */
 	out_be32(&fsl_lbc_ctrl_dev->regs->lteir, LTEIR_ENABLE);
 
-	return 0;
+	return devm_of_platform_populate(&dev->dev);
 
 err1:
 	free_irq(fsl_lbc_ctrl_dev->irq[0], fsl_lbc_ctrl_dev);

---
base-commit: 7ccde445dddcca030cd6ed66974bb80915ad9dd5
change-id: 20250209-localbus-94a6ebb04c12

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>




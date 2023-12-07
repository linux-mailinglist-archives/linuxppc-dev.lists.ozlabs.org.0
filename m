Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F0C8096B9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 00:44:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YsxNgUAv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SmW7t20ycz3dSf
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Dec 2023 10:44:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=YsxNgUAv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SmW1W2bfYz3cSK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Dec 2023 10:38:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CFF9362244;
	Thu,  7 Dec 2023 23:38:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 09D82C433A9;
	Thu,  7 Dec 2023 23:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701992315;
	bh=vIbdM6qJKhNY06Jkf5cOfCIp2ofKpfHIrcssq/Ue5XE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YsxNgUAvLcsbYgfByjoF835lQ7ztyWXiu4I87DLhiGuau1WcocodYYFzasM4Sm5an
	 zAPnXXLytS9Y6hRNV3b+2DaoBFy2maB5Ljsvm8MQGy2vvUtQtn68e5Ni8jufuJxe97
	 aUSHzMPwiiJ44E4iTDqLxdZkLSJsa1F1qEHD/vYRRwdEXEPAInkQsuDWP+YHGP1ai7
	 zpFzfTzyR1m2d58mNu5uP2eOiH0D4vY7O4aYU6NeeExuOFx7krkb1VWD0NyqCPJCVS
	 YUoC58V9rL03i5Eg1nksbhg1RR7VtL3o0Tz4p7PucMEJO4OBCRDSKzwkMllYbWl5nL
	 AgVc0GmQYvnUA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EDFBAC10F13;
	Thu,  7 Dec 2023 23:38:34 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Thu, 07 Dec 2023 17:35:46 -0600
Subject: [PATCH v5 07/13] powerpc/rtas: Serialize firmware activation
 sequences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231207-papr-sys_rtas-vs-lockdown-v5-7-2ce965636a58@linux.ibm.com>
References:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
In-Reply-To:  <20231207-papr-sys_rtas-vs-lockdown-v5-0-2ce965636a58@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701992313; l=1051;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=UOm9HvAsTc/2SCJvSH6seGkHJWpLyM9TkKI30m0VEQY=;
 b=VSxu2JLFqVAz5ub/OAkz2cCPHtMsrBEeGKKHnrig4qDA5FwskcnXYyu5up7o3vQqDJwo1VwTm
 ijDaBtM0lbsCpkFH2rlaFYCzXrIQ+FPIJl6p3qWBkubDSsSecga5VMe
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, "Aneesh Kumar K.V \(IBM\)" <aneesh.kumar@kernel.org>, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Use rtas_ibm_activate_firmware_lock to prevent interleaving call
sequences of the ibm,activate-firmware RTAS function, which typically
requires multiple calls to complete the update. While the spec does
not specifically prohibit interleaved sequences, there's almost
certainly no advantage to allowing them.

Reviewed-by: Aneesh Kumar K.V (IBM) <aneesh.kumar@kernel.org>
Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 4d28983e8b1d..72f6b5a402dd 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1734,10 +1734,14 @@ void rtas_activate_firmware(void)
 		return;
 	}
 
+	mutex_lock(&rtas_ibm_activate_firmware_lock);
+
 	do {
 		fwrc = rtas_call(token, 0, 1, NULL);
 	} while (rtas_busy_delay(fwrc));
 
+	mutex_unlock(&rtas_ibm_activate_firmware_lock);
+
 	if (fwrc)
 		pr_err("ibm,activate-firmware failed (%i)\n", fwrc);
 }

-- 
2.41.0


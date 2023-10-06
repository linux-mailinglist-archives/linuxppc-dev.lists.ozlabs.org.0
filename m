Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B957BC0D9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 23:02:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qOrAH9W5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2LTP6WMBz3vcP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 08:02:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qOrAH9W5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2LSV6c1Kz2xLW
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 08:01:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1A24DCE292D;
	Fri,  6 Oct 2023 21:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 56079C433C9;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696626071;
	bh=gD5zWIEFJgJXoW5g2bj+wCQiuzqjW8LQN3JI9oGwy+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qOrAH9W5oCTd3bTOalkPjTbfoKeob6UtlTXyEIVGJ6W7W0e09Phf5nxheV/Z6RiKk
	 te3nhJSjt54znnT4jyghE7sGvB8qPCCiVMQpSnyVt4okMx6KX+tqoNcd9I/zC/BoOY
	 MjCClGfD6N1HltWTyb9Xstooaeoz+RP8VDYvORrgK/GjJsClfrSV1iClqqAXoGvKNJ
	 Vu0/Ug5Q41PjxQ1kTrX0UdgP5wDGhpq1vI0nHB3S/QaA068QtkswQpaOpJDy+cMcwy
	 o0mURposcz0uKtTwrSoleuawfzMULwbYxuh/XtdGQK+fjm47F9Xe5zrP9hZ3DYac1T
	 Za8Zzlv4CE0+g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A39EE94116;
	Fri,  6 Oct 2023 21:01:11 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 06 Oct 2023 16:01:04 -0500
Subject: [PATCH 1/7] powerpc/uapi: export papr-miscdev.h header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231006-papr-sys_rtas-vs-lockdown-v1-1-3a36bfb66e2e@linux.ibm.com>
References:  <20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com>
In-Reply-To:  <20231006-papr-sys_rtas-vs-lockdown-v1-0-3a36bfb66e2e@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1696626070; l=765;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=JMz2KShlBYHoqW3y8kJSBWwgwMz0qhqY8agvfGwn8cc=;
 b=7Hs21euIUWv/t9La9rFTQFvqgrLAVP9nPwJWjuVIrXLNDmviLZm8vPWefM4IqO9pg4qzbxtVx
 8h1BtfAgynrBD+KsZ+XcZYh58hG6iWm191kPIWc8MQKj/39VWHMYOfH
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Allocate one identifying code (the first column of the ioctl-number
table) for the collection of PAPR miscdev drivers to share.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/include/uapi/asm/papr-miscdev.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/uapi/asm/papr-miscdev.h b/arch/powerpc/include/uapi/asm/papr-miscdev.h
new file mode 100644
index 000000000000..49a2a270b7f3
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr-miscdev.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_PAPR_MISCDEV_H_
+#define _UAPI_PAPR_MISCDEV_H_
+
+enum {
+	PAPR_MISCDEV_IOC_ID = 0xb2,
+};
+
+#endif /* _UAPI_PAPR_MISCDEV_H_ */

-- 
2.41.0


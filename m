Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3787D7B36
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 05:26:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GQOmlVyt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGB645CdCz3cTh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 14:26:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GQOmlVyt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGB4F60Cfz2yVR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 14:24:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 5A50CCE09B8;
	Thu, 26 Oct 2023 03:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61A0DC433CD;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698290682;
	bh=gD5zWIEFJgJXoW5g2bj+wCQiuzqjW8LQN3JI9oGwy+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GQOmlVytdkMCRwo5cF2WNDTmaj09y5lOl+2DPR9aWLuHdC//Eso4qzjq/4IAA49ju
	 83KiTznVRh74L6oL768Q/10IB+6BJfeIuK1gtm23tdRfxx0om6bzCsj6wLm0dQfKht
	 Wnde65o+yjnMTBLgLMGA8myKJIWrc2ErCXfYSrsoeRCiv8Mwbd03Dgttl2w2U+sTzX
	 HrtfmPFnvVbDCkhhEqYhWsJz9sZaz17Lrc5sp/WdAJAt8S13xs3W60cPCLFQ8XSKe8
	 0FhkJ2Yb3MKJSzd9zQZOAQbn0NqHbzTXMnaIB2D6RN+sZokwalvoZz1QUKwkY6PKLt
	 2g5LkmygQkU7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EEFC25B72;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Wed, 25 Oct 2023 22:24:19 -0500
Subject: [PATCH v3 05/10] powerpc/uapi: Export papr-miscdev.h header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231025-papr-sys_rtas-vs-lockdown-v3-5-5eb04559e7d8@linux.ibm.com>
References:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
In-Reply-To:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698290680; l=765;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=JMz2KShlBYHoqW3y8kJSBWwgwMz0qhqY8agvfGwn8cc=;
 b=AI4lh6arfehrPIFcIXi42ASZgI0uHLhJ7JlHJwwpZYmyhY4NQrvbhdJJydd5w9rLWTetCf7Cx
 GY415FHuIBMCWUeP1+fffowD9JRLfZDClzhe7tI11YFSuK6eAuANPUO
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
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


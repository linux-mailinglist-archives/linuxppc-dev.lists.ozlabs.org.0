Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D48307EFDE1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 06:24:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OWjbz0/k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXMdb5PQJz3cRr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 16:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OWjbz0/k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXMQT2LWrz3d94
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 16:14:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 594D1B82250;
	Sat, 18 Nov 2023 05:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8F3E2C43395;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700284470;
	bh=gD5zWIEFJgJXoW5g2bj+wCQiuzqjW8LQN3JI9oGwy+E=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OWjbz0/kSwuGc+ULF2qzsz+5lCb3cYuyV+lOKMpBgbA8EsOYudWqetjHhyzOVuK1r
	 d85DZ1kN4Fx6RjHYobw/l9yO3rP1BIgqUMJBkHeZCgN9342vXSfj6gHd6mWS3WGz9z
	 /IVhyoR/kfoeGargmoTJQiL0GsR7JNEEN7zky/YJrTrtIFq3/w7nU3E3t+eDv+NGqP
	 oaYnP+2+gnzx4mEPQMoMhbxoYylzHQYE6iuGYORj3iOsqxGypGzMRKQNBQud2GkbsM
	 EId1fYb8h+Hsb/2dK7w12MwFFPH5iltNowbjiCFjQOhC1CzHLF904NU/Ld177haNmY
	 PzzLV9jnQa1XQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BE01C54E76;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 17 Nov 2023 23:14:26 -0600
Subject: [PATCH v4 08/13] powerpc/uapi: Export papr-miscdev.h header
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231117-papr-sys_rtas-vs-lockdown-v4-8-b794d8cb8502@linux.ibm.com>
References:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
In-Reply-To:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700284468; l=765;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=JMz2KShlBYHoqW3y8kJSBWwgwMz0qhqY8agvfGwn8cc=;
 b=z+xDUVUyBXQgFOMT80eBm1k1GRS3OgTN1abaGTVYhbqnkQ1HTqzSKGApGf4ZhMjLARgdOe8ps
 ybvtQaW8QdyDj9oZb/ZZzLKgx7/8cLG1ptux9N43ymeJPpAQnJSakJa
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


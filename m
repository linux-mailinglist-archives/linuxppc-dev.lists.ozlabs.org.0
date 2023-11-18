Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9F67EFDE0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 06:23:32 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C+TabfFc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SXMcf2qRvz3vfT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Nov 2023 16:23:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C+TabfFc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SXMQT0lzCz3clc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Nov 2023 16:14:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 4BAD8B8224E;
	Sat, 18 Nov 2023 05:14:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 62451C433CD;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700284470;
	bh=wJAWqM70ShUyRp/DEAik0IAHMuOEbZ/+CtA+n3XNVJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=C+TabfFcPNlkAttFBy01p/h3c22JByjB9kbhQe4aaLcVakX0RpXPc+DDZu2FC84hW
	 JCjcenECl7+FF3mFPwPlO5wTeLmlA/pR8LgtVODfT5dHVxJhr5ZkFtQKMdMzPHwXBa
	 IT9pGMevsfDJGjsAk0ctvrFxj08XhAga4cgXds8o57hdLsefQHKVMCBQaPfwD+oJEK
	 ESz9X0dUrlyKZkBo1andZlt4DDZEQjcoLRbQvi5rL6X9A6nZO/yK7Rn2Uc2H4zIOL8
	 7pzZBwug2Gs1oPFYr6sTwLXmf7VnG8LOLrP2uDeKBw8gwaGJNrJAsNYhjc1MH0riX2
	 TQENtKLnSdDgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51E68C2BB3F;
	Sat, 18 Nov 2023 05:14:30 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Fri, 17 Nov 2023 23:14:24 -0600
Subject: [PATCH v4 06/13] powerpc/rtas: Serialize firmware activation
 sequences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231117-papr-sys_rtas-vs-lockdown-v4-6-b794d8cb8502@linux.ibm.com>
References:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
In-Reply-To:  <20231117-papr-sys_rtas-vs-lockdown-v4-0-b794d8cb8502@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700284468; l=988;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=dJaCJaqg/DdTqoNctBZGI5Ok6TMM/PY/XHoMFKqAZp8=;
 b=1rLdthHglpipy1dOTgUUu8ILlIJPtwJUPLzUYy6RO0K5cr4L1A5prGYUuSfwkC/Ub35jXviRw
 1NQhHdVDTOVC9XicKoGpvPnoxjEQcAz9m6W72UAaE6q+qNngqOkwuMj
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

Use the function lock API to prevent interleaving call sequences of
the ibm,activate-firmware RTAS function, which typically requires
multiple calls to complete the update. While the spec does not
specifically prohibit interleaved sequences, there's almost certainly
no advantage to allowing them.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 arch/powerpc/kernel/rtas.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
index 52f2242d0c28..e38ba05ad613 100644
--- a/arch/powerpc/kernel/rtas.c
+++ b/arch/powerpc/kernel/rtas.c
@@ -1753,10 +1753,14 @@ void rtas_activate_firmware(void)
 		return;
 	}
 
+	rtas_function_lock(RTAS_FN_IBM_ACTIVATE_FIRMWARE);
+
 	do {
 		fwrc = rtas_call(token, 0, 1, NULL);
 	} while (rtas_busy_delay(fwrc));
 
+	rtas_function_unlock(RTAS_FN_IBM_ACTIVATE_FIRMWARE);
+
 	if (fwrc)
 		pr_err("ibm,activate-firmware failed (%i)\n", fwrc);
 }

-- 
2.41.0


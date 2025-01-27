Return-Path: <linuxppc-dev+bounces-5607-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CADA9A1FFA1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Jan 2025 22:24:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YhhJj2FVNz2y8p;
	Tue, 28 Jan 2025 08:24:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738004042;
	cv=none; b=KjIGXUHeUgKMh35rEetbOjFkVTpUVeALso8t4+x36TDJ2Iqm0TtslPRWVzO2Eyj7pxUbJgunqj964KlDg4ko4Exag7sI8dN5Bpu935eWQase9So8TmiwAPyime0mgdY11xhhsbrr6IYtCixWHBX/qBgFQoGNNd0mka5f/J3xSZarL2jONUERKnqx19w5iQ9gp4xamnz+Kc7D2wr7t81Wzkwu7J09sJn/z/KKL39s5mc3BsojCO/oIc8bqbVR4SecKidLUdWKwaFwnb8YfXNabCGSP9PXj0gzkIlf4YwRFAs4yL84q2f5HmZmDwtRrMmbxdRvo3S5DRGRWdFNmNo+Ig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738004042; c=relaxed/relaxed;
	bh=hgrz+bWrus+hKnm1em+wu7aTi4fRtS/pO3TZD2C3jvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=X1hdQaDGyZ/J/iaTlkLnU1XO2fCFJ+tWoyjWyGPEt7K1+HIYN7o1x6c8G9gYFpZWg3zOxxpmCcy2DLxQDEtDSdqfBYNroSe8UXW3HYIICeWd72+GtblLWcxoEjOQjqCEM49w+hQiE3NyRxjhHQiCzMAyQla286n3B0XAJfrYdmLq/U/UCbU0ZGXJs0WT3aPnc5f125XEVcxCKax3G5SjOPhc9CurBcHD1L1UqmbZZENjm2toj+S5DON2p8L7kcpXSE+KBT5dmTqyBNUMP1NRXk++XNfwySG0tNiaaHZ5FlIRfuHcIJtAjkBZDr7E2Et8I4yDMzsgfAEVZ5M+wXbAKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=PjYOZMSs; dkim-atps=neutral; spf=pass (client-ip=158.69.130.18; helo=smtpout.efficios.com; envelope-from=kstewart@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=PjYOZMSs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=158.69.130.18; helo=smtpout.efficios.com; envelope-from=kstewart@efficios.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 368 seconds by postgrey-1.37 at boromir; Tue, 28 Jan 2025 05:54:01 AEDT
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yhcyd4NZQz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Jan 2025 05:54:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1738003668;
	bh=ukrPCsMcg/VdCNVmgsI+ggcG70FqD/w06Zlbc5l7XoQ=;
	h=From:Date:Subject:To:Cc:From;
	b=PjYOZMSsyd/v/+SLNPNK3vLDPTxrRvSAnUHavheI0zwDt+K5+dhEKPIuFiA+jhX77
	 3EC+mSxr3aDvW/GVQ9e3KL7oHFi34QKejsgD/+LYc5iy3CxUJ+LFLfMBffs4JNOdxy
	 2OnxWWo0Wq5MiGkDoNjjuXX0YY13HOSgtVtHIy0AyMIRQrzudB8gJDFMA9c75ITqBN
	 KOhFfruXKD3hfK50Oq7R66M6tCOOufFSehY9Q4Ev5/3I3E3xV+qvVuxAehioNGZN87
	 hFrhljnfDfNLIJOFv66wN4qncaochaxjkDUDR85YExMVinSMcELWG6o9nPH0r+TXxz
	 qXQXKJSdGwnHA==
Received: from smtpout01.internal.efficios.com (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4YhcqS2WGTz18yv;
	Mon, 27 Jan 2025 13:47:48 -0500 (EST)
Received: from laptop-kstewart.internal.efficios.com (laptop-kstewart.internal.efficios.com [172.16.0.60])
	by smtpout01.internal.efficios.com (Postfix) with ESMTP id 2392A517E;
	Mon, 27 Jan 2025 13:47:48 -0500 (EST)
From: Kienan Stewart <kstewart@efficios.com>
Date: Mon, 27 Jan 2025 13:47:21 -0500
Subject: [PATCH] kbuild: Add missing $(objtree) prefix to powerpc
 crtsavres.o artifact
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
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com>
X-B4-Tracking: v=1; b=H4sIALjUl2cC/x2MSQqAMBDAviJzdsAuovgV8aB2qgNqS+sG4t8tH
 gNJHogUmCI02QOBTo7stgQiz2Cc+20iZJMYZCHLQsgKh4MXY/lGuvfVGfTuouBH7CutSSglbK0
 g1T5Qsv5z273vB9vE9gFpAAAA
X-Change-ID: 20250127-buildfix-extmod-powerpc-a744e1331f83
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Kienan Stewart <kstewart@efficios.com>
X-Mailer: b4 0.14.2
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

In the upstream commit 214c0eea43b2ea66bcd6467ea57e47ce8874191b
("kbuild: add $(objtree)/ prefix to some in-kernel build artifacts")
artifacts required for building out-of-tree kernel modules had
$(objtree) prepended to them to prepare for building in other
directories.

When building external modules for powerpc,
arch/powerpc/lib/crtsavres.o is required for certain
configurations. This artifact is missing the prepended $(objtree).

External modules may work around this omission for v6.13 by setting MO=$KDIR.

Signed-off-by: Kienan Stewart <kstewart@efficios.com>
---
 arch/powerpc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index f3804103c56ccfdb16289468397ccaea71bf721e..9933b98df69d7f7b9aaf33d36155cc61ab4460c7 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -58,7 +58,7 @@ ifeq ($(CONFIG_PPC64)$(CONFIG_LD_IS_BFD),yy)
 # There is a corresponding test in arch/powerpc/lib/Makefile
 KBUILD_LDFLAGS_MODULE += --save-restore-funcs
 else
-KBUILD_LDFLAGS_MODULE += arch/powerpc/lib/crtsavres.o
+KBUILD_LDFLAGS_MODULE += $(objtree)/arch/powerpc/lib/crtsavres.o
 endif
 
 ifdef CONFIG_CPU_LITTLE_ENDIAN

---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250127-buildfix-extmod-powerpc-a744e1331f83

Best regards,
-- 
Kienan Stewart <kstewart@efficios.com>



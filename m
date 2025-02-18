Return-Path: <linuxppc-dev+bounces-6327-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 795ACA3A8DA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 21:27:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YyB0L6tm4z2ykT;
	Wed, 19 Feb 2025 07:27:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=158.69.130.18
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739910450;
	cv=none; b=USVgyjzuxboXiGWvDQq6Ny5yo7UwXs5l1gWQhLNI1VUxNK3+8+mDb/CiMWROa3iWXjqSbYlGrz/od9XlCwdnRcXkSjLpTz/kf+NB6WSdjKs5AFuiwvwIhQo6fE0hIq5G7J8+tsXYESluWWgjBXjMaYxMycUpzzUC5l4hxHkEqJnIEPF8H4kPPGm6sATY452RnNYgHgTZC5p836DVGxhQ/+6trxCA7Fhxqv6QHg0bqWVjyQnLWUh8NhkoybQNdd3FuFcC7iFfUmV3aZKmeBvD+QE0GREPABkoMlwWlPLh6z8lxw9n4HcT6saqSsQsdpWrlU6ZColrKBPTHS4WOG4roA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739910450; c=relaxed/relaxed;
	bh=5deE5hyg68WB5WdR/ckHbJZNDxaZSHbkdIPpKN/Jf44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=hkskC+/6XgaWR7GWhdA8UdlgkNLZDG6QonCpqYkCXqNw00DtJ/bDjLPK4cqFLANLyCntZFbK/Fih6FZ5GGcOPwLwYd4SgajeotPsgPA/PsqCyw1f3ts8yoz/clAU1ac3FUlecjYJROqyi5vfLX7DJPCj6HX8rjNbG0VonjoSME3ZrmDwjDRoEpmT5gvzmYgXIp4A4T7H06VO8T/FEoevgZVuYX6Rs1a4zWYi5yNUOvUrq6sTUsh5MXoE7gUy37PBLtwSP7Cy8vfGPcf9KhJLZGSENzXLQXNTCrvPA41OVGEYMT37ilc2QqmirwqilL1jjI1SyyDgZ83odeAg8AGhMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com; dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=XFz2QqZG; dkim-atps=neutral; spf=pass (client-ip=158.69.130.18; helo=smtpout.efficios.com; envelope-from=kstewart@efficios.com; receiver=lists.ozlabs.org) smtp.mailfrom=efficios.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=efficios.com header.i=@efficios.com header.a=rsa-sha256 header.s=smtpout1 header.b=XFz2QqZG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=efficios.com (client-ip=158.69.130.18; helo=smtpout.efficios.com; envelope-from=kstewart@efficios.com; receiver=lists.ozlabs.org)
Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YyB0K2XdRz2yh2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 07:27:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1739910441;
	bh=YVI5exqhXtTK6AnQzPNoWRQDD3V/AhCHKs/nyX3bdIg=;
	h=From:Date:Subject:To:Cc:From;
	b=XFz2QqZGXPNEBUB9cMN1Yi/BFhCh/ELD75YfUtW7mq13eBDBc+NSXT40rme2mIGjW
	 SP+qAbHTq5/Lr/a6lKdRKxl2xry2ZEOE/YCNqRXBlZPGvs5/nnMgT9/44/plzNLojc
	 mWdqj/WYxMyW+PxZGEnMTCVGvtObgaHO8wY29NEceOHhubsd0othXg98p1UglBFUJZ
	 5b+KxgHbkLSszBF9CO34djoKEGtrrNvgp6+Pjpgmml8UV945ZKFw8nxV6mmcOi5Ztz
	 0G/PnyS44l5q2As9sqRvEKQ8ZBYsbaZP3ny0fEC1StVHl44KvSzTi1qawoIV0nJ5lJ
	 a9aTDkakeoEAA==
Received: from smtpout01.internal.efficios.com (96-127-217-162.qc.cable.ebox.net [96.127.217.162])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4YyB091DLFzwhg;
	Tue, 18 Feb 2025 15:27:21 -0500 (EST)
Received: from laptop-kstewart.internal.efficios.com (laptop-kstewart.internal.efficios.com [172.16.0.60])
	by smtpout01.internal.efficios.com (Postfix) with ESMTP id DEA352A4B6;
	Tue, 18 Feb 2025 15:27:20 -0500 (EST)
From: Kienan Stewart <kstewart@efficios.com>
Date: Tue, 18 Feb 2025 15:26:39 -0500
Subject: [PATCH v2] kbuild: Add missing $(objtree) prefix to powerpc
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
Message-Id: <20250218-buildfix-extmod-powerpc-v2-1-1e78fcf12b56@efficios.com>
X-B4-Tracking: v=1; b=H4sIAP7stGcC/4WNTQ6CMBCFr0Jm7Rim5ce48h6GBZSpTCK0aRExh
 LtbuYDL7+W9720QOQhHuGYbBF4kipsSqFMGZminB6P0iUHlqsxJ1di95NlbWZHXeXQ9evfm4A2
 2dVEwaU32oiGtfeDUOsz3JvEgcXbhcxwt9Ev/OxdCwqLMU6mjSlX6xtaKERfPxo3Q7Pv+BYxLi
 nrBAAAA
X-Change-ID: 20250127-buildfix-extmod-powerpc-a744e1331f83
To: Masahiro Yamada <masahiroy@kernel.org>, 
 Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>
Cc: linux-build@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, Nicolas Schier <n.schier@avm.de>, 
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

Fixes: 13b25489b6f8 ("kbuild: change working directory to external module directory with M=")
Acked-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
Tested-by: Nicolas Schier <n.schier@avm.de>
Signed-off-by: Kienan Stewart <kstewart@efficios.com>
---
Changes in v2:
- Added Review-by/Tested-by/Fixes/Acked-By
- Removed mention of possible work-around for external modules (while
the build will pass, `make modules_install` will fail)
- Link to v1: https://lore.kernel.org/r/20250127-buildfix-extmod-powerpc-v1-1-450012b16263@efficios.com
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



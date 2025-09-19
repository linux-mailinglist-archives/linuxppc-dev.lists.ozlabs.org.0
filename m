Return-Path: <linuxppc-dev+bounces-12427-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 374E2B8A948
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 18:32:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSyjK5D22z3cbL;
	Sat, 20 Sep 2025 02:32:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.136.65.225
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758284730;
	cv=none; b=LHHPoTJlweMdpYen0t9xYAd5DUNp966TIU5zKBrnHb+/MLAaLNqJK/Qc9hv/lh8AJlacxSG2xlWgmJyIyEggDUiRx9EzN1kL0taX8m3V7+OZmDgNP/T5S6DZelS8pEN5fe6VuDO5gCibJYKnA6dYRwHk+Ia1s23NaVEgJvjw3jjtXpv3cP57ejXyOCzTP10o+Al2y+Je/FUIB2cq6gyg3Vv+pt5UUpNyJSRIYtXQiJV0PBblkWy6NGz/StDziRwpJGJ2qGGNaAThCsovscdLpFRwDGxfaQqjHA3lHwsBX2e+UNGgdAwPseQVUyFbC/+dw6WOJk01w6OLV6l8e01ELA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758284730; c=relaxed/relaxed;
	bh=8U4MhoCvYzcsvxu74c2qr8Quw80+5E5+N9Y7pQSVLd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UVuUXL55jxuhXy6tf+jpjETCSejmXP3epUSbztD6e3MCGx8n3XlJEdCezT78d8XlxklK0bpwG/s2w7F5Qg630RPJ/hZuFOphaW2UV5Hd7fgZoMBwXQGmkCnfTZf2XMsObNMEF63zDwwmEiqmU06iQv+SkTLg9YwhXHrrc5FshmAmTweoXuh2q1Xo8pybiZXQPGNY/ht4JglRbVWGc/w6nCMORcd6FVMV2eQnUXSWfLGAm+kR8srLXTbGoQJeo3Y+Ajfd1e9lw/hs/u03sD8boDjgHCqe1FRUVREQDS35z6SaOa65sQk6Gcr7mtTG8jAgaN02MoLWLyEJZuxA95/0hQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=cOvmr4dw; dkim-atps=neutral; spf=pass (client-ip=185.136.65.225; helo=mta-65-225.siemens.flowmailer.net; envelope-from=fm-456497-20250919121511d12f12265700020708-f4oq0e@rts-flowmailer.siemens.com; receiver=lists.ozlabs.org) smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.a=rsa-sha256 header.s=fm1 header.b=cOvmr4dw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=rts-flowmailer.siemens.com (client-ip=185.136.65.225; helo=mta-65-225.siemens.flowmailer.net; envelope-from=fm-456497-20250919121511d12f12265700020708-f4oq0e@rts-flowmailer.siemens.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 605 seconds by postgrey-1.37 at boromir; Fri, 19 Sep 2025 22:25:24 AEST
Received: from mta-65-225.siemens.flowmailer.net (mta-65-225.siemens.flowmailer.net [185.136.65.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSsCm2MPgz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 22:25:23 +1000 (AEST)
Received: by mta-65-225.siemens.flowmailer.net with ESMTPSA id 20250919121511d12f12265700020708
        for <linuxppc-dev@lists.ozlabs.org>;
        Fri, 19 Sep 2025 14:15:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=8U4MhoCvYzcsvxu74c2qr8Quw80+5E5+N9Y7pQSVLd0=;
 b=cOvmr4dwT/Z6UVcHjFlJkCJztR/Uae2vZNVCx7PY6gJPhDQgdiUNAYJuDrK+s3cfYJ9aPw
 CkgpimGqfTC2aQbHxWMHn5tdGzeTMiqtGueG9OC9pPVoBch23K4yMMnykmEdZ65I+rn5J7YQ
 fCA+iSzMnsjnbs4XFG/aY55fBaOngAxhsT4mf8o2E3/z4OqfImuqVvrjRXnGBeoKgrZ8qHwg
 tsu75T+rplW8si32hfgP5zoa0oXtvK2qJIKl1EBxzrtxIXlG7F0KeGVdyqxJOHHKi9kQc57w
 QTnFGLUPXhn8J6jDS+OV4h13KUuGHn/Zxu5AWhpIh7hUJN+k7rWm7+TQ==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	Peter Marko <peter.marko@siemens.com>,
	stable@vger.kernel.org
Subject: [PATCH] powerpc/Makefile: use $(objtree) for crtsavres.o
Date: Fri, 19 Sep 2025 14:14:12 +0200
Message-ID: <20250919121417.1601020-1-alexander.sverdlin@siemens.com>
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
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

... otherwise it could be problematic to build external modules:

make[2]: Entering directory '.../kernel-module-hello-world'
|   CC [M]  hello-world.o
|   MODPOST Module.symvers
|   CC [M]  hello-world.mod.o
|   CC [M]  .module-common.o
|   LD [M]  hello-world.ko
| powerpc-poky-linux-ld.bfd: cannot find arch/powerpc/lib/crtsavres.o: No such file or directory

Fixes: da3de6df33f5 ("[POWERPC] Fix -Os kernel builds with newer gcc versions")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 arch/powerpc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 9753fb87217c3..a58b1029592ce 100644
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
-- 
2.51.0



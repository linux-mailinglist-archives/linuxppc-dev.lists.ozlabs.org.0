Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A147F804939
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 06:13:39 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e/wAoH+j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SkpbP0ryjz3dFr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Dec 2023 16:13:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=e/wAoH+j;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SkpZM6Z1Fz3d9B
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Dec 2023 16:12:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1701753163;
	bh=Y/UcMyZulCMpkKSxYUXawhkspAHbn05SpEAtSEun5f8=;
	h=From:To:Cc:Subject:Date:From;
	b=e/wAoH+jxLNN6y6pGOoENMhYs6iAjqi0qMSAD3hkk1mXBmV+u6rKYDB5BiPg6LELO
	 xZ1xgrfVUhxQzgcLjcLxdgoG6iiGCoY836W9XYzhCTgEd2csFkuQL61qTzRcbBMK7c
	 NmjfZ5Mt3fvTiQghsxPvswHJZryEc/Ltj009Lj+quYT5TlyUO7oUymHarqJPQ6LS9Q
	 LwBzj1ugvHD73nQdNXcGJcgj1hAmeBu4zgas1pVsOYgd3j7ZbrJtG1n8kOjEIcfApi
	 E4quCoXT9ZhC8mj+Nzbjfjw1kS9ChPhYV48cNEiSvOGPy5zsZfObIgCzqjAUa78L8T
	 OhTQf/fSmQokA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SkpZM4Spcz4wdB;
	Tue,  5 Dec 2023 16:12:43 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] MAINTAINERS: powerpc: Transfer PPC83XX to Christophe
Date: Tue,  5 Dec 2023 16:12:39 +1100
Message-ID: <20231205051239.737384-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: oss@buserror.net, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe volunteered[1] to maintain PPC83XX.

1: https://lore.kernel.org/all/7b1bf4dc-d09d-35b8-f4df-16bf00429b6d@csgroup.eu/

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 562d048863ee..d4efe48cc36a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12287,21 +12287,21 @@ S:	Orphan
 F:	arch/powerpc/platforms/40x/
 F:	arch/powerpc/platforms/44x/
 
-LINUX FOR POWERPC EMBEDDED PPC83XX AND PPC85XX
+LINUX FOR POWERPC EMBEDDED PPC85XX
 M:	Scott Wood <oss@buserror.net>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Odd fixes
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git
 F:	Documentation/devicetree/bindings/cache/freescale-l2cache.txt
 F:	Documentation/devicetree/bindings/powerpc/fsl/
-F:	arch/powerpc/platforms/83xx/
 F:	arch/powerpc/platforms/85xx/
 
-LINUX FOR POWERPC EMBEDDED PPC8XX
+LINUX FOR POWERPC EMBEDDED PPC8XX AND PPC83XX
 M:	Christophe Leroy <christophe.leroy@csgroup.eu>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Maintained
 F:	arch/powerpc/platforms/8xx/
+F:	arch/powerpc/platforms/83xx/
 
 LINUX KERNEL DUMP TEST MODULE (LKDTM)
 M:	Kees Cook <keescook@chromium.org>
-- 
2.43.0


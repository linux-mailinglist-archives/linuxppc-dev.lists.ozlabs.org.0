Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC5169DDC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 11:20:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLb0F6Mszz3cDT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 21:20:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y7xC22ZO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLZzL0Ztvz2xVn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 21:19:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Y7xC22ZO;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PLZzH1Ltzz4x7W;
	Tue, 21 Feb 2023 21:19:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1676974795;
	bh=li50LnN9wFz+Q5XL5VvsfEiAeotzY7Uf6X/R6UZlXvc=;
	h=From:To:Subject:Date:From;
	b=Y7xC22ZOiyfoU7w/xLYIoX/n3zQxfw9+EQU+IunF8TfRSxkH54D4a+DiY35ipZLK1
	 m+yicdHOrHpqXq7YABwtIstOlQWDuUDnZ3/Wh75A6jo61VDLYT1Q+dWIBv5AQncSwp
	 TY9gx1URSvybOZ5g55V/qFYmsqNU5PkM9AH+AgTa4UcPK0aku7kFqyzwuWwjG8XJM4
	 oE43gnigQGAdsLjcbxGnDTE/a1eYxbRlTpvtRE0h9XAukJmKQCMTfs04Z/E71ug8s6
	 FrKXN7bE95Qyoi2oy9+GXRyQ10Wp2IUd6UbSzU8lfD828p0qJOpDeMnrVFObKlTtQz
	 KDKPKsLId5lqw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc: Drop orphaned VAS MAINTAINERS entry
Date: Tue, 21 Feb 2023 21:19:52 +1100
Message-Id: <20230221101952.2697101-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.1
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The MAINTAINERS entry for VAS (Virtual Accelerator Switchboard) no
longer has any maintainers, it just points to linuxppc-dev, since commit
60496069d0ae ("powerpc: Update MAINTAINERS for ibmvnic and VAS").

So just drop the VAS entry, all the paths are already covered by the
main powerpc entry, ie. the output of get_maintainer.pl is unchanged.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7f86d02cb427..13be1509b8d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9899,13 +9899,6 @@ L:	netdev@vger.kernel.org
 S:	Supported
 F:	drivers/net/ethernet/ibm/ibmvnic.*
 
-IBM Power Virtual Accelerator Switchboard
-L:	linuxppc-dev@lists.ozlabs.org
-S:	Supported
-F:	arch/powerpc/include/asm/vas.h
-F:	arch/powerpc/platforms/powernv/copy-paste.h
-F:	arch/powerpc/platforms/powernv/vas*
-
 IBM Power Virtual Ethernet Device Driver
 M:	Nick Child <nnac123@linux.ibm.com>
 L:	netdev@vger.kernel.org
-- 
2.39.1


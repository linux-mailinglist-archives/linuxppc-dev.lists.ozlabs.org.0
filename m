Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DFADD8B6982
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 06:43:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ap1ovaM6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VT6yc11d5z3cTt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 14:43:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ap1ovaM6;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VT6xp6y30z2ydQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 14:42:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1714452158;
	bh=hVwO34kPSmLeutYDfLcZ2znsLYIE4NMhTr3UcrMhXYw=;
	h=From:To:Cc:Subject:Date:From;
	b=ap1ovaM6ItjB+Z0xpnLRMvgWb5xXzN3J9paBTFK9js1D+AGdqW4jRJTGsN2c+8CMT
	 WZ3Y00sObEDQTxUBppvrWUl435YUdNr78jzgVjA8AqVMqp8PgL3Yi5AqzSCtfL+jDo
	 AuCghk8Od3sEmDsAdJ4/EK/UVxgGPT4oDYvjfZ+uB2R9sIAYc9txTwoRdTGWn6KpS9
	 sRkoqRvBx7m+iEeMygV5mh/jRGilL8mvWmm5npt3dlL0EAyDQtmp+27hKmckcntK/Q
	 awBdwbGmc+y1M6kIoUKgl78UmY0KVdfSkuVwqPLEefxyapQs4llWv69NNwNqysjhlC
	 ZPhvOLVffgTAA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VT6xp0S6Zz4wyk;
	Tue, 30 Apr 2024 14:42:38 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] MAINTAINERS: powerpc: Remove Aneesh
Date: Tue, 30 Apr 2024 14:42:28 +1000
Message-ID: <20240430044228.49015-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.44.0
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
Cc: naveen.n.rao@linux.ibm.com, aneesh.kumar@kernel.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Aneesh is stepping down from powerpc maintenance.

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7c121493f43d..93af33ee8541 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12478,7 +12478,6 @@ LINUX FOR POWERPC (32-BIT AND 64-BIT)
 M:	Michael Ellerman <mpe@ellerman.id.au>
 R:	Nicholas Piggin <npiggin@gmail.com>
 R:	Christophe Leroy <christophe.leroy@csgroup.eu>
-R:	Aneesh Kumar K.V <aneesh.kumar@kernel.org>
 R:	Naveen N. Rao <naveen.n.rao@linux.ibm.com>
 L:	linuxppc-dev@lists.ozlabs.org
 S:	Supported
-- 
2.44.0


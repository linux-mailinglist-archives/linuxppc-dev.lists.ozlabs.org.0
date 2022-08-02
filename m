Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AA76A587B22
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 12:58:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxsR04L6Fz3c5w
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 20:58:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cVIrXTyt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxsQL29R2z2xHQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 20:57:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=cVIrXTyt;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxsQK27lvz4wgn;
	Tue,  2 Aug 2022 20:57:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1659437849;
	bh=gq3nTHWzKiXuextMHW7/RGFmk9N1CG1G8nVYJHyeiSI=;
	h=From:To:Cc:Subject:Date:From;
	b=cVIrXTytEaKZ0/zkhLhvKDREFxwSipo0VgwBIeLC/P8+WPUHHWR8Jx62YYBg+XLLc
	 oKpIfnaxgBcSvmlfTcI7cXX8qXqpUQuKYUdCWKVMLTCg/zA7Tol8asNSxzoeN4PT21
	 Vm57j2eiSVQttp8Uc4NZF/fQJMeOwaTnDpVTG9mdwJGRuSTyJXU1/QlFEzhnaaLwcy
	 7OMH4TtYfU/GVrb508NbJH3ZUND0C3WThL2w8Yvwp0346YsUHdAcdugbO7RagOANW9
	 anHecGv3PguD/FecetrMQnk/cV1xWvTnAoM5fVjvRRiNlAFofpSOwHg6JYV8faj7Ce
	 b8vghuvjcoMpQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/pci: Fix PHB numbering when using opal-phbid
Date: Tue,  2 Aug 2022 20:57:23 +1000
Message-Id: <20220802105723.1055178-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.3
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
Cc: pali@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The recent change to the PHB numbering logic has a logic error in the
handling of "ibm,opal-phbid".

When an "ibm,opal-phbid" property is present, &prop is written to and
ret is set to zero.

The following call to of_alias_get_id() is skipped because ret == 0.

But then the if (ret >= 0) is true, and the body of that if statement
sets prop = ret which throws away the value that was just read from
"ibm,opal-phbid".

Fix the logic by only doing the ret >= 0 check in the of_alias_get_id()
case.

Fixes: 0fe1e96fef0a ("powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/pci-common.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kernel/pci-common.c b/arch/powerpc/kernel/pci-common.c
index 8ce36aba42da..bdd3332200c5 100644
--- a/arch/powerpc/kernel/pci-common.c
+++ b/arch/powerpc/kernel/pci-common.c
@@ -91,11 +91,13 @@ static int get_phb_number(struct device_node *dn)
 	}
 	if (ret)
 		ret = of_property_read_u64(dn, "ibm,opal-phbid", &prop);
-	if (ret)
+
+	if (ret) {
 		ret = of_alias_get_id(dn, "pci");
-	if (ret >= 0) {
-		prop = ret;
-		ret = 0;
+		if (ret >= 0) {
+			prop = ret;
+			ret = 0;
+		}
 	}
 	if (ret) {
 		u32 prop_32;
-- 
2.35.3


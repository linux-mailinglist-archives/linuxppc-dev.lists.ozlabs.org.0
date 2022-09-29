Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4D65EF70C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 16:01:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdZlX4sm1z3dyJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:01:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gZPXJqcJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdZjj0vDmz3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Sep 2022 23:59:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gZPXJqcJ;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdZjh5Cx0z4xGl;
	Thu, 29 Sep 2022 23:59:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664459976;
	bh=5OtFoQ1gJJS/UBlrcEilyULb235s4X6tgM/6LmrU7rI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gZPXJqcJFZPzrZ2XmDwqpkKHrBo0sPO1/pFoOUs2+Mys4TxqS5fFHcaRiHpVjVcld
	 +gMNQcWy18XruW50dGShEXUVh/kcRKhiqPoBwXGTfsWOxeOX/c52XJCjMQsce7I0Ro
	 UktOW5BBwWfIuf7XeKWhRvY0JMrba13f+e7/cwAu8uWFWaIYqzexPxk63Oxu1nV0KV
	 wpHF/QbqasKWf8rnBZSm/pgvX3Yxxogk9Or/cqO5wqbjLLdMTFv1Aqb7IfhCyTBHpl
	 SBzWfv3bpWBdjYFPX50LKQ6CaxoobN/JKFEiXykMsI577Jn8i9/nndElBLKA2yWtUF
	 sayQAjulm6QTA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 6/6] powerpc/pseries: Add firmware details to the hardware description
Date: Thu, 29 Sep 2022 23:59:19 +1000
Message-Id: <20220929135919.1983269-6-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929135919.1983269-1-mpe@ellerman.id.au>
References: <20220929135919.1983269-1-mpe@ellerman.id.au>
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
Cc: nathanl@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add firmware version details to the hardware description, which is
printed at boot and in case of an oops.

Use /hypervisor if we find it, though currently it only exists if we're
running under qemu.

Look for "ibm,powervm-partition" which is specified in PAPR+ v2.11 and
tells us we're running under PowerVM.

Failing that look for "ibm,fw-net-version" which is seen on PowerVM
going back to at least Power6.

eg: Hardware name: ... of:'IBM,FW860.42 (SV860_138)' hv:'phyp'

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/platforms/pseries/setup.c | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

v2: Look for "ibm,powervm-partition" as suggested by Nathan.
    Use of_property_read_string().

diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index 5e44c65a032c..83b047db35da 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1018,6 +1046,8 @@ static void __init pseries_init(void)
 {
 	pr_debug(" -> pseries_init()\n");
 
+	pseries_add_hw_description();
+
 #ifdef CONFIG_HVC_CONSOLE
 	if (firmware_has_feature(FW_FEATURE_LPAR))
 		hvc_vio_init_early();
-- 
2.37.3


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E5BB5EF76D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Sep 2022 16:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MdbH53l9lz3c7l
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 00:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mZDnihUS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MdbFJ4v4Mz3bSX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 00:23:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mZDnihUS;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MdbFJ45hGz4xG6;
	Fri, 30 Sep 2022 00:23:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664461412;
	bh=Cb/cTHXpcBtzZbP1obHiikKKNM4JCw9+64ilWViZ5lk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mZDnihUSAvPPuAE+pg239JcFJD8/qPMP0jEc1O4movKd1j/WgETEUAURefN+ttxJU
	 Gd6/BKfurTpZ2/TrQ9h3wWaitLD+Zf6VuSZXrHA1xz+vl1iFBvw0SWTJuwd38/6ufk
	 uhtR0vv0lpWmDaNoX6JB2vhISAGPb+fm3ziobynQ+Uba3Jnqcz2uBjhgA21QHaRkr5
	 xrQXe/do5oe5AbIak7o3zYPiV0oXx7Xj9vms/8Jpa4kkc9o3nS1RDFIFbAsoM6T7cM
	 uPceBP0/eAKr5xMA1KZuOE5bib9xjudQzfSkneqLa6BK6iiU/uN2OsHoUaPhSUsVF8
	 jBW4hp5qp9A2Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 3/6] powerpc/64: Add logical PVR to the hardware description
Date: Fri, 30 Sep 2022 00:22:48 +1000
Message-Id: <20220929142251.1987025-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220929142251.1987025-1-mpe@ellerman.id.au>
References: <20220929142251.1987025-1-mpe@ellerman.id.au>
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

If we detect a logical PVR add that to the hardware description, which
is printed at boot and in case of an oops.

eg: Hardware name: ... lpvr:0xf000004

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index b42e2dbeb021..8c4cce6dc1e8 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -390,8 +390,10 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	 */
 	if (!dt_cpu_ftrs_in_use()) {
 		prop = of_get_flat_dt_prop(node, "cpu-version", NULL);
-		if (prop && (be32_to_cpup(prop) & 0xff000000) == 0x0f000000)
+		if (prop && (be32_to_cpup(prop) & 0xff000000) == 0x0f000000) {
 			identify_cpu(0, be32_to_cpup(prop));
+			seq_buf_printf(&ppc_hw_desc, "lpvr:0x%04x ", be32_to_cpup(prop));
+		}
 
 		check_cpu_feature_properties(node);
 		check_cpu_features(node, "ibm,pa-features", ibm_pa_features,
-- 
2.37.3


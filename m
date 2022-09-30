Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE185F066A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 10:29:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf3LJ6NLVz3dqx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 18:29:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gI/AcHws;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf3K84wgzz2xy2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 18:28:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gI/AcHws;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Mf3K83pLwz4xGk;
	Fri, 30 Sep 2022 18:28:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1664526508;
	bh=ZrM6T/KXJyPxKYfLeGjGcN1HR+t+1SIb13Ka+E8p0Dg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gI/AcHwsE8vqfqFocQfm7Q7sTVMZnornIADdQ/m0MA157p6QswOUSK0GZqa+oQ4P6
	 uC6PnUGIIVDw0H5DZmBHrTprHgHMcubkk7vFge7Ql16wpdJ+o6AoNmPDtCeJgrTnuZ
	 FiRQUN/RF3jtudQvkeZNKvVLp026bp4GFPoCLfesQ7idOm+VPGwAzd/tN9lbVyzOzx
	 3PKioWH3Xf53jgQIQCku3FicLbPBMeq1F0roUJ8PmYi+bH9JgHZ0xqhui+qjaCs2bS
	 BxukxBhcZ64/i1EmWfKODLhQNXEkla0b0yQbYHn34PkP4RQtsSvM11F2E8eSQJW/3N
	 fOGlMyIQpquHQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v3 3/6] powerpc/64: Add logical PVR to the hardware description
Date: Fri, 30 Sep 2022 18:27:06 +1000
Message-Id: <20220930082709.55830-3-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220930082709.55830-1-mpe@ellerman.id.au>
References: <20220930082709.55830-1-mpe@ellerman.id.au>
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

eg: Hardware name: ... 0xf000004

Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/prom.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

v3: Drop "lpvr:" tag for brevity.

diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 09f07cc57216..83fc72202838 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -390,8 +390,10 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
 	 */
 	if (!dt_cpu_ftrs_in_use()) {
 		prop = of_get_flat_dt_prop(node, "cpu-version", NULL);
-		if (prop && (be32_to_cpup(prop) & 0xff000000) == 0x0f000000)
+		if (prop && (be32_to_cpup(prop) & 0xff000000) == 0x0f000000) {
 			identify_cpu(0, be32_to_cpup(prop));
+			seq_buf_printf(&ppc_hw_desc, "0x%04x ", be32_to_cpup(prop));
+		}
 
 		check_cpu_feature_properties(node);
 		check_cpu_features(node, "ibm,pa-features", ibm_pa_features,
-- 
2.37.3


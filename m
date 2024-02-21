Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 227C585CF5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 05:47:21 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TKw9MtYh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TfkK30RyVz3cQr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 15:47:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=TKw9MtYh;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfkJF31GCz3bxZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 15:46:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708490796;
	bh=uW81sGVlXn0D3DS/88Z8GrWm0dvijSmjuyoaw4LqACQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TKw9MtYhV3IAuXOnbjObtBrimQyv2fINWX4BBhTbWq0MM9ZiK1ycXLj6n95ELl5vS
	 au6q/JsPQPSp8hsAmanMs7YdWbLYT7CX5v0mBxFWXopUtQIZROmiXLqMRisGDjspcM
	 dRRHGFXflD5kYzG3uL4L3trhHOMW1dpDELZIVE8ruDs9lTNeamCnAZL2eDqMPiMY1G
	 HsC4tgk+HGwTfId6yuQ3W/GtEmB93XWhGkrfYnQjlNjxNElqZ3tw+Q1+Y2BIPTjzbk
	 9t+avaYYFUz2HrVv5wkWgKOdJmMYhoP2dnediDNQgTdsj6cboW7zlIBFDlZNYDyc/B
	 TzjY35CExT5pQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TfkJD1BRXz4wc4;
	Wed, 21 Feb 2024 15:46:36 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v4 2/2] powerpc/perf: Power11 Performance Monitoring support
Date: Wed, 21 Feb 2024 15:46:23 +1100
Message-ID: <20240221044623.1598642-2-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240221044623.1598642-1-mpe@ellerman.id.au>
References: <20240221044623.1598642-1-mpe@ellerman.id.au>
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
Cc: maddy@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Madhavan Srinivasan <maddy@linux.ibm.com>

Base enablement patch to register performance monitoring
hardware support for Power11. Most of fields are copied
from power10_pmu struct for power11_pmu struct.

Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/perf/core-book3s.c |  2 ++
 arch/powerpc/perf/internal.h    |  1 +
 arch/powerpc/perf/power10-pmu.c | 27 +++++++++++++++++++++++++++
 3 files changed, 30 insertions(+)

v4: No change.

diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
index 01d14523c938..6b5f8a94e7d8 100644
--- a/arch/powerpc/perf/core-book3s.c
+++ b/arch/powerpc/perf/core-book3s.c
@@ -2593,6 +2593,8 @@ static int __init init_ppc64_pmu(void)
 		return 0;
 	else if (!init_power10_pmu())
 		return 0;
+	else if (!init_power11_pmu())
+		return 0;
 	else if (!init_ppc970_pmu())
 		return 0;
 	else
diff --git a/arch/powerpc/perf/internal.h b/arch/powerpc/perf/internal.h
index 4c18b5504326..a70ac471a5a5 100644
--- a/arch/powerpc/perf/internal.h
+++ b/arch/powerpc/perf/internal.h
@@ -10,4 +10,5 @@ int __init init_power7_pmu(void);
 int __init init_power8_pmu(void);
 int __init init_power9_pmu(void);
 int __init init_power10_pmu(void);
+int __init init_power11_pmu(void);
 int __init init_generic_compat_pmu(void);
diff --git a/arch/powerpc/perf/power10-pmu.c b/arch/powerpc/perf/power10-pmu.c
index 9b5133e361a7..62a68b6b2d4b 100644
--- a/arch/powerpc/perf/power10-pmu.c
+++ b/arch/powerpc/perf/power10-pmu.c
@@ -634,3 +634,30 @@ int __init init_power10_pmu(void)
 
 	return 0;
 }
+
+static struct power_pmu power11_pmu;
+
+int __init init_power11_pmu(void)
+{
+	unsigned int pvr;
+	int rc;
+
+	pvr = mfspr(SPRN_PVR);
+	if (PVR_VER(pvr) != PVR_POWER11)
+		return -ENODEV;
+
+	/* Set the PERF_REG_EXTENDED_MASK here */
+	PERF_REG_EXTENDED_MASK = PERF_REG_PMU_MASK_31;
+
+	power11_pmu = power10_pmu;
+	power11_pmu.name = "Power11";
+
+	rc = register_power_pmu(&power11_pmu);
+	if (rc)
+		return rc;
+
+	/* Tell userspace that EBB is supported */
+	cur_cpu_spec->cpu_user_features2 |= PPC_FEATURE2_EBB;
+
+	return 0;
+}
-- 
2.43.1


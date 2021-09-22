Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1320414DB9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 18:06:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF37t3tqRz2yPw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 02:06:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=BSKFbjKQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.122;
 helo=smtp-relay-internal-0.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=BSKFbjKQ; 
 dkim-atps=neutral
Received: from smtp-relay-internal-0.canonical.com
 (smtp-relay-internal-0.canonical.com [185.125.188.122])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF36S31bMz2yHX
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 02:05:19 +1000 (AEST)
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C6DFE402D8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 16:05:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632326714;
 bh=am6HvhYMUQG0l4YQDLjqW15GPRKaMpXA2sBsBZSwSw8=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=BSKFbjKQJu2MGLI2h5Lc5HSvbmoyHWs7vsNhZc+55vnCUaknkiRodo+IRwrfr4iw0
 2voceXrgKFCbAPDFiwURdf1mtTV453NwO7Wprc8QiV2Zr7Jl22YhYMTgvYyPQT539u
 Pqd1UtwlatksZT3nbPWZXcUVBppuJZpIEsubkDyQjU57a95IF6EFizSv2kIYSwSPkH
 PC9wqHWz27lQD/WF/tCYBBHhBDKp6EcEqMgr6yacH0lpM36fYHONC+FUv4FehquCSb
 fb1Isx8xxVZqmZOekmmoo7o/62zgb2N0QDXYCWUK9YbgM8OYDL2SaFcVwJUgsefpEe
 P7GOD1dpQ9ygQ==
Received: by mail-ed1-f70.google.com with SMTP id
 m20-20020aa7c2d4000000b003d1add00b8aso3687111edp.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 09:05:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=am6HvhYMUQG0l4YQDLjqW15GPRKaMpXA2sBsBZSwSw8=;
 b=n0dhs/oCrqKM0GKKFO9fKharVLYNVFPlQ/kuR59gA17o+4fckBvP/Nu/NuMHvZWRxV
 ImDMYFZVJkO32LfvnCv60yZwc04dpwofgWighh4XyLQXtKuZSk5TVmciMzvWTrgAWiSE
 bY4UZpr4r3Ap5JFcjv1EWdp4bV02TCVU7hSgcSA4z7K85g8SOGgMETrS11bx049yAosZ
 gkG/O1vnMxSVyTsJVK7k3R6L+9l1V2HdBAep0WWoWVuwq8sYB7ZO5Vb/kNaXBUS2gGXM
 oFEY4vQZ/Vo9DB9nqYx0ttUf87vQMbI+qPhlcnmtfvF7SIJpKAHHCw5qtg/5Io4n7FrH
 vL1w==
X-Gm-Message-State: AOAM531FCw9xvGDXFk3qlW3RYZ7LgzLGIfSkjKRDJfq/91qOGpIVu/ac
 8lmOnkQ5CyHBWkdEwqM2VIOVcEzBhVOBWp9Q/riwnfqO/safu7nIikwdyyHrvQ0AHf500Q5On3m
 8OwPUzEKcs05rRa6OYUPtfVGr334PqUfGrszSpKQ1OFk=
X-Received: by 2002:a17:906:718e:: with SMTP id
 h14mr302544ejk.365.1632326713300; 
 Wed, 22 Sep 2021 09:05:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx8bDWBvCoh+uqmD+95itTH1Ems+DKgL3XEMXBSbfrZ0KQf/4dDkPPwClcn682BfTFNhzCFcw==
X-Received: by 2002:a17:906:718e:: with SMTP id
 h14mr302524ejk.365.1632326713104; 
 Wed, 22 Sep 2021 09:05:13 -0700 (PDT)
Received: from localhost.localdomain
 (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id l7sm1511135edb.26.2021.09.22.09.05.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 09:05:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] powerpc/powermac: add missing g5_phy_disable_cpu1()
 declaration
Date: Wed, 22 Sep 2021 18:04:35 +0200
Message-Id: <20210922160436.130931-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

g5_phy_disable_cpu1() is used outside of platforms/powermac/feature.c,
so it should have a declaration to fix W=1 warning:

  arch/powerpc/platforms/powermac/feature.c:1533:6:
    error: no previous prototype for ‘g5_phy_disable_cpu1’ [-Werror=missing-prototypes]

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

---

Changes since v1:
1. Drop declaration in powermac/smp.c
---
 arch/powerpc/include/asm/pmac_feature.h | 4 ++++
 arch/powerpc/platforms/powermac/smp.c   | 2 --
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/pmac_feature.h b/arch/powerpc/include/asm/pmac_feature.h
index e08e829261b6..7703e5bf1203 100644
--- a/arch/powerpc/include/asm/pmac_feature.h
+++ b/arch/powerpc/include/asm/pmac_feature.h
@@ -143,6 +143,10 @@
  */
 struct device_node;
 
+#ifdef CONFIG_PPC64
+void g5_phy_disable_cpu1(void);
+#endif /* CONFIG_PPC64 */
+
 static inline long pmac_call_feature(int selector, struct device_node* node,
 					long param, long value)
 {
diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platforms/powermac/smp.c
index 3256a316e884..5d0626f432d5 100644
--- a/arch/powerpc/platforms/powermac/smp.c
+++ b/arch/powerpc/platforms/powermac/smp.c
@@ -875,8 +875,6 @@ static int smp_core99_cpu_online(unsigned int cpu)
 
 static void __init smp_core99_bringup_done(void)
 {
-	extern void g5_phy_disable_cpu1(void);
-
 	/* Close i2c bus if it was used for tb sync */
 	if (pmac_tb_clock_chip_host)
 		pmac_i2c_close(pmac_tb_clock_chip_host);
-- 
2.30.2


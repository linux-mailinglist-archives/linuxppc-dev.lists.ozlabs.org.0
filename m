Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83681417089
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 12:58:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HG8CR2CTdz307F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 20:58:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=rEbFlMU8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=canonical.com (client-ip=185.125.188.123;
 helo=smtp-relay-internal-1.canonical.com;
 envelope-from=krzysztof.kozlowski@canonical.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=canonical.com header.i=@canonical.com
 header.a=rsa-sha256 header.s=20210705 header.b=rEbFlMU8; 
 dkim-atps=neutral
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HG8Bh6qfRz2ypC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 20:57:47 +1000 (AEST)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C29AD40783
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 10:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1632481060;
 bh=5qaBnFV4UUYxgISb8cWftr5quOXHWqv70CjWCUQzcvI=;
 h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
 b=rEbFlMU8mo7ueYnR6LSvRkBXiK7Mzhn5rOBhF0q8zil8+IvCBjtYCXRXavPw0uEC5
 60Um72p954zqWnRo8UExZ9gmxQuxUqVJTcTUBPsI1SQ7+fxyUxXxQTGPAWaijBjZXV
 0UO7Ogza2SRWMjswM7NljWef0H9VEB7jgA/IQZTsLaqA6DtWZlpWsBYz7VxDCeOI+B
 NTzc9ggJRHuRQM8lY+gQz/vtz5vuVL3j+tsj1t4pcVkxz4KHEiBQ2gTa7PN6E/Pyrh
 tQ/oUNAJ3u1aZ7ZpBWppKnR2vILDsykKNlOEfvY4eh7NAoLnylfgZ3BqM2p2fRf9GJ
 XxjHhftkNr1Rw==
Received: by mail-wr1-f69.google.com with SMTP id
 s13-20020a5d69cd000000b00159d49442cbso7717285wrw.13
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 03:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5qaBnFV4UUYxgISb8cWftr5quOXHWqv70CjWCUQzcvI=;
 b=NV+lr7iCiqJceFZl2KzA1xNIHy8y/GTwPoyIsvhGKHko3sm8H8jJqtviyXi4OU0RBZ
 SVAN4PPcs9F5aoC2Ss+3uvjK1ju6l7oI8aqL16sD/Yraqx38YdiF5h7NKMChdSJWnulK
 lVA7FTuPZZ7DU6rDdzKEvJDSUdcOXgX4TS/VTHdMc/lfpuyZrwb/3MaLCph2Cg63G/PA
 HYeo5uTeKfYM09qjrt7yajOfvcw0L/god/IODMZDIQ/TeYDn2lwSe4d60bDSo6nQ1gCI
 3Y8o/F8tBabBGzyuhTaICZL5KUjbyCUGbm6U/sj8KdFcQhir4B53dVFgqpTPQlAUnMR/
 5IGw==
X-Gm-Message-State: AOAM531I98pfuT7WKWuUxAhCUlFBXUfYh1K2jk+isaREBrPQ4h0oAETo
 yqpNYdnXUVnyyDTdWz5BuR/0PcOFhiIzcekMuP6cmcGA0Kl3fldse6JIL7qfnDchgy8aZwF/Q1I
 qFaAtF3qiLSyK30zq4Y7tyVzs2rT5XhcPURQT65sKB88=
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr1372339wmj.76.1632481060502;
 Fri, 24 Sep 2021 03:57:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDVTGZH5QCPK7kyu8GVnvvhqoDPEvq8MgewAmm21kiS/2XNKEsaKIMI9R6BZZAQ/A08Z3BPw==
X-Received: by 2002:a7b:cb49:: with SMTP id v9mr1372317wmj.76.1632481060111;
 Fri, 24 Sep 2021 03:57:40 -0700 (PDT)
Received: from localhost.localdomain
 (lk.84.20.244.219.dc.cable.static.lj-kabel.net. [84.20.244.219])
 by smtp.gmail.com with ESMTPSA id x17sm8188836wrc.51.2021.09.24.03.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 03:57:39 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] powerpc/powermac: add missing g5_phy_disable_cpu1()
 declaration
Date: Fri, 24 Sep 2021 12:56:52 +0200
Message-Id: <20210924105653.46963-1-krzysztof.kozlowski@canonical.com>
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

Changes since v2:
1. Put declaration in powermac/pmac.h

Changes since v1:
1. Drop declaration in powermac/smp.c
---
 arch/powerpc/platforms/powermac/pmac.h | 2 ++
 arch/powerpc/platforms/powermac/smp.c  | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/pmac.h b/arch/powerpc/platforms/powermac/pmac.h
index 0d715db434dc..be528e0e507f 100644
--- a/arch/powerpc/platforms/powermac/pmac.h
+++ b/arch/powerpc/platforms/powermac/pmac.h
@@ -14,6 +14,8 @@ struct rtc_time;
 
 extern int pmac_newworld;
 
+void g5_phy_disable_cpu1(void);
+
 extern long pmac_time_init(void);
 extern time64_t pmac_get_boot_time(void);
 extern void pmac_get_rtc_time(struct rtc_time *);
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


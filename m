Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E9A4445F0E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 05:12:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlnCg6wkDz3058
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 15:12:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HYjA6QFQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HYjA6QFQ; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlnC16BD9z2xtN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 15:11:55 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 y14-20020a17090a2b4e00b001a5824f4918so2459274pjc.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 21:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HhRxGQ7Sy8pWUByDQk/8KnmcPm9O+yr7d1o5W3MZma0=;
 b=HYjA6QFQjOORr6hsexhmVGYza1ymMCc7PZbxvOrSFjO7zaSUQ2Zvhcts+vhiIqWjwn
 Z+Z8Za8NUZ/57ck/w7klVqsyesFEowfZ1pUUS2fiWUMbYuI2QkPGoneoFOoIac+goEsn
 vqOHR9jATIZv2GQCKKSQ6h1A/Qi5Fq2krlnxGoGPRPnZTnyJTcoPWiIhlWNs17UPHBnS
 fDFJ2DAcH/U1N0dSFAfji8UtkvfHikW4YtiYfuyy78hQpB7i7Ar36mU1xN8UUBAUUFKe
 KrQp1+NLFHvZfSZ8Ulsn5ypd5wd18TZNKHU9dtAans5nPuirKchm3LQlZURlPfV7rzni
 C5kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HhRxGQ7Sy8pWUByDQk/8KnmcPm9O+yr7d1o5W3MZma0=;
 b=5xBc40iN6uG/TitnlUsiAkI+5YQ3i63FUxPP1OVAw9ZWFarFXEJTqDRzRjNL0tiK9S
 AvSVX8y4Flf77TGkiEAMKLT9dmfiOLPG9SdM2jyT8uLxlu4CaKrPa5ro3v07NrM6NEKH
 95SIZdi2Utm4d+6S44pAm0uonpleLU8ttbxDuulF0hwFEqgT8g9wE0CE+VmYsujcafrz
 Ot1BtGqneC1512zfq6Ak/OkuWzekcxkqAWO0dYdcekptsZxYBnslaZ4gq71ZLr/Apjru
 gpAJBHvO7QWTJ6XJcvpGtzJyXc65x8hD7D6NwgKnTE6pmPrtUVVifgRN72LxrqM1eDU+
 7Bug==
X-Gm-Message-State: AOAM531T1DSQ8L8dIgm+LQ3dVAEbf2YjTrLhF76KSmtiq9o+RCZgtArM
 VKiEshC7LyUhdeXU9YoHdoQSuBb1vIU=
X-Google-Smtp-Source: ABdhPJywEcuToWnjuEZsrOkJp00QTwTcpYBNwNsbqV9fNFnICECGE63A+mQHgI5frhG7mo5Asm7KqA==
X-Received: by 2002:a17:90b:1b03:: with SMTP id
 nu3mr19604786pjb.240.1636085512415; 
 Thu, 04 Nov 2021 21:11:52 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 z71sm6308003pfc.19.2021.11.04.21.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 21:11:52 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/64s: introduce CONFIG_MAXSMP to test very large SMP
Date: Fri,  5 Nov 2021 14:11:32 +1000
Message-Id: <20211105041132.1443767-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Similarly to x86, add MAXSMP that should help flush out problems with
vary large SMP and other values associated with very big systems.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/Kconfig                   | 8 ++++++++
 arch/powerpc/platforms/Kconfig.cputype | 5 +++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index b8f6185d3998..d585fcfa456f 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -64,6 +64,13 @@ config NEED_PER_CPU_EMBED_FIRST_CHUNK
 config NEED_PER_CPU_PAGE_FIRST_CHUNK
 	def_bool y if PPC64
 
+config MAXSMP
+	bool "Enable Maximum number of SMP Processors and NUMA Nodes"
+	depends on SMP && DEBUG_KERNEL && PPC_BOOK3S_64
+	help
+	  Enable maximum number of CPUS and NUMA Nodes for this architecture.
+	  If unsure, say N.
+
 config NR_IRQS
 	int "Number of virtual interrupt numbers"
 	range 32 1048576
@@ -666,6 +673,7 @@ config NUMA
 
 config NODES_SHIFT
 	int
+	default "10" if MAXSMP
 	default "8" if PPC64
 	default "4"
 	depends on NUMA
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index a208997ade88..3fd6c1941151 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -476,8 +476,9 @@ config SMP
 	  If you don't know what to do here, say N.
 
 config NR_CPUS
-	int "Maximum number of CPUs (2-8192)" if SMP
-	range 2 8192 if SMP
+	int "Maximum number of CPUs (2-8192)" if SMP && !MAXSMP
+	range 2 16384 if SMP
+	default 16384 if MAXSMP
 	default "1" if !SMP
 	default "32" if PPC64
 	default "4"
-- 
2.23.0


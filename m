Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE9C5B3266
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 10:56:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP8wh0zC8z3c66
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 18:56:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LNhiywTD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LNhiywTD;
	dkim-atps=neutral
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP8w32JsKz305M
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 18:55:29 +1000 (AEST)
Received: by mail-wr1-x42f.google.com with SMTP id e16so1588006wrx.7
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 01:55:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fPvofaEf+BM4TxtIyhxZC/zjNI9R8E3LUT46F136ga4=;
        b=LNhiywTDLLHnBcl6OCNDZJVmYpUQQBo5Ipo/XFJKAg6DVnp+YKgrbAyDhqMhVredgr
         pbVU/XS09EffKtsWs1yStnLABtBlZ5Wlyz2RhLmxam/PBYt/Nuc5A2gokC2fC2AK/zyK
         GJgQQoPnfC8xEXFcZ4UzPAJfx3QnYZ57ZID05n1RakRRuMU9Jz+WokxBI+RNcnTGE8fG
         fmk+GehVrfLCf7lLWPA0kgxEaupDmAPyvW/I+shS8facJ9KFNgEnws23ygoNAdnWqFfs
         a4zGMDHcPYVtZjbQtvwCcywmh4+UT6CaUgF5X5P5yOlJ53YYRkcGs+jPMIZvv64lwJOI
         k1zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fPvofaEf+BM4TxtIyhxZC/zjNI9R8E3LUT46F136ga4=;
        b=m3d2o764S2BhFajEe0WWfpNsc/9fSVHxgG88mOS5tQIN7cW7kGpOi8yL4IVENwX0DZ
         xrnO1Wpd+v5DZtPntI/bdHF3b8s9N+TeEvsa4F1hxxBWSRqI0tuE/W01Cw9gITjlnFOi
         GG4gIDP2VkpgBeeDDcHwo6MkBb1uis5qG/IVbYpc2on+fEvdfFev4PiGa7admqjMaxXV
         jRj2xliRG2SZu0awZtCK1aIJyRZkHqsV0sgdYPhcedyQ9lHgRxQonhtecgRFfa2Q8Mbx
         KZDxUn0NDJ9KevezWft5oLpmcaYKkbg19CN/zHSF5RfSSkNQEsn5lsHUmq93qn2Tl/cu
         kh1g==
X-Gm-Message-State: ACgBeo1DiojywWdvMF6RBhtTPD7ttcQKeinxGxzvEhE6pCeuQBn2Roty
	ZW/w4fF1ZUxvyAyXh1gqPI4=
X-Google-Smtp-Source: AA6agR5ExbaE+aBChdxYVSD7wVDn3HYcvadDzcUXC1aJvwytLqqWjrNZI76Fxl1SHY9jife9qSYwXA==
X-Received: by 2002:adf:fb0a:0:b0:225:265d:493 with SMTP id c10-20020adffb0a000000b00225265d0493mr7368942wrr.394.1662713720977;
        Fri, 09 Sep 2022 01:55:20 -0700 (PDT)
Received: from felia.fritz.box (200116b8261bf1004cd87416af9987ea.dip.versatel-1u1.de. [2001:16b8:261b:f100:4cd8:7416:af99:87ea])
        by smtp.gmail.com with ESMTPSA id bt9-20020a056000080900b00228e071baadsm1586493wrb.36.2022.09.09.01.55.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 01:55:20 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-ide@vger.kernel.org
Subject: [PATCH] ppc: select HAVE_PATA_PLATFORM in PPC instead of creating a PPC dependency
Date: Fri,  9 Sep 2022 10:55:05 +0200
Message-Id: <20220909085505.15536-1-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Lukas Bulwahn <lukas.bulwahn@gmail.com>, kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit cc18e0fea790 ("LIBATA: Add HAVE_PATA_PLATFORM to select
PATA_PLATFORM driver") introduces config HAVE_PATA_PLATFORM, and expects
that all architectures simply select this config when the architecture
supports using the PATA_PLATFORM driver.

This is properly implemented already for all architectures except for the
powerpc architecture. Implement this for powerpc now.

Adjust the config of the powerpc architecture to use the config
HAVE_PATA_PLATFORM and simplify the config PATA_PLATFORM to not mention
any specific architecture anymore.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
 arch/powerpc/Kconfig | 1 +
 drivers/ata/Kconfig  | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 39d71d7701bd..2575e21b6e6b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -237,6 +237,7 @@ config PPC
 	select HAVE_MOD_ARCH_SPECIFIC
 	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
 	select HAVE_OPTPROBES
+	select HAVE_PATA_PLATFORM
 	select HAVE_PERF_EVENTS
 	select HAVE_PERF_EVENTS_NMI		if PPC64
 	select HAVE_PERF_REGS
diff --git a/drivers/ata/Kconfig b/drivers/ata/Kconfig
index 1c9f4fb2595d..ed3547165528 100644
--- a/drivers/ata/Kconfig
+++ b/drivers/ata/Kconfig
@@ -1103,7 +1103,7 @@ config PATA_PCMCIA
 
 config PATA_PLATFORM
 	tristate "Generic platform device PATA support"
-	depends on EXPERT || PPC || HAVE_PATA_PLATFORM
+	depends on EXPERT || HAVE_PATA_PLATFORM
 	help
 	  This option enables support for generic directly connected ATA
 	  devices commonly found on embedded systems.
-- 
2.17.1


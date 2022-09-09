Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CCE25B32BA
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 11:05:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP9742f2Nz3cLb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 19:05:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V0cXt/H+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V0cXt/H+;
	dkim-atps=neutral
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP95x05mxz3bkk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 19:04:04 +1000 (AEST)
Received: by mail-ej1-x630.google.com with SMTP id gh9so2475290ejc.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 02:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=fPvofaEf+BM4TxtIyhxZC/zjNI9R8E3LUT46F136ga4=;
        b=V0cXt/H+gZ651uUZmm5iiWwtYqb2u1S6mX/kvwk2irwNgDBDieodH7EdvM2CzPu0TE
         LmPXhFryzDJGiH+0Bq4X4GECAdbCMZFIFhftJft1jpHfDLa1Tcot9wOzdWSD6xiAc5qC
         oeadlFmbDJTQKdApcRJjHcal4kelyTvUFTcdMgnTMQEJXNvJA1+R/F0uTvlcOekx6Y4f
         IomTf06Wtuc+4kGwqGNhA7ThCsd2kMqgMIPoXY7GCHK2VIewPWTPI0m0EtpZxi6l8h+L
         Spu5fr95w8VMv2TwJ8MciXtWHCyKFbeDWr5A8in6zZ6jJc3j36zswvB3e9W/poLTEdYM
         gJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=fPvofaEf+BM4TxtIyhxZC/zjNI9R8E3LUT46F136ga4=;
        b=j8H3PD0O9am0CYTvsSCxzUnCfeNLbFqk1K8mgDyKg91YtZ1VCFriZkXj7rp3iP1/WV
         rQYGpfaAqchYF7T2pQ893hjiK69TmCOgPTjm18VKpUgOVd+fP+87IUwM0fDQSJDxD+U3
         fqFJiK+VT49IGT3mABnlBtgiQYH1z1whKEPEGY7NAJ0nwzAsN9Ow4hVLR8QVtpk93R8e
         OemS6K8GCV9GyuhTcWLrupb/GDNZCrb/RrSv0nOSVnDpq28WD0M7qLozLt8el3MYaSCP
         tzQY/qbfxCcKbFVq035iLMIlYsY0vzKrbO92Z+45VmINXX8J23834cG4KlNvIPfQrxmY
         WQog==
X-Gm-Message-State: ACgBeo1K9pDnNrs+ugHvQy01VXeIhI2da/r3z6FKh+mt+eK1ccETbHyK
	TRE3XW/FlBG6I32cqBGJlss=
X-Google-Smtp-Source: AA6agR5KinRgSTiwz5kN6HDarpCdBIq4fZNySV5zqrv/4j6rw46dTQNHhN6XvlLxLoIrOIguD9C/Tg==
X-Received: by 2002:a17:907:8686:b0:773:6f77:f110 with SMTP id qa6-20020a170907868600b007736f77f110mr5960404ejc.547.1662714240883;
        Fri, 09 Sep 2022 02:04:00 -0700 (PDT)
Received: from felia.fritz.box (200116b8261bf1004cd87416af9987ea.dip.versatel-1u1.de. [2001:16b8:261b:f100:4cd8:7416:af99:87ea])
        by smtp.gmail.com with ESMTPSA id nb3-20020a1709071c8300b007303fe58eb2sm659797ejc.154.2022.09.09.02.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:04:00 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-ide@vger.kernel.org
Subject: [PATCH] ppc: select HAVE_PATA_PLATFORM in PPC instead of creating a PPC dependency
Date: Fri,  9 Sep 2022 11:03:43 +0200
Message-Id: <20220909090343.21886-2-lukas.bulwahn@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220909090343.21886-1-lukas.bulwahn@gmail.com>
References: <20220909090343.21886-1-lukas.bulwahn@gmail.com>
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


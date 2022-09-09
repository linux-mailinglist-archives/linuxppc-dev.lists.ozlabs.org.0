Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D65B32B8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 11:04:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MP96Q3vCjz3c34
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Sep 2022 19:04:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gCi4wThs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gCi4wThs;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MP95n32STz30FQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Sep 2022 19:03:55 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id z97so1502094ede.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Sep 2022 02:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=fPvofaEf+BM4TxtIyhxZC/zjNI9R8E3LUT46F136ga4=;
        b=gCi4wThsDw2SiO9HtZ66oTW9uZhXcdn97NW5t0PaoJA3ywVSt/1jNG/dK9WECFY7nV
         ZVkcs573BdAeVmp88LpIA6tUQOI4Rny21x1CQ/ZHE7IzIE5psixmp1I6xEWoRO4+r6qm
         ZnYxwYCtxzVOc5q90LlglqbO5gBz+48WtGuuzN3A7GlrPjoE5vDQMV5D4/jeI/qKBpjF
         hN6TmkwcRGMWAr3Abn1th5TSWCJ6FRMvrhyd+Upeg8KZch5AgcWGc1D+ejqdpDrSWp9e
         0hMu0RMPbFQ3p/YcLfOrd+yOxifHraoD7p7WjuYQAw5epldUhjlFaE+sdZ8GZuld62jv
         LpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=fPvofaEf+BM4TxtIyhxZC/zjNI9R8E3LUT46F136ga4=;
        b=7Nd03UdBt+09LnKZ0vaoglvql9kuJtJ54tk5iP3PfN6OZfaJ0zgsDBP2qq2pfeDJmS
         BSkNQ/+nj437CixaWyB5g7VgijAO6A+TyTdh4E/oy4PC4RxjO3HZxnhHMqavqbflx2TR
         paN/CPkWoHPZkf4YJDj7gaWD25qDIhJmfnoWHE3e+0Q9YZnUYIyBEIrLhHouKq3LUZC1
         rXAzELnkuLMiR0ZbfHh84jq5tJxla+zr6MmulwNd3TlvYP3ioSU5r09F5k9lhuccFJjQ
         nH6k0E4h0uLxins8liKHARG7ueCeTqRiO4WvfTVvc4V4gvt9+ugov/9/qfbLw2ay4rrM
         YLrg==
X-Gm-Message-State: ACgBeo0T3RdiiVuSIFl8DtK+7GB5Fz6vr6OHxXsB7G/+TXXV/2KD7BGE
	nasfkh814hbPd0QgiGgai6o=
X-Google-Smtp-Source: AA6agR68k43p1C9q+JY9fKXpGyzpa5QMGfmsPE3cdpyJf67DgjNwPcmF5UhGm3vXivDmWFaeVEOIJw==
X-Received: by 2002:a05:6402:450c:b0:443:6279:774f with SMTP id ez12-20020a056402450c00b004436279774fmr10702921edb.11.1662714231621;
        Fri, 09 Sep 2022 02:03:51 -0700 (PDT)
Received: from felia.fritz.box (200116b8261bf1004cd87416af9987ea.dip.versatel-1u1.de. [2001:16b8:261b:f100:4cd8:7416:af99:87ea])
        by smtp.gmail.com with ESMTPSA id nb3-20020a1709071c8300b007303fe58eb2sm659797ejc.154.2022.09.09.02.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 02:03:50 -0700 (PDT)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-ide@vger.kernel.org
Subject: [PATCH v2] powerpc: select HAVE_PATA_PLATFORM in PPC instead of creating a PPC dependency
Date: Fri,  9 Sep 2022 11:03:42 +0200
Message-Id: <20220909090343.21886-1-lukas.bulwahn@gmail.com>
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


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34F762769E1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 08:59:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxmBf4QfbzDqyd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 16:59:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vfKyiH3A; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxlkX3MYCzDqbF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:39:00 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id t7so1140737pjd.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aL7nf5HtJg3suEXS4YOkIp0Q0gZ4/3ZocZ8b4EhkTCU=;
 b=vfKyiH3Ak6b5t1HAsVgtZ0shGN1rEp2Sq6grFkfhHwfjRCKdVqeNvOfiNqWsJIyD8p
 RwRt39MhaMU5QM5pK1a37tWt1avCw5YqlvVEC36X4pZYG+ZcVVWbfDCOAYL5+RH2NtAv
 sHc0F2GTWN1FiSWPvmN45gmXR46YTc00znAQI6fThBZLo7xAppDtymZl563TDyTe0seP
 Msyno451nSaXxA5GbCHqSRgD6gL4WT61EcAYQ4JL0eFgWe/IZD6+TE7ifjJXzigT0aPd
 drOLiSNT9F4MSmsX7D3RM1xIMpcY5cpgcc8fmd46X2//WRKTVKVCJjqGdbemdzDGUYIh
 SV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aL7nf5HtJg3suEXS4YOkIp0Q0gZ4/3ZocZ8b4EhkTCU=;
 b=QFIen0uuhhAMHsS+jNCeld/5Rx1MVMNBD2nzqBukaiVYGlFCghB1f4bj/RyiruObEa
 4dzuCVkNbBIHbQoYIfVFzfoh5LFgcj7yy7rSH45oOBTaqcraU7j0cmdUKEDcFcYXd7f+
 sQL0ufHEDaP0TmekdKpTfp0ZszuC12YL+qLbE8MhGGwESHjn6LW9yvz5B/DsLHZcqC8z
 FoY1Fu8eGE1xKZBtb7TbwlQkHMCMeLu87CtdaEBDdwXo807hk2V+PWS8G90ThMZC+Cqc
 Cbe30NmgV92hfMSaZWeqkzyK+524eiAYTNLmqWcGvIHInfrb8lJayelrvjXatAt8ZNEW
 fbLA==
X-Gm-Message-State: AOAM531EyUlzefm02r8J4FD/1emscjGdZJuW6PQ2zr/IFEcv04OyWwn9
 zD9TZCVjH5cvg3pqBd5C4dDQ9mDTI8Ju1A==
X-Google-Smtp-Source: ABdhPJwiP5AE5uHwNk7+4lLoknKONX1YcfBt8dh8lVXvRso/Mvi2o8RyypTVat/mXUuX1LAVA5LaaA==
X-Received: by 2002:a17:902:8545:b029:d1:f2e3:8dd4 with SMTP id
 d5-20020a1709028545b02900d1f2e38dd4mr3246954plo.65.1600929536530; 
 Wed, 23 Sep 2020 23:38:56 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:38:56 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 11/18] powerpc/amigaone: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:12 +1000
Message-Id: <20200924063819.262830-11-oohall@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924063819.262830-1-oohall@gmail.com>
References: <20200924063819.262830-1-oohall@gmail.com>
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
Cc: Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
---
compile tested with amigaone_defconfig
---
 arch/powerpc/platforms/amigaone/setup.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/amigaone/setup.c b/arch/powerpc/platforms/amigaone/setup.c
index f5d0bf999759..b25ddf39dd43 100644
--- a/arch/powerpc/platforms/amigaone/setup.c
+++ b/arch/powerpc/platforms/amigaone/setup.c
@@ -65,6 +65,12 @@ static int __init amigaone_add_bridge(struct device_node *dev)
 }
 
 void __init amigaone_setup_arch(void)
+{
+	if (ppc_md.progress)
+		ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0);
+}
+
+void __init amigaone_discover_phbs(void)
 {
 	struct device_node *np;
 	int phb = -ENODEV;
@@ -74,9 +80,6 @@ void __init amigaone_setup_arch(void)
 		phb = amigaone_add_bridge(np);
 
 	BUG_ON(phb != 0);
-
-	if (ppc_md.progress)
-		ppc_md.progress("Linux/PPC "UTS_RELEASE"\n", 0);
 }
 
 void __init amigaone_init_IRQ(void)
@@ -159,6 +162,7 @@ define_machine(amigaone) {
 	.name			= "AmigaOne",
 	.probe			= amigaone_probe,
 	.setup_arch		= amigaone_setup_arch,
+	.discover_phbs		= amigaone_discover_phbs,
 	.show_cpuinfo		= amigaone_show_cpuinfo,
 	.init_IRQ		= amigaone_init_IRQ,
 	.restart		= amigaone_restart,
-- 
2.26.2


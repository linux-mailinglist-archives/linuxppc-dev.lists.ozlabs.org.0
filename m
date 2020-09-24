Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B43C4276931
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 08:47:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BxlvR3pcCzDr9w
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Sep 2020 16:46:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ahGocHWp; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BxlkD718fzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Sep 2020 16:38:44 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id x22so1260081pfo.12
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 23:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S7XdpBSyN2hayLd4zRl+DTnOe6f75FZb4gpZXT38Um4=;
 b=ahGocHWpbo3ooji1eliJF69/u+hAq4KvU1X9N0wrUPP+MVYUbyXS/he+wzBJQWDbHR
 sOwrp8Odlqax7HFVncqL1Y5/pMqQmT71t9QDecNIGvesgrgLHIbXHeqdKvEG8S8Kmqhn
 gi+SnnfMmEwBvE+/ls3HOmD5JDGt+UCeZnQvRgdTc+pqyw0qU2wDQpOU8iFmBlqABCId
 OLC/ubWxX3eym5OP35m0OA5RvZQAl85ALjzlFmcwHIwvgbXUuIBkp9KjjEEnfsYDFoGT
 jesKchG1T98+cRnHyQFU225nYZbODGQ7XXByt9mhR/mJBMSSYj5iEm37+yvDEm+RJSP0
 c99w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S7XdpBSyN2hayLd4zRl+DTnOe6f75FZb4gpZXT38Um4=;
 b=hPGbfqt9MLGfZtVf9ZcyKtPA4h4dgQbdsjYGcQjFekSjIXzQNgMnyPpFr0VGFmxYDU
 Rp6IKE9IrfRWB2Qt6qqm1/VyyUQ/igyPS08gxytmNrslMJB67Wel5PqHnlu88I/R/REZ
 j9jF6fNQykMMWYEHb9L+jziDDtccxvW9h+cJ20NjsCTvIf5y/dcuMyLFQ0iVrTK+DUh7
 mUrQZIKjSrgj6oMULmw/r93BBD2tJX7Pz44vPF3bSHFW0gDVqCnmvUqFqYPzsLmzUgKr
 Ln/0QLG/sGH3627SJvX+a47b2khedXkItOUbpUD2lQNiSTDzNcHVUxgcFe9jctuMAddB
 pKwA==
X-Gm-Message-State: AOAM533jeUJSsGIxdZ/AWYVaTMa+JRLAKrYw682vS6Vss/bcwlKQ0l4B
 VJLRw8skQeiuoFXOEtz4MC+YeZCfnPTFFQ==
X-Google-Smtp-Source: ABdhPJynPJ9UqKR/dDGVEAOmH32WdObyC6583+hgQqfDXrBHk+X6j7naG400LsKGh+5FBzImWr7tEg==
X-Received: by 2002:a63:d841:: with SMTP id k1mr2810384pgj.59.1600929523082;
 Wed, 23 Sep 2020 23:38:43 -0700 (PDT)
Received: from localhost.ibm.com (194-193-34-182.tpgi.com.au. [194.193.34.182])
 by smtp.gmail.com with ESMTPSA id y1sm1662930pgr.3.2020.09.23.23.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 23:38:42 -0700 (PDT)
From: Oliver O'Halloran <oohall@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 05/18] powerpc/52xx/efika: Move PHB discovery
Date: Thu, 24 Sep 2020 16:38:06 +1000
Message-Id: <20200924063819.262830-5-oohall@gmail.com>
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
compile tested with mpc5200_defconfig
---
 arch/powerpc/platforms/52xx/efika.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms/52xx/efika.c
index 4514a6f7458a..3b7d70d71692 100644
--- a/arch/powerpc/platforms/52xx/efika.c
+++ b/arch/powerpc/platforms/52xx/efika.c
@@ -185,8 +185,6 @@ static void __init efika_setup_arch(void)
 	/* Map important registers from the internal memory map */
 	mpc52xx_map_common_devices();
 
-	efika_pcisetup();
-
 #ifdef CONFIG_PM
 	mpc52xx_suspend.board_suspend_prepare = efika_suspend_prepare;
 	mpc52xx_pm_init();
@@ -218,6 +216,7 @@ define_machine(efika)
 	.name			= EFIKA_PLATFORM_NAME,
 	.probe			= efika_probe,
 	.setup_arch		= efika_setup_arch,
+	.discover_phbs		= efika_pcisetup,
 	.init			= mpc52xx_declare_of_platform_devices,
 	.show_cpuinfo		= efika_show_cpuinfo,
 	.init_IRQ		= mpc52xx_init_irq,
-- 
2.26.2


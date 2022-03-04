Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18CF04CCB3D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 02:19:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8qkv0FkFz3bVC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 12:19:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gO3mu0vl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72a;
 helo=mail-qk1-x72a.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gO3mu0vl; dkim-atps=neutral
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com
 [IPv6:2607:f8b0:4864:20::72a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8qkB2P7Xz2xrj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 12:18:40 +1100 (AEDT)
Received: by mail-qk1-x72a.google.com with SMTP id q4so5354882qki.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Mar 2022 17:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCz7tdNd810BtQuwOagID7j3a4qH5A8d3WC+MOMxf8g=;
 b=gO3mu0vlUG+/q+BXTrTUVnHMOW6PyrlSP74c5KApxr6ll1BUMPiqlO9LfHcYmA+tzd
 2O+7FsDo3rvY2O8D2Aof1eB+kNFp6FEhIjH6HIcXnTnSVJxP5rbMLPV9nWOLRUL3a7CM
 T9nU62Yr/ATK3qOIHbzKj86tcyv0JqVvNY9XV1zDajXZK4xMYN8ErIfBw4LtzuXiOfN+
 oU0W2c97oL58f1098xgu0oZy5PHKDt/RAOGv5BSSmE5fkdgRqa98FSLjrkcmjG4Z+3cI
 jSWpFHPJ4S6DYiPm5diNr/S1itpxth8c4e+W6+j/lHaUBe5/pmAvROW0VC3c9cnDMAaX
 xJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kCz7tdNd810BtQuwOagID7j3a4qH5A8d3WC+MOMxf8g=;
 b=cGI6vZliLPmKYkEDS+Mcim7hqYWj2RQ1fMO6+jUnt9HPdpol2WzH7BDLC46TFqSMwp
 XWiOk3/bNHGBQ3AubE1xV2Zx8fQ2sDTxmww2wzMYs56j9wZExGP6U1WPERz3mW3l0Wm6
 KyyVCwCLfNURTThQItCS+KvT9WAXVpd6PP8tskO8fYTxEgeu3u2azdewiV6jaKuQBCIR
 YoyNSstaeSgmElpXEJg3W5tK8OtZ4HXWkqox7TqMGR0b9ntNUq3dlQRVEB44icicoD1e
 738VJBcA2QQaja+roLmwkBlBOe4/CrefZ16Gl7gEAAYCdVAE86p10TOnpPFDPQ4oO3XJ
 NRLg==
X-Gm-Message-State: AOAM530YHaiP26KxXGdBoWuQ5dHm64Q3HxGo2Gu87jPqkNIANobd1MsH
 vTwlyjnIPcwkq26a/rkdr7k=
X-Google-Smtp-Source: ABdhPJz+QHLirnaj+pJTbyAjKqkGMRdpdFUjenGyXIeea9bupu2mAYV8nK5O8UaFoKrNGssmafrWZg==
X-Received: by 2002:a05:620a:103b:b0:649:8109:cc11 with SMTP id
 a27-20020a05620a103b00b006498109cc11mr1192626qkk.567.1646356717419; 
 Thu, 03 Mar 2022 17:18:37 -0800 (PST)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 h17-20020ac85e11000000b002ddd5fab777sm2662093qtx.41.2022.03.03.17.18.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 17:18:37 -0800 (PST)
From: cgel.zte@gmail.com
X-Google-Original-From: chi.minghao@zte.com.cn
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/sysdev: Use of_device_get_match_data()
Date: Fri,  4 Mar 2022 01:18:30 +0000
Message-Id: <20220304011830.2061591-1-chi.minghao@zte.com.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: Zeal Robot <zealci@zte.com.cn>, linux-kernel@vger.kernel.org,
 Minghao Chi <chi.minghao@zte.com.cn>, jgg@ziepe.ca, paulus@samba.org,
 maz@kernel.org, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>

Use of_device_get_match_data() to simplify the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Minghao Chi (CGEL ZTE) <chi.minghao@zte.com.cn>
---
 arch/powerpc/sysdev/fsl_msi.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/powerpc/sysdev/fsl_msi.c b/arch/powerpc/sysdev/fsl_msi.c
index b3475ae9f236..9d135bbb30b7 100644
--- a/arch/powerpc/sysdev/fsl_msi.c
+++ b/arch/powerpc/sysdev/fsl_msi.c
@@ -387,7 +387,6 @@ static int fsl_msi_setup_hwirq(struct fsl_msi *msi, struct platform_device *dev,
 static const struct of_device_id fsl_of_msi_ids[];
 static int fsl_of_msi_probe(struct platform_device *dev)
 {
-	const struct of_device_id *match;
 	struct fsl_msi *msi;
 	struct resource res, msiir;
 	int err, i, j, irq_index, count;
@@ -397,10 +396,7 @@ static int fsl_of_msi_probe(struct platform_device *dev)
 	u32 offset;
 	struct pci_controller *phb;
 
-	match = of_match_device(fsl_of_msi_ids, &dev->dev);
-	if (!match)
-		return -EINVAL;
-	features = match->data;
+	features = of_device_get_match_data(&dev->dev);
 
 	printk(KERN_DEBUG "Setting up Freescale MSI support\n");
 
-- 
2.25.1


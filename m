Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7F53EE5F9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 06:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gpdyy2rsvz3d9g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 14:56:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=NnPrS6MF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=joel.stan@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=NnPrS6MF; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gpdwx4HXZz307C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Aug 2021 14:54:25 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id j1so30094110pjv.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Aug 2021 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IGcR+TFHl5e0lIW8S0mhPo5F0Ld47yAAvQxdi/AHIBQ=;
 b=NnPrS6MFKReFz9Md5s0G3dh5fBO6YIZ2xh8efJwUw3DAtaa7EFq4ENJNNoWl2bCyH3
 IpuvIAmbkxrhZp3ntjBPu1VRyIEqTKDl50jI8KhDgwG3donJ8QbGSzhK2orCVx5jAZu0
 AcT4xj1cabPuKIgHJGCa1QS68h38yewnlGCpQJXdEDCZ0oPaqyiil92bqOnyyoKTIFpF
 O52wllLHNrzNFFg163n9X5mpSHI6GIgCU1SbQhaO19WKV98H/VAyxk+PgHX92IQ0StJG
 Kk9y9TcU5yS7dS9qBNWnzz8UbjNlV3CswBMwVG8TT0H8G6kWOUDiWbYD1+LL6RbPVJDR
 Q5Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=IGcR+TFHl5e0lIW8S0mhPo5F0Ld47yAAvQxdi/AHIBQ=;
 b=qY1qf8qj4uBY1jgwNYksyhcWJGrlEtF4v1pt9bkBHO2hazFXXtXZ58DXqsRlEXUzRa
 GBVBHZPj/vxDujFVtRy05DltCVKcjYZ6YQ/fxPA1UnjseENL1ZUiFon/WYOcr8YIJRcf
 oH9I1wd2Vatr6zqXdnyfWvDdMaWLT7BxwJsdg48H7/rsRZv4Ht2eryQEaULSxGEa6TwO
 S3pgcGacsw1M0UbPF9dyXCNokTSr7OuXD2e0XKuUDLaz4IUCRRX+GJx9a885jZDzdyMw
 SJnV5M1SJ+ybfw6LFyiSdVKBjVVxx/c04BNrZE6u5PuaEhGe31okO8U1PZa2LSuHvjzu
 HMIA==
X-Gm-Message-State: AOAM5315/7cIWtOMFXJMuNNpsr3QQme7RXQIaFa0d2hgK8VX5sFGZKNj
 L9YT5CwV6UR9lxL+Ftae0Ok=
X-Google-Smtp-Source: ABdhPJzRVfMDdQhUDTq4LB1Z9GUJS+/UamYVP6spjaiA4Vpx4Eiy6JFw5bI1Srh/Wl3dbA93uI/xng==
X-Received: by 2002:a05:6a00:1a49:b029:3e0:3b2c:c9c7 with SMTP id
 h9-20020a056a001a49b02903e03b2cc9c7mr1796372pfv.8.1629176063334; 
 Mon, 16 Aug 2021 21:54:23 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.15])
 by smtp.gmail.com with ESMTPSA id k6sm1029073pgk.1.2021.08.16.21.54.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Aug 2021 21:54:22 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/3] powerpc/config: Renable MTD_PHYSMAP_OF
Date: Tue, 17 Aug 2021 14:24:06 +0930
Message-Id: <20210817045407.2445664-3-joel@jms.id.au>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210817045407.2445664-1-joel@jms.id.au>
References: <20210817045407.2445664-1-joel@jms.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CONFIG_MTD_PHYSMAP_OF is not longer enabled as it depends on
MTD_PHYSMAP which is not enabled.

This is a regression from commit 642b1e8dbed7 ("mtd: maps: Merge
physmap_of.c into physmap-core.c"), which added the extra dependency.
Add CONFIG_MTD_PHYSMAP=y so this stays in the config, as Christophe said
it is useful for build coverage.

Fixes: 642b1e8dbed7 ("mtd: maps: Merge physmap_of.c into physmap-core.c")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 arch/powerpc/configs/mpc885_ads_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
index 5cd17adf903f..cd08f9ed2c8d 100644
--- a/arch/powerpc/configs/mpc885_ads_defconfig
+++ b/arch/powerpc/configs/mpc885_ads_defconfig
@@ -33,6 +33,7 @@ CONFIG_MTD_CFI_GEOMETRY=y
 # CONFIG_MTD_CFI_I2 is not set
 CONFIG_MTD_CFI_I4=y
 CONFIG_MTD_CFI_AMDSTD=y
+CONFIG_MTD_PHYSMAP=y
 CONFIG_MTD_PHYSMAP_OF=y
 # CONFIG_BLK_DEV is not set
 CONFIG_NETDEVICES=y
-- 
2.32.0


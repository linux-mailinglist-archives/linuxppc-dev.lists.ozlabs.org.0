Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E183057B7C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 07:32:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Z7nF3J2czDqbp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2019 15:32:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::642; helo=mail-pl1-x642.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="T14UK9PX"; 
 dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Z7lK4PH5zDqTD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 15:30:19 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id ay6so613109plb.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 22:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmyZJsNLEGx6mhWKADrDyzQoK+Zu2kMRRgot89wk8U8=;
 b=T14UK9PXgvZtBH8zKG9S++9WkT8uveY31ILHiH4PXhitdmrJeGz4ElLXFZ/XBxBunf
 q30W2nVaqoI59kJinRXabZvA33NLirdJlwkjM5kfFB78yr9DdpBRXnqf3kMVz3cu0PgM
 +jjvJq7aKPT7YoRnTjZS6zXmIF08g5X9CVxzk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YmyZJsNLEGx6mhWKADrDyzQoK+Zu2kMRRgot89wk8U8=;
 b=PK2IUQ5X6nuKy5w7zo7WNtegErqP0nD8Yx7pJ4lN3rZ01MuhdQgkjaelQDbNFkF/vM
 +DMhP9di5YG23OxdpcYM8C8p2xCRSisFSv4Jbl8qHVMWXHh8PCliannEenMXQawHfvPj
 W7GALXD7KHTVqkshZioRkjiqz6/Sc7XJjvFQ5pG92p/56mHfa/GU41WQXZthWDCDvgFl
 WdPEkXxR9gIUlOHQ/OGq3s8tXH3p4OB2usV9zvBpndmSXN23pYaFhu25Z9cCB8fpgcqr
 zFMd9ffN41oJB0jGXK6frAh8kkBmVbdauibk73541dgJeFQra/FN5JfiowqYRCfaTygU
 mtFQ==
X-Gm-Message-State: APjAAAUbvAd9JzfysbRKfa6a+fIjyGwxC8nZKIQXA2DjYxsKWFDnpa7u
 mwS/Wg0L8uZDFQ0NRxTk9ymovAiCMLE=
X-Google-Smtp-Source: APXvYqy9pnBFv+Vry1c39N125E39HKUYAZGc6B1s75zZ022rvmop5xNZpz7RRY5pMkocjkT7Nv1nCA==
X-Received: by 2002:a17:902:7c90:: with SMTP id
 y16mr2450245pll.238.1561613415858; 
 Wed, 26 Jun 2019 22:30:15 -0700 (PDT)
Received: from localhost (ppp167-251-205.static.internode.on.net.
 [59.167.251.205])
 by smtp.gmail.com with ESMTPSA id v5sm1513390pgq.66.2019.06.26.22.30.14
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 26 Jun 2019 22:30:15 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/configs: Disable /dev/port in skiroot defconfig
Date: Thu, 27 Jun 2019 15:30:08 +1000
Message-Id: <20190627053008.29315-1-dja@axtens.net>
X-Mailer: git-send-email 2.20.1
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
Cc: Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

While reviewing lockdown patches, I discovered that we still enable
/dev/port (CONFIG_DEVPORT) in skiroot.

We don't need it. Deselect CONFIG_DEVPORT for skiroot.

Signed-off-by: Daniel Axtens <dja@axtens.net>
---
 arch/powerpc/configs/skiroot_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/skiroot_defconfig b/arch/powerpc/configs/skiroot_defconfig
index 5ba131c30f6b..b2e8f37156eb 100644
--- a/arch/powerpc/configs/skiroot_defconfig
+++ b/arch/powerpc/configs/skiroot_defconfig
@@ -212,6 +212,7 @@ CONFIG_IPMI_WATCHDOG=y
 CONFIG_HW_RANDOM=y
 CONFIG_TCG_TPM=y
 CONFIG_TCG_TIS_I2C_NUVOTON=y
+# CONFIG_DEVPORT is not set
 CONFIG_I2C=y
 # CONFIG_I2C_COMPAT is not set
 CONFIG_I2C_CHARDEV=y
-- 
2.20.1


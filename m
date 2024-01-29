Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 32B9C840689
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 14:18:25 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FhFi3xE+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNplM0pCqz3c9y
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 00:18:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=FhFi3xE+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::531; helo=mail-ed1-x531.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com [IPv6:2a00:1450:4864:20::531])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNpkX6lcXz2yk5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 00:17:39 +1100 (AEDT)
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-55f279dca99so396663a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 05:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706534252; x=1707139052; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMwNqcZZgOVXT/J1FjC+xI4RABs1qjk7vHn8GPhDdCA=;
        b=FhFi3xE+f7ZNX8PznPVwB4+BsA5MyEotGpjlfd5W+r/P0TRSZyshEPH0Id2lv+r1bp
         BbwuBmr1mFHNl2nxmuDBDxS1RFeFtfA83qoASvdxIF7+lH/6Hnm5gEJspDTZsBxFxePQ
         BGis47xedpcThozO2OMxnVCZaE536cc+PByAs+B5vlwDKgHDdazCmEXDTMf+W2R2nusl
         TEImnGo/60eZcEjE2Takc6cJOvQSXUN+TfaX7+/gBkYvhDOmDMDLaZr98lNOSXSlSk9A
         dknN6/CBEwoGpa7+folGadQ1Tagv9ws2fNkLAuiGksOwu4y6fXwJHhzMp4DA7sqmWcVw
         CcBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706534252; x=1707139052;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMwNqcZZgOVXT/J1FjC+xI4RABs1qjk7vHn8GPhDdCA=;
        b=X/TOjuGxMylBYvk9t5wGFHRP4wplrzJuu7ILQh1H92YD0DKUIXl9QiPyybpdh/a/O+
         1hsYFmNHWF2YrfqsEW1ztQ4OyE2Kh+SNaaDi3dGpomsloH9dxnx3YXjD2BqNQ7rcw2Vh
         CLvk1WbYVVOTxtBcStXOBPo334DU6bCWhsFo8dr4/0Hf2kFIDGflLSx5mzNuCkTXYvjt
         AgTFhg582Sr10TFcV0BT7Q0gICTvakDUWLBZCw/wSp8SU+Mi8sNERmUFEb8qLZ31Ye9a
         QHympFTLkhy2/M+7iok/WygziTQApkt7+rcssEtnnlmfDZWnsPs/JY3t5yUHIaSj15q3
         cs9w==
X-Gm-Message-State: AOJu0YzbUBVXfV6HWyZZsLbCWcqJnilaVPxRfmZf1JbHLTRZfZSYZNAv
	ffYkV/2WhHR51GJeVJJlKIc3clsb0DNYdOxuAG2Xn2IDQNcWQPjg
X-Google-Smtp-Source: AGHT+IF56lsLVSwWT0MpkDQTXGgYqHeVKKkqZNQrGyXnP0BOY5XivLNVLZnraDMCsPBFwK/blGmZfg==
X-Received: by 2002:a17:906:2e94:b0:a35:fdf9:e6fc with SMTP id o20-20020a1709062e9400b00a35fdf9e6fcmr55005eji.18.1706534252237;
        Mon, 29 Jan 2024 05:17:32 -0800 (PST)
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:fddc:9ce:9e0f:3ad3])
        by smtp.gmail.com with ESMTPSA id q15-20020a17090622cf00b00a359afad88dsm1590449eja.10.2024.01.29.05.17.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 05:17:31 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Danny Tsen <dtsen@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] MAINTAINERS: adjust file entries after crypto vmx file movement
Date: Mon, 29 Jan 2024 14:17:29 +0100
Message-Id: <20240129131729.4311-1-lukas.bulwahn@gmail.com>
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

Commit 109303336a0c ("crypto: vmx - Move to arch/powerpc/crypto") moves the
crypto vmx files to arch/powerpc, but misses to adjust the file entries for
IBM Power VMX Cryptographic instructions and LINUX FOR POWERPC.

Hence, ./scripts/get_maintainer.pl --self-test=patterns complains about
broken references.

Adjust these file entries accordingly.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
Danny, please ack.
Herbert, please pick this minor clean-up patch on your -next tree.

 MAINTAINERS | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 2fb944964be5..15bc79e80e28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10307,12 +10307,12 @@ M:	Nayna Jain <nayna@linux.ibm.com>
 M:	Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
 L:	linux-crypto@vger.kernel.org
 S:	Supported
-F:	drivers/crypto/vmx/Kconfig
-F:	drivers/crypto/vmx/Makefile
-F:	drivers/crypto/vmx/aes*
-F:	drivers/crypto/vmx/ghash*
-F:	drivers/crypto/vmx/ppc-xlate.pl
-F:	drivers/crypto/vmx/vmx.c
+F:	arch/powerpc/crypto/Kconfig
+F:	arch/powerpc/crypto/Makefile
+F:	arch/powerpc/crypto/aes*
+F:	arch/powerpc/crypto/ghash*
+F:	arch/powerpc/crypto/ppc-xlate.pl
+F:	arch/powerpc/crypto/vmx.c
 
 IBM ServeRAID RAID DRIVER
 S:	Orphan
@@ -12397,7 +12397,6 @@ F:	drivers/*/*/*pasemi*
 F:	drivers/*/*pasemi*
 F:	drivers/char/tpm/tpm_ibmvtpm*
 F:	drivers/crypto/nx/
-F:	drivers/crypto/vmx/
 F:	drivers/i2c/busses/i2c-opal.c
 F:	drivers/net/ethernet/ibm/ibmveth.*
 F:	drivers/net/ethernet/ibm/ibmvnic.*
-- 
2.17.1


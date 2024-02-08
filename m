Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EACF384DD08
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 10:34:16 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NFoSYfbz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TVsJ64sM1z3cWH
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Feb 2024 20:34:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NFoSYfbz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535; helo=mail-ed1-x535.google.com; envelope-from=lukas.bulwahn@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TVsHN3G9Nz3bn0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Feb 2024 20:33:35 +1100 (AEDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-55ff5f6a610so1655912a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 01:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707384811; x=1707989611; darn=lists.ozlabs.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ClZxZfA/V4+BWFkj7VuhiD7elrfOXLoTCprCHq1vgfU=;
        b=NFoSYfbzFHRn+5eg2qaBop5xz1rT8M7S83dtT7ira51z3048uS2JkSTLBTt/8fWEM9
         tz1eLcE1r0iIcgP/Y2P9xk61r93bgXJVAWoyAo9ORVEnlI0SZTAutiqHNtuhFHJjbKvQ
         jYVlMcTIQH9EBzEPa7vf6KZTfLGy6iq6BtoTBExhXCURhRCCFWd9GdjcWMICwzDUKZQG
         Hzp/C8h7cJVZm8pi+0l/h+G8TH4Eo1hX3VZbgxVvrQlXQ1uo0sFhK2pA+L2cRUPE/zAb
         dSwyVTyBFCrxHQpLTAKeky2Aev2mz91DQCkLtExmn1NDEYY6WhkR71ojBdY2+S5hm3ke
         b7qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707384811; x=1707989611;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ClZxZfA/V4+BWFkj7VuhiD7elrfOXLoTCprCHq1vgfU=;
        b=tlILoOVEGDP91l2sx8osSPOKTyPzULEOiRauvhtlDEd+ffPr/rfR+nrsm1grrIDwzK
         WZ1hCW+PxAUzrAOdtPbeP0g+MM6Ak8Gcui8K18runJ7Iko0XF73wSy3Gw37Z9XKWGPz9
         AeQiUbq0MkM0LQ/ZFjiqRvsnUGs606lo7Bm4FlhqfoHocvaLldUQwpdFIwJqPT1VuREb
         sP98tgvgcEBl5tYIH+raZD1B/6pahbSdk0uZ0yqKp4TBsYjyKTmF+7TKegMB4LtLPk2b
         Qx0NkBOfIegGrczvRw28eqbfgvJuxowZvxG+uEsKeQtyLHPy8Equc/d7fhN9qxNqDfxk
         DEfg==
X-Gm-Message-State: AOJu0YwIC6ztbhyzrOG5k8F3HkTrgsvlDrKZVpqmcmzeJNX/xUE3NzSr
	DMK8zR5AY8cR/cBuDcEfOBVlNQk8WBF9EB7MW3KHhUij1lprP1in
X-Google-Smtp-Source: AGHT+IEZDOgle6xEeOkEl/5TlUMHh/sDQAV3pdX3MQSmWUeItHW9uH8U0Gszb+dGZ3njJ8RK0BuGYQ==
X-Received: by 2002:aa7:d95a:0:b0:561:1484:8cc5 with SMTP id l26-20020aa7d95a000000b0056114848cc5mr534673eds.39.1707384811049;
        Thu, 08 Feb 2024 01:33:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWdxX+Z5XfKi+0hB9EUdd/yz/n0ff5bWnTmPCM6KditwXe7kyb9xF7fGlJmcG7Qutlb6Zwco9744h+P0R8Mh3V5IizY3BIrOoHEtGdMCAxw3iNiFEJ6ZE0Ircd68BY0c0RPoaEQ5u0hDZPGt8BBJrNNcxPmMYtPEnvrJgXSBTCJbaLJ9NC74eviKltzeqexGBn/S36ZNGaeOxF8FUNB9tCQQx9o8Lhh/k7AB+Q1wXbeFm5VCM/Ac5Ii8CyDqo+b3A==
Received: from felia.fritz.box ([2a02:810d:7e40:14b0:f81c:5b24:d269:24d])
        by smtp.gmail.com with ESMTPSA id dk5-20020a0564021d8500b0055c97f940fcsm628306edb.81.2024.02.08.01.33.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 01:33:30 -0800 (PST)
From: Lukas Bulwahn <lukas.bulwahn@gmail.com>
To: Danny Tsen <dtsen@linux.ibm.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-crypto@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2] MAINTAINERS: adjust file entries after crypto vmx file movement
Date: Thu,  8 Feb 2024 10:33:27 +0100
Message-Id: <20240208093327.23926-1-lukas.bulwahn@gmail.com>
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

Adjust these file entries accordingly. To keep the matched files exact
after the movement, spell out each file name in the new directory.

Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>
---
v1: https://lore.kernel.org/lkml/20240129131729.4311-1-lukas.bulwahn@gmail.com/

v1 -> v2:
  - address Herbert Xu's feedback:
  keep the matched files exactly those which were in the vmx directory

Danny, please ack.
Herbert, please pick this minor clean-up patch on your -next tree.

 MAINTAINERS | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 58845a852ab1..1820f661bfe1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10329,12 +10329,17 @@ M:	Nayna Jain <nayna@linux.ibm.com>
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
+F:	arch/powerpc/crypto/aes.c
+F:	arch/powerpc/crypto/aes_cbc.c
+F:	arch/powerpc/crypto/aes_ctr.c
+F:	arch/powerpc/crypto/aes_xts.c
+F:	arch/powerpc/crypto/aesp8-ppc.*
+F:	arch/powerpc/crypto/ghash.c
+F:	arch/powerpc/crypto/ghashp8-ppc.pl
+F:	arch/powerpc/crypto/ppc-xlate.pl
+F:	arch/powerpc/crypto/vmx.c
 
 IBM ServeRAID RAID DRIVER
 S:	Orphan
@@ -12428,7 +12433,6 @@ F:	drivers/*/*/*pasemi*
 F:	drivers/*/*pasemi*
 F:	drivers/char/tpm/tpm_ibmvtpm*
 F:	drivers/crypto/nx/
-F:	drivers/crypto/vmx/
 F:	drivers/i2c/busses/i2c-opal.c
 F:	drivers/net/ethernet/ibm/ibmveth.*
 F:	drivers/net/ethernet/ibm/ibmvnic.*
-- 
2.17.1


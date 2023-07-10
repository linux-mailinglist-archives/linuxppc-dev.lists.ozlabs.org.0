Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40B6774DB73
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:47:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20221208.gappssmtp.com header.i=@osandov-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=W7RF0loq;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R090c1JtNz3c1L
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:47:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20221208.gappssmtp.com header.i=@osandov-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=W7RF0loq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R08zh56kvz30N3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:46:56 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-262ef07be72so2205302a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 09:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20221208.gappssmtp.com; s=20221208; t=1689007614; x=1691599614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a8oejiBn24nsImiUBzXJJgIV0SyvtPcohAcYwp8oH8Y=;
        b=W7RF0loqZPQ8hOG/Ubw68wnRb17UCsNyHtSGd39NfX83uxeE9ObR+gZXBzNV5yXMHZ
         9dNW8LXv84GZhOdBM03MX62tz37PKR49XQ/1+mLZqqL1JSO4CVTT8uXcKA6DMu3kNX16
         13DWyplnk7IDKrVPwrDpCHF6oRaHPfmPBBlL6tDdKL39VnffJ2olpQM5SYrN3SPchgw/
         dGFCqhuBL6TVRDaWMF/lGHAE0q/9B8Q/FuLrl0ulYNQC6FipZxWzf/oYa53/9S+1Vsna
         444COZeLvH8mUnKxFekiuER5k0sVCrWLUwETPl1v3nS0qFFoGoEoNmqxOCx6z04kjd+n
         I3fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689007614; x=1691599614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a8oejiBn24nsImiUBzXJJgIV0SyvtPcohAcYwp8oH8Y=;
        b=Zal0z1RVyU1BE8wtVh2kHuuQfHOAXgY+tvaR9ptqUwmc+TUoxqsyA4aacwYP7jbi4O
         OwZtqHHz8/iH2BX1ps4VVKz2Xnksn0+88YbOkBqNkJKgQ6W4IAyELd1Z/wmL5H/4N/aM
         CKtJBkssj91m5mJgK079qrE+2TkaOilLj1RDpT9dJSexGUru3CFwhKIO9tx0acoHVJid
         Aq6fy9M3Bur71OMg8cTpejmcdr8DB00J7kY+GI6tpIUxKhij0o5A6cDmfSmNv9JUjovc
         NoE3WumdixWaPy+gUihEPDUwzRFC4asjwdkPyQjC8wepiamv+ABenXKxmBgyLwQIKyzh
         V91A==
X-Gm-Message-State: ABy/qLb9MqWT7i0okbqGjme0gD5px+MrZ3U1YOuM8S44QjjunzliqpHC
	C4LBYCukiNVQ09lq2GnCSwK0fYliPKq8Wp15oLk=
X-Google-Smtp-Source: APBJJlHxV2VaI+4KlKIdhJFoJdxnPIPkX+6dSFWtIsS6zSaAZ+6dMorgWu91AsapzGJzh4sSeNMaJg==
X-Received: by 2002:a17:90a:2a87:b0:262:d029:69fc with SMTP id j7-20020a17090a2a8700b00262d02969fcmr10311106pjd.34.1689007614196;
        Mon, 10 Jul 2023 09:46:54 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:a300:3bc0::77bb])
        by smtp.gmail.com with ESMTPSA id fh22-20020a17090b035600b00262eb0d141esm171208pjb.28.2023.07.10.09.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 09:46:53 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 1/2] powerpc/crypto: fix missing skcipher dependency for aes-gcm-p10
Date: Mon, 10 Jul 2023 09:46:46 -0700
Message-ID: <c55ad70799e027a3d2756b85ccadc0af52ae8915.1689007370.git.osandov@osandov.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Danny Tsen <dtsen@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Omar Sandoval <osandov@fb.com>

My stripped down configuration fails to build with:

  ERROR: modpost: "skcipher_walk_aead_encrypt" [arch/powerpc/crypto/aes-gcm-p10-crypto.ko] undefined!
  ERROR: modpost: "skcipher_walk_done" [arch/powerpc/crypto/aes-gcm-p10-crypto.ko] undefined!
  ERROR: modpost: "skcipher_walk_aead_decrypt" [arch/powerpc/crypto/aes-gcm-p10-crypto.ko] undefined!

Fix it by selecting CRYPTO_SKCIPHER.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 arch/powerpc/crypto/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index ad1872518992..81ae015861c0 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -100,6 +100,7 @@ config CRYPTO_AES_GCM_P10
 	select CRYPTO_LIB_AES
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
+	select CRYPTO_SKCIPHER
 	default m
 	help
 	  AEAD cipher: AES cipher algorithms (FIPS-197)
-- 
2.41.0


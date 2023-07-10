Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64F7E74DBAA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Jul 2023 18:55:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20221208.gappssmtp.com header.i=@osandov-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=zmH+qpmO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R099W22d9z3bcd
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 02:55:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=osandov-com.20221208.gappssmtp.com header.i=@osandov-com.20221208.gappssmtp.com header.a=rsa-sha256 header.s=20221208 header.b=zmH+qpmO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=osandov.com (client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=osandov@osandov.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R098d5Fkqz30h2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 02:54:41 +1000 (AEST)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-5636ab8240cso2471137eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Jul 2023 09:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20221208.gappssmtp.com; s=20221208; t=1689008078; x=1691600078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29cLZA2TFmOmSIEI5sE7QNoVfee3zL34fPIVTwe293c=;
        b=zmH+qpmOOYQBo44GsVhuIBbwMNuGrBeToS3nD7+fHJj+aC5Vwi3RDxNxbRXJQMH6oG
         ROVOYMgw2kFT9B61rPRuBfr20h2L2dKv9I+O8DQNHXbZq4hcShEaV665Uy0gBI/AyKLn
         0UAHkJUCJg3xs6DHYkdF1DGBjzCX2/iXaoUuA9Ww+YWTumNUfBM46n7UYlE9X/9unHC+
         8qGC1oT8Ig/GGeajXiBPKJAu6iy7Bybzd2XbjmZUVbLOzBglNhK1MbtDfQ06bp8s5T6Z
         Ahh/l9+W5BcEwkhgZHxH42ajOQbaYQVu1TyDS9Ia9uZ+h4S+3PK2ry5ddLclWTWfGDpR
         8Gyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689008078; x=1691600078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=29cLZA2TFmOmSIEI5sE7QNoVfee3zL34fPIVTwe293c=;
        b=V1b6PbjoN++WA7OUb/QLwh11+nVxxVDr6QMelUBbju2lihThY1GVE1dnaNKznOU1CZ
         F5ISYVZ1+bi7YnYwJNrzpvwhq5qop6Yn+FmUlQmyc8QvLJHI1A7gaK1AeT2n8WAHqB4N
         TjTEzCDzOI2zmWG2sqEQLwpMHIc5HAezSVdY50EzoHsjYhU9XqWdsX1FgmO45w5szJfv
         3qVJLUklwRqEpOCjXEKX4KPGeHeSjrtUs3FI0jb37/y/cH6reDiLJKxKtBx5o3n2NlyI
         8waLeMbhvAzIjZBeaQlv+Xfff6kt4HD7xnqQ1fd78qAsLxYDbUfF3aTyvrGlCb6eazMw
         8iDA==
X-Gm-Message-State: ABy/qLbfVdrmj+E9Kvfqmf12690WkPvObMb30sU7bR5a66NwpmyuTyGW
	aI+LUNpGcdg7vK8aQxA2e12F1y4HFVkAlmcYXBQ=
X-Google-Smtp-Source: APBJJlHdT0QanAyVX9kfyY2Vr8kXQ+knYay1oTIWHwZ6O40bX65UR3PkXIYj+GBb0ZsGhNDq3JW1oA==
X-Received: by 2002:a05:6e02:604:b0:345:a3c6:87b8 with SMTP id t4-20020a056e02060400b00345a3c687b8mr11787861ils.12.1689007615137;
        Mon, 10 Jul 2023 09:46:55 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:a300:3bc0::77bb])
        by smtp.gmail.com with ESMTPSA id fh22-20020a17090b035600b00262eb0d141esm171208pjb.28.2023.07.10.09.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jul 2023 09:46:54 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 2/2] powerpc/crypto: don't build aes-gcm-p10 by default
Date: Mon, 10 Jul 2023 09:46:47 -0700
Message-ID: <40d9c7ebe82c9a9d4ace542ac433753d2f22c6a0.1689007370.git.osandov@osandov.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <c55ad70799e027a3d2756b85ccadc0af52ae8915.1689007370.git.osandov@osandov.com>
References: <c55ad70799e027a3d2756b85ccadc0af52ae8915.1689007370.git.osandov@osandov.com>
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

None of the other accelerated crypto modules are built by default.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 arch/powerpc/crypto/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/crypto/Kconfig b/arch/powerpc/crypto/Kconfig
index 81ae015861c0..97802c72317c 100644
--- a/arch/powerpc/crypto/Kconfig
+++ b/arch/powerpc/crypto/Kconfig
@@ -101,7 +101,6 @@ config CRYPTO_AES_GCM_P10
 	select CRYPTO_ALGAPI
 	select CRYPTO_AEAD
 	select CRYPTO_SKCIPHER
-	default m
 	help
 	  AEAD cipher: AES cipher algorithms (FIPS-197)
 	  GCM (Galois/Counter Mode) authenticated encryption mode (NIST SP800-38D)
-- 
2.41.0


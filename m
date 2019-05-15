Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D58341EC14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 12:26:13 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453rLW37cxzDqVV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 20:26:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=axtens.net
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=dja@axtens.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.b="LNFk3SYq"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453rK84bddzDqSB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 20:25:00 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id c5so1116888pll.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 03:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sb4pV1d5lxWRP204NVfZBomUvfE6MxP49E2mX7dS5Bc=;
 b=LNFk3SYqazir1mtooOos9X27csivCVSHkilxBtbcBBTJ57MuXcN0CJAkFjXJKhnyzh
 0+HbVTAkpr6A5iI97f9dQH1bAk6JEdmmVWs6tLeIhjuNw7t0FG1iR8HKNUTvK89fS+wr
 18lIAFxVcfHTtTnfVth8z84az/irEcPIUU+zI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Sb4pV1d5lxWRP204NVfZBomUvfE6MxP49E2mX7dS5Bc=;
 b=fJpBZMkPnVqsW9bwPBLvzuNKPhfbl74IjKGEMAmVHG0hdR9MukagE+7wcjsSU8lYiL
 fB4MLpqqU4pJ3cytaq+q3Ej6Kx8TbconSWgWSYarp8uY0CzhQzUPDlQjjDpqcoC43Zv9
 T/oCblK3nKOu4h+moF1UMRmh+cKg23g8pG87XSEBNymVqe2i/5NOLWA/LQcsLsX3vHgl
 V4hJyMA+v/Ki9JdZvZS+ih6u+6nZKgvfetUggKKC27pb4CMR2UTvCZy6xzVkOkk34Sbo
 CQnJKiuHjGrxq2xROOZqBiJW6lBTcQTZLqkY13l6xuk+fmX/kEd71E19hLeKWiqntlKL
 CK1g==
X-Gm-Message-State: APjAAAXkBkbENhClZu0fJ6GqQlAzpibzo61t0E/lFnsqOT55WGhO8rAe
 vdo2D+tQPIBwgQQQBZJLFYs28A==
X-Google-Smtp-Source: APXvYqyjLExp8dImFftLMhrdYyBWBoJDEuAc+MBp5wYkorCb8rPwgnHl5nUDBpqX3DRe2bDSKOSMwQ==
X-Received: by 2002:a17:902:868c:: with SMTP id
 g12mr25668785plo.323.1557915897147; 
 Wed, 15 May 2019 03:24:57 -0700 (PDT)
Received: from localhost (dip-220-235-49-186.wa.westnet.com.au.
 [220.235.49.186])
 by smtp.gmail.com with ESMTPSA id 194sm4367930pfb.125.2019.05.15.03.24.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 03:24:56 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: mpe@ellerman.id.au, ebiggers@kernel.org, linux-crypto@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>
Subject: [PATCH] crypto: vmx - CTR: always increment IV as quadword
Date: Wed, 15 May 2019 20:24:50 +1000
Message-Id: <20190515102450.30557-1-dja@axtens.net>
X-Mailer: git-send-email 2.19.1
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
Cc: leo.barbosa@canonical.com, Stephan Mueller <smueller@chronox.de>,
 nayna@linux.ibm.com, omosnacek@gmail.com, leitao@debian.org,
 pfsmorigo@gmail.com, marcelo.cerri@canonical.com, gcwilson@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The kernel self-tests picked up an issue with CTR mode:
alg: skcipher: p8_aes_ctr encryption test failed (wrong result) on test vector 3, cfg="uneven misaligned splits, may sleep"

Test vector 3 has an IV of FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFD, so
after 3 increments it should wrap around to 0.

In the aesp8-ppc code from OpenSSL, there are two paths that
increment IVs: the bulk (8 at a time) path, and the individual
path which is used when there are fewer than 8 AES blocks to
process.

In the bulk path, the IV is incremented with vadduqm: "Vector
Add Unsigned Quadword Modulo", which does 128-bit addition.

In the individual path, however, the IV is incremented with
vadduwm: "Vector Add Unsigned Word Modulo", which instead
does 4 32-bit additions. Thus the IV would instead become
FFFFFFFFFFFFFFFFFFFFFFFF00000000, throwing off the result.

Use vadduqm.

This was probably a typo originally, what with q and w being
adjacent. It is a pretty narrow edge case: I am really
impressed by the quality of the kernel self-tests!

Fixes: 5c380d623ed3 ("crypto: vmx - Add support for VMS instructions by ASM")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Axtens <dja@axtens.net>

---

I'll pass this along internally to get it into OpenSSL as well.
---
 drivers/crypto/vmx/aesp8-ppc.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/vmx/aesp8-ppc.pl b/drivers/crypto/vmx/aesp8-ppc.pl
index de78282b8f44..9c6b5c1d6a1a 100644
--- a/drivers/crypto/vmx/aesp8-ppc.pl
+++ b/drivers/crypto/vmx/aesp8-ppc.pl
@@ -1357,7 +1357,7 @@ Loop_ctr32_enc:
 	addi		$idx,$idx,16
 	bdnz		Loop_ctr32_enc
 
-	vadduwm		$ivec,$ivec,$one
+	vadduqm		$ivec,$ivec,$one
 	 vmr		$dat,$inptail
 	 lvx		$inptail,0,$inp
 	 addi		$inp,$inp,16
-- 
2.19.1


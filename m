Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B923C6742
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 01:56:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP0zG2Q4Nz3bnV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 09:56:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VvA9gF1c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::535;
 helo=mail-ed1-x535.google.com; envelope-from=salah.triki@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VvA9gF1c; dkim-atps=neutral
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GNwlV4fN7z2y0G
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 06:45:57 +1000 (AEST)
Received: by mail-ed1-x535.google.com with SMTP id dj21so10120687edb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 13:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=dDg6dKdVLJtJjWTE5YR4R8BahCCcS2EwH/pICn0zM0g=;
 b=VvA9gF1cQzfsFJJuZw2k6deH0TrKgAqzG7Lh3UsbcHfVdGVULX6QCCBcDJkyEzUz6S
 4M0lhD/f0O3zOV/qW/FH+AdiIPmjmsUduCXl6hYUHdp0jGxO78/bsxoJe7yL4u47uXAT
 tIbgGLcdyJo2USYyUEiAAC42fyPLUXRMCVa3JkgqjQ4V0cgkjc3wrkDUPdEYzp64M1/4
 kW+QcOi3Npa4jrni6tUvOEtIWOGIx/uQf0sSsamDOx8HwRbNEELxMo2PCR1eJWjfQjNo
 XuctAP+IH3aZE96KMW8ZiFzNDr+Jwl7oANfweKQq9/jpchIKc9rys4gkFmtEyMKvWiCa
 /JgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=dDg6dKdVLJtJjWTE5YR4R8BahCCcS2EwH/pICn0zM0g=;
 b=mBqpfxVdXsawVQs04iEYyfgH4gCmVCkSN4RvnS6BroL/9ayfZfXTSzSzLjrpWp47mv
 zfPdHuP16q9mT8ZsR2WZXTj4JyUYOaMatVd75noTk3hMzxMWamhvXiPwPSpsEWgR3Tai
 IjtW+yBtI5aH4Nzv55N9M8um/PhuWrioEd8yOu3WbDWY1FgArvv/BJQemSZ7uwDmsXAm
 7/pzDPwr48zVYbIVpGx8NBbq85lbSojLLJLrnXSUPQmFy4TCQF5qpGfO/P4FfeeNMMPM
 TOYm4jntCisCfweKSagNgmEuHf1anwl04FAnfYhsiC0qi6HOJjArEyjEJwkEutlnKTEe
 1SAg==
X-Gm-Message-State: AOAM532fCc6GKD7uu6t4oL1Qu5SobZIUV4+lw1Xx6JUrTkEn+zKuniqK
 s3W6uG1+O4wS5sRxadzLNVg=
X-Google-Smtp-Source: ABdhPJxTE8FRlr/SGGLVlQazu5h0rWf2qLy5L/iBr8vz6rqGAo+osxrbvsDwkpP/yPqJf49D1JCo5Q==
X-Received: by 2002:aa7:d5c8:: with SMTP id d8mr882407eds.165.1626122750086;
 Mon, 12 Jul 2021 13:45:50 -0700 (PDT)
Received: from pc ([196.235.212.194])
 by smtp.gmail.com with ESMTPSA id p26sm6814303ejd.80.2021.07.12.13.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 13:45:49 -0700 (PDT)
Date: Mon, 12 Jul 2021 21:45:46 +0100
From: Salah Triki <salah.triki@gmail.com>
To: haren@us.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
 paulus@samba.org, herbert@gondor.apana.org.au, davem@davemloft.net
Subject: [PATCH] replace if with min
Message-ID: <20210712204546.GA1492390@pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailman-Approved-At: Tue, 13 Jul 2021 09:55:31 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-crypto@vger.kernel.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace if with min in order to make code more clean.

Signed-off-by: Salah Triki <salah.triki@gmail.com>
---
 drivers/crypto/nx/nx-842.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/crypto/nx/nx-842.c b/drivers/crypto/nx/nx-842.c
index 2ab90ec10e61..0d1d5a463899 100644
--- a/drivers/crypto/nx/nx-842.c
+++ b/drivers/crypto/nx/nx-842.c
@@ -134,8 +134,7 @@ EXPORT_SYMBOL_GPL(nx842_crypto_exit);
 static void check_constraints(struct nx842_constraints *c)
 {
 	/* limit maximum, to always have enough bounce buffer to decompress */
-	if (c->maximum > BOUNCE_BUFFER_SIZE)
-		c->maximum = BOUNCE_BUFFER_SIZE;
+	c->maximum = min(c->maximum, BOUNCE_BUFFER_SIZE);
 }
 
 static int nx842_crypto_add_header(struct nx842_crypto_header *hdr, u8 *buf)
-- 
2.25.1


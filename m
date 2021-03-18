Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FDA3405D5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 13:45:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F1RZG6hBHz3by4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Mar 2021 23:45:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KjxlBIL/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::434;
 helo=mail-wr1-x434.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=KjxlBIL/; dkim-atps=neutral
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F1RYk5ymKz2yQv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 23:44:41 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id v11so5377915wro.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Mar 2021 05:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4foJK0tE+WL3lsMryI6KM5lFp3YWmzugBxJCQxMDWAg=;
 b=KjxlBIL/5+bh5fCH7X6TiEm7gUUM3pQbhOECaOyCDUnlciMaN1ctbqgcMIBXwrnAix
 dEnoldKG99BkcDQji16mtek9bLZ2WbPFggh6TrJBcd993prFyPlOYME5ezAzuyLIZpZb
 Hfuost30WbKwgh03ZN1jcoo6VrNFfwSOhB14knCXVBoc6oW4lb9E0gtPquJSEHOv8EdB
 8qC9cfLnT6Y6MakvSODWSZjn6RN0HA1ZfTeVvb2WvpqSqqOqnxK6Skkm/AQVvbPJXSnU
 haEHCQIN2IRct3EXsXdJMjsZf16uARxNIPS2KvH3wlHfaxb017igCrGak719QHLDy36i
 Dvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4foJK0tE+WL3lsMryI6KM5lFp3YWmzugBxJCQxMDWAg=;
 b=evwSiDhfaTq1qUw3lOL58D6h+Zymz7cHEf3sO9QmL6FjBfvdMseVEE5YvQCwuGX7/q
 V8j/7/n0b3cTyQQa3bqlNBqtlR2HoT4Bb9Q5QY2fc7G7HanEUmLXCTXQlujPMGA0VCnB
 EX8/Wci+SXIeZHuJyXT2+EdOBmdtZWR81cslDrLgbrTJVW3H9n6xHIPyT3Yp++O1f1pF
 IAUqFKRy9EKvq0HhDfrwAbFd0PE4CrovNQAfkbku50zXs5eGL0SFx/NN54XtgFDwP/Vy
 PZb+w8/adeX8V78Grsf885EgH0QqOBtKrcXkfwxDBOxAkWDgaNhufmElHRA3Qt8Xz+1M
 W/0Q==
X-Gm-Message-State: AOAM533bEs5hGy9XAoiyCwHFBswfxhFUCwFoHMbw5JjQE1cOXI5wp1Jt
 Yu1MWN8WM100Dy6RXDvONGQ0QQ==
X-Google-Smtp-Source: ABdhPJzMvwSvkYM8ayiGVbfuAWWsOBZ/YUhWo0aTK8kgiiyjoTePFruMU6I3YjYgOX4ZpbmmIBxTbg==
X-Received: by 2002:a5d:4fca:: with SMTP id h10mr10054325wrw.70.1616071478056; 
 Thu, 18 Mar 2021 05:44:38 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id q15sm2813900wrx.56.2021.03.18.05.44.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Mar 2021 05:44:37 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 08/10] crypto: vmx: Source headers are not good kernel-doc
 candidates
Date: Thu, 18 Mar 2021 12:44:20 +0000
Message-Id: <20210318124422.3200180-9-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210318124422.3200180-1-lee.jones@linaro.org>
References: <20210318124422.3200180-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Henrique Cerri <mhcerri@br.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-crypto@vger.kernel.org,
 =?UTF-8?q?Breno=20Leit=C3=A3o?= <leitao@debian.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/crypto/vmx/vmx.c:23: warning: expecting prototype for Routines supporting VMX instructions on the Power 8(). Prototype was for p8_init() instead

Cc: "Breno Leitão" <leitao@debian.org>
Cc: Nayna Jain <nayna@linux.ibm.com>
Cc: Paulo Flabiano Smorigo <pfsmorigo@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Henrique Cerri <mhcerri@br.ibm.com>
Cc: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/crypto/vmx/vmx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/vmx/vmx.c b/drivers/crypto/vmx/vmx.c
index a40d08e75fc0b..7eb713cc87c8c 100644
--- a/drivers/crypto/vmx/vmx.c
+++ b/drivers/crypto/vmx/vmx.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/**
+/*
  * Routines supporting VMX instructions on the Power 8
  *
  * Copyright (C) 2015 International Business Machines Inc.
-- 
2.27.0


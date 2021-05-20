Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E700038A139
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 11:28:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm4Cm6kRmz3bsF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 19:28:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WHq5rmnp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e;
 helo=mail-wm1-x32e.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=WHq5rmnp; dkim-atps=neutral
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm4CK6R9Pz2y0D
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 19:27:40 +1000 (AEST)
Received: by mail-wm1-x32e.google.com with SMTP id u133so8740818wmg.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dU5Shf+7jgxGf2Em75yJ7P7LzexGKomEfxug1gdGXww=;
 b=WHq5rmnp3uI8DAyWtdVkuqfHWCNoBreRF/GaYNOH/nJ2YdBW4Mv5+dn9HgrlpN5Z6x
 sSv9X1mC66hRC+GzbfRw3ycK1KOwvCIfaPoJc4JXXAUYl6kSEXGh1Wb+f9FSBySC7Zj9
 IF6vnioWscFC/kCaq0GOVcMweXqNS7gp16hUK0t6VBs8UBqh87BXwLc8NjtyJPy6ckTM
 0AGlt1IRVQ6uruiorIZiWHibX/9ZHCjWbprF4nhe5jUkCqYUDwJGxxaF/Q7PqMkPcdDP
 ZjRrYtUZRf+7jwJKbmJcgOT7XahixFIs8Xw3HNGjXK+hi46zDKfaRxJyQcbDBYIRAk+U
 ApOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dU5Shf+7jgxGf2Em75yJ7P7LzexGKomEfxug1gdGXww=;
 b=BRX/D8vr+h7W1/Pt5gUObJWZm7PzOynVzi+wdsvWUwzGGioeXN1qtiQ4ophi3ZUYCM
 eVeMJyxqP/Cd7aUKFns8M6O8870oA7mAHtY0cJ9DQAVCITkjva+4i6G9eNG1eqqO9QI+
 JqXLjt3L4AKeN5ILJOQP7eLqDXb8AS8e5g4X6IZ+FR0/Nm/QBzR38usCbiC/l/gnUZvh
 yVorr07O5ahSS09ys0QR0RS71ES1WrT7bklIPY78vPhR9SNVizHJSDcrhcQlGjKK/7sI
 t6UJZOZhC0K4CNFpKzgkSLabz8r0/kglzXweoaRax1haKtiw0jaOJ26ObxJl2gdSPI8g
 ZW/Q==
X-Gm-Message-State: AOAM530uVkVnhoRx1tT/ROZjfhmnZMd378yco9Tjy2bv7QbD0iL9z77n
 VZElnDGgDwOTCD5EBbeP3FhFUQ==
X-Google-Smtp-Source: ABdhPJzDsTvk4HPlEGrtAcfV1TKzKAUs+Q3Wq9d61G1Q07eGsQmFkUl0v/Yc00uh0/tRpYItTzsFfg==
X-Received: by 2002:a05:600c:4fd6:: with SMTP id
 o22mr2629786wmq.83.1621502856494; 
 Thu, 20 May 2021 02:27:36 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id u11sm722971wrw.14.2021.05.20.02.27.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 02:27:36 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 0/3] Rid W=1 warnings from Crypto
Date: Thu, 20 May 2021 10:27:30 +0100
Message-Id: <20210520092733.3434378-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
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
Cc: John Allen <john.allen@amd.com>,
 Seth Jennings <sjenning@linux.vnet.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Tom Lendacky <thomas.lendacky@amd.com>, Gary R Hook <gary.hook@amd.com>,
 linux-kernel@vger.kernel.org, George Cherian <gcherian@marvell.com>,
 Paul Mackerras <paulus@samba.org>, Robert Jennings <rcj@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 linux-crypto@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This set is part of a larger effort attempting to clean-up W=1
kernel builds, which are currently overwhelmingly riddled with
niggly little warnings.

Lee Jones (3):
  crypto: cavium: Fix a bunch of kernel-doc related issues
  crypto: nx: nx-aes-gcm: Kernel-doc formatting should not be used for
    headers
  crypto: ccp: ccp-dev: Fix a little doc-rot

 drivers/crypto/cavium/cpt/cptpf_main.c        |  2 +-
 drivers/crypto/cavium/cpt/cptvf_reqmanager.c  |  4 ++--
 drivers/crypto/cavium/nitrox/nitrox_main.c    |  4 ++--
 drivers/crypto/cavium/nitrox/nitrox_mbx.c     |  4 ++--
 drivers/crypto/cavium/nitrox/nitrox_reqmgr.c  | 12 ++++++----
 .../crypto/cavium/nitrox/nitrox_skcipher.c    |  2 +-
 drivers/crypto/ccp/ccp-dev.c                  |  2 +-
 drivers/crypto/nx/nx-842-pseries.c            | 24 +++++++++----------
 8 files changed, 27 insertions(+), 27 deletions(-)

Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Gary R Hook <gary.hook@amd.com>
Cc: George Cherian <gcherian@marvell.com>
Cc: Haren Myneni <haren@us.ibm.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: John Allen <john.allen@amd.com>
Cc: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Robert Jennings <rcj@linux.vnet.ibm.com>
Cc: Seth Jennings <sjenning@linux.vnet.ibm.com>
Cc: Tom Lendacky <thomas.lendacky@amd.com>
-- 
2.31.1


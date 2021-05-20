Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D126038ADC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 14:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fm7wH5xhBz3070
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 22:14:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FwbLKM2K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::335;
 helo=mail-wm1-x335.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FwbLKM2K; dkim-atps=neutral
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fm7vY1wfwz3090
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 22:14:16 +1000 (AEST)
Received: by mail-wm1-x335.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso5277028wmh.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 05:14:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=63aR0ApZJ3bwroQWXqAaSkH9cV6NbSWgeKUqcgHI7+A=;
 b=FwbLKM2KkOv0flbvtj3nJnPuN0+A2r3yE/1kP07JVzwHo5CAewGS3FlOHT47wv+eje
 Ukb+qynmxWBL1JoL3mzRQiWF+x5dTlrdiwmyJ1CelSy6zUItrLRiDVyOfMFbL7uj7hon
 waxf4ZxdWSpAi2zOuJAXJ0NcgWVnl7PXa7AePVpn/y5ZdvWmSqVp1aflW3D9V9+i0Smu
 ALyRNqMW9E3jjT1z1bLSeRAlyh22qBbRn3ci9A+j298IVUCYzQo/vZEkvDm2KeUd0mX2
 lUWLleyUEqIDi8dwHDGlDdxoey80XmBjZKrw+PwTLvI1LP87RDpDU+HjgP8iSc/+8PBJ
 GPOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=63aR0ApZJ3bwroQWXqAaSkH9cV6NbSWgeKUqcgHI7+A=;
 b=kCRlnPjDKF9m05/UXB5vzXJJuerrGKal0/Dt+KJCZh2LwQkY3rYOWLU/9iJlMq4+4c
 H0kEXj9N5hNZZkZ7P0OcBbHfKMxyU5Peesx4byuyVB2my5AuMOJfGoDcWpCOjwACovzo
 iUu7cKXy9ZF5gQ1fNQnFcQqP3QwmbCyRSdy9V/vHfSyAiP9TiemFSrC9+o3TMguSI+IR
 6bwcvLwsYGydERNA/nvjOR6obklR6sxU2jGw3xOieI21aarx6BMieuTWW5zx4YRSh/rT
 ZdPrdH7iFRMcfOrPzVR16Dqpgi4RDaCiASZQkk1ZKMw4dSxkuLERZZJZ4Cq8zZ8ThssB
 eBfw==
X-Gm-Message-State: AOAM532EDyqGQQZmP30nVWFVyA1lR+2QdFfQG9ir9v0MMBsVdeXkNFyG
 HoSSpYeCVL0Wdm2YHsTbC9sNfA==
X-Google-Smtp-Source: ABdhPJw1Fp+Jmjls9UkJh6YCn4HHFBXPq5pRCzpBsC65iVfftho44k60NMHVqYTzgP4lBPc3lSuE+g==
X-Received: by 2002:a05:600c:410a:: with SMTP id
 j10mr3730747wmi.26.1621512853737; 
 Thu, 20 May 2021 05:14:13 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id 61sm3393704wrm.52.2021.05.20.05.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 05:14:13 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH 15/16] char: hw_random: pseries-rng: Demote non-conformant
 kernel-doc header
Date: Thu, 20 May 2021 13:13:46 +0100
Message-Id: <20210520121347.3467794-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210520121347.3467794-1-lee.jones@linaro.org>
References: <20210520121347.3467794-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matt Mackall <mpm@selenic.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-crypto@vger.kernel.org,
 Lijun Pan <ljp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fixes the following W=1 kernel build warning(s):

 drivers/char/hw_random/pseries-rng.c:42: warning: Function parameter or member 'vdev' not described in 'pseries_rng_get_desired_dma'

Cc: Matt Mackall <mpm@selenic.com>
Cc: Herbert Xu <herbert@gondor.apana.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Lijun Pan <ljp@linux.ibm.com>
Cc: "Uwe Kleine-König" <uwe@kleine-koenig.org>
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Neuling <mikey@neuling.org>
Cc: linux-crypto@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/char/hw_random/pseries-rng.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/char/hw_random/pseries-rng.c b/drivers/char/hw_random/pseries-rng.c
index f4949b689bd5a..62bdd5af1339f 100644
--- a/drivers/char/hw_random/pseries-rng.c
+++ b/drivers/char/hw_random/pseries-rng.c
@@ -29,7 +29,7 @@ static int pseries_rng_read(struct hwrng *rng, void *data, size_t max, bool wait
 	return 8;
 }
 
-/**
+/*
  * pseries_rng_get_desired_dma - Return desired DMA allocate for CMO operations
  *
  * This is a required function for a driver to operate in a CMO environment
-- 
2.31.1


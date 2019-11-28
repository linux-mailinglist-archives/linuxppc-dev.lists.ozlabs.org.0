Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A6010CCF2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 17:43:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47P3NY6xC5zDqGm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Nov 2019 03:43:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="V2jSMZBN"; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47P1394pv6zDqsv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Nov 2019 01:57:57 +1100 (AEDT)
Received: by mail-lf1-x141.google.com with SMTP id y19so20247222lfl.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 06:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=izqhGk+7dYtc0qSDmqSrNzca5ES+nhNiwDVQCjT9+7A=;
 b=V2jSMZBN8uh/xpePhhzkN28hW1PU3ZPx3auFFgQEEIv24PnHG7WcUuT9Hr7TOse5Rk
 FIOhKMME0cB9iUKg1zBa4lJ8C9Vi0lSdcsXWunqNCSFJ9Nz0OrpeEQRglQhTBkE35R9e
 ejuls2cV8st5na9tOFkujKVk+QD9iuwF49KvM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=izqhGk+7dYtc0qSDmqSrNzca5ES+nhNiwDVQCjT9+7A=;
 b=iSirLkRnuuQaVk/bh+Ta++tW4HK3bI8ovJXqQ/gbI1U+m+UqXbWdYJSdBrNoTzoMjk
 dezMW34+sjZiSpoAgtGqIH/W1sb2lKJh5xe6Y9vIvj5q0EcdNEURZLkDP5pb95UuwTkr
 rDJ3eRGk8BFQ+MFHSwfy7Io3Oo89oOzPi0VOwSGxrxcqvFpGeds2TzDneyPQvrfTRAmE
 NGaOIUgaLWYJAPVnKw68zGGpR2dxQmQzKNRo/vAEBexaYiPWqi46p7N1WDr5aiN9Wl+l
 MqYpTZ2FSE2j+qmkjbK3ad4eMCTSeUYB6JAkg3D7aR0QXs+Zr4IeZbcKjgw2TeRzyIhW
 9gkQ==
X-Gm-Message-State: APjAAAX38AomypKtnF8kutp1niLw5b4h68egr5MqBWJNXBlPlJHdWg/r
 BLt1aA5FspQ4UCnVEK2WhXbRgSnMnxdTDMsR
X-Google-Smtp-Source: APXvYqyw4gw+pnvDh4FxsHQgDketpaq7hQlReciEcvlLDb7UG2dgMuvgna7yNQjdHNDX/gN/j/K3IQ==
X-Received: by 2002:ac2:5a08:: with SMTP id q8mr32413398lfn.106.1574953074176; 
 Thu, 28 Nov 2019 06:57:54 -0800 (PST)
Received: from prevas-ravi.prevas.se ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id u2sm2456803lfl.18.2019.11.28.06.57.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Nov 2019 06:57:53 -0800 (PST)
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Qiang Zhao <qiang.zhao@nxp.com>, Li Yang <leoyang.li@nxp.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v6 37/49] soc: fsl: qe: make cpm_muram_free() ignore a
 negative offset
Date: Thu, 28 Nov 2019 15:55:42 +0100
Message-Id: <20191128145554.1297-38-linux@rasmusvillemoes.dk>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
References: <20191128145554.1297-1-linux@rasmusvillemoes.dk>
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
Cc: Timur Tabi <timur@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This allows one to simplify callers since they can store a negative
value as a sentinel to indicate "this was never allocated" (or store
the -ENOMEM from an allocation failure) and then call cpm_muram_free()
unconditionally.

Reviewed-by: Timur Tabi <timur@kernel.org>
Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/soc/fsl/qe/qe_common.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/soc/fsl/qe/qe_common.c b/drivers/soc/fsl/qe/qe_common.c
index 962835488f66..48c77bb92846 100644
--- a/drivers/soc/fsl/qe/qe_common.c
+++ b/drivers/soc/fsl/qe/qe_common.c
@@ -176,6 +176,9 @@ void cpm_muram_free(s32 offset)
 	int size;
 	struct muram_block *tmp;
 
+	if (offset < 0)
+		return;
+
 	size = 0;
 	spin_lock_irqsave(&cpm_muram_lock, flags);
 	list_for_each_entry(tmp, &muram_block_list, head) {
-- 
2.23.0


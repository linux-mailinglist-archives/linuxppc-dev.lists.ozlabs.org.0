Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F22FF51EA98
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 01:33:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwkK139jCz2ypD
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 May 2022 09:33:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jSWuncNA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62b;
 helo=mail-ej1-x62b.google.com; envelope-from=pieterjan.camerlynck@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=jSWuncNA; dkim-atps=neutral
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwRcf0qpJz3byl
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 22:31:13 +1000 (AEST)
Received: by mail-ej1-x62b.google.com with SMTP id l18so18871788ejc.7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 May 2022 05:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbilywkyD/M8bgsQ+Goos9KyMxX3bX3Ox36YlxJ8d/c=;
 b=jSWuncNAiU0XkPaOT1H89zBzD0IQbe9EpFSJVAJNDrfrhJ475C3/F1a3IRUpkfdmfl
 z5FYvQB3AxePJWNCui/KXqmyoKXJvtMUI3YmIK3SI/XfbdKwbALc15eOsfve/uT1hAV5
 KrV5JwXSKPUIr6C9cB0qe+O8iSfy6eiSlf7p6ihESMr7M1iGsnLs0ze8PAOL35nKHjCi
 TrulnuUgvOH98Ktl1Y+5P9gLjG69IA+KtlBrubuLth9BWu3HNiuqdsoC70GxoAqZ6bux
 Ew2//PR/5ufgtbHfTK62Pagl53ORU3lyO6MqepZsTijkUelvniZTwsuIS3MPFNeP7YNz
 Du8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VbilywkyD/M8bgsQ+Goos9KyMxX3bX3Ox36YlxJ8d/c=;
 b=z6obGm01S1SbkasiRy2A/3VoQZm9tezbfcrNUBmbFUNCxBVL32szTgWZDKYqnNcInr
 36IrMWOdkCv0dmg0q4xJWdVmoOQx0x8w8QVBjTEBhlRuxbdtfJb7X6m76zK5GEqXBYCM
 4GeoK/TnhqhvtKPUReAxzCyekjMZEZB9ff1CzVxzyqQ8XE2slGmi9Qjbl5rX80F3g+gv
 wqGIVirSbOx6zmtpFHW/9chZgtAa5OcTXaputlcLASDnxj+Mz1YD4RliJgakgyav3P4Z
 HPyqmSihYCfMQJyDq5SljtmA68DuCXUtJV4wa4cFjv4VT4QBU2xjcY6CXsDmQSMgTzEg
 KBhQ==
X-Gm-Message-State: AOAM532bh9Eiwuql8dRiW819QFCCwow1NVrMXMgqKb/Dzs7QoZ9czcxF
 goJfUuaWfJHZ2nMHolE95I8=
X-Google-Smtp-Source: ABdhPJwgi2oAExzw1tYk1Mg5zfE640UsZvBoS4IF5pYyh1DxuoHxiAg8VieZVSJo8xU8ihZXToPuwA==
X-Received: by 2002:a17:907:7e9f:b0:6f6:e9ce:9939 with SMTP id
 qb31-20020a1709077e9f00b006f6e9ce9939mr4108603ejc.456.1651926665959; 
 Sat, 07 May 2022 05:31:05 -0700 (PDT)
Received: from pca.lan (ptr-dc5856ogfk7hh0p2zet.18120a2.ip6.access.telenet.be.
 [2a02:1811:bc80:f7f0:311d:17d5:927c:28c5])
 by smtp.gmail.com with ESMTPSA id
 d23-20020aa7d697000000b0042617ba63absm3468466edr.53.2022.05.07.05.31.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 May 2022 05:31:05 -0700 (PDT)
From: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com
Subject: [PATCH] ASoC: fsl_sai: fix incorrect mclk number in error message
Date: Sat,  7 May 2022 14:31:01 +0200
Message-Id: <20220507123101.10938-1-pieterjan.camerlynck@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 08 May 2022 09:33:09 +1000
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org,
 Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit <c3ecef21c3f26> ("ASoC: fsl_sai: add sai master mode support")
the loop was changed to start iterating from 1 instead of 0. The error
message however was not updated, reporting the wrong clock to the user.

Signed-off-by: Pieterjan Camerlynck <pieterjan.camerlynck@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index ffc24afb5a7a..f0602077b385 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1054,7 +1054,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
 		if (IS_ERR(sai->mclk_clk[i])) {
 			dev_err(&pdev->dev, "failed to get mclk%d clock: %ld\n",
-					i + 1, PTR_ERR(sai->mclk_clk[i]));
+					i, PTR_ERR(sai->mclk_clk[i]));
 			sai->mclk_clk[i] = NULL;
 		}
 	}
-- 
2.25.1


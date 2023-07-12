Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E49057509FC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 15:50:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HZPxYS2q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R1JzK5thZz3c5d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 23:50:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HZPxYS2q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::635; helo=mail-ej1-x635.google.com; envelope-from=matuszpd@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R1Hj40lPGz3bnw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 22:53:09 +1000 (AEST)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-98e39784a85so157869666b.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 05:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689166384; x=1691758384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ef9ldj54LfSreJO+VbHq1Yil94yCCRtncr0AA0IgxoI=;
        b=HZPxYS2q0wdP+oUdlVbS0bHA1gduL/QbI3aYqBTAD7g0jrxG3ckLP7O+qlZaCgpYtZ
         uR4tL/+dPcz2X7WQA7Fx5G0jEmaDPw2Hhj0hWt2d2dgvDINwW3fJ9RFCZgPA9NDBkJb5
         kZgq4OzAms76DQJFiMj/dA8201Fs9jVy+T1gw9BJIwYxEbnqt9CZPa1Yi9XAcVJYJGtm
         dTuHFo/YgPTWVnjwjFDJgMYaMbkZMTOHkjl9hN/mRikq8ZEUDstWunwXChiIZQ93QvNf
         N/sg+1KPo3DQA/CI8eCoAQaMO9n1/x2MW6pBZtB+m1YOE0718F6Wvr9mm4rOJU8SuPhc
         u1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689166384; x=1691758384;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ef9ldj54LfSreJO+VbHq1Yil94yCCRtncr0AA0IgxoI=;
        b=RlEh5SJQkSAOEoeTtlpPLchuOpvi/gnWgAxR8rFNlPZSfjuQG/mrr0T0cIYDFQo4cC
         jpzH4ifouatVLwlQyr3LZWQTofhVZSJODl4tZMvVkSy8SBPvasZD3LjR+kOGGMxoyVes
         8GFtsq0i+lFz/c5dn0QjLq333KMjRdZZTXifMcscHBHHv6t4+DH935r+rdVl4+5QHlyo
         dJaRO9TAGoYzlkOD62d8YMmELN+ev6x3xhe4Ft2S+RgQCmIQ8FfvlpaghLNZkCjv4xjD
         28/ezH3y6Hnpn0CiVGB6pAU1JsASIuZv/vck5IM21g5J6VrBI4rqRWYv7OR2ucn+2vDz
         IUWw==
X-Gm-Message-State: ABy/qLbtqw07nLaRPeyTCC/3YbGJ71OUUsVtKC9H8AOw94RXtm13QveO
	TbJznXvQhSJT9ckUGeMUac4=
X-Google-Smtp-Source: APBJJlEQwzCXnLSG9Db+b/tZpzul5Q8lvD7Ip0hLgkyKGo/6GNq4Xfrpf2kkMy9+NX6RlyZ+hk/4uQ==
X-Received: by 2002:a17:906:64c2:b0:993:d632:2c3 with SMTP id p2-20020a17090664c200b00993d63202c3mr2421780ejn.21.1689166383605;
        Wed, 12 Jul 2023 05:53:03 -0700 (PDT)
Received: from localhost.localdomain ([2a01:c844:242b:b300:215:5dff:fe81:5e96])
        by smtp.gmail.com with ESMTPSA id l6-20020a170906230600b00991faf3810esm2544506eja.146.2023.07.12.05.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jul 2023 05:53:03 -0700 (PDT)
From: Matus Gajdos <matuszpd@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Subject: [PATCH] ASoC: fsl_sai: Disable bit clock with transmitter
Date: Wed, 12 Jul 2023 14:49:33 +0200
Message-Id: <20230712124934.32232-1-matuszpd@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 12 Jul 2023 23:49:03 +1000
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
Cc: Matus Gajdos <matuszpd@gmail.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Otherwise bit clock remains running writing invalid data to the DAC.

Signed-off-by: Matus Gajdos <matuszpd@gmail.com>
---
 sound/soc/fsl/fsl_sai.c | 2 +-
 sound/soc/fsl/fsl_sai.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 5e09f634c61b..dcc7fbe7acac 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -719,7 +719,7 @@ static void fsl_sai_config_disable(struct fsl_sai *sai, int dir)
 	u32 xcsr, count = 100;
 
 	regmap_update_bits(sai->regmap, FSL_SAI_xCSR(tx, ofs),
-			   FSL_SAI_CSR_TERE, 0);
+			   FSL_SAI_CSR_TERE | FSL_SAI_CSR_BCE, 0);
 
 	/* TERE will remain set till the end of current frame */
 	do {
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 8254c3547b87..550df87b6a06 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -91,6 +91,7 @@
 /* SAI Transmit/Receive Control Register */
 #define FSL_SAI_CSR_TERE	BIT(31)
 #define FSL_SAI_CSR_SE		BIT(30)
+#define FSL_SAI_CSR_BCE		BIT(28)
 #define FSL_SAI_CSR_FR		BIT(25)
 #define FSL_SAI_CSR_SR		BIT(24)
 #define FSL_SAI_CSR_xF_SHIFT	16
-- 
2.25.1


Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A387A6AC7E5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 17:27:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVkWp3yWjz3ffZ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 03:27:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=A9IaaHjP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::221; helo=relay1-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=A9IaaHjP;
	dkim-atps=neutral
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::221])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVkKD4PYlz3f47
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 03:18:40 +1100 (AEDT)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id D5978240019;
	Mon,  6 Mar 2023 16:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1678119518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+rNmzbQSxlgYysBCGQaz+s+0O1Jf7YARbWX5NfsCdPg=;
	b=A9IaaHjPm9mDIMgj5GmW+lfUhh98MKEkEQmQ97lICaF3eG0rcnC8A8DAnL/x+FlylFHPND
	Ki18ko4wXO3S+X1mg/QiC4BV/ZJ31kzegDVabxZNGLH7Qbn9WG1chs7Qoofi3UvrA99z54
	FHgoQZgJ3FnUS66mEwkJFNWkpbao4reE9I+vdZrh7d0TZ32ZAy8HQahmsD+YMIB88OPlES
	pU8ZQdRXFtJLaayHGdCFNYm05AXsMNt2WJE3zSwLY7e8PFJiBv26rsES8C6TUMXFkyClpx
	a09EUogixKD+OktcXn+vlIVh9lAkf88GzzNNjkgwqq9TocKpEN4UazpdiO0agA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Li Yang <leoyang.li@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>
Subject: [PATCH v7 10/10] MAINTAINERS: add the Freescale QMC audio entry
Date: Mon,  6 Mar 2023 17:17:54 +0100
Message-Id: <20230306161754.89146-11-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230306161754.89146-1-herve.codina@bootlin.com>
References: <20230306161754.89146-1-herve.codina@bootlin.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

After contributing the component, add myself as the maintainer for the
Freescale QMC audio ASoC component.

Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5597d402fbd8..a6e6b70cf8bd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8315,6 +8315,14 @@ F:	sound/soc/fsl/fsl*
 F:	sound/soc/fsl/imx*
 F:	sound/soc/fsl/mpc8610_hpcd.c
 
+FREESCALE SOC SOUND QMC DRIVER
+M:	Herve Codina <herve.codina@bootlin.com>
+L:	alsa-devel@alsa-project.org (moderated for non-subscribers)
+L:	linuxppc-dev@lists.ozlabs.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/sound/fsl,qmc-audio.yaml
+F:	sound/soc/fsl/fsl_qmc_audio.c
+
 FREESCALE USB PERIPHERAL DRIVERS
 M:	Li Yang <leoyang.li@nxp.com>
 L:	linux-usb@vger.kernel.org
-- 
2.39.2


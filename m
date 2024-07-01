Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A6A91E540
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2024 18:25:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MNfaOgTI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WCWbg5TPHz3dGt
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 02:25:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MNfaOgTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCWb013vwz3d8t
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 02:24:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25E19612BB;
	Mon,  1 Jul 2024 16:24:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30F67C116B1;
	Mon,  1 Jul 2024 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719851065;
	bh=oBVFJlu3MmnNdnNe9Q9BhkVgV1GOgRax+RD1hh59NIs=;
	h=From:Date:Subject:To:Cc:From;
	b=MNfaOgTI38XHbTvoSalMKLauxUd+9J/w1Q99eE96NJCsllyoTZgXBI6Sy4yc5ZAWz
	 9lhd7stnTg5qOwtBlWhzRf1bZEBM2Z1+KvGrt35Pga41dHChLFpsASxl2s7rcG5WEd
	 IjTwmuvK9w6t2J3u5OVbPThQV2tY13Pro0/kDpUpeRyNlgPqSg4MZKVN3fUJHcLynI
	 uM2rFprmO8AIyyoheuuoCfSd2mPaz4x/Fu1dYLf3ndPBr+SxBUowtowO8S2yRpptyQ
	 /RZPof4m2qkjmhkp5DlG79wllZAAWMyyC+6SIlZNoY6TuR0RRpLC07brLaOhD0aXAo
	 ZQkCdYNG01+ZQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 01 Jul 2024 09:24:16 -0700
Subject: [PATCH] ASoC: fsl: lpc3xxx-i2s: Avoid using ret uninitialized in
 lpc32xx_i2s_probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240701-lpc32xx-asoc-fix-uninitialized-ret-v1-1-985d86189739@kernel.org>
X-B4-Tracking: v=1; b=H4sIAC/YgmYC/x2NzQqDMBAGX0X23IVN/ANfpfQQkm39QKIkVoLiu
 zf0ODDMXJQ1QTNNzUVJD2SssYJ5NORnFz/KCJXJiu1kFMPL5ltbCru8en6j8DciYodbcGrgpDt
 3o0gYQt8P3lANbUmr+J88X/f9AyTAwd50AAAA
To: "J.M.B. Downing" <jonathan.downing@nautel.com>, 
 Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2122; i=nathan@kernel.org;
 h=from:subject:message-id; bh=oBVFJlu3MmnNdnNe9Q9BhkVgV1GOgRax+RD1hh59NIs=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDGlNNyxOBzy1UVET3irgUXTDdu7+cq5F79i0f9i/ydsUF
 LG55862jlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRp0cZGXr631qo3FnZemTN
 5k6jhZ1rBSbECur+dFZelzgnU3eH3T9GhjX3eNamS0ZNeMxY1K8eef8+q6tI9MMgwRiFpSrX8rh
 d2QE=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
Cc: alsa-devel@alsa-project.org, llvm@lists.linux.dev, Liam Girdwood <lgirdwood@gmail.com>, linux-sound@vger.kernel.org, Vladimir Zapolskiy <vz@mleia.com>, Nathan Chancellor <nathan@kernel.org>, patches@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

clang points out that ret may be used uninitialized in
lpc32xx_i2s_probe() in an error pointer path (which becomes fatal with
CONFIG_WERROR):

  sound/soc/fsl/lpc3xxx-i2s.c:326:47: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
    326 |                                      "failed to init register map: %d\n", ret);
        |                                                                           ^~~
  sound/soc/fsl/lpc3xxx-i2s.c:310:9: note: initialize the variable 'ret' to silence this warning
    310 |         int ret;
        |                ^
        |                 = 0
  1 error generated.

One solution would be a small refactoring of the second parameter in
dev_err_probe(), PTR_ERR(i2s_info_p->regs), to be the value of ret in
the if statement. However, a nicer solution for debugging purposes,
which is the point of this statement, would be to use the '%pe'
specifier to symbolically print the error pointer value. Do so, which
eliminates the uninitialized use of ret, clearing up the warning.

Fixes: 0959de657a10 ("ASoC: fsl: Add i2s and pcm drivers for LPC32xx CPUs")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 sound/soc/fsl/lpc3xxx-i2s.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/lpc3xxx-i2s.c b/sound/soc/fsl/lpc3xxx-i2s.c
index 0e5b4d5202ff..af995ca081a3 100644
--- a/sound/soc/fsl/lpc3xxx-i2s.c
+++ b/sound/soc/fsl/lpc3xxx-i2s.c
@@ -323,7 +323,7 @@ static int lpc32xx_i2s_probe(struct platform_device *pdev)
 	i2s_info_p->regs = devm_regmap_init_mmio(dev, iomem, &lpc32xx_i2s_regconfig);
 	if (IS_ERR(i2s_info_p->regs))
 		return dev_err_probe(dev, PTR_ERR(i2s_info_p->regs),
-				     "failed to init register map: %d\n", ret);
+				     "failed to init register map: %pe\n", i2s_info_p->regs);
 
 	i2s_info_p->clk = devm_clk_get(dev, NULL);
 	if (IS_ERR(i2s_info_p->clk))

---
base-commit: 878f4c36f9235e8a15fe0c2ecde066d92c50c8ff
change-id: 20240701-lpc32xx-asoc-fix-uninitialized-ret-4700d6d556c1

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


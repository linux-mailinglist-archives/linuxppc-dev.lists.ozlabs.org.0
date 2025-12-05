Return-Path: <linuxppc-dev+bounces-14662-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9C0DCA9618
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 22:22:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNPV11Dqqz2xKh;
	Sat, 06 Dec 2025 08:22:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764943363;
	cv=none; b=fkl24mQwEMzGLo+D0cAqr/nv5MW5HlbgMJ8ArNMUwuJrQVeD74jZH/yGbk2/Lox1JDKa1qodB6HX3iHaUd7dhZl35dVVPdaZbK/FRRpbLX9biB2lD6WOWpE6FRgdSaiUci6pd2k6DyrSu5eLk2cGPlXjIH5gHkDbga7f/x5dej2LIAygt+0M6NY6mAxrjxizWMKdVajBrcCVrPsuCuxyIQ2pCvn3nPuRJ79Q1Ni6awIyttD9zMR/zodAvWehZI2Dtix7q/bRKXbXEgESg2qKQAknc5BcKjgiQyrqnn2yGACjFxw+f1JGHEMEJBuvC5LnMpb74zj66QMg72+PRBgkTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764943363; c=relaxed/relaxed;
	bh=p2H2VHNSrBbxX195Ji6nHe5n+GM0W17tCpeJzOTt7Ig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=S/o6e8HPL8YQDrH/JGOE48CxOAhhboo92i2pKqf8xrbxwhj9mA7yf6GMnlTo8/zXDkswXwethIbJ1sAWvz01B3rrqmOHS6p+hmmZ/J3S+rS8ZJzzG+dLQAz0HI7P82gSOfKiKKvkKmcFbbC9VYM+wM8YtfC9Dlms0ostcevep5tbfmL7Y/nFsG//zVehpEKZ0/DcZPOvlTANi+ju9HX8UPo4UfJ3mfwBR6CfKFSaziHf8elqgRqBrMicHo1AfnZlt6X75HRkgyDJR7JlgS30gWfYb1x3PNuo5dcoXRMJQld87Ml+EOliuW+RlizzSbq+GYp+DapV3ER+yTf3aP8oOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XUnv2TaF; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XUnv2TaF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=linusw@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNCkW2GVsz2xc2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 01:02:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32425601EF;
	Fri,  5 Dec 2025 14:02:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B38C4CEF1;
	Fri,  5 Dec 2025 14:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764943360;
	bh=SKw64R/PJq7cCRC8RMbyoOVOZqDH8JcOsKxQ411mFQI=;
	h=From:Date:Subject:To:Cc:From;
	b=XUnv2TaFcfDkR2/znGkxkegOpXX7MfUc4E5Z+s+YdfbjGVxedvobI8Sg8XTL3uFkZ
	 WIHxgJ14UZCPCiTGC7mKkEeBcWEhyzgIBWBMSRfjVDQ92CZEhk0TD2oZ5dvNgxJPwn
	 IWIHI4uOG8Qbs5HgX9QhWTe5hcfYEp6Kg7x+ZvGABtnihv9AUjbwJogYedLh6X0dZE
	 QvEuO2oKybtTgz1zgX+6oTbl4ABo8ohhay/OEKG36mP3rkGlhFp5zvboXJFkLf0wnp
	 YYH7J5QJhblSGAqQdtrDooe4dIAjrjc0gzeNKlNBD9+0nI8UNo/ETlbf59nhanPLEY
	 7OMowbMdFf8Uw==
From: Linus Walleij <linusw@kernel.org>
Date: Fri, 05 Dec 2025 15:02:34 +0100
Subject: [PATCH] powerpc/g5: Enable all windfarms by default
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251205-powermac-g5-config-v1-1-8609aa97c1c0@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQqAIBBA0avIrBtIy6iuEi3EJptFKgoVSHdPW
 r7F/wUyJaYMsyiQ6OLMwVfIRoA9jHeEvFWDapWWqtUYw03pNBadRhv8zg6HSaqRpm7TYw81jIl
 2fv7psr7vBxTTdShkAAAA
X-Change-ID: 20251205-powermac-g5-config-69128e93d584
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Linus Walleij <linusw@kernel.org>
X-Mailer: b4 0.14.3
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The G5 defconfig is clearly intended for the G5 Powermac
series, and that should enable all the available
windfarm drivers, or the machine will overheat a short
while after booting and shut itself down, which is
annoying.

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
 arch/powerpc/configs/g5_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/configs/g5_defconfig b/arch/powerpc/configs/g5_defconfig
index 428f17b45513..2fe8ca266b5f 100644
--- a/arch/powerpc/configs/g5_defconfig
+++ b/arch/powerpc/configs/g5_defconfig
@@ -85,6 +85,8 @@ CONFIG_PMAC_SMU=y
 CONFIG_MAC_EMUMOUSEBTN=y
 CONFIG_WINDFARM=y
 CONFIG_WINDFARM_PM81=y
+CONFIG_WINDFARM_PM72=y
+CONFIG_WINDFARM_RM31=y
 CONFIG_WINDFARM_PM91=y
 CONFIG_WINDFARM_PM112=y
 CONFIG_WINDFARM_PM121=y

---
base-commit: 559e608c46553c107dbba19dae0854af7b219400
change-id: 20251205-powermac-g5-config-69128e93d584

Best regards,
-- 
Linus Walleij <linusw@kernel.org>



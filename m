Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BFAA893110
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Mar 2024 11:18:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TmZ0Zyl0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V6pTy0DSkz3vYB
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Mar 2024 20:18:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TmZ0Zyl0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V6pTC3t5Nz3bvW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Mar 2024 20:17:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FD8760A06;
	Sun, 31 Mar 2024 09:17:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E617C433F1;
	Sun, 31 Mar 2024 09:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711876667;
	bh=VzdFzXRE2VaRW7jFZgwq93tJA5xuLG9fPdxBzjiMqvM=;
	h=From:To:Cc:Subject:Date:From;
	b=TmZ0Zyl0dHghbpysYElex7UbdbqFMjqVZ9jfc4of38vp92x2Ggicmbza02ifRZyNe
	 1TQOiRfyYJy90FHAWMK6pQxIo4xQBQomixhiDa82oWD7APSNNNfuIVaDHX+yN9Ds2A
	 hqnywqXPFnnoubHSKvEAj+w5VFPm/MR7IPQ5fqL22XyHGWtPMLooJXOETsJq/sD6Ex
	 lTHuYjdGOvWTbWcERl+3lJPyTmBXVvrjy7EQDPW82+o2K8JCIXW3Y95nmH2txcoA5g
	 IfXDZg2EoKH9SLDB70edXR9gwvhGRWUFHaDKCR02wzl6XPPFkHZX9TH3ztnlKcB4Ig
	 ukevB8jk8ZHyw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ran Wang <ran.wang_1@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] usb: phy: fsl-usb: drop driver owner assignment
Date: Sun, 31 Mar 2024 11:17:35 +0200
Message-Id: <20240331091737.19836-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
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
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Core in platform_driver_register() already sets the .owner, so driver
does not need to.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes in v2:
1. None
---
 drivers/usb/phy/phy-fsl-usb.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/phy/phy-fsl-usb.c b/drivers/usb/phy/phy-fsl-usb.c
index 79617bb0a70e..1ebbf189a535 100644
--- a/drivers/usb/phy/phy-fsl-usb.c
+++ b/drivers/usb/phy/phy-fsl-usb.c
@@ -1005,7 +1005,6 @@ struct platform_driver fsl_otg_driver = {
 	.remove_new = fsl_otg_remove,
 	.driver = {
 		.name = driver_name,
-		.owner = THIS_MODULE,
 	},
 };
 
-- 
2.34.1


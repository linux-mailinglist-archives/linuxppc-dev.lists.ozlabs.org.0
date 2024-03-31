Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45275893111
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Mar 2024 11:19:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KQkVLCGO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V6pVl0Jbmz3vfc
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Mar 2024 20:19:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KQkVLCGO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=krzk@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V6pTJ6Hzbz3dSV
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Mar 2024 20:17:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 76F1CCE0AE1;
	Sun, 31 Mar 2024 09:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE181C433F1;
	Sun, 31 Mar 2024 09:17:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711876671;
	bh=ZvMc1elPVJhE6Ny4UYVuUqULOUmKNl8y6zwFM7uGIh0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KQkVLCGOR+WxOkbH46DMO6r6z5ar9wO2q1mTyCjAVRjUUH3IpKiL4Lc4RF3kMDTM3
	 horj/O3zCC8wl442itIeiUgeHhDXDJGaOwZ45aB/2DsPZTAhGcTOK4K88TtC9Dvk82
	 aint35VjVXD1MKD3mCSTrZGRQzaug7otAAHHjWDt6awFgQbyUttuZGFCfUF+7Kmtwf
	 TFjHYnnUfE4DcTR0oHMAvQHUH4ePtBwzBD7Q3ov6uKNcfkLTwCwPIM+i18Ku8CuTGV
	 S18hiZYYbYemuMJw+vWK1dYdtBR0v6VPCGlT9V3j4sIi6gqwpcxdXvmECdAt5JIYXs
	 8IYYAsz55DVwg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ran Wang <ran.wang_1@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	linux-usb@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] usb: typec: displayport: drop driver owner assignment
Date: Sun, 31 Mar 2024 11:17:37 +0200
Message-Id: <20240331091737.19836-3-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240331091737.19836-1-krzk@kernel.org>
References: <20240331091737.19836-1-krzk@kernel.org>
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

Core in typec_altmode_register_driver() already sets the .owner, so
driver does not need to.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

---

Changes in v2:
1. New patch
---
 drivers/usb/typec/altmodes/displayport.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index 038dc51f429d..596cd4806018 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -802,7 +802,6 @@ static struct typec_altmode_driver dp_altmode_driver = {
 	.remove = dp_altmode_remove,
 	.driver = {
 		.name = "typec_displayport",
-		.owner = THIS_MODULE,
 		.dev_groups = displayport_groups,
 	},
 };
-- 
2.34.1


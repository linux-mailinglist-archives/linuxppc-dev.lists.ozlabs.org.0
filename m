Return-Path: <linuxppc-dev+bounces-15342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C5391CFA5D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 19:56:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dm0l11JmCz2xQB;
	Wed, 07 Jan 2026 05:56:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767725805;
	cv=none; b=Ztz3T/ZNRvEW0adsmBQNhKRcRlhxhWED3ydc382xd8fhFNVu/xpIPaWYVmBJMx3AhMC/VyIlXAskDKbnarB7SZLxsupBT4Lleh9v00BHPh0uiHRlw0bquyxDcMFGVmmyt5E3X/5EeYJgsuwb1FqFfCRGh/XCcphYJewSqc6y8agD67zErc5uvqJBmEWRHARfG3RAzWahO/MKdZRP8uUKf1bisSD2M99wDoabRs6mazBh1bbyVUPFaKAi5/LHVsm0yRTlV5gPYXiquUck1UDuqkDE1loWSi0VyZ1X//nYx8i+kXZ/RLh2di2GmP1G9emypsFxpKFCZMt1t3faru19CA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767725805; c=relaxed/relaxed;
	bh=d6ZqofRoqmgTnNauKm6sFOfSm31A4/KwcDgHVfKLaRY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=opHw9WF34gKHFNkX18fe5uj71nAmxvzkeR+HrHVXwJtZ1uJWbcQE+KnkT0t0y8VPUznEc37g/C2YNHjwredhUXnkRkXxymCHsLX3eDA5apHKpjVOOi/6hw52WzCzxnMVUqMwG/KJorH0KQZhbyLSSjKoQTf59RZNszzptgE2RToj9bzTBP65+iO5JQBvgoszrJvldAjY8sz2TrjF1irOKDdJAQq6EJbwgMJGwjmnPJP1fyObn1FdGyk4AEjSZrka8fujshD6J744v7ESSLv+DTsfZ4lVVwdoqXm3OVnCu67OoQG/b0Jha0rcDDpDgbuAImaRHEdG+Fuarao3zmOGtA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O7UYc8/e; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O7UYc8/e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dm0l02nzCz2xLR
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 05:56:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BEBA400F6;
	Tue,  6 Jan 2026 18:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7797C116C6;
	Tue,  6 Jan 2026 18:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767725802;
	bh=LduUB26pqvfRWwO/AQnMn2xvKfD83Q491hi3Si0/eTE=;
	h=From:To:Cc:Subject:Date:From;
	b=O7UYc8/er3SZhgPFplrgYknT7fHXZYlsfSu+zbpw09l6h64m0lsumOAnus9UW3NLY
	 IxiV5KetvlvsVbEjQQWwDw6hDv++aBdmoKYCE4/zbhaEt+4jRjsmVQmsyXapLP8BKV
	 f6LTXtPMubMZoHY0CPtEGTEsbu+rwtF1Wzo3mYy4ujPoJj2i+SRpx9DJANxV7q8T5s
	 WVE4nOuo3HyGW+cq7jaUkvb3QcGCHus+Jxa771y3Ohl2NpBzJkn2AduqKN2xaOl8p4
	 dm4cYLnuh4VowqN76IeJq9YJjW4lguDxTRnbVpkEqXupAhTIt26uyfnzM/njRkljRl
	 k8yl9CawPYnig==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Ioana Ciornei <ioana.ciornei@nxp.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] bus: fsl-mc: add missing fsl_mc_bus_dpdbg_type declaration
Date: Tue,  6 Jan 2026 19:54:21 +0100
Message-ID: <fd30e197df618be4444f9d2172ba794e5f49ae87.1767725589.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1061; i=chleroy@kernel.org; h=from:subject:message-id; bh=LduUB26pqvfRWwO/AQnMn2xvKfD83Q491hi3Si0/eTE=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTGRsVV5IVdLIxf8G/+Vp0t85MnT7gt2GpVJfDPWMv8W pfnUp6jHaUsDGJcDLJiiizH/3PvmtH1JTV/6i59mDmsTCBDGLg4BWAiBc8Y/vtxfrWXz3zMOElf t2azSIuuhL3Bs289O1MZIuLyL+1X+sPwP5T3lvC62wkxxwRLrY1v594V71hgI/dTVWV/05zAh+o VzAA=
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Fix following sparse warning:

  CHECK   drivers/bus/fsl-mc/fsl-mc-bus.c
drivers/bus/fsl-mc/fsl-mc-bus.c:435:26: warning: symbol 'fsl_mc_bus_dpdbg_type' was not declared. Should it be static?

As it is exported it can't be static. So declare it in mc.h like
all other similar objects.

Fixes: e70ba1b06c26 ("bus: fsl-mc: add the dpdbg device type")
Signed-off-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 include/linux/fsl/mc.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/fsl/mc.h b/include/linux/fsl/mc.h
index 897d6211c1635..28441a456bb48 100644
--- a/include/linux/fsl/mc.h
+++ b/include/linux/fsl/mc.h
@@ -451,6 +451,7 @@ extern const struct device_type fsl_mc_bus_dpdcei_type;
 extern const struct device_type fsl_mc_bus_dpaiop_type;
 extern const struct device_type fsl_mc_bus_dpci_type;
 extern const struct device_type fsl_mc_bus_dpdmai_type;
+extern const struct device_type fsl_mc_bus_dpdbg_type;
 
 static inline bool is_fsl_mc_bus_dprc(const struct fsl_mc_device *mc_dev)
 {
-- 
2.49.0



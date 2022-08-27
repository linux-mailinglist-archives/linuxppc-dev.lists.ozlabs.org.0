Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC3115A37D8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 15:17:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MFHKk2VXLz3blF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Aug 2022 23:16:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hc5T7ZsI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hc5T7ZsI;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MFHK26DfCz2xjv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Aug 2022 23:16:22 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E4B1360B7C;
	Sat, 27 Aug 2022 13:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BCE9C433D6;
	Sat, 27 Aug 2022 13:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661606178;
	bh=IWBzYlrnmUPkksd7GMSRNCvwLJIO8ZnQzL1q9UgX1VE=;
	h=From:To:Cc:Subject:Date:From;
	b=hc5T7ZsIPdcAJDjFDCEPW5RuVYqtq/n+Nd1kLKqFGwgUBYQmVDw4RUTvWLQlVzDTd
	 i7DpOqm5aaF9to1yMvq50GHWGh+7UnQcO0qSW4pYQtucZOkjCmJEdSp8Vzs5BcmBnu
	 rCu0kIN4YXI9Jqwqva7wSq7mlNs3ElWlEJo3PTSE476kJjX8cF/yU3Lxxt4i4aI6Ry
	 hNvVm8xQpkNImbkRTiRnJ9YdahN69NQ0aSNkmI3+LzdAz5bTZ5V1qoRAdazR/zGWC2
	 yKD+qGX8t4hNLYi2GbnpHJyCdaQCH+JIS6/NNOLrUe8PpQs2UtZi6Grjwhio6T1xFq
	 5Cy7UVRsNJS+g==
Received: by pali.im (Postfix)
	id 52B33C7A; Sat, 27 Aug 2022 15:16:15 +0200 (CEST)
From: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH] powerpc: dts: turris1x.dts: Fix labels in DSA cpu port nodes
Date: Sat, 27 Aug 2022 15:15:38 +0200
Message-Id: <20220827131538.14577-1-pali@kernel.org>
X-Mailer: git-send-email 2.20.1
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DSA cpu port node has to be marked with "cpu" label.
So fix it for both cpu port nodes.

Fixes: 54c15ec3b738 ("powerpc: dts: Add DTS file for CZ.NIC Turris 1.x routers")
Signed-off-by: Pali Rohár <pali@kernel.org>
---
 arch/powerpc/boot/dts/turris1x.dts | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
index 8277e0d7fd91..64c0dd733e40 100644
--- a/arch/powerpc/boot/dts/turris1x.dts
+++ b/arch/powerpc/boot/dts/turris1x.dts
@@ -147,7 +147,7 @@
 
 					port@0 {
 						reg = <0>;
-						label = "cpu1";
+						label = "cpu";
 						ethernet = <&enet1>;
 						phy-mode = "rgmii-id";
 
@@ -184,7 +184,7 @@
 
 					port@6 {
 						reg = <6>;
-						label = "cpu0";
+						label = "cpu";
 						ethernet = <&enet0>;
 						phy-mode = "rgmii-id";
 
-- 
2.20.1


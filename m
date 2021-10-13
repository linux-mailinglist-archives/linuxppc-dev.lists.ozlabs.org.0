Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE13A42CDA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 00:15:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HV6L22v6xz3cPv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Oct 2021 09:15:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256 header.s=phobos-20191101 header.b=Y9XhhAlC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=denx.de
 (client-ip=85.214.62.61; helo=phobos.denx.de; envelope-from=agust@denx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=denx.de header.i=@denx.de header.a=rsa-sha256
 header.s=phobos-20191101 header.b=Y9XhhAlC; 
 dkim-atps=neutral
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HV6GY040nz2yPG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 09:12:36 +1100 (AEDT)
Received: from crub.agik.hopto.org (pd95f1d7c.dip0.t-ipconnect.de
 [217.95.29.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: agust@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id DDEC28360A;
 Thu, 14 Oct 2021 00:05:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1634162734;
 bh=lCCP2kpnABG9trPHuTzlDpEXA/5iYV/q/jG2UOBG/kY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y9XhhAlC2zq3AKBzSg/3aJbk3AgCRVgfGPkpFMS77YeRWVZbHp63A9Gu2/8KXdliX
 +CjzisKvVEAm+xBxc7jq/Sfm0l7C8Ezttu04HGdpPcHNRIBKkBxPu6k6U8UgizMCqs
 yVG1Lqn/YGKpIOsuZFG93XfCH6B3pNQGxELTuGnCOzpHB0LKJOpa3evT1XfigE12WH
 KMw/B4YMYhC21olNWtrxblxHlTEI/3RVM8NXXzTB9rk/SyTDOH/Kpau9pgEPjpCVvN
 R2ViTyjm87LLT4d+PZRPoRHU61c8wCULvjPlXASO7OamqH+t8tTsCfB/BEQHcO0TF+
 8s9ibS65PhEng==
From: Anatolij Gustschin <agust@denx.de>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/4] powerpc/5200: dts: add missing pci ranges
Date: Thu, 14 Oct 2021 00:05:29 +0200
Message-Id: <20211013220532.24759-2-agust@denx.de>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211013220532.24759-1-agust@denx.de>
References: <20211013220532.24759-1-agust@denx.de>
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: devicetree@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add ranges property to fix build warnings:
Warning (pci_bridge): /pci@f0000d00: missing ranges for PCI bridge (or not a bridge)

Signed-off-by: Anatolij Gustschin <agust@denx.de>
---
 arch/powerpc/boot/dts/mpc5200b.dtsi | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/mpc5200b.dtsi b/arch/powerpc/boot/dts/mpc5200b.dtsi
index 648fe31795f4..8c645d2bc455 100644
--- a/arch/powerpc/boot/dts/mpc5200b.dtsi
+++ b/arch/powerpc/boot/dts/mpc5200b.dtsi
@@ -276,7 +276,9 @@
 		clock-frequency = <0>; // From boot loader
 		interrupts = <2 8 0 2 9 0 2 10 0>;
 		bus-range = <0 0>;
-		// ranges = need to add
+		ranges = <0x42000000 0 0x80000000 0x80000000 0 0x10000000>,
+			 <0x02000000 0 0x90000000 0x90000000 0 0x10000000>,
+			 <0x01000000 0 0x00000000 0xa0000000 0 0x01000000>;
 	};
 
 	localbus: localbus {
-- 
2.17.1


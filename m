Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1283DCA96
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 09:38:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GctL76VMZz30Qk
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Aug 2021 17:38:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linkmauve.fr (client-ip=82.65.109.163; helo=luna.linkmauve.fr;
 envelope-from=linkmauve@linkmauve.fr; receiver=<UNKNOWN>)
Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net
 [82.65.109.163])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GctKl6nLlz2ykQ
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Aug 2021 17:38:34 +1000 (AEST)
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
 id E65D9F409D0; Sun,  1 Aug 2021 09:38:30 +0200 (CEST)
From: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
To: Rob Herring <robh+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 devicetree@vger.kernel.org
Subject: [PATCH v4 3/5] powerpc: wii.dts: Reduce the size of the control area
Date: Sun,  1 Aug 2021 09:38:20 +0200
Message-Id: <20210801073822.12452-4-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210801073822.12452-1-linkmauve@linkmauve.fr>
References: <20210701225743.14631-1-linkmauve@linkmauve.fr>
 <20210801073822.12452-1-linkmauve@linkmauve.fr>
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
Cc: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>, linux-kernel@vger.kernel.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Ash Logan <ash@heyquark.com>, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.ne@posteo.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is wrong, but needed in order to avoid overlapping ranges with the
OTP area added in the next commit.  A refactor of this part of the
device tree is needed: according to Wiibrew[1], this area starts at
0x0d800000 and spans 0x400 bytes (that is, 0x100 32-bit registers),
encompassing PIC and GPIO registers, amongst the ones already exposed in
this device tree, which should become children of the control@d800000
node.

[1] https://wiibrew.org/wiki/Hardware/Hollywood_Registers

Signed-off-by: Emmanuel Gil Peyrot <linkmauve@linkmauve.fr>
---
 arch/powerpc/boot/dts/wii.dts | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/boot/dts/wii.dts b/arch/powerpc/boot/dts/wii.dts
index aaa381da1906..c5fb54f8cc02 100644
--- a/arch/powerpc/boot/dts/wii.dts
+++ b/arch/powerpc/boot/dts/wii.dts
@@ -216,7 +216,13 @@ AVE: audio-video-encoder@70 {
 
 		control@d800100 {
 			compatible = "nintendo,hollywood-control";
-			reg = <0x0d800100 0x300>;
+			/*
+			 * Both the address and length are wrong, according to
+			 * Wiibrew this should be <0x0d800000 0x400>, but it
+			 * requires refactoring the PIC1 and GPIO nodes before
+			 * changing that.
+			 */
+			reg = <0x0d800100 0xa0>;
 		};
 
 		disk@d806000 {
-- 
2.32.0

